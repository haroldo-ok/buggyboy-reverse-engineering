# Buggy Boy Junior — Reverse-Engineering Details (Pass 5)

This pass resolves something earlier passes could only point at: the **math CPU's
primitive-type dispatch**. The geometry engine walks a display list of "primitives", and
the top 3 bits of each primitive select one of **8 handlers via a jump table**. That table
is now read out of ROM and every handler disassembled, so we know exactly what kinds of
things the 3D engine draws and how each is processed.

---

## 1. The primitive dispatch table (resolved)

In the projection core (`sub_04896`) the dispatch is:

```
lodsw                     ; ax = next primitive header (DS:SI)
and  ax,0xe000            ; top 3 bits = TYPE
rol  ax,1 (x4)            ; -> index {0,2,4,...,e}
mov  bx,ax
mov  ax,[bx-0xac0]        ; DS:0xF540 -> ROM 0x7540 : 8-entry handler table
jmp  ax                   ; near jump within CS (base 0x4000)
```

The 8-entry table at ROM `0x7540` contains these handler offsets (CS base `0x4000`):

| Type (bits 15-13) | Table word | Handler | Role (from disassembly) |
|---|---|---|---|
| 0 (`000`) | `0A9E` | `0x4A9E` | **Object/sprite** — projects and writes an OBJRAM entry |
| 1 (`001`) | `08B9` | `0x48B9` | default perspective-projection |
| 2 (`010`) | `08B9` | `0x48B9` | default perspective-projection |
| 3 (`011`) | `08B9` | `0x48B9` | default perspective-projection |
| 4 (`100`) | `08B9` | `0x48B9` | default perspective-projection |
| 5 (`101`) | `08B9` | `0x48B9` | default perspective-projection |
| 6 (`110`) | `0A08` | `0x4A08` | **Road/horizon line** — projection with screen clamp |
| 7 (`111`) | `0B29` | `0x4B29` | **Emit predefined object** — copies a ready-made entry |

Five of the eight types share the generic projection handler; three are specialised.

---

## 2. What each handler does

### Type 0 — object/sprite primitive (`0x4A9E`)
```
mov ax,dx ; rcr/cwde/rcl        ; sign test on accumulated coordinate
lodsw ; ... [0x300c]=0xffff ; [0x3008]=0x8000   ; drive math unit (sign-init)
lodsw
stosw ; xor ax,ax ; stosw ; mov ax,cx ; stosw   ; WRITE 3 words to OBJRAM (ES:DI)
mov ax,[0x300e]                 ; read projected result
```
It consumes the primitive's parameters, runs the perspective op, and **stores an object
record into OBJRAM** at `ES:DI` — this is how a moving sprite (buggy, obstacle) gets its
on-screen position/scale each frame.

### Types 1–5 — default projection (`0x48B9`)
The generic handler documented in pass 4: `bx = 0xF0 - horizon - offset`, math-unit
divide, accumulate, clamp. Used for the bulk of road/geometry points; the five type codes
let the list distinguish sub-categories that nonetheless share the projection math.

### Type 6 — road/horizon line (`0x4A08`)
Same scaling as the default (`sar bp,1 ×2; inc bp`) but adds an explicit
`cmp ax,0xF0 ; jge` clamp to the 240-line screen height — i.e. a horizontal road/horizon
line that must be pinned at the screen bottom edge. Writes to math lanes `0x310C/0x308C`.

### Type 7 — emit predefined object (`0x4B29`)
```
mov ax,di
mov si,[si]        ; follow a pointer stored in the list
mov cx,5 ; rep movsw ; ES:DI <- DS:SI   ; copy a ready-made 5-word OBJRAM entry
add ax,8 ; mov [si],ax                   ; advance the source cursor
ret
```
The **5-word copy exactly matches the OBJRAM entry size** (code+Y, y_scale, x_scale+attr,
y_step, X). So type 7 places a *precomputed* object — fixed roadside scenery, banners,
start/finish gates — by reference, without recomputing its projection.

---

## 3. Primitive-list record format

Each primitive is a variable-length record read through `DS:SI`:

```
word 0:  header   -> bits 15-13 = TYPE, bits 12-0 = type-specific parameter
word 1..:         -> type-specific payload
                     type 0 : + 2 words (object params) -> writes 3 OBJRAM words
                     type 6 : + 1 word  (line param)
                     type 7 : header's low bits point to a 5-word source entry
                     type 1-5: + ~2 words (coordinate/scale)
```

The engine walks the list until a terminator, projecting each primitive into OBJRAM/RCRAM
for the video hardware. This is the software contract between the game-logic CPU (which
builds the list) and the geometry CPU (which projects it).

---

## 4. DIP switch usage (main CPU)

The DIP port `[0xB000]` is read exactly once, at `F0E6F`:

```
mov al,[0xb000] ; rol al,1 ; rol al,1 ; and ax,3   ; take 2 DIP bits -> 0..3
... index by (bits, game-state [0x1178]) ...
add bx, cs:[di + 0x4bcc]                            ; parameter table @ bank 0x24BCC
```

Two DIP bits select a row in a parameter table at bank offset `0x24BCC`; the looked-up
word is added to a coordinate/timing accumulator (`bx`). So those DIP switches choose a
course/difficulty variant that shifts game parameters, rather than being polled
throughout the code. (Coin/credit and control inputs arrive via the i8255 PPI / sound
board path rather than this port.)

---

## 5. Summary of what's now known about the geometry pipeline

1. Game-logic CPU builds a **primitive display list** in shared RAM.
2. Math CPU (`sub_04896`) walks it, dispatching on the 3-bit **type** through the
   `0x7540` jump table to one of four handlers.
3. Handlers drive the **hardware math unit** (`0x3000`) for the perspective divide and
   **write OBJRAM/RCRAM** records (sprite positions, road lines, predefined objects).
4. Video hardware consumes OBJRAM via `buggyboy_draw_objs` (sprites) and RCRAM via the
   road generator, composited under the character/HUD layer.

That closes the loop from "game decides what's in the world" → "geometry projects it" →
"video draws it", entirely from the ROM code.

`buggyboyjr_details_5.md` — this document.
