# Buggy Boy Junior — Full Disassembly Listings

Static disassembly of every code ROM in the `buggyboyjr` set (all 37 chips CRC-verified
against MAME). Three processors, three listings:

| File | CPU | Source ROMs | Lines | Reachable insns |
|---|---|---|---|---|
| `maincpu_8086.asm` | Intel 8086 (game logic) | `bug1a`/`bug4a` (bank @0x20000), `bug2s`/`bug5s` (@0xF0000) | ~59,000 | ~24,055 |
| `mathcpu_8086.asm` | Intel 8086 (geometry coprocessor) | `bug8s`/`bug7s` (@0x4000, mirrored to top) | ~7,000 | ~5,458 |
| `soundcpu_z80.asm` | Zilog Z80 (sound) | `bug35s.21` | ~13,150 | ~11,131 |

## How the listings were produced

Program ROMs are stored as **even/odd byte pairs** on the 16-bit 8086 bus; they were
de-interleaved and mapped to their true physical addresses before disassembly
(`bug2s`+`bug5s` → `0xF0000–0xFFFFF` containing the reset vector; `bug1a`+`bug4a`
→ the `0x20000` bank; math ROM mirrored so its reset at `0xFFFF0` resolves).

Disassembly is **complete linear coverage** (every byte is decoded) with a
**recursive-descent overlay** for quality:

- A leading **`*`** marks instructions **proven reachable** by following jumps/calls/
  branches from the reset and entry points, seeded with every call/jump target found
  in a full linear sweep. Unmarked lines are still decoded but not proven reachable —
  they are either data tables or code reached only through runtime-computed jumps.
- The main CPU uses heavy **indirect dispatch** (`jmp bp` jump tables, far pointer
  tables), so a portion of real code cannot be statically proven reachable and stays
  unmarked. This is inherent to static analysis, not a gap in the decode.
- **ASCII string tables** (test-mode menus, HUD text, the font's character map) are
  detected and rendered as `db '…'` instead of being mis-decoded as instructions.

## Column format

8086 listings:
```
[*]   LABEL:   PHYS   SEG:OFF   bytes            mnemonic  operands   ; annotation
*   L_F001A:  F001A  F000:001A  b002             mov       al, 2      ; MATH UNIT ...
```
Z80 listing:
```
[*]  LABEL:  ADDR  bytes       mnemonic
*    L_0067: 0067  310038      LD SP,0x3800
```
`; annotation` names the hardware register/RAM being touched (CRTC, VRAM, RCRAM,
OBJRAM, MATH UNIT, sound mailbox, watchdog, etc.) per the verified memory maps.

## Orientation — key entry points

**Main CPU**
- `0xFFFC6` — reset (CLI, load SS/DS from `F000:0000`, `ljmp F000:001A`).
- `0xF001A` — init: watchdog kick, Z80 BUSREQ, latch clears, NVRAM `0x5AA5` check.
- `0xF2B6C` — self-test dispatcher (relocates a table to `0x4000`, `jmp bp`).
- String tables around `0xF372B` (`HARD WARE ERROR / STATUS`), `0xF460D`
  (`-- SELF TEST --`), `0xF465C` (`-- GAME SPECIFICATION --`), `0xF3B13`
  (`INSERT ANOTHER COIN`), high-score `SCORE NAME` table near `0xF43FF`.

**Math CPU**
- `0x4000` — reset init: sets SP=0x300, walking-bit RAM test on shared RCRAM `0x1000`.
- Accesses to `0x3000–0x3FFF` are the **hardware math unit** (perspective mul/div);
  `0x1000` RCRAM (road), `0x2000` OBJRAM (sprites) are shared with the main CPU.

**Z80 sound**
- `0x0000` — `IM 1 ; JP 0x0067`.
- I/O by memory address: `0x5000` i8255 PPI, `0x6000` i8253 PIT, `0x4000` INTREQ,
  `0xB000` shared mailbox from the main CPU; two AY-3-8910 PSGs behind the PPI/latch.

## Caveats

Static disassembly cannot resolve runtime-computed targets, and cannot distinguish
data that happens to decode as valid instructions. Treat unmarked runs with care;
the `*`-marked regions and the annotated I/O accesses are the reliable backbone.
The nine board PALs are `NO_DUMP` and are not represented here.

---

## Annotated subsystem listings (added after the raw disassemblies)

Beyond the three raw listings above, three subsystems were transcribed into fully
commented, human-readable listings, and the main CPU got a symbolized version:

- `maincpu_8086_symbolized.asm` — the full main-CPU listing with function banners,
  cross-reference headers, and `-> callee` names at each call site.
- `soundcpu_z80_annotated.asm` — the Z80 sound engine, commented (AY output path,
  voice control blocks, IRQ mixer, command mailbox).
- `maincpu_text_engine_annotated.asm` — the HUD/text display-list interpreter and its
  control-code table.
- `maincpu_selftest_annotated.asm` — the boot self-test / service suite.

See `README.md` for the full artefact index and `callgraph.png` (subroutine table in the technical reference, Appendix A)
for the main-CPU subroutine map.
