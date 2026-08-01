# Buggy Boy Jr — Runtime Tracing Toolkit

Static disassembly recovered the code and data formats; a few things can only be seen
while the game runs. This toolkit captures them from a live MAME session and turns them
into readable artefacts. It targets the exact gaps the static passes flagged:

| Gap (static) | Captured at runtime by |
|---|---|
| RAM-vector / `jmp bp` / `jmp ax` dispatch targets | debugger breakpoints (optional, `-debug`) |
| per-frame primitive/road geometry values | `GAS` write tap + OBJRAM snapshot |
| the object display list actually built each frame | OBJRAM snapshot (`0x2000`) |
| the music/SFX as played | AY register-write tap → note/frequency |
| which video registers change and when | SCOL/SLINCS/SKY/resume-math taps |

## Files
- **`bb_trace.lua`** — MAME autoboot script. Installs write-taps and a per-frame hook;
  writes `bb_sound.log`, `bb_ay.log`, `bb_road.log`, `bb_obj.log`, `bb_vregs.log`.
- **`bb_postprocess.py`** — turns those logs into `bb_music.csv` (per-channel notes),
  `bb_objects.txt` (per-frame object histogram), `bb_road_summary.txt`.

## Run it

```
# 1) capture (let the self-test finish, then play/attract for a while)
mame buggyboyjr -autoboot_script bb_trace.lua -autoboot_delay 3 -window

# 2) post-process
python3 bb_postprocess.py --ayclock 1500000
```

`bb_*.log` land in MAME's working directory. Stop MAME when you have enough frames.

## What each log contains

- **bb_ay.log** — `frame  AYn rNN = VV  name`. Registers 0–5 are the three tone periods,
  8–10 the channel volumes, 7 the mixer, 14/15 the I/O ports that drive the discrete
  engine-gain and skid lines. `bb_music.csv` converts tone periods to Hz and note names
  (`freq = ayclock / (16 · period)`), emitting a row per channel *on change* — an actual
  transcription of what the PSGs play.
- **bb_obj.log** — a full OBJRAM dump each frame: `code x y xsc ysc ystp attr` per entry,
  terminated by the `0xFF` marker. This is the object display list the geometry engine
  built for that frame — feed any single frame's entries to `buggyboy_sprite_engine.py`
  (from the sprite pass) to render the exact on-screen sprites, colour and zoom included.
- **bb_road.log** — every `GAS` sub-register write: `ba_inc/ba_val` (banking), `h_inc/h_val`
  (curve), `flags` (tunnel/line/wave/wall). Plotting `h_val`/`ba_val` over frames gives the
  road curvature and camber profile of the track being driven.
- **bb_sound.log** — main-CPU writes into the Z80 shared window: the sound-command bytes
  and the boot handshake (`1→2→3→4→5`) documented in the self-test pass.
- **bb_vregs.log** — SCOL / SLINCS / SKY / resume-math writes with frame numbers.

## Resolving the indirect dispatches (optional, needs `-debug`)

The three dispatch points the static analysis couldn't follow are handled by breakpoints
whose *action* prints the resolved target (no stepping required):

```
mame buggyboyjr -debug -autoboot_script bb_trace.lua
```
then in the Lua (see the commented block at the bottom of `bb_trace.lua`):
```lua
M.devices[":maincpu"].debug:bpset(0xF2B81, "1", 'printf "selftest disp bp=%04X\n", bp')
M.devices[":mathcpu"].debug:bpset(0x048B7, "1", 'printf "primitive type ax=%04X\n", ax')
```
The first logs every self-test menu handler entered; the second logs the primitive-type
handler chosen for each geometry primitive — turning the static "up to 8 handlers /
jmp bp table" into an observed call frequency per type.

## Notes / caveats
- Device tags are from `tatsumi/tx1.cpp`: `:maincpu`, `:mathcpu`, `:soundbrd:audio_cpu`,
  `:soundbrd:aysnd`. If a future MAME renames a subdevice, adjust the tags at the top of
  the Lua.
- The Lua uses `install_write_tap` + `emu.add_machine_frame_notifier` (MAME ≈0.227+),
  which work in normal mode; only the dispatch-resolution breakpoints need `-debug`.
- `--ayclock` defaults to 1.5 MHz (approximate for this board's AY domain); pass the exact
  clock if you want precise Hz — note names are robust to small clock errors.
- You must supply your own `buggyboyjr` ROM set to MAME; none of this redistributes ROMs.

## Why this is the right next step
Everything downstream of "what the CPUs decided this frame" is now observable: the actual
notes, the actual object list (renderable to pixels via the sprite engine), the actual
road curvature, and the actual dispatch targets. That closes the loop between the static
reverse engineering and the running machine.
