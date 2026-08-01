; ============================================================================
; BUGGY BOY JR — MAIN-CPU SELF-TEST / SERVICE SUITE   (annotated)
; ----------------------------------------------------------------------------
; Runs at power-on before the game. Its main job is a bidirectional HANDSHAKE
; with the Z80 sound CPU over shared RAM (main 0x10000 window <-> Z80 0xB000),
; using the byte at offset 0x8048:
;     main polls for 1  ->  writes 2  ->  waits 3  ->  writes 4  ->  waits 5 ...
; Each wait spins up to 0x5DC (1500) iterations, kicking the watchdog; a timeout
; means the sound board / shared RAM is dead -> jump to hardware_error.
;
; hardware_error: blanks the character screen, draws 'HARDWARE ERROR' and
;   'STATUS nn' (display list @ cs:0x26E) via the text engine, then loops
;   forever kicking the watchdog (the STATUS number identifies the failed step).
;
; Service mode (selftest_dispatch): relocates a 16-entry test table from
;   cs:0x2B6B into RAM 0x4000 and 'jmp bp' into the chosen test; includes
;   monitor grid/ramp pattern generators for screen alignment.
;
; NVRAM signatures: 0x5AA5 @ 0x3E66 (bookkeeping), 0xAA55 @ 0x3E5E (test config).
; The parallel math-CPU RAM test (walking-bit on shared RCRAM @0x1000) runs
;   independently at math-CPU reset (0x4000).
; ============================================================================

; ---- boot self-test handshake ----

selftest_boot:
    F007B: a102f0       mov    ax, word ptr [0xf002]   ; kick watchdog; bp=0x5DC (1500) timeout
    F007E: bddc05       mov    bp, 0x5dc
    F0081: e8ae01       call   0xf0232   ; read Z80 shared-RAM handshake byte
    F0084: 3c01         cmp    al, 1   ; expect '1' from Z80; else delay+retry until timeout
    F0086: 740c         je     0xf0094
    F0088: e8d901       call   0xf0264   ;  -> delay
    F008B: a102f0       mov    ax, word ptr [0xf002]   ; WATCHDOG rd / RESUME-MATH wr
    F008E: 4d           dec    bp
    F008F: 75f0         jne    0xf0081   ; timeout -> hardware_error
    F0091: e9f801       jmp    0xf028c   ;  -> hardware_error
    F0094: b002         mov    al, 2   ; got 1: write '2' to Z80
    F0096: e8b201       call   0xf024b   ;  -> z80ram_write
    F0099: bddc05       mov    bp, 0x5dc
    F009C: e8c501       call   0xf0264   ; wait for Z80 to answer '3' (timeout -> error)
    F009F: a102f0       mov    ax, word ptr [0xf002]   ; WATCHDOG rd / RESUME-MATH wr
    F00A2: e88d01       call   0xf0232   ;  -> z80ram_read
    F00A5: 4d           dec    bp
    F00A6: 7503         jne    0xf00ab
    F00A8: e9e101       jmp    0xf028c   ;  -> hardware_error
    F00AB: 3c03         cmp    al, 3
    F00AD: 75ed         jne    0xf009c
    F00AF: f70600b00100 test   word ptr [0xb000], 1   ; check [0xB000] status bit
    F00B5: 7402         je     0xf00b9
    F00B7: ebfe         jmp    0xf00b7   ;  -> F00B7
    F00B9: b004         mov    al, 4   ; write '4'; wait for '5' ...bidirectional shared-RAM test
    F00BB: e88d01       call   0xf024b   ;  -> z80ram_write
    F00BE: bddc05       mov    bp, 0x5dc
    F00C1: e8a001       call   0xf0264   ;  -> delay
    F00C4: a102f0       mov    ax, word ptr [0xf002]   ; WATCHDOG rd / RESUME-MATH wr
    F00C7: e86801       call   0xf0232   ;  -> z80ram_read
    F00CA: 4d           dec    bp
    F00CB: 7503         jne    0xf00d0
    F00CD: e9bc01       jmp    0xf028c   ;  -> hardware_error
    F00D0: 3c05         cmp    al, 5
    F00D2: 75ed         jne    0xf00c1
    F00D4: c7064c110000 mov    word ptr [0x114c], 0   ; NVRAM/work RAM
    F00DA: f70600b00100 test   word ptr [0xb000], 1   ; ROM (bug2s/bug5s)

; ---- Z80 shared-RAM access + delay ----

z80ram_read:
    F0232: c70600b00000 mov    word ptr [0xb000], 0   ; --- read Z80 shared RAM[0x8048]: halt Z80 ([B000]=0), read es:[0x10000+], release ---
    F0238: 9b           wait   
    F0239: 06           push   es
    F023A: b80010       mov    ax, 0x1000
    F023D: 8ec0         mov    es, ax
    F023F: 26a14880     mov    ax, word ptr es:[0x8048]   ; VRAM (char/text tilemap)
    F0243: 07           pop    es
    F0244: c70600b00100 mov    word ptr [0xb000], 1   ; ROM (bug2s/bug5s)
    F024A: c3           ret    

z80ram_write:
    F024B: c70600b00000 mov    word ptr [0xb000], 0   ; --- write AX to Z80 shared RAM[0x8048] (same halt/release) ---
    F0251: 9b           wait   
    F0252: 06           push   es
    F0253: bb0010       mov    bx, 0x1000
    F0256: 8ec3         mov    es, bx
    F0258: 26a34880     mov    word ptr es:[0x8048], ax   ; VRAM (char/text tilemap)
    F025C: 07           pop    es
    F025D: c70600b00100 mov    word ptr [0xb000], 1   ; ROM (bug2s/bug5s)
    F0263: c3           ret    

delay:
    F0264: b90a00       mov    cx, 0xa   ; busy-delay (cx=0x0A)
    F0267: 8bc0         mov    ax, ax
    F0269: 8bdb         mov    bx, bx
    F026B: e2fa         loop   0xf0267
    F026D: c3           ret    

error_msglist:
    F026E: 50           push   ax   ; display list: pos, len 0x0F, 'HARDWARE ERROR' / 'STATUS nn'
    F026F: 90           nop    

; ---- fatal error handler ----

hardware_error:
    F028C: fa           cli       ; --- FATAL: clear char screen (tile 0x20/attr 0xE0), draw error+STATUS, hang+watchdog ---
    F028D: bf0080       mov    di, 0x8000   ; di=0x8000; fill VRAM with 0xE020 (blank)
    F0290: b820e0       mov    ax, 0xe020
    F0293: b90010       mov    cx, 0x1000
    F0296: f3ab         rep stosw word ptr es:[di], ax
    F0298: a102f0       mov    ax, word ptr [0xf002]   ; WATCHDOG rd / RESUME-MATH wr
    F029B: c706fe9f00fc mov    word ptr [0x9ffe], 0xfc00   ; ROM (bug2s/bug5s)
    F02A1: be6e02       mov    si, 0x26e   ; si=0x26E error list; draw_strlist
    F02A4: b4e0         mov    ah, 0xe0
    F02A6: e8b72d       call   0xf3060   ;  -> F3060
    F02A9: a102f0       mov    ax, word ptr [0xf002]   ; WATCHDOG rd / RESUME-MATH wr
    F02AC: b4e0         mov    ah, 0xe0
    F02AE: e8af2d       call   0xf3060   ;  -> F3060
    F02B1: a102f0       mov    ax, word ptr [0xf002]   ; hang: kick watchdog forever (game halted)
    F02B4: ebfb         jmp    0xf02b1   ;  -> F02B1

; ---- service-mode dispatcher + pattern generators ----

selftest_dispatch:
    F2B6C: fd           std       ; relocate 16-entry test table cs:0x2B6B -> RAM 0x4000 (backward)
    F2B6D: be6b2b       mov    si, 0x2b6b
    F2B70: b91000       mov    cx, 0x10
    F2B73: bf0040       mov    di, 0x4000
    F2B76: 49           dec    cx
    F2B77: 890d         mov    word ptr [di], cx
    F2B79: 2eac         lodsb  al, byte ptr cs:[si]
    F2B7B: 894502       mov    word ptr [di + 2], ax
    F2B7E: 75f6         jne    0xf2b76
    F2B80: fc           cld    
    F2B81: ffe5         jmp    bp   ; jmp bp  (dispatch to selected test routine)
    F2B83: 07           pop    es

gen_grid_1k:
    F2B84: b8409c       mov    ax, 0x9c40   ; monitor grid pattern: 10 rows, value 0x9C40 step -0x3E8
    F2B87: b90a00       mov    cx, 0xa
    F2B8A: 8905         mov    word ptr [di], ax
    F2B8C: 895502       mov    word ptr [di + 2], dx
    F2B8F: 895d04       mov    word ptr [di + 4], bx
    F2B92: 83c706       add    di, 6
    F2B95: 2de803       sub    ax, 0x3e8
    F2B98: e2f0         loop   0xf2b8a
    F2B9A: b92800       mov    cx, 0x28
    F2B9D: 8905         mov    word ptr [di], ax
    F2B9F: 895502       mov    word ptr [di + 2], dx
    F2BA2: 895d04       mov    word ptr [di + 4], bx
    F2BA5: 83c706       add    di, 6
    F2BA8: 2d2c01       sub    ax, 0x12c
    F2BAB: e2f0         loop   0xf2b9d
    F2BAD: a102f0       mov    ax, word ptr [0xf002]   ; WATCHDOG rd / RESUME-MATH wr
    F2BB0: c3           ret    

gen_grid_100:
    F2BB1: b85046       mov    ax, 0x4650   ; monitor ramp: 100 steps from 0x4650
    F2BB4: b96400       mov    cx, 0x64
    F2BB7: 8905         mov    word ptr [di], ax
    F2BB9: 895502       mov    word ptr [di + 2], dx
    F2BBC: 895d04       mov    word ptr [di + 4], bx
    F2BBF: 83c706       add    di, 6
    F2BC2: 2d6400       sub    ax, 0x64
    F2BC5: e2f0         loop   0xf2bb7
    F2BC7: a102f0       mov    ax, word ptr [0xf002]   ; WATCHDOG rd / RESUME-MATH wr
    F2BCA: c3           ret    