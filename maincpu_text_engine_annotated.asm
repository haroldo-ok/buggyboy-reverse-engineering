; ============================================================================
; BUGGY BOY JR — MAIN-CPU TEXT / HUD RENDERER   (annotated)
; ----------------------------------------------------------------------------
; A display-list bytecode interpreter that paints the character/VRAM layer
; (score, speed, timer, menus, self-test, attract text).
;
; DISPLAY LIST (read through CS:SI):
;   word  : position/attribute  (di = VRAM offset; bit7 of hi = literal-attr)
;   byte  : length N
;   N x byte : character codes
;            code >  0x1F -> tile number, written to VRAM as stosw (AX=tile|attr)
;            code <= 0x1F -> control code (cursor / attribute), via plot_char_or_ctrl
;
; CONTROL CODES (table @ cs:0x2FCE):
;   0x0D CR newline      0x0A skip-N cells     0x11 set colour     0x1B ESC nl+col
;   0x1C right  0x1D left  0x1E up  0x1F down
;
; COLOUR TABLE @ cs:0x2FAA : 80 84 88 8C 90 94 98 9C A0 A4 .. C0 C4 C8 CC
;   (6-bit colour attribute in the high bits; [0x11ec] = current palette base)
;
; Variants: draw_strlist (row band +0x80), _row2, and _big (ASCII->tile,
;   double-height score/'title' font: tile = idx*2 + 0xB0, two rows).
; ============================================================================

plot_char_or_ctrl:
    F2FE6: b508         mov    ch, 8   ; control-code dispatch: scan 8-entry table @cs:0x2FCE (code,handler)
    F2FE8: bbce2f       mov    bx, 0x2fce
    F2FEB: 2e3807       cmp    byte ptr cs:[bx], al
    F2FEE: 7408         je     0xf2ff8
    F2FF0: 83c303       add    bx, 3
    F2FF3: fecd         dec    ch
    F2FF5: 75f4         jne    0xf2feb
    F2FF7: c3           ret    
    F2FF8: 43           inc    bx   ; match -> jmp word ptr cs:[bx+1]  (handler)
    F2FF9: 2eff27       jmp    word ptr cs:[bx]

ctrl_newline:
    F2FFC: 81e780ff     and    di, 0xff80   ; [0x0D] CR: di = (di & ~0x7F) + column
    F3000: 03fa         add    di, dx
    F3002: c3           ret    

ctrl_skipN:
    F3003: fec9         dec    cl   ; [0x0A] skip N: di += cs:[si]*2  (N cells)
    F3005: 743a         je     0xf3041
    F3007: 2e8a1c       mov    bl, byte ptr cs:[si]
    F300A: 46           inc    si
    F300B: d0e3         shl    bl, 1
    F300D: 32ff         xor    bh, bh
    F300F: 03fb         add    di, bx
    F3011: c3           ret    

ctrl_newline_col:
    F3012: fec9         dec    cl   ; [0x1B] ESC: newline then di += col*2
    F3014: 742b         je     0xf3041
    F3016: 2e8a1c       mov    bl, byte ptr cs:[si]
    F3019: 46           inc    si
    F301A: d0e3         shl    bl, 1
    F301C: 32ff         xor    bh, bh
    F301E: 81e780ff     and    di, 0xff80
    F3022: 03fb         add    di, bx
    F3024: c3           ret    

ctrl_set_attr:
    F3025: fec9         dec    cl   ; [0x11] set colour attribute from cs:[si] -> AH
    F3027: 7418         je     0xf3041
    F3029: 2e8a24       mov    ah, byte ptr cs:[si]
    F302C: 46           inc    si

strlist_setattr:
    F302D: f6c480       test   ah, 0x80   ; if AH.7 set: literal attr; else AH = colour_table[0x2FAA + [0x11ec]+AH]
    F3030: 7401         je     0xf3033
    F3032: c3           ret    
    F3033: 8a1eec11     mov    bl, byte ptr [0x11ec]   ; NVRAM/work RAM
    F3037: 02dc         add    bl, ah
    F3039: 32ff         xor    bh, bh
    F303B: 2e8aa7aa2f   mov    ah, byte ptr cs:[bx + 0x2faa]
    F3040: c3           ret    

ctrl_pad:
    F3041: fec1         inc    cl
    F3043: c3           ret    

ctrl_right:
    F3044: 83c702       add    di, 2   ; [0x1C] cursor right (+1 cell)
    F3047: c3           ret    

ctrl_left:
    F3048: 83ef02       sub    di, 2   ; [0x1D] cursor left (-1 cell)
    F304B: c3           ret    

ctrl_up:
    F304C: 8ac2         mov    al, dl   ; [0x1E] cursor up (di -= row)
    F304E: 80e280       and    dl, 0x80
    F3051: 2bfa         sub    di, dx
    F3053: 8ad0         mov    dl, al
    F3055: c3           ret    

ctrl_down:
    F3056: 8ac2         mov    al, dl   ; [0x1F] cursor down (di += row)
    F3058: 80e280       and    dl, 0x80
    F305B: 03fa         add    di, dx
    F305D: 8ad0         mov    dl, al
    F305F: c3           ret    

draw_strlist:
    F3060: 2e8b3c       mov    di, word ptr cs:[si]   ; di = cs:[si] (pos/attr word); si+=2
    F3063: 83c602       add    si, 2
    F3066: e8c4ff       call   0xf302d   ; call strlist_setattr; dx = (di & 0x7F)+0x80 (column)
    F3069: 80e4fe       and    ah, 0xfe
    F306C: 8bd7         mov    dx, di
    F306E: 81e27f00     and    dx, 0x7f
    F3072: 81c28000     add    dx, 0x80
    F3076: 2e8a0c       mov    cl, byte ptr cs:[si]   ; cl = length byte; loop:
    F3079: 46           inc    si
    F307A: 2eac         lodsb  al, byte ptr cs:[si]   ; al = cs:[si] (char); <=0x1F -> control; else stosw es:[di] (tile+attr)
    F307C: 3c1f         cmp    al, 0x1f
    F307E: 7705         ja     0xf3085
    F3080: e863ff       call   0xf2fe6
    F3083: eb01         jmp    0xf3086
    F3085: ab           stosw  word ptr es:[di], ax
    F3086: fec9         dec    cl
    F3088: 75f0         jne    0xf307a
    F308A: c3           ret    

draw_strlist_row2:
    F308B: 2e8b3c       mov    di, word ptr cs:[si]
    F308E: 83c602       add    si, 2
    F3091: 80e4fe       and    ah, 0xfe
    F3094: e896ff       call   0xf302d
    F3097: 8bd7         mov    dx, di
    F3099: 81e27f00     and    dx, 0x7f
    F309D: 81c28000     add    dx, 0x80
    F30A1: 2e8a0c       mov    cl, byte ptr cs:[si]
    F30A4: 46           inc    si
    F30A5: 2eac         lodsb  al, byte ptr cs:[si]
    F30A7: 3c1f         cmp    al, 0x1f
    F30A9: 7705         ja     0xf30b0
    F30AB: e838ff       call   0xf2fe6
    F30AE: eb03         jmp    0xf30b3
    F30B0: 243f         and    al, 0x3f
    F30B2: ab           stosw  word ptr es:[di], ax
    F30B3: fec9         dec    cl
    F30B5: 75ee         jne    0xf30a5
    F30B7: c3           ret    

draw_strlist_big:
    F30B8: 2e8b3c       mov    di, word ptr cs:[si]   ; big-text variant: ASCII->tile, double-height
    F30BB: 83c602       add    si, 2
    F30BE: e86cff       call   0xf302d
    F30C1: 8bd7         mov    dx, di
    F30C3: 81e27f00     and    dx, 0x7f
    F30C7: 81c20001     add    dx, 0x100
    F30CB: 2e8a0c       mov    cl, byte ptr cs:[si]
    F30CE: 46           inc    si
    F30CF: 2eac         lodsb  al, byte ptr cs:[si]
    F30D1: 3c1f         cmp    al, 0x1f
    F30D3: 7705         ja     0xf30da
    F30D5: e80eff       call   0xf2fe6
    F30D8: eb21         jmp    0xf30fb
    F30DA: 3c20         cmp    al, 0x20
    F30DC: 7412         je     0xf30f0
    F30DE: 3c41         cmp    al, 0x41   ; A-Z: al-0x37 ; 0-9: al-0x30
    F30E0: 7205         jb     0xf30e7
    F30E2: 2c37         sub    al, 0x37
    F30E4: eb03         jmp    0xf30e9
    F30E6: 90           nop    
    F30E7: 2c30         sub    al, 0x30
    F30E9: d0e0         shl    al, 1   ; tile = idx*2 + 0xB0 ; draw top half, di+0x7E, bottom half
    F30EB: 04b0         add    al, 0xb0
    F30ED: 80cc01       or     ah, 1
    F30F0: ab           stosw  word ptr es:[di], ax
    F30F1: 83c77e       add    di, 0x7e
    F30F4: fec0         inc    al
    F30F6: ab           stosw  word ptr es:[di], ax
    F30F7: 81ef8000     sub    di, 0x80
    F30FB: fec9         dec    cl
    F30FD: 75d0         jne    0xf30cf
    F30FF: c3           ret    

draw_strlist_big2:
    F3100: 2e8b3c       mov    di, word ptr cs:[si]
    F3103: 83c602       add    si, 2
    F3106: e824ff       call   0xf302d
    F3109: 8bd7         mov    dx, di
    F310B: 81e27f00     and    dx, 0x7f
    F310F: 81c20001     add    dx, 0x100