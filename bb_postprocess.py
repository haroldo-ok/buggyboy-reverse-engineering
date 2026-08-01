#!/usr/bin/env python3
"""
bb_postprocess.py -- turn bb_trace.lua logs into useful artefacts.

  bb_ay.log   -> bb_music.csv        (AY period/volume -> frequency per channel)
  bb_obj.log  -> bb_objects.txt      (per-frame object list + code histogram)
  bb_road.log -> bb_road_summary.txt (GAS geometry integrators over time)

Usage:  python3 bb_postprocess.py [--ayclock HZ]
The AY clock defaults to 1.5 MHz (Buggy Boy Z80/AY domain, approximate); pass the
exact value if you have it. Frequency = ayclock / (16 * tone_period).
"""
import argparse, re, os, collections

def parse_ay_simple(path, ayclock):
    if not os.path.exists(path): return []
    regs = {1:[0]*16, 2:[0]*16}
    out = []
    rx = re.compile(r'\s*(\d+)\s+AY(\d)\s+r(\d+)\s*=\s*([0-9A-Fa-f]{2})')
    chmap = [('A',0,1,8), ('B',2,3,9), ('C',4,5,10)]
    for line in open(path):
        m = rx.match(line)
        if not m: continue
        fr, ay, reg, val = int(m[1]), int(m[2]), int(m[3]), int(m[4],16)
        regs[ay][reg] = val
        for name,lo,hi,vol in chmap:
            if reg in (lo,hi,vol):
                period = regs[ay][lo] | ((regs[ay][hi] & 0x0f) << 8)
                v = regs[ay][vol] & 0x1f
                freq = (ayclock/(16*period)) if period > 0 else 0.0
                out.append((fr, ay, name, period, round(freq,1), v))
    return out

def note_name(freq):
    if freq <= 0: return "-"
    import math
    n = round(12*math.log2(freq/440.0)) + 69   # MIDI number
    names=['C','C#','D','D#','E','F','F#','G','G#','A','A#','B']
    return f"{names[n%12]}{n//12-1}"

def do_music(ayclock):
    rows = parse_ay_simple("bb_ay.log", ayclock)
    if not rows:
        print("bb_ay.log: none"); return
    with open("bb_music.csv","w") as f:
        f.write("frame,ay,channel,period,freq_hz,note,volume\n")
        last={}
        for fr,ay,ch,period,freq,vol in rows:
            key=(ay,ch)
            if last.get(key)==(period,vol): continue    # only emit on change
            last[key]=(period,vol)
            f.write(f"{fr},{ay},{ch},{period},{freq},{note_name(freq)},{vol}\n")
    print(f"bb_music.csv: {len(rows)} AY events -> note/freq per channel")

def do_objects():
    path="bb_obj.log"
    if not os.path.exists(path): print("bb_obj.log: none"); return
    hist=collections.Counter(); frames=0; peak=0; cur=0
    rx=re.compile(r'code=([0-9A-Fa-f]{2})')
    with open("bb_objects.txt","w") as out:
        for line in open(path):
            if line.startswith("----"):
                frames+=1; peak=max(peak,cur); cur=0; continue
            m=rx.search(line)
            if m:
                hist[int(m[1],16)]+=1; cur+=1
        out.write(f"frames captured: {frames}\npeak objects/frame: {peak}\n\n")
        out.write("object-code usage (code: total appearances):\n")
        for code,n in sorted(hist.items(), key=lambda kv:-kv[1]):
            out.write(f"  {code:02X}: {n}\n")
    print(f"bb_objects.txt: {frames} frames, peak {peak} objects/frame, "
          f"{len(hist)} distinct codes")

def do_road():
    path="bb_road.log"
    if not os.path.exists(path): print("bb_road.log: none"); return
    cnt=collections.Counter()
    for line in open(path):
        m=re.search(r'GAS\[(..)\]', line)
        if m: cnt[m[1]]+=1
    with open("bb_road_summary.txt","w") as out:
        out.write("GAS sub-register write counts (road geometry integrators):\n")
        for sub,n in sorted(cnt.items()):
            out.write(f"  GAS[{sub}]: {n}\n")
    print("bb_road_summary.txt: written")

if __name__ == "__main__":
    ap=argparse.ArgumentParser()
    ap.add_argument("--ayclock", type=float, default=1_500_000.0,
                    help="AY-3-8910 master clock in Hz (default 1.5 MHz, approx)")
    a=ap.parse_args()
    do_music(a.ayclock)
    do_objects()
    do_road()
