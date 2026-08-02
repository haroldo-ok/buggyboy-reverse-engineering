# Buggy Boy Junior — Reverse Engineering

A ground-up static reverse engineering of the arcade game **Buggy Boy Junior**
(a.k.a. *Speed Buggy*), Tatsumi 1986 — the single-monitor version of *Buggy Boy* (1985).
Everything here is derived from the 37-chip ROM set (MAME `buggyboyjr`), verified and
analysed byte-by-byte, cross-checked against the MAME `tatsumi/tx1.cpp` driver.

All 37 ROM dumps were **CRC32-verified** against the reference set before analysis.

---

## The hardware, in one paragraph

A three-CPU board: an **Intel 8086** main CPU (game logic), a second **8086** math
coprocessor (road & sprite geometry) driving a **custom hardware math unit**, and a
**Z80** sound CPU with **two AY-3-8910** PSGs plus a discrete engine/skid synthesiser.
Graphics are a 2bpp character/HUD layer, hardware-**zoomed 2bpp sprites**, and a
PROM-driven **pseudo-3D road**, over a 256-colour RGBI palette. Analog controls
(steering/accel/brake) come in through the sound board's i8255 PPI.

---

## Start here

**`buggyboyjr_technical_reference.md`** is the single consolidated reference — hardware,
ROM map, memory maps, boot/self-test, program structure, the geometry engine, the full
graphics pipeline, sound, data formats, and runtime tracing, plus two appendices (main-CPU
subroutine inventory and the object catalog). Read that first; the files below are the
raw artefacts and operational guides it refers to.

---

## Deliverables by subsystem

### CPU disassemblies (the "assemblies")
- `maincpu_8086.asm` — full main-CPU disassembly (both banks), complete byte coverage.
- `maincpu_8086_symbolized.asm` — same, with function banners, xref headers, and
  `-> callee` annotations at every call site.
- `mathcpu_8086.asm` — full math-coprocessor disassembly.
- `soundcpu_z80.asm` — full Z80 sound-CPU disassembly.
- `DISASSEMBLY_INDEX.md` — how to read them + entry points + coverage stats.
- `callgraph.png` — the 69 main-CPU subroutines and their call graph (table in the reference, Appendix A).

### Annotated subsystem listings (fully commented, human-readable)
- `soundcpu_z80_annotated.asm` — the sound engine: AY output path, 6 voice control blocks,
  IRQ mixer, PIT-modulated engine pitch, command mailbox.
- `maincpu_text_engine_annotated.asm` — the HUD/text display-list interpreter and its
  control-code table (newline/cursor/colour), incl. the double-height score font.
- `maincpu_selftest_annotated.asm` — the boot self-test: the Z80 handshake, the
  "HARDWARE ERROR / STATUS nn" hang, service-mode grid patterns.

### Graphics — decoded straight from ROM
- `palette.png` — the 256-colour hardware palette (RGBI PROMs).
- `char_tiles.png` — all 2,048 8×8 characters (font, HUD, logo).
- `char_color.png` — the font through the `bb14` colour LUT, several attributes.
- `sprites_all.png` — **all 256 object slots** (green=player buggy `00–3B`,
  blue=2nd vehicle `3E–51`, yellow=object, red=unused), correctly bank-selected.
- `buggy_rotation.png` — the player buggy's rotation sequence at 1:1.
- `nonplayer_corrected.png` — the 144 valid non-player objects, correct tile bank each.
- `nonplayer_categories.png` — one representative per object category.
- object catalog & sprite-assembly write-up are in the technical reference (§7.3, Appendix B).

### Road / pseudo-3D
- `road_patterns.png` — the road/dirt surface-pattern vocabulary (shape PROMs).
- `road_structure_map.png` — the `bug11s` pattern-selector map (depth × horizontal).
- `road_texture.png` — a flattened road-surface decode via the ported `get_roadpix`.

### Tools
- `buggyboy_sprite_engine.py` — faithful Python port of the object assembler.
  `draw_object_auto(code)` renders any object with the correct bank; `object_is_valid()`
  filters unused slots.
- `bb_trace.lua` — MAME autoboot tracer: logs sound commands, AY writes, road/geometry,
  per-frame OBJRAM, and video registers (see `RUNTIME_TRACING_README.md`).
- `bb_postprocess.py` — turns those logs into a music transcription, an object histogram,
  and a road-geometry summary.

---

## Key findings

- **Three cooperating CPUs** with a shared-RAM handshake protocol; the boot self-test is a
  `1→2→3→4→5` ping-pong with the Z80, and a timeout shows "HARDWARE ERROR / STATUS nn".
- **Pseudo-3D = coprocessor + hardware math unit.** The math CPU walks a *primitive
  display list*, dispatches on the top 3 bits of each primitive through an 8-entry jump
  table (resolved: object/sprite, generic projection, road-line, and "emit predefined
  object"), and drives a memory-mapped divider (`0x3000`) for the perspective divide,
  feeding on 1/z + trig tables in `au_data`.
- **Sprites are hardware-zoomed and assembled from 8×8 tiles** through a `bug13→bb8→
  obj_map→bug18s→bb9` LUT chain. Object art lives in tile-bank pair {0,1} or {2,3},
  selected by **attribute bit 4** — the source of the initial "garbled" objects until the
  bank was auto-selected. ~54 of the 256 codes are unused slots.
- **A second vehicle** occupies codes `0x3E–0x51` (same fingerprint as the player buggy).
- **Sound** is a table-driven Z80 mixer: 2×AY-3-8910 on the I/O bus, six 0x40-byte voice
  blocks, an IRQ tick that consumes the command mailbox and PIT-modulates the engine note,
  with the engine/skid roar on a discrete circuit under AY I/O-port control.
- **HUD text** is a compact display-list bytecode with cursor/colour control codes and a
  double-height score font; the top 64 scanlines are a fixed HUD band (no vertical scroll).

---

## Verification & honesty notes

- ROM integrity: **37/37 CRC32 match** the MAME reference.
- Graphics decodes are validated by adjacent-pixel **coherence** (~0.83–0.85, identical to
  the known-good font; random data is ~0.25).
- Everything here is **static** analysis of the ROM bytes. The things that inherently need
  a running machine — live RAM-vector dispatch targets, the per-frame road/RAM values
  needed to composite a full frame, and the music as actually sequenced — are captured by
  the runtime toolkit (`bb_trace.lua` + `bb_postprocess.py`), not by the static listings.
- You must supply your own `buggyboyjr` ROM set to MAME; nothing here redistributes ROMs.

---

## Provenance

Hardware/register names and memory maps were cross-referenced with MAME's
`tatsumi/tx1.cpp`, `tx1_a.cpp`, and `tx1_v.cpp`. All disassembly, graphics decoding,
sprite/road reconstruction, and the tracing toolkit were produced by direct analysis of
the ROM images in this project.
