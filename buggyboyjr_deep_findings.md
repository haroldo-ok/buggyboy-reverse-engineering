# Buggy Boy Junior — Deep Reverse-Engineering Findings

Second-pass analysis that goes beyond the ROM map and raw disassembly to recover
**program structure and inter-processor protocols**. Every claim below is backed by a
specific address you can look up in the disassembly listings.

---

## 1. Main-CPU subroutine structure

A seeded recursive-descent walk from the reset vector recovered **69 directly-called
subroutines** across ~7,100 reachable instructions, with **152 call edges**. The call
graph (see `callgraph.png`) is dominated by a few hubs; the full table is in
`function_inventory.md`. Routines identified by behaviour:

| Address | Name | Evidence / role |
|---|---|---|
| `FFFC6` | `reset` | CLI, load SS/DS from `F000:0000`, `ljmp F000:001A` |
| `F001A` | `init_main` | watchdog kick, Z80 BUSREQ, latch clears, NVRAM `0x5AA5` check |
| `F2B6C` | `selftest_dispatch` | relocates a table to `0x4000`, dispatches via `jmp bp` |
| `F3060` | `draw_strlist` | **HUD/text renderer** — 13 callers (most-called drawing routine) |
| `F302D` | `strlist_setattr` | sets colour/position attribute for the string list |
| `F2FE6` | `plot_char` | plots one glyph into the character layer |
| `F02B6` | `emit_char` | appends a byte to the print buffer at `[0x1166]` |
| `F02C5` | `emit_char_masked` | as above, with an `SI`-bit test gate |
| `FE123` | `entity_update` | **most-called routine (18 callers)** — per-entity state update |
| `F2592` | `arm_scanline_irq` | the only writer of `SLINCS` (`0xD000`) — arms the raster IRQ |
| `FA19B` | `set_slincs_hi` | writes `0xD002` (second scanline latch) |

### `draw_strlist` (`F3060`) — the text engine
Reads a display list from `CS:[si]`: each entry is a 16-bit position/attribute word
(`di`), a colour byte, then a run of character codes. Codes `≤ 0x1F` are **control
codes** (dispatched via `plot_char`/`F2FE6`); codes `≥ 0x20` are printable glyphs. The
column is derived as `(di & 0x7F) + 0x80`. This single routine renders the self-test
menus, the "GAME SPECIFICATION" screen, score/among the HUD, and all attract-mode text.

### `entity_update` (`FE123`) — per-object state
Operates on a structure pointed to by `BX`: computes `dx = ~[bx+0x50] & [bx+0x52]`
(a rising-edge detector on a state/flag word), then commits `[bx+0x50] = new`,
`[bx+0x52] = 0`. With 18 callers it is the workhorse of the object/state system —
called once per managed entity per frame.

---

## 2. Interrupt architecture (main CPU)

- The 8086 receives a **raster/scanline interrupt** from the video hardware. It is
  configured by writing the `SLINCS` latches at `0xD000` (`arm_scanline_irq`, `F2592`)
  and `0xD002` (`set_slincs_hi`, `FA19B`) — the only two writers of that region.
- The interrupt vector table lives in low RAM and is populated at runtime, so the
  vblank handler is entered only via hardware interrupt (not reachable by static
  descent from reset). The ROM contains **many `iret`-terminated handlers**; the
  in-game engine bank (`0x2C000–0x2FFFF`) is especially dense with `sti`/`iret`,
  consistent with interrupt-synchronised gameplay code.
- Per frame the main CPU stages road/object state into shared RAM and pulses the
  math coprocessor (write to `0xF000`, `resume_math_w`) to run the projection.

---

## 3. Math coprocessor protocol (second 8086 + hardware math unit)

The math CPU boots (`0x4000`: `SP=0x300`, walking-bit test of shared RCRAM at `0x1000`)
and then services the road/object lists using a **memory-mapped hardware math unit** at
`0x3000–0x3FFF`. The register file has parallel "lanes" (stride `0x80`):

| Register | Direction | Purpose |
|---|---|---|
| `0x3000`, `0x308C` | write | operand inputs (lane 0 / lane 1) |
| `0x300C`, `0x310C` | write | **operation select / trigger** (written with codes e.g. `0x74`) |
| `0x300E`, `0x308E` | read | **result** (read after the op) |
| `0x3600`, `0x3680` | write / read | secondary operand/result bank (divisor / z, etc.) |
| `0x3F00`, `0x3F09` | read / write | status / control |

**Calling convention** (from `F48DD`):
```
mov [300C], 0x74      ; select operation
mov [3000], bx        ; operand
nop                   ; wait-state (let the hardware compute)
mov [308C], bx        ; second operand
...
add dx, [300E]        ; read + accumulate result
```
The `nop` padding is the classic "wait for coprocessor" idiom. This unit performs the
**perspective divide and geometry** (`screen = focal · world / z`) that scales the road
and roadside sprites by distance, feeding on the trig/1-over-z tables in `au_data`.
(Note: capstone renders the 8086 `ESC` opcodes `D8–DF` as x87 `fimul`/`fisttp`; on this
board there is no FPU — those escapes are the coprocessor-interface encodings.)

---

## 4. Sound engine (Z80) — full protocol

Reset (`0x0000`: `IM 1 ; JP 0x0067`). Init (`0x0067`) establishes the whole sound
subsystem; the actual hardware differs from first assumptions and is now pinned down:

### Chips and how they are addressed
- **Two AY-3-8910 PSGs on the Z80 I/O bus** (not memory-mapped):
  - AY #1: address latch `OUT (0x81)`, data `OUT (0x80)`
  - AY #2: address latch `OUT (0x41)`, data `OUT (0x40)`
  - Init programs mixer reg 7 and the **I/O ports (regs 14/15)** — these drive the
    discrete engine-gain and skid-enable lines described in the sound-board notes.
- **i8255 PPI** memory-mapped at `0x5000–0x5003` (control word `0x5003` programmed to
  `0xB6`; ports A/B/C zeroed) — the interface to the main CPU.
- **i8253 PIT** at `0x6000/0x6001`, read every interrupt as a timer/entropy source.
- **Command mailbox** in the `0xB000` window; results posted back at `0xB03E`.
- **Z80 RAM is `0x4000–0x47FF`** (init `LD SP,0x4800`; `LDIR` clears `0x4000+0x7FF`).

### Voice model
The init builds **six 0x40-byte voice control blocks** at `0x4140, 0x4180, 0x41C0,
0x4200, 0x4240, 0x4280` — exactly 2 AYs × 3 tone channels. Fields seen include a
period word (`0x260`), volume/mode bytes (`0x80`, `0x70`), and enable flags.

### Interrupt-driven mixer (`0x0875`)
`RST 38h → JP 0x0875`. Each tick it:
1. saves `AF/IX/HL/DE/BC`;
2. checks a kill sentinel — `if [0x4008]==0xFF: JP 0x0000` (silence/reset);
3. `CALL 0x0BD7` to consume the pending command from the main CPU;
4. samples the PIT (`[0x6000]/[0x6001]` → `[0x4403]/[0x4404]`);
5. `CALL 0x0948` / `CALL 0x0970` to advance the voices;
6. increments a frame counter `[0x4100]`, masks `& 3`, and indexes a 4-entry dispatch
   table at `0x08AC` — so the six voices are serviced round-robin across four ticks.

This is a compact, table-driven interrupt sound engine: the main CPU drops a command
byte in the mailbox, and the Z80's timer interrupt renders music/SFX on the two PSGs
while the discrete circuit adds the engine roar and tyre skids under AY I/O-port control.

---

## 5. Artefacts in this pass

- `buggyboyjr_deep_findings.md` — this document.
- `function_inventory.md` — all 69 main-CPU subroutines, caller counts, entry bytes.
- `callgraph.png` — main-CPU call graph (node size/colour = number of callers).
- `maincpu_8086_symbolized.asm` — the full main-CPU listing with **function banners,
  cross-reference headers, and `-> callee` annotations** at every call site.

### What remains genuinely out of reach statically
Runtime-computed dispatch (the RAM state-vector `jmp word ptr [xxxx]` sites and the
`selftest_dispatch` `jmp bp` table) and the exact IVT contents depend on values built
at run time; resolving them fully would need a traced/emulated run rather than static
analysis. Everything above is recovered from the ROM bytes alone.
