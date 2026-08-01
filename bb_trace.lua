-- ===========================================================================
-- bb_trace.lua  --  runtime tracer for Buggy Boy Junior (MAME 'buggyboyjr')
-- ---------------------------------------------------------------------------
-- Captures the data that STATIC disassembly cannot recover:
--   * sound commands  (main CPU -> Z80 shared-RAM window)
--   * AY-3-8910 register writes  (Z80 I/O ports) -> reconstruct music/SFX
--   * road / geometry control  (math CPU GAS port 0x2400 writes)
--   * per-frame OBJRAM object list  (math CPU 0x2000-0x22FF)
--   * video registers  (SCOL / SLINCS / SKY / resume-math on the main CPU)
--   * engine-gain / skid state  (AY port A/B outputs)
--   * optional: resolved indirect-dispatch targets (needs -debug, see bottom)
--
-- USAGE (no debugger needed for the taps/dumps):
--   mame buggyboyjr -autoboot_script bb_trace.lua -window
--   (add -autoboot_delay 3 to let the self-test finish first)
--
-- Output files are written next to MAME's working dir:
--   bb_sound.log   bb_ay.log   bb_road.log   bb_obj.log   bb_vregs.log
--
-- Tested shape against MAME's Lua API (0.250+). Device tags come from
-- tatsumi/tx1.cpp:  :maincpu  :mathcpu  :soundbrd:audio_cpu  :soundbrd:aysnd
-- ===========================================================================

local M = manager.machine

-- ---- config -------------------------------------------------------------
local cfg = {
  dump_obj_every_frame = true,   -- OBJRAM snapshot each frame
  obj_max_entries      = 48,     -- list scan limit (0x300/2 words / 8)
  log_ay               = true,   -- AY register writes
  log_sound_cmd        = true,   -- main->Z80 shared writes
  log_road             = true,   -- GAS geometry writes
  log_vregs            = true,   -- video registers
}

-- ---- helpers ------------------------------------------------------------
local function dev(tag)
  local ok, d = pcall(function() return M.devices[tag] end)
  if ok and d then return d end
  return nil
end
local function space(tag, spname)
  local d = dev(tag); if not d then return nil end
  local ok, s = pcall(function() return d.spaces[spname] end)
  if ok then return s end
  return nil
end
local function open(name)
  local f = io.open(name, "w")
  if f then f:setvbuf("line") end
  return f
end
local function frame()
  local ok, n = pcall(function() return M.screens:at(1):frame_number() end)
  if ok and n then return n end
  return 0
end

local maincpu = space(":maincpu", "program")
local mathcpu = space(":mathcpu", "program")
local z80io   = space(":soundbrd:audio_cpu", "io")
local z80mem  = space(":soundbrd:audio_cpu", "program")

local f_sound = cfg.log_sound_cmd and open("bb_sound.log")
local f_ay    = cfg.log_ay        and open("bb_ay.log")
local f_road  = cfg.log_road      and open("bb_road.log")
local f_obj   = cfg.dump_obj_every_frame and open("bb_obj.log")
local f_vregs = cfg.log_vregs     and open("bb_vregs.log")

local taps = {}   -- keep tap handles alive

-- ---- 1) sound commands: main CPU writes into the Z80 shared window --------
-- main 0x10000-0x1FFFF  <->  Z80 RAM (z80_shared_w). We log the low region
-- where the command mailbox / handshake byte live.
if maincpu and f_sound then
  local t = maincpu:install_write_tap(0x10000, 0x100ff, "snd_cmd",
    function(offset, data, mask)
      f_sound:write(string.format("%8d  [%05X] <= %04X  (mask %04X)\n",
        frame(), offset, data & 0xffff, mask & 0xffff))
    end)
  taps[#taps+1] = t
end

-- ---- 2) AY-3-8910 register writes on the Z80 I/O bus ----------------------
-- AY1: OUT(0x81)=addr latch, OUT(0x80)=data ;  AY2: OUT(0x41)=addr, OUT(0x40)=data
if z80io and f_ay then
  local latch = {[0x80]=0, [0x40]=0}         -- last register selected per AY
  local function ay_tap(lo, hi)
    return z80io:install_write_tap(lo, hi, "ay",
      function(offset, data, mask)
        data = data & 0xff
        if offset == 0x81 then latch[0x80] = data
        elseif offset == 0x41 then latch[0x40] = data
        elseif offset == 0x80 or offset == 0x40 then
          local ay  = (offset == 0x80) and 1 or 2
          local reg = latch[offset]
          local name = ({[7]="mixer",[8]="volA",[9]="volB",[10]="volC",
                         [11]="envLo",[12]="envHi",[13]="envShape",
                         [14]="ioA(engine)",[15]="ioB(engine)"})[reg] or ""
          f_ay:write(string.format("%8d  AY%d r%-2d = %02X   %s\n",
            frame(), ay, reg, data, name))
        end
      end)
  end
  taps[#taps+1] = ay_tap(0x80, 0x81)
  taps[#taps+1] = ay_tap(0x40, 0x41)
end

-- ---- 3) road / geometry control: math CPU GAS port 0x2400-0x24FF ----------
-- sub-registers: 00 ba_inc.lo  20 ba_inc.hi+bankmode  40 ba_val+=  60 h_inc
--                80 h_val+=    A0 wa8               E0 flags
if mathcpu and f_road then
  local gasname = {[0x00]="ba_inc.lo",[0x20]="ba_inc.hi/mode",[0x40]="ba_val+=",
                   [0x60]="h_inc",[0x80]="h_val+=",[0xa0]="wa8",[0xe0]="flags"}
  local t = mathcpu:install_write_tap(0x2400, 0x24ff, "gas",
    function(offset, data, mask)
      local sub = (offset - 0x2400) & 0xff
      f_road:write(string.format("%8d  GAS[%02X] <= %04X   %s\n",
        frame(), sub, data & 0xffff, gasname[sub] or ""))
    end)
  taps[#taps+1] = t
end

-- ---- 4) video registers on the main CPU -----------------------------------
if maincpu and f_vregs then
  local vr = {[0xc000]="SCOL",[0xd000]="SLINCS",[0xd002]="SLINCS2",
              [0xe000]="SKY",[0xf000]="RESUME_MATH"}
  for addr, nm in pairs(vr) do
    local t = maincpu:install_write_tap(addr, addr+1, "vreg",
      function(offset, data, mask)
        f_vregs:write(string.format("%8d  %-11s <= %04X\n",
          frame(), nm, data & 0xffff))
      end)
    taps[#taps+1] = t
  end
end

-- ---- 5) per-frame OBJRAM snapshot (the assembled object display list) ------
-- entry (8 words) : +0 code|Y  +1 y_scale  +2 x_scale|attr  +3 y_step  +4 x
local function dump_obj()
  if not (mathcpu and f_obj) then return end
  local fr = frame()
  for i = 0, cfg.obj_max_entries-1 do
    local base = 0x2000 + i*0x10
    local w0 = mathcpu:read_u16(base+0)
    if (w0 & 0xff00) == 0xff00 then break end          -- end-of-list marker
    local ysc  = mathcpu:read_u16(base+2)
    local w2   = mathcpu:read_u16(base+4)
    local ystp = mathcpu:read_u16(base+6)
    local x    = mathcpu:read_u16(base+8)
    local code = w0 & 0xff
    local y    = (w0 >> 8) & 0xff
    local xsc  = w2 & 0xff
    local attr = (w2 >> 8) & 0xff
    f_obj:write(string.format("%8d  #%02d code=%02X x=%3d y=%3d xsc=%02X ysc=%04X ystp=%04X attr=%02X\n",
      fr, i, code, x, y, xsc, ysc, ystp, attr))
  end
  f_obj:write("----\n")
end

-- ---- frame hook -----------------------------------------------------------
local sub
local function on_frame()
  if cfg.dump_obj_every_frame then dump_obj() end
end
-- Prefer the modern notifier; fall back gracefully.
local ok = pcall(function() sub = emu.add_machine_frame_notifier(on_frame) end)
if not ok then
  -- older API: periodic timer at ~60 Hz
  M:add_notifier("frame", on_frame)
end

emu.print_info("bb_trace.lua installed: "
  .. (maincpu and "maincpu " or "")
  .. (mathcpu and "mathcpu " or "")
  .. (z80io and "z80io " or "")
  .. "-> logging to bb_*.log")

-- ===========================================================================
-- OPTIONAL: resolve indirect dispatch targets (requires launching with -debug)
-- ---------------------------------------------------------------------------
-- The jump-table dispatches the static pass could not follow live here:
--   * main CPU self-test 'jmp bp' @ F2B81
--   * math CPU primitive 'jmp ax' @ 04B7 (sub_04896)  [type dispatch]
--   * RAM state-vector 'jmp word ptr [xxxx]' sites
-- With -debug you can set breakpoints whose action reads the register and logs:
--
--   local dbg = M.devices[":maincpu"].debug
--   dbg:bpset(0xF2B81, "1",
--     'printf "disp bp=%04X\n", bp')          -- logs the resolved target
--   local mdbg = M.devices[":mathcpu"].debug
--   mdbg:bpset(0x04B7, "1", 'printf "prim ax=%04X\n", ax')
--
-- (bpset signatures vary by MAME version; in some builds use
--  dbg:bpset(addr, condition, action). Run with:  mame buggyboyjr -debug
--  -autoboot_script bb_trace.lua  and watch the debug console / logerror.)
-- ===========================================================================
