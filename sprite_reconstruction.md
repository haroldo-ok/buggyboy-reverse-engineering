# Buggy Boy Jr — Object (Sprite) Reconstruction

The object ROMs don't store finished pictures — a sprite is *assembled* at draw time
from 8×8 tiles through a chain of lookup ROMs, then coloured through two more PROMs.
I ported that entire hardware pipeline and rendered the objects at 1:1 scale. The
result confirms the graphics decode end-to-end: the buggy and every roadside object
come out as recognisable, palette-accurate sprites.

## The assembly pipeline (as implemented)

For an object number `code` (0–255) and a vertical position in the object, the hardware
walks these stages every 8×8 tile:

1. **Tile-sequence LUT** — `bug13[code<<4 | (y_scale>>11 & 0xf)]` gives the row of tiles;
   `0xFF` marks the bottom of the object (self-terminating height).
2. **High-address LUT** — `bb8[code]` supplies the upper tile-address bits;
   together they form `psa0_12`, the base into the object map.
3. **Object map** — `bug17s`/`bug16s` (`= psbb0_15`) give, per column, the actual tile
   number, palette bits, bank select, and per-tile x-flip; a `0x40` flag marks the last
   tile in the row (self-terminating width).
4. **Pixel fetch** — the tile number + row select two bytes `0x8000` apart in the chosen
   32 KB **bank** (of 3); the two bytes are the 2bpp planes → `pix = (p1<<1)|p2`.
5. **Colour LUT** — `bug18s` + attribute bits build a 12-bit colour code `opcd0_11`;
   `bb9` (even/odd variants) maps `(opcd0_11, pix)` to a 6-bit colour; the final pen is
   `0x40 | colour`, so **objects occupy palette pens 0x40–0x7F**.

X-scale and Y-scale are 16.16 / 16-bit accumulators; setting `x_scale=0x80` and
`y_step=0x100` renders at native 1:1. Global and per-tile x-flip are honoured, as is the
width-group flip re-ordering (`xor_mask` of 0x3/0x7/0xf for 4/8/16-tile-wide objects).

## Results

- **217 of 256 object slots are non-empty.**
- **Codes `0x00`–`0x3B` are the buggy itself** — a full rotation/lean sequence (the car
  banking through its steering frames, as seen from behind). See `buggy_rotation.png`.
- The remainder are the roadside set: trees/bushes, logs and rocks, signs and gates,
  towers, banner poles, grandstands, bridges/rails, walls and the fence/net tiles.
  See `scenery_showcase.png`.
- `sprites_all.png` is the full labelled contact sheet of every object code.

## Colour note

Each object's exact palette bank is chosen at run time by its attribute byte
(`pctmp0_7`), which isn't stored in ROM. I rendered with a neutral attribute, so accent
colours may differ slightly from a live frame, but the hardware palette itself is exact
(rebuilt from the RGBI PROMs): the buggy body is genuinely white/silver (`0x4F`) with
tan detail (`0x48–0x4A`) and red/blue trim, and foliage uses the greens at `0x45/0x46`.
The colour *shapes* — which pens fall where — are produced by the real `bb9`/`bug18s`
LUTs, not guessed.

## Reusable engine

`sprites.py` is a self-contained, faithful Python port of
`tx1_state::buggyboy_draw_objs`. `draw_object(code, attr, x_scale, y_step, gxflip)`
returns the assembled pixel map (pen per x,y) for any object at any scale, which is what
produced every image here. Feeding it real object-RAM values (from an emulated frame)
would reproduce exact on-screen sprites including colour and zoom.
