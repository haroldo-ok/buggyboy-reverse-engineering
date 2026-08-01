# Buggy Boy Junior — Reverse-Engineering Details (Pass 4)

Deeper notes on four areas: the **character/HUD layer**, the **math CPU's geometry
algorithm**, the **sound voice engine internals**, and the exact **OBJRAM display-list
format**. Evidence is cited to ROM addresses / driver routines.

---

## 1. Character / HUD layer

### VRAM tilemap
For the single-screen "jr", the character plane is a **64×32 tilemap** in VRAM. Each
16-bit word encodes:

```
tilenum = (ram_val & 0x03ff) | ((ram_val & 0x8000) >> 5)   ; 11-bit tile (0..2047)
colour  = (ram_val & 0xfc00) >> 8                          ; 6-bit colour attribute
pixel   = (plane1_bit << 1) | plane0_bit                   ; 2bpp from bug34s/bug33s
char_val = colour | pixel                                  ; 8-bit CLUT input
```

The word at VRAM offset `0x7ff` holds the **scroll register**: `scroll_x = word & 0x1ff`,
`scroll_y = (word >> 10) & 0x3f`.

### Fixed HUD band (nice structural detail)
The renderer applies **no vertical scroll on scanlines 0–63** — that top 64-pixel band
is a fixed overlay (score / speed / time / lap), while everything below scrolls with
`scroll_y`. Between `y_offs` 64–127 the **horizontal** scroll is also applied, so a middle
region can pan independently. This is how the HUD stays locked while the world scrolls.

### Colour resolution (bb14 CLUT)
The 8-bit `char_val` indexes the `bb14` PROM (`proms[0x400]`); the final palette pen is
`((char_val & 0xc0) >> 2) + bb14[char_val]`. `bb14` holds **16 distinct base values**;
combined with the top-2 colour bits this spreads text across the palette. `char_color.png`
shows the font rendered through this path in true hardware colour for several colour
attributes (pen quartets printed per row). Pixel value 0 is the character background and
is keyed out in compositing unless the attribute forces it opaque.

---

## 2. Math CPU geometry engine

### The projection core — `sub_04896` (13 callers, 23 math-unit accesses)
This is the heart of the pseudo-3D. Annotated:

```
cld
mov  di,[0x304]                 ; table/list pointer
lodsw                           ; fetch next primitive from the list (SI)
and  ax,0xe000                  ; top 3 bits = PRIMITIVE TYPE
mov  [0x308],ax
rol  ax,4  ; bx=ax
mov  ax,[bx-0xac0]              ; TYPE -> handler address (jump table)
jmp  ax                         ; dispatch (up to 8 primitive types)
  ...
mov  dx,[0x100a]                ; horizon / road reference (RCRAM)
mov  bx,0xf0                    ; screen centre (240)
sub  bx,dx ; sub bx,ax          ; bx = 0xF0 - horizon - world_offset  (vertical proj.)
mov  [0x300c],0x74              ; MATH op-select 0x74
mov  [0x3000],bx                ; MATH operand  (issue perspective op)
nop                             ; wait-state
mov  bx,[0x311e]                ; read result (lane)
mov  [0x300c],cx ; [0x308c],bx  ; chain next op
add  dx,[0x300e]                ; accumulate divided result
mov  [0x310c],cx ; [0x308c],0x3f70
cmp  bh,0x40 ; ja/jb ...        ; clamp to screen
mov  bx,[0x3680] ; [0x3680],ax  ; z / divisor bank
```

So each frame the math CPU walks a **primitive list**, and for every entry: reads its
type (top 3 bits), jumps to the type-specific handler, computes a **vertical screen
position** as `0xF0 − horizon − offset`, then drives the **hardware math unit** for the
perspective divide (write op `0x300C`, operand `0x3000`, wait, read result `0x300E/0x311E`,
accumulate), clamps to the visible range, and manages the z/divisor bank at `0x3680`.
The results are written into OBJRAM/RCRAM for the video hardware to consume.

Up to **8 primitive-type handlers** exist (road segment, sprite, wall, tunnel, horizon,
etc.), selected by the `jmp ax` table at `[bx-0xac0]`.

---

## 3. Road / common RAM layout (RCRAM)

From the road hardware (double-buffered lists at `0x800` and `0xA00`):

| RCRAM range | Contents |
|---|---|
| `0x1800–0x18FF` | road line **horizontal position** words (128 entries, one per road strip) |
| `0x19E0–0x19EF` | **vertical positions** — start line, water, tunnel entries |
| `0x19F0–0x19FF` | **horizontal positions** — walls and tunnels |

Three **TZ1113 accumulators** vary the road continuously:
- **camber** — updated **per pixel** (road tilt across the width),
- **vertical scale/position** — updated **per scanline** (perspective foreshortening),
- **speed** — updated **per frame** (how fast the road scrolls toward the player).

These are exactly the `ba_val` / `slin_val` / `h_val` integrators the math CPU feeds
through the `GAS` port (documented in pass 3).

---

## 4. Sound voice engine internals (Z80)

### AY register shadow buffers
The six voices keep AY register shadows in low RAM; the update routines target
`0x4000/0x4001/0x4002` (AY#1 tone period lo/hi, etc.) and `0x4040/0x4041` (AY#2), which
are flushed to the chips (I/O ports `0x80/0x81`, `0x40/0x41`) each service pass.

### PIT-modulated engine/skid pitch
`voice_update` (`0x0948`, `0x0970`) read the latched **PIT samples** (`[0x4403]`,
`[0x4404]`) and apply them as a signed delta to the running period:

```
0955:  AND 15 ; LD B,(HL) ; LD (HL),A ; SUB B ; RET z   ; delta vs previous
       BIT 3,A ; (sign-extend) OR 0xF0 ; NEG            ; make signed step
```

i.e. the engine RPM / skid frequency is driven from the timer, giving the continuously
varying engine note. `RST 10h` (`0x0010`) is a small **"HL += A"** index helper
(`ADD A,L; LD L,A; ADC A,H→H`) used to index the period/sequence tables.

### Structure recap
`IM 1 → RST 38h → 0x0875` tick: consume mailbox command (handshake via `[0x441C]` /
PPI latch `0x7000`), sample PIT, update the six 0x40-byte voice blocks round-robin over a
4-phase counter, flush AY shadows. Music/effects on the two PSGs; engine roar and tyre
skid on the discrete circuit under AY I/O-port control.

---

## 5. OBJRAM display-list format (exact)

The object list lives at OBJRAM `0x2000`; the math CPU fills it, `buggyboy_draw_objs`
consumes it. Each entry is 8 words (stride `0x10`), of which five are used:

| Word | Field | Meaning |
|---|---|---|
| `+0` lo | `code` | object number (0–255) |
| `+0` hi | `y` | screen Y (top line); `0xFF` here = **end of list** |
| `+1` | `y_scale` | initial 16-bit vertical-scale accumulator |
| `+2` lo | `x_scale` | horizontal scale (`0` = skip object) |
| `+2` hi | `pctmp0_7` | attributes: palette bank, tile-bank bit 4, x-flip bit 7 |
| `+3` | `y_step` | vertical-scale increment (zoom) |
| `+4` | `x` | screen X (`& x_mask`) |

The scan runs `offs = 0 … 0x300/2 step 8`, so **up to 48 objects** per frame.

---

## 6. Artefacts

- `buggyboyjr_details_4.md` — this document.
- `char_color.png` — the font rendered in true hardware colour through the `bb14` CLUT,
  for several colour attributes.

Between the four passes, the static reverse engineering now documents: all three CPUs
(code, entry points, and inter-processor protocols), the complete graphics path
(palette, character layer with CLUT, hardware-zoomed sprites reconstructed end-to-end,
and the road generator with its pattern ROMs), the geometry engine's projection
algorithm, the sound engine down to voice buffers and PIT modulation, and the exact
OBJRAM/RCRAM/VRAM data formats.
