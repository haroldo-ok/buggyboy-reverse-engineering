# Buggy Boy Junior — Technical Reference

A consolidated static reverse engineering of **Buggy Boy Junior** (a.k.a. *Speed Buggy*),
Tatsumi 1986 — the single-monitor cut-down of *Buggy Boy* (1985). Derived entirely from
the 37-chip ROM set (MAME `buggyboyjr`), verified byte-by-byte and cross-referenced with
MAME's `tatsumi/tx1.cpp`, `tx1_a.cpp`, `tx1_v.cpp`. Every claim is tied to a ROM address,
register, or routine.

## Contents
1. Hardware overview
2. ROM inventory (verified)
3. System architecture & memory maps
4. Boot & self-test
5. Main-CPU program structure
6. Math coprocessor & the geometry engine
7. Graphics pipeline
   - 7.1 Palette
   - 7.2 Character / HUD layer & the text engine
   - 7.3 Sprites (object assembler)
   - 7.4 Road generator
   - 7.5 Sky & layer compositing
8. Sound subsystem
9. Data formats (OBJRAM / RCRAM / VRAM / NVRAM)
10. Runtime tracing
11. Verification & caveats
- Appendix A: main-CPU subroutine inventory
- Appendix B: non-player object catalog

---

## 1. Hardware overview

A **three-CPU** board, ambitious for 1985:

| Block | Device | Role |
|---|---|---|
| Main CPU | **Intel 8086** | Game logic, I/O, coin/credit, HUD orchestration |
| Math CPU | **Intel 8086** | Geometry coprocessor: road & sprite projection |
| Math unit | Custom (MMIO `0x3000`) | Hardware multiply/divide for the perspective divide |
| Sound CPU | **Zilog Z80** | Music & SFX sequencing |
| PSG ×2 | **AY-3-8910** | Two 3-voice programmable sound generators |
| Timer / PPI | **i8253 PIT**, **i8255 PPI** | Sound timing; main↔sound + analog controls |
| Engine SFX | Discrete (3× 4013B LFSR chains) | Analogue engine roar + tyre skid |

Both 8086s reset correctly (verified vectors): main `FFFF:0 = EA 06 00 FC FF → FFFC:0006`;
math `→ FFFD:0006` via its ROM mirror; the Z80 resets `IM 1 ; JP 0x0067`.
Analog **steering/accelerator/brake** are read through the sound board's i8255 PPI.

---

## 2. ROM inventory (verified)

All 37 dumps **CRC32-match** the MAME reference. Program ROMs are stored as even/odd byte
pairs (16-bit bus); de-interleaving `bug2s`+`bug5s` reveals the self-test strings
`HARDWARE ERROR`, `STATUS 22`.

| Region | Chips | Notes |
|---|---|---|
| Main CPU (8086) | `bug1a`/`bug4a` @ `0x20000`; `bug2s`/`bug5s` @ `0xF0000` | even/odd pairs; reset in `bug2s/5s` |
| Math CPU (8086) | `bug8s`/`bug7s` @ `0x4000` (mirror `+0xF8000`) | even/odd pair |
| Sound (Z80) | `bug35s` | 16 KB |
| Char tiles | `bug34s` (plane1), `bug33s` (plane0) | 8×8, 2bpp planar, 2048 tiles |
| Object tiles | `bug26s/19s`, `bug28s/21s`, `bug30s/23s` | 3 banks × 2 planes (`0x8000` apart) |
| Road | `bug11s` + PROMs `bb3s/bb4s/bb5s/bb6` | pattern selector + shape/dirt PROMs |
| 3D math data | `bug9`/`bug10` (16-bit LE) + `bb1/bb2` | 1/z + trig tables (`au_data`) |
| Object map/LUTs | `bug16s/17s` (map), `bug13/18s` (LUTs) | sprite tile addressing/colour |
| Colour PROMs | `bb10/11/12/13` (RGBI), `bb14` (char CLUT), `bb9×2` (obj CLUT), `bb8` (obj tile LUT), `bb7` (road LUT) | 256-colour palette + LUTs |

Nine board PALs are `NO_DUMP` (their logic isn't in the set).

---

## 3. System architecture & memory maps

### Main CPU (1 MB space)
| Range | Function |
|---|---|
| `0x00000–0x03FFF` | Work RAM / battery-backed **NVRAM** |
| `0x04000` | CRTC (HD46505/6845) |
| `0x08000` | **VRAM** — character/text tilemap |
| `0x0A000` | **RCRAM** — road-control RAM (shared with math CPU) |
| `0x0B000` | rd: DIP switches · wr: Z80 `BUSREQ` |
| `0x0C000` | `SCOL` scroll/colour latch |
| `0x0D000/2` | `SLINCS` scanline-IRQ control |
| `0x0E000` | `SKY` sky-colour latch |
| `0x0F000` | rd: watchdog · wr: resume-math |
| `0x10000–0x1FFFF` | **Z80 shared RAM** (sound mailbox) |
| `0x20000–0x2FFFF` | ROM bank (`bug1a/4a`) |
| `0xF0000–0xFFFFF` | ROM (`bug2s/5s`, reset) |

### Math CPU
ROM `0x4000–0x7FFF` (mirrored to top for reset). Shared: `0x1000` RCRAM (road),
`0x2000` OBJRAM (sprites), `0x0800` SPCS. Hardware **math unit** at `0x3000–0x3FFF`;
`GAS` road-control port at `0x2400`.

### Z80 sound
ROM `0x0000–0x3FFF`; RAM **`0x4000–0x47FF`** (SP=`0x4800`); `0x4000` INTREQ;
i8255 PPI `0x5000–0x5003`; i8253 PIT `0x6000/1`; PPI latch `0x7000`; shared mailbox
window `0xB000`. AYs on **I/O ports** `0x80/0x81` (AY1) and `0x40/0x41` (AY2).

---

## 4. Boot & self-test

Main-CPU reset disables interrupts, loads SS/DS from a vector table at `F000:0000`, kicks
the watchdog, asserts Z80 `BUSREQ`, clears the scanline-IRQ and sky latches, then checks
NVRAM: magic `0x5AA5` at `0x3E66` (and `0xAA55` at `0x3E5E` for test config); a dead
battery reinitialises a 5-entry bookkeeping table (default `0x5DC` = 1500).

The **power-on test is a handshake with the Z80** over shared-RAM byte `0x8048`:
main polls for `1`, writes `2`, waits `3`, writes `4`, waits `5`… each step spinning up to
`0x5DC` iterations while kicking the watchdog. Any timeout → `hardware_error` (`F028C`):
blank the character screen, draw `HARDWARE ERROR` / `STATUS nn` via the text engine, then
loop forever kicking the watchdog (the game is deliberately halted; `nn` identifies the
failed step). The math CPU runs its own walking-bit RAM test on shared RCRAM at reset.
Service mode relocates a 16-entry test table (`cs:0x2B6B` → RAM `0x4000`) and `jmp bp`s
into the chosen test, with grid/ramp generators for monitor alignment.

---

## 5. Main-CPU program structure

Seeded recursive descent recovered **69 directly-called subroutines** (152 call edges);
the full table is Appendix A, the graph is `callgraph.png`. Behaviour-identified routines:

| Addr | Name | Role |
|---|---|---|
| `FFFC6` | `reset` | CLI, load SS/DS, `ljmp F000:001A` |
| `F001A` | `init_main` | watchdog, Z80 BUSREQ, latch clears, NVRAM check |
| `F2B6C` | `selftest_dispatch` | relocate test table, `jmp bp` |
| `F3060` | `draw_strlist` | **HUD/text renderer** (13 callers) |
| `F2FE6` | `plot_char` | glyph / control-code handler |
| `F02B6` | `emit_char` | append to print buffer (`[0x1166]`) |
| `FE123` | `entity_update` | per-entity state update (18 callers, most-called) |
| `F2592` | `arm_scanline_irq` | the only `SLINCS` writer (raster IRQ arm) |

**Interrupts.** The 8086 runs on a hardware **raster/scanline interrupt** armed via the
`SLINCS` latches (`0xD000`/`0xD002`). The IVT is populated at runtime, so the vblank
handler is entered only via hardware interrupt; the in-game engine bank (`0x2C000–0x2FFFF`)
is dense with `sti`/`iret`. Per frame the main CPU stages road/object state into shared
RAM and pulses `0xF000` (resume-math) to run the projection.

**DIP switches.** The DIP port `[0xB000]` is read once (`F0E6F`): two bits select a
course/difficulty row in a parameter table at bank `0x24BCC`. Coin/control inputs arrive
through the sound-board PPI, not this port.

**`entity_update` (`FE123`)** operates on a struct at `BX`: `dx = ~[bx+0x50] & [bx+0x52]`
(rising-edge detect), commits `[bx+0x50]=new`, `[bx+0x52]=0` — the per-object workhorse.

---

## 6. Math coprocessor & the geometry engine

The pseudo-3D is a coprocessor-driven 2.5D projection, not polygons.

### The hardware math unit (`0x3000–0x3FFF`)
A memory-mapped, lane-based divider/multiplier. Calling convention (from `F48DD`):
```
mov [300C], 0x74   ; select operation
mov [3000], bx     ; operand
nop                ; wait-state (let the hardware settle)
mov [308C], bx     ; second operand
add dx, [300E]     ; read + accumulate result
```
Registers: operands `0x3000/0x308C`, op-select/trigger `0x300C/0x310C`, results
`0x300E/0x308E`, z/divisor bank `0x3600/0x3680`, status `0x3F00`. (Capstone renders the
8086 `ESC` opcodes `D8–DF` as x87 mnemonics; there is no FPU — those are the coprocessor
interface encodings.)

### The projection core (`sub_04896`, 13 callers, 23 math-unit accesses)
Reads a **primitive display list** via `DS:SI`. Each primitive's header top 3 bits are the
**type**, dispatched through an 8-entry jump table at ROM `0x7540`:

| Type | Handler | Role |
|---|---|---|
| 0 | `0x4A9E` | **object/sprite** — projects & writes a 3-word OBJRAM entry (math-unit sign-init `0x8000`) |
| 1–5 | `0x48B9` | default perspective projection (`bx = 0xF0 − horizon − offset`) |
| 6 | `0x4A08` | **road/horizon line** — projection with `cmp ax,0xF0` screen clamp |
| 7 | `0x4B29` | **emit predefined object** — `mov si,[si]; mov cx,5; rep movsw` copies a ready-made 5-word OBJRAM entry |

Each frame the math CPU walks the list, projects every primitive via the math unit, clamps
to screen, and writes OBJRAM/RCRAM records for the video hardware.

### `au_data` tables
`bug9`+`bug10` (16-bit LE): a linear gradient (`0x0000`), a **1/z perspective-reciprocal**
curve (`0x0400`), **cosine** tables (`0x0800`, `0x1800`), and **arctan/curvature** tables
(`0x0C00`, `0x1000`) — the trig + perspective-division lookups that bend the road and scale
roadside sprites by distance.

---

## 7. Graphics pipeline

### 7.1 Palette
256 colours. Each channel = 4 PROM bits + a shared intensity bit, weighted
`0x06·I + 0x0D·b0 + 0x1E·b1 + 0x41·b2 + 0x8A·b3` (R←`bb10`+`bb13`.b2, G←`bb11`+`bb13`.b1,
B←`bb12`+`bb13`.b0). Characters index it through `bb14`; objects through `bb9`.
Rendered in `palette.png`.

### 7.2 Character / HUD layer & the text engine
**VRAM tilemap** 64×32. Each word: `tile = (val&0x3ff)|((val&0x8000)>>5)` (11-bit),
`colour = (val&0xfc00)>>8` (6-bit); pixel is 2bpp from `bug34s/bug33s`. Final pen =
`((char&0xc0)>>2) + bb14[char]`. The scroll register is the last VRAM word
(`scroll_x = w&0x1ff`, `scroll_y = (w>>10)&0x3f`). **Scanlines 0–63 never y-scroll** — a
fixed HUD band (score/speed/time/lap) while the world below scrolls. Font decoded in
`char_tiles.png` (shapes) and `char_color.png` (through `bb14`).

**The text engine** (`draw_strlist`, `F3060`) is a display-list bytecode: each string is
`[position/attr word][length N][N char codes]`, read via `CS:SI`; codes >0x1F are tile
numbers written to VRAM (`stosw`, attribute in `AH`), codes ≤0x1F are control codes
dispatched via an 8-entry table at `cs:0x2FCE`:

`0x0D` newline · `0x0A` skip-N cells · `0x11` set colour · `0x1B` (ESC) newline+column ·
`0x1C/1D/1E/1F` cursor right/left/up/down.

Colour attributes translate through `cs:0x2FAA` (`80 84 88 8C … C0 C4 C8 CC`), offset by a
"current palette base" at `[0x11EC]` (used to flash/recolour text). A big-text variant maps
ASCII→tile (`A–Z: −0x37`, `0–9: −0x30`) and draws **double-height** glyphs (tile `idx*2+0xB0`
on top, `+1` below) — the large score/title font.

### 7.3 Sprites (object assembler)
Objects are **hardware-zoomed and assembled from 8×8, 2bpp tiles** through a LUT chain:
```
bug13[code] (tile-seq, 0xFF=bottom) -> bb8[code] (high addr) -> psa0_12
 -> bug17s/bug16s object map (per-column tile #, palette, BANK, x-flip; 0x40=last tile)
 -> pixel fetch: two bytes 0x8000 apart in the chosen 32 KB bank -> pix = (p1<<1)|p2
 -> bug18s + attr -> bb9 CLUT -> pen 0x40|colour   (objects use pens 0x40-0x7F)
```
X/Y-scale accumulators give zoom; `x_scale=0x80, y_step=0x100` = native 1:1.

**Two decode subtleties (verified):**
- **Tile bank select** — `rombank = (BIT(attr,4)<<1) | BIT(map,13)`. An object's art is in
  bank pair {0,1} or {2,3} per **attribute bit 4**; 59 objects live in {2,3}. Rendering with
  a fixed `attr=0` garbles those; `draw_object_auto()` picks the coherent bank.
- **Unused slots** — ~54 of the 256 codes have no object-map width terminator and render as
  runaway noise; `object_is_valid()` skips them.

**Object roster:** `0x00–0x3B` = **60 player-buggy frames** (rotation/lean/crash);
`0x3E–0x51` = a **second vehicle** (same fingerprint as the buggy — width ~92 vs ~95 px,
cyan cockpit in ~40 % of frames vs 15 % for scenery); **144 valid roadside objects**;
~54 unused. Corrected renders: `sprites_all.png`, `buggy_rotation.png`,
`nonplayer_corrected.png`, `nonplayer_categories.png`. Full engine in
`buggyboy_sprite_engine.py`; catalog in Appendix B. Corrected-set coherence averages 0.85
(vs 0.83 for the known-good font, 0.25 for noise).

### 7.4 Road generator
The road is drawn per-scanline by dedicated hardware, steered by accumulators the math CPU
updates each frame through the **`GAS` port** (`0x2400`):

| Sub-reg | Field |
|---|---|
| `0x00`/`0x20` | `ba_inc` (banking increment) + `bank_mode` |
| `0x40` | `ba_val += ba_inc` (24-bit banking accumulator) |
| `0x60` | `h_inc` (curve increment), reset `shift`/`h_val` |
| `0x80` | `h_val += h_inc` (horizontal/curve accumulator) |
| `0xA0` | `wa8` (wall base) |
| `0xE0` | `flags` (WAVE/TNLMD/TNLF/LINF/RVA7/WANGL) |

Per scanline `rva0_6 = (h_val>>7)&0x7f` is the distance/perspective mapping. **Graphics:**
`bug11s` is a pattern-selector map (`rom[(1<<13)|(rha<<4)|rva]`), the 512-byte PROMs
`bb3s/bb4s/bb5s` are the surface-pattern vocabulary (centre line, edges, shoulder,
checkered start/finish), `bb6` paces the perspective (`SLD`), `bb7` is the road colour LUT.
The dirt/rough plane comes from a second `bug11s` region. Camber leans the road from
`ba_val`. See `road_patterns.png`, `road_structure_map.png`, `road_texture.png`. (A full
composited frame needs the runtime `h_val`/`ba_val`/RCRAM values — the algorithm and
graphics are recovered; only the per-frame numbers come from a live run.)

### 7.5 Sky & layer compositing
**Sky** (`vregs.sky`) is a per-scanline gradient: `sky_val = (((sky&0x7f)+y)>>2)&0x3f`.
**Compositing** resolves four layers by priority per pixel: **char/HUD** (top, `bb14`) →
**objects** (pens `0x40|c`, bit 6 = opaque) → **road** (bit 6 = opaque) → **sky** (behind).

---

## 8. Sound subsystem

A table-driven Z80 mixer. **Two AY-3-8910** PSGs on the I/O bus (AY1 `OUT 0x81`=addr /
`OUT 0x80`=data; AY2 `0x41`/`0x40`); the flush uses `OUT (C),r` with the port in `C`.
The **i8255 PPI** (`0x5000`) carries status to the main CPU and the analog controls; the
**i8253 PIT** (`0x6000`) is the timer/entropy source.

**Voice model:** six **0x40-byte voice control blocks** at `0x4140`+`0x40·n` (2 AYs × 3
tone channels). `IX`-relative fields recovered: `+0x17/+0x18` tone period, `+0x1F` volume,
`+0x20/+0x21` AY register numbers for tone lo/hi, `+0x25` volume register, `+0x28` AY latch
port, `+0x32` volume shadow (change-detect).

**IRQ mixer** (`IM 1 → RST 38h → 0x0875`): save regs; if `[0x4008]==0xFF` reset (silence);
`cmd_handler` (`0x0BD7`) consumes the mailbox (flag `[0x441C]`, ack via PPI latch `0x7000`)
and sets voice-trigger bits; sample PIT (`[0x6000/1]`); advance voices round-robin over a
4-phase counter; flush AY shadows. `voice_update` reads the PIT samples and applies them as
a signed delta to the running period — the continuously-varying engine/skid pitch.
`RST 10h` is a compact `HL += A` table-index helper. Engine roar and tyre skid are produced
by a discrete circuit (three 4013B LFSR chains) whose gains are driven by the AYs' I/O-port
outputs (regs 14/15). Full commented listing: `soundcpu_z80_annotated.asm`.

---

## 9. Data formats

**OBJRAM display list** (`0x2000`, filled by math CPU, consumed by the sprite drawer).
Entries stride 8 words (5 used), scan `0…0x300/2` → **up to 48 objects/frame**:

| Word | Field |
|---|---|
| `+0` lo/hi | `code` (0–255) / screen `Y`; `0xFF` hi = end-of-list |
| `+1` | `y_scale` (initial accumulator) |
| `+2` lo/hi | `x_scale` (0 = skip) / attributes (palette, bank bit4, x-flip bit7) |
| `+3` | `y_step` (zoom) |
| `+4` | screen `X` |

**RCRAM road lists** (`0x1800–0x18FF` road-line horizontal positions ×128;
`0x19E0–0x19EF` vertical feature positions — start line, water, tunnels;
`0x19F0–0x19FF` wall/tunnel horizontal positions). Three TZ1113 accumulators vary the road:
camber (per pixel), vertical scale (per scanline), speed (per frame).

**VRAM** — §7.2. **NVRAM** — signature `0x5AA5` @ `0x3E66`, test config `0xAA55` @ `0x3E5E`,
5-entry bookkeeping table (default `0x5DC`).

---

## 10. Runtime tracing

Static analysis recovers the code and formats; a few things need a running machine — the
live RAM-vector/`jmp bp`/`jmp ax` dispatch targets, the per-frame road/RAM values needed to
composite a real frame, and the music as actually sequenced. The included toolkit captures
them from MAME:

- `bb_trace.lua` — autoboot script; write-taps + a per-frame hook log sound commands, AY
  register writes, `GAS` road/geometry, per-frame OBJRAM, and video registers. A commented
  `-debug` block resolves the indirect dispatches by breakpoint action.
- `bb_postprocess.py` — turns the logs into a music transcription (AY period → note),
  an object-code histogram, and a road-geometry summary.

A captured OBJRAM frame fed to `draw_object_auto()` reproduces exact on-screen sprites
(colour, bank, zoom). See `RUNTIME_TRACING_README.md`.

---

## 11. Verification & caveats

- **ROM integrity:** 37/37 CRC32 match the MAME reference.
- **Graphics decodes** validated by adjacent-pixel coherence (~0.83–0.85, matching the
  known-good font; noise ~0.25).
- **Indirect control flow:** the main CPU uses `jmp bp` jump tables and RAM state-vectors;
  static descent can't follow those, so some real code is decoded but not proven reachable,
  and the exact IVT contents come from a live run.
- **Sprite/road colour** uses a neutral attribute where the true per-object attribute is a
  runtime value; the palette and shapes are exact, accent colours may differ from a live
  frame.
- **PALs** are undumped. **No ROMs are redistributed** — supply your own set to MAME.
- Provenance: hardware/register names cross-referenced with MAME `tatsumi/tx1*.cpp`; all
  disassembly, decoding, reconstruction, and tooling produced by direct ROM analysis here.

---

## Appendix A: Main-CPU subroutine inventory

| # | addr | name | callers | first bytes |
|--:|:--|:--|--:|:--|
| 1 | `FE123` | entity_update | 18 | `cmp bx, 0x500` |
| 2 | `F3060` | draw_strlist | 13 | `mov di, word ptr cs:[si]` |
| 3 | `F3066` | draw_strlist_cont | 12 | `call 0xf302d` |
| 4 | `F02B6` | emit_char | 11 | `push bx` |
| 5 | `F25CC` | util_25CC | 8 | `mov ax, word ptr [0x11f0]` |
| 6 | `F02C5` | emit_char_masked | 7 | `push bx` |
| 7 | `F2CD2` | util_2CD2 | 7 | `mov ax, word ptr [0x1160]` |
| 8 | `F302D` | strlist_setattr | 6 | `test ah, 0x80` |
| 9 | `F4816` | util_4816 | 6 | `mov al, dl` |
| 10 | `F2B84` | sub_F2B84 | 5 | `mov ax, 0x9c40` |
| 11 | `F2BB1` | sub_F2BB1 | 5 | `mov ax, 0x4650` |
| 12 | `F4727` | sub_F4727 | 5 | `mov al, 0x34` |
| 13 | `F3196` | util_3196 | 4 | `push ax` |
| 14 | `F444A` | util_444A | 4 | `mov bl, byte ptr [0x115c]` |
| 15 | `F9B0B` | util_9B0B | 4 | `mov ax, word ptr [bx + 8]` |
| 16 | `F9B24` | util_9B24 | 4 | `mov dx, 0x100` |
| 17 | `F2B2D` | sub_F2B2D | 3 | `mov dx, bx` |
| 18 | `F3186` | util_3186 | 3 | `xor dh, dh` |
| 19 | `F97B8` | sub_F97B8 | 3 | `mov dx, word ptr cs:[si - 0x53c2]` |
| 20 | `F997A` | sub_F997A | 3 | `mov ax, word ptr [bx + 0x1e]` |
| 21 | `F9F0B` | sub_F9F0B | 3 | `mov bp, word ptr cs:[si]` |
| 22 | `F2FE6` | plot_char | 2 | `mov ch, 8` |
| 23 | `F3184` | sub_F3184 | 2 | `mov dl, byte ptr [si]` |
| 24 | `F318B` | sub_F318B | 2 | `mov dx, word ptr [si]` |
| 25 | `F36F6` | sub_F36F6 | 2 | `std ` |
| 26 | `F4036` | sub_F4036 | 2 | `mov di, 0x8000` |
| 27 | `F429A` | sub_F429A | 2 | `mov word ptr [0xf000], ax` |
| 28 | `F42AD` | sub_F42AD | 2 | `mov al, 0xff` |
| 29 | `F9102` | sub_F9102 | 2 | `push ax` |
| 30 | `F9B88` | sub_F9B88 | 2 | `call 0xf9b0b` |
| 31 | `FDFD4` | sub_FDFD4 | 2 | `test word ptr [bx + 0x3c], 0x10` |
| 32 | `FE0E0` | sub_FE0E0 | 2 | `or word ptr [bx + 0x52], 0x2000` |
| 33 | `002B6` | sub_002B6 | 1 | `add byte ptr [bx + si], al` |
| 34 | `00604` | sub_00604 | 1 | `add byte ptr [bx + si], al` |
| 35 | `25E6A` | sub_25E6A | 1 | `mov byte ptr [bp + 0x40], bl` |
| 36 | `2C59A` | sub_2C59A | 1 | `cdq ` |
| 37 | `F271A` | sub_F271A | 1 | `mov si, 4` |
| 38 | `F2B1A` | sub_F2B1A | 1 | `mov cx, 3` |
| 39 | `F3100` | sub_F3100 | 1 | `mov di, word ptr cs:[si]` |
| 40 | `F3106` | sub_F3106 | 1 | `call 0xf302d` |
| 41 | `F318D` | sub_F318D | 1 | `mov si, 0x11b6` |
| 42 | `F3C5E` | sub_F3C5E | 1 | `mov byte ptr [bx + 4], 0xff` |
| 43 | `F3D64` | sub_F3D64 | 1 | `mov bx, word ptr [0x1160]` |
| 44 | `F3FE8` | sub_F3FE8 | 1 | `xor ax, ax` |
| 45 | `F4054` | sub_F4054 | 1 | `cwde ` |
| 46 | `F418E` | sub_F418E | 1 | `mov ch, 8` |
| 47 | `F41D2` | sub_F41D2 | 1 | `test ah, 0x80` |
| 48 | `F4205` | sub_F4205 | 1 | `mov di, word ptr [si]` |
| 49 | `F432E` | sub_F432E | 1 | `mov si, word ptr [0x52a]` |
| 50 | `F43BC` | sub_F43BC | 1 | `mov word ptr [0x11cc], bx` |
| 51 | `F445A` | sub_F445A | 1 | `push cx` |
| 52 | `F455D` | sub_F455D | 1 | `call 0xf444a` |
| 53 | `F469E` | sub_F469E | 1 | `mov al, byte ptr [0xaa8]` |
| 54 | `F48E7` | sub_F48E7 | 1 | `mov di, 0x8880` |
| 55 | `F4AAC` | sub_F4AAC | 1 | `mov dx, word ptr [si]` |
| 56 | `F94BD` | sub_F94BD | 1 | `mov cx, dx` |
| 57 | `F9534` | sub_F9534 | 1 | `test word ptr cs:[0xac3a], 2` |
| 58 | `F9563` | sub_F9563 | 1 | `test word ptr cs:[0xac3a], 2` |
| 59 | `F96E8` | sub_F96E8 | 1 | `mov ax, word ptr [bx]` |
| 60 | `F975B` | sub_F975B | 1 | `mov ax, word ptr [bx + 0x24]` |
| 61 | `F9838` | sub_F9838 | 1 | `cmp si, 0x7d` |
| 62 | `F9892` | sub_F9892 | 1 | `mov ax, word ptr [bx]` |
| 63 | `F98F0` | sub_F98F0 | 1 | `push ax` |
| 64 | `F9907` | sub_F9907 | 1 | `mov ax, word ptr [bx + 0x28]` |
| 65 | `F99F2` | sub_F99F2 | 1 | `and dx, dx` |
| 66 | `F9AF2` | sub_F9AF2 | 1 | `mov ax, word ptr [bx]` |
| 67 | `F9D95` | sub_F9D95 | 1 | `mov dx, word ptr cs:[si + 8]` |
| 68 | `FAB50` | sub_FAB50 | 1 | `test word ptr cs:[0xac3c], 0x20` |
| 69 | `FABE2` | sub_FABE2 | 1 | `mov ax, word ptr cs:[si]` |
*(69 subroutines recovered by seeded recursive descent; names inferred from behaviour, `sub_XXXXX` = unnamed. Call graph: `callgraph.png`.)*

---

## Appendix B: Non-player object catalog

Supersedes the first catalog. Two problems in the original were fixed:

1. **Tile-bank bug.** Each object's art is in tile-ROM bank pair {0,1} *or* {2,3}, selected by **bit 4 of the attribute byte** (`rombank = (BIT(attr,4)<<1) | BIT(map,13)`). Rendering everything with `attr=0` forced banks 0/1, so bank-2/3 objects were garbled. Now the bank is auto-selected per object (via `draw_object_auto` in the engine).
2. **Unused slots.** ~52 of the 256 codes are unused; their object-map data has no width terminator and rendered as runaway noise. These are now excluded.

**Result: 144 valid non-player objects** (plus the 60 player-buggy frames `0x00–0x3B`).

### New finding — a second vehicle
Codes **`0x3E–0x51`** share the player buggy's fingerprint: near-identical width (~92 px vs ~95) and a cyan cockpit/windshield in ~40 % of frames (vs 50 % for the player and only 15 % for scenery). These are **vehicle sprites** — a second buggy (rival, or the player in special states such as jumping / water-splash), not scenery.

### Categories
#### Second vehicle / buggy states  (20)
3E 3F 40 41 42 43 44 45 46 47 48 49 4A 4B 4C 4D 4E 4F 50 51

#### Big structures  (10)
7B A8 A9 AC AD B0 B1 B4 B5 CE

#### Walls / rails / barriers  (23)
57 58 59 77 78 7C 7D 7E 7F 80 87 A6 AF BE C6 C7 C8 C9 CA CB CC CD E0

#### Tall trees  (6)
90 91 AA AE C4 C5

#### Bushes / hedges  (5)
89 96 97 BC BD

#### Poles / lamps  (2)
5A 5B

#### Flags / blue markers  (13)
76 82 8A 8B 8D 8F 98 99 AB CF E1 F2 F4

#### Timber / signboards  (2)
83 D3

#### Small rocks / signs  (17)
52 53 54 55 61 62 69 6A 6B 6C 6D 6E 6F 70 71 88 8C

#### Misc scenery / obstacles  (46)
56 5C 5D 5E 5F 60 65 66 67 68 72 73 74 75 81 84 85 86 8E 92 93 94 95 9A 9B A0 A1 A4 A5 A7 B2 B3 B8 B9 BA BB C0 C1 C2 C3 D0 D1 D2 F0 F1 F3

### Objects that live in tile-bank 2/3  (need attribute bit 4 = 1)
(59 codes) — these were the ones garbled by the original `attr=0` render:
40 41 42 43 44 45 46 47 48 49 4A 4B 4C 4D 4E 4F 50 51 5A 5B 76 82 87 89 8A 8B 8C 8D 8F 91 96 97 A8 A9 AB AC AD AE B0 B1 B4 B5 B9 BA BB BC BD C4 C5 CA CB CC CD CF E0 E1 F1 F2 F4

### Unused / invalid object slots  (not real sprites)
3C 3D 63 64 79 7A 9C 9D 9E 9F A2 A3 B6 B7 BF D4 D5 D6 D7 D8 D9 DA DB DC DD DE DF E0 E1 E2 E3 E4 E5 E6 E7 E8 E9 EA EB EC ED EE EF F5 F6 F7 F8 F9 FA FB FC FD FE FF

### Confidence
- **Shapes/colours are exact** (real LUT/PROM pipeline, correct bank).
- **The vehicle grouping (`0x3E–0x51`) is objectively supported** by the buggy-signature test.
- **Scenery sub-labels are heuristic** (size/aspect/colour); the precise in-game role of each code is best confirmed by the runtime OBJRAM trace, which shows which codes spawn on which track sections. Feed a captured frame's codes to `draw_object_auto` for exact colour.

### Artefacts
- `nonplayer_corrected.png` — all 144 valid non-player objects, correct bank each.
- `nonplayer_categories.png` — one representative per category (corrected).
- `buggyboy_sprite_engine.py` — now includes `draw_object_auto()` and `object_is_valid()`.