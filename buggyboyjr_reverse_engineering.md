# Reverse Engineering Report — *Buggy Boy Junior / Speed Buggy* (upright)

**Manufacturer:** Tatsumi · **Year:** 1986 (single-screen cut-down of 1985 *Buggy Boy*)
**Genre:** Pseudo-3D off-road racing · **MAME driver family:** `tatsumi/tx1.cpp`
**ROM set analysed:** `buggyboyjr.zip` — 37 files, 541,440 bytes, **all 37 CRC32s verified byte-exact** against the MAME reference.

This report is the result of static analysis of the ROM images: entropy classification, reset-vector recovery, 8086/Z80 disassembly, and direct decoding of the graphics and data ROMs. Findings were cross-checked against the documented hardware.

---

## 1. Hardware architecture

Buggy Boy is a **multiprocessor** board — unusually ambitious for 1985. Three CPUs cooperate over shared RAM, backed by a **custom hardware "math unit"** that does the 3D projection arithmetic, plus a dedicated sound board.

| Block | Device | Role |
|---|---|---|
| Main CPU | **Intel 8086** | Game logic, I/O, coin/credit, HUD, orchestration |
| Math CPU | **Intel 8086** | Geometry coprocessor: road & sprite projection/scaling |
| Math unit | Custom (memory-mapped `0x3000`) | Hardware multiply/divide/geometry for the math CPU |
| Sound CPU | **Zilog Z80** | Music & SFX sequencing |
| PSG ×2 | **AY-3-8910** | Two 3-voice programmable sound generators |
| Timer / PPI | **i8253 PIT**, **i8255 PPI** | Tone timing, main↔sound handshaking |
| Engine SFX | Discrete (3× 4013B LFSR chains) | Analogue engine roar + tyre skid noise |

Both 8086s reset correctly — the recovered reset vectors were the first proof of CPU type:

```
Main CPU  reset FFFF:0 = EA 06 00 FC FF  ->  far JMP FFFC:0006  (0xFFFC6)
Math CPU  reset FFFF:0 = EA 06 00 FD FF  ->  far JMP FFFD:0006  (0xFFFD6, via ROM mirror)
Z80  reset 0000        = ED 56 / C3 67 00 ->  IM 1 ; JP 0x0067
```

---

## 2. Chip-by-chip ROM map (all verified)

### Main CPU — Intel 8086 (1 MB address space)
Program is split into **even/odd byte ROMs** (the hallmark of a 16-bit bus). De-interleaving `bug2s`+`bug5s` reveals the self-test strings `HARDWARE ERROR`, `STATUS 22`.

| File | Bytes | Maps to | Byte |
|---|---|---|---|
| `bug1a.214` / `bug4a.175` | 2×32 K | `0x20000–0x2FFFF` (bank) | even / odd |
| `bug2s.213` / `bug5s.174` | 2×32 K | `0xF0000–0xFFFFF` (reset) | even / odd |

### Math CPU — Intel 8086
| File | Bytes | Maps to | Byte |
|---|---|---|---|
| `bug8s.26` / `bug7s.25` | 2×8 K | `0x4000–0x7FFF`, **mirrored `+0xF8000`** | even / odd |

### Sound CPU — Z80
| File | Bytes | Maps to |
|---|---|---|
| `bug35s.21` | 16 K | Z80 `0x0000` |

### Graphics — character tiles (8×8, 2bpp planar)
| File | Bytes | Role |
|---|---|---|
| `bug34s.46` | 16 K | Char plane 1 |
| `bug33s.47` | 16 K | Char plane 0 |

### Graphics — object / sprite tiles (2bpp, 3 banks × 2 planes)
`bug26s+bug19s` (bank 0), `bug28s+bug21s` (bank 1), `bug30s+bug23s` (bank 2) — 6×32 K = 192 KB of scaled-sprite pixel data.

### Graphics — road
`bug11s.225` (16 K road pixel data) + 4 PROMs `bb3s/bb4s/bb5s/bb6` (road slice/edge/stripe shaping).

### 3D math data (`au_data`, 16-bit LE)
`bug9.138`+`bug10.95` (interleaved 32 K of trig/perspective tables) + PROMs `bb1/bb2`.

### Object addressing LUTs
`bug16s.139`+`bug17s.140` (object map, 64 K), `bug13.32`+`bug18s.141` (object LUTs).

### Colour PROMs (`proms` region)
`bb10`=R, `bb11`=G, `bb12`=B, `bb13`=intensity, `bb14`=char CLUT, `bb9.190`/`bb9.162`=object CLUT (odd/even pixel), `bb8`=object-tile LUT, `bb7`=road LUT.

*(Nine board PALs — `pal10l8`, `pal16r4a`, etc. — are listed as `NO_DUMP`; their logic is not present in the set.)*

---

## 3. Main-CPU memory map (single-screen "jr" variant)

| Range | Function |
|---|---|
| `0x00000–0x03FFF` | Work RAM / **NVRAM** (battery-backed) |
| `0x04000–0x04FFF` | **CRTC** (HD46505 / 6845-style) registers |
| `0x08000–0x08FFF` | **VRAM** — character/text tilemap |
| `0x0A000–0x0AFFF` | **RCRAM** — road-control RAM (shared with math CPU) |
| `0x0B000` | Read: DIP switches · Write: Z80 `BUSREQ` |
| `0x0C000` | `SCOLST` scroll/colour latch |
| `0x0D000` | `SLINCS` scanline / IRQ control |
| `0x0E000` | `SKY` sky-colour latch |
| `0x0F000` | Read: **watchdog** reset · Write: **resume math CPU** |
| `0x10000–0x1FFFF` | **Z80 shared RAM** (the sound-command mailbox) |
| `0x20000–0x2FFFF` | ROM bank (`bug1a`/`bug4a`) |
| `0xF0000–0xFFFFF` | ROM (`bug2s`/`bug5s`, contains reset) |

## 4. Boot & self-test flow (recovered from disassembly)

```
RESET (FFFC6):
    cli
    mov ss, cs:[0] ; mov sp, 0x200 ; mov ds, cs:[2]   ; stack vectors from F000:0000
    ljmp F000:001A

INIT (F001A):
    xor ax,ax ; mov ds,ax ; mov es,ax
    mov ax,[F002]           ; kick watchdog
    mov [B000], 1           ; assert Z80 BUSREQ  (hold sound CPU)
    mov [D000], 0           ; clear scanline/IRQ latch
    mov [E000], 0           ; clear sky-colour latch

    ; --- NVRAM validity check ---
    cmp word [3E66], 0x5AA5 ; magic signature present?
    je   configured
    mov  word [3E66], 0x5AA5    ; (re)initialise on dead battery
    mov  word [3E60], 0         ;   zero counters
    mov  word [3E64], 0x5DC     ;   default value 1500
    ...loop initialising 5 table entries...

configured:
    jmp  self_test_dispatcher (F2B6C)   ; ROM/RAM checksum + status codes
```

The self-test loop repeatedly reads the watchdog (`[F002]`) while stepping through numbered phases (`AL = 1,2,3,…`), which correspond to the `STATUS nn` strings found in ROM. The math CPU runs its **own** power-on test in parallel: a walking-value RAM test on the shared road RAM (`write 0xA55A / 0x5AA5 to [0x1000]`, read back, verify), branching to an error handler on mismatch.

## 5. The pseudo-3D pipeline

The "3D" is a coprocessor-driven 2.5D projection, not polygons:

1. The **main CPU** places game state (car position, road segment, object list) into the shared RCRAM/OBJRAM.
2. It pulses `0xF000` (`resume_math_w`) to wake the **math CPU**.
3. The math CPU walks the road/object lists, and for each element issues operations to the **hardware math unit** at `0x3000` (multiply/divide for the perspective divide `screen = k · world / z`).
4. It reads the **`au_data` tables** — a linear gradient (`0x0000`), a **1/z perspective-reciprocal curve** (`0x0400`, rising asymptotically from `0x8000`→`0xFFFF`), **cosine** tables (`0x0800`, `0x1800`, starting at `0x7FFF` and falling), and **arctan/curvature** tables (`0x0C00`, `0x1000`) — to bend the road and scale roadside sprites by distance.
5. Results feed the **object drawer** (scaled sprites) and the **road generator** (PROM-shaped slices), composited with the character layer per the CRTC/scroll latches.

## 6. Object (sprite) rendering

Sprites are **hardware-zoomed**. For each object, an x/y-scale accumulator marches through the pixel data while chained PROM lookups compute the source address:

```
object code -> bug13/bb8 (base + y-scale row)
            -> bug16s/bug17s (object map, per-column)
            -> bug18s (colour attribute)
            -> obj_tiles bank/plane pair (2bpp pixel) -> bb9 object CLUT -> palette
```

Pixel value = `(plane1_bit << 1) | plane2_bit`, the two planes living `0x8000` apart inside a 64 KB bank. Colour `0x00` (in the low bit of the attribute) is transparent. This is why a raw linear dump of the object ROMs already shows recognisable buggies, trees, animals and signs at several pre-baked scales.

## 7. Colour system

256 hardware colours. Each channel is 4 PROM bits plus a **shared intensity bit**, weighted:

```
channel = 0x06·intensity + 0x0D·b0 + 0x1E·b1 + 0x41·b2 + 0x8A·b3   (max 0xFA)
R bits <- bb10 + bb13.bit2   G <- bb11 + bb13.bit1   B <- bb12 + bb13.bit0
```

The character layer indexes this palette through `bb14`; objects through `bb9`.

## 8. Sound subsystem

Z80 map: ROM `0x0000`, work RAM `0x3000` (mirror `0x800`), IRQ-req `0x4000`, **i8255 PPI** `0x5000`, **i8253 PIT** `0x6000`, PPI latch `0x7000`, shared mailbox `0xB000`. The main CPU writes sound commands into the shared window (`0x10000` on the 8086 side ↔ `0xB000` on the Z80 side) and the two **AY-3-8910** PSGs render music and effects. Engine and skid sounds are **not** on the PSGs — they come from a discrete circuit of three 4013B flip-flop LFSR chains whose gains are set by the AY port A/B outputs (16 resistor-weighted engine levels, plus enable lines for skid 0/1 and speaker routing).

---

## 9. Verified asset decodes

The following were decoded straight from the ROMs during this analysis (see accompanying images):

- **`palette.png`** — the full 256-colour hardware palette rebuilt from the RGBI PROMs.
- **`char_tiles.png`** — all 2,048 8×8 characters (font, digits, HUD, logo & scenery fragments), proving the 2bpp planar format.
- **`obj_tiles_raw.png`** — raw linear 2bpp view of the three object banks, revealing buggy sprites, roadside trees/obstacles, animals and signs.

## 10. Summary

`buggyboyjr` is a complete, verified dump of a **three-CPU (8086 + 8086 + Z80) Tatsumi board** with a **custom hardware math unit** driving a table-based pseudo-3D projection, **hardware-zoomed 2bpp sprites**, a 2bpp character layer, an RGBI+intensity 256-colour palette, and a Z80/dual-AY-3-8910 sound board augmented by discrete LFSR engine synthesis. Every ROM's role has been identified and, where it is code, its entry point and boot behaviour recovered; where it is graphics or data, its format has been decoded and confirmed visually.
