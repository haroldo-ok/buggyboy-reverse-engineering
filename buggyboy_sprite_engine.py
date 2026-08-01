# Faithful port of MAME tx1_state::buggyboy_draw_objs (1:1 scale, single sprite)
R='/home/claude/bb/roms/'
def L(f): return open(R+f,'rb').read()

# ---- regions ----
obj_luts = L('bug13.32') + L('bug18s.141')          # bug13 @0, bug18s @0x2000
obj_map  = L('bug16s.139') + L('bug17s.140')        # bug16s @0, bug17s @0x8000
obj_tiles= (L('bug26s.147')+L('bug19s.144')+L('bug28s.146')+
            L('bug21s.143')+L('bug30s.145')+L('bug23s.142'))   # 3 banks*0x10000
# proms
proms=bytearray(0x10000)
for f,off in [('bb10.41',0),('bb11.40',0x100),('bb12.39',0x200),('bb13.42',0x300),
              ('bb14.19',0x400),('bb9.190',0x500),('bb9.162',0xd00),
              ('bb7.188',0x1500),('bb8.31',0x1600)]:
    d=L(f); proms[off:off+len(d)]=d

bug13  = obj_luts
bug18s = obj_luts[0x2000:]
bb8    = proms[0x1600:0x1700]
bug16s = obj_map
bug17s = obj_map[0x8000:]
bb9o   = proms[0x500:]
bb9e   = proms[0xd00:]
pix    = obj_tiles

def BIT(v,n): return (v>>n)&1
OBJ_FRAC=16

# palette 256 RGB
def palette():
    def bit(v,n): return (v>>n)&1
    pal=[]
    for i in range(256):
        r0=proms[i];g0=proms[i+0x100];b0=proms[i+0x200];ii=proms[i+0x300]
        r=0x06*bit(ii,2)+0x0d*bit(r0,0)+0x1e*bit(r0,1)+0x41*bit(r0,2)+0x8a*bit(r0,3)
        g=0x06*bit(ii,1)+0x0d*bit(g0,0)+0x1e*bit(g0,1)+0x41*bit(g0,2)+0x8a*bit(g0,3)
        b=0x06*bit(ii,0)+0x0d*bit(b0,0)+0x1e*bit(b0,1)+0x41*bit(b0,2)+0x8a*bit(b0,3)
        pal.append((r,g,b))
    return pal
PAL=palette()

def draw_object(code, attr=0x00, x_scale=0x80, y_step=0x100, gxflip=0,
                x_stride=256, maxh=160):
    """Return (pixels dict {(x,y):pen}, width, height) for one object at 1:1."""
    out={}
    pctmp0_7=attr & 0xff
    gxflip = (pctmp0_7>>7)&1 if gxflip is None else gxflip
    y_scale=0
    minx=miny=10**9; maxx=maxy=-1
    for y in range(0, maxh):
        if y_scale & 0x8000: break
        bug13_addr=(code<<4)|((y_scale>>11)&0xf)
        bug13_data=bug13[bug13_addr & (len(bug13)-1)]
        if bug13_data==0xff: break
        psa0_12=(((code&0x80)<<5)|((code&0x40)<<6))&0x1000
        psa0_12|=((bb8[code]<<8)|bug13_data)&0x1fff
        rom_addr=(psa0_12 & ~0xff)<<2
        try: x_step=(128<<OBJ_FRAC)//x_scale
        except ZeroDivisionError: break
        x_acc=(psa0_12 & 0xff)<<(OBJ_FRAC+5)
        x=0
        newtile=1; dataend=0; data1=data2=0; xflip=0; opcd0_11=0; lasttile=0
        x_mask=0x3ff
        guard=0
        while True:
            guard+=1
            if guard>4000: break
            if newtile:
                low_addr=(x_acc>>(OBJ_FRAC+3))&x_mask
                if gxflip:
                    if BIT(psa0_12,11) or not BIT(psa0_12,12): xor_mask=0xf
                    elif not BIT(psa0_12,9): xor_mask=0x7
                    else: xor_mask=0x3
                    rom_addr2=rom_addr+(low_addr^xor_mask)
                else:
                    rom_addr2=rom_addr+low_addr
                bug17s_data=bug17s[rom_addr2 & 0x7fff]
                if (bug17s_data&0x40) and dataend: lasttile=1
                dataend|=(bug17s_data&0x40)
                bug16s_data=bug16s[rom_addr2 & 0x7fff]
                psbb0_15=(bug17s_data<<8)|bug16s_data
                psbb6_7=(psbb0_15 if BIT(psbb0_15,12) else (pctmp0_7<<6))&0xc0
                pscb0_11=((((psbb0_15 & ~0xc0)|psbb6_7)<<3)|((y_scale>>8)&7))&0x7fff
                rombank=((BIT(pctmp0_7,4)<<1)|BIT(psbb0_15,13))&3
                base=rombank*(0x8000*2)
                data1=pix[base+pscb0_11] if base+pscb0_11<len(pix) else 0
                d2i=base+pscb0_11+0x8000
                data2=pix[d2i] if d2i<len(pix) else 0
                xflip=gxflip ^ (0 if BIT(psbb0_15,15) else 1)
                bug18s_addr=((BIT(pctmp0_7,4)<<13)|(BIT(psbb0_15,13)<<12)|
                             (psbb0_15 & ~0xf0c0)|psbb6_7)
                bug18s_data=bug18s[bug18s_addr & (len(bug18s)-1)]
                opcd10_11=((pctmp0_7<<8)&0xc00)^0xc00
                opcd8_9=((pctmp0_7&0x60)<<3)
                opcd0_11=(opcd10_11|opcd8_9|bug18s_data)&0xfff
                newtile=0
            if x<x_stride:
                bit=(x_acc>>OBJ_FRAC)&7
                if xflip: bit^=7
                p=(((data1>>bit)&1)<<1)|((data2>>bit)&1)
                if not((not(opcd0_11&0x80)) and (not p)):
                    bb9_addr=((opcd0_11<<1)&0x600)|((opcd0_11&0x7f)<<2)|p
                    color=((opcd0_11>>6)&0x30)
                    if x&1: color=(~(color|bb9o[bb9_addr & 0x7ff]))&0x3f
                    else:   color=(~(color|bb9e[bb9_addr & 0x7ff]))&0x3f
                    pen=0x40|color
                    out[(x,y)]=pen
                    if x<minx:minx=x
                    if x>maxx:maxx=x
                    if y<miny:miny=y
                    if y>maxy:maxy=y
            if (((x_acc+x_step)>>(OBJ_FRAC+3))&x_mask)!=((x_acc>>(OBJ_FRAC+3))&x_mask):
                if lasttile: break
                newtile=1
            x=(x+1)&x_mask
            x_acc+=x_step
        y_scale+=y_step
    if maxx<0: return {},0,0,(0,0)
    return out,maxx-minx+1,maxy-miny+1,(minx,miny)
