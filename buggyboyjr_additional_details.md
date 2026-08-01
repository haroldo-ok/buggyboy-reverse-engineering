# Buggy Boy Junior — Additional Reverse-Engineering Details

Third-pass notes covering the subsystems not yet documented in depth: the **road
generator**, the **sky and layer compositing**, the **video/road-control registers**
the math CPU writes, the **sound-command handshake**, and the **NVRAM layout**. As
before, every claim is tied to concrete ROM/register evidence.

---

## 1. Road generation — the second half of the "3D"

The pseudo-3D is two cooperating mechanisms: the **math unit** projects sprites and the
horizon (documented earlier), and a dedicated **road generator** draws the road surface
one scanline at a time from a small ROM + PROM set, steered by accumulators the math CPU
updates every frame.

### 1a. Road-control registers — the `GAS` port (`0x2400`, math CPU side)
The math CPU integrates the road geometry by writing sub-registers here (offset `<<1`):

| Sub-reg | Field | Meaning |
|---|---|---|
| `0x00` | `ba_inc` (low 16) | banking/camber increment |
| `0x20` | `ba_inc` (high 8) + `bank_mode` | camber increment high, camber direction |
| `0x40` | `ba_val += ba_inc` | **24-bit banking accumulator** (road tilt) |
| `0x60` | `h_inc`, reset `shift`,`h_val` | horizontal (curve) increment, restart |
| `0x80` | `h_val += h_inc` | **horizontal/curve accumulator** |
| `0xA0` | `wa8` | wall address (tunnel/wall horizontal base) |
| `0xE0` | `flags` | road mode flags (below) |

So per frame the math CPU feeds `h_inc`/`ba_inc` and accumulates them — `h_val` is the
road's horizontal curve integrator and `ba_val` its banking integrator. The per-scanline
road hardware then derives the "road vertical address" `rva0_6 = (h_val >> 7) & 0x7f`,
which is the distance-into-the-screen mapping (perspective) for that line.

### 1b. Road mode flags (`vregs.flags`)
`WAVE1/WAVE0` (crest/dip shaping), `TNLMD1/TNLMD0` (tunnel mode), `TNLF` (tunnel on),
`LINF` (centre-line on), `RVA7` (selects road-RAM window `0x800` vs `0xC00`), `WANGL`
(wall angle). These switch the road between open road, lined road, crest/dip waves, and
tunnel sections.

### 1c. Road graphics format — `bug11s` + shape PROMs (decoded)
`buggyboy_get_roadpix` builds each 8-pixel road strip:

```
road_rom = bug11s (0x4000) | bb3s @0x4000 | bb4s @0x4200 | bb5s @0x4400 | bb6 @0x4600
rha  = horizontal road address (from the LS161 counter chain)
rom_data = bug11s[(1<<13) | (rha<<4) | rva0_6]     ; road-surface pattern selector
prom_addr = (flip?0x80:0) | (rom_data & 0x7f)
rc0 = bb3s[prom_addr] ; rc1 = bb4s[prom_addr] ; rc2 = bb5s[prom_addr]   ; 3 road planes
rom_data = bug11s[(rha<<4) | rva0_6]               ; dirt pattern selector
rc3 = f(bb3s[0x100|d], bb4s[0x100|d], SLD)         ; dirt/rough plane (SLD-gated)
```
Each pixel is 4 bits (`rc3 rc2 rc1 rc0`). So `bug11s` is a **pattern-selector map**
(which surface pattern to use at each depth `rva0_6` and horizontal chunk `rha`), and the
three 512-byte PROMs `bb3s/bb4s/bb5s` are the **pattern vocabulary** (centre line, edge
stripes, road/shoulder, checkered start-finish). `bb6` is the vertical/`SLD` PROM that
paces the perspective (`sld = (bb6[rva0_6] + slin_val) & 0x38`), and `bb7`
(`proms[0x1500]`) is the road colour LUT. See `road_patterns.png` (the pattern
vocabulary) and `road_structure_map.png` (the `bug11s` selector map).

### 1d. Camber / banking
Per pixel the hardware decides road tilt (`bnkcs`) from `ba_val` bit 23 (sign), the
`0x7f8000` window, and a 10-bit `bank_cnt = (ba_val>>5)&0x3ff` compared to `0x300`,
flipped by `bank_mode`. This leans the road left/right on curves.

**Why a full static road frame isn't reconstructable:** every input above
(`h_val, ba_val, slin_val, scol, flags`, and the per-line road RAM `rcram`) is produced
at run time by the math CPU. The *graphics and the algorithm* are fully recovered here;
only the per-frame numbers are missing (they'd come from an emulated run).

---

## 2. Sky and layer compositing

**Sky** (`buggyboy_sky_w` → `vregs.sky`): a per-scanline vertical gradient. During
compositing `sky_en = BIT(sky,7)` and `sky_val = (((sky & 0x7f) + y) >> 2) & 0x3f` — the
palette index walks up every 4 scanlines, giving the graduated sky/horizon.

**Compositing** (`bb_combine_layers`) resolves four layers per pixel by priority:

| sel | source | value |
|---|---|---|
| 3 (top) | **character/HUD** | `bb14[char_val] + char_6_7` (opaque text wins) |
| 2 | **sky** | `sky_val` (only where char/obj/road are all background) |
| 0 | **objects** | `obj_val & 0x3f` (sprite pens `0x40|c`, bit 6 = opaque) |
| 1 | **road** | `rod_val & 0x3f` (road pen, bit 6 = opaque) |

Effective stack: HUD text on top, then sprites over road, with the gradient sky behind
everything. Object and road opacity are carried in bit 6 of their pens; the character
layer's transparency is `!(BIT(char_val,7) && (char_val & 3))`.

---

## 3. Sound-command handshake (Z80 side)

The IRQ tick calls the command handler at `0x0BD7`:

```
LD HL,0x441c ; A=(HL)        ; 0x441C = command-pending flag
AND A ; JR nz, busy
    ; --- no command: handshake idle ---
    LD (HL),0xff             ; mark
    EI ; LD (0x7000),A ; DI  ; pulse PPI latch 0x7000 (ack to main CPU)
    LD (HL),A               ; clear
    LD A,0xf0 ; LD (0x4101),A
    RET
busy:                        ; --- command present ---
    LD (HL),0               ; consume it
    INC (0x4101)            ; advance sequence counter
    ... SET 7,(0x4004) ; SET 2,(0x402b) gated by ROM cfg (0x0065).3
    ADD HL,SP ; LD SP,HL     ; unwind and return
```

So the main CPU deposits a command (via the i8255 PPI at `0x5000`), the Z80 sees the
`0x441C` flag, acknowledges through the `0x7000` latch, and sets trigger bits inside the
six 0x40-byte voice control blocks (`0x4004`, `0x402b`, …) to start the requested
music/effect. The two AY-3-8910s then render it under the interrupt mixer, with the
discrete engine/skid circuit driven from the AYs' I/O-port outputs.

---

## 4. NVRAM / bookkeeping layout (from `init_main`)

Battery-backed RAM in segment 0. The init validates a signature and seeds defaults:

| Address | Contents |
|---|---|
| `0x3E66` | magic `0x5AA5` (validity signature) |
| `0x3E60` | table index / counter (looped 0..4 → 5 entries) |
| `0x3E62` | zeroed counter |
| `0x3E64` | default value `0x5DC` (1500) — high-score / bookkeeping seed |

A dead battery (missing `0x5AA5`) triggers re-initialisation of the five-entry table —
consistent with a 5-slot high-score / bookkeeping structure.

---

## 5. Video register summary (main-CPU visible)

| Reg | Name | Written by | Effect |
|---|---|---|---|
| `0xC000` | `SCOL`/`scolst` | main CPU | road/scroll colour + wall/tunnel command bits (`vregs.scol`) |
| `0xD000/2` | `SLINCS` | main CPU | scanline IRQ position/enable |
| `0xE000` | `SKY` | main CPU | sky gradient base + enable |
| `0xF000` | resume-math | main CPU | pulse to start the math CPU for the frame |
| `0x2400` | `GAS` | math CPU | road geometry integrators + flags (§1a) |
| `0x2000` | `OBJRAM` | math CPU | per-object list consumed by `buggyboy_draw_objs` |
| `0x1000` | `RCRAM` | both | per-scanline road parameters |

---

## 6. Artefacts in this pass

- `buggyboyjr_additional_details.md` — this document.
- `road_patterns.png` — the road/dirt surface-pattern vocabulary from `bb3s/bb4s/bb5s`.
- `road_structure_map.png` — the `bug11s` pattern-selector map (depth × horizontal).
- `road_texture.png` — a flattened road-surface decode via the ported `get_roadpix`.

Combined with the earlier passes, the static reverse engineering now covers all three
CPUs (code + protocols), the full graphics path (palette, characters, hardware-zoomed
sprites end-to-end, and the road generator), the sound engine, and the inter-processor
interfaces. The only things that inherently require a live/emulated run are the runtime
dispatch targets and the per-frame road/road-RAM values.
