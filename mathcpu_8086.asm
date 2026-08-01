; **************************************************************************
; * MATH CPU (Intel 8086 geometry coprocessor)
; * Buggy Boy Junior / Speed Buggy (Tatsumi, 1986) -- static disassembly 2026-08-01
; * ROM at phys 0x4000-0x7FFF, mirrored to 0xFC000-0xFFFFF (reset FFFD:0006).
; * cols: [*]=reachable  phys  seg:off  bytes  mnemonic  ; annotation
; **************************************************************************

; ========================================================================
; MATH-CPU ROM  phys 04000-07FFF  (segment 0000)
; ========================================================================
*            04000 0000:4000  bc0003             mov     sp, 0x300
*            04003 0000:4003  33c0               xor     ax, ax
*            04005 0000:4005  8ed8               mov     ds, ax
*            04007 0000:4007  8ec0               mov     es, ax
*            04009 0000:4009  8ed0               mov     ss, ax
*            0400B 0000:400B  b85aa5             mov     ax, 0xa55a
*            0400E 0000:400E  bb0010             mov     bx, 0x1000
*            04011 0000:4011  b90200             mov     cx, 2
*            04014 0000:4014  8be8               mov     bp, ax
*            04016 0000:4016  8907               mov     word ptr [bx], ax
*            04018 0000:4018  8b07               mov     ax, word ptr [bx]
*            0401A 0000:401A  3bc5               cmp     ax, bp
*            0401C 0000:401C  7403               je      0x4021
*            0401E 0000:401E  e95601             jmp     0x4177
*   L_04021: 04021 0000:4021  f7d5               not     bp
*            04023 0000:4023  892f               mov     word ptr [bx], bp
*            04025 0000:4025  8b07               mov     ax, word ptr [bx]
*            04027 0000:4027  3bc5               cmp     ax, bp
*            04029 0000:4029  7403               je      0x402e
*            0402B 0000:402B  e94901             jmp     0x4177
*   L_0402E: 0402E 0000:402E  83c302             add     bx, 2
*            04031 0000:4031  e2e1               loop    0x4014
*            04033 0000:4033  c7070080           mov     word ptr [bx], 0x8000
*            04037 0000:4037  b90600             mov     cx, 6
*            0403A 0000:403A  50                 push    ax
*            0403B 0000:403B  40                 inc     ax
*            0403C 0000:403C  e2fc               loop    0x403a
*            0403E 0000:403E  8bd8               mov     bx, ax
*            04040 0000:4040  b90600             mov     cx, 6
*            04043 0000:4043  4b                 dec     bx
*            04044 0000:4044  58                 pop     ax
*            04045 0000:4045  3bc3               cmp     ax, bx
*            04047 0000:4047  7403               je      0x404c
*            04049 0000:4049  e93201             jmp     0x417e
*   L_0404C: 0404C 0000:404C  e2f5               loop    0x4043
*            0404E 0000:404E  b90500             mov     cx, 5
*            04051 0000:4051  bc0a00             mov     sp, 0xa
*            04054 0000:4054  bbaa55             mov     bx, 0x55aa
*            04057 0000:4057  53                 push    bx
*            04058 0000:4058  f7d3               not     bx
*            0405A 0000:405A  53                 push    bx
*            0405B 0000:405B  f7d3               not     bx
*            0405D 0000:405D  53                 push    bx
*            0405E 0000:405E  58                 pop     ax
*            0405F 0000:405F  3bc3               cmp     ax, bx
*            04061 0000:4061  7403               je      0x4066
*            04063 0000:4063  e91801             jmp     0x417e
*   L_04066: 04066 0000:4066  f7d3               not     bx
*            04068 0000:4068  58                 pop     ax
*            04069 0000:4069  3bc3               cmp     ax, bx
*            0406B 0000:406B  7403               je      0x4070
*            0406D 0000:406D  e90e01             jmp     0x417e
*   L_04070: 04070 0000:4070  f7d3               not     bx
*            04072 0000:4072  58                 pop     ax
*            04073 0000:4073  3bc3               cmp     ax, bx
*            04075 0000:4075  7403               je      0x407a
*            04077 0000:4077  e90401             jmp     0x417e
*   L_0407A: 0407A 0000:407A  f7d3               not     bx
*            0407C 0000:407C  e2d9               loop    0x4057
*            0407E 0000:407E  bc0003             mov     sp, 0x300
*            04081 0000:4081  a1003f             mov     ax, word ptr [0x3f00]   ; MATH UNIT (mul/div/geometry)
*            04084 0000:4084  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04087 0000:4087  e84902             call    0x42d3
*            0408A 0000:408A  e8f115             call    0x567e
*            0408D 0000:408D  eb0f               jmp     0x409e
*   L_0408F: 0408F 0000:408F  bc0003             mov     sp, 0x300
*            04092 0000:4092  a1003f             mov     ax, word ptr [0x3f00]   ; MATH UNIT (mul/div/geometry)
*            04095 0000:4095  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04098 0000:4098  e83802             call    0x42d3
*            0409B 0000:409B  e8e015             call    0x567e
*   L_0409E: 0409E 0000:409E  e87002             call    0x4311
*            040A1 0000:40A1  bf0018             mov     di, 0x1800
*            040A4 0000:40A4  b98003             mov     cx, 0x380
*            040A7 0000:40A7  33c0               xor     ax, ax
*            040A9 0000:40A9  fc                 cld     
*            040AA 0000:40AA  f3ab               rep stosw word ptr es:[di], ax
*            040AC 0000:40AC  a3e024             mov     word ptr [0x24e0], ax   ; GAS latch
*            040AF 0000:40AF  a30603             mov     word ptr [0x306], ax   ; math_ram (shared)
*            040B2 0000:40B2  90                 nop     
*            040B3 0000:40B3  90                 nop     
*            040B4 0000:40B4  90                 nop     
*            040B5 0000:40B5  90                 nop     
*            040B6 0000:40B6  90                 nop     
*   L_040B7: 040B7 0000:40B7  33c0               xor     ax, ax
*            040B9 0000:40B9  a30010             mov     word ptr [0x1000], ax   ; RCRAM (road, shared)
*            040BC 0000:40BC  9b                 wait    
*            040BD 0000:40BD  fc                 cld     
*            040BE 0000:40BE  bf7203             mov     di, 0x372
*            040C1 0000:40C1  8b05               mov     ax, word ptr [di]
*            040C3 0000:40C3  a38010             mov     word ptr [0x1080], ax   ; RCRAM (road, shared)
*            040C6 0000:40C6  8bd8               mov     bx, ax
*            040C8 0000:40C8  80f404             xor     ah, 4
*            040CB 0000:40CB  ab                 stosw   word ptr es:[di], ax
*            040CC 0000:40CC  93                 xchg    bx, ax
*            040CD 0000:40CD  ab                 stosw   word ptr es:[di], ax
*            040CE 0000:40CE  81c30018           add     bx, 0x1800
*            040D2 0000:40D2  891d               mov     word ptr [di], bx
*            040D4 0000:40D4  befa03             mov     si, 0x3fa
*            040D7 0000:40D7  bffa1f             mov     di, 0x1ffa
*            040DA 0000:40DA  8b1e0603           mov     bx, word ptr [0x306]   ; math_ram (shared)
*            040DE 0000:40DE  43                 inc     bx
*   L_040DF: 040DF 0000:40DF  83c606             add     si, 6
*            040E2 0000:40E2  83c706             add     di, 6
*            040E5 0000:40E5  4b                 dec     bx
*            040E6 0000:40E6  7407               je      0x40ef
*            040E8 0000:40E8  b90500             mov     cx, 5
*            040EB 0000:40EB  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            040ED 0000:40ED  ebf0               jmp     0x40df
*   L_040EF: 040EF 0000:40EF  c705ffff           mov     word ptr [di], 0xffff
*            040F3 0000:40F3  be0006             mov     si, 0x600
*            040F6 0000:40F6  bb80ff             mov     bx, 0xff80
*            040F9 0000:40F9  b90b00             mov     cx, 0xb
*            040FC 0000:40FC  8b3f               mov     di, word ptr [bx]
*            040FE 0000:40FE  a5                 movsw   word ptr es:[di], word ptr [si]
*            040FF 0000:40FF  83c302             add     bx, 2
*            04102 0000:4102  e2f8               loop    0x40fc
*            04104 0000:4104  8b0e1610           mov     cx, word ptr [0x1016]   ; RCRAM (road, shared)
*            04108 0000:4108  be0011             mov     si, 0x1100
*            0410B 0000:410B  bf2006             mov     di, 0x620
*            0410E 0000:410E  e306               jcxz    0x4116
*            04110 0000:4110  a5                 movsw   word ptr es:[di], word ptr [si]
*            04111 0000:4111  83c606             add     si, 6
*            04114 0000:4114  e2fa               loop    0x4110
*   L_04116: 04116 0000:4116  33c0               xor     ax, ax
*            04118 0000:4118  f7d0               not     ax
*            0411A 0000:411A  a30010             mov     word ptr [0x1000], ax   ; RCRAM (road, shared)
*            0411D 0000:411D  be1610             mov     si, 0x1016
*            04120 0000:4120  bf0a03             mov     di, 0x30a
*            04123 0000:4123  b90300             mov     cx, 3
*            04126 0000:4126  33db               xor     bx, bx
*            04128 0000:4128  ad                 lodsw   ax, word ptr [si]
*            04129 0000:4129  03d8               add     bx, ax
*            0412B 0000:412B  ab                 stosw   word ptr es:[di], ax
*            0412C 0000:412C  e2fa               loop    0x4128
*            0412E 0000:412E  83fb20             cmp     bx, 0x20
*            04131 0000:4131  733a               jae     0x416d
*            04133 0000:4133  a10210             mov     ax, word ptr [0x1002]   ; RCRAM (road, shared)
*            04136 0000:4136  0a061606           or      al, byte ptr [0x616]   ; math_ram (shared)
*            0413A 0000:413A  a808               test    al, 8
*            0413C 0000:413C  750b               jne     0x4149
*   L_0413E: 0413E 0000:413E  a38003             mov     word ptr [0x380], ax   ; math_ram (shared)
*            04141 0000:4141  f6c4c2             test    ah, 0xc2
*            04144 0000:4144  750e               jne     0x4154
*            04146 0000:4146  e9800c             jmp     0x4dc9
*   L_04149: 04149 0000:4149  833e0e1074         cmp     word ptr [0x100e], 0x74   ; RCRAM (road, shared)
*            0414E 0000:414E  7fee               jg      0x413e
*            04150 0000:4150  24f7               and     al, 0xf7
*            04152 0000:4152  ebea               jmp     0x413e
*   L_04154: 04154 0000:4154  f6c480             test    ah, 0x80
*            04157 0000:4157  7403               je      0x415c
*            04159 0000:4159  e933ff             jmp     0x408f
*   L_0415C: 0415C 0000:415C  f6c440             test    ah, 0x40
*            0415F 0000:415F  7406               je      0x4167
*            04161 0000:4161  e86f01             call    0x42d3
*            04164 0000:4164  e950ff             jmp     0x40b7
*   L_04167: 04167 0000:4167  e86e01             call    0x42d8
*            0416A 0000:416A  e9b101             jmp     0x431e
*   L_0416D: 0416D 0000:416D  8bc3               mov     ax, bx
*            0416F 0000:416F  bb1f00             mov     bx, 0x1f
*            04172 0000:4172  bc1810             mov     sp, 0x1018
*            04175 0000:4175  eb07               jmp     0x417e
*   L_04177: 04177 0000:4177  8be3               mov     sp, bx
*            04179 0000:4179  83c402             add     sp, 2
*            0417C 0000:417C  8bdd               mov     bx, bp
*   L_0417E: 0417E 0000:417E  c6060104ff         mov     byte ptr [0x401], 0xff   ; math_ram (shared)
*            04183 0000:4183  8bd0               mov     dx, ax
*            04185 0000:4185  bf0018             mov     di, 0x1800
*            04188 0000:4188  b98003             mov     cx, 0x380
*            0418B 0000:418B  fc                 cld     
*            0418C 0000:418C  33c0               xor     ax, ax
*            0418E 0000:418E  f3ab               rep stosw word ptr es:[di], ax
*            04190 0000:4190  bd80ff             mov     bp, 0xff80
*            04193 0000:4193  b90b00             mov     cx, 0xb
*            04196 0000:4196  8b7e00             mov     di, word ptr [bp]
*            04199 0000:4199  8905               mov     word ptr [di], ax
*            0419B 0000:419B  83c502             add     bp, 2
*            0419E 0000:419E  e2f6               loop    0x4196
*            041A0 0000:41A0  a30010             mov     word ptr [0x1000], ax   ; RCRAM (road, shared)
*            041A3 0000:41A3  a3e024             mov     word ptr [0x24e0], ax   ; GAS latch
*            041A6 0000:41A6  c70602100020       mov     word ptr [0x1002], 0x2000   ; RCRAM (road, shared)
*            041AC 0000:41AC  90                 nop     
*   L_041AD: 041AD 0000:41AD  8b0e0210           mov     cx, word ptr [0x1002]   ; RCRAM (road, shared)
*            041B1 0000:41B1  81e1fff7           and     cx, 0xf7ff
*            041B5 0000:41B5  81f90080           cmp     cx, 0x8000
*            041B9 0000:41B9  75f2               jne     0x41ad
*            041BB 0000:41BB  8bc2               mov     ax, dx
*            041BD 0000:41BD  bf0014             mov     di, 0x1400
*            041C0 0000:41C0  bea6ff             mov     si, 0xffa6
*            041C3 0000:41C3  b91200             mov     cx, 0x12
*            041C6 0000:41C6  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            041C8 0000:41C8  83ec02             sub     sp, 2
*            041CB 0000:41CB  8bc8               mov     cx, ax
*            041CD 0000:41CD  8bc4               mov     ax, sp
*            041CF 0000:41CF  8beb               mov     bp, bx
*            041D1 0000:41D1  bb96ff             mov     bx, 0xff96
*            041D4 0000:41D4  8bd0               mov     dx, ax
*            041D6 0000:41D6  250f0f             and     ax, 0xf0f
*            041D9 0000:41D9  81e2f0f0           and     dx, 0xf0f0
*            041DD 0000:41DD  d1ca               ror     dx, 1
*            041DF 0000:41DF  d1ca               ror     dx, 1
*            041E1 0000:41E1  d1ca               ror     dx, 1
*            041E3 0000:41E3  d1ca               ror     dx, 1
*            041E5 0000:41E5  d7                 xlatb   
*            041E6 0000:41E6  86c6               xchg    dh, al
*            041E8 0000:41E8  d7                 xlatb   
*            041E9 0000:41E9  86c2               xchg    dl, al
*            041EB 0000:41EB  d7                 xlatb   
*            041EC 0000:41EC  86c4               xchg    ah, al
*            041EE 0000:41EE  d7                 xlatb   
*            041EF 0000:41EF  86c4               xchg    ah, al
*            041F1 0000:41F1  86c2               xchg    dl, al
*            041F3 0000:41F3  ab                 stosw   word ptr es:[di], ax
*            041F4 0000:41F4  8bc2               mov     ax, dx
*            041F6 0000:41F6  ab                 stosw   word ptr es:[di], ax
*            041F7 0000:41F7  a5                 movsw   word ptr es:[di], word ptr [si]
*            041F8 0000:41F8  a4                 movsb   byte ptr es:[di], byte ptr [si]
*            041F9 0000:41F9  8bc5               mov     ax, bp
*            041FB 0000:41FB  bb96ff             mov     bx, 0xff96
*            041FE 0000:41FE  8bd0               mov     dx, ax
*            04200 0000:4200  250f0f             and     ax, 0xf0f
*            04203 0000:4203  81e2f0f0           and     dx, 0xf0f0
*            04207 0000:4207  d1ca               ror     dx, 1
*            04209 0000:4209  d1ca               ror     dx, 1
*            0420B 0000:420B  d1ca               ror     dx, 1
*            0420D 0000:420D  d1ca               ror     dx, 1
*            0420F 0000:420F  d7                 xlatb   
*            04210 0000:4210  86c6               xchg    dh, al
*            04212 0000:4212  d7                 xlatb   
*            04213 0000:4213  86c2               xchg    dl, al
*            04215 0000:4215  d7                 xlatb   
*            04216 0000:4216  86c4               xchg    ah, al
*            04218 0000:4218  d7                 xlatb   
*            04219 0000:4219  86c4               xchg    ah, al
*            0421B 0000:421B  86c2               xchg    dl, al
*            0421D 0000:421D  ab                 stosw   word ptr es:[di], ax
*            0421E 0000:421E  8bc2               mov     ax, dx
*            04220 0000:4220  ab                 stosw   word ptr es:[di], ax
*            04221 0000:4221  a5                 movsw   word ptr es:[di], word ptr [si]
*            04222 0000:4222  a4                 movsb   byte ptr es:[di], byte ptr [si]
*            04223 0000:4223  8bc1               mov     ax, cx
*            04225 0000:4225  bb96ff             mov     bx, 0xff96
*            04228 0000:4228  8bd0               mov     dx, ax
*            0422A 0000:422A  250f0f             and     ax, 0xf0f
*            0422D 0000:422D  81e2f0f0           and     dx, 0xf0f0
*            04231 0000:4231  d1ca               ror     dx, 1
*            04233 0000:4233  d1ca               ror     dx, 1
*            04235 0000:4235  d1ca               ror     dx, 1
*            04237 0000:4237  d1ca               ror     dx, 1
*            04239 0000:4239  d7                 xlatb   
*            0423A 0000:423A  86c6               xchg    dh, al
*            0423C 0000:423C  d7                 xlatb   
*            0423D 0000:423D  86c2               xchg    dl, al
*            0423F 0000:423F  d7                 xlatb   
*            04240 0000:4240  86c4               xchg    ah, al
*            04242 0000:4242  d7                 xlatb   
*            04243 0000:4243  86c4               xchg    ah, al
*            04245 0000:4245  86c2               xchg    dl, al
*            04247 0000:4247  ab                 stosw   word ptr es:[di], ax
*            04248 0000:4248  8bc2               mov     ax, dx
*            0424A 0000:424A  ab                 stosw   word ptr es:[di], ax
*            0424B 0000:424B  c605ff             mov     byte ptr [di], 0xff
*            0424E 0000:424E  8bc1               mov     ax, cx
*            04250 0000:4250  e92bff             jmp     0x417e
             04253 0000:4253  3a1d               cmp     bl, byte ptr [di]
             04255 0000:4255  aa                 stosb   byte ptr es:[di], al
             04256 0000:4256  e684               out     0x84, al
             04258 0000:4258  fe00               inc     byte ptr [bx + si]
             0425A 0000:425A  c20572             ret     0x7205
             0425D 0000:425D  21864036           and     word ptr [bp + 0x3640], ax
             04261 0000:4261  0fc30a             movnti  dword ptr [bp + si], ecx
             04264 0000:4264  7221               jb      0x4287
             04266 0000:4266  864036             xchg    byte ptr [bx + si + 0x36], al
             04269 0000:4269  02c9               add     cl, cl
             0426B 0000:426B  2121               and     word ptr [bx + di], sp
             0426D 0000:426D  0022               add     byte ptr [bp + si], ah
             0426F 0000:426F  2da92a             sub     ax, 0x2aa9
             04272 0000:4272  e3a8               jcxz    0x421c
             04274 0000:4274  234e23             and     cx, word ptr [bp + 0x23]
             04277 0000:4277  46                 inc     si
             04278 0000:4278  c501               lds     ax, ptr [bx + di]
             0427A 0000:427A  1baac501           sbb     bp, word ptr [bp + si + 0x1c5]
             0427E 0000:427E  0100               add     word ptr [bx + si], ax
             04280 0000:4280  c511               lds     dx, ptr [bx + di]
             04282 0000:4282  2da901             sub     ax, 0x1a9
             04285 0000:4285  2540cd             and     ax, 0xcd40
             04288 0000:4288  c1a5cd755a         shl     word ptr [di + 0x75cd], 0x5a
*            0428D 0000:428D  3e0011             add     byte ptr ds:[bx + di], dl
*            04290 0000:4290  2540cd             and     ax, 0xcd40
*            04293 0000:4293  20a5b5c2           and     byte ptr [di - 0x3d4b], ah
*            04297 0000:4297  3c72               cmp     al, 0x72
*            04299 0000:4299  3e01c9             add     cx, cx
*            0429C 0000:429C  3e00c9             add     cl, cl
*            0429F 0000:429F  c9                 leave   
*            042A0 0000:42A0  cde4               int     0xe4
*            042A2 0000:42A2  58                 pop     ax
*            042A3 0000:42A3  3e0011             add     byte ptr ds:[bx + di], dl
*            042A6 0000:42A6  27                 daa     
*            042A7 0000:42A7  40                 inc     ax
*            042A8 0000:42A8  cd20               int     0x20
*            042AA 0000:42AA  a5                 movsw   word ptr es:[di], word ptr [si]
*            042AB 0000:42AB  b5ca               mov     ch, 0xca
*            042AD 0000:42AD  6a72               push    0x72
*            042AF 0000:42AF  3eff11             notrack call word ptr ds:[bx + di]
*            042B2 0000:42B2  2140cd             and     word ptr [bx + si - 0x33], ax
*            042B5 0000:42B5  20a5b5c2           and     byte ptr [di - 0x3d4b], ah
*            042B9 0000:42B9  647221             jb      0x42dd
*            042BC 0000:42BC  0000               add     byte ptr [bx + si], al
*            042BE 0000:42BE  2227               and     ah, byte ptr [bx]
*            042C0 0000:42C0  40                 inc     ax
*            042C1 0000:42C1  c3                 ret     
             042C2 0000:42C2  6a72               push    0x72
             042C4 0000:42C4  2101               and     word ptr [bx + di], ax
             042C6 0000:42C6  0122               add     word ptr [bp + si], sp
      042C8 0000:42C8  db   ''@!!\00'
             042CD 0000:42CD  222d               and     ch, byte ptr [di]
             042CF 0000:42CF  a90104             test    ax, 0x401
             042D2 0000:42D2  00c6               add     dh, al
             042D4 0000:42D4  06                 push    es
             042D5 0000:42D5  0104               add     word ptr [si], ax
             042D7 0000:42D7  ff8bd0bf           dec     word ptr [bp + di - 0x4030]
             042DB 0000:42DB  0018               add     byte ptr [bx + si], bl
*   L_042DD: 042DD 0000:42DD  b98003             mov     cx, 0x380
*            042E0 0000:42E0  fc                 cld     
*            042E1 0000:42E1  33c0               xor     ax, ax
*            042E3 0000:42E3  f3ab               rep stosw word ptr es:[di], ax
*            042E5 0000:42E5  c7060a106400       mov     word ptr [0x100a], 0x64   ; RCRAM (road, shared)
*            042EB 0000:42EB  a31c10             mov     word ptr [0x101c], ax   ; RCRAM (road, shared)
*            042EE 0000:42EE  a28003             mov     byte ptr [0x380], al   ; math_ram (shared)
*            042F1 0000:42F1  a31606             mov     word ptr [0x616], ax   ; math_ram (shared)
*            042F4 0000:42F4  b90b00             mov     cx, 0xb
*            042F7 0000:42F7  bf0006             mov     di, 0x600
*            042FA 0000:42FA  fc                 cld     
*            042FB 0000:42FB  f3ab               rep stosw word ptr es:[di], ax
*            042FD 0000:42FD  be0006             mov     si, 0x600
*            04300 0000:4300  bb80ff             mov     bx, 0xff80
*            04303 0000:4303  b90b00             mov     cx, 0xb
*            04306 0000:4306  8b3f               mov     di, word ptr [bx]
*            04308 0000:4308  a5                 movsw   word ptr es:[di], word ptr [si]
*            04309 0000:4309  83c302             add     bx, 2
*            0430C 0000:430C  e2f8               loop    0x4306
*            0430E 0000:430E  8bc2               mov     ax, dx
*            04310 0000:4310  c3                 ret     
*   L_04311: 04311 0000:4311  5b                 pop     bx
*            04312 0000:4312  fc                 cld     
*            04313 0000:4313  33c0               xor     ax, ax
*            04315 0000:4315  8bf8               mov     di, ax
*            04317 0000:4317  b9ff03             mov     cx, 0x3ff
*            0431A 0000:431A  f3ab               rep stosw word ptr es:[di], ax
*            0431C 0000:431C  53                 push    bx
*            0431D 0000:431D  c3                 ret     
*   L_0431E: 0431E 0000:431E  a18003             mov     ax, word ptr [0x380]   ; math_ram (shared)
*            04321 0000:4321  a808               test    al, 8
*            04323 0000:4323  7507               jne     0x432c
*            04325 0000:4325  b8b700             mov     ax, 0xb7
*            04328 0000:4328  50                 push    ax
*            04329 0000:4329  e93d04             jmp     0x4769
*   L_0432C: 0432C 0000:432C  fc                 cld     
*            0432D 0000:432D  a830               test    al, 0x30
*            0432F 0000:432F  740c               je      0x433d
*            04331 0000:4331  b430               mov     ah, 0x30
*            04333 0000:4333  22e0               and     ah, al
*            04335 0000:4335  80fc30             cmp     ah, 0x30
*            04338 0000:4338  7403               je      0x433d
*            0433A 0000:433A  e9f300             jmp     0x4430
*   L_0433D: 0433D 0000:433D  bf1003             mov     di, 0x310
*            04340 0000:4340  bbf000             mov     bx, 0xf0
*            04343 0000:4343  2b1e9603           sub     bx, word ptr [0x396]   ; math_ram (shared)
*            04347 0000:4347  031e1c10           add     bx, word ptr [0x101c]   ; RCRAM (road, shared)
*            0434B 0000:434B  d1e3               shl     bx, 1
*            0434D 0000:434D  8b8700f4           mov     ax, word ptr [bx - 0xc00]
*            04351 0000:4351  057400             add     ax, 0x74
*            04354 0000:4354  8bd0               mov     dx, ax
*            04356 0000:4356  80cc68             or      ah, 0x68
*            04359 0000:4359  ab                 stosw   word ptr es:[di], ax
*            0435A 0000:435A  b800b8             mov     ax, 0xb800
*            0435D 0000:435D  ab                 stosw   word ptr es:[di], ax
*            0435E 0000:435E  8b1e1010           mov     bx, word ptr [0x1010]   ; RCRAM (road, shared)
*            04362 0000:4362  8b8750f5           mov     ax, word ptr [bx - 0xab0]
*            04366 0000:4366  ab                 stosw   word ptr es:[di], ax
*            04367 0000:4367  8bc8               mov     cx, ax
*            04369 0000:4369  b800ff             mov     ax, 0xff00
*            0436C 0000:436C  ab                 stosw   word ptr es:[di], ax
*            0436D 0000:436D  bbf000             mov     bx, 0xf0
*            04370 0000:4370  2b1e9803           sub     bx, word ptr [0x398]   ; math_ram (shared)
*            04374 0000:4374  031e1c10           add     bx, word ptr [0x101c]   ; RCRAM (road, shared)
*            04378 0000:4378  d1e3               shl     bx, 1
*            0437A 0000:437A  8b8700f4           mov     ax, word ptr [bx - 0xc00]
*            0437E 0000:437E  057400             add     ax, 0x74
*            04381 0000:4381  80cc68             or      ah, 0x68
*            04384 0000:4384  ab                 stosw   word ptr es:[di], ax
*            04385 0000:4385  b800c0             mov     ax, 0xc000
*            04388 0000:4388  ab                 stosw   word ptr es:[di], ax
*            04389 0000:4389  8bc1               mov     ax, cx
*            0438B 0000:438B  ab                 stosw   word ptr es:[di], ax
*            0438C 0000:438C  b88000             mov     ax, 0x80
*            0438F 0000:438F  ab                 stosw   word ptr es:[di], ax
*            04390 0000:4390  be1003             mov     si, 0x310
*            04393 0000:4393  8b14               mov     dx, word ptr [si]
*            04395 0000:4395  c70604032003       mov     word ptr [0x304], 0x320   ; math_ram (shared)
*            0439B 0000:439B  e8f804             call    0x4896
*            0439E 0000:439E  8b14               mov     dx, word ptr [si]
*            043A0 0000:43A0  c70604032c03       mov     word ptr [0x304], 0x32c   ; math_ram (shared)
*            043A6 0000:43A6  e8ed04             call    0x4896
*            043A9 0000:43A9  8b1e0a03           mov     bx, word ptr [0x30a]   ; math_ram (shared)
*            043AD 0000:43AD  d1e3               shl     bx, 1
*            043AF 0000:43AF  d1e3               shl     bx, 1
*            043B1 0000:43B1  d1e3               shl     bx, 1
*            043B3 0000:43B3  a11803             mov     ax, word ptr [0x318]   ; math_ram (shared)
*            043B6 0000:43B6  80cce8             or      ah, 0xe8
*            043B9 0000:43B9  89870811           mov     word ptr [bx + 0x1108], ax
*            043BD 0000:43BD  c7870a112c03       mov     word ptr [bx + 0x110a], 0x32c
*            043C3 0000:43C3  a11003             mov     ax, word ptr [0x310]   ; math_ram (shared)
*            043C6 0000:43C6  80cce8             or      ah, 0xe8
*            043C9 0000:43C9  89870011           mov     word ptr [bx + 0x1100], ax
*            043CD 0000:43CD  c78702112003       mov     word ptr [bx + 0x1102], 0x320
*            043D3 0000:43D3  833e0c1074         cmp     word ptr [0x100c], 0x74   ; RCRAM (road, shared)
*            043D8 0000:43D8  770c               ja      0x43e6
*            043DA 0000:43DA  83060a0302         add     word ptr [0x30a], 2   ; math_ram (shared)
*            043DF 0000:43DF  b88305             mov     ax, 0x583
*            043E2 0000:43E2  50                 push    ax
*            043E3 0000:43E3  e98303             jmp     0x4769
*   L_043E6: 043E6 0000:43E6  a10a03             mov     ax, word ptr [0x30a]   ; math_ram (shared)
*            043E9 0000:43E9  3c02               cmp     al, 2
*            043EB 0000:43EB  7c40               jl      0x442d
*            043ED 0000:43ED  813e0c108403       cmp     word ptr [0x100c], 0x384   ; RCRAM (road, shared)
*            043F3 0000:43F3  720a               jb      0x43ff
*            043F5 0000:43F5  c6062103f0         mov     byte ptr [0x321], 0xf0   ; math_ram (shared)
*            043FA 0000:43FA  c6062d03f0         mov     byte ptr [0x32d], 0xf0   ; math_ram (shared)
*   L_043FF: 043FF 0000:43FF  8bd8               mov     bx, ax
*            04401 0000:4401  0402               add     al, 2
*            04403 0000:4403  a30a03             mov     word ptr [0x30a], ax   ; math_ram (shared)
*            04406 0000:4406  4b                 dec     bx
*            04407 0000:4407  d1e3               shl     bx, 1
*            04409 0000:4409  d1e3               shl     bx, 1
*            0440B 0000:440B  d1e3               shl     bx, 1
*            0440D 0000:440D  8db70011           lea     si, [bx + 0x1100]
*            04411 0000:4411  56                 push    si
*            04412 0000:4412  8b14               mov     dx, word ptr [si]
*            04414 0000:4414  c70604033803       mov     word ptr [0x304], 0x338   ; math_ram (shared)
*            0441A 0000:441A  e87904             call    0x4896
*            0441D 0000:441D  5e                 pop     si
*            0441E 0000:441E  810c00e8           or      word ptr [si], 0xe800
*            04422 0000:4422  c744023803         mov     word ptr [si + 2], 0x338
*            04427 0000:4427  83ee08             sub     si, 8
*            0442A 0000:442A  e93601             jmp     0x4563
*   L_0442D: 0442D 0000:442D  e9f00d             jmp     0x5220
*   L_04430: 04430 0000:4430  33f6               xor     si, si
*            04432 0000:4432  a801               test    al, 1
*            04434 0000:4434  7403               je      0x4439
*            04436 0000:4436  be1000             mov     si, 0x10
*   L_04439: 04439 0000:4439  a810               test    al, 0x10
*            0443B 0000:443B  7503               jne     0x4440
*            0443D 0000:443D  e9a200             jmp     0x44e2
*   L_04440: 04440 0000:4440  bf1003             mov     di, 0x310
*            04443 0000:4443  bbf000             mov     bx, 0xf0
*            04446 0000:4446  2b1e9603           sub     bx, word ptr [0x396]   ; math_ram (shared)
*            0444A 0000:444A  031e1c10           add     bx, word ptr [0x101c]   ; RCRAM (road, shared)
*            0444E 0000:444E  d1e3               shl     bx, 1
*            04450 0000:4450  8b8700f4           mov     ax, word ptr [bx - 0xc00]
*            04454 0000:4454  057400             add     ax, 0x74
*            04457 0000:4457  8bd0               mov     dx, ax
*            04459 0000:4459  80cca8             or      ah, 0xa8
*            0445C 0000:445C  ab                 stosw   word ptr es:[di], ax
*            0445D 0000:445D  b800d0             mov     ax, 0xd000
*            04460 0000:4460  ab                 stosw   word ptr es:[di], ax
*            04461 0000:4461  8b1e1010           mov     bx, word ptr [0x1010]   ; RCRAM (road, shared)
*            04465 0000:4465  8b8050f5           mov     ax, word ptr [bx + si - 0xab0]
*            04469 0000:4469  ab                 stosw   word ptr es:[di], ax
*            0446A 0000:446A  8be8               mov     bp, ax
*            0446C 0000:446C  b8a0fe             mov     ax, 0xfea0
*            0446F 0000:446F  ab                 stosw   word ptr es:[di], ax
*            04470 0000:4470  be1003             mov     si, 0x310
*            04473 0000:4473  8b14               mov     dx, word ptr [si]
*            04475 0000:4475  c70604032003       mov     word ptr [0x304], 0x320   ; math_ram (shared)
*            0447B 0000:447B  e81804             call    0x4896
*            0447E 0000:447E  8b1e0a03           mov     bx, word ptr [0x30a]   ; math_ram (shared)
*            04482 0000:4482  d1e3               shl     bx, 1
*            04484 0000:4484  d1e3               shl     bx, 1
*            04486 0000:4486  d1e3               shl     bx, 1
*            04488 0000:4488  a11003             mov     ax, word ptr [0x310]   ; math_ram (shared)
*            0448B 0000:448B  80cce8             or      ah, 0xe8
*            0448E 0000:448E  89870011           mov     word ptr [bx + 0x1100], ax
*            04492 0000:4492  c78702112003       mov     word ptr [bx + 0x1102], 0x320
*            04498 0000:4498  833e0c1074         cmp     word ptr [0x100c], 0x74   ; RCRAM (road, shared)
*            0449D 0000:449D  770b               ja      0x44aa
*            0449F 0000:449F  ff060a03           inc     word ptr [0x30a]   ; math_ram (shared)
*            044A3 0000:44A3  b88305             mov     ax, 0x583
*            044A6 0000:44A6  50                 push    ax
*            044A7 0000:44A7  e9bf02             jmp     0x4769
*   L_044AA: 044AA 0000:44AA  a10a03             mov     ax, word ptr [0x30a]   ; math_ram (shared)
*            044AD 0000:44AD  3c01               cmp     al, 1
*            044AF 0000:44AF  7c2e               jl      0x44df
*            044B1 0000:44B1  8bd8               mov     bx, ax
*            044B3 0000:44B3  40                 inc     ax
*            044B4 0000:44B4  a30a03             mov     word ptr [0x30a], ax   ; math_ram (shared)
*            044B7 0000:44B7  4b                 dec     bx
*            044B8 0000:44B8  d1e3               shl     bx, 1
*            044BA 0000:44BA  d1e3               shl     bx, 1
*            044BC 0000:44BC  d1e3               shl     bx, 1
*            044BE 0000:44BE  8db70011           lea     si, [bx + 0x1100]
*            044C2 0000:44C2  56                 push    si
*            044C3 0000:44C3  8b14               mov     dx, word ptr [si]
*            044C5 0000:44C5  c70604033803       mov     word ptr [0x304], 0x338   ; math_ram (shared)
*            044CB 0000:44CB  e8c803             call    0x4896
*            044CE 0000:44CE  5e                 pop     si
*            044CF 0000:44CF  810c00e8           or      word ptr [si], 0xe800
*            044D3 0000:44D3  c744023803         mov     word ptr [si + 2], 0x338
*            044D8 0000:44D8  b88305             mov     ax, 0x583
*            044DB 0000:44DB  50                 push    ax
*            044DC 0000:44DC  e98a02             jmp     0x4769
*   L_044DF: 044DF 0000:44DF  e94bff             jmp     0x442d
*   L_044E2: 044E2 0000:44E2  bf1803             mov     di, 0x318
*            044E5 0000:44E5  bbf000             mov     bx, 0xf0
*            044E8 0000:44E8  2b1e9803           sub     bx, word ptr [0x398]   ; math_ram (shared)
*            044EC 0000:44EC  031e1c10           add     bx, word ptr [0x101c]   ; RCRAM (road, shared)
*            044F0 0000:44F0  d1e3               shl     bx, 1
*            044F2 0000:44F2  8b8700f4           mov     ax, word ptr [bx - 0xc00]
*            044F6 0000:44F6  057400             add     ax, 0x74
*            044F9 0000:44F9  80cca8             or      ah, 0xa8
*            044FC 0000:44FC  ab                 stosw   word ptr es:[di], ax
*            044FD 0000:44FD  b800d0             mov     ax, 0xd000
*            04500 0000:4500  ab                 stosw   word ptr es:[di], ax
*            04501 0000:4501  8b1e1010           mov     bx, word ptr [0x1010]   ; RCRAM (road, shared)
*            04505 0000:4505  8b8050f5           mov     ax, word ptr [bx + si - 0xab0]
*            04509 0000:4509  80cc80             or      ah, 0x80
*            0450C 0000:450C  ab                 stosw   word ptr es:[di], ax
*            0450D 0000:450D  b88000             mov     ax, 0x80
*            04510 0000:4510  ab                 stosw   word ptr es:[di], ax
*            04511 0000:4511  be1803             mov     si, 0x318
*            04514 0000:4514  8b14               mov     dx, word ptr [si]
*            04516 0000:4516  c70604032c03       mov     word ptr [0x304], 0x32c   ; math_ram (shared)
*            0451C 0000:451C  e87703             call    0x4896
*            0451F 0000:451F  8b1e0a03           mov     bx, word ptr [0x30a]   ; math_ram (shared)
*            04523 0000:4523  d1e3               shl     bx, 1
*            04525 0000:4525  d1e3               shl     bx, 1
*            04527 0000:4527  d1e3               shl     bx, 1
*            04529 0000:4529  a11803             mov     ax, word ptr [0x318]   ; math_ram (shared)
*            0452C 0000:452C  80cce8             or      ah, 0xe8
*            0452F 0000:452F  89870011           mov     word ptr [bx + 0x1100], ax
*            04533 0000:4533  c78702112c03       mov     word ptr [bx + 0x1102], 0x32c
*            04539 0000:4539  833e0c1074         cmp     word ptr [0x100c], 0x74   ; RCRAM (road, shared)
*            0453E 0000:453E  770b               ja      0x454b
*            04540 0000:4540  ff060a03           inc     word ptr [0x30a]   ; math_ram (shared)
*            04544 0000:4544  b88305             mov     ax, 0x583
*            04547 0000:4547  50                 push    ax
*            04548 0000:4548  e91e02             jmp     0x4769
*   L_0454B: 0454B 0000:454B  a10a03             mov     ax, word ptr [0x30a]   ; math_ram (shared)
*            0454E 0000:454E  3c01               cmp     al, 1
*            04550 0000:4550  7c2e               jl      0x4580
*            04552 0000:4552  8bd8               mov     bx, ax
*            04554 0000:4554  40                 inc     ax
*            04555 0000:4555  a30a03             mov     word ptr [0x30a], ax   ; math_ram (shared)
*            04558 0000:4558  4b                 dec     bx
*            04559 0000:4559  d1e3               shl     bx, 1
*            0455B 0000:455B  d1e3               shl     bx, 1
*            0455D 0000:455D  d1e3               shl     bx, 1
*            0455F 0000:455F  8db70011           lea     si, [bx + 0x1100]
*   L_04563: 04563 0000:4563  56                 push    si
*            04564 0000:4564  8b14               mov     dx, word ptr [si]
*            04566 0000:4566  c70604034403       mov     word ptr [0x304], 0x344   ; math_ram (shared)
*            0456C 0000:456C  e82703             call    0x4896
*            0456F 0000:456F  5e                 pop     si
*            04570 0000:4570  810c00e8           or      word ptr [si], 0xe800
*            04574 0000:4574  c744024403         mov     word ptr [si + 2], 0x344
*            04579 0000:4579  b88305             mov     ax, 0x583
*            0457C 0000:457C  50                 push    ax
*            0457D 0000:457D  e9e901             jmp     0x4769
*   L_04580: 04580 0000:4580  e9aafe             jmp     0x442d
             04583 0000:4583  a08003             mov     al, byte ptr [0x380]   ; math_ram (shared)
      04586 0000:4586  db   '$0< u'
             0458B 0000:458B  03e9               add     bp, cx
             0458D 0000:458D  a7                 cmpsw   word ptr [si], word ptr es:[di]
             0458E 0000:458E  008b3e2a           add     byte ptr [bp + di + 0x2a3e], cl
             04592 0000:4592  03a12803           add     sp, word ptr [bx + di + 0x328]
*            04596 0000:4596  be0804             mov     si, 0x408
*            04599 0000:4599  8b169c03           mov     dx, word ptr [0x39c]   ; math_ram (shared)
*            0459D 0000:459D  8b1ef003           mov     bx, word ptr [0x3f0]   ; math_ram (shared)
*            045A1 0000:45A1  f606800301         test    byte ptr [0x380], 1   ; math_ram (shared)
*            045A6 0000:45A6  7408               je      0x45b0
*            045A8 0000:45A8  03169a03           add     dx, word ptr [0x39a]   ; math_ram (shared)
*            045AC 0000:45AC  2b169603           sub     dx, word ptr [0x396]   ; math_ram (shared)
*   L_045B0: 045B0 0000:45B0  2bd3               sub     dx, bx
*            045B2 0000:45B2  7904               jns     0x45b8
*            045B4 0000:45B4  2bc2               sub     ax, dx
*            045B6 0000:45B6  8905               mov     word ptr [di], ax
*   L_045B8: 045B8 0000:45B8  2b1ea203           sub     bx, word ptr [0x3a2]   ; math_ram (shared)
*            045BC 0000:45BC  7904               jns     0x45c2
*            045BE 0000:45BE  03c3               add     ax, bx
*            045C0 0000:45C0  8905               mov     word ptr [di], ax
*   L_045C2: 045C2 0000:45C2  3bfe               cmp     di, si
*            045C4 0000:45C4  7423               je      0x45e9
*            045C6 0000:45C6  bb8011             mov     bx, 0x1180
*            045C9 0000:45C9  8b161003           mov     dx, word ptr [0x310]   ; math_ram (shared)
*            045CD 0000:45CD  81e2ff07           and     dx, 0x7ff
*   L_045D1: 045D1 0000:45D1  3904               cmp     word ptr [si], ax
*            045D3 0000:45D3  7d0a               jge     0x45df
*            045D5 0000:45D5  807cf8e0           cmp     byte ptr [si - 8], 0xe0
*            045D9 0000:45D9  7321               jae     0x45fc
*   L_045DB: 045DB 0000:45DB  c644f9f0           mov     byte ptr [si - 7], 0xf0
*   L_045DF: 045DF 0000:45DF  83c610             add     si, 0x10
*            045E2 0000:45E2  83c308             add     bx, 8
*            045E5 0000:45E5  3bfe               cmp     di, si
*            045E7 0000:45E7  75e8               jne     0x45d1
*   L_045E9: 045E9 0000:45E9  833e0c1074         cmp     word ptr [0x100c], 0x74   ; RCRAM (road, shared)
*            045EE 0000:45EE  7718               ja      0x4608
*   L_045F0: 045F0 0000:45F0  a08003             mov     al, byte ptr [0x380]   ; math_ram (shared)
*            045F3 0000:45F3  2430               and     al, 0x30
*            045F5 0000:45F5  3c10               cmp     al, 0x10
*            045F7 0000:45F7  753d               jne     0x4636
*            045F9 0000:45F9  e99d00             jmp     0x4699
*   L_045FC: 045FC 0000:45FC  8b2f               mov     bp, word ptr [bx]
*            045FE 0000:45FE  81e5ff07           and     bp, 0x7ff
*            04602 0000:4602  3bea               cmp     bp, dx
*            04604 0000:4604  73d5               jae     0x45db
*            04606 0000:4606  ebd7               jmp     0x45df
*   L_04608: 04608 0000:4608  8b0e4203           mov     cx, word ptr [0x342]   ; math_ram (shared)
*            0460C 0000:460C  a14003             mov     ax, word ptr [0x340]   ; math_ram (shared)
*            0460F 0000:460F  3bf9               cmp     di, cx
*            04611 0000:4611  74dd               je      0x45f0
*            04613 0000:4613  8b1e0a03           mov     bx, word ptr [0x30a]   ; math_ram (shared)
*            04617 0000:4617  d1e3               shl     bx, 1
*            04619 0000:4619  d1e3               shl     bx, 1
*            0461B 0000:461B  d1e3               shl     bx, 1
*            0461D 0000:461D  8b97f810           mov     dx, word ptr [bx + 0x10f8]
*            04621 0000:4621  81e2ff07           and     dx, 0x7ff
*   L_04625: 04625 0000:4625  83c710             add     di, 0x10
*            04628 0000:4628  3bf9               cmp     di, cx
*            0462A 0000:462A  74c4               je      0x45f0
*            0462C 0000:462C  3905               cmp     word ptr [di], ax
*            0462E 0000:462E  7df5               jge     0x4625
*            04630 0000:4630  c645f9f0           mov     byte ptr [di - 7], 0xf0
*            04634 0000:4634  ebef               jmp     0x4625
*   L_04636: 04636 0000:4636  8b3e3603           mov     di, word ptr [0x336]   ; math_ram (shared)
*            0463A 0000:463A  a13403             mov     ax, word ptr [0x334]   ; math_ram (shared)
*            0463D 0000:463D  be0804             mov     si, 0x408
*            04640 0000:4640  8b16f203           mov     dx, word ptr [0x3f2]   ; math_ram (shared)
*            04644 0000:4644  8bda               mov     bx, dx
*            04646 0000:4646  f606800301         test    byte ptr [0x380], 1   ; math_ram (shared)
*            0464B 0000:464B  7408               je      0x4655
*            0464D 0000:464D  03169a03           add     dx, word ptr [0x39a]   ; math_ram (shared)
*            04651 0000:4651  2b169803           sub     dx, word ptr [0x398]   ; math_ram (shared)
*   L_04655: 04655 0000:4655  2b16a203           sub     dx, word ptr [0x3a2]   ; math_ram (shared)
*            04659 0000:4659  7904               jns     0x465f
*            0465B 0000:465B  03c2               add     ax, dx
*            0465D 0000:465D  8905               mov     word ptr [di], ax
*   L_0465F: 0465F 0000:465F  8b169c03           mov     dx, word ptr [0x39c]   ; math_ram (shared)
*            04663 0000:4663  2bd3               sub     dx, bx
*            04665 0000:4665  7904               jns     0x466b
*            04667 0000:4667  2bc2               sub     ax, dx
*            04669 0000:4669  8905               mov     word ptr [di], ax
*   L_0466B: 0466B 0000:466B  3bfe               cmp     di, si
*            0466D 0000:466D  7423               je      0x4692
*            0466F 0000:466F  bb8011             mov     bx, 0x1180
*            04672 0000:4672  8b161803           mov     dx, word ptr [0x318]   ; math_ram (shared)
*            04676 0000:4676  81e2ff07           and     dx, 0x7ff
*   L_0467A: 0467A 0000:467A  3904               cmp     word ptr [si], ax
*            0467C 0000:467C  7e0a               jle     0x4688
*            0467E 0000:467E  807cf8e0           cmp     byte ptr [si - 8], 0xe0
*            04682 0000:4682  731f               jae     0x46a3
*   L_04684: 04684 0000:4684  c644f9f0           mov     byte ptr [si - 7], 0xf0
*   L_04688: 04688 0000:4688  83c610             add     si, 0x10
*            0468B 0000:468B  83c308             add     bx, 8
*            0468E 0000:468E  3bfe               cmp     di, si
*            04690 0000:4690  75e8               jne     0x467a
*   L_04692: 04692 0000:4692  833e0c1074         cmp     word ptr [0x100c], 0x74   ; RCRAM (road, shared)
*            04697 0000:4697  7716               ja      0x46af
*   L_04699: 04699 0000:4699  f606800301         test    byte ptr [0x380], 1   ; math_ram (shared)
*            0469E 0000:469E  753d               jne     0x46dd
*            046A0 0000:46A0  e97d0b             jmp     0x5220
*   L_046A3: 046A3 0000:46A3  8b2f               mov     bp, word ptr [bx]
*            046A5 0000:46A5  81e5ff07           and     bp, 0x7ff
*            046A9 0000:46A9  3bea               cmp     bp, dx
*            046AB 0000:46AB  73d7               jae     0x4684
*            046AD 0000:46AD  ebd9               jmp     0x4688
*   L_046AF: 046AF 0000:46AF  8b0e4e03           mov     cx, word ptr [0x34e]   ; math_ram (shared)
*            046B3 0000:46B3  a14c03             mov     ax, word ptr [0x34c]   ; math_ram (shared)
*            046B6 0000:46B6  3bf9               cmp     di, cx
*            046B8 0000:46B8  74df               je      0x4699
*            046BA 0000:46BA  8b1e0a03           mov     bx, word ptr [0x30a]   ; math_ram (shared)
*            046BE 0000:46BE  d1e3               shl     bx, 1
*            046C0 0000:46C0  d1e3               shl     bx, 1
*            046C2 0000:46C2  d1e3               shl     bx, 1
*            046C4 0000:46C4  8b97f010           mov     dx, word ptr [bx + 0x10f0]
*            046C8 0000:46C8  81e2ff07           and     dx, 0x7ff
*   L_046CC: 046CC 0000:46CC  83c710             add     di, 0x10
*            046CF 0000:46CF  3bf9               cmp     di, cx
*            046D1 0000:46D1  74c6               je      0x4699
*            046D3 0000:46D3  3905               cmp     word ptr [di], ax
*            046D5 0000:46D5  7ef5               jle     0x46cc
*            046D7 0000:46D7  c645f9f0           mov     byte ptr [di - 7], 0xf0
*            046DB 0000:46DB  ebef               jmp     0x46cc
*   L_046DD: 046DD 0000:46DD  f606800320         test    byte ptr [0x380], 0x20   ; math_ram (shared)
*            046E2 0000:46E2  7528               jne     0x470c
*            046E4 0000:46E4  8b2e1003           mov     bp, word ptr [0x310]   ; math_ram (shared)
*   L_046E8: 046E8 0000:46E8  81e5ff07           and     bp, 0x7ff
*            046EC 0000:46EC  8b0e0603           mov     cx, word ptr [0x306]   ; math_ram (shared)
*            046F0 0000:46F0  8bd9               mov     bx, cx
*            046F2 0000:46F2  bf0004             mov     di, 0x400
*            046F5 0000:46F5  803da8             cmp     byte ptr [di], 0xa8
*            046F8 0000:46F8  7418               je      0x4712
*            046FA 0000:46FA  803dac             cmp     byte ptr [di], 0xac
*            046FD 0000:46FD  7413               je      0x4712
*            046FF 0000:46FF  803db0             cmp     byte ptr [di], 0xb0
*            04702 0000:4702  740e               je      0x4712
*            04704 0000:4704  83c710             add     di, 0x10
*            04707 0000:4707  e2ec               loop    0x46f5
*   L_04709: 04709 0000:4709  e9140b             jmp     0x5220
*   L_0470C: 0470C 0000:470C  8b2e1803           mov     bp, word ptr [0x318]   ; math_ram (shared)
*            04710 0000:4710  ebd6               jmp     0x46e8
*   L_04712: 04712 0000:4712  2bd9               sub     bx, cx
*            04714 0000:4714  8a3e1810           mov     bh, byte ptr [0x1018]   ; RCRAM (road, shared)
*            04718 0000:4718  22ff               and     bh, bh
*            0471A 0000:471A  74ed               je      0x4709
*            0471C 0000:471C  be0004             mov     si, 0x400
*            0471F 0000:471F  bf8011             mov     di, 0x1180
*   L_04722: 04722 0000:4722  8b05               mov     ax, word ptr [di]
*            04724 0000:4724  25ff07             and     ax, 0x7ff
*            04727 0000:4727  3bc5               cmp     ax, bp
*            04729 0000:4729  760f               jbe     0x473a
*            0472B 0000:472B  83c610             add     si, 0x10
*   L_0472E: 0472E 0000:472E  83c708             add     di, 8
*            04731 0000:4731  fecb               dec     bl
*            04733 0000:4733  fecf               dec     bh
*            04735 0000:4735  75eb               jne     0x4722
*            04737 0000:4737  e9e60a             jmp     0x5220
*   L_0473A: 0473A 0000:473A  57                 push    di
*            0473B 0000:473B  56                 push    si
*            0473C 0000:473C  bf5003             mov     di, 0x350
*            0473F 0000:473F  b90500             mov     cx, 5
*            04742 0000:4742  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            04744 0000:4744  83c606             add     si, 6
*            04747 0000:4747  8bfe               mov     di, si
*            04749 0000:4749  83ef10             sub     di, 0x10
*            0474C 0000:474C  8ad3               mov     dl, bl
*   L_0474E: 0474E 0000:474E  b90500             mov     cx, 5
*            04751 0000:4751  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            04753 0000:4753  83c606             add     si, 6
*            04756 0000:4756  83c706             add     di, 6
*            04759 0000:4759  feca               dec     dl
*            0475B 0000:475B  75f1               jne     0x474e
*            0475D 0000:475D  be5003             mov     si, 0x350
*            04760 0000:4760  b90500             mov     cx, 5
*            04763 0000:4763  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            04765 0000:4765  5e                 pop     si
*            04766 0000:4766  5f                 pop     di
*            04767 0000:4767  ebc5               jmp     0x472e
*   L_04769: 04769 0000:4769  a10a03             mov     ax, word ptr [0x30a]   ; math_ram (shared)
*            0476C 0000:476C  8bc8               mov     cx, ax
*            0476E 0000:476E  03060c03           add     ax, word ptr [0x30c]   ; math_ram (shared)
*            04772 0000:4772  03060e03           add     ax, word ptr [0x30e]   ; math_ram (shared)
*            04776 0000:4776  3d2000             cmp     ax, 0x20
*            04779 0000:4779  720a               jb      0x4785
*            0477B 0000:477B  2d1f00             sub     ax, 0x1f
*            0477E 0000:477E  29060e03           sub     word ptr [0x30e], ax   ; math_ram (shared)
*            04782 0000:4782  b81f00             mov     ax, 0x1f
*   L_04785: 04785 0000:4785  a30603             mov     word ptr [0x306], ax   ; math_ram (shared)
*            04788 0000:4788  48                 dec     ax
*            04789 0000:4789  d1e0               shl     ax, 1
*            0478B 0000:478B  d1e0               shl     ax, 1
*            0478D 0000:478D  d1e0               shl     ax, 1
*            0478F 0000:478F  d1e0               shl     ax, 1
*            04791 0000:4791  8bd8               mov     bx, ax
*            04793 0000:4793  8d870004           lea     ax, [bx + 0x400]
*            04797 0000:4797  a30403             mov     word ptr [0x304], ax   ; math_ram (shared)
*            0479A 0000:479A  c70602030012       mov     word ptr [0x302], 0x1200   ; math_ram (shared)
*            047A0 0000:47A0  e325               jcxz    0x47c7
*            047A2 0000:47A2  51                 push    cx
*            047A3 0000:47A3  e8bb00             call    0x4861
*   L_047A6: 047A6 0000:47A6  f6060e03ff         test    byte ptr [0x30e], 0xff   ; math_ram (shared)
*            047AB 0000:47AB  7474               je      0x4821
*            047AD 0000:47AD  8b1e0203           mov     bx, word ptr [0x302]   ; math_ram (shared)
*            047B1 0000:47B1  8b07               mov     ax, word ptr [bx]
*            047B3 0000:47B3  80e41f             and     ah, 0x1f
*            047B6 0000:47B6  3bd0               cmp     dx, ax
*            047B8 0000:47B8  7d31               jge     0x47eb
*            047BA 0000:47BA  e8d900             call    0x4896
*            047BD 0000:47BD  83ef1a             sub     di, 0x1a
*            047C0 0000:47C0  893e0403           mov     word ptr [0x304], di   ; math_ram (shared)
*            047C4 0000:47C4  59                 pop     cx
*            047C5 0000:47C5  e2db               loop    0x47a2
*   L_047C7: 047C7 0000:47C7  f6060e03ff         test    byte ptr [0x30e], 0xff   ; math_ram (shared)
*            047CC 0000:47CC  7460               je      0x482e
*            047CE 0000:47CE  8b360203           mov     si, word ptr [0x302]   ; math_ram (shared)
*   L_047D2: 047D2 0000:47D2  56                 push    si
*            047D3 0000:47D3  8b14               mov     dx, word ptr [si]
*            047D5 0000:47D5  e8be00             call    0x4896
*            047D8 0000:47D8  83ef1a             sub     di, 0x1a
*            047DB 0000:47DB  893e0403           mov     word ptr [0x304], di   ; math_ram (shared)
*            047DF 0000:47DF  5e                 pop     si
*            047E0 0000:47E0  83c608             add     si, 8
*            047E3 0000:47E3  ff0e0e03           dec     word ptr [0x30e]   ; math_ram (shared)
*            047E7 0000:47E7  75e9               jne     0x47d2
*            047E9 0000:47E9  eb43               jmp     0x482e
*   L_047EB: 047EB 0000:47EB  52                 push    dx
*            047EC 0000:47EC  56                 push    si
*            047ED 0000:47ED  8bd0               mov     dx, ax
*            047EF 0000:47EF  8bf3               mov     si, bx
*            047F1 0000:47F1  e8a200             call    0x4896
*            047F4 0000:47F4  83ef1a             sub     di, 0x1a
*            047F7 0000:47F7  893e0403           mov     word ptr [0x304], di   ; math_ram (shared)
*            047FB 0000:47FB  8006020308         add     byte ptr [0x302], 8   ; math_ram (shared)
*            04800 0000:4800  5e                 pop     si
*            04801 0000:4801  5a                 pop     dx
*            04802 0000:4802  ff0e0e03           dec     word ptr [0x30e]   ; math_ram (shared)
*            04806 0000:4806  759e               jne     0x47a6
*            04808 0000:4808  e88b00             call    0x4896
*            0480B 0000:480B  83ef1a             sub     di, 0x1a
*            0480E 0000:480E  893e0403           mov     word ptr [0x304], di   ; math_ram (shared)
*            04812 0000:4812  59                 pop     cx
*            04813 0000:4813  49                 dec     cx
*            04814 0000:4814  e318               jcxz    0x482e
*            04816 0000:4816  51                 push    cx
*            04817 0000:4817  b82408             mov     ax, 0x824
*            0481A 0000:481A  50                 push    ax
*            0481B 0000:481B  b89608             mov     ax, 0x896
*            0481E 0000:481E  50                 push    ax
*            0481F 0000:481F  eb40               jmp     0x4861
*   L_04821: 04821 0000:4821  e87200             call    0x4896
*            04824 0000:4824  83ef1a             sub     di, 0x1a
*            04827 0000:4827  893e0403           mov     word ptr [0x304], di   ; math_ram (shared)
*            0482B 0000:482B  59                 pop     cx
*            0482C 0000:482C  e2e8               loop    0x4816
*   L_0482E: 0482E 0000:482E  f6060c03ff         test    byte ptr [0x30c], 0xff   ; math_ram (shared)
*            04833 0000:4833  7419               je      0x484e
*            04835 0000:4835  c70604030004       mov     word ptr [0x304], 0x400   ; math_ram (shared)
*            0483B 0000:483B  be8011             mov     si, 0x1180
*   L_0483E: 0483E 0000:483E  8b14               mov     dx, word ptr [si]
*            04840 0000:4840  e85300             call    0x4896
*            04843 0000:4843  8306040310         add     word ptr [0x304], 0x10   ; math_ram (shared)
*            04848 0000:4848  ff0e0c03           dec     word ptr [0x30c]   ; math_ram (shared)
*            0484C 0000:484C  75f0               jne     0x483e
*   L_0484E: 0484E 0000:484E  be2006             mov     si, 0x620
*            04851 0000:4851  bf0011             mov     di, 0x1100
*            04854 0000:4854  8b0e1610           mov     cx, word ptr [0x1016]   ; RCRAM (road, shared)
*            04858 0000:4858  e306               jcxz    0x4860
*            0485A 0000:485A  a5                 movsw   word ptr es:[di], word ptr [si]
*            0485B 0000:485B  83c706             add     di, 6
*            0485E 0000:485E  e2fa               loop    0x485a
*   L_04860: 04860 0000:4860  c3                 ret     
*   L_04861: 04861 0000:4861  bdff1f             mov     bp, 0x1fff
*            04864 0000:4864  8bd5               mov     dx, bp
*            04866 0000:4866  bf0011             mov     di, 0x1100
*            04869 0000:4869  2315               and     dx, word ptr [di]
*            0486B 0000:486B  8bdf               mov     bx, di
*            0486D 0000:486D  8bf3               mov     si, bx
*            0486F 0000:486F  83c608             add     si, 8
*            04872 0000:4872  8b0e0a03           mov     cx, word ptr [0x30a]   ; math_ram (shared)
*            04876 0000:4876  41                 inc     cx
*   L_04877: 04877 0000:4877  49                 dec     cx
*            04878 0000:4878  7411               je      0x488b
*            0487A 0000:487A  8b07               mov     ax, word ptr [bx]
*            0487C 0000:487C  23c5               and     ax, bp
*            0487E 0000:487E  83c308             add     bx, 8
*            04881 0000:4881  3bd0               cmp     dx, ax
*            04883 0000:4883  7ef2               jle     0x4877
*            04885 0000:4885  8bd0               mov     dx, ax
*            04887 0000:4887  8bf3               mov     si, bx
*            04889 0000:4889  e2ef               loop    0x487a
*   L_0488B: 0488B 0000:488B  83ee08             sub     si, 8
*            0488E 0000:488E  80e60f             and     dh, 0xf
*            04891 0000:4891  810c0010           or      word ptr [si], 0x1000
*            04895 0000:4895  c3                 ret     
*   L_04896: 04896 0000:4896  fc                 cld     
*            04897 0000:4897  8b3e0403           mov     di, word ptr [0x304]   ; math_ram (shared)
*            0489B 0000:489B  80e607             and     dh, 7
*            0489E 0000:489E  89160003           mov     word ptr [0x300], dx   ; math_ram (shared)
*            048A2 0000:48A2  ad                 lodsw   ax, word ptr [si]
*            048A3 0000:48A3  2500e0             and     ax, 0xe000
*            048A6 0000:48A6  a30803             mov     word ptr [0x308], ax   ; math_ram (shared)
*            048A9 0000:48A9  d1c0               rol     ax, 1
*            048AB 0000:48AB  d1c0               rol     ax, 1
*            048AD 0000:48AD  d1c0               rol     ax, 1
*            048AF 0000:48AF  d1c0               rol     ax, 1
*            048B1 0000:48B1  8bd8               mov     bx, ax
*            048B3 0000:48B3  8b8740f5           mov     ax, word ptr [bx - 0xac0]
*            048B7 0000:48B7  ffe0               jmp     ax
             048B9 0000:48B9  8bca               mov     cx, dx
             048BB 0000:48BB  ad                 lodsw   ax, word ptr [si]
             048BC 0000:48BC  8be8               mov     bp, ax
             048BE 0000:48BE  2500fc             and     ax, 0xfc00
             048C1 0000:48C1  86e0               xchg    al, ah
             048C3 0000:48C3  95                 xchg    bp, ax
             048C4 0000:48C4  d1fd               sar     bp, 1
             048C6 0000:48C6  d1fd               sar     bp, 1
             048C8 0000:48C8  45                 inc     bp
             048C9 0000:48C9  80e403             and     ah, 3
             048CC 0000:48CC  f6c402             test    ah, 2
             048CF 0000:48CF  7403               je      0x48d4
             048D1 0000:48D1  80ccfc             or      ah, 0xfc
*            048D4 0000:48D4  8b160a10           mov     dx, word ptr [0x100a]   ; RCRAM (road, shared)
*            048D8 0000:48D8  bbf000             mov     bx, 0xf0
*            048DB 0000:48DB  2bda               sub     bx, dx
*            048DD 0000:48DD  c7060c307400       mov     word ptr [0x300c], 0x74   ; MATH UNIT (mul/div/geometry)
*            048E3 0000:48E3  2bd8               sub     bx, ax
*            048E5 0000:48E5  891e0030           mov     word ptr [0x3000], bx   ; MATH UNIT (mul/div/geometry)
*            048E9 0000:48E9  90                 nop     
*            048EA 0000:48EA  8b1e1e31           mov     bx, word ptr [0x311e]   ; MATH UNIT (mul/div/geometry)
*            048EE 0000:48EE  890e0c30           mov     word ptr [0x300c], cx   ; MATH UNIT (mul/div/geometry)
*            048F2 0000:48F2  891e8c30           mov     word ptr [0x308c], bx   ; MATH UNIT (mul/div/geometry)
*            048F6 0000:48F6  8b1e0803           mov     bx, word ptr [0x308]   ; math_ram (shared)
*            048FA 0000:48FA  8bc5               mov     ax, bp
*            048FC 0000:48FC  90                 nop     
*            048FD 0000:48FD  03160e30           add     dx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04901 0000:4901  890e0c31           mov     word ptr [0x310c], cx   ; MATH UNIT (mul/div/geometry)
*            04905 0000:4905  c7068c30703f       mov     word ptr [0x308c], 0x3f70   ; MATH UNIT (mul/div/geometry)
*            0490B 0000:490B  80ff40             cmp     bh, 0x40
*            0490E 0000:490E  7707               ja      0x4917
*            04910 0000:4910  b82000             mov     ax, 0x20
*            04913 0000:4913  7204               jb      0x4919
*            04915 0000:4915  0420               add     al, 0x20
*   L_04917: 04917 0000:4917  90                 nop     
*            04918 0000:4918  90                 nop     
*   L_04919: 04919 0000:4919  8b1e8036           mov     bx, word ptr [0x3680]   ; MATH UNIT (mul/div/geometry)
*            0491D 0000:491D  a38036             mov     word ptr [0x3680], ax   ; MATH UNIT (mul/div/geometry)
*            04920 0000:4920  53                 push    bx
*            04921 0000:4921  ad                 lodsw   ax, word ptr [si]
*            04922 0000:4922  90                 nop     
*            04923 0000:4923  8b1e8036           mov     bx, word ptr [0x3680]   ; MATH UNIT (mul/div/geometry)
*            04927 0000:4927  83c402             add     sp, 2
*            0492A 0000:492A  90                 nop     
*            0492B 0000:492B  a38036             mov     word ptr [0x3680], ax   ; MATH UNIT (mul/div/geometry)
*            0492E 0000:492E  895d06             mov     word ptr [di + 6], bx
*            04931 0000:4931  891e0036           mov     word ptr [0x3600], bx   ; MATH UNIT (mul/div/geometry)
*            04935 0000:4935  90                 nop     
*            04936 0000:4936  2b160e30           sub     dx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            0493A 0000:493A  4a                 dec     dx
*            0493B 0000:493B  03161c10           add     dx, word ptr [0x101c]   ; RCRAM (road, shared)
*            0493F 0000:493F  780c               js      0x494d
*            04941 0000:4941  22f6               and     dh, dh
*            04943 0000:4943  7519               jne     0x495e
*            04945 0000:4945  80faff             cmp     dl, 0xff
*            04948 0000:4948  7517               jne     0x4961
*            0494A 0000:494A  4a                 dec     dx
*            0494B 0000:494B  eb14               jmp     0x4961
*   L_0494D: 0494D 0000:494D  f7da               neg     dx
*            0494F 0000:494F  89167c31           mov     word ptr [0x317c], dx   ; MATH UNIT (mul/div/geometry)
*            04953 0000:4953  8ad4               mov     dl, ah
*            04955 0000:4955  32e4               xor     ah, ah
*            04957 0000:4957  ab                 stosw   word ptr es:[di], ax
*            04958 0000:4958  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            0495B 0000:495B  ab                 stosw   word ptr es:[di], ax
*            0495C 0000:495C  eb09               jmp     0x4967
*   L_0495E: 0495E 0000:495E  bafe00             mov     dx, 0xfe
*   L_04961: 04961 0000:4961  86d4               xchg    ah, dl
*            04963 0000:4963  ab                 stosw   word ptr es:[di], ax
*            04964 0000:4964  33c0               xor     ax, ax
*            04966 0000:4966  ab                 stosw   word ptr es:[di], ax
*   L_04967: 04967 0000:4967  8b1e0803           mov     bx, word ptr [0x308]   ; math_ram (shared)
*            0496B 0000:496B  80ef60             sub     bh, 0x60
*            0496E 0000:496E  80ff20             cmp     bh, 0x20
*            04971 0000:4971  7708               ja      0x497b
*            04973 0000:4973  bd2000             mov     bp, 0x20
*            04976 0000:4976  7503               jne     0x497b
*            04978 0000:4978  83c520             add     bp, 0x20
*   L_0497B: 0497B 0000:497B  892e5c31           mov     word ptr [0x315c], bp   ; MATH UNIT (mul/div/geometry)
*            0497F 0000:497F  87e5               xchg    bp, sp
*            04981 0000:4981  8ba6fe07           mov     sp, word ptr [bp + 0x7fe]
*            04985 0000:4985  87e5               xchg    bp, sp
*            04987 0000:4987  ad                 lodsw   ax, word ptr [si]
*            04988 0000:4988  8bd8               mov     bx, ax
*            0498A 0000:498A  a10037             mov     ax, word ptr [0x3700]   ; MATH UNIT (mul/div/geometry)
*            0498D 0000:498D  891e0c30           mov     word ptr [0x300c], bx   ; MATH UNIT (mul/div/geometry)
*            04991 0000:4991  c70600307400       mov     word ptr [0x3000], 0x74   ; MATH UNIT (mul/div/geometry)
*            04997 0000:4997  22e4               and     ah, ah
*            04999 0000:4999  7402               je      0x499d
*            0499B 0000:499B  b0ff               mov     al, 0xff
*   L_0499D: 0499D 0000:499D  8ae2               mov     ah, dl
*            0499F 0000:499F  8905               mov     word ptr [di], ax
*            049A1 0000:49A1  a18e30             mov     ax, word ptr [0x308e]   ; MATH UNIT (mul/div/geometry)
*            049A4 0000:49A4  8b1e000b           mov     bx, word ptr [0xb00]   ; SPCS RAM (shared w/main)
*            049A8 0000:49A8  a38c30             mov     word ptr [0x308c], ax   ; MATH UNIT (mul/div/geometry)
*            049AB 0000:49AB  bb8b00             mov     bx, 0x8b
*            049AE 0000:49AE  2bdd               sub     bx, bp
*            049B0 0000:49B0  7c22               jl      0x49d4
*            049B2 0000:49B2  d1e3               shl     bx, 1
*            049B4 0000:49B4  031e7603           add     bx, word ptr [0x376]   ; math_ram (shared)
*            049B8 0000:49B8  b88000             mov     ax, 0x80
*            049BB 0000:49BB  2b07               sub     ax, word ptr [bx]
*            049BD 0000:49BD  03060e30           add     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*   L_049C1: 049C1 0000:49C1  80fc01             cmp     ah, 1
*            049C4 0000:49C4  7c02               jl      0x49c8
*            049C6 0000:49C6  b401               mov     ah, 1
*   L_049C8: 049C8 0000:49C8  80fcfe             cmp     ah, 0xfe
*            049CB 0000:49CB  7f02               jg      0x49cf
*            049CD 0000:49CD  b4fe               mov     ah, 0xfe
*   L_049CF: 049CF 0000:49CF  83c704             add     di, 4
*            049D2 0000:49D2  ab                 stosw   word ptr es:[di], ax
*            049D3 0000:49D3  c3                 ret     
*   L_049D4: 049D4 0000:49D4  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            049D7 0000:49D7  8b1e7603           mov     bx, word ptr [0x376]   ; math_ram (shared)
*            049DB 0000:49DB  8b17               mov     dx, word ptr [bx]
*            049DD 0000:49DD  8b4f40             mov     cx, word ptr [bx + 0x40]
*            049E0 0000:49E0  8bdd               mov     bx, bp
*            049E2 0000:49E2  81eb8c00           sub     bx, 0x8c
*            049E6 0000:49E6  86fb               xchg    bl, bh
*            049E8 0000:49E8  891e0c30           mov     word ptr [0x300c], bx   ; MATH UNIT (mul/div/geometry)
*            049EC 0000:49EC  8bda               mov     bx, dx
*            049EE 0000:49EE  2bd9               sub     bx, cx
*            049F0 0000:49F0  d1e3               shl     bx, 1
*            049F2 0000:49F2  d1e3               shl     bx, 1
*            049F4 0000:49F4  d1e3               shl     bx, 1
*            049F6 0000:49F6  891e0030           mov     word ptr [0x3000], bx   ; MATH UNIT (mul/div/geometry)
*            049FA 0000:49FA  90                 nop     
*            049FB 0000:49FB  03160e30           add     dx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            049FF 0000:49FF  b98000             mov     cx, 0x80
*            04A02 0000:4A02  2bca               sub     cx, dx
*            04A04 0000:4A04  03c1               add     ax, cx
*            04A06 0000:4A06  ebb9               jmp     0x49c1
             04A08 0000:4A08  8bca               mov     cx, dx
             04A0A 0000:4A0A  ad                 lodsw   ax, word ptr [si]
             04A0B 0000:4A0B  8be8               mov     bp, ax
             04A0D 0000:4A0D  2500fc             and     ax, 0xfc00
             04A10 0000:4A10  86e0               xchg    al, ah
             04A12 0000:4A12  95                 xchg    bp, ax
*   L_04A13: 04A13 0000:4A13  d1fd               sar     bp, 1
*            04A15 0000:4A15  d1fd               sar     bp, 1
*            04A17 0000:4A17  45                 inc     bp
*            04A18 0000:4A18  80e403             and     ah, 3
*            04A1B 0000:4A1B  f6c402             test    ah, 2
*            04A1E 0000:4A1E  7403               je      0x4a23
*            04A20 0000:4A20  80ccfc             or      ah, 0xfc
*   L_04A23: 04A23 0000:4A23  890e0c31           mov     word ptr [0x310c], cx   ; MATH UNIT (mul/div/geometry)
*            04A27 0000:4A27  c7068c30703f       mov     word ptr [0x308c], 0x3f70   ; MATH UNIT (mul/div/geometry)
*            04A2D 0000:4A2D  d1d8               rcr     ax, 1
*            04A2F 0000:4A2F  98                 cwde    
*            04A30 0000:4A30  d1d0               rcl     ax, 1
*            04A32 0000:4A32  7240               jb      0x4a74
*            04A34 0000:4A34  3df000             cmp     ax, 0xf0
*            04A37 0000:4A37  7d61               jge     0x4a9a
*            04A39 0000:4A39  8ad8               mov     bl, al
*            04A3B 0000:4A3B  8b0e8036           mov     cx, word ptr [0x3680]   ; MATH UNIT (mul/div/geometry)
*            04A3F 0000:4A3F  51                 push    cx
*            04A40 0000:4A40  83c402             add     sp, 2
*            04A43 0000:4A43  892e8036           mov     word ptr [0x3680], bp   ; MATH UNIT (mul/div/geometry)
*            04A47 0000:4A47  ad                 lodsw   ax, word ptr [si]
*            04A48 0000:4A48  86dc               xchg    ah, bl
*            04A4A 0000:4A4A  ab                 stosw   word ptr es:[di], ax
*            04A4B 0000:4A4B  a10036             mov     ax, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            04A4E 0000:4A4E  894504             mov     word ptr [di + 4], ax
*            04A51 0000:4A51  33c0               xor     ax, ax
*            04A53 0000:4A53  ab                 stosw   word ptr es:[di], ax
*   L_04A54: 04A54 0000:4A54  892e5c31           mov     word ptr [0x315c], bp   ; MATH UNIT (mul/div/geometry)
*            04A58 0000:4A58  87e5               xchg    bp, sp
*            04A5A 0000:4A5A  8ba6fe07           mov     sp, word ptr [bp + 0x7fe]
*            04A5E 0000:4A5E  87e5               xchg    bp, sp
*            04A60 0000:4A60  ad                 lodsw   ax, word ptr [si]
*            04A61 0000:4A61  8b160036           mov     dx, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            04A65 0000:4A65  22f6               and     dh, dh
*            04A67 0000:4A67  7402               je      0x4a6b
*            04A69 0000:4A69  b2ff               mov     dl, 0xff
*   L_04A6B: 04A6B 0000:4A6B  8af3               mov     dh, bl
*            04A6D 0000:4A6D  8915               mov     word ptr [di], dx
*            04A6F 0000:4A6F  83c704             add     di, 4
*            04A72 0000:4A72  ab                 stosw   word ptr es:[di], ax
*            04A73 0000:4A73  c3                 ret     
*   L_04A74: 04A74 0000:4A74  8bc8               mov     cx, ax
*            04A76 0000:4A76  8b1e8036           mov     bx, word ptr [0x3680]   ; MATH UNIT (mul/div/geometry)
*            04A7A 0000:4A7A  53                 push    bx
*            04A7B 0000:4A7B  83c402             add     sp, 2
*            04A7E 0000:4A7E  892e8036           mov     word ptr [0x3680], bp   ; MATH UNIT (mul/div/geometry)
*            04A82 0000:4A82  ad                 lodsw   ax, word ptr [si]
*            04A83 0000:4A83  8adc               mov     bl, ah
*            04A85 0000:4A85  32e4               xor     ah, ah
*            04A87 0000:4A87  ab                 stosw   word ptr es:[di], ax
*            04A88 0000:4A88  a10036             mov     ax, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            04A8B 0000:4A8B  f7d9               neg     cx
*            04A8D 0000:4A8D  890e7c31           mov     word ptr [0x317c], cx   ; MATH UNIT (mul/div/geometry)
*            04A91 0000:4A91  894506             mov     word ptr [di + 6], ax
*            04A94 0000:4A94  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04A97 0000:4A97  ab                 stosw   word ptr es:[di], ax
*            04A98 0000:4A98  ebba               jmp     0x4a54
*   L_04A9A: 04A9A 0000:4A9A  b4fe               mov     ah, 0xfe
*            04A9C 0000:4A9C  ab                 stosw   word ptr es:[di], ax
*            04A9D 0000:4A9D  c3                 ret     
             04A9E 0000:4A9E  8bc2               mov     ax, dx
             04AA0 0000:4AA0  d1d8               rcr     ax, 1
             04AA2 0000:4AA2  98                 cwde    
             04AA3 0000:4AA3  d1d0               rcl     ax, 1
             04AA5 0000:4AA5  7244               jb      0x4aeb
             04AA7 0000:4AA7  8af0               mov     dh, al
             04AA9 0000:4AA9  ad                 lodsw   ax, word ptr [si]
             04AAA 0000:4AAA  8ac8               mov     cl, al
             04AAC 0000:4AAC  8ac4               mov     al, ah
             04AAE 0000:4AAE  32e4               xor     ah, ah
             04AB0 0000:4AB0  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
             04AB3 0000:4AB3  c7060c30ffff       mov     word ptr [0x300c], 0xffff   ; MATH UNIT (mul/div/geometry)
             04AB9 0000:4AB9  c70608300080       mov     word ptr [0x3008], 0x8000   ; MATH UNIT (mul/div/geometry)
             04ABF 0000:4ABF  ad                 lodsw   ax, word ptr [si]
             04AC0 0000:4AC0  8aec               mov     ch, ah
             04AC2 0000:4AC2  8ae6               mov     ah, dh
             04AC4 0000:4AC4  ab                 stosw   word ptr es:[di], ax
             04AC5 0000:4AC5  33c0               xor     ax, ax
             04AC7 0000:4AC7  ab                 stosw   word ptr es:[di], ax
             04AC8 0000:4AC8  8bc1               mov     ax, cx
             04ACA 0000:4ACA  ab                 stosw   word ptr es:[di], ax
             04ACB 0000:4ACB  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
             04ACE 0000:4ACE  f7d8               neg     ax
             04AD0 0000:4AD0  ab                 stosw   word ptr es:[di], ax
             04AD1 0000:4AD1  bbff03             mov     bx, 0x3ff
*   L_04AD4: 04AD4 0000:4AD4  ad                 lodsw   ax, word ptr [si]
*            04AD5 0000:4AD5  23d8               and     bx, ax
*            04AD7 0000:4AD7  80fc04             cmp     ah, 4
*            04ADA 0000:4ADA  7203               jb      0x4adf
*            04ADC 0000:4ADC  80cf04             or      bh, 4
*   L_04ADF: 04ADF 0000:4ADF  80fcfc             cmp     ah, 0xfc
*            04AE2 0000:4AE2  7203               jb      0x4ae7
*            04AE4 0000:4AE4  80cff8             or      bh, 0xf8
*   L_04AE7: 04AE7 0000:4AE7  8bc3               mov     ax, bx
*            04AE9 0000:4AE9  ab                 stosw   word ptr es:[di], ax
*            04AEA 0000:4AEA  c3                 ret     
*            04AEB 0000:4AEB  32f6               xor     dh, dh
*            04AED 0000:4AED  8bd8               mov     bx, ax
*            04AEF 0000:4AEF  f7db               neg     bx
*            04AF1 0000:4AF1  ad                 lodsw   ax, word ptr [si]
*            04AF2 0000:4AF2  8ac8               mov     cl, al
*            04AF4 0000:4AF4  32e4               xor     ah, ah
*            04AF6 0000:4AF6  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            04AF9 0000:4AF9  c7060c30ffff       mov     word ptr [0x300c], 0xffff   ; MATH UNIT (mul/div/geometry)
*            04AFF 0000:4AFF  c70608300080       mov     word ptr [0x3008], 0x8000   ; MATH UNIT (mul/div/geometry)
*            04B05 0000:4B05  ad                 lodsw   ax, word ptr [si]
*            04B06 0000:4B06  8ad0               mov     dl, al
*            04B08 0000:4B08  92                 xchg    dx, ax
*            04B09 0000:4B09  ab                 stosw   word ptr es:[di], ax
*            04B0A 0000:4B0A  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04B0D 0000:4B0D  f7d8               neg     ax
*            04B0F 0000:4B0F  891e0c30           mov     word ptr [0x300c], bx   ; MATH UNIT (mul/div/geometry)
*            04B13 0000:4B13  a32031             mov     word ptr [0x3120], ax   ; MATH UNIT (mul/div/geometry)
*            04B16 0000:4B16  8ad1               mov     dl, cl
*            04B18 0000:4B18  8bc8               mov     cx, ax
*            04B1A 0000:4B1A  bbff03             mov     bx, 0x3ff
*            04B1D 0000:4B1D  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04B20 0000:4B20  ab                 stosw   word ptr es:[di], ax
*            04B21 0000:4B21  8bc2               mov     ax, dx
*            04B23 0000:4B23  ab                 stosw   word ptr es:[di], ax
*            04B24 0000:4B24  8bc1               mov     ax, cx
*            04B26 0000:4B26  ab                 stosw   word ptr es:[di], ax
*            04B27 0000:4B27  ebab               jmp     0x4ad4
             04B29 0000:4B29  8bc7               mov     ax, di
             04B2B 0000:4B2B  8b34               mov     si, word ptr [si]
             04B2D 0000:4B2D  b90500             mov     cx, 5
             04B30 0000:4B30  f3a5               rep movsw word ptr es:[di], word ptr [si]
             04B32 0000:4B32  050800             add     ax, 8
             04B35 0000:4B35  8904               mov     word ptr [si], ax
             04B37 0000:4B37  c3                 ret     
*   L_04B38: 04B38 0000:4B38  a18003             mov     ax, word ptr [0x380]   ; math_ram (shared)
*            04B3B 0000:4B3B  8a267303           mov     ah, byte ptr [0x373]   ; math_ram (shared)
*            04B3F 0000:4B3F  d0cc               ror     ah, 1
*            04B41 0000:4B41  80f402             xor     ah, 2
*            04B44 0000:4B44  0ae0               or      ah, al
*            04B46 0000:4B46  80e43f             and     ah, 0x3f
*            04B49 0000:4B49  8a1e7003           mov     bl, byte ptr [0x370]   ; math_ram (shared)
*            04B4D 0000:4B4D  80c308             add     bl, 8
*            04B50 0000:4B50  881e7003           mov     byte ptr [0x370], bl   ; math_ram (shared)
*            04B54 0000:4B54  80e3c0             and     bl, 0xc0
*            04B57 0000:4B57  0ae3               or      ah, bl
*            04B59 0000:4B59  88260006           mov     byte ptr [0x600], ah   ; math_ram (shared)
*            04B5D 0000:4B5D  fc                 cld     
*            04B5E 0000:4B5E  bf0206             mov     di, 0x602
*            04B61 0000:4B61  a8c0               test    al, 0xc0
*            04B63 0000:4B63  756a               jne     0x4bcf
*   L_04B65: 04B65 0000:4B65  8bd8               mov     bx, ax
*   L_04B67: 04B67 0000:4B67  a11c10             mov     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            04B6A 0000:4B6A  056f00             add     ax, 0x6f
*            04B6D 0000:4B6D  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            04B70 0000:4B70  c706003000a0       mov     word ptr [0x3000], 0xa000   ; MATH UNIT (mul/div/geometry)
*            04B76 0000:4B76  be0e30             mov     si, 0x300e
*            04B79 0000:4B79  b80020             mov     ax, 0x2000
*            04B7C 0000:4B7C  8b14               mov     dx, word ptr [si]
*            04B7E 0000:4B7E  0304               add     ax, word ptr [si]
*            04B80 0000:4B80  ab                 stosw   word ptr es:[di], ax
*            04B81 0000:4B81  83d200             adc     dx, 0
*            04B84 0000:4B84  8915               mov     word ptr [di], dx
*            04B86 0000:4B86  83c704             add     di, 4
*            04B89 0000:4B89  b80060             mov     ax, 0x6000
*            04B8C 0000:4B8C  ab                 stosw   word ptr es:[di], ax
*            04B8D 0000:4B8D  33c0               xor     ax, ax
*            04B8F 0000:4B8F  8905               mov     word ptr [di], ax
*            04B91 0000:4B91  a38c03             mov     word ptr [0x38c], ax   ; math_ram (shared)
*            04B94 0000:4B94  a38610             mov     word ptr [0x1086], ax   ; RCRAM (road, shared)
*            04B97 0000:4B97  f6c308             test    bl, 8
*            04B9A 0000:4B9A  7521               jne     0x4bbd
*   L_04B9C: 04B9C 0000:4B9C  83c704             add     di, 4
*   L_04B9F: 04B9F 0000:4B9F  8b1e1c10           mov     bx, word ptr [0x101c]   ; RCRAM (road, shared)
*            04BA3 0000:4BA3  d1e3               shl     bx, 1
*            04BA5 0000:4BA5  d1e3               shl     bx, 1
*            04BA7 0000:4BA7  8b8780f5           mov     ax, word ptr [bx - 0xa80]
*            04BAB 0000:4BAB  8905               mov     word ptr [di], ax
*            04BAD 0000:4BAD  83c704             add     di, 4
*            04BB0 0000:4BB0  8b8782f5           mov     ax, word ptr [bx - 0xa7e]
*            04BB4 0000:4BB4  ab                 stosw   word ptr es:[di], ax
*            04BB5 0000:4BB5  b88000             mov     ax, 0x80
*            04BB8 0000:4BB8  8905               mov     word ptr [di], ax
*            04BBA 0000:4BBA  e961f7             jmp     0x431e
*   L_04BBD: 04BBD 0000:4BBD  83c702             add     di, 2
*            04BC0 0000:4BC0  33c0               xor     ax, ax
*            04BC2 0000:4BC2  80e331             and     bl, 0x31
*            04BC5 0000:4BC5  80fb11             cmp     bl, 0x11
*            04BC8 0000:4BC8  7502               jne     0x4bcc
*            04BCA 0000:4BCA  f7d0               not     ax
*   L_04BCC: 04BCC 0000:4BCC  ab                 stosw   word ptr es:[di], ax
*            04BCD 0000:4BCD  ebd0               jmp     0x4b9f
*   L_04BCF: 04BCF 0000:4BCF  a840               test    al, 0x40
*            04BD1 0000:4BD1  7503               jne     0x4bd6
*            04BD3 0000:4BD3  e9a300             jmp     0x4c79
*   L_04BD6: 04BD6 0000:4BD6  a10a10             mov     ax, word ptr [0x100a]   ; RCRAM (road, shared)
*            04BD9 0000:4BD9  86e0               xchg    al, ah
*            04BDB 0000:4BDB  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            04BDE 0000:4BDE  c70600303c1d       mov     word ptr [0x3000], 0x1d3c   ; MATH UNIT (mul/div/geometry)
*            04BE4 0000:4BE4  ba9402             mov     dx, 0x294
*            04BE7 0000:4BE7  03160e30           add     dx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04BEB 0000:4BEB  8b1e1c10           mov     bx, word ptr [0x101c]   ; RCRAM (road, shared)
*            04BEF 0000:4BEF  d1e3               shl     bx, 1
*            04BF1 0000:4BF1  d1e3               shl     bx, 1
*            04BF3 0000:4BF3  d1e3               shl     bx, 1
*            04BF5 0000:4BF5  d1e3               shl     bx, 1
*            04BF7 0000:4BF7  d1e3               shl     bx, 1
*            04BF9 0000:4BF9  03d3               add     dx, bx
*            04BFB 0000:4BFB  89160c30           mov     word ptr [0x300c], dx   ; MATH UNIT (mul/div/geometry)
*            04BFF 0000:4BFF  c706003000fd       mov     word ptr [0x3000], 0xfd00   ; MATH UNIT (mul/div/geometry)
*            04C05 0000:4C05  b80080             mov     ax, 0x8000
*            04C08 0000:4C08  8b160e30           mov     dx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04C0C 0000:4C0C  03060e30           add     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04C10 0000:4C10  83d200             adc     dx, 0
*            04C13 0000:4C13  ab                 stosw   word ptr es:[di], ax
*            04C14 0000:4C14  8915               mov     word ptr [di], dx
*            04C16 0000:4C16  83c704             add     di, 4
*            04C19 0000:4C19  b80060             mov     ax, 0x6000
*            04C1C 0000:4C1C  ab                 stosw   word ptr es:[di], ax
*            04C1D 0000:4C1D  33c0               xor     ax, ax
*            04C1F 0000:4C1F  8905               mov     word ptr [di], ax
*            04C21 0000:4C21  b8ef00             mov     ax, 0xef
*            04C24 0000:4C24  03061c10           add     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            04C28 0000:4C28  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            04C2B 0000:4C2B  c706003080ba       mov     word ptr [0x3000], 0xba80   ; MATH UNIT (mul/div/geometry)
*            04C31 0000:4C31  b8ef00             mov     ax, 0xef
*            04C34 0000:4C34  2b060a10           sub     ax, word ptr [0x100a]   ; RCRAM (road, shared)
*            04C38 0000:4C38  8b160e30           mov     dx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04C3C 0000:4C3C  8b1e0e30           mov     bx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04C40 0000:4C40  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            04C43 0000:4C43  89160c30           mov     word ptr [0x300c], dx   ; MATH UNIT (mul/div/geometry)
*            04C47 0000:4C47  891e0830           mov     word ptr [0x3008], bx   ; MATH UNIT (mul/div/geometry)
*            04C4B 0000:4C4B  bb803f             mov     bx, 0x3f80
*            04C4E 0000:4C4E  83c704             add     di, 4
*            04C51 0000:4C51  90                 nop     
*            04C52 0000:4C52  90                 nop     
*            04C53 0000:4C53  031e0e30           add     bx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04C57 0000:4C57  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            04C5A 0000:4C5A  c7060c300000       mov     word ptr [0x300c], 0   ; MATH UNIT (mul/div/geometry)
*            04C60 0000:4C60  c70608308045       mov     word ptr [0x3008], 0x4580   ; MATH UNIT (mul/div/geometry)
*            04C66 0000:4C66  891d               mov     word ptr [di], bx
*            04C68 0000:4C68  83c704             add     di, 4
*            04C6B 0000:4C6B  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04C6E 0000:4C6E  ab                 stosw   word ptr es:[di], ax
*            04C6F 0000:4C6F  8905               mov     word ptr [di], ax
*            04C71 0000:4C71  33c0               xor     ax, ax
*            04C73 0000:4C73  a38610             mov     word ptr [0x1086], ax   ; RCRAM (road, shared)
*            04C76 0000:4C76  e9a5f6             jmp     0x431e
*   L_04C79: 04C79 0000:4C79  8b1e7603           mov     bx, word ptr [0x376]   ; math_ram (shared)
*            04C7D 0000:4C7D  81c3f800           add     bx, 0xf8
*            04C81 0000:4C81  8b1f               mov     bx, word ptr [bx]
*            04C83 0000:4C83  f606021080         test    byte ptr [0x1002], 0x80   ; RCRAM (road, shared)
*            04C88 0000:4C88  7438               je      0x4cc2
*            04C8A 0000:4C8A  f606160680         test    byte ptr [0x616], 0x80   ; math_ram (shared)
*            04C8F 0000:4C8F  7513               jne     0x4ca4
*            04C91 0000:4C91  c606160680         mov     byte ptr [0x616], 0x80   ; math_ram (shared)
*            04C96 0000:4C96  33c0               xor     ax, ax
*            04C98 0000:4C98  a31a06             mov     word ptr [0x61a], ax   ; math_ram (shared)
*            04C9B 0000:4C9B  a31c06             mov     word ptr [0x61c], ax   ; math_ram (shared)
*            04C9E 0000:4C9E  a10c10             mov     ax, word ptr [0x100c]   ; RCRAM (road, shared)
*            04CA1 0000:4CA1  a31e06             mov     word ptr [0x61e], ax   ; math_ram (shared)
*   L_04CA4: 04CA4 0000:4CA4  a10c10             mov     ax, word ptr [0x100c]   ; RCRAM (road, shared)
*            04CA7 0000:4CA7  33061e06           xor     ax, word ptr [0x61e]   ; math_ram (shared)
*            04CAB 0000:4CAB  7815               js      0x4cc2
*            04CAD 0000:4CAD  f6061806ff         test    byte ptr [0x618], 0xff   ; math_ram (shared)
*            04CB2 0000:4CB2  744b               je      0x4cff
*            04CB4 0000:4CB4  a10806             mov     ax, word ptr [0x608]   ; math_ram (shared)
*            04CB7 0000:4CB7  e9b600             jmp     0x4d70
*   L_04CBA: 04CBA 0000:4CBA  33db               xor     bx, bx
*            04CBC 0000:4CBC  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04CBF 0000:4CBF  e9a5fe             jmp     0x4b67
*   L_04CC2: 04CC2 0000:4CC2  c606180600         mov     byte ptr [0x618], 0   ; math_ram (shared)
*            04CC7 0000:4CC7  a10e10             mov     ax, word ptr [0x100e]   ; RCRAM (road, shared)
*            04CCA 0000:4CCA  33d2               xor     dx, dx
*            04CCC 0000:4CCC  29061a06           sub     word ptr [0x61a], ax   ; math_ram (shared)
*            04CD0 0000:4CD0  19161c06           sbb     word ptr [0x61c], dx   ; math_ram (shared)
*            04CD4 0000:4CD4  a11b06             mov     ax, word ptr [0x61b]   ; math_ram (shared)
*            04CD7 0000:4CD7  23c0               and     ax, ax
*            04CD9 0000:4CD9  7f3c               jg      0x4d17
*            04CDB 0000:4CDB  f606021080         test    byte ptr [0x1002], 0x80   ; RCRAM (road, shared)
*            04CE0 0000:4CE0  750d               jne     0x4cef
*            04CE2 0000:4CE2  c606160600         mov     byte ptr [0x616], 0   ; math_ram (shared)
*            04CE7 0000:4CE7  bf0206             mov     di, 0x602
*   L_04CEA: 04CEA 0000:4CEA  33db               xor     bx, bx
*            04CEC 0000:4CEC  e978fe             jmp     0x4b67
*   L_04CEF: 04CEF 0000:4CEF  80361f0680         xor     byte ptr [0x61f], 0x80   ; math_ram (shared)
*            04CF4 0000:4CF4  33c0               xor     ax, ax
*            04CF6 0000:4CF6  a31a06             mov     word ptr [0x61a], ax   ; math_ram (shared)
*            04CF9 0000:4CF9  a31c06             mov     word ptr [0x61c], ax   ; math_ram (shared)
*            04CFC 0000:4CFC  e966fe             jmp     0x4b65
*   L_04CFF: 04CFF 0000:4CFF  33d2               xor     dx, dx
*            04D01 0000:4D01  a10e10             mov     ax, word ptr [0x100e]   ; RCRAM (road, shared)
*            04D04 0000:4D04  03061a06           add     ax, word ptr [0x61a]   ; math_ram (shared)
*            04D08 0000:4D08  13161c06           adc     dx, word ptr [0x61c]   ; math_ram (shared)
*            04D0C 0000:4D0C  a31a06             mov     word ptr [0x61a], ax   ; math_ram (shared)
*            04D0F 0000:4D0F  89161c06           mov     word ptr [0x61c], dx   ; math_ram (shared)
*            04D13 0000:4D13  8ac4               mov     al, ah
*            04D15 0000:4D15  8ae2               mov     ah, dl
*   L_04D17: 04D17 0000:4D17  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            04D1A 0000:4D1A  c70630310020       mov     word ptr [0x3130], 0x2000   ; MATH UNIT (mul/div/geometry)
*            04D20 0000:4D20  8a2e1f06           mov     ch, byte ptr [0x61f]   ; math_ram (shared)
*            04D24 0000:4D24  a18036             mov     ax, word ptr [0x3680]   ; MATH UNIT (mul/div/geometry)
*            04D27 0000:4D27  23c0               and     ax, ax
*            04D29 0000:4D29  748f               je      0x4cba
*            04D2B 0000:4D2B  a38610             mov     word ptr [0x1086], ax   ; RCRAM (road, shared)
*            04D2E 0000:4D2E  a1003e             mov     ax, word ptr [0x3e00]   ; MATH UNIT (mul/div/geometry)
*            04D31 0000:4D31  99                 cdq     
*            04D32 0000:4D32  d1e0               shl     ax, 1
*            04D34 0000:4D34  d1d2               rcl     dx, 1
*            04D36 0000:4D36  d1e0               shl     ax, 1
*            04D38 0000:4D38  d1d2               rcl     dx, 1
*            04D3A 0000:4D3A  d1e0               shl     ax, 1
*            04D3C 0000:4D3C  d1d2               rcl     dx, 1
*            04D3E 0000:4D3E  d1e0               shl     ax, 1
*            04D40 0000:4D40  d1d2               rcl     dx, 1
*            04D42 0000:4D42  d1e0               shl     ax, 1
*            04D44 0000:4D44  d1d2               rcl     dx, 1
*            04D46 0000:4D46  89160c30           mov     word ptr [0x300c], dx   ; MATH UNIT (mul/div/geometry)
*            04D4A 0000:4D4A  a30830             mov     word ptr [0x3008], ax   ; MATH UNIT (mul/div/geometry)
*            04D4D 0000:4D4D  8b160c10           mov     dx, word ptr [0x100c]   ; RCRAM (road, shared)
*            04D51 0000:4D51  23d2               and     dx, dx
*            04D53 0000:4D53  7902               jns     0x4d57
*            04D55 0000:4D55  f7da               neg     dx
*   L_04D57: 04D57 0000:4D57  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04D5A 0000:4D5A  3d0030             cmp     ax, 0x3000
*            04D5D 0000:4D5D  7f8b               jg      0x4cea
*            04D5F 0000:4D5F  3bc2               cmp     ax, dx
*            04D61 0000:4D61  7f07               jg      0x4d6a
*            04D63 0000:4D63  8bc2               mov     ax, dx
*            04D65 0000:4D65  c6061806ff         mov     byte ptr [0x618], 0xff   ; math_ram (shared)
*   L_04D6A: 04D6A 0000:4D6A  22ed               and     ch, ch
*            04D6C 0000:4D6C  7902               jns     0x4d70
*            04D6E 0000:4D6E  f7d8               neg     ax
*   L_04D70: 04D70 0000:4D70  8be8               mov     bp, ax
*            04D72 0000:4D72  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            04D75 0000:4D75  a11c10             mov     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            04D78 0000:4D78  057000             add     ax, 0x70
*            04D7B 0000:4D7B  a30230             mov     word ptr [0x3002], ax   ; MATH UNIT (mul/div/geometry)
*            04D7E 0000:4D7E  81c38002           add     bx, 0x280
*            04D82 0000:4D82  33c9               xor     cx, cx
*            04D84 0000:4D84  d1e3               shl     bx, 1
*            04D86 0000:4D86  d1d1               rcl     cx, 1
*            04D88 0000:4D88  8b160e30           mov     dx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04D8C 0000:4D8C  d1e3               shl     bx, 1
*            04D8E 0000:4D8E  d1d1               rcl     cx, 1
*            04D90 0000:4D90  d1e3               shl     bx, 1
*            04D92 0000:4D92  d1d1               rcl     cx, 1
*            04D94 0000:4D94  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04D97 0000:4D97  d1e3               shl     bx, 1
*            04D99 0000:4D99  d1d1               rcl     cx, 1
*            04D9B 0000:4D9B  d1e3               shl     bx, 1
*            04D9D 0000:4D9D  d1d1               rcl     cx, 1
*            04D9F 0000:4D9F  03c3               add     ax, bx
*            04DA1 0000:4DA1  13d1               adc     dx, cx
*            04DA3 0000:4DA3  ab                 stosw   word ptr es:[di], ax
*            04DA4 0000:4DA4  8915               mov     word ptr [di], dx
*            04DA6 0000:4DA6  83c704             add     di, 4
*            04DA9 0000:4DA9  8bc5               mov     ax, bp
*            04DAB 0000:4DAB  ab                 stosw   word ptr es:[di], ax
*            04DAC 0000:4DAC  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            04DAF 0000:4DAF  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            04DB2 0000:4DB2  c7060c300020       mov     word ptr [0x300c], 0x2000   ; MATH UNIT (mul/div/geometry)
*            04DB8 0000:4DB8  a30830             mov     word ptr [0x3008], ax   ; MATH UNIT (mul/div/geometry)
*            04DBB 0000:4DBB  99                 cdq     
*            04DBC 0000:4DBC  8915               mov     word ptr [di], dx
*            04DBE 0000:4DBE  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04DC1 0000:4DC1  d1e0               shl     ax, 1
*            04DC3 0000:4DC3  a38c03             mov     word ptr [0x38c], ax   ; math_ram (shared)
*            04DC6 0000:4DC6  e9d3fd             jmp     0x4b9c
*   L_04DC9: 04DC9 0000:4DC9  a10610             mov     ax, word ptr [0x1006]   ; RCRAM (road, shared)
*            04DCC 0000:4DCC  8bf0               mov     si, ax
*            04DCE 0000:4DCE  d1e0               shl     ax, 1
*            04DD0 0000:4DD0  d1e0               shl     ax, 1
*            04DD2 0000:4DD2  03f0               add     si, ax
*            04DD4 0000:4DD4  81c600dc           add     si, 0xdc00
*            04DD8 0000:4DD8  a10410             mov     ax, word ptr [0x1004]   ; RCRAM (road, shared)
*            04DDB 0000:4DDB  bb3010             mov     bx, 0x1030
*            04DDE 0000:4DDE  22dc               and     bl, ah
*            04DE0 0000:4DE0  2afb               sub     bh, bl
*            04DE2 0000:4DE2  80e730             and     bh, 0x30
*            04DE5 0000:4DE5  32db               xor     bl, bl
*            04DE7 0000:4DE7  03c3               add     ax, bx
*            04DE9 0000:4DE9  80e43f             and     ah, 0x3f
*            04DEC 0000:4DEC  a37803             mov     word ptr [0x378], ax   ; math_ram (shared)
*            04DEF 0000:4DEF  891e7a03           mov     word ptr [0x37a], bx   ; math_ram (shared)
*            04DF3 0000:4DF3  8bbc0080           mov     di, word ptr [si - 0x8000]
*            04DF7 0000:4DF7  035c08             add     bx, word ptr [si + 8]
*            04DFA 0000:4DFA  80e73f             and     bh, 0x3f
*            04DFD 0000:4DFD  2bc3               sub     ax, bx
*            04DFF 0000:4DFF  80e43f             and     ah, 0x3f
*            04E02 0000:4E02  a34037             mov     word ptr [0x3740], ax   ; MATH UNIT (mul/div/geometry)
*            04E05 0000:4E05  8b840480           mov     ax, word ptr [si - 0x7ffc]
*            04E09 0000:4E09  d1e0               shl     ax, 1
*            04E0B 0000:4E0B  8b9c0680           mov     bx, word ptr [si - 0x7ffa]
*            04E0F 0000:4E0F  a38032             mov     word ptr [0x3280], ax   ; MATH UNIT (mul/div/geometry)
*            04E12 0000:4E12  d1d7               rcl     di, 1
*            04E14 0000:4E14  d1d7               rcl     di, 1
*            04E16 0000:4E16  a1003e             mov     ax, word ptr [0x3e00]   ; MATH UNIT (mul/div/geometry)
*            04E19 0000:4E19  8b1e0e30           mov     bx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04E1D 0000:4E1D  7302               jae     0x4e21
*            04E1F 0000:4E1F  f7d8               neg     ax
*   L_04E21: 04E21 0000:4E21  a37e03             mov     word ptr [0x37e], ax   ; math_ram (shared)
*            04E24 0000:4E24  891e7c03           mov     word ptr [0x37c], bx   ; math_ram (shared)
*            04E28 0000:4E28  bfa403             mov     di, 0x3a4
*            04E2B 0000:4E2B  b90800             mov     cx, 8
*            04E2E 0000:4E2E  a17e03             mov     ax, word ptr [0x37e]   ; math_ram (shared)
*            04E31 0000:4E31  a30036             mov     word ptr [0x3600], ax   ; MATH UNIT (mul/div/geometry)
*            04E34 0000:4E34  bdf0ff             mov     bp, 0xfff0
*            04E37 0000:4E37  fc                 cld     
*            04E38 0000:4E38  ad                 lodsw   ax, word ptr [si]
*            04E39 0000:4E39  8bd8               mov     bx, ax
*            04E3B 0000:4E3B  03067a03           add     ax, word ptr [0x37a]   ; math_ram (shared)
*            04E3F 0000:4E3F  80e43f             and     ah, 0x3f
*            04E42 0000:4E42  2b067803           sub     ax, word ptr [0x378]   ; math_ram (shared)
*            04E46 0000:4E46  d1e0               shl     ax, 1
*            04E48 0000:4E48  a33c31             mov     word ptr [0x313c], ax   ; MATH UNIT (mul/div/geometry)
*            04E4B 0000:4E4B  ad                 lodsw   ax, word ptr [si]
*            04E4C 0000:4E4C  2b067c03           sub     ax, word ptr [0x37c]   ; math_ram (shared)
*            04E50 0000:4E50  d1e0               shl     ax, 1
*            04E52 0000:4E52  a38c30             mov     word ptr [0x308c], ax   ; MATH UNIT (mul/div/geometry)
*            04E55 0000:4E55  ad                 lodsw   ax, word ptr [si]
*            04E56 0000:4E56  8bd0               mov     dx, ax
*            04E58 0000:4E58  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04E5B 0000:4E5B  3bc5               cmp     ax, bp
*            04E5D 0000:4E5D  7c63               jl      0x4ec2
*            04E5F 0000:4E5F  8be8               mov     bp, ax
*            04E61 0000:4E61  80e7c0             and     bh, 0xc0
*            04E64 0000:4E64  0ae7               or      ah, bh
*            04E66 0000:4E66  ab                 stosw   word ptr es:[di], ax
*            04E67 0000:4E67  d0d7               rcl     bh, 1
*            04E69 0000:4E69  7304               jae     0x4e6f
*            04E6B 0000:4E6B  2b167e03           sub     dx, word ptr [0x37e]   ; math_ram (shared)
*   L_04E6F: 04E6F 0000:4E6F  ad                 lodsw   ax, word ptr [si]
*            04E70 0000:4E70  2b067c03           sub     ax, word ptr [0x37c]   ; math_ram (shared)
*            04E74 0000:4E74  d1e0               shl     ax, 1
*            04E76 0000:4E76  a32c31             mov     word ptr [0x312c], ax   ; MATH UNIT (mul/div/geometry)
*            04E79 0000:4E79  8bd8               mov     bx, ax
*            04E7B 0000:4E7B  ad                 lodsw   ax, word ptr [si]
*            04E7C 0000:4E7C  03067a03           add     ax, word ptr [0x37a]   ; math_ram (shared)
*            04E80 0000:4E80  25ff3f             and     ax, 0x3fff
*            04E83 0000:4E83  2b067803           sub     ax, word ptr [0x378]   ; math_ram (shared)
*            04E87 0000:4E87  d1e0               shl     ax, 1
*            04E89 0000:4E89  a38c30             mov     word ptr [0x308c], ax   ; MATH UNIT (mul/div/geometry)
*            04E8C 0000:4E8C  92                 xchg    dx, ax
*            04E8D 0000:4E8D  ab                 stosw   word ptr es:[di], ax
*            04E8E 0000:4E8E  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04E91 0000:4E91  89163c31           mov     word ptr [0x313c], dx   ; MATH UNIT (mul/div/geometry)
*            04E95 0000:4E95  03060810           add     ax, word ptr [0x1008]   ; RCRAM (road, shared)
*            04E99 0000:4E99  891e8c30           mov     word ptr [0x308c], bx   ; MATH UNIT (mul/div/geometry)
*            04E9D 0000:4E9D  ab                 stosw   word ptr es:[di], ax
*            04E9E 0000:4E9E  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04EA1 0000:4EA1  ab                 stosw   word ptr es:[di], ax
*            04EA2 0000:4EA2  e294               loop    0x4e38
*   L_04EA4: 04EA4 0000:4EA4  c70500c0           mov     word ptr [di], 0xc000
*            04EA8 0000:4EA8  fc                 cld     
*            04EA9 0000:4EA9  be00f4             mov     si, 0xf400
*            04EAC 0000:4EAC  bf0018             mov     di, 0x1800
*            04EAF 0000:4EAF  033e7203           add     di, word ptr [0x372]   ; math_ram (shared)
*            04EB3 0000:4EB3  bd9c03             mov     bp, 0x39c
*            04EB6 0000:4EB6  b94000             mov     cx, 0x40
*            04EB9 0000:4EB9  c7068a030000       mov     word ptr [0x38a], 0   ; math_ram (shared)
*            04EBF 0000:4EBF  e99600             jmp     0x4f58
*   L_04EC2: 04EC2 0000:4EC2  c70500c0           mov     word ptr [di], 0xc000
*            04EC6 0000:4EC6  83c708             add     di, 8
*            04EC9 0000:4EC9  e2f7               loop    0x4ec2
*            04ECB 0000:4ECB  ebd7               jmp     0x4ea4
*   L_04ECD: 04ECD 0000:4ECD  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04ED0 0000:4ED0  8bd8               mov     bx, ax
*            04ED2 0000:4ED2  d0e3               shl     bl, 1
*            04ED4 0000:4ED4  d0e3               shl     bl, 1
*            04ED6 0000:4ED6  d0e3               shl     bl, 1
*            04ED8 0000:4ED8  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            04EDB 0000:4EDB  d1c0               rol     ax, 1
*            04EDD 0000:4EDD  d1c0               rol     ax, 1
*            04EDF 0000:4EDF  d1c0               rol     ax, 1
*            04EE1 0000:4EE1  2407               and     al, 7
*            04EE3 0000:4EE3  0ac3               or      al, bl
*            04EE5 0000:4EE5  86c4               xchg    ah, al
*            04EE7 0000:4EE7  a30036             mov     word ptr [0x3600], ax   ; MATH UNIT (mul/div/geometry)
*            04EEA 0000:4EEA  eb4a               jmp     0x4f36
             04EEC 0000:4EEC  8b168203           mov     dx, word ptr [0x382]   ; math_ram (shared)
             04EF0 0000:4EF0  8b45fc             mov     ax, word ptr [di - 4]
             04EF3 0000:4EF3  8bd8               mov     bx, ax
             04EF5 0000:4EF5  8b45f8             mov     ax, word ptr [di - 8]
             04EF8 0000:4EF8  2bc3               sub     ax, bx
             04EFA 0000:4EFA  93                 xchg    bx, ax
             04EFB 0000:4EFB  2bc3               sub     ax, bx
             04EFD 0000:4EFD  52                 push    dx
             04EFE 0000:4EFE  8905               mov     word ptr [di], ax
             04F00 0000:4F00  83c704             add     di, 4
             04F03 0000:4F03  e2f6               loop    0x4efb
             04F05 0000:4F05  e9bc00             jmp     0x4fc4
*   L_04F08: 04F08 0000:4F08  8b04               mov     ax, word ptr [si]
*            04F0A 0000:4F0A  8b54fc             mov     dx, word ptr [si - 4]
*            04F0D 0000:4F0D  2bc2               sub     ax, dx
*            04F0F 0000:4F0F  a34c31             mov     word ptr [0x314c], ax   ; MATH UNIT (mul/div/geometry)
*            04F12 0000:4F12  8a5efb             mov     bl, byte ptr [bp - 5]
*            04F15 0000:4F15  32ff               xor     bh, bh
*            04F17 0000:4F17  d1e3               shl     bx, 1
*            04F19 0000:4F19  8b8704f5           mov     ax, word ptr [bx - 0xafc]
*            04F1D 0000:4F1D  8bd8               mov     bx, ax
*            04F1F 0000:4F1F  f746f80040         test    word ptr [bp - 8], 0x4000
*            04F24 0000:4F24  7502               jne     0x4f28
*            04F26 0000:4F26  f7d8               neg     ax
*   L_04F28: 04F28 0000:4F28  a38036             mov     word ptr [0x3680], ax   ; MATH UNIT (mul/div/geometry)
*            04F2B 0000:4F2B  a38203             mov     word ptr [0x382], ax   ; math_ram (shared)
*            04F2E 0000:4F2E  8bd0               mov     dx, ax
*            04F30 0000:4F30  81fb8003           cmp     bx, 0x380
*            04F34 0000:4F34  7397               jae     0x4ecd
*   L_04F36: 04F36 0000:4F36  a18403             mov     ax, word ptr [0x384]   ; math_ram (shared)
*            04F39 0000:4F39  01068036           add     word ptr [0x3680], ax   ; MATH UNIT (mul/div/geometry)
*            04F3D 0000:4F3D  d1e1               shl     cx, 1
*            04F3F 0000:4F3F  890e0437           mov     word ptr [0x3704], cx   ; MATH UNIT (mul/div/geometry)
*            04F43 0000:4F43  d1f9               sar     cx, 1
*            04F45 0000:4F45  52                 push    dx
*            04F46 0000:4F46  a08b03             mov     al, byte ptr [0x38b]   ; math_ram (shared)
*            04F49 0000:4F49  98                 cwde    
*            04F4A 0000:4F4A  03060036           add     ax, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            04F4E 0000:4F4E  8905               mov     word ptr [di], ax
*            04F50 0000:4F50  83c704             add     di, 4
*            04F53 0000:4F53  e297               loop    0x4eec
*            04F55 0000:4F55  eb6d               jmp     0x4fc4
             04F57 0000:4F57  90                 nop     
*   L_04F58: 04F58 0000:4F58  bc801a             mov     sp, 0x1a80
*            04F5B 0000:4F5B  03267203           add     sp, word ptr [0x372]   ; math_ram (shared)
*   L_04F5F: 04F5F 0000:4F5F  83c508             add     bp, 8
*            04F62 0000:4F62  8b860008           mov     ax, word ptr [bp + 0x800]
*            04F66 0000:4F66  8af4               mov     dh, ah
*            04F68 0000:4F68  80fcc0             cmp     ah, 0xc0
*            04F6B 0000:4F6B  749b               je      0x4f08
*            04F6D 0000:4F6D  3df0ff             cmp     ax, 0xfff0
*            04F70 0000:4F70  73ed               jae     0x4f5f
*            04F72 0000:4F72  25ff3f             and     ax, 0x3fff
*            04F75 0000:4F75  3b04               cmp     ax, word ptr [si]
*            04F77 0000:4F77  76e6               jbe     0x4f5f
*            04F79 0000:4F79  8b04               mov     ax, word ptr [si]
*            04F7B 0000:4F7B  83c604             add     si, 4
*            04F7E 0000:4F7E  2b4606             sub     ax, word ptr [bp + 6]
*            04F81 0000:4F81  d0d6               rcl     dh, 1
*            04F83 0000:4F83  80e43f             and     ah, 0x3f
*            04F86 0000:4F86  a34037             mov     word ptr [0x3740], ax   ; MATH UNIT (mul/div/geometry)
*            04F89 0000:4F89  8b860208           mov     ax, word ptr [bp + 0x802]
*            04F8D 0000:4F8D  d1e0               shl     ax, 1
*            04F8F 0000:4F8F  8b9e0408           mov     bx, word ptr [bp + 0x804]
*            04F93 0000:4F93  a38032             mov     word ptr [0x3280], ax   ; MATH UNIT (mul/div/geometry)
*            04F96 0000:4F96  a1003e             mov     ax, word ptr [0x3e00]   ; MATH UNIT (mul/div/geometry)
*            04F99 0000:4F99  d1e1               shl     cx, 1
*            04F9B 0000:4F9B  890e8036           mov     word ptr [0x3680], cx   ; MATH UNIT (mul/div/geometry)
*            04F9F 0000:4F9F  d1f9               sar     cx, 1
*            04FA1 0000:4FA1  d0d6               rcl     dh, 1
*            04FA3 0000:4FA3  7302               jae     0x4fa7
*            04FA5 0000:4FA5  f7d8               neg     ax
*   L_04FA7: 04FA7 0000:4FA7  50                 push    ax
*            04FA8 0000:4FA8  a18036             mov     ax, word ptr [0x3680]   ; MATH UNIT (mul/div/geometry)
*            04FAB 0000:4FAB  a38403             mov     word ptr [0x384], ax   ; math_ram (shared)
*            04FAE 0000:4FAE  a08b03             mov     al, byte ptr [0x38b]   ; math_ram (shared)
*            04FB1 0000:4FB1  98                 cwde    
*            04FB2 0000:4FB2  03060036           add     ax, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            04FB6 0000:4FB6  8905               mov     word ptr [di], ax
*            04FB8 0000:4FB8  83c704             add     di, 4
*            04FBB 0000:4FBB  a18c03             mov     ax, word ptr [0x38c]   ; math_ram (shared)
*            04FBE 0000:4FBE  01068a03           add     word ptr [0x38a], ax   ; math_ram (shared)
*            04FC2 0000:4FC2  e29e               loop    0x4f62
*   L_04FC4: 04FC4 0000:4FC4  bc0003             mov     sp, 0x300
*            04FC7 0000:4FC7  b93f00             mov     cx, 0x3f
*            04FCA 0000:4FCA  bf0218             mov     di, 0x1802
*            04FCD 0000:4FCD  033e7203           add     di, word ptr [0x372]   ; math_ram (shared)
*            04FD1 0000:4FD1  8b45fe             mov     ax, word ptr [di - 2]
*            04FD4 0000:4FD4  8bd8               mov     bx, ax
*            04FD6 0000:4FD6  2b5d02             sub     bx, word ptr [di + 2]
*            04FD9 0000:4FD9  d1fb               sar     bx, 1
*            04FDB 0000:4FDB  2bc3               sub     ax, bx
*            04FDD 0000:4FDD  8905               mov     word ptr [di], ax
*            04FDF 0000:4FDF  83c704             add     di, 4
*            04FE2 0000:4FE2  e2ed               loop    0x4fd1
*            04FE4 0000:4FE4  2bc3               sub     ax, bx
*            04FE6 0000:4FE6  8905               mov     word ptr [di], ax
*            04FE8 0000:4FE8  e90500             jmp     0x4ff0
             04FEB 0000:4FEB  2f                 das     
             04FEC 0000:4FEC  a7                 cmpsw   word ptr [si], word ptr es:[di]
             04FED 0000:4FED  195e16             sbb     word ptr [bp + 0x16], bx
*   L_04FF0: 04FF0 0000:4FF0  fc                 cld     
*            04FF1 0000:4FF1  a18003             mov     ax, word ptr [0x380]   ; math_ram (shared)
*            04FF4 0000:4FF4  a90800             test    ax, 8
*            04FF7 0000:4FF7  750b               jne     0x5004
*            04FF9 0000:4FF9  a90401             test    ax, 0x104
*            04FFC 0000:4FFC  7403               je      0x5001
*            04FFE 0000:4FFE  e9b603             jmp     0x53b7
*   L_05001: 05001 0000:5001  e934fb             jmp     0x4b38
*   L_05004: 05004 0000:5004  e98202             jmp     0x5289
*   L_05007: 05007 0000:5007  a10c10             mov     ax, word ptr [0x100c]   ; RCRAM (road, shared)
*            0500A 0000:500A  a30c31             mov     word ptr [0x310c], ax   ; MATH UNIT (mul/div/geometry)
*            0500D 0000:500D  c7068c30703f       mov     word ptr [0x308c], 0x3f70   ; MATH UNIT (mul/div/geometry)
*            05013 0000:5013  8b160e10           mov     dx, word ptr [0x100e]   ; RCRAM (road, shared)
*            05017 0000:5017  fd                 std     
*            05018 0000:5018  bf9a03             mov     di, 0x39a
*            0501B 0000:501B  90                 nop     
*            0501C 0000:501C  90                 nop     
*            0501D 0000:501D  a12437             mov     ax, word ptr [0x3724]   ; MATH UNIT (mul/div/geometry)
*            05020 0000:5020  8b1e1c10           mov     bx, word ptr [0x101c]   ; RCRAM (road, shared)
*            05024 0000:5024  d1e3               shl     bx, 1
*            05026 0000:5026  d1e3               shl     bx, 1
*            05028 0000:5028  891e0030           mov     word ptr [0x3000], bx   ; MATH UNIT (mul/div/geometry)
*            0502C 0000:502C  90                 nop     
*            0502D 0000:502D  8b1e0e30           mov     bx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            05031 0000:5031  895df4             mov     word ptr [di - 0xc], bx
*            05034 0000:5034  895df6             mov     word ptr [di - 0xa], bx
*            05037 0000:5037  e82a04             call    0x5464
*            0503A 0000:503A  be9603             mov     si, 0x396
*            0503D 0000:503D  bf9203             mov     di, 0x392
*            05040 0000:5040  ad                 lodsw   ax, word ptr [si]
*            05041 0000:5041  2d6400             sub     ax, 0x64
*            05044 0000:5044  a32437             mov     word ptr [0x3724], ax   ; MATH UNIT (mul/div/geometry)
*            05047 0000:5047  a11c10             mov     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            0504A 0000:504A  d1e0               shl     ax, 1
*            0504C 0000:504C  d1e0               shl     ax, 1
*            0504E 0000:504E  a30030             mov     word ptr [0x3000], ax   ; MATH UNIT (mul/div/geometry)
*            05051 0000:5051  90                 nop     
*            05052 0000:5052  90                 nop     
*            05053 0000:5053  8bd8               mov     bx, ax
*            05055 0000:5055  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            05058 0000:5058  ab                 stosw   word ptr es:[di], ax
*            05059 0000:5059  8b04               mov     ax, word ptr [si]
*            0505B 0000:505B  2d6400             sub     ax, 0x64
*            0505E 0000:505E  a32437             mov     word ptr [0x3724], ax   ; MATH UNIT (mul/div/geometry)
*            05061 0000:5061  891e0030           mov     word ptr [0x3000], bx   ; MATH UNIT (mul/div/geometry)
*            05065 0000:5065  90                 nop     
*            05066 0000:5066  90                 nop     
*            05067 0000:5067  90                 nop     
*            05068 0000:5068  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            0506B 0000:506B  8905               mov     word ptr [di], ax
*            0506D 0000:506D  e99400             jmp     0x5104
*   L_05070: 05070 0000:5070  b80004             mov     ax, 0x400
*            05073 0000:5073  8905               mov     word ptr [di], ax
*            05075 0000:5075  eb3c               jmp     0x50b3
*   L_05077: 05077 0000:5077  b8ff8f             mov     ax, 0x8fff
*            0507A 0000:507A  894502             mov     word ptr [di + 2], ax
*            0507D 0000:507D  e9b8fa             jmp     0x4b38
*   L_05080: 05080 0000:5080  f6c210             test    dl, 0x10
*            05083 0000:5083  7439               je      0x50be
*            05085 0000:5085  8b1e9603           mov     bx, word ptr [0x396]   ; math_ram (shared)
*            05089 0000:5089  81fbf000           cmp     bx, 0xf0
*            0508D 0000:508D  73e1               jae     0x5070
*            0508F 0000:508F  8b2e9a03           mov     bp, word ptr [0x39a]   ; math_ram (shared)
*            05093 0000:5093  2beb               sub     bp, bx
*            05095 0000:5095  d1e3               shl     bx, 1
*            05097 0000:5097  f7db               neg     bx
*            05099 0000:5099  8b80de01           mov     ax, word ptr [bx + si + 0x1de]
*            0509D 0000:509D  8b9fdef8           mov     bx, word ptr [bx - 0x722]
*            050A1 0000:50A1  058002             add     ax, 0x280
*            050A4 0000:50A4  03c3               add     ax, bx
*            050A6 0000:50A6  a3f003             mov     word ptr [0x3f0], ax   ; math_ram (shared)
*            050A9 0000:50A9  03cd               add     cx, bp
*            050AB 0000:50AB  3bc1               cmp     ax, cx
*            050AD 0000:50AD  7c02               jl      0x50b1
*            050AF 0000:50AF  8bc1               mov     ax, cx
*   L_050B1: 050B1 0000:50B1  8905               mov     word ptr [di], ax
*   L_050B3: 050B3 0000:50B3  33c0               xor     ax, ax
*            050B5 0000:50B5  894502             mov     word ptr [di + 2], ax
*            050B8 0000:50B8  894504             mov     word ptr [di + 4], ax
*            050BB 0000:50BB  e9d500             jmp     0x5193
*   L_050BE: 050BE 0000:50BE  b80004             mov     ax, 0x400
*            050C1 0000:50C1  8905               mov     word ptr [di], ax
*            050C3 0000:50C3  8945fe             mov     word ptr [di - 2], ax
*            050C6 0000:50C6  8b1e9803           mov     bx, word ptr [0x398]   ; math_ram (shared)
*            050CA 0000:50CA  81fbf000           cmp     bx, 0xf0
*            050CE 0000:50CE  73a7               jae     0x5077
*            050D0 0000:50D0  8b0e9a03           mov     cx, word ptr [0x39a]   ; math_ram (shared)
*            050D4 0000:50D4  2bcb               sub     cx, bx
*            050D6 0000:50D6  d1e3               shl     bx, 1
*            050D8 0000:50D8  f7db               neg     bx
*            050DA 0000:50DA  8b80de01           mov     ax, word ptr [bx + si + 0x1de]
*            050DE 0000:50DE  8b9fdef8           mov     bx, word ptr [bx - 0x722]
*            050E2 0000:50E2  058002             add     ax, 0x280
*            050E5 0000:50E5  2bc3               sub     ax, bx
*            050E7 0000:50E7  a3f203             mov     word ptr [0x3f2], ax   ; math_ram (shared)
*            050EA 0000:50EA  2be9               sub     bp, cx
*            050EC 0000:50EC  3bc5               cmp     ax, bp
*            050EE 0000:50EE  7f02               jg      0x50f2
*            050F0 0000:50F0  8bc5               mov     ax, bp
*   L_050F2: 050F2 0000:50F2  894502             mov     word ptr [di + 2], ax
*            050F5 0000:50F5  e99b00             jmp     0x5193
*   L_050F8: 050F8 0000:50F8  eb86               jmp     0x5080
*   L_050FA: 050FA 0000:50FA  b80004             mov     ax, 0x400
*            050FD 0000:50FD  ab                 stosw   word ptr es:[di], ax
*            050FE 0000:50FE  8bc8               mov     cx, ax
*            05100 0000:5100  33c0               xor     ax, ax
*            05102 0000:5102  eb2a               jmp     0x512e
*   L_05104: 05104 0000:5104  fc                 cld     
*            05105 0000:5105  8b367603           mov     si, word ptr [0x376]   ; math_ram (shared)
*            05109 0000:5109  bf9c03             mov     di, 0x39c
*            0510C 0000:510C  8b1e9a03           mov     bx, word ptr [0x39a]   ; math_ram (shared)
*            05110 0000:5110  81fbf000           cmp     bx, 0xf0
*            05114 0000:5114  73e4               jae     0x50fa
*            05116 0000:5116  d1e3               shl     bx, 1
*            05118 0000:5118  f7db               neg     bx
*            0511A 0000:511A  8b80de01           mov     ax, word ptr [bx + si + 0x1de]
*            0511E 0000:511E  8b9fdef8           mov     bx, word ptr [bx - 0x722]
*            05122 0000:5122  058002             add     ax, 0x280
*            05125 0000:5125  03c3               add     ax, bx
*            05127 0000:5127  ab                 stosw   word ptr es:[di], ax
*            05128 0000:5128  8bc8               mov     cx, ax
*            0512A 0000:512A  d1e3               shl     bx, 1
*            0512C 0000:512C  2bc3               sub     ax, bx
*   L_0512E: 0512E 0000:512E  894504             mov     word ptr [di + 4], ax
*            05131 0000:5131  8be8               mov     bp, ax
*            05133 0000:5133  8b168003           mov     dx, word ptr [0x380]   ; math_ram (shared)
*            05137 0000:5137  f6c201             test    dl, 1
*            0513A 0000:513A  75bc               jne     0x50f8
*            0513C 0000:513C  f6c210             test    dl, 0x10
*            0513F 0000:513F  747f               je      0x51c0
*            05141 0000:5141  8b1e9603           mov     bx, word ptr [0x396]   ; math_ram (shared)
*            05145 0000:5145  81fbf000           cmp     bx, 0xf0
*            05149 0000:5149  7365               jae     0x51b0
*            0514B 0000:514B  d1e3               shl     bx, 1
*            0514D 0000:514D  f7db               neg     bx
*            0514F 0000:514F  8b80de01           mov     ax, word ptr [bx + si + 0x1de]
*            05153 0000:5153  8b9fdef8           mov     bx, word ptr [bx - 0x722]
*            05157 0000:5157  058002             add     ax, 0x280
*            0515A 0000:515A  03c3               add     ax, bx
*            0515C 0000:515C  a3f003             mov     word ptr [0x3f0], ax   ; math_ram (shared)
*            0515F 0000:515F  3bc1               cmp     ax, cx
*            05161 0000:5161  7c02               jl      0x5165
*            05163 0000:5163  8bc1               mov     ax, cx
*   L_05165: 05165 0000:5165  8905               mov     word ptr [di], ax
*   L_05167: 05167 0000:5167  f6c220             test    dl, 0x20
*            0516A 0000:516A  745e               je      0x51ca
*   L_0516C: 0516C 0000:516C  8b1e9803           mov     bx, word ptr [0x398]   ; math_ram (shared)
*            05170 0000:5170  81fbf000           cmp     bx, 0xf0
*            05174 0000:5174  7341               jae     0x51b7
*            05176 0000:5176  d1e3               shl     bx, 1
*            05178 0000:5178  f7db               neg     bx
*            0517A 0000:517A  8b80de01           mov     ax, word ptr [bx + si + 0x1de]
*            0517E 0000:517E  8b9fdef8           mov     bx, word ptr [bx - 0x722]
*            05182 0000:5182  058002             add     ax, 0x280
*            05185 0000:5185  2bc3               sub     ax, bx
*            05187 0000:5187  a3f203             mov     word ptr [0x3f2], ax   ; math_ram (shared)
*            0518A 0000:518A  3bc5               cmp     ax, bp
*            0518C 0000:518C  7f02               jg      0x5190
*            0518E 0000:518E  8bc5               mov     ax, bp
*   L_05190: 05190 0000:5190  894502             mov     word ptr [di + 2], ax
*   L_05193: 05193 0000:5193  b90300             mov     cx, 3
*            05196 0000:5196  bf9603             mov     di, 0x396
*            05199 0000:5199  a11c10             mov     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            0519C 0000:519C  8bd8               mov     bx, ax
*            0519E 0000:519E  0305               add     ax, word ptr [di]
*            051A0 0000:51A0  3d0001             cmp     ax, 0x100
*            051A3 0000:51A3  7203               jb      0x51a8
*            051A5 0000:51A5  b8ff00             mov     ax, 0xff
*   L_051A8: 051A8 0000:51A8  ab                 stosw   word ptr es:[di], ax
*            051A9 0000:51A9  8bc3               mov     ax, bx
*            051AB 0000:51AB  e2f1               loop    0x519e
*            051AD 0000:51AD  e988f9             jmp     0x4b38
*   L_051B0: 051B0 0000:51B0  b80004             mov     ax, 0x400
*            051B3 0000:51B3  8905               mov     word ptr [di], ax
*            051B5 0000:51B5  ebb0               jmp     0x5167
*   L_051B7: 051B7 0000:51B7  b8ff8f             mov     ax, 0x8fff
*            051BA 0000:51BA  894502             mov     word ptr [di + 2], ax
*            051BD 0000:51BD  e978f9             jmp     0x4b38
*   L_051C0: 051C0 0000:51C0  b80004             mov     ax, 0x400
*            051C3 0000:51C3  8905               mov     word ptr [di], ax
*            051C5 0000:51C5  8945fe             mov     word ptr [di - 2], ax
*            051C8 0000:51C8  eba2               jmp     0x516c
*   L_051CA: 051CA 0000:51CA  33c0               xor     ax, ax
*            051CC 0000:51CC  894502             mov     word ptr [di + 2], ax
*            051CF 0000:51CF  894504             mov     word ptr [di + 4], ax
*            051D2 0000:51D2  ebbf               jmp     0x5193
*   L_051D4: 051D4 0000:51D4  8a269603           mov     ah, byte ptr [0x396]   ; math_ram (shared)
*            051D8 0000:51D8  80ecef             sub     ah, 0xef
*            051DB 0000:51DB  32c0               xor     al, al
*            051DD 0000:51DD  d1f8               sar     ax, 1
*            051DF 0000:51DF  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            051E2 0000:51E2  c70600302202       mov     word ptr [0x3000], 0x222   ; MATH UNIT (mul/div/geometry)
*            051E8 0000:51E8  8b05               mov     ax, word ptr [di]
*            051EA 0000:51EA  03060e30           add     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            051EE 0000:51EE  3d0004             cmp     ax, 0x400
*            051F1 0000:51F1  7c03               jl      0x51f6
*            051F3 0000:51F3  b80004             mov     ax, 0x400
*   L_051F6: 051F6 0000:51F6  8905               mov     word ptr [di], ax
*            051F8 0000:51F8  8a269a03           mov     ah, byte ptr [0x39a]   ; math_ram (shared)
*            051FC 0000:51FC  80ecef             sub     ah, 0xef
*            051FF 0000:51FF  32c0               xor     al, al
*            05201 0000:5201  d1f8               sar     ax, 1
*            05203 0000:5203  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            05206 0000:5206  c70600302202       mov     word ptr [0x3000], 0x222   ; MATH UNIT (mul/div/geometry)
*            0520C 0000:520C  8b45fe             mov     ax, word ptr [di - 2]
*            0520F 0000:520F  03060e30           add     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            05213 0000:5213  3d0004             cmp     ax, 0x400
*            05216 0000:5216  7c03               jl      0x521b
*            05218 0000:5218  b80004             mov     ax, 0x400
*   L_0521B: 0521B 0000:521B  8945fe             mov     word ptr [di - 2], ax
*            0521E 0000:521E  eb4c               jmp     0x526c
*   L_05220: 05220 0000:5220  a08003             mov     al, byte ptr [0x380]   ; math_ram (shared)
*            05223 0000:5223  a801               test    al, 1
*            05225 0000:5225  7445               je      0x526c
*            05227 0000:5227  bf9e03             mov     di, 0x39e
*            0522A 0000:522A  a820               test    al, 0x20
*            0522C 0000:522C  74a6               je      0x51d4
*            0522E 0000:522E  8a269803           mov     ah, byte ptr [0x398]   ; math_ram (shared)
*            05232 0000:5232  32c0               xor     al, al
*            05234 0000:5234  d1c8               ror     ax, 1
*            05236 0000:5236  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            05239 0000:5239  c7060030defd       mov     word ptr [0x3000], 0xfdde   ; MATH UNIT (mul/div/geometry)
*            0523F 0000:523F  8b4502             mov     ax, word ptr [di + 2]
*            05242 0000:5242  03060e30           add     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            05246 0000:5246  7902               jns     0x524a
*            05248 0000:5248  33c0               xor     ax, ax
*   L_0524A: 0524A 0000:524A  894502             mov     word ptr [di + 2], ax
*            0524D 0000:524D  8a269a03           mov     ah, byte ptr [0x39a]   ; math_ram (shared)
*            05251 0000:5251  32c0               xor     al, al
*            05253 0000:5253  d1c8               ror     ax, 1
*            05255 0000:5255  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            05258 0000:5258  c7060030defd       mov     word ptr [0x3000], 0xfdde   ; MATH UNIT (mul/div/geometry)
*            0525E 0000:525E  8b4504             mov     ax, word ptr [di + 4]
*            05261 0000:5261  03060e30           add     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            05265 0000:5265  7902               jns     0x5269
*            05267 0000:5267  33c0               xor     ax, ax
*   L_05269: 05269 0000:5269  894504             mov     word ptr [di + 4], ax
*   L_0526C: 0526C 0000:526C  be8e03             mov     si, 0x38e
*            0526F 0000:526F  bfe219             mov     di, 0x19e2
*            05272 0000:5272  033e7203           add     di, word ptr [0x372]   ; math_ram (shared)
*            05276 0000:5276  b90700             mov     cx, 7
*            05279 0000:5279  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            0527B 0000:527B  83c708             add     di, 8
*            0527E 0000:527E  b90400             mov     cx, 4
*            05281 0000:5281  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            05283 0000:5283  e931ee             jmp     0x40b7
*   L_05286: 05286 0000:5286  e97efd             jmp     0x5007
*   L_05289: 05289 0000:5289  a93000             test    ax, 0x30
*            0528C 0000:528C  75f8               jne     0x5286
*            0528E 0000:528E  a10c10             mov     ax, word ptr [0x100c]   ; RCRAM (road, shared)
*            05291 0000:5291  a30c31             mov     word ptr [0x310c], ax   ; MATH UNIT (mul/div/geometry)
*            05294 0000:5294  c7068c30703f       mov     word ptr [0x308c], 0x3f70   ; MATH UNIT (mul/div/geometry)
*            0529A 0000:529A  8b160e10           mov     dx, word ptr [0x100e]   ; RCRAM (road, shared)
*            0529E 0000:529E  fd                 std     
*            0529F 0000:529F  bf9a03             mov     di, 0x39a
*            052A2 0000:52A2  90                 nop     
*            052A3 0000:52A3  90                 nop     
*            052A4 0000:52A4  a12837             mov     ax, word ptr [0x3728]   ; MATH UNIT (mul/div/geometry)
*            052A7 0000:52A7  8b1e803e           mov     bx, word ptr [0x3e80]   ; MATH UNIT (mul/div/geometry)
*            052AB 0000:52AB  8b0e003e           mov     cx, word ptr [0x3e00]   ; MATH UNIT (mul/div/geometry)
*            052AF 0000:52AF  23c9               and     cx, cx
*            052B1 0000:52B1  7408               je      0x52bb
*            052B3 0000:52B3  2bd9               sub     bx, cx
*            052B5 0000:52B5  030e1c10           add     cx, word ptr [0x101c]   ; RCRAM (road, shared)
*            052B9 0000:52B9  03d9               add     bx, cx
*   L_052BB: 052BB 0000:52BB  894df4             mov     word ptr [di - 0xc], cx
*            052BE 0000:52BE  895df6             mov     word ptr [di - 0xa], bx
*            052C1 0000:52C1  e8a001             call    0x5464
*            052C4 0000:52C4  be9603             mov     si, 0x396
*            052C7 0000:52C7  ad                 lodsw   ax, word ptr [si]
*            052C8 0000:52C8  8b1c               mov     bx, word ptr [si]
*            052CA 0000:52CA  3bc3               cmp     ax, bx
*            052CC 0000:52CC  7202               jb      0x52d0
*            052CE 0000:52CE  8bc3               mov     ax, bx
*   L_052D0: 052D0 0000:52D0  813e0e101405       cmp     word ptr [0x100e], 0x514   ; RCRAM (road, shared)
*            052D6 0000:52D6  7309               jae     0x52e1
*            052D8 0000:52D8  2d6400             sub     ax, 0x64
*            052DB 0000:52DB  a32837             mov     word ptr [0x3728], ax   ; MATH UNIT (mul/div/geometry)
*            052DE 0000:52DE  a1003e             mov     ax, word ptr [0x3e00]   ; MATH UNIT (mul/div/geometry)
*   L_052E1: 052E1 0000:52E1  bf9203             mov     di, 0x392
*            052E4 0000:52E4  ab                 stosw   word ptr es:[di], ax
*            052E5 0000:52E5  ab                 stosw   word ptr es:[di], ax
*            052E6 0000:52E6  fc                 cld     
*            052E7 0000:52E7  8b367603           mov     si, word ptr [0x376]   ; math_ram (shared)
*            052EB 0000:52EB  bf9c03             mov     di, 0x39c
*            052EE 0000:52EE  8b1e9a03           mov     bx, word ptr [0x39a]   ; math_ram (shared)
*            052F2 0000:52F2  81fbf000           cmp     bx, 0xf0
*            052F6 0000:52F6  7364               jae     0x535c
*            052F8 0000:52F8  d1e3               shl     bx, 1
*            052FA 0000:52FA  f7db               neg     bx
*            052FC 0000:52FC  8b80de01           mov     ax, word ptr [bx + si + 0x1de]
*            05300 0000:5300  8b97def8           mov     dx, word ptr [bx - 0x722]
*            05304 0000:5304  058002             add     ax, 0x280
*            05307 0000:5307  03c2               add     ax, dx
*            05309 0000:5309  ab                 stosw   word ptr es:[di], ax
*            0530A 0000:530A  8bc8               mov     cx, ax
*            0530C 0000:530C  d1e2               shl     dx, 1
*            0530E 0000:530E  2bc2               sub     ax, dx
*   L_05310: 05310 0000:5310  894504             mov     word ptr [di + 4], ax
*            05313 0000:5313  8be8               mov     bp, ax
*            05315 0000:5315  8b1e9603           mov     bx, word ptr [0x396]   ; math_ram (shared)
*            05319 0000:5319  81fbf000           cmp     bx, 0xf0
*            0531D 0000:531D  7347               jae     0x5366
*            0531F 0000:531F  d1e3               shl     bx, 1
*            05321 0000:5321  f7db               neg     bx
*            05323 0000:5323  8b80de01           mov     ax, word ptr [bx + si + 0x1de]
*            05327 0000:5327  8b97def8           mov     dx, word ptr [bx - 0x722]
*            0532B 0000:532B  058002             add     ax, 0x280
*            0532E 0000:532E  03c2               add     ax, dx
*            05330 0000:5330  a3f003             mov     word ptr [0x3f0], ax   ; math_ram (shared)
*            05333 0000:5333  3bc1               cmp     ax, cx
*            05335 0000:5335  7c02               jl      0x5339
*            05337 0000:5337  8bc1               mov     ax, cx
*   L_05339: 05339 0000:5339  ab                 stosw   word ptr es:[di], ax
*            0533A 0000:533A  8b1e9803           mov     bx, word ptr [0x398]   ; math_ram (shared)
*            0533E 0000:533E  d1e3               shl     bx, 1
*            05340 0000:5340  f7db               neg     bx
*            05342 0000:5342  8b80de01           mov     ax, word ptr [bx + si + 0x1de]
*            05346 0000:5346  8b97def8           mov     dx, word ptr [bx - 0x722]
*            0534A 0000:534A  058002             add     ax, 0x280
*            0534D 0000:534D  2bc2               sub     ax, dx
*            0534F 0000:534F  a3f203             mov     word ptr [0x3f2], ax   ; math_ram (shared)
*            05352 0000:5352  3bc5               cmp     ax, bp
*            05354 0000:5354  7f02               jg      0x5358
*            05356 0000:5356  8bc5               mov     ax, bp
*   L_05358: 05358 0000:5358  8905               mov     word ptr [di], ax
*            0535A 0000:535A  eb12               jmp     0x536e
*   L_0535C: 0535C 0000:535C  b80004             mov     ax, 0x400
*            0535F 0000:535F  ab                 stosw   word ptr es:[di], ax
*            05360 0000:5360  8bc8               mov     cx, ax
*            05362 0000:5362  33c0               xor     ax, ax
*            05364 0000:5364  ebaa               jmp     0x5310
*   L_05366: 05366 0000:5366  b80004             mov     ax, 0x400
*            05369 0000:5369  ab                 stosw   word ptr es:[di], ax
*            0536A 0000:536A  33c0               xor     ax, ax
*            0536C 0000:536C  8905               mov     word ptr [di], ax
*   L_0536E: 0536E 0000:536E  a11c10             mov     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            05371 0000:5371  8bd8               mov     bx, ax
*            05373 0000:5373  bf9203             mov     di, 0x392
*            05376 0000:5376  b90500             mov     cx, 5
*            05379 0000:5379  0305               add     ax, word ptr [di]
*            0537B 0000:537B  3d0001             cmp     ax, 0x100
*            0537E 0000:537E  7203               jb      0x5383
*            05380 0000:5380  b8ff00             mov     ax, 0xff
*   L_05383: 05383 0000:5383  ab                 stosw   word ptr es:[di], ax
*            05384 0000:5384  8bc3               mov     ax, bx
*            05386 0000:5386  e2f1               loop    0x5379
*            05388 0000:5388  e9adf7             jmp     0x4b38
*   L_0538B: 0538B 0000:538B  810e80030400       or      word ptr [0x380], 4   ; math_ram (shared)
*            05391 0000:5391  3d1405             cmp     ax, 0x514
*            05394 0000:5394  a10036             mov     ax, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            05397 0000:5397  7d16               jge     0x53af
*            05399 0000:5399  056400             add     ax, 0x64
*            0539C 0000:539C  03061c10           add     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            053A0 0000:53A0  3d0001             cmp     ax, 0x100
*            053A3 0000:53A3  7203               jb      0x53a8
*            053A5 0000:53A5  b8ff00             mov     ax, 0xff
*   L_053A8: 053A8 0000:53A8  ab                 stosw   word ptr es:[di], ax
*            053A9 0000:53A9  ab                 stosw   word ptr es:[di], ax
*            053AA 0000:53AA  8905               mov     word ptr [di], ax
*            053AC 0000:53AC  e989f7             jmp     0x4b38
*   L_053AF: 053AF 0000:53AF  a11c10             mov     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            053B2 0000:53B2  057000             add     ax, 0x70
*            053B5 0000:53B5  ebf1               jmp     0x53a8
*   L_053B7: 053B7 0000:53B7  8bd0               mov     dx, ax
*            053B9 0000:53B9  a10c10             mov     ax, word ptr [0x100c]   ; RCRAM (road, shared)
*            053BC 0000:53BC  a30c31             mov     word ptr [0x310c], ax   ; MATH UNIT (mul/div/geometry)
*            053BF 0000:53BF  c7068c30703f       mov     word ptr [0x308c], 0x3f70   ; MATH UNIT (mul/div/geometry)
*            053C5 0000:53C5  bfee19             mov     di, 0x19ee
*            053C8 0000:53C8  033e7203           add     di, word ptr [0x372]   ; math_ram (shared)
*            053CC 0000:53CC  fd                 std     
*            053CD 0000:53CD  f6c204             test    dl, 4
*            053D0 0000:53D0  74b9               je      0x538b
*            053D2 0000:53D2  8bc8               mov     cx, ax
*            053D4 0000:53D4  3de104             cmp     ax, 0x4e1
*            053D7 0000:53D7  8b1e0e10           mov     bx, word ptr [0x100e]   ; RCRAM (road, shared)
*            053DB 0000:53DB  a10036             mov     ax, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            053DE 0000:53DE  7f75               jg      0x5455
*            053E0 0000:53E0  891e0c31           mov     word ptr [0x310c], bx   ; MATH UNIT (mul/div/geometry)
*            053E4 0000:53E4  c7068c30703f       mov     word ptr [0x308c], 0x3f70   ; MATH UNIT (mul/div/geometry)
*            053EA 0000:53EA  056400             add     ax, 0x64
*            053ED 0000:53ED  03061c10           add     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            053F1 0000:53F1  3d0001             cmp     ax, 0x100
*            053F4 0000:53F4  7203               jb      0x53f9
*            053F6 0000:53F6  b8ff00             mov     ax, 0xff
*   L_053F9: 053F9 0000:53F9  ab                 stosw   word ptr es:[di], ax
*            053FA 0000:53FA  81fb1405           cmp     bx, 0x514
*            053FE 0000:53FE  7d5b               jge     0x545b
*            05400 0000:5400  8bd0               mov     dx, ax
*            05402 0000:5402  a10036             mov     ax, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            05405 0000:5405  056400             add     ax, 0x64
*            05408 0000:5408  3bd0               cmp     dx, ax
*            0540A 0000:540A  7501               jne     0x540d
*            0540C 0000:540C  48                 dec     ax
*   L_0540D: 0540D 0000:540D  03061c10           add     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            05411 0000:5411  3d0001             cmp     ax, 0x100
*            05414 0000:5414  7336               jae     0x544c
*            05416 0000:5416  2b1e1010           sub     bx, word ptr [0x1010]   ; RCRAM (road, shared)
*            0541A 0000:541A  891e0c31           mov     word ptr [0x310c], bx   ; MATH UNIT (mul/div/geometry)
*            0541E 0000:541E  c7068c30703f       mov     word ptr [0x308c], 0x3f70   ; MATH UNIT (mul/div/geometry)
*            05424 0000:5424  8945fe             mov     word ptr [di - 2], ax
*            05427 0000:5427  3bd9               cmp     bx, cx
*            05429 0000:5429  7705               ja      0x5430
*            0542B 0000:542B  8915               mov     word ptr [di], dx
*            0542D 0000:542D  e908f7             jmp     0x4b38
*   L_05430: 05430 0000:5430  a10036             mov     ax, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            05433 0000:5433  056400             add     ax, 0x64
*            05436 0000:5436  03061c10           add     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            0543A 0000:543A  3d0001             cmp     ax, 0x100
*            0543D 0000:543D  7305               jae     0x5444
*            0543F 0000:543F  8905               mov     word ptr [di], ax
*            05441 0000:5441  e9f4f6             jmp     0x4b38
*   L_05444: 05444 0000:5444  b8ff00             mov     ax, 0xff
*            05447 0000:5447  8905               mov     word ptr [di], ax
*            05449 0000:5449  e9ecf6             jmp     0x4b38
*   L_0544C: 0544C 0000:544C  b8ff00             mov     ax, 0xff
*   L_0544F: 0544F 0000:544F  ab                 stosw   word ptr es:[di], ax
*            05450 0000:5450  8905               mov     word ptr [di], ax
*            05452 0000:5452  e9e3f6             jmp     0x4b38
*   L_05455: 05455 0000:5455  b87000             mov     ax, 0x70
*            05458 0000:5458  ab                 stosw   word ptr es:[di], ax
*            05459 0000:5459  ebf4               jmp     0x544f
*   L_0545B: 0545B 0000:545B  a11c10             mov     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            0545E 0000:545E  056f00             add     ax, 0x6f
*            05461 0000:5461  ebec               jmp     0x544f
             05463 0000:5463  90                 nop     
*   L_05464: 05464 0000:5464  89160c31           mov     word ptr [0x310c], dx   ; MATH UNIT (mul/div/geometry)
*            05468 0000:5468  c7068c30703f       mov     word ptr [0x308c], 0x3f70   ; MATH UNIT (mul/div/geometry)
*            0546E 0000:546E  056400             add     ax, 0x64
*            05471 0000:5471  3df000             cmp     ax, 0xf0
*            05474 0000:5474  7203               jb      0x5479
*            05476 0000:5476  b8f000             mov     ax, 0xf0
*   L_05479: 05479 0000:5479  ab                 stosw   word ptr es:[di], ax
*            0547A 0000:547A  a10036             mov     ax, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            0547D 0000:547D  056400             add     ax, 0x64
*            05480 0000:5480  3df000             cmp     ax, 0xf0
*            05483 0000:5483  7203               jb      0x5488
*            05485 0000:5485  b8f000             mov     ax, 0xf0
*   L_05488: 05488 0000:5488  ab                 stosw   word ptr es:[di], ax
*            05489 0000:5489  8905               mov     word ptr [di], ax
*            0548B 0000:548B  fc                 cld     
*            0548C 0000:548C  bbef00             mov     bx, 0xef
*            0548F 0000:548F  2b1e9a03           sub     bx, word ptr [0x39a]   ; math_ram (shared)
*            05493 0000:5493  7825               js      0x54ba
*            05495 0000:5495  d1e3               shl     bx, 1
*   L_05497: 05497 0000:5497  be04f8             mov     si, 0xf804
*            0549A 0000:549A  bf0018             mov     di, 0x1800
*            0549D 0000:549D  033e7203           add     di, word ptr [0x372]   ; math_ram (shared)
*            054A1 0000:54A1  8b11               mov     dx, word ptr [bx + di]
*   L_054A3: 054A3 0000:54A3  ad                 lodsw   ax, word ptr [si]
*            054A4 0000:54A4  3bc3               cmp     ax, bx
*            054A6 0000:54A6  72fb               jb      0x54a3
*            054A8 0000:54A8  8bc8               mov     cx, ax
*            054AA 0000:54AA  a18003             mov     ax, word ptr [0x380]   ; math_ram (shared)
*            054AD 0000:54AD  a801               test    al, 1
*            054AF 0000:54AF  750d               jne     0x54be
      054B1 0000:54B1  db   '$0< u'
             054B6 0000:54B6  13e9               adc     bp, cx
             054B8 0000:54B8  830033             add     word ptr [bx + si], 0x33
             054BB 0000:54BB  dbeb               fucomi  st(3)
             054BD 0000:54BD  d924               fldenv  [si]
      054BF 0000:54BF  db   '0< u'
             054C3 0000:54C3  03e9               add     bp, cx
             054C5 0000:54C5  47                 inc     di
             054C6 0000:54C6  01e9               add     cx, bp
             054C8 0000:54C8  d400               aam     0
*   L_054CA: 054CA 0000:54CA  039700f7           add     dx, word ptr [bx - 0x900]
*            054CE 0000:54CE  83c202             add     dx, 2
*            054D1 0000:54D1  b8ef00             mov     ax, 0xef
*            054D4 0000:54D4  2b069603           sub     ax, word ptr [0x396]   ; math_ram (shared)
*            054D8 0000:54D8  d1e0               shl     ax, 1
*            054DA 0000:54DA  91                 xchg    cx, ax
*            054DB 0000:54DB  56                 push    si
*            054DC 0000:54DC  53                 push    bx
*   L_054DD: 054DD 0000:54DD  3bc1               cmp     ax, cx
*            054DF 0000:54DF  731c               jae     0x54fd
*            054E1 0000:54E1  8be8               mov     bp, ax
*            054E3 0000:54E3  8b03               mov     ax, word ptr [bp + di]
*            054E5 0000:54E5  038600f7           add     ax, word ptr [bp - 0x900]
*            054E9 0000:54E9  3bc2               cmp     ax, dx
*            054EB 0000:54EB  7d0e               jge     0x54fb
*            054ED 0000:54ED  8bd0               mov     dx, ax
*            054EF 0000:54EF  8bdd               mov     bx, bp
*            054F1 0000:54F1  83c202             add     dx, 2
*            054F4 0000:54F4  83c602             add     si, 2
*            054F7 0000:54F7  8b04               mov     ax, word ptr [si]
*            054F9 0000:54F9  ebe2               jmp     0x54dd
*   L_054FB: 054FB 0000:54FB  8bcd               mov     cx, bp
*   L_054FD: 054FD 0000:54FD  83ea02             sub     dx, 2
*   L_05500: 05500 0000:5500  83c302             add     bx, 2
*            05503 0000:5503  3bd9               cmp     bx, cx
*            05505 0000:5505  7314               jae     0x551b
*            05507 0000:5507  83c202             add     dx, 2
*            0550A 0000:550A  8b01               mov     ax, word ptr [bx + di]
*            0550C 0000:550C  038700f7           add     ax, word ptr [bx - 0x900]
*            05510 0000:5510  3bc2               cmp     ax, dx
*            05512 0000:5512  7d0b               jge     0x551f
*            05514 0000:5514  8bd0               mov     dx, ax
*            05516 0000:5516  83c202             add     dx, 2
*            05519 0000:5519  ebe5               jmp     0x5500
*   L_0551B: 0551B 0000:551B  8bd9               mov     bx, cx
*            0551D 0000:551D  eb03               jmp     0x5522
*   L_0551F: 0551F 0000:551F  83eb02             sub     bx, 2
*   L_05522: 05522 0000:5522  b8ef00             mov     ax, 0xef
*            05525 0000:5525  d1fb               sar     bx, 1
*            05527 0000:5527  2bc3               sub     ax, bx
*            05529 0000:5529  a39603             mov     word ptr [0x396], ax   ; math_ram (shared)
*            0552C 0000:552C  5b                 pop     bx
*            0552D 0000:552D  5e                 pop     si
*            0552E 0000:552E  a18003             mov     ax, word ptr [0x380]   ; math_ram (shared)
*            05531 0000:5531  2430               and     al, 0x30
*            05533 0000:5533  3c10               cmp     al, 0x10
*            05535 0000:5535  7501               jne     0x5538
*            05537 0000:5537  c3                 ret     
*   L_05538: 05538 0000:5538  8b11               mov     dx, word ptr [bx + di]
*            0553A 0000:553A  8b4cfe             mov     cx, word ptr [si - 2]
*   L_0553D: 0553D 0000:553D  2b9700f7           sub     dx, word ptr [bx - 0x900]
*            05541 0000:5541  83ea02             sub     dx, 2
*            05544 0000:5544  b8ef00             mov     ax, 0xef
*            05547 0000:5547  2b069803           sub     ax, word ptr [0x398]   ; math_ram (shared)
*            0554B 0000:554B  d1e0               shl     ax, 1
*            0554D 0000:554D  91                 xchg    cx, ax
*   L_0554E: 0554E 0000:554E  3bc1               cmp     ax, cx
*            05550 0000:5550  731c               jae     0x556e
*            05552 0000:5552  8be8               mov     bp, ax
*            05554 0000:5554  8b03               mov     ax, word ptr [bp + di]
*            05556 0000:5556  2b8600f7           sub     ax, word ptr [bp - 0x900]
*            0555A 0000:555A  3bc2               cmp     ax, dx
*            0555C 0000:555C  7e0e               jle     0x556c
*            0555E 0000:555E  8bd0               mov     dx, ax
*            05560 0000:5560  8bdd               mov     bx, bp
*            05562 0000:5562  83ea02             sub     dx, 2
*            05565 0000:5565  83c602             add     si, 2
*            05568 0000:5568  8b04               mov     ax, word ptr [si]
*            0556A 0000:556A  ebe2               jmp     0x554e
*   L_0556C: 0556C 0000:556C  8bcd               mov     cx, bp
*   L_0556E: 0556E 0000:556E  83c202             add     dx, 2
*   L_05571: 05571 0000:5571  83c302             add     bx, 2
*            05574 0000:5574  3bd9               cmp     bx, cx
*            05576 0000:5576  7314               jae     0x558c
*            05578 0000:5578  83ea02             sub     dx, 2
*            0557B 0000:557B  8b01               mov     ax, word ptr [bx + di]
*            0557D 0000:557D  2b8700f7           sub     ax, word ptr [bx - 0x900]
*            05581 0000:5581  3bc2               cmp     ax, dx
*            05583 0000:5583  7e0b               jle     0x5590
*            05585 0000:5585  8bd0               mov     dx, ax
*            05587 0000:5587  83ea02             sub     dx, 2
*            0558A 0000:558A  ebe5               jmp     0x5571
*   L_0558C: 0558C 0000:558C  8bd9               mov     bx, cx
*            0558E 0000:558E  eb03               jmp     0x5593
*   L_05590: 05590 0000:5590  83eb02             sub     bx, 2
*   L_05593: 05593 0000:5593  b8ef00             mov     ax, 0xef
*            05596 0000:5596  d1fb               sar     bx, 1
*            05598 0000:5598  2bc3               sub     ax, bx
*            0559A 0000:559A  a39803             mov     word ptr [0x398], ax   ; math_ram (shared)
*            0559D 0000:559D  c3                 ret     
*   L_0559E: 0559E 0000:559E  039700f7           add     dx, word ptr [bx - 0x900]
*            055A2 0000:55A2  83c202             add     dx, 2
*            055A5 0000:55A5  b8ef00             mov     ax, 0xef
*            055A8 0000:55A8  2b069603           sub     ax, word ptr [0x396]   ; math_ram (shared)
*            055AC 0000:55AC  d1e0               shl     ax, 1
*            055AE 0000:55AE  91                 xchg    cx, ax
*            055AF 0000:55AF  8be8               mov     bp, ax
*   L_055B1: 055B1 0000:55B1  3bc1               cmp     ax, cx
*            055B3 0000:55B3  7326               jae     0x55db
*            055B5 0000:55B5  51                 push    cx
*            055B6 0000:55B6  8bcd               mov     cx, bp
*            055B8 0000:55B8  2bc8               sub     cx, ax
*            055BA 0000:55BA  d1f9               sar     cx, 1
*            055BC 0000:55BC  8be8               mov     bp, ax
*            055BE 0000:55BE  8b03               mov     ax, word ptr [bp + di]
*            055C0 0000:55C0  038600f7           add     ax, word ptr [bp - 0x900]
*            055C4 0000:55C4  03c8               add     cx, ax
*            055C6 0000:55C6  3bca               cmp     cx, dx
*            055C8 0000:55C8  59                 pop     cx
*            055C9 0000:55C9  7d0e               jge     0x55d9
*            055CB 0000:55CB  8bd0               mov     dx, ax
*            055CD 0000:55CD  8bdd               mov     bx, bp
*            055CF 0000:55CF  83c202             add     dx, 2
*            055D2 0000:55D2  83c602             add     si, 2
*            055D5 0000:55D5  8b04               mov     ax, word ptr [si]
*            055D7 0000:55D7  ebd8               jmp     0x55b1
*   L_055D9: 055D9 0000:55D9  8bcd               mov     cx, bp
*   L_055DB: 055DB 0000:55DB  83ea02             sub     dx, 2
*   L_055DE: 055DE 0000:55DE  83c302             add     bx, 2
*            055E1 0000:55E1  3bd9               cmp     bx, cx
*            055E3 0000:55E3  7317               jae     0x55fc
*            055E5 0000:55E5  83c202             add     dx, 2
*            055E8 0000:55E8  8b01               mov     ax, word ptr [bx + di]
*            055EA 0000:55EA  038700f7           add     ax, word ptr [bx - 0x900]
*            055EE 0000:55EE  8be8               mov     bp, ax
*            055F0 0000:55F0  4d                 dec     bp
*            055F1 0000:55F1  3bea               cmp     bp, dx
*            055F3 0000:55F3  7d0b               jge     0x5600
*            055F5 0000:55F5  8bd0               mov     dx, ax
*            055F7 0000:55F7  83c202             add     dx, 2
*            055FA 0000:55FA  ebe2               jmp     0x55de
*   L_055FC: 055FC 0000:55FC  8bd9               mov     bx, cx
*            055FE 0000:55FE  eb03               jmp     0x5603
*   L_05600: 05600 0000:5600  83eb02             sub     bx, 2
*   L_05603: 05603 0000:5603  b8ef00             mov     ax, 0xef
*            05606 0000:5606  d1fb               sar     bx, 1
*            05608 0000:5608  2bc3               sub     ax, bx
*            0560A 0000:560A  a39603             mov     word ptr [0x396], ax   ; math_ram (shared)
*            0560D 0000:560D  c3                 ret     
*   L_0560E: 0560E 0000:560E  2b9700f7           sub     dx, word ptr [bx - 0x900]
*            05612 0000:5612  83ea02             sub     dx, 2
*            05615 0000:5615  b8ef00             mov     ax, 0xef
*            05618 0000:5618  2b069803           sub     ax, word ptr [0x398]   ; math_ram (shared)
*            0561C 0000:561C  d1e0               shl     ax, 1
*            0561E 0000:561E  91                 xchg    cx, ax
*            0561F 0000:561F  8be8               mov     bp, ax
*   L_05621: 05621 0000:5621  3bc1               cmp     ax, cx
*            05623 0000:5623  7326               jae     0x564b
*            05625 0000:5625  51                 push    cx
*            05626 0000:5626  8bc8               mov     cx, ax
*            05628 0000:5628  2bcd               sub     cx, bp
*            0562A 0000:562A  d1f9               sar     cx, 1
*            0562C 0000:562C  8be8               mov     bp, ax
*            0562E 0000:562E  8b03               mov     ax, word ptr [bp + di]
*            05630 0000:5630  2b8600f7           sub     ax, word ptr [bp - 0x900]
*            05634 0000:5634  03c8               add     cx, ax
*            05636 0000:5636  3bca               cmp     cx, dx
*            05638 0000:5638  59                 pop     cx
*            05639 0000:5639  7e0e               jle     0x5649
*            0563B 0000:563B  8bd0               mov     dx, ax
*            0563D 0000:563D  8bdd               mov     bx, bp
*            0563F 0000:563F  83ea02             sub     dx, 2
*            05642 0000:5642  83c602             add     si, 2
*            05645 0000:5645  8b04               mov     ax, word ptr [si]
*            05647 0000:5647  ebd8               jmp     0x5621
*   L_05649: 05649 0000:5649  8bcd               mov     cx, bp
*   L_0564B: 0564B 0000:564B  83c202             add     dx, 2
*   L_0564E: 0564E 0000:564E  83c302             add     bx, 2
*            05651 0000:5651  3bd9               cmp     bx, cx
*            05653 0000:5653  7317               jae     0x566c
*            05655 0000:5655  83ea02             sub     dx, 2
*            05658 0000:5658  8b01               mov     ax, word ptr [bx + di]
*            0565A 0000:565A  2b8700f7           sub     ax, word ptr [bx - 0x900]
*            0565E 0000:565E  8be8               mov     bp, ax
*            05660 0000:5660  45                 inc     bp
*            05661 0000:5661  3bea               cmp     bp, dx
*            05663 0000:5663  7e0b               jle     0x5670
*            05665 0000:5665  8bd0               mov     dx, ax
*            05667 0000:5667  83ea02             sub     dx, 2
*            0566A 0000:566A  ebe2               jmp     0x564e
*   L_0566C: 0566C 0000:566C  8bd9               mov     bx, cx
*            0566E 0000:566E  eb03               jmp     0x5673
*   L_05670: 05670 0000:5670  83eb02             sub     bx, 2
*   L_05673: 05673 0000:5673  b8ef00             mov     ax, 0xef
*            05676 0000:5676  d1fb               sar     bx, 1
*            05678 0000:5678  2bc3               sub     ax, bx
*            0567A 0000:567A  a39803             mov     word ptr [0x398], ax   ; math_ram (shared)
*            0567D 0000:567D  c3                 ret     
*   L_0567E: 0567E 0000:567E  a10210             mov     ax, word ptr [0x1002]   ; RCRAM (road, shared)
*            05681 0000:5681  a30400             mov     word ptr [4], ax   ; math_ram (shared)
*            05684 0000:5684  90                 nop     
*            05685 0000:5685  90                 nop     
*            05686 0000:5686  90                 nop     
*            05687 0000:5687  33ed               xor     bp, bp
*            05689 0000:5689  fc                 cld     
*            0568A 0000:568A  be0000             mov     si, 0
*            0568D 0000:568D  b90020             mov     cx, 0x2000
*            05690 0000:5690  2bc0               sub     ax, ax
*            05692 0000:5692  2bd2               sub     dx, dx
*            05694 0000:5694  2e0204             add     al, byte ptr cs:[si]
*            05697 0000:5697  12e6               adc     ah, dh
*            05699 0000:5699  83c602             add     si, 2
*            0569C 0000:569C  e2f6               loop    0x5694
*            0569E 0000:569E  8bf8               mov     di, ax
*            056A0 0000:56A0  b90020             mov     cx, 0x2000
*            056A3 0000:56A3  be0100             mov     si, 1
*            056A6 0000:56A6  33c0               xor     ax, ax
*            056A8 0000:56A8  2e0204             add     al, byte ptr cs:[si]
*            056AB 0000:56AB  12e6               adc     ah, dh
*            056AD 0000:56AD  83c602             add     si, 2
*            056B0 0000:56B0  e2f6               loop    0x56a8
*            056B2 0000:56B2  893e7006           mov     word ptr [0x670], di   ; math_ram (shared)
*            056B6 0000:56B6  a37206             mov     word ptr [0x672], ax   ; math_ram (shared)
*            056B9 0000:56B9  03f8               add     di, ax
*            056BB 0000:56BB  a140f8             mov     ax, word ptr [0xf840]
*            056BE 0000:56BE  2bf8               sub     di, ax
*            056C0 0000:56C0  81c7fe01           add     di, 0x1fe
*            056C4 0000:56C4  8a1640f8           mov     dl, byte ptr [0xf840]
*            056C8 0000:56C8  2bfa               sub     di, dx
*            056CA 0000:56CA  8a1641f8           mov     dl, byte ptr [0xf841]
*            056CE 0000:56CE  2bfa               sub     di, dx
*            056D0 0000:56D0  ba0000             mov     dx, 0
*            056D3 0000:56D3  740b               je      0x56e0
*            056D5 0000:56D5  3dffff             cmp     ax, 0xffff
*            056D8 0000:56D8  7403               je      0x56dd
*            056DA 0000:56DA  e8b701             call    0x5894
*   L_056DD: 056DD 0000:56DD  bd00ff             mov     bp, 0xff00
*   L_056E0: 056E0 0000:56E0  81e500ff           and     bp, 0xff00
*            056E4 0000:56E4  bf84f8             mov     di, 0xf884
*            056E7 0000:56E7  e86401             call    0x584e
*            056EA 0000:56EA  f7c5ff00           test    bp, 0xff
*            056EE 0000:56EE  740d               je      0x56fd
*            056F0 0000:56F0  c706060084f8       mov     word ptr [6], 0xf884   ; math_ram (shared)
*            056F6 0000:56F6  e8c101             call    0x58ba
*            056F9 0000:56F9  81e500ff           and     bp, 0xff00
*   L_056FD: 056FD 0000:56FD  bf8af8             mov     di, 0xf88a
*            05700 0000:5700  e84b01             call    0x584e
*            05703 0000:5703  f7c5ff00           test    bp, 0xff
*            05707 0000:5707  740d               je      0x5716
*            05709 0000:5709  c70606008af8       mov     word ptr [6], 0xf88a   ; math_ram (shared)
*            0570F 0000:570F  e8a801             call    0x58ba
*            05712 0000:5712  81e500ff           and     bp, 0xff00
*   L_05716: 05716 0000:5716  bf90f8             mov     di, 0xf890
*            05719 0000:5719  baaa55             mov     dx, 0x55aa
*            0571C 0000:571C  be0020             mov     si, 0x2000
*            0571F 0000:571F  8914               mov     word ptr [si], dx
*            05721 0000:5721  8b04               mov     ax, word ptr [si]
*            05723 0000:5723  3bc2               cmp     ax, dx
*            05725 0000:5725  740c               je      0x5733
*            05727 0000:5727  b90100             mov     cx, 1
*            0572A 0000:572A  e85401             call    0x5881
*            0572D 0000:572D  c704ffff           mov     word ptr [si], 0xffff
*            05731 0000:5731  eb0d               jmp     0x5740
*   L_05733: 05733 0000:5733  c704ffff           mov     word ptr [si], 0xffff
*            05737 0000:5737  e81401             call    0x584e
*            0573A 0000:573A  f7c5ff00           test    bp, 0xff
*            0573E 0000:573E  740d               je      0x574d
*   L_05740: 05740 0000:5740  c706060090f8       mov     word ptr [6], 0xf890   ; math_ram (shared)
*            05746 0000:5746  e87101             call    0x58ba
*            05749 0000:5749  81e500ff           and     bp, 0xff00
*   L_0574D: 0574D 0000:574D  bf96f8             mov     di, 0xf896
*            05750 0000:5750  e8fb00             call    0x584e
*            05753 0000:5753  f7c5ff00           test    bp, 0xff
*            05757 0000:5757  740d               je      0x5766
*            05759 0000:5759  c706060096f8       mov     word ptr [6], 0xf896   ; math_ram (shared)
*            0575F 0000:575F  e85801             call    0x58ba
*            05762 0000:5762  81e500ff           and     bp, 0xff00
*   L_05766: 05766 0000:5766  bf9cf8             mov     di, 0xf89c
*            05769 0000:5769  e8e200             call    0x584e
*            0576C 0000:576C  f7c5ff00           test    bp, 0xff
*            05770 0000:5770  7409               je      0x577b
*            05772 0000:5772  c70606009cf8       mov     word ptr [6], 0xf89c   ; math_ram (shared)
*            05778 0000:5778  e83f01             call    0x58ba
*   L_0577B: 0577B 0000:577B  33c0               xor     ax, ax
*            0577D 0000:577D  a32637             mov     word ptr [0x3726], ax   ; MATH UNIT (mul/div/geometry)
*            05780 0000:5780  bf5006             mov     di, 0x650
*            05783 0000:5783  b90800             mov     cx, 8
*            05786 0000:5786  8bd8               mov     bx, ax
*            05788 0000:5788  8bf0               mov     si, ax
*            0578A 0000:578A  51                 push    cx
*            0578B 0000:578B  b90008             mov     cx, 0x800
*            0578E 0000:578E  8bc3               mov     ax, bx
*            05790 0000:5790  0206013e           add     al, byte ptr [0x3e01]   ; MATH UNIT (mul/div/geometry)
*            05794 0000:5794  12e7               adc     ah, bh
*            05796 0000:5796  46                 inc     si
*            05797 0000:5797  89360036           mov     word ptr [0x3600], si   ; MATH UNIT (mul/div/geometry)
*            0579B 0000:579B  e2f3               loop    0x5790
*            0579D 0000:579D  b90008             mov     cx, 0x800
*            057A0 0000:57A0  ab                 stosw   word ptr es:[di], ax
*            057A1 0000:57A1  8bc3               mov     ax, bx
*            057A3 0000:57A3  0206003e           add     al, byte ptr [0x3e00]   ; MATH UNIT (mul/div/geometry)
*            057A7 0000:57A7  12e7               adc     ah, bh
*            057A9 0000:57A9  46                 inc     si
*            057AA 0000:57AA  89360036           mov     word ptr [0x3600], si   ; MATH UNIT (mul/div/geometry)
*            057AE 0000:57AE  e2f3               loop    0x57a3
*            057B0 0000:57B0  ab                 stosw   word ptr es:[di], ax
*            057B1 0000:57B1  59                 pop     cx
*            057B2 0000:57B2  891e8036           mov     word ptr [0x3680], bx   ; MATH UNIT (mul/div/geometry)
*            057B6 0000:57B6  e2d2               loop    0x578a
*            057B8 0000:57B8  be42f8             mov     si, 0xf842
*            057BB 0000:57BB  bb5006             mov     bx, 0x650
*            057BE 0000:57BE  b91000             mov     cx, 0x10
*            057C1 0000:57C1  ad                 lodsw   ax, word ptr [si]
*            057C2 0000:57C2  3b07               cmp     ax, word ptr [bx]
*            057C4 0000:57C4  7507               jne     0x57cd
*            057C6 0000:57C6  83c302             add     bx, 2
*            057C9 0000:57C9  e2f6               loop    0x57c1
*            057CB 0000:57CB  eb03               jmp     0x57d0
*   L_057CD: 057CD 0000:57CD  e8bf01             call    0x598f
*   L_057D0: 057D0 0000:57D0  c70608000000       mov     word ptr [8], 0   ; math_ram (shared)
*            057D6 0000:57D6  81e500ff           and     bp, 0xff00
*            057DA 0000:57DA  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            057DD 0000:57DD  32c9               xor     cl, cl
*            057DF 0000:57DF  fc                 cld     
*            057E0 0000:57E0  be84fa             mov     si, 0xfa84
*   L_057E3: 057E3 0000:57E3  8a2c               mov     ch, byte ptr [si]
*            057E5 0000:57E5  80fdff             cmp     ch, 0xff
*            057E8 0000:57E8  7420               je      0x580a
*            057EA 0000:57EA  46                 inc     si
*            057EB 0000:57EB  ad                 lodsw   ax, word ptr [si]
*            057EC 0000:57EC  8bd8               mov     bx, ax
*            057EE 0000:57EE  ad                 lodsw   ax, word ptr [si]
*            057EF 0000:57EF  f6c580             test    ch, 0x80
*            057F2 0000:57F2  7404               je      0x57f8
*            057F4 0000:57F4  8907               mov     word ptr [bx], ax
*            057F6 0000:57F6  ebeb               jmp     0x57e3
*   L_057F8: 057F8 0000:57F8  8b1f               mov     bx, word ptr [bx]
*            057FA 0000:57FA  3bc3               cmp     ax, bx
*            057FC 0000:57FC  74e5               je      0x57e3
*            057FE 0000:57FE  a37406             mov     word ptr [0x674], ax   ; math_ram (shared)
*            05801 0000:5801  891e7606           mov     word ptr [0x676], bx   ; math_ram (shared)
*            05805 0000:5805  e8be01             call    0x59c6
*            05808 0000:5808  ebd9               jmp     0x57e3
*   L_0580A: 0580A 0000:580A  f7c5ff00           test    bp, 0xff
*            0580E 0000:580E  7403               je      0x5813
*            05810 0000:5810  e81c00             call    0x582f
*   L_05813: 05813 0000:5813  f7c500ff           test    bp, 0xff00
*            05817 0000:5817  740e               je      0x5827
*            05819 0000:5819  bf0014             mov     di, 0x1400
*            0581C 0000:581C  be44fa             mov     si, 0xfa44
*            0581F 0000:581F  b91200             mov     cx, 0x12
*            05822 0000:5822  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            05824 0000:5824  e80800             call    0x582f
*   L_05827: 05827 0000:5827  c70602100000       mov     word ptr [0x1002], 0   ; RCRAM (road, shared)
*            0582D 0000:582D  fc                 cld     
*            0582E 0000:582E  c3                 ret     
*   L_0582F: 0582F 0000:582F  bd00ff             mov     bp, 0xff00
*            05832 0000:5832  c70602100020       mov     word ptr [0x1002], 0x2000   ; RCRAM (road, shared)
*            05838 0000:5838  f606050008         test    byte ptr [5], 8   ; math_ram (shared)
*            0583D 0000:583D  7502               jne     0x5841
*            0583F 0000:583F  58                 pop     ax
*            05840 0000:5840  c3                 ret     
*   L_05841: 05841 0000:5841  f606031004         test    byte ptr [0x1003], 4   ; RCRAM (road, shared)
*            05846 0000:5846  74f9               je      0x5841
*            05848 0000:5848  80260310fb         and     byte ptr [0x1003], 0xfb   ; RCRAM (road, shared)
*            0584D 0000:584D  c3                 ret     
*   L_0584E: 0584E 0000:584E  bb72f8             mov     bx, 0xf872
*   L_05851: 05851 0000:5851  8b07               mov     ax, word ptr [bx]
*            05853 0000:5853  3dffff             cmp     ax, 0xffff
*            05856 0000:5856  743b               je      0x5893
*            05858 0000:5858  8bd0               mov     dx, ax
*            0585A 0000:585A  8b35               mov     si, word ptr [di]
*            0585C 0000:585C  8b4d02             mov     cx, word ptr [di + 2]
*            0585F 0000:585F  8904               mov     word ptr [si], ax
*            05861 0000:5861  034702             add     ax, word ptr [bx + 2]
*            05864 0000:5864  83c602             add     si, 2
*            05867 0000:5867  e2f6               loop    0x585f
*            05869 0000:5869  8b35               mov     si, word ptr [di]
*            0586B 0000:586B  8b4d02             mov     cx, word ptr [di + 2]
*            0586E 0000:586E  8b04               mov     ax, word ptr [si]
*            05870 0000:5870  3bc2               cmp     ax, dx
*            05872 0000:5872  750d               jne     0x5881
*            05874 0000:5874  83c602             add     si, 2
*            05877 0000:5877  035702             add     dx, word ptr [bx + 2]
*            0587A 0000:587A  e2f2               loop    0x586e
*            0587C 0000:587C  83c304             add     bx, 4
*            0587F 0000:587F  ebd0               jmp     0x5851
*   L_05881: 05881 0000:5881  89360000           mov     word ptr [0], si   ; math_ram (shared)
*            05885 0000:5885  890e0200           mov     word ptr [2], cx   ; math_ram (shared)
*            05889 0000:5889  89167406           mov     word ptr [0x674], dx   ; math_ram (shared)
*            0588D 0000:588D  a37606             mov     word ptr [0x676], ax   ; math_ram (shared)
*            05890 0000:5890  bdffff             mov     bp, 0xffff
*   L_05893: 05893 0000:5893  c3                 ret     
*   L_05894: 05894 0000:5894  bf0014             mov     di, 0x1400
*            05897 0000:5897  bea2f8             mov     si, 0xf8a2
*            0589A 0000:589A  b93400             mov     cx, 0x34
*            0589D 0000:589D  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            0589F 0000:589F  bf5614             mov     di, 0x1456
*            058A2 0000:58A2  a17206             mov     ax, word ptr [0x672]   ; math_ram (shared)
*            058A5 0000:58A5  e87f01             call    0x5a27
*            058A8 0000:58A8  ab                 stosw   word ptr es:[di], ax
*            058A9 0000:58A9  8915               mov     word ptr [di], dx
*            058AB 0000:58AB  83c70b             add     di, 0xb
*            058AE 0000:58AE  a17006             mov     ax, word ptr [0x670]   ; math_ram (shared)
*            058B1 0000:58B1  e87301             call    0x5a27
*            058B4 0000:58B4  ab                 stosw   word ptr es:[di], ax
*            058B5 0000:58B5  8915               mov     word ptr [di], dx
*            058B7 0000:58B7  e975ff             jmp     0x582f
*   L_058BA: 058BA 0000:58BA  bf0014             mov     di, 0x1400
*            058BD 0000:58BD  be0af9             mov     si, 0xf90a
*            058C0 0000:58C0  b93000             mov     cx, 0x30
*            058C3 0000:58C3  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            058C5 0000:58C5  56                 push    si
*            058C6 0000:58C6  57                 push    di
*            058C7 0000:58C7  bf1414             mov     di, 0x1414
*            058CA 0000:58CA  a10000             mov     ax, word ptr [0]   ; math_ram (shared)
*            058CD 0000:58CD  e85701             call    0x5a27
*            058D0 0000:58D0  ab                 stosw   word ptr es:[di], ax
*            058D1 0000:58D1  8915               mov     word ptr [di], dx
*            058D3 0000:58D3  83c705             add     di, 5
*            058D6 0000:58D6  a17606             mov     ax, word ptr [0x676]   ; math_ram (shared)
*            058D9 0000:58D9  e84b01             call    0x5a27
*            058DC 0000:58DC  ab                 stosw   word ptr es:[di], ax
*            058DD 0000:58DD  8915               mov     word ptr [di], dx
*            058DF 0000:58DF  bf0b14             mov     di, 0x140b
*            058E2 0000:58E2  be0600             mov     si, 6
*            058E5 0000:58E5  8b34               mov     si, word ptr [si]
*            058E7 0000:58E7  83c604             add     si, 4
*            058EA 0000:58EA  a4                 movsb   byte ptr es:[di], byte ptr [si]
*            058EB 0000:58EB  5f                 pop     di
*            058EC 0000:58EC  c70608000000       mov     word ptr [8], 0   ; math_ram (shared)
*            058F2 0000:58F2  e84500             call    0x593a
*            058F5 0000:58F5  5e                 pop     si
*            058F6 0000:58F6  a5                 movsw   word ptr es:[di], word ptr [si]
*            058F7 0000:58F7  57                 push    di
*            058F8 0000:58F8  bf5f14             mov     di, 0x145f
*            058FB 0000:58FB  a10800             mov     ax, word ptr [8]   ; math_ram (shared)
*            058FE 0000:58FE  8bd8               mov     bx, ax
*            05900 0000:5900  d1e0               shl     ax, 1
*            05902 0000:5902  d1e0               shl     ax, 1
*            05904 0000:5904  d1e0               shl     ax, 1
*            05906 0000:5906  d1e0               shl     ax, 1
*            05908 0000:5908  2bc3               sub     ax, bx
*            0590A 0000:590A  8805               mov     byte ptr [di], al
*            0590C 0000:590C  bf0000             mov     di, 0
*            0590F 0000:590F  be0600             mov     si, 6
*            05912 0000:5912  8b34               mov     si, word ptr [si]
*            05914 0000:5914  a5                 movsw   word ptr es:[di], word ptr [si]
*            05915 0000:5915  a5                 movsw   word ptr es:[di], word ptr [si]
*            05916 0000:5916  5f                 pop     di
*            05917 0000:5917  57                 push    di
*            05918 0000:5918  47                 inc     di
*            05919 0000:5919  c70608000000       mov     word ptr [8], 0   ; math_ram (shared)
*            0591F 0000:591F  e81800             call    0x593a
*            05922 0000:5922  c605ff             mov     byte ptr [di], 0xff
*            05925 0000:5925  5f                 pop     di
*            05926 0000:5926  a10800             mov     ax, word ptr [8]   ; math_ram (shared)
*            05929 0000:5929  8bd8               mov     bx, ax
*            0592B 0000:592B  d1e0               shl     ax, 1
*            0592D 0000:592D  d1e0               shl     ax, 1
*            0592F 0000:592F  d1e0               shl     ax, 1
*            05931 0000:5931  d1e0               shl     ax, 1
*            05933 0000:5933  2bc3               sub     ax, bx
*            05935 0000:5935  8805               mov     byte ptr [di], al
*            05937 0000:5937  e9f5fe             jmp     0x582f
*   L_0593A: 0593A 0000:593A  57                 push    di
*            0593B 0000:593B  bf0000             mov     di, 0
*            0593E 0000:593E  81e500ff           and     bp, 0xff00
*            05942 0000:5942  e809ff             call    0x584e
*            05945 0000:5945  f7c5ff00           test    bp, 0xff
*            05949 0000:5949  5f                 pop     di
*            0594A 0000:594A  743e               je      0x598a
*            0594C 0000:594C  a10000             mov     ax, word ptr [0]   ; math_ram (shared)
*            0594F 0000:594F  e8d500             call    0x5a27
*            05952 0000:5952  ab                 stosw   word ptr es:[di], ax
*            05953 0000:5953  8bc2               mov     ax, dx
*            05955 0000:5955  ab                 stosw   word ptr es:[di], ax
*            05956 0000:5956  b020               mov     al, 0x20
*            05958 0000:5958  aa                 stosb   byte ptr es:[di], al
*            05959 0000:5959  a17406             mov     ax, word ptr [0x674]   ; math_ram (shared)
*            0595C 0000:595C  e8c800             call    0x5a27
*            0595F 0000:595F  ab                 stosw   word ptr es:[di], ax
*            05960 0000:5960  8bc2               mov     ax, dx
*            05962 0000:5962  ab                 stosw   word ptr es:[di], ax
*            05963 0000:5963  b020               mov     al, 0x20
*            05965 0000:5965  aa                 stosb   byte ptr es:[di], al
*            05966 0000:5966  a17606             mov     ax, word ptr [0x676]   ; math_ram (shared)
*            05969 0000:5969  e8bb00             call    0x5a27
*            0596C 0000:596C  ab                 stosw   word ptr es:[di], ax
*            0596D 0000:596D  8bc2               mov     ax, dx
*            0596F 0000:596F  ab                 stosw   word ptr es:[di], ax
*            05970 0000:5970  b00d               mov     al, 0xd
*            05972 0000:5972  aa                 stosb   byte ptr es:[di], al
*            05973 0000:5973  8306000002         add     word ptr [0], 2   ; math_ram (shared)
*            05978 0000:5978  a10800             mov     ax, word ptr [8]   ; math_ram (shared)
*            0597B 0000:597B  40                 inc     ax
*            0597C 0000:597C  3d1000             cmp     ax, 0x10
*            0597F 0000:597F  a30800             mov     word ptr [8], ax   ; math_ram (shared)
*            05982 0000:5982  7306               jae     0x598a
*            05984 0000:5984  ff0e0200           dec     word ptr [2]   ; math_ram (shared)
*            05988 0000:5988  7fb0               jg      0x593a
*   L_0598A: 0598A 0000:598A  81e500ff           and     bp, 0xff00
*            0598E 0000:598E  c3                 ret     
*   L_0598F: 0598F 0000:598F  bf0014             mov     di, 0x1400
*            05992 0000:5992  be6ef9             mov     si, 0xf96e
*            05995 0000:5995  b95800             mov     cx, 0x58
*            05998 0000:5998  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            0599A 0000:599A  b90800             mov     cx, 8
*            0599D 0000:599D  be42f8             mov     si, 0xf842
*            059A0 0000:59A0  bb5006             mov     bx, 0x650
*            059A3 0000:59A3  bd0400             mov     bp, 4
*   L_059A6: 059A6 0000:59A6  ad                 lodsw   ax, word ptr [si]
*            059A7 0000:59A7  e87d00             call    0x5a27
*            059AA 0000:59AA  ab                 stosw   word ptr es:[di], ax
*            059AB 0000:59AB  8bc2               mov     ax, dx
*            059AD 0000:59AD  ab                 stosw   word ptr es:[di], ax
*            059AE 0000:59AE  87f3               xchg    bx, si
*            059B0 0000:59B0  4d                 dec     bp
*            059B1 0000:59B1  7405               je      0x59b8
*            059B3 0000:59B3  b020               mov     al, 0x20
*            059B5 0000:59B5  aa                 stosb   byte ptr es:[di], al
*            059B6 0000:59B6  ebee               jmp     0x59a6
*   L_059B8: 059B8 0000:59B8  b00d               mov     al, 0xd
*            059BA 0000:59BA  aa                 stosb   byte ptr es:[di], al
*            059BB 0000:59BB  e2e6               loop    0x59a3
*            059BD 0000:59BD  c605ff             mov     byte ptr [di], 0xff
*            059C0 0000:59C0  bd00ff             mov     bp, 0xff00
*            059C3 0000:59C3  e969fe             jmp     0x582f
*   L_059C6: 059C6 0000:59C6  56                 push    si
*            059C7 0000:59C7  51                 push    cx
*            059C8 0000:59C8  833e080000         cmp     word ptr [8], 0   ; math_ram (shared)
*            059CD 0000:59CD  750e               jne     0x59dd
*            059CF 0000:59CF  bf0014             mov     di, 0x1400
*            059D2 0000:59D2  be1efa             mov     si, 0xfa1e
*            059D5 0000:59D5  b91300             mov     cx, 0x13
*            059D8 0000:59D8  f3a5               rep movsw word ptr es:[di], word ptr [si]
*            059DA 0000:59DA  8bd7               mov     dx, di
*            059DC 0000:59DC  47                 inc     di
*   L_059DD: 059DD 0000:59DD  58                 pop     ax
*            059DE 0000:59DE  5e                 pop     si
*            059DF 0000:59DF  bdffff             mov     bp, 0xffff
*            059E2 0000:59E2  8bda               mov     bx, dx
*            059E4 0000:59E4  e84000             call    0x5a27
*            059E7 0000:59E7  ab                 stosw   word ptr es:[di], ax
*            059E8 0000:59E8  b020               mov     al, 0x20
*            059EA 0000:59EA  aa                 stosb   byte ptr es:[di], al
*            059EB 0000:59EB  a17406             mov     ax, word ptr [0x674]   ; math_ram (shared)
*            059EE 0000:59EE  e83600             call    0x5a27
*            059F1 0000:59F1  ab                 stosw   word ptr es:[di], ax
*            059F2 0000:59F2  8bc2               mov     ax, dx
*            059F4 0000:59F4  ab                 stosw   word ptr es:[di], ax
*            059F5 0000:59F5  b020               mov     al, 0x20
*            059F7 0000:59F7  aa                 stosb   byte ptr es:[di], al
*            059F8 0000:59F8  a17606             mov     ax, word ptr [0x676]   ; math_ram (shared)
*            059FB 0000:59FB  e82900             call    0x5a27
*            059FE 0000:59FE  ab                 stosw   word ptr es:[di], ax
*            059FF 0000:59FF  8bc2               mov     ax, dx
*            05A01 0000:5A01  ab                 stosw   word ptr es:[di], ax
*            05A02 0000:5A02  b00d               mov     al, 0xd
*            05A04 0000:5A04  aa                 stosb   byte ptr es:[di], al
*            05A05 0000:5A05  a10800             mov     ax, word ptr [8]   ; math_ram (shared)
*            05A08 0000:5A08  050d00             add     ax, 0xd
*            05A0B 0000:5A0B  8807               mov     byte ptr [bx], al
*            05A0D 0000:5A0D  c605ff             mov     byte ptr [di], 0xff
*            05A10 0000:5A10  8bd3               mov     dx, bx
*            05A12 0000:5A12  3dd000             cmp     ax, 0xd0
*            05A15 0000:5A15  7304               jae     0x5a1b
*            05A17 0000:5A17  a30800             mov     word ptr [8], ax   ; math_ram (shared)
*            05A1A 0000:5A1A  c3                 ret     
*   L_05A1B: 05A1B 0000:5A1B  33c0               xor     ax, ax
*            05A1D 0000:5A1D  a30800             mov     word ptr [8], ax   ; math_ram (shared)
*            05A20 0000:5A20  81e500ff           and     bp, 0xff00
*            05A24 0000:5A24  e908fe             jmp     0x582f
*   L_05A27: 05A27 0000:5A27  53                 push    bx
*            05A28 0000:5A28  bb62f8             mov     bx, 0xf862
*            05A2B 0000:5A2B  8bd0               mov     dx, ax
*            05A2D 0000:5A2D  250f0f             and     ax, 0xf0f
*            05A30 0000:5A30  81e2f0f0           and     dx, 0xf0f0
*            05A34 0000:5A34  d1ca               ror     dx, 1
*            05A36 0000:5A36  d1ca               ror     dx, 1
*            05A38 0000:5A38  d1ca               ror     dx, 1
*            05A3A 0000:5A3A  d1ca               ror     dx, 1
*            05A3C 0000:5A3C  d7                 xlatb   
*            05A3D 0000:5A3D  86c6               xchg    dh, al
*            05A3F 0000:5A3F  d7                 xlatb   
*            05A40 0000:5A40  86c2               xchg    dl, al
*            05A42 0000:5A42  d7                 xlatb   
*            05A43 0000:5A43  86c4               xchg    ah, al
*            05A45 0000:5A45  d7                 xlatb   
*            05A46 0000:5A46  86c4               xchg    ah, al
*            05A48 0000:5A48  86c2               xchg    dl, al
*            05A4A 0000:5A4A  5b                 pop     bx
*            05A4B 0000:5A4B  c3                 ret     
             05A4C 0000:5A4C  e7a8               out     0xa8, ax
             05A4E 0000:5A4E  e501               in      ax, 1
             05A50 0000:5A50  0200               add     al, byte ptr [bx + si]
             05A52 0000:5A52  c501               lds     ax, ptr [bx + di]
             05A54 0000:5A54  c4aac511           les     bp, ptr [bp + si + 0x11c5]
             05A58 0000:5A58  87a701c2           xchg    word ptr [bx - 0x3dff], sp
             05A5C 0000:5A5C  aa                 stosb   byte ptr es:[di], al
             05A5D 0000:5A5D  cd12               int     0x12
             05A5F 0000:5A5F  a6                 cmpsb   byte ptr [si], byte ptr es:[di]
             05A60 0000:5A60  cd6d               int     0x6d
             05A62 0000:5A62  7c21               jl      0x5a85
             05A64 0000:5A64  ab                 stosw   word ptr es:[di], ax
             05A65 0000:5A65  aa                 stosb   byte ptr es:[di], al
             05A66 0000:5A66  36003e0021         add     byte ptr ss:[0x2100], bh   ; OBJRAM (sprites)
             05A6B 0000:5A6B  1040be             adc     byte ptr [bx + si - 0x42], al
             05A6E 0000:5A6E  d214               rcl     byte ptr [si], cl
             05A70 0000:5A70  8acd               mov     cl, ch
             05A72 0000:5A72  8b890180           mov     cx, word ptr [bx + di - 0x7fff]
             05A76 0000:5A76  07                 pop     es
             05A77 0000:5A77  11a5aacd           adc     word ptr [di - 0x3256], sp
             05A7B 0000:5A7B  18a5eb2b           sbb     byte ptr [di + 0x2beb], ah
      05A7F 0000:5A7F  db   's#r!'
             05A83 0000:5A83  804022a3           add     byte ptr [bx + si + 0x22], 0xa3
             05A87 0000:5A87  aa                 stosb   byte ptr es:[di], al
             05A88 0000:5A88  11b0aa01           adc     word ptr [bx + si + 0x1aa], si
             05A8C 0000:5A8C  ac                 lodsb   al, byte ptr [si]
             05A8D 0000:5A8D  aa                 stosb   byte ptr es:[di], al
             05A8E 0000:5A8E  cd92               int     0x92
*            05A90 0000:5A90  92                 xchg    dx, ax
*            05A91 0000:5A91  2100               and     word ptr [bx + si], ax
*            05A93 0000:5A93  0022               add     byte ptr [bp + si], ah
*            05A95 0000:5A95  c8aa2ae7           enter   0x2aaa, -0x19
*            05A99 0000:5A99  a8e5               test    al, 0xe5
*            05A9B 0000:5A9B  018040c5           add     word ptr [bx + si - 0x3ac0], ax
*            05A9F 0000:5A9F  018007c5           add     word ptr [bx + si - 0x3af9], ax
*            05AA3 0000:5AA3  1187a701           adc     word ptr [bx + 0x1a7], ax
      05AA7 0000:5AA7  db   c6
*            05AA8 0000:5AA8  aa                 stosb   byte ptr es:[di], al
*            05AA9 0000:5AA9  cdc1               int     0xc1
*            05AAB 0000:5AAB  a5                 movsw   word ptr es:[di], word ptr [si]
*            05AAC 0000:5AAC  cd6d               int     0x6d
*            05AAE 0000:5AAE  7c3e               jl      0x5aee
*            05AB0 0000:5AB0  0011               add     byte ptr [bx + di], dl
      05AB2 0000:5AB2  db   c6
             05AB3 0000:5AB3  aa                 stosb   byte ptr es:[di], al
             05AB4 0000:5AB4  cd20               int     0x20
             05AB6 0000:5AB6  a5                 movsw   word ptr es:[di], word ptr [si]
             05AB7 0000:5AB7  b5c2               mov     ch, 0xc2
             05AB9 0000:5AB9  638a1110           arpl    word ptr [bp + si + 0x1011], cx
             05ABD 0000:5ABD  010e6ccd           add     word ptr [0xcd6c], cx
             05AC1 0000:5AC1  b77b               mov     bh, 0x7b
             05AC3 0000:5AC3  2ac6               sub     al, dh
             05AC5 0000:5AC5  aa                 stosb   byte ptr es:[di], al
             05AC6 0000:5AC6  01804009           add     word ptr [bx + si + 0x940], ax
             05ACA 0000:5ACA  22a7aacd           and     ah, byte ptr [bx - 0x3256]
             05ACE 0000:5ACE  ae                 scasb   al, byte ptr es:[di]
             05ACF 0000:5ACF  a4                 movsb   byte ptr es:[di], byte ptr [si]
             05AD0 0000:5AD0  22a9aa01           and     ch, byte ptr [bx + di + 0x1aa]
             05AD4 0000:5AD4  ac                 lodsb   al, byte ptr [si]
             05AD5 0000:5AD5  aa                 stosb   byte ptr es:[di], al
             05AD6 0000:5AD6  c51e0401           lds     bx, ptr [0x104]   ; math_ram (shared)
      05ADA 0000:5ADA  db   c6
             05ADB 0000:5ADB  aa                 stosb   byte ptr es:[di], al
             05ADC 0000:5ADC  cd87               int     0x87
             05ADE 0000:5ADE  a6                 cmpsb   byte ptr [si], byte ptr es:[di]
             05ADF 0000:5ADF  c9                 leave   
             05AE0 0000:5AE0  21cd               and     bp, cx
             05AE2 0000:5AE2  aa                 stosb   byte ptr es:[di], al
      05AE3 0000:5AE3  db   'r+s+p+q'
             05AEA 0000:5AEA  01a3aa11           add     word ptr [bp + di + 0x11aa], sp
*   L_05AEE: 05AEE 0000:5AEE  a5                 movsw   word ptr es:[di], word ptr [si]
*            05AEF 0000:5AEF  aa                 stosb   byte ptr es:[di], al
*            05AF0 0000:5AF0  cd13               int     0x13
*            05AF2 0000:5AF2  a5                 movsw   word ptr es:[di], word ptr [si]
*            05AF3 0000:5AF3  2b22               sub     sp, word ptr [bp + si]
*            05AF5 0000:5AF5  ce                 into    
*            05AF6 0000:5AF6  aa                 stosb   byte ptr es:[di], al
*            05AF7 0000:5AF7  01a3aa11           add     word ptr [bp + di + 0x11aa], sp
*            05AFB 0000:5AFB  a7                 cmpsw   word ptr [si], word ptr es:[di]
*            05AFC 0000:5AFC  aa                 stosb   byte ptr es:[di], al
*            05AFD 0000:5AFD  cd13               int     0x13
*            05AFF 0000:5AFF  a5                 movsw   word ptr es:[di], word ptr [si]
*            05B00 0000:5B00  22d0               and     dl, al
*            05B02 0000:5B02  aa                 stosb   byte ptr es:[di], al
*            05B03 0000:5B03  11ce               adc     si, cx
*            05B05 0000:5B05  aa                 stosb   byte ptr es:[di], al
*            05B06 0000:5B06  cd23               int     0x23
*            05B08 0000:5B08  a5                 movsw   word ptr es:[di], word ptr [si]
*            05B09 0000:5B09  d2b58a2a           sal     byte ptr [di + 0x2a8a], cl
*            05B0D 0000:5B0D  ce                 into    
*            05B0E 0000:5B0E  aa                 stosb   byte ptr es:[di], al
*            05B0F 0000:5B0F  22d2               and     dl, dl
*            05B11 0000:5B11  aa                 stosb   byte ptr es:[di], al
*            05B12 0000:5B12  c3                 ret     
             05B13 0000:5B13  bb8a2a             mov     bx, 0x2a8a
*            05B16 0000:5B16  d0aa22d2           shr     byte ptr [bp + si - 0x2dde], 1
*            05B1A 0000:5B1A  aa                 stosb   byte ptr es:[di], al
*            05B1B 0000:5B1B  2ab4aa11           sub     dh, byte ptr [si + 0x11aa]
*            05B1F 0000:5B1F  8040cd02           add     byte ptr [bx + si - 0x33], 2
*            05B23 0000:5B23  a5                 movsw   word ptr es:[di], word ptr [si]
*            05B24 0000:5B24  eb3e               jmp     0x5b64
             05B26 0000:5B26  08cd               or      ch, cl
             05B28 0000:5B28  09a5d2d0           or      word ptr [di - 0x2f2e], sp
             05B2C 0000:5B2C  8acd               mov     cl, ch
             05B2E 0000:5B2E  8b892ad2           mov     cx, word ptr [bx + di - 0x2dd6]
             05B32 0000:5B32  aa                 stosb   byte ptr es:[di], al
             05B33 0000:5B33  11ca               adc     dx, cx
             05B35 0000:5B35  aa                 stosb   byte ptr es:[di], al
             05B36 0000:5B36  cdc5               int     0xc5
             05B38 0000:5B38  a4                 movsb   byte ptr es:[di], byte ptr [si]
             05B39 0000:5B39  e52a               in      ax, 0x2a
             05B3B 0000:5B3B  b4aa               mov     ah, 0xaa
             05B3D 0000:5B3D  c1712370           sal     word ptr [bx + di + 0x23], 0x70
             05B41 0000:5B41  2ab4aa23           sub     dh, byte ptr [si + 0x23aa]
             05B45 0000:5B45  2322               and     sp, word ptr [bp + si]
             05B47 0000:5B47  b4aa               mov     ah, 0xaa
             05B49 0000:5B49  01804011           add     word ptr [bx + si + 0x1140], ax
             05B4D 0000:5B4D  a3aacd             mov     word ptr [0xcdaa], ax
             05B50 0000:5B50  18a5e52a           sbb     byte ptr [di + 0x2ae5], ah
             05B54 0000:5B54  b4aa               mov     ah, 0xaa
             05B56 0000:5B56  c1712370           sal     word ptr [bx + di + 0x23], 0x70
             05B5A 0000:5B5A  2ab4aa23           sub     dh, byte ptr [si + 0x23aa]
             05B5E 0000:5B5E  23eb               and     bp, bx
             05B60 0000:5B60  2acc               sub     cl, ah
             05B62 0000:5B62  aa                 stosb   byte ptr es:[di], al
             05B63 0000:5B63  44                 inc     sp
*   L_05B64: 05B64 0000:5B64  4d                 dec     bp
*            05B65 0000:5B65  cd92               int     0x92
*            05B67 0000:5B67  92                 xchg    dx, ax
*            05B68 0000:5B68  1106002a           adc     word ptr [0x2a00], ax
*            05B6C 0000:5B6C  b4aa               mov     ah, 0xaa
*            05B6E 0000:5B6E  1922               sbb     word ptr [bp + si], sp
*            05B70 0000:5B70  b4aa               mov     ah, 0xaa
*            05B72 0000:5B72  2110               and     word ptr [bx + si], dx
*            05B74 0000:5B74  40                 inc     ax
*            05B75 0000:5B75  342a               xor     al, 0x2a
*            05B77 0000:5B77  d2aaeb2a           shr     byte ptr [bp + si + 0x2aeb], cl
*            05B7B 0000:5B7B  a3aa19             mov     word ptr [0x19aa], ax   ; RCRAM (road, shared)
*            05B7E 0000:5B7E  22a3aaeb           and     ah, byte ptr [bp + di - 0x1456]
*            05B82 0000:5B82  11ce               adc     si, cx
*            05B84 0000:5B84  aa                 stosb   byte ptr es:[di], al
*            05B85 0000:5B85  cd23               int     0x23
*            05B87 0000:5B87  a5                 movsw   word ptr es:[di], word ptr [si]
*            05B88 0000:5B88  eb2b               jmp     0x5bb5
      05B8A 0000:5B8A  db   's#r>\00'
             05B8F 0000:5B8F  21ce               and     si, cx
             05B91 0000:5B91  aa                 stosb   byte ptr es:[di], al
             05B92 0000:5B92  cd2b               int     0x2b
             05B94 0000:5B94  a5                 movsw   word ptr es:[di], word ptr [si]
             05B95 0000:5B95  d2908bcd           rcl     byte ptr [bx + si - 0x3275], cl
             05B99 0000:5B99  db890180           fisttp  dword ptr [bx + di - 0x7fff]
             05B9D 0000:5B9D  07                 pop     es
             05B9E 0000:5B9E  11ce               adc     si, cx
             05BA0 0000:5BA0  aa                 stosb   byte ptr es:[di], al
             05BA1 0000:5BA1  cd18               int     0x18
             05BA3 0000:5BA3  a5                 movsw   word ptr es:[di], word ptr [si]
             05BA4 0000:5BA4  d2508b             rcl     byte ptr [bx + si - 0x75], cl
             05BA7 0000:5BA7  2ace               sub     cl, dh
             05BA9 0000:5BA9  aa                 stosb   byte ptr es:[di], al
             05BAA 0000:5BAA  22d2               and     dl, dl
             05BAC 0000:5BAC  aa                 stosb   byte ptr es:[di], al
             05BAD 0000:5BAD  c3                 ret     
             05BAE 0000:5BAE  56                 push    si
*            05BAF 0000:5BAF  8b21               mov     sp, word ptr [bx + di]
*            05BB1 0000:5BB1  800722             add     byte ptr [bx], 0x22
*            05BB4 0000:5BB4  d2aa2110           shr     byte ptr [bp + si + 0x1021], cl
*            05BB8 0000:5BB8  40                 inc     ax
*            05BB9 0000:5BB9  360121             add     word ptr ss:[bx + di], sp
*            05BBC 0000:5BBC  d2aa1100           shr     byte ptr [bp + si + 0x11], cl
*            05BC0 0000:5BC0  20cd               and     ch, cl
*            05BC2 0000:5BC2  c4a4e52a           les     sp, ptr [si + 0x2ae5]
*            05BC6 0000:5BC6  b4aa               mov     ah, 0xaa
*            05BC8 0000:5BC8  c1712370           sal     word ptr [bx + di + 0x23], 0x70
*            05BCC 0000:5BCC  2ab4aa23           sub     dh, byte ptr [si + 0x23aa]
*            05BD0 0000:5BD0  2322               and     sp, word ptr [bp + si]
*            05BD2 0000:5BD2  b4aa               mov     ah, 0xaa
*            05BD4 0000:5BD4  01d2               add     dx, dx
*            05BD6 0000:5BD6  aa                 stosb   byte ptr es:[di], al
*            05BD7 0000:5BD7  11ce               adc     si, cx
*            05BD9 0000:5BD9  aa                 stosb   byte ptr es:[di], al
*            05BDA 0000:5BDA  cd13               int     0x13
*            05BDC 0000:5BDC  a5                 movsw   word ptr es:[di], word ptr [si]
*            05BDD 0000:5BDD  eb2b               jmp     0x5c0a
      05BDF 0000:5BDF  db   's#r*'
             05BE3 0000:5BE3  d2aaeb2a           shr     byte ptr [bp + si + 0x2aeb], cl
             05BE7 0000:5BE7  a3aa19             mov     word ptr [0x19aa], ax   ; RCRAM (road, shared)
             05BEA 0000:5BEA  22a3aac3           and     ah, byte ptr [bp + di - 0x3c56]
             05BEE 0000:5BEE  2d8bc9             sub     ax, 0xc98b
             05BF1 0000:5BF1  21d5               and     bp, dx
             05BF3 0000:5BF3  aa                 stosb   byte ptr es:[di], al
             05BF4 0000:5BF4  702b               jo      0x5c21
             05BF6 0000:5BF6  712a               jno     0x5c22
             05BF8 0000:5BF8  d4aa               aam     0xaa
             05BFA 0000:5BFA  eb01               jmp     0x5bfd
             05BFC 0000:5BFC  0000               add     byte ptr [bx + si], al
             05BFE 0000:5BFE  cd80               int     0x80
             05C00 0000:5C00  dc05               fadd    qword ptr [di]
*            05C02 0000:5C02  3a00               cmp     al, byte ptr [bx + si]
*            05C04 0000:5C04  0020               add     byte ptr [bx + si], ah
*            05C06 0000:5C06  5c                 pop     sp
*            05C07 0000:5C07  e0ee               loopne  0x5bf7
*            05C09 0000:5C09  02b84b3a           add     bh, byte ptr [bx + si + 0x3a4b]
*            05C0D 0000:5C0D  0000               add     byte ptr [bx + si], al
*            05C0F 0000:5C0F  2018               and     byte ptr [bx + si], bl
*            05C11 0000:5C11  20ca               and     dl, cl
*            05C13 0000:5C13  08a00f1b           or      byte ptr [bx + si + 0x1b0f], ah
*            05C17 0000:5C17  fe00               inc     byte ptr [bx + si]
*            05C19 0000:5C19  043e               add     al, 0x3e
*            05C1B 0000:5C1B  fc                 cld     
*            05C1C 0000:5C1C  16                 push    ss
*            05C1D 0000:5C1D  0c88               or      al, 0x88
*            05C1F 0000:5C1F  53                 push    bx
*            05C20 0000:5C20  fc                 cld     
*            05C21 0000:5C21  fb                 sti     
*            05C22 0000:5C22  0004               add     byte ptr [si], al
*            05C24 0000:5C24  f8                 clc     
*            05C25 0000:5C25  ff2a               ljmp    [bp + si]
             05C27 0000:5C27  134a55             adc     cx, word ptr [bp + si + 0x55]
*            05C2A 0000:5C2A  7ffd               jg      0x5c29
*            05C2C 0000:5C2C  0002               add     byte ptr [bp + si], al
*            05C2E 0000:5C2E  fa                 cli     
*            05C2F 0000:5C2F  fd                 std     
*            05C30 0000:5C30  59                 pop     cx
*            05C31 0000:5C31  137017             adc     si, word ptr [bx + si + 0x17]
*            05C34 0000:5C34  01ff               add     di, di
*            05C36 0000:5C36  0002               add     byte ptr [bp + si], al
*            05C38 0000:5C38  04fd               add     al, 0xfd
*            05C3A 0000:5C3A  3b17               cmp     dx, word ptr [bx]
*            05C3C 0000:5C3C  c81995fe           enter   -0x6ae7, -2
*            05C40 0000:5C40  0010               add     byte ptr [bx + si], dl
*            05C42 0000:5C42  17                 pop     ss
*            05C43 0000:5C43  ef                 out     dx, ax
*            05C44 0000:5C44  c815205c           enter   0x2015, 0x5c
*            05C48 0000:5C48  beff00             mov     si, 0xff
*            05C4B 0000:5C4B  02850048           add     al, byte ptr [di + 0x4800]
*            05C4F 0000:5C4F  1ad0               sbb     dl, al
*            05C51 0000:5C51  1f                 pop     ds
*            05C52 0000:5C52  3002               xor     byte ptr [bp + si], al
*            05C54 0000:5C54  0004               add     byte ptr [si], al
*            05C56 0000:5C56  30fe               xor     dh, bh
*            05C58 0000:5C58  d01f               rcr     byte ptr [bx], 1
*            05C5A 0000:5C5A  b162               mov     cl, 0x62
*            05C5C 0000:5C5C  b90200             mov     cx, 2
*            05C5F 0000:5C5F  0830               or      byte ptr [bx + si], dh
*            05C61 0000:5C61  0ad0               or      dl, al
*            05C63 0000:5C63  1f                 pop     ds
*            05C64 0000:5C64  92                 xchg    dx, ax
*            05C65 0000:5C65  254203             and     ax, 0x342
*            05C68 0000:5C68  0008               add     byte ptr [bx + si], cl
*            05C6A 0000:5C6A  42                 inc     dx
*            05C6B 0000:5C6B  fb                 sti     
*            05C6C 0000:5C6C  92                 xchg    dx, ax
*            05C6D 0000:5C6D  25b162             and     ax, 0x62b1
*            05C70 0000:5C70  b90200             mov     cx, 2
*            05C73 0000:5C73  0830               or      byte ptr [bx + si], dh
*            05C75 0000:5C75  0ad0               or      dl, al
*            05C77 0000:5C77  1f                 pop     ds
*            05C78 0000:5C78  92                 xchg    dx, ax
*            05C79 0000:5C79  254203             and     ax, 0x342
*            05C7C 0000:5C7C  0008               add     byte ptr [bx + si], cl
*            05C7E 0000:5C7E  42                 inc     dx
*            05C7F 0000:5C7F  fb                 sti     
*            05C80 0000:5C80  92                 xchg    dx, ax
*            05C81 0000:5C81  257427             and     ax, 0x2774
*            05C84 0000:5C84  ef                 out     dx, ax
*            05C85 0000:5C85  0100               add     word ptr [bx + si], ax
*            05C87 0000:5C87  024201             add     al, byte ptr [bp + si + 1]
*            05C8A 0000:5C8A  92                 xchg    dx, ax
*            05C8B 0000:5C8B  253c28             and     ax, 0x283c
*            05C8E 0000:5C8E  c8fe0010           enter   0xfe, 0x10
*            05C92 0000:5C92  87fc               xchg    sp, di
*            05C94 0000:5C94  6518c0             sbb     al, al
*            05C97 0000:5C97  6b5ffb00           imul    bx, word ptr [bx - 5], 0
*            05C9B 0000:5C9B  0458               add     al, 0x58
*            05C9D 0000:5C9D  ff32               push    word ptr [bp + si]
*            05C9F 0000:5C9F  2cb4               sub     al, 0xb4
*            05CA1 0000:5CA1  6d                 insw    word ptr es:[di], dx
*            05CA2 0000:5CA2  5b                 pop     bx
*            05CA3 0000:5CA3  fc                 cld     
*            05CA4 0000:5CA4  0002               add     byte ptr [bp + si], al
*            05CA6 0000:5CA6  5c                 pop     sp
*            05CA7 0000:5CA7  fd                 std     
*            05CA8 0000:5CA8  f9                 stc     
*            05CA9 0000:5CA9  2b9c31df           sub     bx, word ptr [si - 0x20cf]
*            05CAD 0000:5CAD  0000               add     byte ptr [bx + si], al
*            05CAF 0000:5CAF  1054f4             adc     byte ptr [si - 0xc], dl
*            05CB2 0000:5CB2  8b3b               mov     di, word ptr [bp + di]
*            05CB4 0000:5CB4  58                 pop     ax
*            05CB5 0000:5CB5  34a2               xor     al, 0xa2
*            05CB7 0000:5CB7  0000               add     byte ptr [bx + si], al
*            05CB9 0000:5CB9  024eff             add     cl, byte ptr [bp - 1]
*            05CBC 0000:5CBC  da32               fidiv   dword ptr [bp + si]
*            05CBE 0000:5CBE  847564             test    byte ptr [di + 0x64], dh
*            05CC1 0000:5CC1  0000               add     byte ptr [bx + si], al
*            05CC3 0000:5CC3  014c01             add     word ptr [si + 1], cx
*            05CC6 0000:5CC6  17                 pop     ss
*            05CC7 0000:5CC7  35a478             xor     ax, 0x78a4
*            05CCA 0000:5CCA  53                 push    bx
*            05CCB 0000:5CCB  0200               add     al, byte ptr [bx + si]
*            05CCD 0000:5CCD  10df               adc     bh, bl
*            05CCF 0000:5CCF  0e                 push    cs
*            05CD0 0000:5CD0  b62e               mov     dh, 0x2e
*            05CD2 0000:5CD2  e239               loop    0x5d0d
*            05CD4 0000:5CD4  c20200             ret     2
             05CD7 0000:5CD7  02c2               add     al, dl
             05CD9 0000:5CD9  00e2               add     dl, ah
             05CDB 0000:5CDB  39c3               cmp     bx, ax
             05CDD 0000:5CDD  3c39               cmp     al, 0x39
             05CDF 0000:5CDF  0200               add     al, byte ptr [bx + si]
             05CE1 0000:5CE1  08c2               or      dl, al
             05CE3 0000:5CE3  fa                 cli     
             05CE4 0000:5CE4  e239               loop    0x5d1f
             05CE6 0000:5CE6  a4                 movsb   byte ptr es:[di], byte ptr [si]
             05CE7 0000:5CE7  7fb0               jg      0x5c99
             05CE9 0000:5CE9  0100               add     word ptr [bx + si], ax
             05CEB 0000:5CEB  08b009a4           or      byte ptr [bx + si - 0x5bf7], dh
             05CEF 0000:5CEF  3f                 aas     
             05CF0 0000:5CF0  b162               mov     cl, 0x62
             05CF2 0000:5CF2  b90200             mov     cx, 2
             05CF5 0000:5CF5  0830               or      byte ptr [bx + si], dh
             05CF7 0000:5CF7  0ad0               or      dl, al
             05CF9 0000:5CF9  1f                 pop     ds
             05CFA 0000:5CFA  92                 xchg    dx, ax
             05CFB 0000:5CFB  254203             and     ax, 0x342
             05CFE 0000:5CFE  0008               add     byte ptr [bx + si], cl
             05D00 0000:5D00  42                 inc     dx
             05D01 0000:5D01  fb                 sti     
             05D02 0000:5D02  92                 xchg    dx, ax
             05D03 0000:5D03  255467             and     ax, 0x6754
             05D06 0000:5D06  4e                 dec     si
             05D07 0000:5D07  0400               add     al, 0
             05D09 0000:5D09  024205             add     al, byte ptr [bp + si + 5]
             05D0C 0000:5D0C  92                 xchg    dx, ax
             05D0D 0000:5D0D  25ea67             and     ax, 0x67ea
             05D10 0000:5D10  ad                 lodsw   ax, word ptr [si]
             05D11 0000:5D11  050008             add     ax, 0x800
             05D14 0000:5D14  1e                 push    ds
             05D15 0000:5D15  084c20             or      byte ptr [si + 0x20], cl
             05D18 0000:5D18  7a29               jp      0x5d43
*            05D1A 0000:5D1A  0907               or      word ptr [bx], ax
*            05D1C 0000:5D1C  0002               add     byte ptr [bp + si], al
*            05D1E 0000:5D1E  1105               adc     word ptr [di], ax
*            05D20 0000:5D20  d229               shr     byte ptr [bx + di], cl
*            05D22 0000:5D22  b42d               mov     ah, 0x2d
*            05D24 0000:5D24  f60400             test    byte ptr [si], 0
*            05D27 0000:5D27  0418               add     al, 0x18
*            05D29 0000:5D29  032a               add     bp, word ptr [bp + si]
*            05D2B 0000:5D2B  2ae0               sub     ah, al
*            05D2D 0000:5D2D  6e                 outsb   dx, byte ptr [si]
*            05D2E 0000:5D2E  fc                 cld     
*            05D2F 0000:5D2F  0300               add     ax, word ptr [bx + si]
*            05D31 0000:5D31  02e5               add     ah, ch
*            05D33 0000:5D33  05792f             add     ax, 0x2f79
*            05D36 0000:5D36  c872dd04           enter   -0x228e, 4
*            05D3A 0000:5D3A  0004               add     byte ptr [si], al
*            05D3C 0000:5D3C  cd07               int     7
*            05D3E 0000:5D3E  1230               adc     dh, byte ptr [bx + si]
*            05D40 0000:5D40  bc344d             mov     sp, 0x4d34
*            05D43 0000:5D43  050002             add     ax, 0x200
*            05D46 0000:5D46  650323             add     sp, word ptr gs:[bp + di]
*            05D49 0000:5D49  34bd               xor     al, 0xbd
*            05D4B 0000:5D4B  359704             xor     ax, 0x497
*            05D4E 0000:5D4E  0002               add     byte ptr [bp + si], al
*            05D50 0000:5D50  640323             add     sp, word ptr fs:[bp + di]
*            05D53 0000:5D53  3494               xor     al, 0x94
*            05D55 0000:5D55  77ce               ja      0x5d25
*            05D57 0000:5D57  0300               add     ax, word ptr [bx + si]
*            05D59 0000:5D59  02cb               add     cl, bl
*            05D5B 0000:5D5B  055637             add     ax, 0x3756
*            05D5E 0000:5D5E  98                 cwde    
*            05D5F 0000:5D5F  7ad6               jp      0x5d37
*            05D61 0000:5D61  050004             add     ax, 0x400
*            05D64 0000:5D64  c7071837           mov     word ptr [bx], 0x3718
*            05D68 0000:5D68  58                 pop     ax
*            05D69 0000:5D69  3cde               cmp     al, 0xde
*            05D6B 0000:5D6B  06                 push    es
*            05D6C 0000:5D6C  0002               add     byte ptr [bp + si], al
*            05D6E 0000:5D6E  de04               fiadd   word ptr [si]
*            05D70 0000:5D70  58                 pop     ax
*            05D71 0000:5D71  3c39               cmp     al, 0x39
*            05D73 0000:5D73  7f67               jg      0x5ddc
*            05D75 0000:5D75  07                 pop     es
*            05D76 0000:5D76  0008               add     byte ptr [bx + si], cl
*            05D78 0000:5D78  de0e583c           fimul   word ptr [0x3c58]   ; MATH UNIT (mul/div/geometry)
*            05D7C 0000:5D7C  1a02               sbb     al, byte ptr [bp + si]
      05D7E 0000:5D7E  db   f0
             05D7F 0000:5D7F  07                 pop     es
             05D80 0000:5D80  0008               add     byte ptr [bx + si], cl
      05D82 0000:5D82  db   f0
             05D83 0000:5D83  ff1a               lcall   [bp + si]
             05D85 0000:5D85  02e1               add     ah, cl
             05D87 0000:5D87  42                 inc     dx
             05D88 0000:5D88  8900               mov     word ptr [bx + si], ax
             05D8A 0000:5D8A  0008               add     byte ptr [bx + si], cl
             05D8C 0000:5D8C  0008               add     byte ptr [bx + si], cl
             05D8E 0000:5D8E  0000               add     byte ptr [bx + si], al
             05D90 0000:5D90  c20512             ret     0x1205
             05D93 0000:5D93  0100               add     word ptr [bx + si], ax
             05D95 0000:5D95  0812               or      byte ptr [bp + si], dl
             05D97 0000:5D97  f9                 stc     
             05D98 0000:5D98  c205bf             ret     0xbf05
             05D9B 0000:5D9B  47                 inc     di
             05D9C 0000:5D9C  da02               fiadd   dword ptr [bp + si]
             05D9E 0000:5D9E  0002               add     byte ptr [bp + si], al
             05DA0 0000:5DA0  1203               adc     al, byte ptr [bp + di]
             05DA2 0000:5DA2  c2055b             ret     0x5b05
             05DA5 0000:5DA5  0a05               or      al, byte ptr [di]
             05DA7 0000:5DA7  0a00               or      al, byte ptr [bx + si]
             05DA9 0000:5DA9  101e01a7           adc     byte ptr [0xa701], bl
             05DAD 0000:5DAD  17                 pop     ss
             05DAE 0000:5DAE  54                 push    sp
             05DAF 0000:5DAF  0b08               or      cx, word ptr [bx + si]
             05DB1 0000:5DB1  0b00               or      ax, word ptr [bx + si]
             05DB3 0000:5DB3  04cb               add     al, 0xcb
             05DB5 0000:5DB5  07                 pop     es
             05DB6 0000:5DB6  ae                 scasb   al, byte ptr es:[di]
             05DB7 0000:5DB7  0dac0d             or      ax, 0xdac
             05DBA 0000:5DBA  090b               or      word ptr [bp + di], cx
             05DBC 0000:5DBC  0002               add     byte ptr [bp + si], al
             05DBE 0000:5DBE  6a09               push    9
             05DC0 0000:5DC0  810cd80e           or      word ptr [si], 0xed8
             05DC4 0000:5DC4  b509               mov     ch, 9
             05DC6 0000:5DC6  0004               add     byte ptr [si], al
             05DC8 0000:5DC8  ca0755             retf    0x5507
             05DCB 0000:5DCB  0b6850             or      bp, word ptr [bx + si + 0x50]
             05DCE 0000:5DCE  ad                 lodsw   ax, word ptr [si]
             05DCF 0000:5DCF  0800               or      byte ptr [bx + si], al
             05DD1 0000:5DD1  02aa0a99           add     ch, byte ptr [bp + si - 0x66f6]
             05DD5 0000:5DD5  1088139e           adc     byte ptr [bx + si - 0x61ed], cl
             05DD9 0000:5DD9  06                 push    es
             05DDA 0000:5DDA  0004               add     byte ptr [si], al
*   L_05DDC: 05DDC 0000:5DDC  b204               mov     dl, 4
*            05DDE 0000:5DDE  06                 push    es
*            05DDF 0000:5DDF  10e0               adc     al, ah
*            05DE1 0000:5DE1  55                 push    bp
*            05DE2 0000:5DE2  b604               mov     dh, 4
*            05DE4 0000:5DE4  0004               add     byte ptr [si], al
*            05DE6 0000:5DE6  8a08               mov     cl, byte ptr [bx + si]
*            05DE8 0000:5DE8  0a17               or      dl, byte ptr [bx]
*            05DEA 0000:5DEA  58                 pop     ax
*            05DEB 0000:5DEB  5b                 pop     bx
*            05DEC 0000:5DEC  0a04               or      al, byte ptr [si]
*            05DEE 0000:5DEE  0010               add     byte ptr [bx + si], dl
*            05DF0 0000:5DF0  051488             add     ax, 0x8814
*            05DF3 0000:5DF3  1a1a               sbb     bl, byte ptr [bp + si]
*            05DF5 0000:5DF5  5d                 pop     bp
*            05DF6 0000:5DF6  4d                 dec     bp
*            05DF7 0000:5DF7  050002             add     ax, 0x200
*            05DFA 0000:5DFA  09063e1b           or      word ptr [0x1b3e], ax   ; RCRAM (road, shared)
*            05DFE 0000:5DFE  a4                 movsb   byte ptr es:[di], byte ptr [si]
*            05DFF 0000:5DFF  1f                 pop     ds
*            05E00 0000:5E00  a7                 cmpsw   word ptr [si], word ptr es:[di]
*            05E01 0000:5E01  07                 pop     es
*            05E02 0000:5E02  0004               add     byte ptr [si], al
*            05E04 0000:5E04  d503               aad     3
*            05E06 0000:5E06  d220               shl     byte ptr [bx + si], cl
*            05E08 0000:5E08  fc                 cld     
*            05E09 0000:5E09  21b40600           and     word ptr [si + 6], si
*            05E0D 0000:5E0D  02be053b           add     bh, byte ptr [bp + 0x3b05]
*            05E11 0000:5E11  20f0               and     al, dh
*            05E13 0000:5E13  63ad0500           arpl    word ptr [di + 5], bp
*            05E17 0000:5E17  02aa07bd           add     ch, byte ptr [bp + si - 0x42f9]
*            05E1B 0000:5E1B  233c               and     di, word ptr [si]
*            05E1D 0000:5E1D  28980200           sub     byte ptr [bx + si + 2], bl
*            05E21 0000:5E21  04b2               add     al, 0xb2
*            05E23 0000:5E23  015624             add     word ptr [bp + 0x24], dx
*            05E26 0000:5E26  0469               add     al, 0x69
*            05E28 0000:5E28  d6                 salc    
*            05E29 0000:5E29  0100               add     word ptr [bx + si], ax
*            05E2B 0000:5E2B  01d1               add     cx, dx
*            05E2D 0000:5E2D  0235               add     dh, byte ptr [di]
*            05E2F 0000:5E2F  29f8               sub     ax, di
*            05E31 0000:5E31  6af1               push    -0xf
*            05E33 0000:5E33  0100               add     word ptr [bx + si], ax
*            05E35 0000:5E35  04c3               add     al, 0xc3
*            05E37 0000:5E37  05c829             add     ax, 0x29c8
*            05E3A 0000:5E3A  ec                 in      al, dx
*            05E3B 0000:5E3B  2c80               sub     al, 0x80
*            05E3D 0000:5E3D  0100               add     word ptr [bx + si], ax
*            05E3F 0000:5E3F  0208               add     cl, byte ptr [bx + si]
*            05E41 0000:5E41  00902b82           add     byte ptr [bx + si - 0x7dd5], dl
*            05E45 0000:5E45  2d8000             sub     ax, 0x80
*            05E48 0000:5E48  0002               add     byte ptr [bp + si], al
*            05E4A 0000:5E4A  0800               or      byte ptr [bx + si], al
*            05E4C 0000:5E4C  90                 nop     
*            05E4D 0000:5E4D  2b446f             sub     ax, word ptr [si + 0x6f]
*            05E50 0000:5E50  fa                 cli     
*   L_05E51: 05E51 0000:5E51  fe00               inc     byte ptr [bx + si]
*            05E53 0000:5E53  02f8               add     bh, al
*            05E55 0000:5E55  00742f             add     byte ptr [si + 0x2f], dh
*            05E58 0000:5E58  bc747b             mov     sp, 0x7b74
*            05E5B 0000:5E5B  0000               add     byte ptr [bx + si], al
*            05E5D 0000:5E5D  08f1               or      cl, dh
*            05E5F 0000:5E5F  06                 push    es
*            05E60 0000:5E60  0430               add     al, 0x30
*            05E62 0000:5E62  4c                 dec     sp
*            05E63 0000:5E63  76ec               jbe     0x5e51
*            05E65 0000:5E65  0200               add     al, byte ptr [bx + si]
*            05E67 0000:5E67  04b6               add     al, 0xb6
*            05E69 0000:5E69  036032             add     sp, word ptr [bx + si + 0x32]
      05E6C 0000:5E6C  db   8c
             05E6D 0000:5E6D  3c2f               cmp     al, 0x2f
             05E6F 0000:5E6F  0900               or      word ptr [bx + si], ax
             05E71 0000:5E71  085801             or      byte ptr [bx + si + 1], bl
             05E74 0000:5E74  243e               and     al, 0x3e
             05E76 0000:5E76  c872fcfa           enter   -0x38e, -6
             05E7A 0000:5E7A  0008               add     byte ptr [bx + si], cl
             05E7C 0000:5E7C  f701b036           test    word ptr [bx + di], 0x36b0
             05E80 0000:5E80  4c                 dec     sp
             05E81 0000:5E81  76cb               jbe     0x5e4e
             05E83 0000:5E83  fa                 cli     
             05E84 0000:5E84  0004               add     byte ptr [si], al
*   L_05E86: 05E86 0000:5E86  7afe               jp      0x5e86
*            05E88 0000:5E88  bc34a4             mov     sp, 0xa434
*            05E8B 0000:5E8B  7851               js      0x5ede
*            05E8D 0000:5E8D  fc                 cld     
*            05E8E 0000:5E8E  0008               add     byte ptr [bx + si], cl
*            05E90 0000:5E90  2802               sub     byte ptr [bp + si], al
      05E92 0000:5E92  db   ',3`;f'
             05E97 0000:5E97  fd                 std     
*            05E98 0000:5E98  0004               add     byte ptr [si], al
*            05E9A 0000:5E9A  66f9               stc     
*            05E9C 0000:5E9C  60                 pushaw  
*            05E9D 0000:5E9D  3bf0               cmp     si, ax
*            05E9F 0000:5E9F  3ca6               cmp     al, 0xa6
*            05EA1 0000:5EA1  fc                 cld     
*            05EA2 0000:5EA2  0002               add     byte ptr [bp + si], al
*            05EA4 0000:5EA4  66fb               sti     
*            05EA6 0000:5EA6  60                 pushaw  
*            05EA7 0000:5EA7  3b487f             cmp     cx, word ptr [bx + si + 0x7f]
*            05EAA 0000:5EAA  0ffc00             paddb   mm0, qword ptr [bx + si]
*            05EAD 0000:5EAD  02e6               add     ah, dh
*            05EAF 0000:5EAF  fd                 std     
*            05EB0 0000:5EB0  803e68426e         cmp     byte ptr [0x4268], 0x6e
*            05EB5 0000:5EB5  fe00               inc     byte ptr [bx + si]
*            05EB7 0000:5EB7  086c03             or      byte ptr [si + 3], ch
*            05EBA 0000:5EBA  283c               sub     byte ptr [si], bh
*            05EBC 0000:5EBC  8805               mov     byte ptr [di], al
*            05EBE 0000:5EBE  ef                 out     dx, ax
*            05EBF 0000:5EBF  ff00               inc     word ptr [bx + si]
*            05EC1 0000:5EC1  04ef               add     al, 0xef
*            05EC3 0000:5EC3  fb                 sti     
*            05EC4 0000:5EC4  8805               mov     byte ptr [di], al
*            05EC6 0000:5EC6  c04ca801           ror     byte ptr [si - 0x58], 1
*            05ECA 0000:5ECA  0010               add     byte ptr [bx + si], dl
*            05ECC 0000:5ECC  ef                 out     dx, ax
*            05ECD 0000:5ECD  0f880507           js      0x65d6
*            05ED1 0000:5ED1  113b               adc     word ptr [bp + di], di
*            05ED3 0000:5ED3  0100               add     word ptr [bx + si], ax
*            05ED5 0000:5ED5  0416               add     al, 0x16
*            05ED7 0000:5ED7  fe8e0e38           dec     byte ptr [bp + 0x380e]
*            05EDB 0000:5EDB  47                 inc     di
*            05EDC 0000:5EDC  b90100             mov     cx, 1
*            05EDF 0000:5EDF  1000               adc     byte ptr [bx + si], al
*            05EE1 0000:5EE1  1000               adc     byte ptr [bx + si], al
*            05EE3 0000:5EE3  007f0b             add     byte ptr [bx + 0xb], bh
*            05EE6 0000:5EE6  4c                 dec     sp
*            05EE7 0000:5EE7  0100               add     word ptr [bx + si], ax
*            05EE9 0000:5EE9  0427               add     al, 0x27
*            05EEB 0000:5EEB  fe060980           inc     byte ptr [0x8009]
*            05EEF 0000:5EEF  0c22               or      al, 0x22
*   L_05EF1: 05EF1 0000:5EF1  0000               add     byte ptr [bx + si], al
*            05EF3 0000:5EF3  0427               add     al, 0x27
*            05EF5 0000:5EF5  fe060910           inc     byte ptr [0x1009]   ; RCRAM (road, shared)
*            05EF9 0000:5EF9  4e                 dec     si
*            05EFA 0000:5EFA  21ff               and     di, di
*            05EFC 0000:5EFC  0002               add     byte ptr [bp + si], al
*            05EFE 0000:5EFE  1f                 pop     ds
*            05EFF 0000:5EFF  013d               add     word ptr [di], di
*            05F01 0000:5F01  0e                 push    cs
*            05F02 0000:5F02  3011               xor     byte ptr [bx + di], dl
*            05F04 0000:5F04  1f                 pop     ds
*            05F05 0000:5F05  fd                 std     
*            05F06 0000:5F06  0004               add     byte ptr [si], al
*            05F08 0000:5F08  25fbb6             and     ax, 0xb6fb
*            05F0B 0000:5F0B  0d2413             or      ax, 0x1324
*            05F0E 0000:5F0E  4f                 dec     di
*            05F0F 0000:5F0F  f7001037           test    word ptr [bx + si], 0x3710
*            05F13 0000:5F13  f5                 cmc     
*            05F14 0000:5F14  47                 inc     di
*            05F15 0000:5F15  030c               add     cx, word ptr [si]
*            05F17 0000:5F17  57                 push    di
*            05F18 0000:5F18  d5f3               aad     0xf3
*            05F1A 0000:5F1A  0004               add     byte ptr [si], al
*            05F1C 0000:5F1C  d5f7               aad     0xf7
*            05F1E 0000:5F1E  1b17               sbb     dx, word ptr [bx]
*            05F20 0000:5F20  40                 inc     ax
*            05F21 0000:5F21  5f                 pop     di
      05F22 0000:5F22  db   c7
             05F23 0000:5F23  f4                 hlt     
             05F24 0000:5F24  0020               add     byte ptr [bx + si], ah
             05F26 0000:5F26  d413               aam     0x13
             05F28 0000:5F28  8417               test    byte ptr [bx], dl
             05F2A 0000:5F2A  6810f3             push    0xf310
             05F2D 0000:5F2D  0100               add     word ptr [bx + si], ax
             05F2F 0000:5F2F  0445               add     al, 0x45
      05F31 0000:5F31  db   fe
             05F32 0000:5F32  f8                 clc     
             05F33 0000:5F33  118813ea           adc     word ptr [bx + si - 0x15ed], cx
             05F37 0000:5F37  0200               add     al, byte ptr [bx + si]
             05F39 0000:5F39  1039               adc     byte ptr [bx + di], bh
             05F3B 0000:5F3B  f3a916ae           test    ax, 0xae16
             05F3F 0000:5F3F  15e801             adc     ax, 0x1e8
             05F42 0000:5F42  0002               add     byte ptr [bp + si], al
             05F44 0000:5F44  f4                 hlt     
             05F45 0000:5F45  00ec               add     ah, ch
             05F47 0000:5F47  137017             adc     si, word ptr [bx + si + 0x17]
             05F4A 0000:5F4A  a7                 cmpsw   word ptr [si], word ptr es:[di]
             05F4B 0000:5F4B  fc                 cld     
             05F4C 0000:5F4C  0010               add     byte ptr [bx + si], dl
             05F4E 0000:5F4E  48                 dec     ax
             05F4F 0000:5F4F  fa                 cli     
             05F50 0000:5F50  9d                 popf    
             05F51 0000:5F51  07                 pop     es
             05F52 0000:5F52  0059fe             add     byte ptr [bx + di - 2], bl
             05F55 0000:5F55  fa                 cli     
             05F56 0000:5F56  0002               add     byte ptr [bp + si], al
             05F58 0000:5F58  f3fc               cld     
             05F5A 0000:5F5A  6a19               push    0x19
             05F5C 0000:5F5C  205cf4             and     byte ptr [si - 0xc], bl
             05F5F 0000:5F5F  fa                 cli     
             05F60 0000:5F60  0008               add     byte ptr [bx + si], cl
             05F62 0000:5F62  d202               rol     byte ptr [bp + si], cl
             05F64 0000:5F64  a81a               test    al, 0x1a
             05F66 0000:5F66  40                 inc     ax
             05F67 0000:5F67  5f                 pop     di
             05F68 0000:5F68  d5fd               aad     0xfd
             05F6A 0000:5F6A  0004               add     byte ptr [si], al
*   L_05F6C: 05F6C 0000:5F6C  e3fe               jcxz    0x5f6c
*            05F6E 0000:5F6E  641b6c20           sbb     bp, word ptr fs:[si + 0x20]
*            05F72 0000:5F72  28ff               sub     bh, bh
*            05F74 0000:5F74  0002               add     byte ptr [bp + si], al
*            05F76 0000:5F76  4e                 dec     si
*            05F77 0000:5F77  fd                 std     
*            05F78 0000:5F78  2e21c4             and     sp, ax
      05F7B 0000:5F7B  db   62
             05F7C 0000:5F7C  ce                 into    
             05F7D 0000:5F7D  0100               add     word ptr [bx + si], ax
             05F7F 0000:5F7F  04dc               add     al, 0xdc
             05F81 0000:5F81  02e8               add     ch, al
             05F83 0000:5F83  1e                 push    ds
             05F84 0000:5F84  e425               in      al, 0x25
             05F86 0000:5F86  af                 scasw   ax, word ptr es:[di]
             05F87 0000:5F87  0400               add     al, 0
             05F89 0000:5F89  04c0               add     al, 0xc0
             05F8B 0000:5F8B  00a026d8           add     byte ptr [bx + si - 0x27da], ah
             05F8F 0000:5F8F  27                 daa     
             05F90 0000:5F90  f00300             lock add ax, word ptr [bx + si]
             05F93 0000:5F93  02b80242           add     bh, byte ptr [bx + si + 0x4202]
             05F97 0000:5F97  26f8               clc     
*            05F99 0000:5F99  6a60               push    0x60
*            05F9B 0000:5F9B  0200               add     al, byte ptr [bx + si]
*            05F9D 0000:5F9D  0460               add     al, 0x60
*            05F9F 0000:5F9F  06                 push    es
*            05FA0 0000:5FA0  042b               add     al, 0x2b
*            05FA2 0000:5FA2  ec                 in      al, dx
*            05FA3 0000:5FA3  2cae               sub     al, 0xae
*            05FA5 0000:5FA5  0000               add     byte ptr [bx + si], al
*            05FA7 0000:5FA7  026000             add     ah, byte ptr [bx + si]
*            05FAA 0000:5FAA  f22a7070           sub     dh, byte ptr [bx + si + 0x70]
*            05FAE 0000:5FAE  50                 push    ax
*            05FAF 0000:5FAF  fd                 std     
*            05FB0 0000:5FB0  0004               add     byte ptr [si], al
*            05FB2 0000:5FB2  4a                 dec     dx
*            05FB3 0000:5FB3  01e0               add     ax, sp
*            05FB5 0000:5FB5  306472             xor     byte ptr [si + 0x72], ah
*            05FB8 0000:5FB8  4e                 dec     si
*            05FB9 0000:5FB9  fe00               inc     byte ptr [bx + si]
*            05FBB 0000:5FBB  024dff             add     cl, byte ptr [di - 1]
*            05FBE 0000:5FBE  a830               test    al, 0x30
*            05FC0 0000:5FC0  90                 nop     
*            05FC1 0000:5FC1  73d5               jae     0x5f98
*            05FC3 0000:5FC3  0000               add     byte ptr [bx + si], al
*            05FC5 0000:5FC5  104606             adc     byte ptr [bp + 6], al
*            05FC8 0000:5FC8  8424               test    byte ptr [si], ah
*            05FCA 0000:5FCA  8435               test    byte ptr [di], dh
*            05FCC 0000:5FCC  27                 daa     
*            05FCD 0000:5FCD  0200               add     al, byte ptr [bx + si]
*            05FCF 0000:5FCF  0227               add     ah, byte ptr [bx]
*            05FD1 0000:5FD1  007135             add     byte ptr [bx + di + 0x35], dh
      05FD4 0000:5FD4  db   'xww'
             05FD7 0000:5FD7  0300               add     ax, word ptr [bx + si]
             05FD9 0000:5FD9  0227               add     ah, byte ptr [bx]
*   L_05FDB: 05FDB 0000:5FDB  0497               add     al, 0x97
*            05FDD 0000:5FDD  350839             xor     ax, 0x3908
*            05FE0 0000:5FE0  10060008           adc     byte ptr [0x800], al   ; SPCS RAM (shared w/main)
*            05FE4 0000:5FE4  b700               mov     bh, 0
*            05FE6 0000:5FE6  fb                 sti     
*            05FE7 0000:5FE7  3ec43b             les     di, ptr ds:[bp + di]
*            05FEA 0000:5FEA  4a                 dec     dx
*            05FEB 0000:5FEB  06                 push    es
*            05FEC 0000:5FEC  0002               add     byte ptr [bp + si], al
*            05FEE 0000:5FEE  ba0485             mov     dx, 0x8504
*            05FF1 0000:5FF1  3ab83d03           cmp     bh, byte ptr [bx + si + 0x33d]
*            05FF5 0000:5FF5  0400               add     al, 0
*            05FF7 0000:5FF7  0809               or      byte ptr [bx + di], cl
*            05FF9 0000:5FF9  00c7               add     bh, al
*            05FFB 0000:5FFB  36807e8303         cmp     byte ptr ss:[bp - 0x7d], 3
*            06000 0000:6000  0001               add     byte ptr [bx + di], al
*            06002 0000:6002  820496             add     byte ptr [si], 0x96
*            06005 0000:6005  3e7440             je      0x6048
*            06008 0000:6008  d6                 salc    
*            06009 0000:6009  0300               add     ax, word ptr [bx + si]
*            0600B 0000:600B  047f               add     al, 0x7f
*            0600D 0000:600D  07                 pop     es
*            0600E 0000:600E  d83ecc02           fdivr   dword ptr [0x2cc]   ; math_ram (shared)
*            06012 0000:6012  48                 dec     ax
*            06013 0000:6013  0300               add     ax, word ptr [bx + si]
*            06015 0000:6015  0201               add     al, byte ptr [bx + di]
*            06017 0000:6017  024201             add     al, byte ptr [bp + si + 1]
*            0601A 0000:601A  884529             mov     byte ptr [di + 0x29], al
*            0601D 0000:601D  0100               add     word ptr [bx + si], ax
*            0601F 0000:601F  086408             or      byte ptr [si + 8], ah
*            06022 0000:6022  f4                 hlt     
             06023 0000:6023  083e47c7           or      byte ptr [0xc747], bh
             06027 0000:6027  0000               add     byte ptr [bx + si], al
             06029 0000:6029  04c7               add     al, 0xc7
             0602B 0000:602B  043e               add     al, 0x3e
             0602D 0000:602D  07                 pop     es
             0602E 0000:602E  760e               jbe     0x603e
             06030 0000:6030  0e                 push    cs
             06031 0000:6031  ff00               inc     word ptr [bx + si]
             06033 0000:6033  10c7               adc     bh, al
      06035 0000:6035  db   f0
             06036 0000:6036  3e07               pop     es
             06038 0000:6038  bd527b             mov     bp, 0x7b52
             0603B 0000:603B  ff00               inc     word ptr [bx + si]
             0603D 0000:603D  04a0               add     al, 0xa0
             0603F 0000:603F  024410             add     al, byte ptr [si + 0x10]
             06042 0000:6042  3807               cmp     byte ptr [bx], al
*            06044 0000:6044  47                 inc     di
*            06045 0000:6045  fe00               inc     byte ptr [bx + si]
*            06047 0000:6047  1000               adc     byte ptr [bx + si], al
*            06049 0000:6049  f00000             lock add byte ptr [bx + si], al
*            0604C 0000:604C  7f4b               jg      0x6099
*            0604E 0000:604E  b4fe               mov     ah, 0xfe
*            06050 0000:6050  0004               add     byte ptr [si], al
*            06052 0000:6052  d901               fld     dword ptr [bx + di]
*            06054 0000:6054  06                 push    es
*            06055 0000:6055  09744e             or      word ptr [si + 0x4e], si
*            06058 0000:6058  be0100             mov     si, 1
*            0605B 0000:605B  10480b             adc     byte ptr [bx + si + 0xb], cl
*            0605E 0000:605E  9b                 wait    
*            0605F 0000:605F  01cc               add     sp, cx
*            06061 0000:6061  106902             adc     byte ptr [bx + di + 2], ch
*            06064 0000:6064  0002               add     byte ptr [bp + si], al
*            06066 0000:6066  8d00               lea     ax, [bx + si]
*            06068 0000:6068  0f10c0             movups  xmm0, xmm0
*            0606B 0000:606B  12c0               adc     al, al
*            0606D 0000:606D  0000               add     byte ptr [bx + si], al
*            0606F 0000:606F  04b1               add     al, 0xb1
      06071 0000:6071  db   fe
             06072 0000:6072  52                 push    dx
             06073 0000:6073  0fb454cb           lfs     dx, ptr [si - 0x35]
             06077 0000:6077  ff00               inc     word ptr [bx + si]
             06079 0000:6079  02c7               add     al, bh
             0607B 0000:607B  017714             add     word ptr [bx + 0x14], si
             0607E 0000:607E  44                 inc     sp
             0607F 0000:607F  56                 push    si
             06080 0000:6080  e90000             jmp     0x6083
*            06083 0000:6083  02c7               add     al, bh
*            06085 0000:6085  017714             add     word ptr [bx + 0x14], si
*            06088 0000:6088  64194e05           sbb     word ptr fs:[bp + 5], cx
*            0608C 0000:608C  0010               add     byte ptr [bx + si], dl
*            0608E 0000:608E  f8                 clc     
*            0608F 0000:608F  f9                 stc     
*            06090 0000:6090  ae                 scasb   al, byte ptr es:[di]
*            06091 0000:6091  2420               and     al, 0x20
*            06093 0000:6093  1c78               sbb     al, 0x78
*            06095 0000:6095  06                 push    es
*            06096 0000:6096  0004               add     byte ptr [si], al
*            06098 0000:6098  7802               js      0x609c
*            0609A 0000:609A  37                 aaa     
*            0609B 0000:609B  1c40               sbb     al, 0x40
*            0609D 0000:609D  5f                 pop     di
*            0609E 0000:609E  2e07               pop     es
*            060A0 0000:60A0  0008               add     byte ptr [bx + si], cl
*            060A2 0000:60A2  770e               ja      0x60b2
*            060A4 0000:60A4  f21b3a             sbb     di, word ptr [bp + si]
*            060A7 0000:60A7  2018               and     byte ptr [bx + si], bl
*            060A9 0000:60A9  07                 pop     es
*            060AA 0000:60AA  0001               add     byte ptr [bx + di], al
*            060AC 0000:60AC  45                 inc     bp
*            060AD 0000:60AD  06                 push    es
*            060AE 0000:60AE  aa                 stosb   byte ptr es:[di], al
*            060AF 0000:60AF  1f                 pop     ds
*            060B0 0000:60B0  98                 cwde    
*            060B1 0000:60B1  217d05             and     word ptr [di + 5], di
*            060B4 0000:60B4  0004               add     byte ptr [si], al
*            060B6 0000:60B6  ca03f9             retf    0xf903
*   L_060B9: 060B9 0000:60B9  1d2863             sbb     ax, 0x6328
*            060BC 0000:60BC  41                 inc     cx
*            060BD 0000:60BD  0300               add     ax, word ptr [bx + si]
*            060BF 0000:60BF  08e3               or      bl, ah
*            060C1 0000:60C1  08d6               or      dh, dl
*            060C3 0000:60C3  288065e3           sub     byte ptr [bx + si - 0x1c9b], al
*            060C7 0000:60C7  0200               add     al, byte ptr [bx + si]
*            060C9 0000:60C9  02aa0494           add     ch, byte ptr [bp + si - 0x6bfc]
*            060CD 0000:60CD  2474               and     al, 0x74
*            060CF 0000:60CF  672c05             sub     al, 5
*            060D2 0000:60D2  0004               add     byte ptr [si], al
*            060D4 0000:60D4  7006               jo      0x60dc
*            060D6 0000:60D6  a923f8             test    ax, 0xf823
*            060D9 0000:60D9  2ae5               sub     ah, ch
*            060DB 0000:60DB  07                 pop     es
*   L_060DC: 060DC 0000:60DC  0004               add     byte ptr [si], al
*            060DE 0000:60DE  e8033f             call    0x9fe4
*            060E1 0000:60E1  2b506d             sub     dx, word ptr [bx + si + 0x6d]
*            060E4 0000:60E4  dd08               fisttp  qword ptr [bx + si]
*            060E6 0000:60E6  0004               add     byte ptr [si], al
*            060E8 0000:60E8  e30b               jcxz    0x60f5
*            060EA 0000:60EA  b12a               mov     cl, 0x2a
*            060EC 0000:60EC  fa                 cli     
*            060ED 0000:60ED  6d                 insw    word ptr es:[di], dx
*            060EE 0000:60EE  0e                 push    cs
*            060EF 0000:60EF  0a00               or      al, byte ptr [bx + si]
*            060F1 0000:60F1  02600a             add     ah, byte ptr [bx + si + 0xa]
*            060F4 0000:60F4  012c               add     word ptr [si], bp
*            060F6 0000:60F6  44                 inc     sp
*            060F7 0000:60F7  2f                 das     
*            060F8 0000:60F8  9d                 popf    
*            060F9 0000:60F9  0b00               or      ax, word ptr [bx + si]
*            060FB 0000:60FB  02bc09f3           add     bh, byte ptr [si - 0xcf7]
*            060FF 0000:60FF  2f                 das     
*            06100 0000:6100  9c                 pushf   
*            06101 0000:6101  31160c00           xor     word ptr [0xc], dx   ; math_ram (shared)
*            06105 0000:6105  0818               or      byte ptr [bx + si], bl
*            06107 0000:6107  0400               add     al, 0
*            06109 0000:6109  3220               xor     ah, byte ptr [bx + si]
*            0610B 0000:610B  35520a             xor     ax, 0xa52
*            0610E 0000:610E  0004               add     byte ptr [si], al
*            06110 0000:6110  17                 pop     ss
*            06111 0000:6111  08ce               or      dh, cl
*            06113 0000:6113  3114               xor     word ptr [si], dx
*            06115 0000:6115  774c               ja      0x6163
*            06117 0000:6117  0800               or      byte ptr [bx + si], al
*            06119 0000:6119  08c8               or      al, cl
*            0611B 0000:611B  0e                 push    cs
*            0611C 0000:611C  c43b               les     di, ptr [bp + di]
*            0611E 0000:611E  6c                 insb    byte ptr es:[di], dx
*            0611F 0000:611F  794c               jns     0x616d
*            06121 0000:6121  0800               or      byte ptr [bx + si], al
*            06123 0000:6123  02eb               add     ch, bl
*            06125 0000:6125  094038             or      word ptr [bx + si + 0x38], ax
*            06128 0000:6128  287ccb             sub     byte ptr [si - 0x35], bh
*            0612B 0000:612B  0b00               or      ax, word ptr [bx + si]
*            0612D 0000:612D  08c8               or      al, cl
*            0612F 0000:612F  0e                 push    cs
*            06130 0000:6130  bc3480             mov     sp, 0x8034
*            06133 0000:6133  3efc               cld     
*            06135 0000:6135  0c00               or      al, 0
*            06137 0000:6137  020c               add     cl, byte ptr [si]
*            06139 0000:6139  0b03               or      ax, word ptr [bp + di]
*            0613B 0000:613B  3eac               lodsb   al, byte ptr ds:[si]
*            0613D 0000:613D  3f                 aas     
*            0613E 0000:613E  290c               sub     word ptr [si], cx
*            06140 0000:6140  0002               add     byte ptr [bp + si], al
*            06142 0000:6142  0c0b               or      al, 0xb
*            06144 0000:6144  033ed800           add     di, word ptr [0xd8]   ; math_ram (shared)
*            06148 0000:6148  69090008           imul    cx, word ptr [bx + di], 0x800
*            0614C 0000:614C  b407               mov     ah, 7
*            0614E 0000:614E  07                 pop     es
*            0614F 0000:614F  3904               cmp     word ptr [si], ax
*            06151 0000:6151  42                 inc     dx
*            06152 0000:6152  a90600             test    ax, 6
*            06155 0000:6155  081e0ba9           or      byte ptr [0xa90b], bl
*            06159 0000:6159  08c0               or      al, al
*            0615B 0000:615B  44                 inc     sp
*            0615C 0000:615C  ef                 out     dx, ax
*            0615D 0000:615D  0400               add     al, 0
*            0615F 0000:615F  04e3               add     al, 0xe3
*            06161 0000:6161  085605             or      byte ptr [bp + 5], dl
*            06164 0000:6164  384a12             cmp     byte ptr [bp + si + 0x12], cl
*            06167 0000:6167  050010             add     ax, 0x1000
*            0616A 0000:616A  c3                 ret     
             0616B 0000:616B  1419               adc     al, 0x19
*   L_0616D: 0616D 0000:616D  07                 pop     es
*            0616E 0000:616E  c84b9906           enter   -0x66b5, 6
*            06172 0000:6172  0002               add     byte ptr [bp + si], al
*            06174 0000:6174  0807               or      byte ptr [bx], al
*            06176 0000:6176  d409               aam     9
*            06178 0000:6178  bc0d50             mov     sp, 0x500d
*            0617B 0000:617B  0a00               or      al, byte ptr [bx + si]
*            0617D 0000:617D  08dd               or      ch, bl
*            0617F 0000:617F  0497               add     al, 0x97
*            06181 0000:6181  1333               adc     si, word ptr [bp + di]
*            06183 0000:6183  0ff30a             psllq   mm1, qword ptr [bp + si]
*            06186 0000:6186  0002               add     byte ptr [bp + si], al
*            06188 0000:6188  f30833             or      byte ptr [bp + di], dh
*            0618B 0000:618B  0f6b56ac           packssdw mm2, qword ptr [bp - 0x54]
*            0618F 0000:618F  0c00               or      al, 0
*            06191 0000:6191  10f3               adc     bl, dh
*            06193 0000:6193  1a33               sbb     dh, byte ptr [bp + di]
*            06195 0000:6195  0fb21a             lss     bx, ptr [bp + si]
*            06198 0000:6198  3f                 aas     
*            06199 0000:6199  0c00               or      al, 0
*            0619B 0000:619B  041a               add     al, 0x1a
*            0619D 0000:619D  0939               or      word ptr [bx + di], di
*            0619F 0000:619F  1838               sbb     byte ptr [bx + si], bh
*            061A1 0000:61A1  47                 inc     di
*            061A2 0000:61A2  b90100             mov     cx, 1
*            061A5 0000:61A5  1000               adc     byte ptr [bx + si], al
*            061A7 0000:61A7  1000               adc     byte ptr [bx + si], al
*            061A9 0000:61A9  007f0b             add     byte ptr [bx + 0xb], bh
*            061AC 0000:61AC  4c                 dec     sp
*            061AD 0000:61AD  0100               add     word ptr [bx + si], ax
*            061AF 0000:61AF  0427               add     al, 0x27
*            061B1 0000:61B1  fe0609ee           inc     byte ptr [0xee09]
*            061B5 0000:61B5  0c04               or      al, 4
*            061B7 0000:61B7  ff00               inc     word ptr [bx + si]
*            061B9 0000:61B9  0427               add     al, 0x27
*            061BB 0000:61BB  fe0609d8           inc     byte ptr [0xd809]
*            061BF 0000:61BF  4e                 dec     si
*            061C0 0000:61C0  38fa               cmp     dl, bh
*            061C2 0000:61C2  0010               add     byte ptr [bx + si], dl
*            061C4 0000:61C4  7802               js      0x61c8
*            061C6 0000:61C6  8d1c               lea     bx, [si]
*   L_061C8: 061C8 0000:61C8  cc                 int3    
*            061C9 0000:61C9  50                 push    ax
*            061CA 0000:61CA  44                 inc     sp
*            061CB 0000:61CB  f9                 stc     
*            061CC 0000:61CC  0002               add     byte ptr [bp + si], al
*            061CE 0000:61CE  40                 inc     ax
*            061CF 0000:61CF  fb                 sti     
      061D0 0000:61D0  db   8f
             061D1 0000:61D1  10c0               adc     al, al
             061D3 0000:61D3  1203               adc     al, byte ptr [bp + di]
             061D5 0000:61D5  f9                 stc     
             061D6 0000:61D6  0004               add     byte ptr [si], al
             061D8 0000:61D8  4b                 dec     bx
             061D9 0000:61D9  f5                 cmc     
             061DA 0000:61DA  46                 inc     si
             061DB 0000:61DB  1118               adc     word ptr [bx + si], bx
             061DD 0000:61DD  55                 push    bp
             061DE 0000:61DE  ae                 scasb   al, byte ptr es:[di]
             061DF 0000:61DF  f9                 stc     
             061E0 0000:61E0  0002               add     byte ptr [bp + si], al
      061E2 0000:61E2  db   df
             061E3 0000:61E3  fa                 cli     
             061E4 0000:61E4  7d13               jge     0x61f9
             061E6 0000:61E6  a856               test    al, 0x56
             061E8 0000:61E8  fd                 std     
             061E9 0000:61E9  fd                 std     
             061EA 0000:61EA  0008               add     byte ptr [bx + si], cl
*   L_061EC: 061EC 0000:61EC  72fe               jb      0x61ec
*            061EE 0000:61EE  ab                 stosw   word ptr es:[di], ax
*            061EF 0000:61EF  0e                 push    cs
*            061F0 0000:61F0  3818               cmp     byte ptr [bx + si], bl
*            061F2 0000:61F2  d4ff               aam     0xff
*            061F4 0000:61F4  0002               add     byte ptr [bp + si], al
*            061F6 0000:61F6  e0fd               loopne  0x61f5
*            061F8 0000:61F8  a7                 cmpsw   word ptr [si], word ptr es:[di]
*            061F9 0000:61F9  18e8               sbb     al, ch
*            061FB 0000:61FB  1c1c               sbb     al, 0x1c
*            061FD 0000:61FD  fd                 std     
*            061FE 0000:61FE  0004               add     byte ptr [si], al
*            06200 0000:6200  ec                 in      al, dx
*            06201 0000:6201  fb                 sti     
*            06202 0000:6202  16                 push    ss
*            06203 0000:6203  19d0               sbb     ax, dx
*            06205 0000:6205  60                 pushaw  
*            06206 0000:6206  4c                 dec     sp
*            06207 0000:6207  fa                 cli     
*            06208 0000:6208  0004               add     byte ptr [si], al
*            0620A 0000:620A  4c                 dec     sp
      0620B 0000:620B  db   fe
             0620C 0000:620C  ba20c4             mov     dx, 0xc420
             0620F 0000:620F  22e4               and     ah, ah
             06211 0000:6211  f8                 clc     
             06212 0000:6212  0002               add     byte ptr [bp + si], al
             06214 0000:6214  4c                 dec     sp
             06215 0000:6215  f8                 clc     
      06216 0000:6216  db   db
             06217 0000:6217  205a23             and     byte ptr [bp + si + 0x23], bl
*   L_0621A: 0621A 0000:621A  37                 aaa     
*            0621B 0000:621B  f60010             test    byte ptr [bx + si], 0x10
*            0621E 0000:621E  24f4               and     al, 0xf4
*   L_06220: 06220 0000:6220  7d13               jge     0x6235
*            06222 0000:6222  1c65               sbb     al, 0x65
*            06224 0000:6224  7df4               jge     0x621a
*   L_06226: 06226 0000:6226  0002               add     byte ptr [bp + si], al
*            06228 0000:6228  79f6               jns     0x6220
*            0622A 0000:622A  56                 push    si
*            0622B 0000:622B  250469             and     ax, 0x6904
*            0622E 0000:622E  71f6               jno     0x6226
*            06230 0000:6230  0004               add     byte ptr [si], al
*            06232 0000:6232  76f8               jbe     0x622c
*            06234 0000:6234  90                 nop     
*   L_06235: 06235 0000:6235  25cc69             and     ax, 0x69cc
*   L_06238: 06238 0000:6238  44                 inc     sp
*            06239 0000:6239  f8                 clc     
*            0623A 0000:623A  0008               add     byte ptr [bx + si], cl
*            0623C 0000:623C  7bfa               jnp     0x6238
*            0623E 0000:623E  1c22               sbb     al, 0x22
*            06240 0000:6240  762a               jbe     0x626c
*            06242 0000:6242  f2f8               clc     
*            06244 0000:6244  0001               add     byte ptr [bx + di], al
*            06246 0000:6246  fd                 std     
*            06247 0000:6247  f7c22a50           test    dx, 0x502a
*            0624B 0000:624B  2dc3f8             sub     ax, 0xf8c3
*            0624E 0000:624E  0004               add     byte ptr [si], al
*            06250 0000:6250  20f5               and     ch, dh
*            06252 0000:6252  a5                 movsw   word ptr es:[di], word ptr [si]
*            06253 0000:6253  2b38               sub     di, word ptr [bx + si]
*            06255 0000:6255  710e               jno     0x6265
*            06257 0000:6257  f8                 clc     
*            06258 0000:6258  0008               add     byte ptr [bx + si], cl
*            0625A 0000:625A  0900               or      word ptr [bx + si], ax
*            0625C 0000:625C  a6                 cmpsb   byte ptr [si], byte ptr es:[di]
*            0625D 0000:625D  302c               xor     byte ptr [si], ch
*            0625F 0000:625F  33e9               xor     bp, cx
*            06261 0000:6261  f60002             test    byte ptr [bx + si], 2
*            06264 0000:6264  0ff65c31           psadbw  mm3, qword ptr [si + 0x31]
      06268 0000:6268  db   ' uO'
*            0626B 0000:626B  f4                 hlt     
*   L_0626C: 0626C 0000:626C  0008               add     byte ptr [bx + si], cl
*            0626E 0000:626E  50                 push    ax
*            0626F 0000:626F  fa                 cli     
*            06270 0000:6270  6a3a               push    0x3a
*            06272 0000:6272  7877               js      0x62eb
*            06274 0000:6274  17                 pop     ss
*            06275 0000:6275  f4                 hlt     
             06276 0000:6276  0002               add     byte ptr [bp + si], al
             06278 0000:6278  cf                 iret    
             06279 0000:6279  f5                 cmc     
             0627A 0000:627A  7236               jb      0x62b2
             0627C 0000:627C  d07936             sar     byte ptr [bx + di + 0x36], 1
             0627F 0000:627F  f60008             test    byte ptr [bx + si], 8
             06282 0000:6282  f7fa               idiv    dx
             06284 0000:6284  60                 pushaw  
             06285 0000:6285  33803e8e           xor     ax, word ptr [bx + si - 0x71c2]
             06289 0000:6289  f70004d6           test    word ptr [bx + si], 0xd604
             0628D 0000:628D  f3083d             or      byte ptr [di], bh
             06290 0000:6290  68420e             push    0xe42
             06293 0000:6293  f70008ff           test    word ptr [bx + si], 0xff08
      06297 0000:6297  db   fe
             06298 0000:6298  7001               jo      0x629b
             0629A 0000:629A  0c44               or      al, 0x44
*            0629C 0000:629C  5e                 pop     si
*            0629D 0000:629D  f8                 clc     
*            0629E 0000:629E  0002               add     byte ptr [bp + si], al
*            062A0 0000:62A0  0af9               or      bh, cl
*            062A2 0000:62A2  2a02               sub     al, byte ptr [bp + si]
*            062A4 0000:62A4  ec                 in      al, dx
*            062A5 0000:62A5  05b2f9             add     ax, 0xf9b2
*            062A8 0000:62A8  0002               add     byte ptr [bp + si], al
*            062AA 0000:62AA  b2f7               mov     dl, 0xf7
*            062AC 0000:62AC  ee                 out     dx, al
*            062AD 0000:62AD  050c09             add     ax, 0x90c
*            062B0 0000:62B0  36f8               clc     
*            062B2 0000:62B2  0004               add     byte ptr [si], al
*            062B4 0000:62B4  b2f5               mov     dl, 0xf5
      062B6 0000:62B6  db   f0
             062B7 0000:62B7  05004b             add     ax, 0x4b00
             062BA 0000:62BA  82f700             xor     bh, 0
             062BD 0000:62BD  0278f9             add     bh, byte ptr [bx + si - 7]
             062C0 0000:62C0  9a0ae84e8a         lcall   0x8a4e, 0xe80a
             062C5 0000:62C5  f9                 stc     
             062C6 0000:62C6  0008               add     byte ptr [bx + si], cl
             062C8 0000:62C8  59                 pop     cx
             062C9 0000:62C9  ff6809             ljmp    [bx + si + 9]
             062CC 0000:62CC  7e4f               jle     0x631d
             062CE 0000:62CE  99                 cdq     
             062CF 0000:62CF  fa                 cli     
             062D0 0000:62D0  0002               add     byte ptr [bp + si], al
      062D2 0000:62D2  db   fe
             062D3 0000:62D3  fa                 cli     
             062D4 0000:62D4  880d               mov     byte ptr [di], cl
             062D6 0000:62D6  7810               js      0x62e8
             062D8 0000:62D8  f2fb               sti     
             062DA 0000:62DA  0002               add     byte ptr [bp + si], al
             062DC 0000:62DC  34fa               xor     al, 0xfa
             062DE 0000:62DE  7411               je      0x62f1
             062E0 0000:62E0  3413               xor     al, 0x13
             062E2 0000:62E2  e4fc               in      al, 0xfc
             062E4 0000:62E4  0008               add     byte ptr [bx + si], cl
             062E6 0000:62E6  fb                 sti     
             062E7 0000:62E7  f4                 hlt     
*            062E8 0000:62E8  6714c4             adc     al, 0xc4
*   L_062EB: 062EB 0000:62EB  1477               adc     al, 0x77
*            062ED 0000:62ED  fc                 cld     
*            062EE 0000:62EE  0002               add     byte ptr [bp + si], al
*            062F0 0000:62F0  eafa81134a         ljmp    0x4a13:0x81fa
             062F5 0000:62F5  57                 push    di
*            062F6 0000:62F6  91                 xchg    cx, ax
*            062F7 0000:62F7  fb                 sti     
*            062F8 0000:62F8  0004               add     byte ptr [si], al
*            062FA 0000:62FA  91                 xchg    cx, ax
*            062FB 0000:62FB  ff4a17             dec     word ptr [bp + si + 0x17]
*            062FE 0000:62FE  6a5a               push    0x5a
*            06300 0000:6300  e0fb               loopne  0x62fd
*            06302 0000:6302  0010               add     byte ptr [bx + si], dl
*            06304 0000:6304  91                 xchg    cx, ax
*            06305 0000:6305  0b4a17             or      cx, word ptr [bp + si + 0x17]
*            06308 0000:6308  8a1d               mov     bl, byte ptr [di]
*            0630A 0000:630A  2f                 das     
*            0630B 0000:630B  fc                 cld     
*            0630C 0000:630C  0010               add     byte ptr [bx + si], dl
*            0630E 0000:630E  2f                 das     
*            0630F 0000:630F  ec                 in      al, dx
*            06310 0000:6310  8a1d               mov     bl, byte ptr [di]
*   L_06312: 06312 0000:6312  aa                 stosb   byte ptr es:[di], al
*            06313 0000:6313  60                 pushaw  
*            06314 0000:6314  7efc               jle     0x6312
*            06316 0000:6316  0010               add     byte ptr [bx + si], dl
*            06318 0000:6318  2f                 das     
*            06319 0000:6319  0c8a               or      al, 0x8a
*            0631B 0000:631B  1dca23             sbb     ax, 0x23ca
*            0631E 0000:631E  cdfc               int     0xfc
*            06320 0000:6320  0010               add     byte ptr [bx + si], dl
*            06322 0000:6322  cdec               int     0xec
*            06324 0000:6324  ca23e1             retf    0xe123
             06327 0000:6327  42                 inc     dx
             06328 0000:6328  8900               mov     word ptr [bx + si], ax
             0632A 0000:632A  0008               add     byte ptr [bx + si], cl
             0632C 0000:632C  0008               add     byte ptr [bx + si], cl
             0632E 0000:632E  0000               add     byte ptr [bx + si], al
             06330 0000:6330  c20512             ret     0x1205
             06333 0000:6333  0100               add     word ptr [bx + si], ax
             06335 0000:6335  0812               or      byte ptr [bp + si], dl
             06337 0000:6337  f9                 stc     
             06338 0000:6338  c205bf             ret     0xbf05
             0633B 0000:633B  07                 pop     es
             0633C 0000:633C  4a                 dec     dx
             0633D 0000:633D  ff00               inc     word ptr [bx + si]
             0633F 0000:633F  0212               add     dl, byte ptr [bp + si]
             06341 0000:6341  ffc2               inc     dx
             06343 0000:6343  05304a             add     ax, 0x4a30
             06346 0000:6346  68f800             push    0xf8
             06349 0000:6349  100f               adc     byte ptr [bx], cl
             0634B 0000:634B  01a51780           add     word ptr [di - 0x7fe9], sp
             0634F 0000:634F  4c                 dec     sp
             06350 0000:6350  97                 xchg    di, ax
             06351 0000:6351  f700027d           test    word ptr [bx + si], 0x7d02
             06355 0000:6355  f9                 stc     
             06356 0000:6356  df0b               fisttp  word ptr [bp + di]
             06358 0000:6358  94                 xchg    sp, ax
             06359 0000:6359  1193f700           adc     word ptr [bp + di + 0xf7], dx
             0635D 0000:635D  08ff               or      bh, bh
             0635F 0000:635F  ef                 out     dx, ax
             06360 0000:6360  040f               add     al, 0xf
             06362 0000:6362  8853f6             mov     byte ptr [bp + di - 0xa], dl
             06365 0000:6365  f7000278           test    word ptr [bx + si], 0x7802
             06369 0000:6369  f9                 stc     
             0636A 0000:636A  3812               cmp     byte ptr [bp + si], dl
             0636C 0000:636C  b454               mov     ah, 0x54
             0636E 0000:636E  b9f900             mov     cx, 0xf9
             06371 0000:6371  04fa               add     al, 0xfa
             06373 0000:6373  fa                 cli     
             06374 0000:6374  e810d4             call    0x3787
             06377 0000:6377  17                 pop     ss
*            06378 0000:6378  69fc0004           imul    di, sp, 0x400
*            0637C 0000:637C  78f8               js      0x6376
*            0637E 0000:637E  801820             sbb     byte ptr [bx + si], 0x20
*            06381 0000:6381  1c8f               sbb     al, 0x8f
*            06383 0000:6383  fc                 cld     
*            06384 0000:6384  0010               add     byte ptr [bx + si], dl
*            06386 0000:6386  a3ec84             mov     word ptr [0x84ec], ax
*            06389 0000:6389  1aa41f63           sbb     ah, byte ptr [si + 0x631f]
*   L_0638D: 0638D 0000:638D  f9                 stc     
*            0638E 0000:638E  0004               add     byte ptr [si], al
*            06390 0000:6390  94                 xchg    sp, ax
*            06391 0000:6391  f8                 clc     
*            06392 0000:6392  b91b98             mov     cx, 0x981b
*            06395 0000:6395  61                 popaw   
*            06396 0000:6396  caf700             retf    0xf7
             06399 0000:6399  02ca               add     cl, dl
             0639B 0000:639B  f9                 stc     
             0639C 0000:639C  99                 cdq     
             0639D 0000:639D  2128               and     word ptr [bx + si], bp
             0639F 0000:639F  6389f800           arpl    word ptr [bx + di + 0xf8], cx
             063A3 0000:63A3  02ca               add     cl, dl
             063A5 0000:63A5  f9                 stc     
             063A6 0000:63A6  99                 cdq     
             063A7 0000:63A7  211c               and     word ptr [si], bx
             063A9 0000:63A9  253ef9             and     ax, 0xf93e
             063AC 0000:63AC  0002               add     byte ptr [bp + si], al
             063AE 0000:63AE  48                 dec     ax
             063AF 0000:63AF  f7b7247a           div     word ptr [bx + 0x7a24]
             063B3 0000:63B3  263af8             cmp     bh, al
             063B6 0000:63B6  0002               add     byte ptr [bp + si], al
             063B8 0000:63B8  48                 dec     ax
             063B9 0000:63B9  f7b7243c           div     word ptr [bx + 0x3c24]
*            063BD 0000:63BD  6887f6             push    0xf687
*            063C0 0000:63C0  0004               add     byte ptr [si], al
*            063C2 0000:63C2  1e                 push    ds
*            063C3 0000:63C3  fa                 cli     
*            063C4 0000:63C4  002a               add     byte ptr [bp + si], ch
*            063C6 0000:63C6  886cbe             mov     byte ptr [si - 0x42], ch
*            063C9 0000:63C9  f5                 cmc     
*            063CA 0000:63CA  0008               add     byte ptr [bx + si], cl
*            063CC 0000:63CC  b5fd               mov     ch, 0xfd
*            063CE 0000:63CE  c42b               les     bp, ptr [bp + di]
*            063D0 0000:63D0  dc2d               fsubr   qword ptr [di]
*            063D2 0000:63D2  65f5               cmc     
*            063D4 0000:63D4  0002               add     byte ptr [bp + si], al
*            063D6 0000:63D6  c0f3b9             sal     bl, 0xb9
*            063D9 0000:63D9  2c22               sub     al, 0x22
*            063DB 0000:63DB  70b0               jo      0x638d
*            063DD 0000:63DD  f4                 hlt     
             063DE 0000:63DE  0004               add     byte ptr [si], al
             063E0 0000:63E0  b0f8               mov     al, 0xf8
             063E2 0000:63E2  2230               and     dh, byte ptr [bx + si]
             063E4 0000:63E4  f1                 int1    
             063E5 0000:63E5  72d6               jb      0x63bd
             063E7 0000:63E7  f5                 cmc     
             063E8 0000:63E8  0004               add     byte ptr [si], al
             063EA 0000:63EA  b0f8               mov     al, 0xf8
      063EC 0000:63EC  db   '"0 5@'
             063F1 0000:63F1  f60002             test    byte ptr [bx + si], 2
*            063F4 0000:63F4  69f45834           imul    si, sp, 0x3458
*            063F8 0000:63F8  1477               adc     al, 0x77
*            063FA 0000:63FA  78f6               js      0x63f2
*            063FC 0000:63FC  0002               add     byte ptr [bp + si], al
*            063FE 0000:63FE  17                 pop     ss
*            063FF 0000:63FF  f8                 clc     
*            06400 0000:6400  e83534             call    0x9838
*            06403 0000:6403  3a26f700           cmp     ah, byte ptr [0xf7]   ; math_ram (shared)
*            06407 0000:6407  043a               add     al, 0x3a
*            06409 0000:6409  f36c               rep insb byte ptr es:[di], dx
*            0640B 0000:640B  39803ea1           cmp     word ptr [bx + si - 0x5ec2], ax
*            0640F 0000:640F  f5                 cmc     
*            06410 0000:6410  0010               add     byte ptr [bx + si], dl
*            06412 0000:6412  75e7               jne     0x63fb
*            06414 0000:6414  1437               adc     al, 0x37
*            06416 0000:6416  d84034             fadd    dword ptr [bx + si + 0x34]
*            06419 0000:6419  f5                 cmc     
*            0641A 0000:641A  0004               add     byte ptr [si], al
*            0641C 0000:641C  2cf9               sub     al, 0xf9
*            0641E 0000:641E  5b                 pop     bx
*            0641F 0000:641F  006842             add     byte ptr [bx + si + 0x42], ch
*            06422 0000:6422  55                 push    bp
*            06423 0000:6423  f60002             test    byte ptr [bx + si], 2
*            06426 0000:6426  30f7               xor     bh, dh
*            06428 0000:6428  99                 cdq     
*            06429 0000:6429  00c0               add     al, al
*            0642B 0000:642B  04f0               add     al, 0xf0
*            0642D 0000:642D  f9                 stc     
*            0642E 0000:642E  0010               add     byte ptr [bx + si], dl
*            06430 0000:6430  7eef               jle     0x6421
*            06432 0000:6432  df10               fist    word ptr [bx + si]
*            06434 0000:6434  7c07               jl      0x643d
*            06436 0000:6436  51                 push    cx
*            06437 0000:6437  fb                 sti     
*            06438 0000:6438  0004               add     byte ptr [si], al
*            0643A 0000:643A  54                 push    sp
*            0643B 0000:643B  f7c8070c           test    ax, 0xc07
*            0643F 0000:643F  09bcfa00           or      word ptr [si + 0xfa], di
*            06443 0000:6443  0252f9             add     dl, byte ptr [bp + si - 7]
*            06446 0000:6446  a207e0             mov     byte ptr [0xe007], al
*            06449 0000:6449  4b                 dec     bx
*            0644A 0000:644A  90                 nop     
*            0644B 0000:644B  f9                 stc     
*            0644C 0000:644C  0004               add     byte ptr [si], al
*            0644E 0000:644E  90                 nop     
*            0644F 0000:644F  fd                 std     
*            06450 0000:6450  e00b               loopne  0x645d
*            06452 0000:6452  185349             sbb     byte ptr [bp + di + 0x49], dl
*            06455 0000:6455  fb                 sti     
*            06456 0000:6456  0010               add     byte ptr [bx + si], dl
*            06458 0000:6458  90                 nop     
*            06459 0000:6459  09e0               or      ax, sp
*            0645B 0000:645B  0b5f17             or      bx, word ptr [bx + 0x17]
*            0645E 0000:645E  dcfa               fdiv    st(2), st(0)
*            06460 0000:6460  0004               add     byte ptr [si], al
*            06462 0000:6462  b7f7               mov     bh, 0xf7
*            06464 0000:6464  e614               out     0x14, al
*            06466 0000:6466  3847b9             cmp     byte ptr [bx - 0x47], al
*            06469 0000:6469  0100               add     word ptr [bx + si], ax
*            0646B 0000:646B  1000               adc     byte ptr [bx + si], al
*            0646D 0000:646D  1000               adc     byte ptr [bx + si], al
*            0646F 0000:646F  007f0b             add     byte ptr [bx + 0xb], bh
*            06472 0000:6472  4c                 dec     sp
*            06473 0000:6473  0100               add     word ptr [bx + si], ax
*            06475 0000:6475  0427               add     al, 0x27
*            06477 0000:6477  fe060930           inc     byte ptr [0x3009]   ; MATH UNIT (mul/div/geometry)
*            0647B 0000:647B  0c42               or      al, 0x42
*            0647D 0000:647D  0000               add     byte ptr [bx + si], al
*            0647F 0000:647F  02baff43           add     bh, byte ptr [bp + si + 0x43ff]
*            06483 0000:6483  0a10               or      dl, byte ptr [bx + si]
*            06485 0000:6485  4e                 dec     si
*            06486 0000:6486  cafe00             retf    0xfe
             06489 0000:6489  02ca               add     cl, dl
             0648B 0000:648B  001e0e94           add     byte ptr [0x940e], bl
             0648F 0000:648F  51                 push    cx
             06490 0000:6490  b100               mov     cl, 0
             06492 0000:6492  0004               add     byte ptr [si], al
             06494 0000:6494  ca022c             retf    0x2c02
             06497 0000:6497  0e                 push    cs
             06498 0000:6498  8813               mov     byte ptr [bp + di], dl
             0649A 0000:649A  a10100             mov     ax, word ptr [1]   ; math_ram (shared)
             0649D 0000:649D  02a5ff48           add     ah, byte ptr [di + 0x48ff]
             064A1 0000:64A1  1318               adc     bx, word ptr [bx + si]
             064A3 0000:64A3  157d00             adc     ax, 0x7d
             064A6 0000:64A6  0002               add     byte ptr [bp + si], al
             064A8 0000:64A8  a5                 movsw   word ptr es:[di], word ptr [si]
             064A9 0000:64A9  ff4813             dec     word ptr [bx + si + 0x13]
             064AC 0000:64AC  a856               test    al, 0x56
             064AE 0000:64AE  3efe00             inc     byte ptr ds:[bx + si]
             064B1 0000:64B1  08dd               or      ch, bl
             064B3 0000:64B3  03591c             add     bx, word ptr [bx + di + 0x1c]
             064B6 0000:64B6  6459               pop     cx
             064B8 0000:64B8  23fe               and     di, si
             064BA 0000:64BA  0002               add     byte ptr [bp + si], al
             064BC 0000:64BC  a6                 cmpsb   byte ptr [si], byte ptr es:[di]
             064BD 0000:64BD  ff14               call    word ptr [si]
             064BF 0000:64BF  18905ae4           sbb     byte ptr [bx + si - 0x1ba6], dl
             064C3 0000:64C3  ff00               inc     word ptr [bx + si]
             064C5 0000:64C5  0428               add     al, 0x28
             064C7 0000:64C7  01c5               add     bp, ax
             064C9 0000:64C9  16                 push    ss
             064CA 0000:64CA  841c               test    byte ptr [si], bl
             064CC 0000:64CC  2d0200             sub     ax, 2
             064CF 0000:64CF  04a0               add     al, 0xa0
      064D1 0000:64D1  db   fe
             064D2 0000:64D2  5b                 pop     bx
             064D3 0000:64D3  1e                 push    ds
             064D4 0000:64D4  d020               shl     byte ptr [bx + si], 1
             064D6 0000:64D6  0d0300             or      ax, 3
             064D9 0000:64D9  0813               or      byte ptr [bp + di], dl
             064DB 0000:64DB  fb                 sti     
             064DC 0000:64DC  3220               xor     ah, byte ptr [bx + si]
             064DE 0000:64DE  92                 xchg    dx, ax
             064DF 0000:64DF  22a50100           and     ah, byte ptr [di + 1]
             064E3 0000:64E3  020f               add     cl, byte ptr [bx]
             064E5 0000:64E5  01a920b8           add     word ptr [bx + di - 0x47e0], bp
             064E9 0000:64E9  643f               aas     
             064EB 0000:64EB  0000               add     byte ptr [bx + si], al
             064ED 0000:64ED  023b               add     bh, byte ptr [bp + di]
             064EF 0000:64EF  027b24             add     bh, byte ptr [bp + di + 0x24]
             064F2 0000:64F2  ac                 lodsb   al, byte ptr [si]
             064F3 0000:64F3  66bc00000830       mov     esp, 0x30080000
             064F9 0000:64F9  08c4               or      ah, al
             064FB 0000:64FB  236829             and     bp, word ptr [bx + si + 0x29]
             064FE 0000:64FE  cc                 int3    
             064FF 0000:64FF  0000               add     byte ptr [bx + si], al
             06501 0000:6501  0402               add     al, 2
             06503 0000:6503  fd                 std     
             06504 0000:6504  2028               and     byte ptr [bx + si], ch
             06506 0000:6506  bc2a41             mov     sp, 0x412a
             06509 0000:6509  ff00               inc     word ptr [bx + si]
             0650B 0000:650B  02e7               add     ah, bh
             0650D 0000:650D  fec4               inc     ah
             0650F 0000:650F  2824               sub     byte ptr [si], ah
             06511 0000:6511  6c                 insb    byte ptr es:[di], dx
             06512 0000:6512  dcfc               fdiv    st(4), st(0)
             06514 0000:6514  0004               add     byte ptr [si], al
             06516 0000:6516  f5                 cmc     
             06517 0000:6517  ffac2eb4           ljmp    [si - 0x4bd2]
             0651B 0000:651B  6d                 insw    word ptr es:[di], dx
             0651C 0000:651C  6e                 outsb   dx, byte ptr [si]
             0651D 0000:651D  fc                 cld     
             0651E 0000:651E  0002               add     byte ptr [bp + si], al
             06520 0000:6520  68fe68             push    0x68fe
             06523 0000:6523  2dc832             sub     ax, 0x32c8
             06526 0000:6526  61                 popaw   
             06527 0000:6527  fc                 cld     
             06528 0000:6528  0010               add     byte ptr [bx + si], dl
             0652A 0000:652A  9b                 wait    
             0652B 0000:652B  ec                 in      al, dx
             0652C 0000:652C  1430               adc     al, 0x30
             0652E 0000:652E  bc742c             mov     sp, 0x2c74
             06531 0000:6531  fd                 std     
             06532 0000:6532  0002               add     byte ptr [bp + si], al
             06534 0000:6534  5a                 pop     dx
      06535 0000:6535  db   fe
             06536 0000:6536  1e                 push    ds
             06537 0000:6537  33a438c2           xor     sp, word ptr [si - 0x3dc8]
             0653B 0000:653B  fe00               inc     byte ptr [bx + si]
             0653D 0000:653D  04d1               add     al, 0xd1
             0653F 0000:653F  fa                 cli     
             06540 0000:6540  f737               div     word ptr [bx]
             06542 0000:6542  c43b               les     di, ptr [bp + di]
             06544 0000:6544  10fc               adc     ah, bh
             06546 0000:6546  0004               add     byte ptr [si], al
             06548 0000:6548  d1fa               sar     dx, 1
             0654A 0000:654A  f737               div     word ptr [bx]
             0654C 0000:654C  b87db0             mov     ax, 0xb07d
             0654F 0000:654F  fa                 cli     
             06550 0000:6550  0002               add     byte ptr [bp + si], al
             06552 0000:6552  b0fc               mov     al, 0xfc
*   L_06554: 06554 0000:6554  ab                 stosw   word ptr es:[di], ax
*            06555 0000:6555  3d3003             cmp     ax, 0x330
      06558 0000:6558  db   df
             06559 0000:6559  f9                 stc     
             0655A 0000:655A  0010               add     byte ptr [bx + si], dl
             0655C 0000:655C  b1ea               mov     cl, 0xea
             0655E 0000:655E  203e2a44           and     byte ptr [0x442a], bh
             06562 0000:6562  12fa               adc     bh, dl
             06564 0000:6564  0001               add     byte ptr [bx + di], al
             06566 0000:6566  d2fa               sar     dl, cl
             06568 0000:6568  81037e45           add     word ptr [bp + di], 0x457e
             0656C 0000:656C  98                 cwde    
             0656D 0000:656D  fc                 cld     
             0656E 0000:656E  0004               add     byte ptr [si], al
             06570 0000:6570  13fd               adc     di, bp
             06572 0000:6572  8501               test    word ptr [bx + di], ax
             06574 0000:6574  7c07               jl      0x657d
             06576 0000:6576  5b                 pop     bx
             06577 0000:6577  fe00               inc     byte ptr [bx + si]
             06579 0000:6579  025bfc             add     bl, byte ptr [bp + di - 4]
             0657C 0000:657C  7a07               jp      0x6585
*            0657E 0000:657E  384a6c             cmp     byte ptr [bp + si + 0x6c], cl
*            06581 0000:6581  ff00               inc     word ptr [bx + si]
*            06583 0000:6583  045b               add     al, 0x5b
*            06585 0000:6585  028007f0           add     al, byte ptr [bx + si - 0xff9]
*            06589 0000:6589  0c7d               or      al, 0x7d
*            0658B 0000:658B  0000               add     byte ptr [bx + si], al
*            0658D 0000:658D  047d               add     al, 0x7d
*            0658F 0000:658F  fc                 cld     
      06590 0000:6590  db   f0
             06591 0000:6591  0c28               or      al, 0x28
             06593 0000:6593  54                 push    sp
             06594 0000:6594  360200             add     al, byte ptr ss:[bx + si]
             06597 0000:6597  107d10             adc     byte ptr [di + 0x10], bh
      0659A 0000:659A  db   f0
             0659B 0000:659B  0c6f               or      al, 0x6f
             0659D 0000:659D  18c9               sbb     cl, cl
             0659F 0000:659F  0100               add     word ptr [bx + si], ax
             065A1 0000:65A1  04a4               add     al, 0xa4
      065A3 0000:65A3  db   fe
             065A4 0000:65A4  f615               not     byte ptr [di]
             065A6 0000:65A6  3847b9             cmp     byte ptr [bx - 0x47], al
             065A9 0000:65A9  0100               add     word ptr [bx + si], ax
             065AB 0000:65AB  1000               adc     byte ptr [bx + si], al
             065AD 0000:65AD  1000               adc     byte ptr [bx + si], al
             065AF 0000:65AF  00920ad7           add     byte ptr [bp + si - 0x28f6], dl
             065B3 0000:65B3  0100               add     word ptr [bx + si], ax
             065B5 0000:65B5  0427               add     al, 0x27
             065B7 0000:65B7  fe06091e           inc     byte ptr [0x1e09]   ; RCRAM (road, shared)
             065BB 0000:65BB  4c                 dec     sp
             065BC 0000:65BC  8701               xchg    word ptr [bx + di], ax
             065BE 0000:65BE  0004               add     byte ptr [si], al
             065C0 0000:65C0  8805               mov     byte ptr [di], al
             065C2 0000:65C2  1e                 push    ds
             065C3 0000:65C3  0cca               or      al, 0xca
             065C5 0000:65C5  4f                 dec     di
             065C6 0000:65C6  f1                 int1    
             065C7 0000:65C7  0300               add     ax, word ptr [bx + si]
             065C9 0000:65C9  0488               add     al, 0x88
             065CB 0000:65CB  051e0c             add     ax, 0xc1e
             065CE 0000:65CE  2413               and     al, 0x13
             065D0 0000:65D0  59                 pop     cx
             065D1 0000:65D1  06                 push    es
             065D2 0000:65D2  0004               add     byte ptr [si], al
             065D4 0000:65D4  5c                 pop     sp
             065D5 0000:65D5  027613             add     dh, byte ptr [bp + 0x13]
*            065D8 0000:65D8  40                 inc     ax
*            065D9 0000:65D9  15cd04             adc     ax, 0x4cd
*            065DC 0000:65DC  0002               add     byte ptr [bp + si], al
*            065DE 0000:65DE  5b                 pop     bx
*            065DF 0000:65DF  044d               add     al, 0x4d
*            065E1 0000:65E1  13a85652           adc     bp, word ptr [bx + si + 0x5256]
*            065E5 0000:65E5  0300               add     ax, word ptr [bx + si]
*            065E7 0000:65E7  023f               add     bh, byte ptr [bx]
*            065E9 0000:65E9  053317             add     ax, 0x1733
*            065EC 0000:65EC  6459               pop     cx
*            065EE 0000:65EE  0a03               or      al, byte ptr [bp + di]
*            065F0 0000:65F0  0008               add     byte ptr [bx + si], cl
*            065F2 0000:65F2  050bd4             add     ax, 0xd40b
*            065F5 0000:65F5  18801b65           sbb     byte ptr [bx + si + 0x651b], al
*            065F9 0000:65F9  0100               add     word ptr [bx + si], ax
*            065FB 0000:65FB  020b               add     cl, byte ptr [bp + di]
*            065FD 0000:65FD  0188194c           add     word ptr [bx + si + 0x4c19], cx
*            06601 0000:6601  5d                 pop     bp
*            06602 0000:6602  9afd0008cd         lcall   0xcd08, 0xfd
*            06607 0000:6607  026023             add     ah, byte ptr [bx + si + 0x23]
*            0660A 0000:660A  40                 inc     ax
*            0660B 0000:660B  5f                 pop     di
*            0660C 0000:660C  f3fc               cld     
*            0660E 0000:660E  0002               add     byte ptr [bp + si], al
*            06610 0000:6610  e7fe               out     0xfe, ax
*            06612 0000:6612  d11e2863           rcr     word ptr [0x6328], 1
*            06616 0000:6616  16                 push    ss
*            06617 0000:6617  ff00               inc     word ptr [bx + si]
*            06619 0000:6619  08c2               or      dl, al
*            0661B 0000:661B  0484               add     al, 0x84
*            0661D 0000:661D  1d1027             sbb     ax, 0x2710
*            06620 0000:6620  1900               sbb     word ptr [bx + si], ax
*            06622 0000:6622  0004               add     byte ptr [si], al
*            06624 0000:6624  40                 inc     ax
*            06625 0000:6625  fc                 cld     
*            06626 0000:6626  fa                 cli     
*            06627 0000:6627  256e28             and     ax, 0x286e
      0662A 0000:662A  db   c4
             0662B 0000:662B  fe00               inc     byte ptr [bx + si]
             0662D 0000:662D  022c               add     ch, byte ptr [si]
             0662F 0000:662F  fe852604           inc     byte ptr [di + 0x426]
             06633 0000:6633  695efd0008         imul    bx, word ptr [bp - 3], 0x800
             06638 0000:6638  2401               and     al, 1
             0663A 0000:663A  1230               adc     dh, byte ptr [bx + si]
             0663C 0000:663C  5c                 pop     sp
             0663D 0000:663D  6b66fc00           imul    sp, word ptr [bp - 4], 0
             06641 0000:6641  024ffe             add     cl, byte ptr [bx - 2]
      06644 0000:6644  db   c7
             06645 0000:6645  2a446f             sub     al, byte ptr [si + 0x6f]
             06648 0000:6648  0bff               or      di, di
             0664A 0000:664A  0008               add     byte ptr [bx + si], cl
             0664C 0000:664C  0d0407             or      ax, 0x704
             0664F 0000:664F  2920               sub     word ptr [bx + si], sp
             06651 0000:6651  7022               jo      0x6675
             06653 0000:6653  0100               add     word ptr [bx + si], ax
             06655 0000:6655  048c               add     al, 0x8c
             06657 0000:6657  0125               add     word ptr [di], sp
             06659 0000:6659  2c00               sub     al, 0
             0665B 0000:665B  32ec               xor     ch, ah
             0665D 0000:665D  0200               add     al, byte ptr [bx + si]
             0665F 0000:665F  02ed               add     ch, ch
             06661 0000:6661  001d               add     byte ptr [di], bl
             06663 0000:6663  32cf               xor     cl, bh
             06665 0000:6665  735f               jae     0x66c6
             06667 0000:6667  0400               add     al, 0
             06669 0000:6669  02eb               add     ch, bl
             0666B 0000:666B  04e3               add     al, 0xe3
             0666D 0000:666D  315e35             xor     word ptr [bp + 0x35], bx
             06670 0000:6670  cb                 retf    
             06671 0000:6671  050002             add     ax, 0x200
             06674 0000:6674  d303               rol     word ptr [bp + di], cl
             06676 0000:6676  bc35dc             mov     sp, 0xdc35
*            06679 0000:6679  37                 aaa     
*            0667A 0000:667A  7305               jae     0x6681
*            0667C 0000:667C  0004               add     byte ptr [si], al
*            0667E 0000:667E  dc01               fadd    qword ptr [bx + di]
*            06680 0000:6680  1936e038           sbb     word ptr [0x38e0], si   ; MATH UNIT (mul/div/geometry)
*            06684 0000:6684  4a                 dec     dx
*            06685 0000:6685  0400               add     al, 0
*            06687 0000:6687  02a703fa           add     ah, byte ptr [bx - 0x5fd]
*            0668B 0000:668B  36c47baa           les     di, ptr ss:[bp + di - 0x56]
*            0668F 0000:668F  0100               add     word ptr [bx + si], ax
*            06691 0000:6691  0490               add     al, 0x90
*            06693 0000:6693  05ab3c             add     ax, 0x3cab
      06696 0000:6696  db   f0
             06697 0000:6697  3ce2               cmp     al, 0xe2
             06699 0000:6699  0000               add     byte ptr [bx + si], al
             0669B 0000:669B  02b7ff51           add     dh, byte ptr [bx + 0x51ff]
             0669F 0000:669F  3b1c               cmp     bx, word ptr [si]
             066A1 0000:66A1  3e81fe0008         cmp     si, 0x800
             066A6 0000:66A6  35fc72             xor     ax, 0x72fc
             066A9 0000:66A9  36104014           adc     byte ptr ss:[bx + si + 0x14], al
             066AD 0000:66AD  fd                 std     
             066AE 0000:66AE  0002               add     byte ptr [bp + si], al
             066B0 0000:66B0  14ff               adc     al, 0xff
             066B2 0000:66B2  06                 push    es
             066B3 0000:66B3  0030               add     byte ptr [bx + si], dh
             066B5 0000:66B5  43                 inc     bx
             066B6 0000:66B6  ae                 scasb   al, byte ptr es:[di]
             066B7 0000:66B7  fe00               inc     byte ptr [bx + si]
             066B9 0000:66B9  0414               add     al, 0x14
             066BB 0000:66BB  01fc               add     sp, di
             066BD 0000:66BD  3f                 aas     
             066BE 0000:66BE  c044be02           rol     byte ptr [si - 0x42], 2
             066C2 0000:66C2  0008               add     byte ptr [bx + si], cl
             066C4 0000:66C4  7a03               jp      0x66c9
*            066C6 0000:66C6  c9                 leave   
*            066C7 0000:66C7  3c50               cmp     al, 0x50
*            066C9 0000:66C9  06                 push    es
*            066CA 0000:66CA  8f05               pop     word ptr [di]
*            066CC 0000:66CC  0004               add     byte ptr [si], al
*            066CE 0000:66CE  60                 pushaw  
*            066CF 0000:66CF  02bc080c           add     bh, byte ptr [si + 0xc08]
*            066D3 0000:66D3  094305             or      word ptr [bp + di + 5], ax
*            066D6 0000:66D6  0002               add     byte ptr [bp + si], al
*            066D8 0000:66D8  f8                 clc     
*            066D9 0000:66D9  03860792           add     ax, word ptr [bp - 0x6df9]
*            066DD 0000:66DD  4a                 dec     dx
*            066DE 0000:66DE  8e04               mov     es, word ptr [si]
*            066E0 0000:66E0  0002               add     byte ptr [bp + si], al
*            066E2 0000:66E2  8e06920a           mov     es, word ptr [0xa92]   ; SPCS RAM (shared w/main)
*            066E6 0000:66E6  ca11d5             retf    0xd511
             066E9 0000:66E9  0200               add     al, byte ptr [bx + si]
             066EB 0000:66EB  108ef492           adc     byte ptr [bp - 0x6d0c], cl
             066EF 0000:66EF  0a11               or      dl, byte ptr [bx + di]
             066F1 0000:66F1  56                 push    si
             066F2 0000:66F2  42                 inc     dx
             066F3 0000:66F3  0300               add     ax, word ptr [bx + si]
             066F5 0000:66F5  0467               add     al, 0x67
             066F7 0000:66F7  06                 push    es
             066F8 0000:66F8  98                 cwde    
             066F9 0000:66F9  1338               adc     di, word ptr [bx + si]
             066FB 0000:66FB  07                 pop     es
             066FC 0000:66FC  47                 inc     di
             066FD 0000:66FD  fe00               inc     byte ptr [bx + si]
             066FF 0000:66FF  1000               adc     byte ptr [bx + si], al
             06701 0000:6701  f00000             lock add byte ptr [bx + si], al
             06704 0000:6704  7f4b               jg      0x6751
             06706 0000:6706  b4fe               mov     ah, 0xfe
             06708 0000:6708  0004               add     byte ptr [si], al
             0670A 0000:670A  d901               fld     dword ptr [bx + di]
             0670C 0000:670C  06                 push    es
             0670D 0000:670D  09744e             or      word ptr [si + 0x4e], si
             06710 0000:6710  be0300             mov     si, 3
             06713 0000:6713  08fe               or      dh, bh
             06715 0000:6715  048d               add     al, 0x8d
             06717 0000:6717  06                 push    es
             06718 0000:6718  68106e             push    0x6e10
             0671B 0000:671B  050002             add     ax, 0x200
             0671E 0000:671E  6e                 outsb   dx, byte ptr [si]
             0671F 0000:671F  036e10             add     bp, word ptr [bp + 0x10]
             06722 0000:6722  ec                 in      al, dx
             06723 0000:6723  53                 push    bx
             06724 0000:6724  9c                 pushf   
             06725 0000:6725  07                 pop     es
             06726 0000:6726  0004               add     byte ptr [si], al
             06728 0000:6728  6e                 outsb   dx, byte ptr [si]
             06729 0000:6729  095c10             or      word ptr [si + 0x10], bx
             0672C 0000:672C  b414               mov     ah, 0x14
             0672E 0000:672E  260800             or      byte ptr es:[bx + si], al
             06731 0000:6731  0128               add     word ptr [bx + si], bp
             06733 0000:6733  07                 pop     es
             06734 0000:6734  d014               rcl     byte ptr [si]
             06736 0000:6736  7017               jo      0x674f
             06738 0000:6738  7307               jae     0x6741
             0673A 0000:673A  0004               add     byte ptr [si], al
             0673C 0000:673C  2c04               sub     al, 4
             0673E 0000:673E  2415               and     al, 0x15
             06740 0000:6740  3818               cmp     byte ptr [bx + si], bl
             06742 0000:6742  57                 push    di
             06743 0000:6743  06                 push    es
*            06744 0000:6744  0002               add     byte ptr [bp + si], al
*            06746 0000:6746  d005               rol     byte ptr [di], 1
*            06748 0000:6748  4a                 dec     dx
*            06749 0000:6749  16                 push    ss
*            0674A 0000:674A  6459               pop     cx
*            0674C 0000:674C  6e                 outsb   dx, byte ptr [si]
*            0674D 0000:674D  0400               add     al, 0
*            0674F 0000:674F  0465               add     al, 0x65
*            06751 0000:6751  07                 pop     es
*            06752 0000:6752  141c               adc     al, 0x1c
*            06754 0000:6754  bc5b2e             mov     sp, 0x2e5b
*            06757 0000:6757  0400               add     al, 0
*            06759 0000:6759  02e9               add     ch, cl
*            0675B 0000:675B  05bc1a             add     ax, 0x1abc
*            0675E 0000:675E  141e               adc     al, 0x1e
*            06760 0000:6760  ee                 out     dx, al
*            06761 0000:6761  0300               add     ax, word ptr [bx + si]
*            06763 0000:6763  027302             add     dh, byte ptr [bp + di + 2]
*            06766 0000:6766  bc1caa             mov     sp, 0xaa1c
*            06769 0000:6769  1e                 push    ds
*            0676A 0000:676A  f9                 stc     
*            0676B 0000:676B  0200               add     al, byte ptr [bx + si]
*            0676D 0000:676D  027302             add     dh, byte ptr [bp + di + 2]
*            06770 0000:6770  bc1ca4             mov     sp, 0xa41c
*            06773 0000:6773  5f                 pop     di
*            06774 0000:6774  3f                 aas     
*            06775 0000:6775  0100               add     word ptr [bx + si], ax
*            06777 0000:6777  0405               add     al, 5
*            06779 0000:6779  0486               add     al, 0x86
*            0677B 0000:677B  229861b3           and     bl, byte ptr [bx + si - 0x4c9f]
*            0677F 0000:677F  0000               add     byte ptr [bx + si], al
*            06781 0000:6781  02a20215           add     ah, byte ptr [bp + si + 0x1502]
*            06785 0000:6785  21c4               and     sp, ax
*            06787 0000:6787  628e0100           bound   cx, dword ptr [bp + 1]
*            0678B 0000:678B  02a20215           add     ah, byte ptr [bp + si + 0x1502]
*            0678F 0000:678F  211c               and     word ptr [si], bx
*            06791 0000:6791  255d02             and     ax, 0x25d
*            06794 0000:6794  0002               add     byte ptr [bp + si], al
*            06796 0000:6796  7a00               jp      0x6798
*   L_06798: 06798 0000:6798  7324               jae     0x67be
*            0679A 0000:679A  a6                 cmpsb   byte ptr [si], byte ptr es:[di]
*            0679B 0000:679B  27                 daa     
*            0679C 0000:679C  a3ff00             mov     word ptr [0xff], ax   ; math_ram (shared)
*            0679F 0000:679F  0496               add     al, 0x96
*            067A1 0000:67A1  feca               dec     dl
*            067A3 0000:67A3  2330               and     si, word ptr [bx + si]
*            067A5 0000:67A5  6aa4               push    -0x5c
*            067A7 0000:67A7  fb                 sti     
*            067A8 0000:67A8  0008               add     byte ptr [bx + si], cl
*            067AA 0000:67AA  bd015e             mov     bp, 0x5e01
*            067AD 0000:67AD  2f                 das     
*            067AE 0000:67AE  ec                 in      al, dx
*            067AF 0000:67AF  6c                 insb    byte ptr es:[di], dx
      067B0 0000:67B0  db   c7
             067B1 0000:67B1  fb                 sti     
*   L_067B2: 067B2 0000:67B2  0002               add     byte ptr [bp + si], al
*            067B4 0000:67B4  2afd               sub     bh, ch
*            067B6 0000:67B6  7b2b               jnp     0x67e3
*            067B8 0000:67B8  7c6e               jl      0x6828
*            067BA 0000:67BA  1dfe00             sbb     ax, 0xfe
*            067BD 0000:67BD  085301             or      byte ptr [bp + di + 1], dl
      067C0 0000:67C0  db   '('81f\00'
             067C6 0000:67C6  0004               add     byte ptr [si], al
             067C8 0000:67C8  82fc26             cmp     ah, 0x26
             067CB 0000:67CB  32903323           xor     dl, byte ptr [bx + si + 0x2333]
*            067CF 0000:67CF  ff00               inc     word ptr [bx + si]
*            067D1 0000:67D1  0274fe             add     dh, byte ptr [si - 2]
*            067D4 0000:67D4  af                 scasw   ax, word ptr es:[di]
*            067D5 0000:67D5  3120               xor     word ptr [bx + si], sp
*            067D7 0000:67D7  75d9               jne     0x67b2
*            067D9 0000:67D9  fd                 std     
*            067DA 0000:67DA  0002               add     byte ptr [bp + si], al
*            067DC 0000:67DC  d2ff               sar     bh, cl
*            067DE 0000:67DE  7135               jno     0x6815
*            067E0 0000:67E0  b076               mov     al, 0x76
*            067E2 0000:67E2  42                 inc     dx
*   L_067E3: 067E3 0000:67E3  fe00               inc     byte ptr [bx + si]
*            067E5 0000:67E5  02d3               add     dl, bl
*            067E7 0000:67E7  ff7135             push    word ptr [bx + di + 0x35]
*            067EA 0000:67EA  803e7bff00         cmp     byte ptr [0xff7b], 0
*            067EF 0000:67EF  08ff               or      bh, bh
*            067F1 0000:67F1  f7ab3b7a           imul    word ptr [bp + di + 0x7a3b]
*            067F5 0000:67F5  7fa2               jg      0x6799
*            067F7 0000:67F7  ff00               inc     word ptr [bx + si]
*            067F9 0000:67F9  016a00             add     word ptr [bp + si], bp
*            067FC 0000:67FC  db3e6842           fstp    xword ptr [0x4268]
*            06800 0000:6800  b004               mov     al, 4
*            06802 0000:6802  0008               add     byte ptr [bx + si], cl
*            06804 0000:6804  e505               in      ax, 5
*            06806 0000:6806  803a5c             cmp     byte ptr [bp + si], 0x5c
*            06809 0000:6809  0463               add     al, 0x63
*            0680B 0000:680B  06                 push    es
*            0680C 0000:680C  0002               add     byte ptr [bp + si], al
*            0680E 0000:680E  6304               arpl    word ptr [si], ax
*            06810 0000:6810  6204               bound   ax, dword ptr [si]
*            06812 0000:6812  ec                 in      al, dx
*            06813 0000:6813  05aa05             add     ax, 0x5aa
*            06816 0000:6816  0002               add     byte ptr [bp + si], al
*            06818 0000:6818  6304               arpl    word ptr [si], ax
*            0681A 0000:681A  6204               bound   ax, dword ptr [si]
*            0681C 0000:681C  384a69             cmp     byte ptr [bp + si + 0x69], cl
*            0681F 0000:681F  0400               add     al, 0
*            06821 0000:6821  0438               add     al, 0x38
*            06823 0000:6823  0800               or      byte ptr [bx + si], al
*            06825 0000:6825  098c4bd2           or      word ptr [si - 0x2db5], cx
*            06829 0000:6829  050002             add     ax, 0x200
*            0682C 0000:682C  51                 push    cx
*            0682D 0000:682D  06                 push    es
*            0682E 0000:682E  9c                 pushf   
*            0682F 0000:682F  096c0f             or      word ptr [si + 0xf], bp
*            06832 0000:6832  d408               aam     8
*            06834 0000:6834  0004               add     byte ptr [si], al
*            06836 0000:6836  d404               aam     4
*            06838 0000:6838  6c                 insb    byte ptr es:[di], dx
*            06839 0000:6839  0f8c1285           jl      0xffffed4f
*            0683D 0000:683D  0800               or      byte ptr [bx + si], al
*            0683F 0000:683F  10d4               adc     ah, dl
*            06841 0000:6841  f8                 clc     
*            06842 0000:6842  6c                 insb    byte ptr es:[di], dx
*            06843 0000:6843  0fac553608         shrd    word ptr [di + 0x36], dx, 8
*            06848 0000:6848  0010               add     byte ptr [bx + si], dl
*            0684A 0000:684A  3618ac15cc         sbb     byte ptr ss:[si - 0x33eb], ch
*            0684F 0000:684F  18e7               sbb     bh, ah
*            06851 0000:6851  07                 pop     es
*            06852 0000:6852  0010               add     byte ptr [bx + si], dl
*            06854 0000:6854  36f8               clc     
*            06856 0000:6856  ac                 lodsb   al, byte ptr [si]
*            06857 0000:6857  15ec5b             adc     ax, 0x5bec
*            0685A 0000:685A  98                 cwde    
*            0685B 0000:685B  07                 pop     es
*            0685C 0000:685C  0010               add     byte ptr [bx + si], dl
*            0685E 0000:685E  98                 cwde    
*            0685F 0000:685F  17                 pop     ss
*            06860 0000:6860  ec                 in      al, dx
*            06861 0000:6861  1be1               sbb     sp, cx
*            06863 0000:6863  0277ff             add     dh, byte ptr [bx - 1]
*            06866 0000:6866  0008               add     byte ptr [bx + si], cl
*            06868 0000:6868  00f8               add     al, bh
*            0686A 0000:686A  0000               add     byte ptr [bx + si], al
*            0686C 0000:686C  c245ee             ret     0xee45
             0686F 0000:686F  fe00               inc     byte ptr [bx + si]
             06871 0000:6871  08ee               or      dh, ch
             06873 0000:6873  06                 push    es
             06874 0000:6874  c205bf             ret     0xbf05
             06877 0000:6877  47                 inc     di
             06878 0000:6878  b600               mov     dh, 0
             0687A 0000:687A  0002               add     byte ptr [bp + si], al
             0687C 0000:687C  ee                 out     dx, al
             0687D 0000:687D  00c2               add     dl, al
             0687F 0000:687F  055b0a             add     ax, 0xa5b
             06882 0000:6882  e107               loope   0x688b
             06884 0000:6884  0010               add     byte ptr [bx + si], dl
             06886 0000:6886  fa                 cli     
      06887 0000:6887  db   fe
             06888 0000:6888  a7                 cmpsw   word ptr [si], word ptr es:[di]
             06889 0000:6889  17                 pop     ss
             0688A 0000:688A  ac                 lodsb   al, byte ptr [si]
             0688B 0000:688B  0da709             or      ax, 0x9a7
             0688E 0000:688E  0004               add     byte ptr [si], al
             06890 0000:6890  a7                 cmpsw   word ptr [si], word ptr es:[di]
             06891 0000:6891  05ae0d             add     ax, 0xdae
             06894 0000:6894  0410               add     al, 0x10
             06896 0000:6896  4e                 dec     si
             06897 0000:6897  0900               or      word ptr [bx + si], ax
             06899 0000:6899  08a701b0           or      byte ptr [bx - 0x4fff], ah
             0689D 0000:689D  0d5c52             or      ax, 0x525c
             068A0 0000:68A0  45                 inc     bp
             068A1 0000:68A1  0a00               or      al, byte ptr [bx + si]
             068A3 0000:68A3  0238               add     bh, byte ptr [bx + si]
             068A5 0000:68A5  0b99107c           or      bx, word ptr [bx + di + 0x7c10]
             068A9 0000:68A9  155a0c             adc     ax, 0xc5a
             068AC 0000:68AC  0004               add     byte ptr [si], al
             068AE 0000:68AE  5f                 pop     di
             068AF 0000:68AF  08e1               or      cl, ah
             068B1 0000:68B1  157017             adc     ax, 0x1770
             068B4 0000:68B4  52                 push    dx
             068B5 0000:68B5  0b00               or      ax, word ptr [bx + si]
             068B7 0000:68B7  025c0a             add     bl, byte ptr [si + 0xa]
             068BA 0000:68BA  af                 scasw   ax, word ptr es:[di]
             068BB 0000:68BB  156459             adc     ax, 0x5964
             068BE 0000:68BE  4b                 dec     bx
             068BF 0000:68BF  0a00               or      al, byte ptr [bx + si]
             068C1 0000:68C1  02480c             add     cl, byte ptr [bx + si + 0xc]
             068C4 0000:68C4  3119               xor     word ptr [bx + di], bx
             068C6 0000:68C6  f4                 hlt     
             068C7 0000:68C7  5a                 pop     dx
             068C8 0000:68C8  56                 push    si
             068C9 0000:68C9  0b00               or      ax, word ptr [bx + si]
             068CB 0000:68CB  02480c             add     cl, byte ptr [bx + si + 0xc]
             068CE 0000:68CE  3119               xor     word ptr [bx + di], bx
             068D0 0000:68D0  141e               adc     al, 0x1e
             068D2 0000:68D2  6d                 insw    word ptr es:[di], dx
             068D3 0000:68D3  0d0004             or      ax, 0x400
             068D6 0000:68D6  7209               jb      0x68e1
             068D8 0000:68D8  7a1e               jp      0x68f8
             068DA 0000:68DA  3421               xor     al, 0x21
             068DC 0000:68DC  5f                 pop     di
             068DD 0000:68DD  0c00               or      al, 0
             068DF 0000:68DF  0472               add     al, 0x72
*            068E1 0000:68E1  097a1e             or      word ptr [bp + si + 0x1e], di
*            068E4 0000:68E4  2462               and     al, 0x62
*            068E6 0000:68E6  230c               and     cx, word ptr [si]
*            068E8 0000:68E8  0001               add     byte ptr [bx + di], al
*            068EA 0000:68EA  1a0d               sbb     cl, byte ptr [di]
*            068EC 0000:68EC  e321               jcxz    0x690f
*            068EE 0000:68EE  54                 push    sp
*            068EF 0000:68EF  649d               popf    
*            068F1 0000:68F1  0d0004             or      ax, 0x400
*            068F4 0000:68F4  0110               add     word ptr [bx + si], dx
*            068F6 0000:68F6  1f                 pop     ds
*            068F7 0000:68F7  216829             and     word ptr [bx + si + 0x29], bp
*            068FA 0000:68FA  b81000             mov     ax, 0x10
*   L_068FD: 068FD 0000:68FD  08d5               or      ch, dl
*            068FF 0000:68FF  08be2af8           or      byte ptr [bp - 0x7d6], bh
*            06903 0000:6903  6a0e               push    0xe
*            06905 0000:6905  1200               adc     al, byte ptr [bx + si]
*            06907 0000:6907  02b11212           add     dh, byte ptr [bx + di + 0x1212]
*            0690B 0000:690B  29502d             sub     word ptr [bx + si + 0x2d], dx
*            0690E 0000:690E  831400             adc     word ptr [si], 0
*            06911 0000:6911  04c8               add     al, 0xc8
*            06913 0000:6913  10c3               adc     bl, al
*            06915 0000:6915  2ec832a114         enter   -0x5ece, 0x14
*            0691A 0000:691A  0008               add     byte ptr [bx + si], cl
*            0691C 0000:691C  0e                 push    cs
*            0691D 0000:691D  0d3630             or      ax, 0x3036
*            06920 0000:6920  f4                 hlt     
             06921 0000:6921  33931300           xor     dx, word ptr [bp + di + 0x13]
             06925 0000:6925  02bc1223           add     bh, byte ptr [si + 0x2312]
*            06929 0000:6929  32e8               xor     ch, al
*            0692B 0000:692B  756b               jne     0x6998
*            0692D 0000:692D  1200               adc     al, byte ptr [bx + si]
*            0692F 0000:692F  026a14             add     ch, byte ptr [bp + si + 0x14]
*            06932 0000:6932  c535               lds     si, ptr [di]
*            06934 0000:6934  a4                 movsb   byte ptr es:[di], byte ptr [si]
*            06935 0000:6935  78c6               js      0x68fd
*            06937 0000:6937  1300               adc     ax, word ptr [bx + si]
*            06939 0000:6939  0469               add     al, 0x69
*            0693B 0000:693B  16                 push    ss
*            0693C 0000:693C  a23560             mov     byte ptr [0x6035], al
*            0693F 0000:693F  3b21               cmp     sp, word ptr [bx + di]
*            06941 0000:6941  150004             adc     ax, 0x400
*            06944 0000:6944  2311               and     dx, word ptr [bx + di]
*            06946 0000:6946  a6                 cmpsb   byte ptr [si], byte ptr es:[di]
*            06947 0000:6947  3b543d             cmp     dx, word ptr [si + 0x3d]
*            0694A 0000:694A  f8                 clc     
*            0694B 0000:694B  1300               adc     ax, word ptr [bx + si]
*            0694D 0000:694D  0222               add     ah, byte ptr [bp + si]
*            0694F 0000:694F  13833be4           adc     ax, word ptr [bp + di - 0x1bc5]
*            06953 0000:6953  7ed2               jle     0x6927
*            06955 0000:6955  1200               adc     al, byte ptr [bx + si]
*            06957 0000:6957  02ce               add     cl, dh
*            06959 0000:6959  1425               adc     al, 0x25
*            0695B 0000:695B  3f                 aas     
*            0695C 0000:695C  5c                 pop     sp
*            0695D 0000:695D  44                 inc     sp
*            0695E 0000:695E  1c14               sbb     al, 0x14
*            06960 0000:6960  0008               add     byte ptr [bx + si], cl
*            06962 0000:6962  c11ae8             rcr     word ptr [bp + si], 0xe8
*            06965 0000:6965  3f                 aas     
*            06966 0000:6966  50                 push    ax
*            06967 0000:6967  06                 push    es
*            06968 0000:6968  43                 inc     bx
*            06969 0000:6969  1400               adc     al, 0
*            0696B 0000:696B  027312             add     dh, byte ptr [bp + di + 0x12]
*            0696E 0000:696E  7905               jns     0x6975
*            06970 0000:6970  0c09               or      al, 9
*            06972 0000:6972  2f                 das     
*            06973 0000:6973  1200               adc     al, byte ptr [bx + si]
*   L_06975: 06975 0000:6975  0801               or      byte ptr [bx + di], al
*            06977 0000:6977  0df302             or      ax, 0x2f3
*            0697A 0000:697A  184cc6             sbb     byte ptr [si - 0x3a], cl
*            0697D 0000:697D  1000               adc     byte ptr [bx + si], al
*            0697F 0000:697F  04c6               add     al, 0xc6
*            06981 0000:6981  1418               adc     al, 0x18
*            06983 0000:6983  0c50               or      al, 0x50
*            06985 0000:6985  130d               adc     cx, word ptr [di]
*            06987 0000:6987  0f0010             lldt    word ptr [bx + si]
*            0698A 0000:698A  c60018             mov     byte ptr [bx + si], 0x18
*            0698D 0000:698D  0c97               or      al, 0x97
*            0698F 0000:698F  57                 push    di
*            06990 0000:6990  7a0f               jp      0x69a1
*            06992 0000:6992  0004               add     byte ptr [si], al
*            06994 0000:6994  9f                 lahf    
*            06995 0000:6995  121e1538           adc     bl, byte ptr [0x3815]   ; MATH UNIT (mul/div/geometry)
*            06999 0000:6999  07                 pop     es
*            0699A 0000:699A  47                 inc     di
*            0699B 0000:699B  fe00               inc     byte ptr [bx + si]
*            0699D 0000:699D  1000               adc     byte ptr [bx + si], al
*            0699F 0000:699F  f00000             lock add byte ptr [bx + si], al
*            069A2 0000:69A2  7f4b               jg      0x69ef
*            069A4 0000:69A4  b4fe               mov     ah, 0xfe
*            069A6 0000:69A6  0004               add     byte ptr [si], al
*            069A8 0000:69A8  d901               fld     dword ptr [bx + di]
*            069AA 0000:69AA  06                 push    es
*            069AB 0000:69AB  0910               or      word ptr [bx + si], dx
*            069AD 0000:69AD  4e                 dec     si
*            069AE 0000:69AE  3d0200             cmp     ax, 2
*            069B1 0000:69B1  08fe               or      dh, bh
*            069B3 0000:69B3  048d               add     al, 0x8d
*            069B5 0000:69B5  06                 push    es
*            069B6 0000:69B6  ce                 into    
*            069B7 0000:69B7  0e                 push    cs
*            069B8 0000:69B8  e002               loopne  0x69bc
*            069BA 0000:69BA  0001               add     byte ptr [bx + di], al
*            069BC 0000:69BC  e501               in      ax, 1
*            069BE 0000:69BE  000f               add     byte ptr [bx], cl
*            069C0 0000:69C0  cc                 int3    
*            069C1 0000:69C1  101d               adc     byte ptr [di], bl
*            069C3 0000:69C3  0200               add     al, byte ptr [bx + si]
*            069C5 0000:69C5  02ea               add     ch, dl
*            069C7 0000:69C7  0032               add     byte ptr [bp + si], dh
*   L_069C9: 069C9 0000:69C9  0f9411             sete    byte ptr [bx + di]
*            069CC 0000:69CC  150000             adc     ax, 0
*            069CF 0000:69CF  04b7               add     al, 0xb7
*            069D1 0000:69D1  ff980d88           lcall   [bx + si - 0x77f3]
*            069D5 0000:69D5  53                 push    bx
*            069D6 0000:69D6  44                 inc     sp
*            069D7 0000:69D7  fe00               inc     byte ptr [bx + si]
*            069D9 0000:69D9  024400             add     al, byte ptr [si]
*            069DC 0000:69DC  92                 xchg    dx, ax
*            069DD 0000:69DD  130c               adc     cx, word ptr [si]
*            069DF 0000:69DF  57                 push    di
*            069E0 0000:69E0  3800               cmp     byte ptr [bx + si], al
*            069E2 0000:69E2  0004               add     byte ptr [si], al
*            069E4 0000:69E4  44                 inc     sp
*            069E5 0000:69E5  029c1358           add     bl, byte ptr [si + 0x5813]
*            069E9 0000:69E9  1bb30300           sbb     si, word ptr [bp + di + 3]
*            069ED 0000:69ED  0820               or      byte ptr [bx + si], ah
*   L_069EF: 069EF 0000:69EF  fc                 cld     
*            069F0 0000:69F0  ec                 in      al, dx
*            069F1 0000:69F1  1d141e             sbb     ax, 0x1e14
*            069F4 0000:69F4  a4                 movsb   byte ptr es:[di], byte ptr [si]
*            069F5 0000:69F5  0300               add     ax, word ptr [bx + si]
*            069F7 0000:69F7  04ea               add     al, 0xea
*            069F9 0000:69F9  ffa21c6c           jmp     word ptr [bp + si + 0x6c1c]
             069FD 0000:69FD  60                 pushaw  
             069FE 0000:69FE  55                 push    bp
             069FF 0000:69FF  0400               add     al, 0
             06A01 0000:6A01  028105cd           add     al, byte ptr [bx + di - 0x32fb]
             06A05 0000:6A05  1e                 push    ds
             06A06 0000:6A06  2823               sub     byte ptr [bp + di], ah
             06A08 0000:6A08  f5                 cmc     
             06A09 0000:6A09  050004             add     ax, 0x400
             06A0C 0000:6A0C  fd                 std     
             06A0D 0000:6A0D  01aa2380           add     word ptr [bp + si - 0x7fdd], bp
             06A11 0000:6A11  258b05             and     ax, 0x58b
             06A14 0000:6A14  0004               add     byte ptr [si], al
             06A16 0000:6A16  fd                 std     
             06A17 0000:6A17  01aa233c           add     word ptr [bp + si + 0x3c23], bp
             06A1B 0000:6A1B  683305             push    0x533
*            06A1E 0000:6A1E  0004               add     byte ptr [si], al
*            06A20 0000:6A20  1909               sbb     word ptr [bx + di], cx
*            06A22 0000:6A22  56                 push    si
*            06A23 0000:6A23  27                 daa     
*            06A24 0000:6A24  94                 xchg    sp, ax
*            06A25 0000:6A25  2ae4               sub     ah, ah
*            06A27 0000:6A27  0300               add     ax, word ptr [bx + si]
*            06A29 0000:6A29  024003             add     al, byte ptr [bx + si + 3]
*            06A2C 0000:6A2C  af                 scasw   ax, word ptr es:[di]
*            06A2D 0000:6A2D  28886c88           sub     byte ptr [bx + si - 0x7794], cl
*            06A31 0000:6A31  0200               add     al, byte ptr [bx + si]
*            06A33 0000:6A33  02880479           add     cl, byte ptr [bx + si + 0x7904]
      06A37 0000:6A37  db   ',8q9'
*            06A3B 0000:6A3B  0400               add     al, 0
*            06A3D 0000:6A3D  08870a4c           or      byte ptr [bx + 0x4c0a], al
*            06A41 0000:6A41  2caa               sub     al, 0xaa
*            06A43 0000:6A43  7284               jb      0x69c9
*            06A45 0000:6A45  06                 push    es
*            06A46 0000:6A46  0004               add     byte ptr [si], al
*            06A48 0000:6A48  60                 pushaw  
*            06A49 0000:6A49  07                 pop     es
*            06A4A 0000:6A4A  c22ef4             ret     0xf42e
             06A4D 0000:6A4D  336d09             xor     bp, word ptr [di + 9]
             06A50 0000:6A50  0008               add     byte ptr [bx + si], cl
             06A52 0000:6A52  cc                 int3    
             06A53 0000:6A53  047a               add     al, 0x7a
             06A55 0000:6A55  3ab03613           cmp     dh, byte ptr [bx + si + 0x1336]
             06A59 0000:6A59  0b00               or      ax, word ptr [bx + si]
             06A5B 0000:6A5B  041c               add     al, 0x1c
             06A5D 0000:6A5D  07                 pop     es
             06A5E 0000:6A5E  37                 aaa     
             06A5F 0000:6A5F  37                 aaa     
             06A60 0000:6A60  6c                 insb    byte ptr es:[di], dx
             06A61 0000:6A61  79b9               jns     0x6a1c
             06A63 0000:6A63  0c00               or      al, 0
             06A65 0000:6A65  040a               add     al, 0xa
             06A67 0000:6A67  0f2936ca7a         movaps  xmmword ptr [0x7aca], xmm6
             06A6C 0000:6A6C  0810               or      byte ptr [bx + si], dl
             06A6E 0000:6A6E  0008               add     byte ptr [bx + si], cl
             06A70 0000:6A70  5b                 pop     bx
             06A71 0000:6A71  11e6               adc     si, sp
             06A73 0000:6A73  32f0               xor     dh, al
             06A75 0000:6A75  3cf1               cmp     al, 0xf1
             06A77 0000:6A77  1200               adc     al, byte ptr [bx + si]
             06A79 0000:6A79  045f               add     al, 0x5f
             06A7B 0000:6A7B  0fbc3ed840         bsf     di, word ptr [0x40d8]
             06A80 0000:6A80  50                 push    ax
             06A81 0000:6A81  17                 pop     ss
             06A82 0000:6A82  0008               add     byte ptr [bx + si], cl
             06A84 0000:6A84  16                 push    ss
             06A85 0000:6A85  1a5739             sbb     dl, byte ptr [bx + 0x39]
             06A88 0000:6A88  cc                 int3    
             06A89 0000:6A89  029e1800           add     bl, byte ptr [bp + 0x18]
             06A8D 0000:6A8D  029f16b8           add     bl, byte ptr [bx - 0x47ea]
             06A91 0000:6A91  02f8               add     bh, al
             06A93 0000:6A93  032e1800           add     bp, word ptr [0x18]   ; math_ram (shared)
             06A97 0000:6A97  029e16b8           add     bl, byte ptr [bp - 0x47ea]
             06A9B 0000:6A9B  027846             add     bh, byte ptr [bx + si + 0x46]
             06A9E 0000:6A9E  4e                 dec     si
             06A9F 0000:6A9F  17                 pop     ss
             06AA0 0000:6AA0  0004               add     byte ptr [si], al
             06AA2 0000:6AA2  4e                 dec     si
             06AA3 0000:6AA3  1b7806             sbb     di, word ptr [bx + si + 6]
             06AA6 0000:6AA6  b04d               mov     al, 0x4d
             06AA8 0000:6AA8  07                 pop     es
             06AA9 0000:6AA9  1900               sbb     word ptr [bx + si], ax
             06AAB 0000:6AAB  104e27             adc     byte ptr [bp + 0x27], cl
             06AAE 0000:6AAE  7806               js      0x6ab6
             06AB0 0000:6AB0  f711               not     word ptr [bx + di]
             06AB2 0000:6AB2  9a18000475         lcall   0x7504, 0x18
             06AB7 0000:6AB7  157e0f             adc     ax, 0xf7e
*            06ABA 0000:6ABA  3847b9             cmp     byte ptr [bx - 0x47], al
*            06ABD 0000:6ABD  0100               add     word ptr [bx + si], ax
*            06ABF 0000:6ABF  1000               adc     byte ptr [bx + si], al
*            06AC1 0000:6AC1  1000               adc     byte ptr [bx + si], al
*            06AC3 0000:6AC3  007f0b             add     byte ptr [bx + 0xb], bh
*            06AC6 0000:6AC6  4c                 dec     sp
*            06AC7 0000:6AC7  0100               add     word ptr [bx + si], ax
*   L_06AC9: 06AC9 0000:6AC9  0427               add     al, 0x27
*            06ACB 0000:6ACB  fe0609d1           inc     byte ptr [0xd109]
*            06ACF 0000:6ACF  4c                 dec     sp
*            06AD0 0000:6AD0  7400               je      0x6ad2
*   L_06AD2: 06AD2 0000:6AD2  0008               add     byte ptr [bx + si], cl
*            06AD4 0000:6AD4  96                 xchg    si, ax
*            06AD5 0000:6AD5  07                 pop     es
*            06AD6 0000:6AD6  7110               jno     0x6ae8
*            06AD8 0000:6AD8  2652               push    dx
*            06ADA 0000:6ADA  1e                 push    ds
*            06ADB 0000:6ADB  0200               add     al, byte ptr [bx + si]
*            06ADD 0000:6ADD  0405               add     al, 5
*            06ADF 0000:6ADF  04a1               add     al, 0xa1
*            06AE1 0000:6AE1  0e                 push    cs
*            06AE2 0000:6AE2  7c15               jl      0x6af9
*            06AE4 0000:6AE4  350400             xor     ax, 4
*            06AE7 0000:6AE7  0436               add     al, 0x36
*            06AE9 0000:6AE9  00aa1564           add     byte ptr [bp + si + 0x6415], ch
*            06AED 0000:6AED  196303             sbb     word ptr [bp + di + 3], sp
*            06AF0 0000:6AF0  0008               add     byte ptr [bx + si], cl
*            06AF2 0000:6AF2  37                 aaa     
*            06AF3 0000:6AF3  fc                 cld     
*            06AF4 0000:6AF4  d815               fcom    dword ptr [di]
*            06AF6 0000:6AF6  bc5bcf             mov     sp, 0xcf5b
*   L_06AF9: 06AF9 0000:6AF9  0300               add     ax, word ptr [bx + si]
*            06AFB 0000:6AFB  022e0547           add     ch, byte ptr [0x4705]
*            06AFF 0000:6AFF  1a34               sbb     dh, byte ptr [si]
*            06B01 0000:6B01  2125               and     word ptr [di], sp
*            06B03 0000:6B03  0400               add     al, 0
*            06B05 0000:6B05  0411               add     al, 0x11
*            06B07 0000:6B07  01a61e8c           add     word ptr [bp - 0x73e2], sp
*            06B0B 0000:6B0B  63fe               arpl    si, di
*            06B0D 0000:6B0D  0300               add     ax, word ptr [bx + si]
*            06B0F 0000:6B0F  02af057b           add     ch, byte ptr [bx + 0x7b05]
*            06B13 0000:6B13  22802518           and     al, byte ptr [bx + si + 0x1825]
*            06B17 0000:6B17  0400               add     al, 0
*            06B19 0000:6B19  024d02             add     cl, byte ptr [di + 2]
*            06B1C 0000:6B1C  9d                 popf    
*            06B1D 0000:6B1D  2410               and     al, 0x10
*            06B1F 0000:6B1F  27                 daa     
*            06B20 0000:6B20  b702               mov     bh, 2
*            06B22 0000:6B22  0004               add     byte ptr [si], al
*            06B24 0000:6B24  8200ba             add     byte ptr [bx + si], 0xba
*            06B27 0000:6B27  235028             and     dx, word ptr [bx + si + 0x28]
*            06B2A 0000:6B2A  6aff               push    -1
*            06B2C 0000:6B2C  0008               add     byte ptr [bx + si], cl
*            06B2E 0000:6B2E  4d                 dec     bp
      06B2F 0000:6B2F  db   fe
             06B30 0000:6B30  6420f8             and     al, bh
             06B33 0000:6B33  6a31               push    0x31
             06B35 0000:6B35  fc                 cld     
             06B36 0000:6B36  0004               add     byte ptr [si], al
             06B38 0000:6B38  f9                 stc     
             06B39 0000:6B39  ff462c             inc     word ptr [bp + 0x2c]
             06B3C 0000:6B3C  2e6c               insb    byte ptr es:[di], dx
             06B3E 0000:6B3E  d4fb               aam     0xfb
             06B40 0000:6B40  0010               add     byte ptr [bx + si], dl
             06B42 0000:6B42  51                 push    cx
             06B43 0000:6B43  0b30               or      si, word ptr [bx + si]
             06B45 0000:6B45  301e71fc           xor     byte ptr [0xfc71], bl
             06B49 0000:6B49  fe00               inc     byte ptr [bx + si]
             06B4B 0000:6B4B  04b3               add     al, 0xb3
             06B4D 0000:6B4D  ff2f               ljmp    [bx]
             06B4F 0000:6B4F  2d3871             sub     ax, 0x7138
      06B52 0000:6B52  db   c5
             06B53 0000:6B53  ff00               inc     word ptr [bx + si]
             06B55 0000:6B55  086a00             or      byte ptr [bp + si], ch
             06B58 0000:6B58  3f                 aas     
             06B59 0000:6B59  2900               sub     word ptr [bx + si], ax
             06B5B 0000:6B5B  32a10200           xor     ah, byte ptr [bx + di + 2]
             06B5F 0000:6B5F  0820               or      byte ptr [bx + si], ah
             06B61 0000:6B61  ff31               push    word ptr [bx + di]
             06B63 0000:6B63  39bc34c8           cmp     word ptr [si - 0x37cc], di
             06B67 0000:6B67  0400               add     al, 0
             06B69 0000:6B69  04e0               add     al, 0xe0
             06B6B 0000:6B6B  00993576           add     byte ptr [bx + di + 0x7635], bl
             06B6F 0000:6B6F  36f8               clc     
             06B71 0000:6B71  0400               add     al, 0
             06B73 0000:6B73  08f8               or      al, bh
             06B75 0000:6B75  fc                 cld     
             06B76 0000:6B76  7636               jbe     0x6bae
             06B78 0000:6B78  d079b4             sar     byte ptr [bx + di - 0x4c], 1
             06B7B 0000:6B7B  050008             add     ax, 0x800
             06B7E 0000:6B7E  f8                 clc     
             06B7F 0000:6B7F  0c76               or      al, 0x76
             06B81 0000:6B81  3698               cwde    
             06B83 0000:6B83  7a58               jp      0x6bdd
             06B85 0000:6B85  06                 push    es
             06B86 0000:6B86  0002               add     byte ptr [bp + si], al
             06B88 0000:6B88  8507               test    word ptr [bx], ax
             06B8A 0000:6B8A  fa                 cli     
             06B8B 0000:6B8B  38f6               cmp     dh, dh
             06B8D 0000:6B8D  7b72               jnp     0x6c01
             06B8F 0000:6B8F  0900               or      word ptr [bx + si], ax
             06B91 0000:6B91  080c               or      byte ptr [si], cl
             06B93 0000:6B93  0b20               or      sp, word ptr [bx + si]
             06B95 0000:6B95  3454               xor     al, 0x54
             06B97 0000:6B97  3df50a             cmp     ax, 0xaf5
             06B9A 0000:6B9A  0002               add     byte ptr [bp + si], al
             06B9C 0000:6B9C  0b09               or      cx, word ptr [bx + di]
             06B9E 0000:6B9E  ec                 in      al, dx
             06B9F 0000:6B9F  3d7440             cmp     ax, 0x4074
             06BA2 0000:6BA2  c9                 leave   
             06BA3 0000:6BA3  0c00               or      al, 0
             06BA5 0000:6BA5  089912f5           or      byte ptr [bx + di - 0xaee], bl
             06BA9 0000:6BA9  3aa041e5           cmp     ah, byte ptr [bx + si - 0x1abf]
             06BAD 0000:6BAD  0e                 push    cs
*            06BAE 0000:6BAE  0004               add     byte ptr [si], al
*            06BB0 0000:6BB0  b10f               mov     cl, 0xf
*            06BB2 0000:6BB2  b43d               mov     ah, 0x3d
*            06BB4 0000:6BB4  94                 xchg    sp, ax
*            06BB5 0000:6BB5  037f10             add     di, word ptr [bx + 0x10]
*            06BB8 0000:6BB8  0002               add     byte ptr [bp + si], al
*            06BBA 0000:6BBA  7f0e               jg      0x6bca
*            06BBC 0000:6BBC  96                 xchg    si, ax
*            06BBD 0000:6BBD  03b44605           add     si, word ptr [si + 0x546]
*            06BC1 0000:6BC1  1200               adc     al, byte ptr [bx + si]
*            06BC3 0000:6BC3  047f               add     al, 0x7f
*            06BC5 0000:6BC5  1490               adc     al, 0x90
*            06BC7 0000:6BC7  034448             add     ax, word ptr [si + 0x48]
*   L_06BCA: 06BCA 0000:6BCA  67150008           adc     ax, 0x800
*            06BCE 0000:6BCE  f9                 stc     
*            06BCF 0000:6BCF  16                 push    ss
*            06BD0 0000:6BD0  6c                 insb    byte ptr es:[di], dx
*            06BD1 0000:6BD1  00e4               add     ah, ah
*            06BD3 0000:6BD3  0824               or      byte ptr [si], ah
*            06BD5 0000:6BD5  16                 push    ss
*            06BD6 0000:6BD6  0001               add     byte ptr [bx + di], al
*            06BD8 0000:6BD8  35153f             xor     ax, 0x3f15
*            06BDB 0000:6BDB  099a0946           or      word ptr [bp + si + 0x4609], bx
*            06BDF 0000:6BDF  16                 push    ss
*            06BE0 0000:6BE0  0002               add     byte ptr [bp + si], al
*            06BE2 0000:6BE2  46                 inc     si
*            06BE3 0000:6BE3  149a               adc     al, 0x9a
*            06BE5 0000:6BE5  09d2               or      dx, dx
*            06BE7 0000:6BE7  108d1400           adc     byte ptr [di + 0x14], cl
*            06BEB 0000:6BEB  104606             adc     byte ptr [bp + 6], al
*            06BEE 0000:6BEE  9a091955fa         lcall   0xfa55, 0x1909
*            06BF3 0000:6BF3  1400               adc     al, 0
*            06BF5 0000:6BF5  041f               add     al, 0x1f
*            06BF7 0000:6BF7  18a01238           sbb     byte ptr [bx + si + 0x3812], ah
*            06BFB 0000:6BFB  07                 pop     es
*            06BFC 0000:6BFC  47                 inc     di
*            06BFD 0000:6BFD  fe00               inc     byte ptr [bx + si]
*            06BFF 0000:6BFF  1000               adc     byte ptr [bx + si], al
*            06C01 0000:6C01  f00000             lock add byte ptr [bx + si], al
*            06C04 0000:6C04  7f4b               jg      0x6c51
*            06C06 0000:6C06  b4fe               mov     ah, 0xfe
*            06C08 0000:6C08  0004               add     byte ptr [si], al
*            06C0A 0000:6C0A  d901               fld     dword ptr [bx + di]
*            06C0C 0000:6C0C  06                 push    es
*            06C0D 0000:6C0D  0910               or      word ptr [bx + si], dx
*            06C0F 0000:6C0F  0e                 push    cs
*            06C10 0000:6C10  a0fe00             mov     al, byte ptr [0xfe]   ; math_ram (shared)
*            06C13 0000:6C13  0222               add     ah, byte ptr [bp + si]
*            06C15 0000:6C15  fd                 std     
*            06C16 0000:6C16  bb0c5e             mov     bx, 0x5e0c
*            06C19 0000:6C19  0f21fd             mov     ebp, dr7
*            06C1C 0000:6C1C  0008               add     byte ptr [bx + si], cl
*            06C1E 0000:6C1E  a8f8               test    al, 0xf8
*            06C20 0000:6C20  bc08af             mov     sp, 0xaf08
*            06C23 0000:6C23  52                 push    dx
*            06C24 0000:6C24  5d                 pop     bp
*            06C25 0000:6C25  fb                 sti     
*            06C26 0000:6C26  0004               add     byte ptr [si], al
*            06C28 0000:6C28  5d                 pop     bp
*            06C29 0000:6C29  ffaf124a           ljmp    [bx + 0x4a12]
             06C2D 0000:6C2D  55                 push    bp
             06C2E 0000:6C2E  55                 push    bp
             06C2F 0000:6C2F  fc                 cld     
             06C30 0000:6C30  0004               add     byte ptr [si], al
             06C32 0000:6C32  5d                 pop     bp
             06C33 0000:6C33  ffaf1270           ljmp    [bx + 0x7012]
             06C37 0000:6C37  17                 pop     ss
             06C38 0000:6C38  a1fc00             mov     ax, word ptr [0xfc]   ; math_ram (shared)
             06C3B 0000:6C3B  02d0               add     dl, al
             06C3D 0000:6C3D  fa                 cli     
             06C3E 0000:6C3E  98                 cwde    
             06C3F 0000:6C3F  16                 push    ss
             06C40 0000:6C40  4a                 dec     dx
             06C41 0000:6C41  1a7afa             sbb     bh, byte ptr [bp + si - 6]
             06C44 0000:6C44  0008               add     byte ptr [bx + si], cl
             06C46 0000:6C46  60                 pushaw  
             06C47 0000:6C47  f5                 cmc     
             06C48 0000:6C48  1114               adc     word ptr [si], dx
             06C4A 0000:6C4A  385cb2             cmp     byte ptr [si - 0x4e], bl
             06C4D 0000:6C4D  f9                 stc     
             06C4E 0000:6C4E  0002               add     byte ptr [bp + si], al
             06C50 0000:6C50  a9fbd8             test    ax, 0xd8fb
             06C53 0000:6C53  1b405f             sbb     ax, word ptr [bx + si + 0x5f]
*            06C56 0000:6C56  52                 push    dx
*            06C57 0000:6C57  fc                 cld     
*            06C58 0000:6C58  0004               add     byte ptr [si], al
*            06C5A 0000:6C5A  a0fd78             mov     al, byte ptr [0x78fd]
*            06C5D 0000:6C5D  1b24               sbb     sp, word ptr [si]
*            06C5F 0000:6C5F  21abfd00           and     word ptr [bp + di + 0xfd], bp
*            06C63 0000:6C63  02abfb24           add     ch, byte ptr [bp + di + 0x24fb]
*            06C67 0000:6C67  21f0               and     ax, si
*            06C69 0000:6C69  632c               arpl    word ptr [si], bp
*            06C6B 0000:6C6B  fe00               inc     byte ptr [bx + si]
*            06C6D 0000:6C6D  08ab0524           or      byte ptr [bp + di + 0x2405], ch
*            06C71 0000:6C71  21e4               and     sp, sp
*            06C73 0000:6C73  65bcff00           mov     sp, 0xff
*            06C77 0000:6C77  04eb               add     al, 0xeb
*            06C79 0000:6C79  018a2210           add     word ptr [bp + si + 0x1022], cx
*            06C7D 0000:6C7D  67b102             mov     cl, 2
*            06C80 0000:6C80  0008               add     byte ptr [bx + si], cl
*            06C82 0000:6C82  1a04               sbb     al, byte ptr [si]
*            06C84 0000:6C84  301f               xor     byte ptr [bx], bl
*            06C86 0000:6C86  a0284c             mov     al, byte ptr [0x4c28]
*            06C89 0000:6C89  0400               add     al, 0
*            06C8B 0000:6C8B  025702             add     dl, byte ptr [bx + 2]
*            06C8E 0000:6C8E  0829               or      byte ptr [bx + di], ch
*            06C90 0000:6C90  f8                 clc     
*            06C91 0000:6C91  2a6e04             sub     ch, byte ptr [bp + 4]
*   L_06C94: 06C94 0000:6C94  0008               add     byte ptr [bx + si], cl
*            06C96 0000:6C96  77fc               ja      0x6c94
*            06C98 0000:6C98  40                 inc     ax
*            06C99 0000:6C99  2a1e6d12           sub     bl, byte ptr [0x126d]   ; RCRAM (road, shared)
*            06C9D 0000:6C9D  06                 push    es
*            06C9E 0000:6C9E  0002               add     byte ptr [bp + si], al
*            06CA0 0000:6CA0  6c                 insb    byte ptr es:[di], dx
*            06CA1 0000:6CA1  06                 push    es
*            06CA2 0000:6CA2  262bb42dd0         sub     si, word ptr es:[si - 0x2fd3]
*            06CA7 0000:6CA7  06                 push    es
*            06CA8 0000:6CA8  0001               add     byte ptr [bx + di], al
*            06CAA 0000:6CAA  e505               in      ax, 5
*            06CAC 0000:6CAC  1a2ed430           sbb     ch, byte ptr [0x30d4]   ; MATH UNIT (mul/div/geometry)
*            06CB0 0000:6CB0  d7                 xlatb   
*            06CB1 0000:6CB1  06                 push    es
*            06CB2 0000:6CB2  0004               add     byte ptr [si], al
*            06CB4 0000:6CB4  25034c             and     ax, 0x4c03
*            06CB7 0000:6CB7  2f                 das     
*            06CB8 0000:6CB8  9c                 pushf   
*            06CB9 0000:6CB9  314306             xor     word ptr [bp + di + 6], ax
*            06CBC 0000:6CBC  0002               add     byte ptr [bp + si], al
*            06CBE 0000:6CBE  fe04               inc     byte ptr [si]
*            06CC0 0000:6CC0  1030               adc     byte ptr [bx + si], dh
*            06CC2 0000:6CC2  bc74cd             mov     sp, 0xcd74
*            06CC5 0000:6CC5  0400               add     al, 0
*            06CC7 0000:6CC7  04cd               add     al, 0xcd
*            06CC9 0000:6CC9  08b434b0           or      byte ptr [si - 0x4fcc], dh
*            06CCD 0000:6CCD  7654               jbe     0x6d23
*            06CCF 0000:6CCF  050004             add     ax, 0x400
*            06CD2 0000:6CD2  cd08               int     8
*            06CD4 0000:6CD4  b434               mov     ah, 0x34
*            06CD6 0000:6CD6  a4                 movsb   byte ptr es:[di], byte ptr [si]
*            06CD7 0000:6CD7  385905             cmp     byte ptr [bx + di + 5], bl
*            06CDA 0000:6CDA  0002               add     byte ptr [bp + si], al
*            06CDC 0000:6CDC  97                 xchg    di, ax
*            06CDD 0000:6CDD  03ae376c           add     bp, word ptr [bp + 0x6c37]
*            06CE1 0000:6CE1  39940400           cmp     word ptr [si + 4], dx
*            06CE5 0000:6CE5  029803ae           add     bl, byte ptr [bx + si - 0x51fd]
*            06CE9 0000:6CE9  37                 aaa     
*            06CEA 0000:6CEA  fc                 cld     
*            06CEB 0000:6CEB  3ab40000           cmp     dh, byte ptr [si]
*            06CEF 0000:6CEF  10b5fc7e           adc     byte ptr [di + 0x7efc], dh
*            06CF3 0000:6CF3  2b8c7c3d           sub     cx, word ptr [si + 0x3d7c]
*            06CF7 0000:6CF7  ff00               inc     word ptr [bx + si]
*            06CF9 0000:6CF9  0234               add     dh, byte ptr [si]
*            06CFB 0000:6CFB  01ec               add     sp, bp
*            06CFD 0000:6CFD  3c74               cmp     al, 0x74
*            06CFF 0000:6CFF  40                 inc     ax
*            06D00 0000:6D00  78ff               js      0x6d01
*            06D02 0000:6D02  0008               add     byte ptr [bx + si], cl
*            06D04 0000:6D04  1907               sbb     word ptr [bx], ax
*            06D06 0000:6D06  0c3e               or      al, 0x3e
*            06D08 0000:6D08  cc                 int3    
*            06D09 0000:6D09  028bfe00           add     cl, byte ptr [bp + di + 0xfe]
*            06D0D 0000:6D0D  0290fd0e           add     dl, byte ptr [bx + si + 0xefd]
*            06D11 0000:6D11  015046             add     word ptr [bx + si + 0x46], dx
*            06D14 0000:6D14  81fc0004           cmp     sp, 0x400
*            06D18 0000:6D18  81004806           add     word ptr [bx + si], 0x648
*            06D1C 0000:6D1C  44                 inc     sp
*            06D1D 0000:6D1D  48                 dec     ax
*            06D1E 0000:6D1E  08fd               or      ch, bh
*            06D20 0000:6D20  0004               add     byte ptr [si], al
*            06D22 0000:6D22  81004806           add     word ptr [bx + si], 0x648
*            06D26 0000:6D26  380a               cmp     byte ptr [bp + si], cl
*            06D28 0000:6D28  0dfd00             or      ax, 0xfd
*            06D2B 0000:6D2B  024bfb             add     cl, byte ptr [bp + di - 5]
*            06D2E 0000:6D2E  42                 inc     dx
*            06D2F 0000:6D2F  09c8               or      ax, cx
*            06D31 0000:6D31  0b83fb00           or      ax, word ptr [bp + di + 0xfb]
*            06D35 0000:6D35  048a               add     al, 0x8a
*            06D37 0000:6D37  f9                 stc     
*            06D38 0000:6D38  4d                 dec     bp
*            06D39 0000:6D39  0820               or      byte ptr [bx + si], ah
*            06D3B 0000:6D3B  4e                 dec     si
*            06D3C 0000:6D3C  97                 xchg    di, ax
*            06D3D 0000:6D3D  fa                 cli     
*   L_06D3E: 06D3E 0000:6D3E  0002               add     byte ptr [bp + si], al
*            06D40 0000:6D40  7ffc               jg      0x6d3e
*            06D42 0000:6D42  850d               test    word ptr [di], cx
*            06D44 0000:6D44  0812               or      byte ptr [bp + si], dl
*            06D46 0000:6D46  d4fa               aam     0xfa
*            06D48 0000:6D48  0008               add     byte ptr [bx + si], cl
*            06D4A 0000:6D4A  f7f2               div     dx
*            06D4C 0000:6D4C  8c10               mov     word ptr [bx + si], ss
*            06D4E 0000:6D4E  54                 push    sp
*            06D4F 0000:6D4F  56                 push    si
*            06D50 0000:6D50  ed                 in      ax, dx
*            06D51 0000:6D51  fc                 cld     
*            06D52 0000:6D52  0004               add     byte ptr [si], al
*            06D54 0000:6D54  c2fec6             ret     0xc6fe
             06D57 0000:6D57  121b               adc     bl, byte ptr [bp + di]
             06D59 0000:6D59  1802               sbb     byte ptr [bp + si], al
             06D5B 0000:6D5B  fe00               inc     byte ptr [bx + si]
             06D5D 0000:6D5D  0202               add     al, byte ptr [bp + si]
             06D5F 0000:6D5F  fc                 cld     
             06D60 0000:6D60  1b18               sbb     bx, word ptr [bx + si]
             06D62 0000:6D62  3b5b51             cmp     bx, word ptr [bp + di + 0x51]
             06D65 0000:6D65  fe00               inc     byte ptr [bx + si]
             06D67 0000:6D67  1002               adc     byte ptr [bp + si], al
             06D69 0000:6D69  0e                 push    cs
             06D6A 0000:6D6A  1b18               sbb     bx, word ptr [bx + si]
             06D6C 0000:6D6C  5b                 pop     bx
             06D6D 0000:6D6D  1e                 push    ds
             06D6E 0000:6D6E  a0fe00             mov     al, byte ptr [0xfe]   ; math_ram (shared)
             06D71 0000:6D71  10a0ee5b           adc     byte ptr [bx + si + 0x5bee], ah
             06D75 0000:6D75  1e                 push    ds
             06D76 0000:6D76  7b61               jnp     0x6dd9
             06D78 0000:6D78  ef                 out     dx, ax
             06D79 0000:6D79  fe00               inc     byte ptr [bx + si]
             06D7B 0000:6D7B  10a00e5b           adc     byte ptr [bx + si + 0x5b0e], ah
             06D7F 0000:6D7F  1e                 push    ds
             06D80 0000:6D80  9b                 wait    
             06D81 0000:6D81  243e               and     al, 0x3e
             06D83 0000:6D83  ff00               inc     word ptr [bx + si]
             06D85 0000:6D85  103eef9b           adc     byte ptr [0x9bef], bh
             06D89 0000:6D89  24e1               and     al, 0xe1
             06D8B 0000:6D8B  0277ff             add     dh, byte ptr [bx - 1]
             06D8E 0000:6D8E  0008               add     byte ptr [bx + si], cl
             06D90 0000:6D90  00f8               add     al, bh
             06D92 0000:6D92  0000               add     byte ptr [bx + si], al
             06D94 0000:6D94  c245ee             ret     0xee45
             06D97 0000:6D97  fe00               inc     byte ptr [bx + si]
             06D99 0000:6D99  08ee               or      dh, ch
             06D9B 0000:6D9B  06                 push    es
             06D9C 0000:6D9C  c205bf             ret     0xbf05
             06D9F 0000:6D9F  07                 pop     es
             06DA0 0000:6DA0  26fd               std     
             06DA2 0000:6DA2  0002               add     byte ptr [bp + si], al
             06DA4 0000:6DA4  ee                 out     dx, al
             06DA5 0000:6DA5  fc                 cld     
             06DA6 0000:6DA6  c2055b             ret     0x5b05
             06DA9 0000:6DA9  4a                 dec     dx
             06DAA 0000:6DAA  fb                 sti     
             06DAB 0000:6DAB  f5                 cmc     
             06DAC 0000:6DAC  0010               add     byte ptr [bx + si], dl
             06DAE 0000:6DAE  e2fe               loop    0x6dae
             06DB0 0000:6DB0  a7                 cmpsw   word ptr [si], word ptr es:[di]
             06DB1 0000:6DB1  17                 pop     ss
             06DB2 0000:6DB2  ac                 lodsb   al, byte ptr [si]
             06DB3 0000:6DB3  4d                 dec     bp
             06DB4 0000:6DB4  35f400             xor     ax, 0xf4
             06DB7 0000:6DB7  0435               add     al, 0x35
             06DB9 0000:6DB9  f8                 clc     
             06DBA 0000:6DBA  ae                 scasb   al, byte ptr es:[di]
             06DBB 0000:6DBB  0d3051             or      ax, 0x5130
             06DBE 0000:6DBE  49                 dec     cx
             06DBF 0000:6DBF  f60004             test    byte ptr [bx + si], 4
             06DC2 0000:6DC2  35f8ae             xor     ax, 0xaef8
             06DC5 0000:6DC5  0df851             or      ax, 0x51f8
             06DC8 0000:6DC8  57                 push    di
             06DC9 0000:6DC9  f8                 clc     
             06DCA 0000:6DCA  0008               add     byte ptr [bx + si], cl
             06DCC 0000:6DCC  21fa               and     dx, di
             06DCE 0000:6DCE  2c0a               sub     al, 0xa
             06DD0 0000:6DD0  8813               mov     byte ptr [bp + di], dl
      06DD2 0000:6DD2  db   db
             06DD3 0000:6DD3  f9                 stc     
             06DD4 0000:6DD4  0002               add     byte ptr [bp + si], al
             06DD6 0000:6DD6  e4f7               in      al, 0xf7
             06DD8 0000:6DD8  eb13               jmp     0x6ded
             06DDA 0000:6DDA  a856               test    al, 0x56
             06DDC 0000:6DDC  e1fc               loope   0x6dda
*            06DDE 0000:6DDE  0004               add     byte ptr [si], al
*            06DE0 0000:6DE0  c8fdc212           enter   -0x3d03, 0x12
*            06DE4 0000:6DE4  6419ce             sbb     si, cx
*            06DE7 0000:6DE7  ff00               inc     word ptr [bx + si]
*            06DE9 0000:6DE9  04fa               add     al, 0xfa
*            06DEB 0000:6DEB  fb                 sti     
*            06DEC 0000:6DEC  8e1a               mov     ds, word ptr [bp + si]
*            06DEE 0000:6DEE  58                 pop     ax
*            06DEF 0000:6DEF  1b59ff             sbb     bx, word ptr [bx + di - 1]
*            06DF2 0000:6DF2  0002               add     byte ptr [bp + si], al
*            06DF4 0000:6DF4  e4fd               in      al, 0xfd
*            06DF6 0000:6DF6  f9                 stc     
*            06DF7 0000:6DF7  194c5d             sbb     word ptr [si + 0x5d], cx
*            06DFA 0000:6DFA  e4fe               in      al, 0xfe
*            06DFC 0000:6DFC  0002               add     byte ptr [bp + si], al
*            06DFE 0000:6DFE  ce                 into    
*            06DFF 0000:6DFF  00b71c08           add     byte ptr [bx + 0x81c], dh
*            06E03 0000:6E03  60                 pushaw  
*            06E04 0000:6E04  d201               rol     byte ptr [bx + di], cl
*            06E06 0000:6E06  0004               add     byte ptr [si], al
*            06E08 0000:6E08  b80222             mov     ax, 0x2202
*            06E0B 0000:6E0B  1c9e               sbb     al, 0x9e
*            06E0D 0000:6E0D  20840200           and     byte ptr [si + 2], al
*            06E11 0000:6E11  01990101           add     word ptr [bx + di + 0x101], bx
*            06E15 0000:6E15  21f0               and     ax, si
*            06E17 0000:6E17  236b02             and     bp, word ptr [bp + di + 2]
*            06E1A 0000:6E1A  0004               add     byte ptr [si], al
*            06E1C 0000:6E1C  d4fe               aam     0xfe
*            06E1E 0000:6E1E  2c22               sub     al, 0x22
*            06E20 0000:6E20  ea245c0100         ljmp    1:0x5c24
             06E25 0000:6E25  02a0000e           add     ah, byte ptr [bx + si + 0xe00]
             06E29 0000:6E29  2310               and     dx, word ptr [bx + si]
             06E2B 0000:6E2B  6727               daa     
             06E2D 0000:6E2D  ff00               inc     word ptr [bx + si]
             06E2F 0000:6E2F  04d4               add     al, 0xd4
             06E31 0000:6E31  02a22868           add     ah, byte ptr [bp + si + 0x6828]
             06E35 0000:6E35  69bdff0002fe       imul    di, word ptr [di + 0xff], 0xfe02
             06E3B 0000:6E3B  00d9               add     cl, bl
             06E3D 0000:6E3D  27                 daa     
             06E3E 0000:6E3E  306a59             xor     byte ptr [bp + si + 0x59], ch
             06E41 0000:6E41  0100               add     word ptr [bx + si], ax
             06E43 0000:6E43  043f               add     al, 0x3f
             06E45 0000:6E45  024a26             add     cl, byte ptr [bp + si + 0x26]
             06E48 0000:6E48  c02bdc             shr     byte ptr [bp + di], 0xdc
             06E4B 0000:6E4B  0200               add     al, byte ptr [bx + si]
             06E4D 0000:6E4D  02e6               add     ah, dh
             06E4F 0000:6E4F  0023               add     byte ptr [bp + di], ah
             06E51 0000:6E51  2ce0               sub     al, 0xe0
             06E53 0000:6E53  2edb02             fild    dword ptr cs:[bp + si]
             06E56 0000:6E56  0008               add     byte ptr [bx + si], cl
             06E58 0000:6E58  03fb               add     di, bx
             06E5A 0000:6E5A  4c                 dec     sp
             06E5B 0000:6E5B  2dc872             sub     ax, 0x72c8
             06E5E 0000:6E5E  0b03               or      ax, word ptr [bp + di]
             06E60 0000:6E60  0008               add     byte ptr [bx + si], cl
             06E62 0000:6E62  b30a               mov     bl, 0xa
             06E64 0000:6E64  7430               je      0x6e96
             06E66 0000:6E66  267482             je      0x6deb
             06E69 0000:6E69  0400               add     al, 0
             06E6B 0000:6E6B  02f5               add     dh, ch
             06E6D 0000:6E6D  0433               add     al, 0x33
             06E6F 0000:6E6F  328435f9           xor     al, byte ptr [si - 0x6cb]
             06E73 0000:6E73  050002             add     ax, 0x200
      06E76 0000:6E76  db   0f
             06E77 0000:6E77  0419               add     al, 0x19
             06E79 0000:6E79  36a4               movsb   byte ptr es:[di], byte ptr ss:[si]
             06E7B 0000:6E7B  38a20500           cmp     byte ptr [bp + si + 5], ah
*            06E7F 0000:6E7F  0425               add     al, 0x25
*            06E81 0000:6E81  02ae36fc           add     ch, byte ptr [bp - 0x3ca]
*            06E85 0000:6E85  3aa30300           cmp     ah, byte ptr [bp + di + 3]
*            06E89 0000:6E89  08a9feb8           or      byte ptr [bx + di - 0x4702], ch
*            06E8D 0000:6E8D  34f0               xor     al, 0xf0
*            06E8F 0000:6E8F  7ceb               jl      0x6e7c
*            06E91 0000:6E91  0200               add     al, byte ptr [bx + si]
*            06E93 0000:6E93  02e1               add     ah, cl
*            06E95 0000:6E95  048d               add     al, 0x8d
*            06E97 0000:6E97  3c68               cmp     al, 0x68
*            06E99 0000:6E99  020b               add     cl, byte ptr [bp + di]
*            06E9B 0000:6E9B  0200               add     al, byte ptr [bx + si]
*            06E9D 0000:6E9D  0812               or      byte ptr [bp + si], dl
*            06E9F 0000:6E9F  fb                 sti     
*            06EA0 0000:6EA0  7c3e               jl      0x6ee0
*            06EA2 0000:6EA2  6343c9             arpl    word ptr [bp + di - 0x37], ax
*            06EA5 0000:6EA5  0100               add     word ptr [bx + si], ax
*            06EA7 0000:6EA7  02c9               add     cl, cl
*            06EA9 0000:6EA9  036303             add     sp, word ptr [bp + di + 3]
*            06EAC 0000:6EAC  9b                 wait    
*            06EAD 0000:6EAD  0a10               or      dl, byte ptr [bx + si]
*            06EAF 0000:6EAF  0000               add     byte ptr [bx + si], al
*            06EB1 0000:6EB1  10c9               adc     cl, cl
*            06EB3 0000:6EB3  f1                 int1    
*            06EB4 0000:6EB4  6303               arpl    word ptr [bp + di], ax
*            06EB6 0000:6EB6  e24e               loop    0x6f06
*            06EB8 0000:6EB8  7d00               jge     0x6eba
*   L_06EBA: 06EBA 0000:6EBA  0004               add     byte ptr [si], al
*            06EBC 0000:6EBC  a20369             mov     byte ptr [0x6903], al
*            06EBF 0000:6EBF  0c38               or      al, 0x38
*            06EC1 0000:6EC1  07                 pop     es
*            06EC2 0000:6EC2  47                 inc     di
*            06EC3 0000:6EC3  fe00               inc     byte ptr [bx + si]
*            06EC5 0000:6EC5  1000               adc     byte ptr [bx + si], al
*            06EC7 0000:6EC7  f00000             lock add byte ptr [bx + si], al
*            06ECA 0000:6ECA  7f4b               jg      0x6f17
*            06ECC 0000:6ECC  b4fe               mov     ah, 0xfe
*            06ECE 0000:6ECE  0004               add     byte ptr [si], al
*            06ED0 0000:6ED0  d901               fld     dword ptr [bx + di]
*            06ED2 0000:6ED2  06                 push    es
*            06ED3 0000:6ED3  09ac4d58           or      word ptr [si + 0x584d], bp
*            06ED7 0000:6ED7  0100               add     word ptr [bx + si], ax
*            06ED9 0000:6ED9  08fe               or      dh, bh
*            06EDB 0000:6EDB  048d               add     al, 0x8d
*            06EDD 0000:6EDD  06                 push    es
*            06EDE 0000:6EDE  0410               add     al, 0x10
*   L_06EE0: 06EE0 0000:6EE0  5a                 pop     dx
*            06EE1 0000:6EE1  0200               add     al, byte ptr [bx + si]
*            06EE3 0000:6EE3  026f00             add     ch, byte ptr [bx]
*            06EE6 0000:6EE6  740f               je      0x6ef7
*            06EE8 0000:6EE8  f8                 clc     
*            06EE9 0000:6EE9  51                 push    cx
*            06EEA 0000:6EEA  d502               aad     2
*            06EEC 0000:6EEC  0002               add     byte ptr [bp + si], al
*            06EEE 0000:6EEE  45                 inc     bp
*            06EEF 0000:6EEF  0494               add     al, 0x94
*            06EF1 0000:6EF1  10e0               adc     al, ah
*            06EF3 0000:6EF3  15cc03             adc     ax, 0x3cc
*            06EF6 0000:6EF6  0004               add     byte ptr [si], al
*            06EF8 0000:6EF8  f5                 cmc     
*            06EF9 0000:6EF9  ffc0               inc     ax
*            06EFB 0000:6EFB  1400               adc     al, 0
*            06EFD 0000:6EFD  190c               sbb     word ptr [si], cx
*            06EFF 0000:6EFF  0200               add     al, byte ptr [bx + si]
*            06F01 0000:6F01  081f               or      byte ptr [bx], bl
*            06F03 0000:6F03  fc                 cld     
*            06F04 0000:6F04  a0134c             mov     al, byte ptr [0x4c13]
*            06F07 0000:6F07  5d                 pop     bp
*            06F08 0000:6F08  59                 pop     cx
*            06F09 0000:6F09  0100               add     word ptr [bx + si], ax
*            06F0B 0000:6F0B  0402               add     al, 2
*            06F0D 0000:6F0D  05b01b             add     ax, 0x1bb0
*            06F10 0000:6F10  fc                 cld     
*            06F11 0000:6F11  219b0200           and     word ptr [bp + di + 2], bx
*            06F15 0000:6F15  10b3f2bd           adc     byte ptr [bp + di - 0x420e], dh
*            06F19 0000:6F19  238c63af           and     cx, word ptr [si - 0x509d]
*            06F1D 0000:6F1D  0300               add     ax, word ptr [bx + si]
*            06F1F 0000:6F1F  029804c4           add     bl, byte ptr [bx + si - 0x3bfc]
*            06F23 0000:6F23  2110               and     word ptr [bx + si], dx
*            06F25 0000:6F25  27                 daa     
*            06F26 0000:6F26  dd05               fld     qword ptr [di]
*            06F28 0000:6F28  0004               add     byte ptr [si], al
*            06F2A 0000:6F2A  dd01               fld     qword ptr [bx + di]
*            06F2C 0000:6F2C  1c27               sbb     al, 0x27
*            06F2E 0000:6F2E  0429               add     al, 0x29
*            06F30 0000:6F30  640400             add     al, 0
*            06F33 0000:6F33  02dd               add     bl, ch
*            06F35 0000:6F35  031627cc           add     dx, word ptr [0xcc27]
*            06F39 0000:6F39  698302000880       imul    ax, word ptr [bp + di + 2], 0x8008
*            06F3F 0000:6F3F  06                 push    es
*            06F40 0000:6F40  bc3024             mov     sp, 0x2430
*            06F43 0000:6F43  6c                 insb    byte ptr es:[di], dx
*            06F44 0000:6F44  9b                 wait    
*            06F45 0000:6F45  0100               add     word ptr [bx + si], ax
*            06F47 0000:6F47  02820388           add     al, byte ptr [bp + si - 0x77fd]
*            06F4B 0000:6F4B  2be0               sub     sp, ax
*            06F4D 0000:6F4D  2efb               sti     
*            06F4F 0000:6F4F  0100               add     word ptr [bx + si], ax
*            06F51 0000:6F51  08fd               or      ch, bh
*            06F53 0000:6F53  f9                 stc     
*            06F54 0000:6F54  95                 xchg    bp, ax
*            06F55 0000:6F55  2e7070             jo      0x6fc8
*            06F58 0000:6F58  a5                 movsw   word ptr es:[di], word ptr [si]
*            06F59 0000:6F59  0200               add     al, byte ptr [bx + si]
*            06F5B 0000:6F5B  02fb               add     bh, bl
*            06F5D 0000:6F5D  03f3               add     si, bx
*            06F5F 0000:6F5F  2e6a71             push    0x71
*            06F62 0000:6F62  b504               mov     ch, 4
*            06F64 0000:6F64  0004               add     byte ptr [si], al
*            06F66 0000:6F66  51                 push    cx
*            06F67 0000:6F67  05762d             add     ax, 0x2d76
*            06F6A 0000:6F6A  c8324f06           enter   0x4f32, 6
*            06F6E 0000:6F6E  0002               add     byte ptr [bp + si], al
*            06F70 0000:6F70  670464             add     al, 0x64
*            06F73 0000:6F73  33b03676           xor     si, word ptr [bx + si + 0x7636]
*            06F77 0000:6F77  050004             add     ax, 0x400
*            06F7A 0000:6F7A  800200             add     byte ptr [bp + si], 0
*            06F7D 0000:6F7D  3446               xor     al, 0x46
*            06F7F 0000:6F7F  37                 aaa     
*            06F80 0000:6F80  81040002           add     word ptr [si], 0x200
*            06F84 0000:6F84  fb                 sti     
*            06F85 0000:6F85  035835             add     bx, word ptr [bx + si + 0x35]
*            06F88 0000:6F88  a4                 movsb   byte ptr es:[di], byte ptr [si]
*            06F89 0000:6F89  78bd               js      0x6f48
*            06F8B 0000:6F8B  0100               add     word ptr [bx + si], ax
*            06F8D 0000:6F8D  089906ff           or      byte ptr [bx + di - 0xfa], bl
*            06F91 0000:6F91  3e98               cwde    
*            06F93 0000:6F93  7afd               jp      0x6f92
*            06F95 0000:6F95  0000               add     byte ptr [bx + si], al
*            06F97 0000:6F97  02f4               add     dh, ah
*            06F99 0000:6F99  023b               add     bh, byte ptr [bp + di]
*            06F9B 0000:6F9B  3ad8               cmp     bl, al
*            06F9D 0000:6F9D  00e7               add     bh, ah
*            06F9F 0000:6F9F  0000               add     byte ptr [bx + si], al
*            06FA1 0000:6FA1  1041f1             adc     byte ptr [bx + di - 0xf], al
*            06FA4 0000:6FA4  813dcc42           cmp     word ptr [di], 0x42cc
*            06FA8 0000:6FA8  94                 xchg    sp, ax
*            06FA9 0000:6FA9  0100               add     word ptr [bx + si], ax
*            06FAB 0000:6FAB  02dc               add     bl, ah
*            06FAD 0000:6FAD  024301             add     al, byte ptr [bp + di + 1]
*            06FB0 0000:6FB0  50                 push    ax
*            06FB1 0000:6FB1  46                 inc     si
*            06FB2 0000:6FB2  4e                 dec     si
*            06FB3 0000:6FB3  0900               or      word ptr [bx + si], ax
*            06FB5 0000:6FB5  10d5               adc     ch, dl
*            06FB7 0000:6FB7  0b83364a           or      ax, word ptr [bp + di + 0x4a36]
*            06FBB 0000:6FBB  08fd               or      ch, bh
*            06FBD 0000:6FBD  0a00               or      al, byte ptr [bx + si]
*            06FBF 0000:6FBF  02fd               add     bh, ch
*            06FC1 0000:6FC1  084a08             or      byte ptr [bp + si + 8], cl
*            06FC4 0000:6FC4  820f44             or      byte ptr [bx], 0x44
*            06FC7 0000:6FC7  0900               or      word ptr [bx + si], ax
*            06FC9 0000:6FC9  10fd               adc     ch, bh
*            06FCB 0000:6FCB  fa                 cli     
*            06FCC 0000:6FCC  4a                 dec     dx
*            06FCD 0000:6FCD  08c9               or      cl, cl
*            06FCF 0000:6FCF  53                 push    bx
*            06FD0 0000:6FD0  b109               mov     cl, 9
*            06FD2 0000:6FD2  0004               add     byte ptr [si], al
*            06FD4 0000:6FD4  d6                 salc    
*            06FD5 0000:6FD5  0c50               or      al, 0x50
*            06FD7 0000:6FD7  1138               adc     word ptr [bx + si], di
*            06FD9 0000:6FD9  07                 pop     es
*            06FDA 0000:6FDA  47                 inc     di
*            06FDB 0000:6FDB  fe00               inc     byte ptr [bx + si]
*            06FDD 0000:6FDD  1000               adc     byte ptr [bx + si], al
*            06FDF 0000:6FDF  f00000             lock add byte ptr [bx + si], al
*            06FE2 0000:6FE2  7f4b               jg      0x702f
*            06FE4 0000:6FE4  b4fe               mov     ah, 0xfe
*            06FE6 0000:6FE6  0004               add     byte ptr [si], al
*            06FE8 0000:6FE8  d901               fld     dword ptr [bx + di]
*            06FEA 0000:6FEA  06                 push    es
*            06FEB 0000:6FEB  09e4               or      sp, sp
*            06FED 0000:6FED  4c                 dec     sp
*            06FEE 0000:6FEE  d300               rol     word ptr [bx + si], cl
*            06FF0 0000:6FF0  0004               add     byte ptr [si], al
*            06FF2 0000:6FF2  d901               fld     dword ptr [bx + di]
*            06FF4 0000:6FF4  06                 push    es
*            06FF5 0000:6FF5  09d8               or      ax, bx
*            06FF7 0000:6FF7  0e                 push    cs
*            06FF8 0000:6FF8  50                 push    ax
*            06FF9 0000:6FF9  0200               add     al, byte ptr [bx + si]
*            06FFB 0000:6FFB  025000             add     dl, byte ptr [bx + si]
*            06FFE 0000:6FFE  d30e6810           ror     word ptr [0x1068], cl   ; RCRAM (road, shared)
*            07002 0000:7002  8901               mov     word ptr [bx + di], ax
*            07004 0000:7004  0002               add     byte ptr [bp + si], al
*            07006 0000:7006  50                 push    ax
*            07007 0000:7007  00d3               add     bl, dl
*            07009 0000:7009  0e                 push    cs
*            0700A 0000:700A  5c                 pop     sp
*            0700B 0000:700B  52                 push    dx
*            0700C 0000:700C  cb                 retf    
             0700D 0000:700D  0000               add     byte ptr [bx + si], al
             0700F 0000:700F  02c2               add     al, dl
             07011 0000:7011  02fd               add     bh, ch
             07013 0000:7013  1118               adc     word ptr [bx + si], bx
             07015 0000:7015  55                 push    bp
             07016 0000:7016  bf0200             mov     di, 2
             07019 0000:7019  04b9               add     al, 0xb9
             0701B 0000:701B  049e               add     al, 0x9e
             0701D 0000:701D  11e0               adc     ax, sp
             0701F 0000:701F  153f03             adc     ax, 0x33f
             07022 0000:7022  0001               add     byte ptr [bx + di], al
             07024 0000:7024  40                 inc     ax
             07025 0000:7025  02f7               add     dh, bh
             07027 0000:7027  152c1a             adc     ax, 0x1a2c
             0702A 0000:702A  f7ff               idiv    di
             0702C 0000:702C  0004               add     byte ptr [si], al
             0702E 0000:702E  43                 inc     bx
      0702F 0000:702F  db   ff
             07030 0000:7030  3c16               cmp     al, 0x16
             07032 0000:7032  58                 pop     ax
             07033 0000:7033  5b                 pop     bx
      07034 0000:7034  db   c7
             07035 0000:7035  fd                 std     
             07036 0000:7036  0004               add     byte ptr [si], al
             07038 0000:7038  ab                 stosw   word ptr es:[di], ax
             07039 0000:7039  001c               add     byte ptr [si], bl
             0703B 0000:703B  1e                 push    ds
             0703C 0000:703C  145e               adc     al, 0x5e
             0703E 0000:703E  c0fd00             sar     ch, 0
             07041 0000:7041  0239               add     bh, byte ptr [bx + di]
      07043 0000:7043  db   ff
             07044 0000:7044  ba1cc4             mov     dx, 0xc41c
             07047 0000:7047  2247fe             and     al, byte ptr [bx - 2]
             0704A 0000:704A  0004               add     byte ptr [si], al
             0704C 0000:704C  ce                 into    
*            0704D 0000:704D  fa                 cli     
*            0704E 0000:704E  c820d867           enter   -0x27e0, 0x67
*            07052 0000:7052  37                 aaa     
*            07053 0000:7053  ff00               inc     word ptr [bx + si]
*            07055 0000:7055  04c0               add     al, 0xc0
*            07057 0000:7057  01c0               add     ax, ax
*            07059 0000:7059  24f8               and     al, 0xf8
*            0705B 0000:705B  2a890100           sub     cl, byte ptr [bx + di + 1]
*            0705F 0000:705F  0825               or      byte ptr [di], ah
*            07061 0000:7061  fa                 cli     
*            07062 0000:7062  082ef22b           or      byte ptr [0x2bf2], ch
*            07066 0000:7066  6a01               push    1
*            07068 0000:7068  0001               add     byte ptr [bx + di], al
*            0706A 0000:706A  9d                 popf    
*            0706B 0000:706B  005a2b             add     byte ptr [bp + si + 0x2b], bl
*            0706E 0000:706E  822ddd             sub     byte ptr [di], 0xdd
*            07071 0000:7071  fe00               inc     byte ptr [bx + si]
*            07073 0000:7073  0433               add     al, 0x33
      07075 0000:7075  db   fe
             07076 0000:7076  90                 nop     
             07077 0000:7077  2918               sub     word ptr [bx + si], bx
             07079 0000:7079  6e                 outsb   dx, byte ptr [si]
             0707A 0000:707A  ed                 in      ax, dx
             0707B 0000:707B  fc                 cld     
             0707C 0000:707C  0008               add     byte ptr [bx + si], cl
             0707E 0000:707E  3100               xor     word ptr [bx + si], ax
             07080 0000:7080  66357070cffb       xor     eax, 0xfbcf7070
             07086 0000:7086  0002               add     byte ptr [bp + si], al
             07088 0000:7088  befdeb             mov     si, 0xebfd
             0708B 0000:708B  2f                 das     
             0708C 0000:708C  4c                 dec     sp
             0708D 0000:708D  3644               inc     sp
             0708F 0000:708F  fc                 cld     
             07090 0000:7090  0010               add     byte ptr [bx + si], dl
             07092 0000:7092  5b                 pop     bx
             07093 0000:7093  ec                 in      al, dx
             07094 0000:7094  97                 xchg    di, ax
             07095 0000:7095  34d0               xor     al, 0xd0
             07097 0000:7097  79b4               jns     0x704d
             07099 0000:7099  fd                 std     
             0709A 0000:709A  0004               add     byte ptr [si], al
             0709C 0000:709C  3e00b93660         add     byte ptr ds:[bx + di + 0x6036], bh
             070A1 0000:70A1  7bc6               jnp     0x7069
             070A3 0000:70A3  0000               add     byte ptr [bx + si], al
             070A5 0000:70A5  08c8               or      al, cl
             070A7 0000:70A7  02a23354           add     ah, byte ptr [bp + si + 0x5433]
             070AB 0000:70AB  3d4502             cmp     ax, 0x245
             070AE 0000:70AE  0002               add     byte ptr [bp + si], al
             070B0 0000:70B0  45                 inc     bp
             070B1 0000:70B1  00503d             add     byte ptr [bx + si + 0x3d], dl
             070B4 0000:70B4  0a01               or      al, byte ptr [bx + di]
             070B6 0000:70B6  af                 scasw   ax, word ptr es:[di]
             070B7 0000:70B7  ff00               inc     word ptr [bx + si]
             070B9 0000:70B9  0445               add     al, 0x45
             070BB 0000:70BB  fe4c3d             dec     byte ptr [si + 0x3d]
             070BE 0000:70BE  cc                 int3    
             070BF 0000:70BF  42                 inc     dx
             070C0 0000:70C0  a0fd00             mov     al, byte ptr [0xfd]   ; math_ram (shared)
             070C3 0000:70C3  0419               add     al, 0x19
             070C5 0000:70C5  01c8               add     ax, cx
             070C7 0000:70C7  0424               add     al, 0x24
*   L_070C9: 070C9 0000:70C9  45                 inc     bp
*            070CA 0000:70CA  e3fd               jcxz    0x70c9
*            070CC 0000:70CC  0002               add     byte ptr [bp + si], al
*            070CE 0000:70CE  5d                 pop     bp
*            070CF 0000:70CF  ffca               dec     dx
*            070D1 0000:70D1  0318               add     bx, word ptr [bx + si]
*            070D3 0000:70D3  47                 inc     di
*            070D4 0000:70D4  a4                 movsb   byte ptr es:[di], byte ptr [si]
*            070D5 0000:70D5  0000               add     byte ptr [bx + si], al
*            070D7 0000:70D7  08ca               or      dl, cl
*            070D9 0000:70D9  03bd3f00           add     di, word ptr [di + 0x3f]
*            070DD 0000:70DD  0bb60400           or      si, word ptr [bp + 4]
*            070E1 0000:70E1  087efd             or      byte ptr [bp - 3], bh
*            070E4 0000:70E4  730e               jae     0x70f4
*            070E6 0000:70E6  ba0c1a             mov     dx, 0x1a0c
*            070E9 0000:70E9  050004             add     ax, 0x400
*            070EC 0000:70EC  1a01               sbb     al, byte ptr [bx + di]
*            070EE 0000:70EE  b90cf2             mov     cx, 0xf20c
*            070F1 0000:70F1  135f03             adc     bx, word ptr [bx + 3]
*   L_070F4: 070F4 0000:70F4  0010               add     byte ptr [bx + si], dl
*            070F6 0000:70F6  1af5               sbb     dh, ch
*            070F8 0000:70F8  b60c               mov     dh, 0xc
*            070FA 0000:70FA  3958cb             cmp     word ptr [bx + si - 0x35], bx
*            070FD 0000:70FD  0300               add     ax, word ptr [bx + si]
*            070FF 0000:70FF  04f0               add     al, 0xf0
*            07101 0000:7101  06                 push    es
*            07102 0000:7102  c11538             rcl     word ptr [di], 0x38
*            07105 0000:7105  07                 pop     es
*            07106 0000:7106  47                 inc     di
*            07107 0000:7107  fe00               inc     byte ptr [bx + si]
*            07109 0000:7109  1000               adc     byte ptr [bx + si], al
*            0710B 0000:710B  f00000             lock add byte ptr [bx + si], al
*            0710E 0000:710E  7f4b               jg      0x715b
*            07110 0000:7110  b4fe               mov     ah, 0xfe
*            07112 0000:7112  0004               add     byte ptr [si], al
*            07114 0000:7114  d901               fld     dword ptr [bx + di]
*            07116 0000:7116  06                 push    es
*            07117 0000:7117  09e4               or      sp, sp
*            07119 0000:7119  4c                 dec     sp
*            0711A 0000:711A  d300               rol     word ptr [bx + si], cl
*            0711C 0000:711C  0004               add     byte ptr [si], al
*            0711E 0000:711E  d901               fld     dword ptr [bx + di]
*            07120 0000:7120  06                 push    es
*            07121 0000:7121  09a00fa3           or      word ptr [bx + si - 0x5cf1], sp
*            07125 0000:7125  0300               add     ax, word ptr [bx + si]
*            07127 0000:7127  04cd               add     al, 0xcd
*            07129 0000:7129  ffc2               inc     dx
*            0712B 0000:712B  10881348           adc     byte ptr [bx + si + 0x4813], cl
*            0712F 0000:712F  0400               add     al, 0
*            07131 0000:7131  104bf4             adc     byte ptr [bp + di - 0xc], cl
*            07134 0000:7134  2814               sub     byte ptr [si], dl
*            07136 0000:7136  a856               test    al, 0x56
*            07138 0000:7138  fe05               inc     byte ptr [di]
*            0713A 0000:713A  0004               add     byte ptr [si], al
*            0713C 0000:713C  47                 inc     di
*            0713D 0000:713D  086013             or      byte ptr [bx + si + 0x13], ah
*            07140 0000:7140  005911             add     byte ptr [bx + di + 0x11], bl
*            07143 0000:7143  0b00               or      ax, word ptr [bx + si]
*            07145 0000:7145  1023               adc     byte ptr [bp + di], ah
*            07147 0000:7147  0f8709f4           ja      0x6554
*            0714B 0000:714B  1a8f0c00           sbb     cl, byte ptr [bx + 0xc]
*            0714F 0000:714F  028f0aef           add     cl, byte ptr [bx - 0x10f6]
*            07153 0000:7153  1ae8               sbb     ch, al
*            07155 0000:7155  1ce3               sbb     al, 0xe3
*            07157 0000:7157  0a00               or      al, byte ptr [bx + si]
*            07159 0000:7159  028f0aef           add     cl, byte ptr [bx - 0x10f6]
*            0715D 0000:715D  1aa45fbb           sbb     ah, byte ptr [si - 0x44a1]
*            07161 0000:7161  07                 pop     es
*            07162 0000:7162  0004               add     byte ptr [si], al
*            07164 0000:7164  8b0b               mov     cx, word ptr [bp + di]
*            07166 0000:7166  da20               fisub   dword ptr [bx + si]
*            07168 0000:7168  98                 cwde    
*            07169 0000:7169  61                 popaw   
*            0716A 0000:716A  2908               sub     word ptr [bx + si], cx
*            0716C 0000:716C  0002               add     byte ptr [bp + si], al
*            0716E 0000:716E  a3093f             mov     word ptr [0x3f09], ax   ; MATH UNIT (mul/div/geometry)
*            07171 0000:7171  20f0               and     al, dh
*            07173 0000:7173  236b08             and     bp, word ptr [bp + di + 8]
*            07176 0000:7176  0002               add     byte ptr [bp + si], al
*            07178 0000:7178  af                 scasw   ax, word ptr es:[di]
*            07179 0000:7179  06                 push    es
*            0717A 0000:717A  f1                 int1    
*            0717B 0000:717B  22e4               and     ah, ah
*            0717D 0000:717D  259c05             and     ax, 0x59c
*            07180 0000:7180  0004               add     byte ptr [si], al
*            07182 0000:7182  f304f2             add     al, 0xf2
*            07185 0000:7185  21d8               and     ax, bx
*            07187 0000:7187  6791               xchg    cx, ax
*            07189 0000:7189  0100               add     word ptr [bx + si], ax
*            0718B 0000:718B  08ee               or      dh, ch
*            0718D 0000:718D  06                 push    es
*            0718E 0000:718E  c82d306a           enter   0x302d, 0x6a
*            07192 0000:7192  1a01               sbb     al, byte ptr [bx + di]
*            07194 0000:7194  0002               add     byte ptr [bp + si], al
*            07196 0000:7196  e80254             call    0xc59b
*            07199 0000:7199  295c6b             sub     word ptr [si + 0x6b], bx
*            0719C 0000:719C  ca0100             retf    1
             0719F 0000:719F  085308             or      byte ptr [bp + di + 8], dl
             071A2 0000:71A2  bf2618             mov     di, 0x1826
             071A5 0000:71A5  2e61               popaw   
             071A7 0000:71A7  0100               add     word ptr [bx + si], ax
             071A9 0000:71A9  0228               add     ch, byte ptr [bx + si]
             071AB 0000:71AB  00832ce0           add     byte ptr [bp + di - 0x1fd4], al
             071AF 0000:71AF  6e                 outsb   dx, byte ptr [si]
             071B0 0000:71B0  fe00               inc     byte ptr [bx + si]
             071B2 0000:71B2  0001               add     byte ptr [bx + di], al
             071B4 0000:71B4  fe01               inc     byte ptr [bx + di]
             071B6 0000:71B6  e32e               jcxz    0x71e6
             071B8 0000:71B8  647200             jb      0x71bb
*            071BB 0000:71BB  0300               add     ax, word ptr [bx + si]
*            071BD 0000:71BD  04fe               add     al, 0xfe
*            071BF 0000:71BF  04ec               add     al, 0xec
*            071C1 0000:71C1  2e2c73             sub     al, 0x73
*            071C4 0000:71C4  e104               loope   0x71ca
*            071C6 0000:71C6  0008               add     byte ptr [bx + si], cl
*            071C8 0000:71C8  fc                 cld     
*            071C9 0000:71C9  06                 push    es
      071CA 0000:71CA  db   't+X44'
*            071CF 0000:71CF  06                 push    es
*            071D0 0000:71D0  0002               add     byte ptr [bp + si], al
*            071D2 0000:71D2  5a                 pop     dx
*            071D3 0000:71D3  041a               add     al, 0x1a
*            071D5 0000:71D5  357837             xor     ax, 0x3778
*            071D8 0000:71D8  2a060004           sub     al, byte ptr [0x400]   ; math_ram (shared)
*            071DC 0000:71DC  8002dc             add     byte ptr [bp + si], 0xdc
*            071DF 0000:71DF  35a438             xor     ax, 0x38a4
*            071E2 0000:71E2  a4                 movsb   byte ptr es:[di], byte ptr [si]
*            071E3 0000:71E3  0400               add     al, 0
*            071E5 0000:71E5  025504             add     dl, byte ptr [di + 4]
*            071E8 0000:71E8  aa                 stosb   byte ptr es:[di], al
*            071E9 0000:71E9  36347a             xor     al, 0x7a
*            071EC 0000:71EC  fe02               inc     byte ptr [bp + si]
*            071EE 0000:71EE  0002               add     byte ptr [bp + si], al
*            071F0 0000:71F0  f3049e             add     al, 0x9e
*            071F3 0000:71F3  3aac3fce           cmp     ch, byte ptr [si - 0x31c1]
*   L_071F7: 071F7 0000:71F7  fe00               inc     byte ptr [bx + si]
*            071F9 0000:71F9  082a               or      byte ptr [bp + si], ch
*            071FB 0000:71FB  fb                 sti     
      071FC 0000:71FC  db   8c
             071FD 0000:71FD  383c               cmp     byte ptr [si], bh
             071FF 0000:71FF  41                 inc     cx
             07200 0000:7200  bafd00             mov     dx, 0xfd
             07203 0000:7203  02b7ff74           add     dh, byte ptr [bx + 0x74ff]
             07207 0000:7207  018845a7           add     word ptr [bx + si - 0x58bb], cx
             0720B 0000:720B  0000               add     byte ptr [bx + si], al
             0720D 0000:720D  04b4               add     al, 0xb4
             0720F 0000:720F  01ac010c           add     word ptr [si + 0xc01], bp
             07213 0000:7213  09960300           or      word ptr [bp + 3], dx
             07217 0000:7217  049a               add     al, 0x9a
             07219 0000:7219  ff6409             jmp     word ptr [si + 9]
             0721C 0000:721C  000b               add     byte ptr [bp + di], cl
             0721E 0000:721E  81020002           add     word ptr [bp + si], 0x200
             07222 0000:7222  98                 cwde    
             07223 0000:7223  0138               add     word ptr [bx + si], di
             07225 0000:7225  0920               or      word ptr [bx + si], sp
             07227 0000:7227  4e                 dec     si
             07228 0000:7228  37                 aaa     
             07229 0000:7229  ff00               inc     word ptr [bx + si]
             0722B 0000:722B  0825               or      byte ptr [di], ah
             0722D 0000:722D  06                 push    es
             0722E 0000:722E  2012               and     byte ptr [bp + si], dl
             07230 0000:7230  204ff2             and     byte ptr [bx - 0xe], cl
             07233 0000:7233  fe00               inc     byte ptr [bx + si]
             07235 0000:7235  02f2               add     dh, dl
             07237 0000:7237  0020               add     byte ptr [bx + si], ah
             07239 0000:7239  0f405241           cmovo   dx, word ptr [bp + si + 0x41]
             0723D 0000:723D  ff00               inc     word ptr [bx + si]
             0723F 0000:723F  10f2               adc     dl, dh
             07241 0000:7241  0e                 push    cs
             07242 0000:7242  200f               and     byte ptr [bx], cl
             07244 0000:7244  60                 pushaw  
             07245 0000:7245  1590ff             adc     ax, 0xff90
             07248 0000:7248  0010               add     byte ptr [bx + si], dl
             0724A 0000:724A  90                 nop     
             0724B 0000:724B  ef                 out     dx, ax
             0724C 0000:724C  60                 pushaw  
             0724D 0000:724D  158058             adc     ax, 0x5880
      07250 0000:7250  db   df
             07251 0000:7251  ff00               inc     word ptr [bx + si]
             07253 0000:7253  10900f60           adc     byte ptr [bx + si + 0x600f], dl
             07257 0000:7257  15a01b             adc     ax, 0x1ba0
             0725A 0000:725A  2e0000             add     byte ptr cs:[bx + si], al
             0725D 0000:725D  102ef0a0           adc     byte ptr [0xa0f0], ch
             07261 0000:7261  1bdc               sbb     bx, sp
             07263 0000:7263  0576ff             add     ax, 0xff76
             07266 0000:7266  0020               add     byte ptr [bx + si], ah
             07268 0000:7268  00e0               add     al, ah
             0726A 0000:726A  0000               add     byte ptr [bx + si], al
             0726C 0000:726C  b84bec             mov     ax, 0xec4b
             0726F 0000:726F  fe00               inc     byte ptr [bx + si]
             07271 0000:7271  20ec               and     ah, ch
             07273 0000:7273  1e                 push    ds
             07274 0000:7274  b80ba0             mov     ax, 0xa00b
             07277 0000:7277  0fc8               bswap   ax
             07279 0000:7279  fb                 sti     
             0727A 0000:727A  0004               add     byte ptr [si], al
             0727C 0000:727C  ec                 in      al, dx
             0727D 0000:727D  fa                 cli     
             0727E 0000:727E  b80b50             mov     ax, 0x500b
             07281 0000:7281  54                 push    sp
             07282 0000:7282  b8f800             mov     ax, 0xf8
             07285 0000:7285  04a4               add     al, 0xa4
             07287 0000:7287  fc                 cld     
             07288 0000:7288  8813               mov     byte ptr [bp + di], dl
             0728A 0000:728A  1855f6             sbb     byte ptr [di - 0xa], dl
             0728D 0000:728D  f8                 clc     
             0728E 0000:728E  0004               add     byte ptr [si], al
             07290 0000:7290  a4                 movsb   byte ptr es:[di], byte ptr [si]
             07291 0000:7291  fc                 cld     
             07292 0000:7292  8813               mov     byte ptr [bp + di], dl
             07294 0000:7294  58                 pop     ax
             07295 0000:7295  1bf6               sbb     si, si
             07297 0000:7297  f8                 clc     
             07298 0000:7298  0008               add     byte ptr [bx + si], cl
             0729A 0000:729A  99                 cdq     
             0729B 0000:729B  f1                 int1    
             0729C 0000:729C  3818               cmp     byte ptr [bx + si], bl
             0729E 0000:729E  52                 push    dx
             0729F 0000:729F  1c13               sbb     al, 0x13
             072A1 0000:72A1  f8                 clc     
             072A2 0000:72A2  0002               add     byte ptr [bp + si], al
             072A4 0000:72A4  1f                 pop     ds
             072A5 0000:72A5  f7901a40           not     word ptr [bx + si + 0x401a]
             072A9 0000:72A9  5f                 pop     di
             072AA 0000:72AA  06                 push    es
             072AB 0000:72AB  f60004             test    byte ptr [bx + si], 4
             072AE 0000:72AE  fb                 sti     
             072AF 0000:72AF  f9                 stc     
             072B0 0000:72B0  d6                 salc    
             072B1 0000:72B1  1f                 pop     ds
             072B2 0000:72B2  d06075             shl     byte ptr [bx + si + 0x75], 1
             072B5 0000:72B5  f60002             test    byte ptr [bx + si], 2
             072B8 0000:72B8  00f8               add     al, bh
             072BA 0000:72BA  8b1f               mov     bx, word ptr [bx]
             072BC 0000:72BC  2823               sub     byte ptr [bp + di], ah
             072BE 0000:72BE  5d                 pop     bp
             072BF 0000:72BF  f700045e           test    word ptr [bx + si], 0x5e04
             072C3 0000:72C3  f35b               pop     bx
             072C5 0000:72C5  23b824bb           and     di, word ptr [bx + si - 0x44dc]
             072C9 0000:72C9  f60002             test    byte ptr [bx + si], 2
             072CC 0000:72CC  5e                 pop     si
             072CD 0000:72CD  f5                 cmc     
             072CE 0000:72CE  41                 inc     cx
             072CF 0000:72CF  2304               and     ax, word ptr [si]
             072D1 0000:72D1  6974f30010         imul    si, word ptr [si - 0xd], 0x1000
             072D6 0000:72D6  a1016e             mov     ax, word ptr [0x6e01]
             072D9 0000:72D9  30ec               xor     ah, ch
             072DB 0000:72DB  6c                 insb    byte ptr es:[di], dx
             072DC 0000:72DC  90                 nop     
             072DD 0000:72DD  f30004             add     byte ptr [si], al
             072E0 0000:72E0  fff6               push    si
             072E2 0000:72E2  df2a               fild    qword ptr [bp + si]
             072E4 0000:72E4  7070               jo      0x7356
             072E6 0000:72E6  fd                 std     
             072E7 0000:72E7  f700086e           test    word ptr [bx + si], 0x6e08
             072EB 0000:72EB  fa                 cli     
             072EC 0000:72EC  d228               shr     byte ptr [bx + si], cl
             072EE 0000:72EE  643261f9           xor     ah, byte ptr fs:[bx + di - 7]
             072F2 0000:72F2  0002               add     byte ptr [bp + si], al
             072F4 0000:72F4  61                 popaw   
             072F5 0000:72F5  f75832             neg     word ptr [bx + si + 0x32]
             072F8 0000:72F8  3a34               cmp     dh, byte ptr [si]
             072FA 0000:72FA  0e                 push    cs
             072FB 0000:72FB  f8                 clc     
             072FC 0000:72FC  0002               add     byte ptr [bp + si], al
             072FE 0000:72FE  61                 popaw   
             072FF 0000:72FF  f75832             neg     word ptr [bx + si + 0x32]
             07302 0000:7302  a4                 movsb   byte ptr es:[di], byte ptr [si]
             07303 0000:7303  7876               js      0x737b
             07305 0000:7305  f5                 cmc     
             07306 0000:7306  0004               add     byte ptr [si], al
             07308 0000:7308  68f9fe             push    0xfef9
             0730B 0000:730B  37                 aaa     
             0730C 0000:730C  807ec8f9           cmp     byte ptr [bp - 0x38], 0xf9
             07310 0000:7310  0008               add     byte ptr [bx + si], cl
             07312 0000:7312  5b                 pop     bx
             07313 0000:7313  fd                 std     
             07314 0000:7314  58                 pop     ax
             07315 0000:7315  37                 aaa     
*   L_07316: 07316 0000:7316  ce                 into    
*            07317 0000:7317  00d2               add     dl, dl
*            07319 0000:7319  fa                 cli     
*            0731A 0000:731A  0002               add     byte ptr [bp + si], al
*            0731C 0000:731C  e3f8               jcxz    0x7316
*            0731E 0000:731E  4a                 dec     dx
*            0731F 0000:731F  00ed               add     ch, ch
*            07321 0000:7321  44                 inc     sp
*            07322 0000:7322  48                 dec     ax
*            07323 0000:7323  fa                 cli     
*            07324 0000:7324  0010               add     byte ptr [bx + si], dl
*            07326 0000:7326  48                 dec     ax
*            07327 0000:7327  0aed               or      ch, ch
*            07329 0000:7329  04c9               add     al, 0xc9
*            0732B 0000:732B  0abdf900           or      bh, byte ptr [di + 0xf9]
*            0732F 0000:732F  2048da             and     byte ptr [bx + si - 0x26], cl
*            07332 0000:7332  ed                 in      ax, dx
*            07333 0000:7333  04a5               add     al, 0xa5
*            07335 0000:7335  50                 push    ax
*            07336 0000:7336  32f9               xor     bh, cl
*            07338 0000:7338  0020               add     byte ptr [bx + si], ah
*            0733A 0000:733A  3219               xor     bl, byte ptr [bx + di]
*            0733C 0000:733C  a5                 movsw   word ptr es:[di], word ptr [si]
*            0733D 0000:733D  10ff               adc     bh, bh
      0733F 0000:733F  db   ff
      07340 0000:7340  db   ff
      07341 0000:7341  db   ff
      07342 0000:7342  db   ff
      07343 0000:7343  db   ff
      07344 0000:7344  db   ff
      07345 0000:7345  db   ff
      07346 0000:7346  db   ff
      07347 0000:7347  db   ff
      07348 0000:7348  db   ff
      07349 0000:7349  db   ff
      0734A 0000:734A  db   ff
      0734B 0000:734B  db   ff
      0734C 0000:734C  db   ff
      0734D 0000:734D  db   ff
      0734E 0000:734E  db   ff
      0734F 0000:734F  db   ff
      07350 0000:7350  db   ff
      07351 0000:7351  db   ff
      07352 0000:7352  db   ff
      07353 0000:7353  db   ff
      07354 0000:7354  db   ff
      07355 0000:7355  db   ff
      07356 0000:7356  db   ff
      07357 0000:7357  db   ff
      07358 0000:7358  db   ff
      07359 0000:7359  db   ff
      0735A 0000:735A  db   ff
      0735B 0000:735B  db   ff
      0735C 0000:735C  db   ff
      0735D 0000:735D  db   ff
      0735E 0000:735E  db   ff
      0735F 0000:735F  db   ff
      07360 0000:7360  db   ff
      07361 0000:7361  db   ff
      07362 0000:7362  db   ff
      07363 0000:7363  db   ff
      07364 0000:7364  db   ff
      07365 0000:7365  db   ff
      07366 0000:7366  db   ff
      07367 0000:7367  db   ff
      07368 0000:7368  db   ff
      07369 0000:7369  db   ff
      0736A 0000:736A  db   ff
      0736B 0000:736B  db   ff
      0736C 0000:736C  db   ff
      0736D 0000:736D  db   ff
      0736E 0000:736E  db   ff
      0736F 0000:736F  db   ff
      07370 0000:7370  db   ff
      07371 0000:7371  db   ff
      07372 0000:7372  db   ff
      07373 0000:7373  db   ff
      07374 0000:7374  db   ff
      07375 0000:7375  db   ff
      07376 0000:7376  db   ff
      07377 0000:7377  db   ff
      07378 0000:7378  db   ff
      07379 0000:7379  db   ff
      0737A 0000:737A  db   ff
      0737B 0000:737B  db   ff
      0737C 0000:737C  db   ff
      0737D 0000:737D  db   ff
      0737E 0000:737E  db   ff
      0737F 0000:737F  db   ff
      07380 0000:7380  db   ff
      07381 0000:7381  db   ff
      07382 0000:7382  db   ff
      07383 0000:7383  db   ff
      07384 0000:7384  db   ff
      07385 0000:7385  db   ff
      07386 0000:7386  db   ff
      07387 0000:7387  db   ff
      07388 0000:7388  db   ff
      07389 0000:7389  db   ff
      0738A 0000:738A  db   ff
      0738B 0000:738B  db   ff
      0738C 0000:738C  db   ff
      0738D 0000:738D  db   ff
      0738E 0000:738E  db   ff
      0738F 0000:738F  db   ff
      07390 0000:7390  db   ff
      07391 0000:7391  db   ff
      07392 0000:7392  db   ff
      07393 0000:7393  db   ff
      07394 0000:7394  db   ff
      07395 0000:7395  db   ff
      07396 0000:7396  db   ff
      07397 0000:7397  db   ff
      07398 0000:7398  db   ff
      07399 0000:7399  db   ff
      0739A 0000:739A  db   ff
      0739B 0000:739B  db   ff
      0739C 0000:739C  db   ff
      0739D 0000:739D  db   ff
      0739E 0000:739E  db   ff
      0739F 0000:739F  db   ff
      073A0 0000:73A0  db   ff
      073A1 0000:73A1  db   ff
      073A2 0000:73A2  db   ff
      073A3 0000:73A3  db   ff
      073A4 0000:73A4  db   ff
      073A5 0000:73A5  db   ff
      073A6 0000:73A6  db   ff
      073A7 0000:73A7  db   ff
      073A8 0000:73A8  db   ff
      073A9 0000:73A9  db   ff
      073AA 0000:73AA  db   ff
      073AB 0000:73AB  db   ff
      073AC 0000:73AC  db   ff
      073AD 0000:73AD  db   ff
      073AE 0000:73AE  db   ff
      073AF 0000:73AF  db   ff
      073B0 0000:73B0  db   ff
      073B1 0000:73B1  db   ff
      073B2 0000:73B2  db   ff
      073B3 0000:73B3  db   ff
      073B4 0000:73B4  db   ff
      073B5 0000:73B5  db   ff
      073B6 0000:73B6  db   ff
      073B7 0000:73B7  db   ff
      073B8 0000:73B8  db   ff
      073B9 0000:73B9  db   ff
      073BA 0000:73BA  db   ff
      073BB 0000:73BB  db   ff
      073BC 0000:73BC  db   ff
      073BD 0000:73BD  db   ff
      073BE 0000:73BE  db   ff
      073BF 0000:73BF  db   ff
      073C0 0000:73C0  db   ff
      073C1 0000:73C1  db   ff
      073C2 0000:73C2  db   ff
      073C3 0000:73C3  db   ff
      073C4 0000:73C4  db   ff
      073C5 0000:73C5  db   ff
      073C6 0000:73C6  db   ff
      073C7 0000:73C7  db   ff
      073C8 0000:73C8  db   ff
      073C9 0000:73C9  db   ff
      073CA 0000:73CA  db   ff
      073CB 0000:73CB  db   ff
      073CC 0000:73CC  db   ff
      073CD 0000:73CD  db   ff
      073CE 0000:73CE  db   ff
      073CF 0000:73CF  db   ff
      073D0 0000:73D0  db   ff
      073D1 0000:73D1  db   ff
      073D2 0000:73D2  db   ff
      073D3 0000:73D3  db   ff
      073D4 0000:73D4  db   ff
      073D5 0000:73D5  db   ff
      073D6 0000:73D6  db   ff
      073D7 0000:73D7  db   ff
      073D8 0000:73D8  db   ff
      073D9 0000:73D9  db   ff
      073DA 0000:73DA  db   ff
      073DB 0000:73DB  db   ff
      073DC 0000:73DC  db   ff
      073DD 0000:73DD  db   ff
      073DE 0000:73DE  db   ff
      073DF 0000:73DF  db   ff
      073E0 0000:73E0  db   ff
      073E1 0000:73E1  db   ff
      073E2 0000:73E2  db   ff
      073E3 0000:73E3  db   ff
      073E4 0000:73E4  db   ff
      073E5 0000:73E5  db   ff
      073E6 0000:73E6  db   ff
      073E7 0000:73E7  db   ff
      073E8 0000:73E8  db   ff
      073E9 0000:73E9  db   ff
      073EA 0000:73EA  db   ff
      073EB 0000:73EB  db   ff
      073EC 0000:73EC  db   ff
      073ED 0000:73ED  db   ff
      073EE 0000:73EE  db   ff
      073EF 0000:73EF  db   ff
      073F0 0000:73F0  db   ff
      073F1 0000:73F1  db   ff
      073F2 0000:73F2  db   ff
      073F3 0000:73F3  db   ff
      073F4 0000:73F4  db   ff
      073F5 0000:73F5  db   ff
      073F6 0000:73F6  db   ff
      073F7 0000:73F7  db   ff
      073F8 0000:73F8  db   ff
      073F9 0000:73F9  db   ff
      073FA 0000:73FA  db   ff
      073FB 0000:73FB  db   ff
      073FC 0000:73FC  db   ff
      073FD 0000:73FD  db   ff
      073FE 0000:73FE  db   ff
             073FF 0000:73FF  ff00               inc     word ptr [bx + si]
             07401 0000:7401  0000               add     byte ptr [bx + si], al
             07403 0000:7403  0001               add     byte ptr [bx + di], al
             07405 0000:7405  0002               add     byte ptr [bp + si], al
             07407 0000:7407  0003               add     byte ptr [bp + di], al
             07409 0000:7409  0004               add     byte ptr [si], al
             0740B 0000:740B  0005               add     byte ptr [di], al
             0740D 0000:740D  00060007           add     byte ptr [0x700], al   ; math_ram (shared)
             07411 0000:7411  0007               add     byte ptr [bx], al
             07413 0000:7413  0008               add     byte ptr [bx + si], cl
             07415 0000:7415  0009               add     byte ptr [bx + di], cl
             07417 0000:7417  000a               add     byte ptr [bp + si], cl
             07419 0000:7419  000b               add     byte ptr [bp + di], cl
             0741B 0000:741B  000c               add     byte ptr [si], cl
             0741D 0000:741D  000d               add     byte ptr [di], cl
             0741F 0000:741F  000e0010           add     byte ptr [0x1000], cl   ; RCRAM (road, shared)
             07423 0000:7423  0011               add     byte ptr [bx + di], dl
             07425 0000:7425  0012               add     byte ptr [bp + si], dl
             07427 0000:7427  0013               add     byte ptr [bp + di], dl
             07429 0000:7429  0014               add     byte ptr [si], dl
             0742B 0000:742B  0015               add     byte ptr [di], dl
             0742D 0000:742D  00160018           add     byte ptr [0x1800], dl   ; RCRAM (road, shared)
             07431 0000:7431  0019               add     byte ptr [bx + di], bl
             07433 0000:7433  001a               add     byte ptr [bp + si], bl
             07435 0000:7435  001b               add     byte ptr [bp + di], bl
             07437 0000:7437  001d               add     byte ptr [di], bl
             07439 0000:7439  001e001f           add     byte ptr [0x1f00], bl   ; RCRAM (road, shared)
             0743D 0000:743D  0020               add     byte ptr [bx + si], ah
             0743F 0000:743F  0022               add     byte ptr [bp + si], ah
             07441 0000:7441  0023               add     byte ptr [bp + di], ah
             07443 0000:7443  0025               add     byte ptr [di], ah
             07445 0000:7445  00260028           add     byte ptr [0x2800], ah
             07449 0000:7449  0029               add     byte ptr [bx + di], ch
             0744B 0000:744B  002b               add     byte ptr [bp + di], ch
             0744D 0000:744D  002c               add     byte ptr [si], ch
             0744F 0000:744F  002e0030           add     byte ptr [0x3000], ch   ; MATH UNIT (mul/div/geometry)
             07453 0000:7453  0031               add     byte ptr [bx + di], dh
             07455 0000:7455  0033               add     byte ptr [bp + di], dh
             07457 0000:7457  0035               add     byte ptr [di], dh
             07459 0000:7459  00360038           add     byte ptr [0x3800], dh   ; MATH UNIT (mul/div/geometry)
             0745D 0000:745D  003a               add     byte ptr [bp + si], bh
             0745F 0000:745F  003c               add     byte ptr [si], bh
             07461 0000:7461  003e0040           add     byte ptr [0x4000], bh
             07465 0000:7465  004200             add     byte ptr [bp + si], al
             07468 0000:7468  44                 inc     sp
             07469 0000:7469  004600             add     byte ptr [bp], al
             0746C 0000:746C  48                 dec     ax
             0746D 0000:746D  004b00             add     byte ptr [bp + di], cl
             07470 0000:7470  4d                 dec     bp
             07471 0000:7471  004f00             add     byte ptr [bx], cl
             07474 0000:7474  52                 push    dx
             07475 0000:7475  005400             add     byte ptr [si], dl
             07478 0000:7478  57                 push    di
             07479 0000:7479  005900             add     byte ptr [bx + di], bl
             0747C 0000:747C  5c                 pop     sp
             0747D 0000:747D  005e00             add     byte ptr [bp], bl
             07480 0000:7480  61                 popaw   
             07481 0000:7481  006400             add     byte ptr [si], ah
             07484 0000:7484  67006a00           add     byte ptr [edx], ch
             07488 0000:7488  6d                 insw    word ptr es:[di], dx
             07489 0000:7489  007000             add     byte ptr [bx + si], dh
             0748C 0000:748C  7400               je      0x748e
*            0748E 0000:748E  7700               ja      0x7490
*   L_07490: 07490 0000:7490  7a00               jp      0x7492
*   L_07492: 07492 0000:7492  7e00               jle     0x7494
*   L_07494: 07494 0000:7494  820085             add     byte ptr [bx + si], 0x85
*            07497 0000:7497  0089008d           add     byte ptr [bx + di - 0x7300], cl
*            0749B 0000:749B  00910096           add     byte ptr [bx + di - 0x6a00], dl
*            0749F 0000:749F  009a009f           add     byte ptr [bp + si - 0x6100], bl
*            074A3 0000:74A3  00a400a8           add     byte ptr [si - 0x5800], ah
*            074A7 0000:74A7  00ae00b3           add     byte ptr [bp - 0x4d00], ch
*            074AB 0000:74AB  00b800be           add     byte ptr [bx + si - 0x4200], bh
*            074AF 0000:74AF  00c4               add     ah, al
*            074B1 0000:74B1  00ca               add     dl, cl
*            074B3 0000:74B3  00d0               add     al, dl
*            074B5 0000:74B5  00d7               add     bh, dl
*            074B7 0000:74B7  00de               add     dh, bl
*            074B9 0000:74B9  00e5               add     ch, ah
*            074BB 0000:74BB  00ed               add     ch, ch
*            074BD 0000:74BD  00f4               add     ah, dh
*            074BF 0000:74BF  00fd               add     ch, bh
*            074C1 0000:74C1  0005               add     byte ptr [di], al
*            074C3 0000:74C3  010e0118           add     word ptr [0x1801], cx   ; RCRAM (road, shared)
*            074C7 0000:74C7  0122               add     word ptr [bp + si], sp
*            074C9 0000:74C9  012c               add     word ptr [si], bp
*   L_074CB: 074CB 0000:74CB  0137               add     word ptr [bx], si
*            074CD 0000:74CD  014201             add     word ptr [bp + si + 1], ax
*            074D0 0000:74D0  4f                 dec     di
*            074D1 0000:74D1  015c01             add     word ptr [si + 1], bx
*            074D4 0000:74D4  69017801           imul    ax, word ptr [bx + di], 0x178
*            074D8 0000:74D8  8701               xchg    word ptr [bx + di], ax
*            074DA 0000:74DA  97                 xchg    di, ax
*            074DB 0000:74DB  01a901bc           add     word ptr [bx + di - 0x43ff], bp
*            074DF 0000:74DF  01d0               add     ax, dx
*            074E1 0000:74E1  01e5               add     bp, sp
*            074E3 0000:74E3  01fc               add     sp, di
*            074E5 0000:74E5  0115               add     word ptr [di], dx
*            074E7 0000:74E7  0230               add     dh, byte ptr [bx + si]
*            074E9 0000:74E9  024e02             add     cl, byte ptr [bp + 2]
*            074EC 0000:74EC  6e                 outsb   dx, byte ptr [si]
*            074ED 0000:74ED  029102b8           add     dl, byte ptr [bx + di - 0x47fe]
*            074F1 0000:74F1  02e2               add     ah, dl
*            074F3 0000:74F3  0212               add     dl, byte ptr [bp + si]
*            074F5 0000:74F5  034703             add     ax, word ptr [bx + 3]
*            074F8 0000:74F8  8303c6             add     word ptr [bp + di], -0x3a
*            074FB 0000:74FB  0314               add     dx, word ptr [si]
*            074FD 0000:74FD  046d               add     al, 0x6d
*            074FF 0000:74FF  04d5               add     al, 0xd5
*            07501 0000:7501  0450               add     al, 0x50
*            07503 0000:7503  050003             add     ax, 0x300
*            07506 0000:7506  0003               add     byte ptr [bp + di], al
*            07508 0000:7508  0003               add     byte ptr [bp + di], al
*            0750A 0000:750A  cc                 int3    
*            0750B 0000:750B  8082030000         add     byte ptr [bp + si + 3], 0
*            07510 0000:7510  0000               add     byte ptr [bx + si], al
*            07512 0000:7512  0000               add     byte ptr [bx + si], al
*            07514 0000:7514  c00200             rol     byte ptr [bp + si], 0
*            07517 0000:7517  0000               add     byte ptr [bx + si], al
*            07519 0000:7519  0000               add     byte ptr [bx + si], al
*            0751B 0000:751B  0000               add     byte ptr [bx + si], al
*            0751D 0000:751D  0000               add     byte ptr [bx + si], al
*            0751F 0000:751F  0000               add     byte ptr [bx + si], al
*            07521 0000:7521  0000               add     byte ptr [bx + si], al
*            07523 0000:7523  005502             add     byte ptr [di + 2], dl
*            07526 0000:7526  e3d1               jcxz    0x74f9
*            07528 0000:7528  e3a1               jcxz    0x74cb
*            0752A 0000:752A  1803               sbb     byte ptr [bp + di], al
*            0752C 0000:752C  80cce8             or      ah, 0xe8
*            0752F 0000:752F  89870011           mov     word ptr [bx + 0x1100], ax
*            07533 0000:7533  c78702112c03       mov     word ptr [bx + 0x1102], 0x32c
*            07539 0000:7539  833e0c1074         cmp     word ptr [0x100c], 0x74   ; RCRAM (road, shared)
*            0753E 0000:753E  770b               ja      0x754b
*            07540 0000:7540  9e                 sahf    
*            07541 0000:7541  0ab908b9           or      bh, byte ptr [bx + di - 0x46f8]
*            07545 0000:7545  08b908b9           or      byte ptr [bx + di - 0x46f8], bh
*            07549 0000:7549  08b90808           or      byte ptr [bx + di + 0x808], bh
*            0754D 0000:754D  0a29               or      ch, byte ptr [bx + di]
*            0754F 0000:754F  0ba93aad           or      bp, word ptr [bx + di - 0x52c6]
*            07553 0000:7553  3ab13ab1           cmp     dh, byte ptr [bx + di - 0x4ec6]
*            07557 0000:7557  1aad1aa9           sbb     ch, byte ptr [di - 0x56e6]
*            0755B 0000:755B  1aa91aa9           sbb     ch, byte ptr [bx + di - 0x56e6]
*            0755F 0000:755F  1aa83aac           sbb     ch, byte ptr [bx + si - 0x53c6]
*            07563 0000:7563  3ab03ab0           cmp     dh, byte ptr [bx + si - 0x4fc6]
*            07567 0000:7567  1aac1aa8           sbb     ch, byte ptr [si - 0x57e6]
*            0756B 0000:756B  1aa81aa8           sbb     ch, byte ptr [bx + si - 0x57e6]
*            0756F 0000:756F  1a810c00           sbb     al, byte ptr [bx + di + 0xc]
*            07573 0000:7573  e8c744             call    0xba3d
*            07576 0000:7576  024403             add     al, byte ptr [si + 3]
*            07579 0000:7579  b88305             mov     ax, 0x583
*            0757C 0000:757C  50                 push    ax
*            0757D 0000:757D  e9e901             jmp     0x7769
             07580 0000:7580  883f               mov     byte ptr [bx], bh
             07582 0000:7582  54                 push    sp
             07583 0000:7583  ff803f56           inc     word ptr [bx + si + 0x563f]
             07587 0000:7587  ff803f58           inc     word ptr [bx + si + 0x583f]
             0758B 0000:758B  ff803f5a           inc     word ptr [bx + si + 0x5a3f]
             0758F 0000:758F  ff803f5b           inc     word ptr [bx + si + 0x5b3f]
             07593 0000:7593  ff803f5d           inc     word ptr [bx + si + 0x5d3f]
             07597 0000:7597  ff803f5e           inc     word ptr [bx + si + 0x5e3f]
             0759B 0000:759B  ff803f60           inc     word ptr [bx + si + 0x603f]
             0759F 0000:759F  ff803f61           inc     word ptr [bx + si + 0x613f]
             075A3 0000:75A3  ff803f63           inc     word ptr [bx + si + 0x633f]
      075A7 0000:75A7  db   ff
             075A8 0000:75A8  eb3f               jmp     0x75e9
             075AA 0000:75AA  65ffa23f67         jmp     word ptr gs:[bp + si + 0x673f]
      075AF 0000:75AF  db   ff
      075B0 0000:75B0  db   ff
             075B1 0000:75B1  3f                 aas     
             075B2 0000:75B2  68ff80             push    0x80ff
             075B5 0000:75B5  3f                 aas     
             075B6 0000:75B6  6aff               push    -1
             075B8 0000:75B8  803f6c             cmp     byte ptr [bx], 0x6c
             075BB 0000:75BB  ff803f6d           inc     word ptr [bx + si + 0x6d3f]
             075BF 0000:75BF  ff803f6e           inc     word ptr [bx + si + 0x6e3f]
             075C3 0000:75C3  ff803f6f           inc     word ptr [bx + si + 0x6f3f]
             075C7 0000:75C7  ff903f70           call    word ptr [bx + si + 0x703f]
             075CB 0000:75CB  ffa63f72           jmp     word ptr [bp + 0x723f]
             075CF 0000:75CF  ff803f73           inc     word ptr [bx + si + 0x733f]
             075D3 0000:75D3  ff803f74           inc     word ptr [bx + si + 0x743f]
             075D7 0000:75D7  ff873f75           inc     word ptr [bx + 0x753f]
             075DB 0000:75DB  ff9c3f76           lcall   [si + 0x763f]
             075DF 0000:75DF  ffaf3f77           ljmp    [bx + 0x773f]
             075E3 0000:75E3  ffc0               inc     ax
             075E5 0000:75E5  3f                 aas     
             075E6 0000:75E6  78ff               js      0x75e7
             075E8 0000:75E8  803f7a             cmp     byte ptr [bx], 0x7a
*   L_075EB: 075EB 0000:75EB  ff8c3f7c           dec     word ptr [si + 0x7c3f]
*            075EF 0000:75EF  ff8c3f7d           dec     word ptr [si + 0x7d3f]
*            075F3 0000:75F3  ff8a3f7e           dec     word ptr [bp + si + 0x7e3f]
*            075F7 0000:75F7  ff863f7f           inc     word ptr [bp + 0x7f3f]
*            075FB 0000:75FB  ff803f80           inc     word ptr [bx + si - 0x7fc1]
*            075FF 0000:75FF  ff803f81           inc     word ptr [bx + si - 0x7ec1]
*            07603 0000:7603  ff803f82           inc     word ptr [bx + si - 0x7dc1]
*            07607 0000:7607  ff803f83           inc     word ptr [bx + si - 0x7cc1]
*            0760B 0000:760B  ff803f84           inc     word ptr [bx + si - 0x7bc1]
*            0760F 0000:760F  ff803f85           inc     word ptr [bx + si - 0x7ac1]
*            07613 0000:7613  ff803f86           inc     word ptr [bx + si - 0x79c1]
*            07617 0000:7617  ff803f87           inc     word ptr [bx + si - 0x78c1]
*            0761B 0000:761B  ff803f88           inc     word ptr [bx + si - 0x77c1]
*            0761F 0000:761F  ffe7               jmp     di
             07621 0000:7621  3f                 aas     
             07622 0000:7622  89ff               mov     di, di
      07624 0000:7624  db   ff
             07625 0000:7625  3f                 aas     
             07626 0000:7626  8aff               mov     bh, bh
             07628 0000:7628  9c                 pushf   
             07629 0000:7629  3f                 aas     
             0762A 0000:762A  8aff               mov     bh, bh
             0762C 0000:762C  873f               xchg    word ptr [bx], di
             0762E 0000:762E  8bff               mov     di, di
             07630 0000:7630  803f8c             cmp     byte ptr [bx], 0x8c
             07633 0000:7633  ffe4               jmp     sp
             07635 0000:7635  3f                 aas     
      07636 0000:7636  db   8c
             07637 0000:7637  ffca               dec     dx
             07639 0000:7639  3f                 aas     
      0763A 0000:763A  db   8d
             0763B 0000:763B  ffae3f8e           ljmp    [bp - 0x71c1]
             0763F 0000:763F  ff903f8f           call    word ptr [bx + si - 0x70c1]
             07643 0000:7643  ffe0               jmp     ax
             07645 0000:7645  3f                 aas     
             07646 0000:7646  90                 nop     
      07647 0000:7647  db   ff
             07648 0000:7648  bd3f91             mov     bp, 0x913f
             0764B 0000:764B  ff983f92           lcall   [bx + si - 0x6dc1]
             0764F 0000:764F  ff713f             push    word ptr [bx + di + 0x3f]
             07652 0000:7652  93                 xchg    bx, ax
             07653 0000:7653  ff803f94           inc     word ptr [bx + si - 0x6bc1]
             07657 0000:7657  ffe0               jmp     ax
             07659 0000:7659  3f                 aas     
             0765A 0000:765A  95                 xchg    bp, ax
             0765B 0000:765B  ff883f95           dec     word ptr [bx + si - 0x6ac1]
             0765F 0000:765F  ff803f96           inc     word ptr [bx + si - 0x69c1]
             07663 0000:7663  ffc4               inc     sp
             07665 0000:7665  3f                 aas     
             07666 0000:7666  96                 xchg    si, ax
             07667 0000:7667  ff933f97           call    word ptr [bp + di - 0x68c1]
             0766B 0000:766B  ff803f98           inc     word ptr [bx + si - 0x67c1]
             0766F 0000:766F  ffca               dec     dx
             07671 0000:7671  3f                 aas     
             07672 0000:7672  99                 cdq     
             07673 0000:7673  ff8a3f9a           dec     word ptr [bp + si - 0x65c1]
             07677 0000:7677  ff803f9b           inc     word ptr [bx + si - 0x64c1]
*            0767B 0000:767B  ffad3f9b           ljmp    [di - 0x64c1]
             0767F 0000:767F  ff803f9c           inc     word ptr [bx + si - 0x63c1]
             07683 0000:7683  ffc6               inc     si
             07685 0000:7685  44                 inc     sp
             07686 0000:7686  f9                 stc     
      07687 0000:7687  db   f0
*            07688 0000:7688  83c610             add     si, 0x10
*            0768B 0000:768B  83c308             add     bx, 8
*            0768E 0000:768E  3bfe               cmp     di, si
*            07690 0000:7690  75e8               jne     0x767a
*            07692 0000:7692  833e0c1074         cmp     word ptr [0x100c], 0x74   ; RCRAM (road, shared)
*            07697 0000:7697  7716               ja      0x76af
*   L_07699: 07699 0000:7699  f606800301         test    byte ptr [0x380], 1   ; math_ram (shared)
*            0769E 0000:769E  753d               jne     0x76dd
*            076A0 0000:76A0  e97d0b             jmp     0x8220
             076A3 0000:76A3  8b2f               mov     bp, word ptr [bx]
             076A5 0000:76A5  81e5ff07           and     bp, 0x7ff
             076A9 0000:76A9  3bea               cmp     bp, dx
             076AB 0000:76AB  73d7               jae     0x7684
             076AD 0000:76AD  ebd9               jmp     0x7688
*   L_076AF: 076AF 0000:76AF  8b0e4e03           mov     cx, word ptr [0x34e]   ; math_ram (shared)
*            076B3 0000:76B3  a14c03             mov     ax, word ptr [0x34c]   ; math_ram (shared)
*            076B6 0000:76B6  3bf9               cmp     di, cx
*            076B8 0000:76B8  74df               je      0x7699
*            076BA 0000:76BA  8b1e0a03           mov     bx, word ptr [0x30a]   ; math_ram (shared)
*            076BE 0000:76BE  d1e3               shl     bx, 1
*            076C0 0000:76C0  d1e3               shl     bx, 1
*            076C2 0000:76C2  d1e3               shl     bx, 1
*            076C4 0000:76C4  8b97f010           mov     dx, word ptr [bx + 0x10f0]
*            076C8 0000:76C8  81e2ff07           and     dx, 0x7ff
*   L_076CC: 076CC 0000:76CC  83c710             add     di, 0x10
*            076CF 0000:76CF  3bf9               cmp     di, cx
*            076D1 0000:76D1  74c6               je      0x7699
*            076D3 0000:76D3  3905               cmp     word ptr [di], ax
*            076D5 0000:76D5  7ef5               jle     0x76cc
*            076D7 0000:76D7  c645f9f0           mov     byte ptr [di - 7], 0xf0
*            076DB 0000:76DB  ebef               jmp     0x76cc
*   L_076DD: 076DD 0000:76DD  f606800320         test    byte ptr [0x380], 0x20   ; math_ram (shared)
*            076E2 0000:76E2  7528               jne     0x770c
*            076E4 0000:76E4  8b2e1003           mov     bp, word ptr [0x310]   ; math_ram (shared)
*            076E8 0000:76E8  81e5ff07           and     bp, 0x7ff
*            076EC 0000:76EC  8b0e0603           mov     cx, word ptr [0x306]   ; math_ram (shared)
*            076F0 0000:76F0  8bd9               mov     bx, cx
*            076F2 0000:76F2  bf0004             mov     di, 0x400
*            076F5 0000:76F5  803da8             cmp     byte ptr [di], 0xa8
*            076F8 0000:76F8  7418               je      0x7712
*            076FA 0000:76FA  803dac             cmp     byte ptr [di], 0xac
*            076FD 0000:76FD  7413               je      0x7712
*            076FF 0000:76FF  8080007f00         add     byte ptr [bx + si + 0x7f00], 0
*            07704 0000:7704  7e00               jle     0x7706
*   L_07706: 07706 0000:7706  7d00               jge     0x7708
*   L_07708: 07708 0000:7708  7c00               jl      0x770a
*   L_0770A: 0770A 0000:770A  7b00               jnp     0x770c
*   L_0770C: 0770C 0000:770C  7a00               jp      0x770e
*   L_0770E: 0770E 0000:770E  7900               jns     0x7710
*   L_07710: 07710 0000:7710  7800               js      0x7712
*   L_07712: 07712 0000:7712  7700               ja      0x7714
*   L_07714: 07714 0000:7714  7600               jbe     0x7716
*   L_07716: 07716 0000:7716  7500               jne     0x7718
*   L_07718: 07718 0000:7718  7500               jne     0x771a
*   L_0771A: 0771A 0000:771A  7400               je      0x771c
*   L_0771C: 0771C 0000:771C  7300               jae     0x771e
*   L_0771E: 0771E 0000:771E  7200               jb      0x7720
*   L_07720: 07720 0000:7720  7100               jno     0x7722
*   L_07722: 07722 0000:7722  7000               jo      0x7724
*   L_07724: 07724 0000:7724  6f                 outsw   dx, word ptr [si]
*            07725 0000:7725  006e00             add     byte ptr [bp], ch
*            07728 0000:7728  6d                 insw    word ptr es:[di], dx
*            07729 0000:7729  006c00             add     byte ptr [si], ch
*            0772C 0000:772C  6b006a             imul    ax, word ptr [bx + si], 0x6a
*            0772F 0000:772F  006a00             add     byte ptr [bp + si], ch
*            07732 0000:7732  69006800           imul    ax, word ptr [bx + si], 0x68
*            07736 0000:7736  67006600           add     byte ptr [esi], ah
*            0773A 0000:773A  65006400           add     byte ptr gs:[si], ah
*            0773E 0000:773E  6300               arpl    word ptr [bx + si], ax
*            07740 0000:7740  6200               bound   ax, dword ptr [bx + si]
*            07742 0000:7742  61                 popaw   
*            07743 0000:7743  006000             add     byte ptr [bx + si], ah
*            07746 0000:7746  60                 pushaw  
*            07747 0000:7747  005f00             add     byte ptr [bx], bl
*            0774A 0000:774A  5e                 pop     si
*            0774B 0000:774B  005d00             add     byte ptr [di], bl
*            0774E 0000:774E  5c                 pop     sp
*            0774F 0000:774F  005b00             add     byte ptr [bp + di], bl
*            07752 0000:7752  5a                 pop     dx
*            07753 0000:7753  005900             add     byte ptr [bx + di], bl
*            07756 0000:7756  58                 pop     ax
*            07757 0000:7757  005700             add     byte ptr [bx], dl
*            0775A 0000:775A  56                 push    si
*            0775B 0000:775B  005500             add     byte ptr [di], dl
*            0775E 0000:775E  55                 push    bp
*            0775F 0000:775F  005400             add     byte ptr [si], dl
*            07762 0000:7762  53                 push    bx
*            07763 0000:7763  005200             add     byte ptr [bp + si], dl
*            07766 0000:7766  51                 push    cx
*            07767 0000:7767  005000             add     byte ptr [bx + si], dl
*            0776A 0000:776A  4f                 dec     di
*            0776B 0000:776B  004e00             add     byte ptr [bp], cl
*            0776E 0000:776E  4d                 dec     bp
*            0776F 0000:776F  004c00             add     byte ptr [si], cl
*            07772 0000:7772  4b                 dec     bx
*            07773 0000:7773  004a00             add     byte ptr [bp + si], cl
*            07776 0000:7776  4a                 dec     dx
*            07777 0000:7777  004900             add     byte ptr [bx + di], cl
*            0777A 0000:777A  48                 dec     ax
*            0777B 0000:777B  004700             add     byte ptr [bx], al
*            0777E 0000:777E  46                 inc     si
*            0777F 0000:777F  004500             add     byte ptr [di], al
*            07782 0000:7782  44                 inc     sp
*            07783 0000:7783  004300             add     byte ptr [bp + di], al
*            07786 0000:7786  42                 inc     dx
*            07787 0000:7787  004100             add     byte ptr [bx + di], al
*            0778A 0000:778A  40                 inc     ax
*            0778B 0000:778B  004000             add     byte ptr [bx + si], al
*            0778E 0000:778E  3f                 aas     
*            0778F 0000:778F  003e003d           add     byte ptr [0x3d00], bh   ; MATH UNIT (mul/div/geometry)
*            07793 0000:7793  003c               add     byte ptr [si], bh
*            07795 0000:7795  003b               add     byte ptr [bp + di], bh
*            07797 0000:7797  003a               add     byte ptr [bp + si], bh
*            07799 0000:7799  0039               add     byte ptr [bx + di], bh
*            0779B 0000:779B  0038               add     byte ptr [bx + si], bh
*            0779D 0000:779D  0037               add     byte ptr [bx], dh
*            0779F 0000:779F  00360035           add     byte ptr [0x3500], dh   ; MATH UNIT (mul/div/geometry)
*            077A3 0000:77A3  0035               add     byte ptr [di], dh
*            077A5 0000:77A5  0034               add     byte ptr [si], dh
*            077A7 0000:77A7  0033               add     byte ptr [bp + di], dh
*            077A9 0000:77A9  0032               add     byte ptr [bp + si], dh
*            077AB 0000:77AB  0031               add     byte ptr [bx + di], dh
*            077AD 0000:77AD  0030               add     byte ptr [bx + si], dh
*            077AF 0000:77AF  002f               add     byte ptr [bx], ch
*            077B1 0000:77B1  002e002d           add     byte ptr [0x2d00], ch
*            077B5 0000:77B5  002c               add     byte ptr [si], ch
*            077B7 0000:77B7  002b               add     byte ptr [bp + di], ch
*            077B9 0000:77B9  002a               add     byte ptr [bp + si], ch
*            077BB 0000:77BB  002a               add     byte ptr [bp + si], ch
*            077BD 0000:77BD  0029               add     byte ptr [bx + di], ch
*            077BF 0000:77BF  0028               add     byte ptr [bx + si], ch
*            077C1 0000:77C1  0027               add     byte ptr [bx], ah
*            077C3 0000:77C3  00260025           add     byte ptr [0x2500], ah
*            077C7 0000:77C7  0024               add     byte ptr [si], ah
*            077C9 0000:77C9  0023               add     byte ptr [bp + di], ah
*            077CB 0000:77CB  0022               add     byte ptr [bp + si], ah
*            077CD 0000:77CD  0021               add     byte ptr [bx + di], ah
*            077CF 0000:77CF  0020               add     byte ptr [bx + si], ah
*            077D1 0000:77D1  0020               add     byte ptr [bx + si], ah
*            077D3 0000:77D3  001f               add     byte ptr [bx], bl
*            077D5 0000:77D5  001e001d           add     byte ptr [0x1d00], bl   ; RCRAM (road, shared)
*            077D9 0000:77D9  001c               add     byte ptr [si], bl
*            077DB 0000:77DB  001b               add     byte ptr [bp + di], bl
*            077DD 0000:77DD  001a               add     byte ptr [bp + si], bl
*            077DF 0000:77DF  0019               add     byte ptr [bx + di], bl
*            077E1 0000:77E1  0018               add     byte ptr [bx + si], bl
*            077E3 0000:77E3  0017               add     byte ptr [bx], dl
*            077E5 0000:77E5  00160015           add     byte ptr [0x1500], dl   ; RCRAM (road, shared)
*            077E9 0000:77E9  0015               add     byte ptr [di], dl
*            077EB 0000:77EB  0014               add     byte ptr [si], dl
*            077ED 0000:77ED  0013               add     byte ptr [bp + di], dl
*            077EF 0000:77EF  0012               add     byte ptr [bp + si], dl
*            077F1 0000:77F1  0011               add     byte ptr [bx + di], dl
*            077F3 0000:77F3  0010               add     byte ptr [bx + si], dl
*            077F5 0000:77F5  000f               add     byte ptr [bx], cl
*            077F7 0000:77F7  000e000d           add     byte ptr [0xd00], cl   ; SPCS RAM (shared w/main)
*            077FB 0000:77FB  000c               add     byte ptr [si], cl
*            077FD 0000:77FD  000b               add     byte ptr [bp + di], cl
*            077FF 0000:77FF  000a               add     byte ptr [bp + si], cl
*            07801 0000:7801  000a               add     byte ptr [bp + si], cl
*            07803 0000:7803  0000               add     byte ptr [bx + si], al
*            07805 0000:7805  005400             add     byte ptr [si], dl
*            07808 0000:7808  82009e             add     byte ptr [bx + si], 0x9e
*            0780B 0000:780B  00b200c0           add     byte ptr [bp + si - 0x4000], dh
*            0780F 0000:780F  00ca               add     dl, cl
*            07811 0000:7811  00d2               add     dl, dl
*            07813 0000:7813  00da               add     dl, bl
*            07815 0000:7815  00de               add     dh, bl
*            07817 0000:7817  00e4               add     ah, ah
*            07819 0000:7819  00e8               add     al, ch
*            0781B 0000:781B  00ec               add     ah, ch
*            0781D 0000:781D  00f0               add     al, dh
*            0781F 0000:781F  00f4               add     ah, dh
*            07821 0000:7821  00f8               add     al, bh
*            07823 0000:7823  00fa               add     dl, bh
*            07825 0000:7825  00fc               add     ah, bh
*            07827 0000:7827  00fe               add     dh, bh
*            07829 0000:7829  0000               add     byte ptr [bx + si], al
*            0782B 0000:782B  01e2               add     dx, sp
*            0782D 0000:782D  e8f606             call    0x7f26
*            07830 0000:7830  0c03               or      al, 3
*            07832 0000:7832  ff7419             push    word ptr [si + 0x19]
*            07835 0000:7835  c70604030004       mov     word ptr [0x304], 0x400   ; math_ram (shared)
*            0783B 0000:783B  be8011             mov     si, 0x1180
*            0783E 0000:783E  8b14               mov     dx, word ptr [si]
*            07840 0000:7840  d98737fb           fld     dword ptr [bx - 0x4c9]
*            07844 0000:7844  32fd               xor     bh, ch
*            07846 0000:7846  07                 pop     es
*            07847 0000:7847  20e6               and     dh, ah
*            07849 0000:7849  3981fbfe           cmp     word ptr [bx + di - 0x105], ax
      0784D 0000:784D  db   fe
             0784E 0000:784E  bb871f             mov     bx, 0x1f87
             07851 0000:7851  2b07               sub     ax, word ptr [bx]
             07853 0000:7853  fb                 sti     
      07854 0000:7854  db   ff
             07855 0000:7855  fc                 cld     
             07856 0000:7856  ac                 lodsb   al, byte ptr [si]
             07857 0000:7857  eaaf180431         ljmp    0x3104:0x18af
             0785C 0000:785C  4b                 dec     bx
             0785D 0000:785D  0d00f8             or      ax, 0xf800
             07860 0000:7860  01f7               add     di, si
      07862 0000:7862  db   '0123456789ABCDEF\00'
             07873 0000:7873  00ff               add     bh, bh
      07875 0000:7875  db   fe
             07876 0000:7876  55                 push    bp
             07877 0000:7877  aa                 stosb   byte ptr es:[di], al
             07878 0000:7878  0000               add     byte ptr [bx + si], al
             0787A 0000:787A  aa                 stosb   byte ptr es:[di], al
             0787B 0000:787B  55                 push    bp
             0787C 0000:787C  0000               add     byte ptr [bx + si], al
             0787E 0000:787E  0000               add     byte ptr [bx + si], al
             07880 0000:7880  0000               add     byte ptr [bx + si], al
      07882 0000:7882  db   ff
             07883 0000:7883  ff04               inc     word ptr [si]
             07885 0000:7885  10fe               adc     dh, bh
             07887 0000:7887  014300             add     word ptr [bp + di], ax
             0788A 0000:788A  00160005           add     byte ptr [0x500], dl   ; math_ram (shared)
             0788E 0000:788E  43                 inc     bx
             0788F 0000:788F  0002               add     byte ptr [bp + si], al
             07891 0000:7891  20ff               and     bh, bh
             07893 0000:7893  004f00             add     byte ptr [bx], cl
             07896 0000:7896  0a00               or      al, byte ptr [bx + si]
             07898 0000:7898  7501               jne     0x789b
             0789A 0000:789A  50                 push    ax
*            0789B 0000:789B  0000               add     byte ptr [bx + si], al
*            0789D 0000:789D  03800250           add     ax, word ptr [bx + si + 0x5002]
*            078A1 0000:78A1  00828117           add     byte ptr [bp + si + 0x1781], al
*            078A5 0000:78A5  1108               adc     word ptr [bx + si], cx
      078A7 0000:78A7  db   'ERROR PROM  SUM_CHECK'
*            078BC 0000:78BC  88821548           mov     byte ptr [bp + si + 0x4815], al
      078C0 0000:78C0  db   'IGH BYTE    LOW BYTE'
*            078D4 0000:78D4  88831854           mov     byte ptr [bp + di + 0x5418], al
      078D8 0000:78D8  db   'RUE FALSE   TRUE FALSE '
             078EF 0000:78EF  88841758           mov     byte ptr [si + 0x5817], al
      078F3 0000:78F3  db   'XXX         XXXX      '
*            07909 0000:7909  ff82815a           inc     word ptr [bp + si + 0x5a81]
*            0790D 0000:790D  1108               adc     word ptr [bx + si], cx
      0790F 0000:790F  db   'ERROR  _RAM  A=     D=    '
*            07929 0000:7929  0d2031             or      ax, 0x3120
      0792C 0000:792C  db   'ST TEST'
*            07933 0000:7933  0a07               or      al, byte ptr [bx]
      07935 0000:7935  db   '2ND TEST'
*            0793D 0000:793D  0d0a07             or      ax, 0x70a
*            07940 0000:7940  44                 inc     sp
*            07941 0000:7941  41                 inc     cx
*            07942 0000:7942  54                 push    sp
*            07943 0000:7943  41                 inc     cx
*            07944 0000:7944  0a0b               or      cl, byte ptr [bp + di]
*            07946 0000:7946  44                 inc     sp
*            07947 0000:7947  41                 inc     cx
*            07948 0000:7948  54                 push    sp
*            07949 0000:7949  41                 inc     cx
*            0794A 0000:794A  0d2041             or      ax, 0x4120
      0794D 0000:794D  db   'DR  T.   F.   ADR  T.   F.'
*            07967 0000:7967  848308a2           test    byte ptr [bp + di - 0x5df8], al
*            0796B 0000:796B  83ef60             sub     di, 0x60
*            0796E 0000:796E  8281aa1108         add     byte ptr [bx + di + 0x11aa], 8
      07973 0000:7973  db   'ERROR FN_DATA ROM (CHECK SUM)'
             07990 0000:7990  0d0a0b             or      ax, 0xb0a
      07993 0000:7993  db   'HIGH_BYTE LOW_BYTE'
*            079A5 0000:79A5  0d2020             or      ax, 0x2020
      079A8 0000:79A8  db   'ADR-ADR  T.   F.   T.   F.'
*            079C2 0000:79C2  0d0d20             or      ax, 0x200d
      079C5 0000:79C5  db   '0000-07FF'
*            079CE 0000:79CE  0d2030             or      ax, 0x3020
      079D1 0000:79D1  db   '800-0FFF'
*            079D9 0000:79D9  0d2031             or      ax, 0x3120
      079DC 0000:79DC  db   '000-17FF'
*            079E4 0000:79E4  0d2031             or      ax, 0x3120
      079E7 0000:79E7  db   '800-1FFF'
*            079EF 0000:79EF  0d2032             or      ax, 0x3220
      079F2 0000:79F2  db   '000-27FF'
*            079FA 0000:79FA  0d2032             or      ax, 0x3220
      079FD 0000:79FD  db   '800-2FFF'
*            07A05 0000:7A05  0d2033             or      ax, 0x3320
      07A08 0000:7A08  db   '000-37FF'
*            07A10 0000:7A10  0d2033             or      ax, 0x3320
      07A13 0000:7A13  db   '800-3FFF'
*            07A1B 0000:7A1B  98                 cwde    
*            07A1C 0000:7A1C  83a0828121         and     word ptr [bx + si - 0x7e7e], 0x21
*            07A21 0000:7A21  1109               adc     word ptr [bx + di], cx
      07A23 0000:7A23  db   'ERROR ARITH_UNIT'
*            07A33 0000:7A33  0d2053             or      ax, 0x5320
      07A36 0000:7A36  db   'T TRUE FALSE'
*            07A42 0000:7A42  84828281           test    byte ptr [bp + si - 0x7e7e], al
*            07A46 0000:7A46  2011               and     byte ptr [bx + di], dl
*            07A48 0000:7A48  004152             add     byte ptr [bx + di + 0x52], al
      07A4B 0000:7A4B  db   'ITH. CPU SIDE '
             07A59 0000:7A59  0d414c             or      ax, 0x4c41
      07A5C 0000:7A5C  db   'L CHECK END'
*            07A67 0000:7A67  ff00               inc     word ptr [bx + si]
*            07A69 0000:7A69  00aa5555           add     byte ptr [bp + si + 0x5555], ch
*            07A6D 0000:7A6D  aa                 stosb   byte ptr es:[di], al
*            07A6E 0000:7A6E  0020               add     byte ptr [bx + si], ah
*            07A70 0000:7A70  aa                 stosb   byte ptr es:[di], al
*            07A71 0000:7A71  158700             adc     ax, 0x87
*            07A74 0000:7A74  7800               js      0x7a76
*   L_07A76: 07A76 0000:7A76  0004               add     byte ptr [si], al
*            07A78 0000:7A78  a903fd             test    ax, 0xfd03
*            07A7B 0000:7A7B  41                 inc     cx
      07A7C 0000:7A7C  db   ff
      07A7D 0000:7A7D  db   ff
      07A7E 0000:7A7E  db   ff
      07A7F 0000:7A7F  db   ff
      07A80 0000:7A80  db   ff
      07A81 0000:7A81  db   ff
      07A82 0000:7A82  db   ff
             07A83 0000:7A83  ff840c30           inc     word ptr [si + 0x300c]
             07A87 0000:7A87  55                 push    bp
             07A88 0000:7A88  aa                 stosb   byte ptr es:[di], al
             07A89 0000:7A89  8400               test    byte ptr [bx + si], al
             07A8B 0000:7A8B  30aa5504           xor     byte ptr [bp + si + 0x455], ch
             07A8F 0000:7A8F  0e                 push    cs
             07A90 0000:7A90  3055e3             xor     byte ptr [di - 0x1d], dl
             07A93 0000:7A93  040e               add     al, 0xe
             07A95 0000:7A95  307255             xor     byte ptr [bp + si + 0x55], dh
             07A98 0000:7A98  850c               test    word ptr [si], cx
             07A9A 0000:7A9A  3055aa             xor     byte ptr [di - 0x56], dl
             07A9D 0000:7A9D  8502               test    word ptr [bp + si], ax
             07A9F 0000:7A9F  30aa5505           xor     byte ptr [bp + si + 0x555], ch
             07AA3 0000:7AA3  0e                 push    cs
             07AA4 0000:7AA4  30aa1c05           xor     byte ptr [bp + si + 0x51c], ch
             07AA8 0000:7AA8  0e                 push    cs
             07AA9 0000:7AA9  308eaa86           xor     byte ptr [bp - 0x7956], cl
             07AAD 0000:7AAD  0c30               or      al, 0x30
             07AAF 0000:7AAF  5a                 pop     dx
             07AB0 0000:7AB0  5a                 pop     dx
             07AB1 0000:7AB1  8604               xchg    byte ptr [si], al
             07AB3 0000:7AB3  30a5a506           xor     byte ptr [di + 0x6a5], ah
             07AB7 0000:7AB7  0e                 push    cs
             07AB8 0000:7AB8  30c6               xor     dh, al
             07ABA 0000:7ABA  fc                 cld     
             07ABB 0000:7ABB  06                 push    es
             07ABC 0000:7ABC  0e                 push    cs
             07ABD 0000:7ABD  3090e887           xor     byte ptr [bx + si - 0x7818], dl
             07AC1 0000:7AC1  0c30               or      al, 0x30
             07AC3 0000:7AC3  55                 push    bp
             07AC4 0000:7AC4  aa                 stosb   byte ptr es:[di], al
             07AC5 0000:7AC5  870630aa           xchg    word ptr [0xaa30], ax
             07AC9 0000:7AC9  55                 push    bp
             07ACA 0000:7ACA  07                 pop     es
             07ACB 0000:7ACB  0e                 push    cs
             07ACC 0000:7ACC  307119             xor     byte ptr [bx + di + 0x19], dh
             07ACF 0000:7ACF  07                 pop     es
             07AD0 0000:7AD0  0e                 push    cs
             07AD1 0000:7AD1  301e9388           xor     byte ptr [0x8893], bl
             07AD5 0000:7AD5  0c30               or      al, 0x30
             07AD7 0000:7AD7  0010               add     byte ptr [bx + si], dl
             07AD9 0000:7AD9  880c               mov     byte ptr [si], cl
             07ADB 0000:7ADB  307856             xor     byte ptr [bx + si + 0x56], bh
             07ADE 0000:7ADE  8808               mov     byte ptr [bx + si], cl
             07AE0 0000:7AE0  306587             xor     byte ptr [di - 0x79], ah
             07AE3 0000:7AE3  080e3088           or      byte ptr [0x8830], cl
             07AE7 0000:7AE7  ff08               dec     word ptr [bx + si]
             07AE9 0000:7AE9  0e                 push    cs
             07AEA 0000:7AEA  306507             xor     byte ptr [di + 7], ah
             07AED 0000:7AED  890c               mov     word ptr [si], cx
             07AEF 0000:7AEF  3000               xor     byte ptr [bx + si], al
             07AF1 0000:7AF1  02890c30           add     cl, byte ptr [bx + di + 0x300c]
      07AF5 0000:7AF5  db   ff
             07AF6 0000:7AF6  ff890c30           dec     word ptr [bx + di + 0x300c]
             07AFA 0000:7AFA  aa                 stosb   byte ptr es:[di], al
             07AFB 0000:7AFB  55                 push    bp
             07AFC 0000:7AFC  8908               mov     word ptr [bx + si], cx
             07AFE 0000:7AFE  30ff               xor     bh, bh
             07B00 0000:7B00  ff09               dec     word ptr [bx + di]
             07B02 0000:7B02  0e                 push    cs
             07B03 0000:7B03  302a               xor     byte ptr [bp + si], ch
             07B05 0000:7B05  0009               add     byte ptr [bx + di], cl
             07B07 0000:7B07  0e                 push    cs
             07B08 0000:7B08  30aa0190           xor     byte ptr [bp + si - 0x6fff], ch
             07B0C 0000:7B0C  52                 push    dx
             07B0D 0000:7B0D  37                 aaa     
             07B0E 0000:7B0E  55                 push    bp
             07B0F 0000:7B0F  aa                 stosb   byte ptr es:[di], al
             07B10 0000:7B10  1000               adc     byte ptr [bx + si], al
             07B12 0000:7B12  3655               push    bp
             07B14 0000:7B14  aa                 stosb   byte ptr es:[di], al
             07B15 0000:7B15  90                 nop     
             07B16 0000:7B16  0036aa55           add     byte ptr [0x55aa], dh
             07B1A 0000:7B1A  108036aa           adc     byte ptr [bx + si - 0x55ca], al
             07B1E 0000:7B1E  55                 push    bp
             07B1F 0000:7B1F  1180365a           adc     word ptr [bx + si + 0x5a36], ax
             07B23 0000:7B23  a5                 movsw   word ptr es:[di], word ptr [si]
             07B24 0000:7B24  1200               adc     al, byte ptr [bx + si]
             07B26 0000:7B26  36aa               stosb   byte ptr es:[di], al
             07B28 0000:7B28  55                 push    bp
             07B29 0000:7B29  93                 xchg    bx, ax
             07B2A 0000:7B2A  54                 push    sp
             07B2B 0000:7B2B  37                 aaa     
             07B2C 0000:7B2C  b52d               mov     ch, 0x2d
             07B2E 0000:7B2E  93                 xchg    bx, ax
             07B2F 0000:7B2F  003a               add     byte ptr [bp + si], bh
             07B31 0000:7B31  0001               add     byte ptr [bx + di], al
             07B33 0000:7B33  1300               adc     ax, word ptr [bx + si]
             07B35 0000:7B35  36d4b6             aam     0xb6
             07B38 0000:7B38  94                 xchg    sp, ax
             07B39 0000:7B39  0036b52d           add     byte ptr [0x2db5], dh
             07B3D 0000:7B3D  94                 xchg    sp, ax
             07B3E 0000:7B3E  003a               add     byte ptr [bp + si], bh
             07B40 0000:7B40  0002               add     byte ptr [bp + si], al
             07B42 0000:7B42  1400               adc     al, 0
             07B44 0000:7B44  366a5b             push    0x5b
             07B47 0000:7B47  95                 xchg    bp, ax
             07B48 0000:7B48  0036b52d           add     byte ptr [0x2db5], dh
             07B4C 0000:7B4C  95                 xchg    bp, ax
             07B4D 0000:7B4D  003a               add     byte ptr [bp + si], bh
             07B4F 0000:7B4F  0004               add     byte ptr [si], al
             07B51 0000:7B51  150036             adc     ax, 0x3600
             07B54 0000:7B54  b52d               mov     ch, 0x2d
             07B56 0000:7B56  96                 xchg    si, ax
             07B57 0000:7B57  0036b52d           add     byte ptr [0x2db5], dh
             07B5B 0000:7B5B  96                 xchg    si, ax
             07B5C 0000:7B5C  003a               add     byte ptr [bp + si], bh
             07B5E 0000:7B5E  0008               add     byte ptr [bx + si], cl
             07B60 0000:7B60  16                 push    ss
             07B61 0000:7B61  0036da96           add     byte ptr [0x96da], dh
             07B65 0000:7B65  97                 xchg    di, ax
             07B66 0000:7B66  0036b52d           add     byte ptr [0x2db5], dh
             07B6A 0000:7B6A  97                 xchg    di, ax
             07B6B 0000:7B6B  003a               add     byte ptr [bp + si], bh
             07B6D 0000:7B6D  0010               add     byte ptr [bx + si], dl
             07B6F 0000:7B6F  17                 pop     ss
             07B70 0000:7B70  00366d4b           add     byte ptr [0x4b6d], dh
             07B74 0000:7B74  98                 cwde    
             07B75 0000:7B75  0036b52d           add     byte ptr [0x2db5], dh
             07B79 0000:7B79  98                 cwde    
             07B7A 0000:7B7A  003a               add     byte ptr [bp + si], bh
             07B7C 0000:7B7C  0020               add     byte ptr [bx + si], ah
             07B7E 0000:7B7E  1800               sbb     byte ptr [bx + si], al
             07B80 0000:7B80  36b6a5             mov     dh, 0xa5
             07B83 0000:7B83  99                 cdq     
             07B84 0000:7B84  00366815           add     byte ptr [0x1568], dh   ; RCRAM (road, shared)
             07B88 0000:7B88  99                 cdq     
             07B89 0000:7B89  003a               add     byte ptr [bp + si], bh
             07B8B 0000:7B8B  0020               add     byte ptr [bx + si], ah
             07B8D 0000:7B8D  1900               sbb     word ptr [bx + si], ax
             07B8F 0000:7B8F  3ef21b1a           sbb     bx, word ptr ds:[bp + si]
             07B93 0000:7B93  687a00             push    0x7a
             07B96 0000:7B96  009b8036           add     byte ptr [bp + di + 0x3680], bl
             07B9A 0000:7B9A  55                 push    bp
             07B9B 0000:7B9B  aa                 stosb   byte ptr es:[di], al
*   L_07B9C: 07B9C 0000:7B9C  1b6a7a             sbb     bp, word ptr [bp + si + 0x7a]
*            07B9F 0000:7B9F  aa                 stosb   byte ptr es:[di], al
*            07BA0 0000:7BA0  55                 push    bp
*            07BA1 0000:7BA1  9c                 pushf   
*            07BA2 0000:7BA2  0032               add     byte ptr [bp + si], dh
*            07BA4 0000:7BA4  55                 push    bp
*            07BA5 0000:7BA5  aa                 stosb   byte ptr es:[di], al
*            07BA6 0000:7BA6  1c0e               sbb     al, 0xe
*            07BA8 0000:7BA8  3055e3             xor     byte ptr [di - 0x1d], dl
*            07BAB 0000:7BAB  9d                 popf    
*            07BAC 0000:7BAC  54                 push    sp
*            07BAD 0000:7BAD  37                 aaa     
*            07BAE 0000:7BAE  55                 push    bp
*            07BAF 0000:7BAF  aa                 stosb   byte ptr es:[di], al
*            07BB0 0000:7BB0  1d6a7a             sbb     ax, 0x7a6a
*            07BB3 0000:7BB3  aa                 stosb   byte ptr es:[di], al
*            07BB4 0000:7BB4  55                 push    bp
*            07BB5 0000:7BB5  9e                 sahf    
*            07BB6 0000:7BB6  803655aa1e         xor     byte ptr [0xaa55], 0x1e
*            07BBB 0000:7BBB  6a7a               push    0x7a
*            07BBD 0000:7BBD  aa                 stosb   byte ptr es:[di], al
*            07BBE 0000:7BBE  55                 push    bp
*            07BBF 0000:7BBF  1f                 pop     ds
*            07BC0 0000:7BC0  6c                 insb    byte ptr es:[di], dx
*            07BC1 0000:7BC1  7a55               jp      0x7c18
*            07BC3 0000:7BC3  aa                 stosb   byte ptr es:[di], al
*            07BC4 0000:7BC4  200e30aa           and     byte ptr [0xaa30], cl
*            07BC8 0000:7BC8  1ca1               sbb     al, 0xa1
*            07BCA 0000:7BCA  0c30               or      al, 0x30
*            07BCC 0000:7BCC  aa                 stosb   byte ptr es:[di], al
*            07BCD 0000:7BCD  55                 push    bp
*            07BCE 0000:7BCE  a10032             mov     ax, word ptr [0x3200]   ; MATH UNIT (mul/div/geometry)
*            07BD1 0000:7BD1  55                 push    bp
*            07BD2 0000:7BD2  aa                 stosb   byte ptr es:[di], al
*            07BD3 0000:7BD3  210e3055           and     word ptr [0x5530], cx
*            07BD7 0000:7BD7  e322               jcxz    0x7bfb
*            07BD9 0000:7BD9  003ed514           add     byte ptr [0x14d5], bh   ; RCRAM (road, shared)
*            07BDD 0000:7BDD  a38c30             mov     word ptr [0x308c], ax   ; MATH UNIT (mul/div/geometry)
*            07BE0 0000:7BE0  aa                 stosb   byte ptr es:[di], al
*            07BE1 0000:7BE1  55                 push    bp
*            07BE2 0000:7BE2  23707a             and     si, word ptr [bx + si + 0x7a]
*            07BE5 0000:7BE5  aa                 stosb   byte ptr es:[di], al
*            07BE6 0000:7BE6  15246e             adc     ax, 0x6e24
*            07BE9 0000:7BE9  7a00               jp      0x7beb
*   L_07BEB: 07BEB 0000:7BEB  2025               and     byte ptr [di], ah
*            07BED 0000:7BED  0036b542           add     byte ptr [0x42b5], dh
*            07BF1 0000:7BF1  26803ec21c27       cmp     byte ptr es:[0x1cc2], 0x27   ; RCRAM (road, shared)
      07BF7 0000:7BF7  db   8e
             07BF8 0000:7BF8  309f0928           xor     byte ptr [bx + 0x2809], bl
             07BFC 0000:7BFC  8036994029         xor     byte ptr [0x4099], 0x29
             07C01 0000:7C01  8036402d2a         xor     byte ptr [0x2d40], 0x2a
             07C06 0000:7C06  003c               add     byte ptr [si], bh
             07C08 0000:7C08  f4                 hlt     
*            07C09 0000:7C09  5c                 pop     sp
*            07C0A 0000:7C0A  2b00               sub     ax, word ptr [bx + si]
*            07C0C 0000:7C0C  36f4               hlt     
             07C0E 0000:7C0E  5c                 pop     sp
             07C0F 0000:7C0F  ac                 lodsb   al, byte ptr [si]
             07C10 0000:7C10  0c30               or      al, 0x30
             07C12 0000:7C12  aa                 stosb   byte ptr es:[di], al
             07C13 0000:7C13  55                 push    bp
             07C14 0000:7C14  2c80               sub     al, 0x80
             07C16 0000:7C16  3aff               cmp     bh, bh
*   L_07C18: 07C18 0000:7C18  ff2d               ljmp    [di]
             07C1A 0000:7C1A  0e                 push    cs
             07C1B 0000:7C1B  30ff               xor     bh, bh
             07C1D 0000:7C1D  ff2e0e30           ljmp    [0x300e]   ; MATH UNIT (mul/div/geometry)
             07C21 0000:7C21  56                 push    si
             07C22 0000:7C22  aa                 stosb   byte ptr es:[di], al
             07C23 0000:7C23  af                 scasw   ax, word ptr es:[di]
             07C24 0000:7C24  00360000           add     byte ptr [0], dh   ; math_ram (shared)
             07C28 0000:7C28  2f                 das     
             07C29 0000:7C29  0040bc             add     byte ptr [bx + si - 0x44], al
             07C2C 0000:7C2C  0030               add     byte ptr [bx + si], dh
             07C2E 0000:7C2E  00360000           add     byte ptr [0], dh   ; math_ram (shared)
             07C32 0000:7C32  c00c31             ror     byte ptr [si], 0x31
             07C35 0000:7C35  7800               js      0x7c37
*            07C37 0000:7C37  c08c30703f         ror     byte ptr [si + 0x7030], 0x3f
*            07C3C 0000:7C3C  40                 inc     ax
*            07C3D 0000:7C3D  80368700c1         xor     byte ptr [0x87], 0xc1   ; math_ram (shared)
*            07C42 0000:7C42  8036200041         xor     byte ptr [0x20], 0x41   ; math_ram (shared)
*            07C47 0000:7C47  80360001c2         xor     byte ptr [0x100], 0xc2   ; math_ram (shared)
*            07C4C 0000:7C4C  80363f5342         xor     byte ptr [0x533f], 0x42
*            07C51 0000:7C51  0e                 push    cs
*            07C52 0000:7C52  305800             xor     byte ptr [bx + si], bl
*            07C55 0000:7C55  c3                 ret     
             07C56 0000:7C56  5c                 pop     sp
             07C57 0000:7C57  3120               xor     word ptr [bx + si], sp
             07C59 0000:7C59  004372             add     byte ptr [bp + di + 0x72], al
             07C5C 0000:7C5C  7a87               jp      0x7be5
             07C5E 0000:7C5E  004400             add     byte ptr [si], al
             07C61 0000:7C61  37                 aaa     
             07C62 0000:7C62  8000c5             add     byte ptr [bx + si], 0xc5
             07C65 0000:7C65  0c30               or      al, 0x30
             07C67 0000:7C67  cc                 int3    
             07C68 0000:7C68  00c5               add     ch, al
             07C6A 0000:7C6A  0030               add     byte ptr [bx + si], dh
             07C6C 0000:7C6C  7400               je      0x7c6e
*            07C6E 0000:7C6E  45                 inc     bp
      07C6F 0000:7C6F  db   8e
             07C70 0000:7C70  3000               xor     byte ptr [bx + si], al
             07C72 0000:7C72  004674             add     byte ptr [bp + 0x74], al
             07C75 0000:7C75  7a78               jp      0x7cef
             07C77 0000:7C77  00c7               add     bh, al
      07C79 0000:7C79  db   8c
             07C7A 0000:7C7A  3000               xor     byte ptr [bx + si], al
             07C7C 0000:7C7C  00470e             add     byte ptr [bx + 0xe], al
             07C7F 0000:7C7F  30c5               xor     ch, al
             07C81 0000:7C81  00c8               add     al, cl
             07C83 0000:7C83  0c30               or      al, 0x30
             07C85 0000:7C85  7400               je      0x7c87
*            07C87 0000:7C87  c800308c           enter   0x3000, -0x74
*            07C8B 0000:7C8B  00481e             add     byte ptr [bx + si + 0x1e], cl
*            07C8E 0000:7C8E  3100               xor     word ptr [bx + si], ax
*            07C90 0000:7C90  00c9               add     cl, cl
*            07C92 0000:7C92  0c30               or      al, 0x30
*            07C94 0000:7C94  44                 inc     sp
*            07C95 0000:7C95  02c9               add     cl, cl
      07C97 0000:7C97  db   8c
             07C98 0000:7C98  3000               xor     byte ptr [bx + si], al
             07C9A 0000:7C9A  00490e             add     byte ptr [bx + di + 0xe], cl
             07C9D 0000:7C9D  301c               xor     byte ptr [si], bl
             07C9F 0000:7C9F  00ca               add     dl, cl
             07CA1 0000:7CA1  2437               and     al, 0x37
             07CA3 0000:7CA3  0c00               or      al, 0
             07CA5 0000:7CA5  ca0030             retf    0x3000
             07CA8 0000:7CA8  7800               js      0x7caa
*            07CAA 0000:7CAA  4a                 dec     dx
*            07CAB 0000:7CAB  0e                 push    cs
*            07CAC 0000:7CAC  307c00             xor     byte ptr [si], bh
*            07CAF 0000:7CAF  cb                 retf    
             07CB0 0000:7CB0  2837               sub     byte ptr [bx], dh
             07CB2 0000:7CB2  2300               and     ax, word ptr [bx + si]
             07CB4 0000:7CB4  4b                 dec     bx
             07CB5 0000:7CB5  803e55004c         cmp     byte ptr [0x55], 0x4c   ; math_ram (shared)
             07CBA 0000:7CBA  003e4500           add     byte ptr [0x45], bh   ; math_ram (shared)
             07CBE 0000:7CBE  cd00               int     0
             07CC0 0000:7CC0  36a2fccd           mov     byte ptr ss:[0xcdfc], al
             07CC4 0000:7CC4  3c31               cmp     al, 0x31
             07CC6 0000:7CC6  1801               sbb     byte ptr [bx + di], al
             07CC8 0000:7CC8  cd8c               int     0x8c
             07CCA 0000:7CCA  3042ff             xor     byte ptr [bp + si - 1], al
             07CCD 0000:7CCD  4d                 dec     bp
             07CCE 0000:7CCE  0e                 push    cs
             07CCF 0000:7CCF  307e00             xor     byte ptr [bp], bh
             07CD2 0000:7CD2  ce                 into    
             07CD3 0000:7CD3  2c31               sub     al, 0x31
             07CD5 0000:7CD5  40                 inc     ax
             07CD6 0000:7CD6  00ce               add     dh, cl
      07CD8 0000:7CD8  db   8c
             07CD9 0000:7CD9  30f8               xor     al, bh
             07CDB 0000:7CDB  004e0e             add     byte ptr [bp + 0xe], cl
             07CDE 0000:7CDE  308000cf           xor     byte ptr [bx + si - 0x3100], al
             07CE2 0000:7CE2  0c30               or      al, 0x30
             07CE4 0000:7CE4  61                 popaw   
             07CE5 0000:7CE5  02cf               add     cl, bh
             07CE7 0000:7CE7  3031               xor     byte ptr [bx + di], dh
             07CE9 0000:7CE9  0020               add     byte ptr [bx + si], ah
             07CEB 0000:7CEB  4f                 dec     di
             07CEC 0000:7CEC  80364c00d0         xor     byte ptr [0x4c], 0xd0   ; math_ram (shared)
*            07CF1 0000:7CF1  0c30               or      al, 0x30
*            07CF3 0000:7CF3  0f00d0             lldt    ax
*            07CF6 0000:7CF6  0830               or      byte ptr [bx + si], dh
*            07CF8 0000:7CF8  40                 inc     ax
*            07CF9 0000:7CF9  e450               in      al, 0x50
*            07CFB 0000:7CFB  0e                 push    cs
*            07CFC 0000:7CFC  3011               xor     byte ptr [bx + di], dl
*            07CFE 0000:7CFE  01517a             add     word ptr [bx + di + 0x7a], dx
*            07D01 0000:7D01  7afd               jp      0x7d00
*            07D03 0000:7D03  41                 inc     cx
*            07D04 0000:7D04  d24037             rol     byte ptr [bx + si + 0x37], cl
*            07D07 0000:7D07  0e                 push    cs
*            07D08 0000:7D08  015276             add     word ptr [bp + si + 0x76], dx
*            07D0B 0000:7D0B  7a00               jp      0x7d0d
*   L_07D0D: 07D0D 0000:7D0D  0453               add     al, 0x53
*            07D0F 0000:7D0F  787a               js      0x7d8b
*            07D11 0000:7D11  a903d4             test    ax, 0xd403
*            07D14 0000:7D14  803200             xor     byte ptr [bp + si], 0
*            07D17 0000:7D17  085400             or      byte ptr [si], dl
*            07D1A 0000:7D1A  3e52               push    dx
*            07D1C 0000:7D1C  ffd5               call    bp
*            07D1E 0000:7D1E  80361e0055         xor     byte ptr [0x1e], 0x55   ; math_ram (shared)
*            07D23 0000:7D23  8036cdff56         xor     byte ptr [0xffcd], 0x56
*            07D28 0000:7D28  0036f0ff           add     byte ptr [0xfff0], dh
*            07D2C 0000:7D2C  d7                 xlatb   
*            07D2D 0000:7D2D  4c                 dec     sp
*            07D2E 0000:7D2E  319100d7           xor     word ptr [bx + di - 0x2900], dx
*            07D32 0000:7D32  8036000357         xor     byte ptr [0x300], 0x57   ; math_ram (shared)
*            07D37 0000:7D37  80365e01d8         xor     byte ptr [0x15e], 0xd8   ; math_ram (shared)
*            07D3C 0000:7D3C  8036d500d8         xor     byte ptr [0xd5], 0xd8   ; math_ram (shared)
*            07D41 0000:7D41  0437               add     al, 0x37
*            07D43 0000:7D43  0200               add     al, byte ptr [bx + si]
*            07D45 0000:7D45  58                 pop     ax
*            07D46 0000:7D46  00361500           add     byte ptr [0x15], dh   ; math_ram (shared)
*            07D4A 0000:7D4A  d900               fld     dword ptr [bx + si]
*            07D4C 0000:7D4C  368600             xchg    byte ptr ss:[bx + si], al
*            07D4F 0000:7D4F  d97c31             fnstcw  word ptr [si + 0x31]
*            07D52 0000:7D52  1300               adc     ax, word ptr [bx + si]
*            07D54 0000:7D54  59                 pop     cx
*            07D55 0000:7D55  0e                 push    cs
*            07D56 0000:7D56  30f2               xor     dl, dh
*            07D58 0000:7D58  09da               or      dx, bx
*            07D5A 0000:7D5A  0c30               or      al, 0x30
*            07D5C 0000:7D5C  1000               adc     byte ptr [bx + si], al
*            07D5E 0000:7D5E  da20               fisub   dword ptr [bx + si]
*   L_07D60: 07D60 0000:7D60  311c               xor     word ptr [si], bx
*            07D62 0000:7D62  015a0e             add     word ptr [bp + si + 0xe], bx
*            07D65 0000:7D65  30c0               xor     al, al
*            07D67 0000:7D67  11ff               adc     di, di
*            07D69 0000:7D69  ff22               jmp     word ptr [bp + si]
             07D6B 0000:7D6B  ed                 in      ax, dx
             07D6C 0000:7D6C  7902               jns     0x7d70
             07D6E 0000:7D6E  f7d8               neg     ax
*            07D70 0000:7D70  8be8               mov     bp, ax
*            07D72 0000:7D72  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            07D75 0000:7D75  a11c10             mov     ax, word ptr [0x101c]   ; RCRAM (road, shared)
*            07D78 0000:7D78  057000             add     ax, 0x70
*            07D7B 0000:7D7B  a30230             mov     word ptr [0x3002], ax   ; MATH UNIT (mul/div/geometry)
*            07D7E 0000:7D7E  81c38002           add     bx, 0x280
*            07D82 0000:7D82  33c9               xor     cx, cx
*            07D84 0000:7D84  d1e3               shl     bx, 1
*            07D86 0000:7D86  d1d1               rcl     cx, 1
*            07D88 0000:7D88  8b160e30           mov     dx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            07D8C 0000:7D8C  d1e3               shl     bx, 1
*            07D8E 0000:7D8E  d1d1               rcl     cx, 1
*            07D90 0000:7D90  d1e3               shl     bx, 1
*            07D92 0000:7D92  d1d1               rcl     cx, 1
*            07D94 0000:7D94  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            07D97 0000:7D97  d1e3               shl     bx, 1
*            07D99 0000:7D99  d1d1               rcl     cx, 1
*            07D9B 0000:7D9B  d1e3               shl     bx, 1
*            07D9D 0000:7D9D  d1d1               rcl     cx, 1
*            07D9F 0000:7D9F  03c3               add     ax, bx
*            07DA1 0000:7DA1  13d1               adc     dx, cx
*            07DA3 0000:7DA3  ab                 stosw   word ptr es:[di], ax
*            07DA4 0000:7DA4  8915               mov     word ptr [di], dx
*            07DA6 0000:7DA6  83c704             add     di, 4
*            07DA9 0000:7DA9  8bc5               mov     ax, bp
*            07DAB 0000:7DAB  ab                 stosw   word ptr es:[di], ax
*            07DAC 0000:7DAC  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            07DAF 0000:7DAF  a30c30             mov     word ptr [0x300c], ax   ; MATH UNIT (mul/div/geometry)
*            07DB2 0000:7DB2  c7060c300020       mov     word ptr [0x300c], 0x2000   ; MATH UNIT (mul/div/geometry)
*            07DB8 0000:7DB8  a30830             mov     word ptr [0x3008], ax   ; MATH UNIT (mul/div/geometry)
*            07DBB 0000:7DBB  99                 cdq     
*            07DBC 0000:7DBC  8915               mov     word ptr [di], dx
*            07DBE 0000:7DBE  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            07DC1 0000:7DC1  d1e0               shl     ax, 1
*            07DC3 0000:7DC3  a38c03             mov     word ptr [0x38c], ax   ; math_ram (shared)
*            07DC6 0000:7DC6  e9d3fd             jmp     0x7b9c
             07DC9 0000:7DC9  a10610             mov     ax, word ptr [0x1006]   ; RCRAM (road, shared)
             07DCC 0000:7DCC  8bf0               mov     si, ax
             07DCE 0000:7DCE  d1e0               shl     ax, 1
             07DD0 0000:7DD0  d1e0               shl     ax, 1
             07DD2 0000:7DD2  03f0               add     si, ax
             07DD4 0000:7DD4  81c600dc           add     si, 0xdc00
             07DD8 0000:7DD8  a10410             mov     ax, word ptr [0x1004]   ; RCRAM (road, shared)
             07DDB 0000:7DDB  bb3010             mov     bx, 0x1030
             07DDE 0000:7DDE  22dc               and     bl, ah
             07DE0 0000:7DE0  2afb               sub     bh, bl
             07DE2 0000:7DE2  80e730             and     bh, 0x30
             07DE5 0000:7DE5  32db               xor     bl, bl
             07DE7 0000:7DE7  03c3               add     ax, bx
             07DE9 0000:7DE9  80e43f             and     ah, 0x3f
             07DEC 0000:7DEC  a37803             mov     word ptr [0x378], ax   ; math_ram (shared)
             07DEF 0000:7DEF  891e7a03           mov     word ptr [0x37a], bx   ; math_ram (shared)
             07DF3 0000:7DF3  8bbc0080           mov     di, word ptr [si - 0x8000]
             07DF7 0000:7DF7  035c08             add     bx, word ptr [si + 8]
             07DFA 0000:7DFA  80e73f             and     bh, 0x3f
             07DFD 0000:7DFD  2bc3               sub     ax, bx
             07DFF 0000:7DFF  80e43f             and     ah, 0x3f
             07E02 0000:7E02  a34037             mov     word ptr [0x3740], ax   ; MATH UNIT (mul/div/geometry)
             07E05 0000:7E05  8b840480           mov     ax, word ptr [si - 0x7ffc]
             07E09 0000:7E09  d1e0               shl     ax, 1
             07E0B 0000:7E0B  8b9c0680           mov     bx, word ptr [si - 0x7ffa]
             07E0F 0000:7E0F  a38032             mov     word ptr [0x3280], ax   ; MATH UNIT (mul/div/geometry)
             07E12 0000:7E12  d1d7               rcl     di, 1
             07E14 0000:7E14  d1d7               rcl     di, 1
             07E16 0000:7E16  a1003e             mov     ax, word ptr [0x3e00]   ; MATH UNIT (mul/div/geometry)
             07E19 0000:7E19  8b1e0e30           mov     bx, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
             07E1D 0000:7E1D  7302               jae     0x7e21
             07E1F 0000:7E1F  f7d8               neg     ax
*            07E21 0000:7E21  a37e03             mov     word ptr [0x37e], ax   ; math_ram (shared)
*            07E24 0000:7E24  891e7c03           mov     word ptr [0x37c], bx   ; math_ram (shared)
*            07E28 0000:7E28  bfa403             mov     di, 0x3a4
*            07E2B 0000:7E2B  b90800             mov     cx, 8
*            07E2E 0000:7E2E  a17e03             mov     ax, word ptr [0x37e]   ; math_ram (shared)
*            07E31 0000:7E31  a30036             mov     word ptr [0x3600], ax   ; MATH UNIT (mul/div/geometry)
*            07E34 0000:7E34  bdf0ff             mov     bp, 0xfff0
*            07E37 0000:7E37  fc                 cld     
*            07E38 0000:7E38  ad                 lodsw   ax, word ptr [si]
*            07E39 0000:7E39  8bd8               mov     bx, ax
*            07E3B 0000:7E3B  03067a03           add     ax, word ptr [0x37a]   ; math_ram (shared)
*            07E3F 0000:7E3F  80e43f             and     ah, 0x3f
*            07E42 0000:7E42  2b067803           sub     ax, word ptr [0x378]   ; math_ram (shared)
*            07E46 0000:7E46  d1e0               shl     ax, 1
*            07E48 0000:7E48  a33c31             mov     word ptr [0x313c], ax   ; MATH UNIT (mul/div/geometry)
*            07E4B 0000:7E4B  ad                 lodsw   ax, word ptr [si]
*            07E4C 0000:7E4C  2b067c03           sub     ax, word ptr [0x37c]   ; math_ram (shared)
*            07E50 0000:7E50  d1e0               shl     ax, 1
*            07E52 0000:7E52  a38c30             mov     word ptr [0x308c], ax   ; MATH UNIT (mul/div/geometry)
*            07E55 0000:7E55  ad                 lodsw   ax, word ptr [si]
*            07E56 0000:7E56  8bd0               mov     dx, ax
*            07E58 0000:7E58  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            07E5B 0000:7E5B  3bc5               cmp     ax, bp
*            07E5D 0000:7E5D  7c63               jl      0x7ec2
*            07E5F 0000:7E5F  8be8               mov     bp, ax
*            07E61 0000:7E61  80e7c0             and     bh, 0xc0
*            07E64 0000:7E64  0ae7               or      ah, bh
*            07E66 0000:7E66  ab                 stosw   word ptr es:[di], ax
*            07E67 0000:7E67  d0d7               rcl     bh, 1
*            07E69 0000:7E69  7304               jae     0x7e6f
*            07E6B 0000:7E6B  2b167e03           sub     dx, word ptr [0x37e]   ; math_ram (shared)
*   L_07E6F: 07E6F 0000:7E6F  ad                 lodsw   ax, word ptr [si]
*            07E70 0000:7E70  2b067c03           sub     ax, word ptr [0x37c]   ; math_ram (shared)
*            07E74 0000:7E74  d1e0               shl     ax, 1
*            07E76 0000:7E76  a32c31             mov     word ptr [0x312c], ax   ; MATH UNIT (mul/div/geometry)
*            07E79 0000:7E79  8bd8               mov     bx, ax
*            07E7B 0000:7E7B  ad                 lodsw   ax, word ptr [si]
*            07E7C 0000:7E7C  03067a03           add     ax, word ptr [0x37a]   ; math_ram (shared)
*            07E80 0000:7E80  25ff3f             and     ax, 0x3fff
*            07E83 0000:7E83  2b067803           sub     ax, word ptr [0x378]   ; math_ram (shared)
*            07E87 0000:7E87  d1e0               shl     ax, 1
*            07E89 0000:7E89  a38c30             mov     word ptr [0x308c], ax   ; MATH UNIT (mul/div/geometry)
*            07E8C 0000:7E8C  92                 xchg    dx, ax
*            07E8D 0000:7E8D  ab                 stosw   word ptr es:[di], ax
*            07E8E 0000:7E8E  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            07E91 0000:7E91  89163c31           mov     word ptr [0x313c], dx   ; MATH UNIT (mul/div/geometry)
*            07E95 0000:7E95  03060810           add     ax, word ptr [0x1008]   ; RCRAM (road, shared)
*            07E99 0000:7E99  891e8c30           mov     word ptr [0x308c], bx   ; MATH UNIT (mul/div/geometry)
*            07E9D 0000:7E9D  ab                 stosw   word ptr es:[di], ax
*            07E9E 0000:7E9E  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            07EA1 0000:7EA1  ab                 stosw   word ptr es:[di], ax
*            07EA2 0000:7EA2  e294               loop    0x7e38
*   L_07EA4: 07EA4 0000:7EA4  c70500c0           mov     word ptr [di], 0xc000
*            07EA8 0000:7EA8  fc                 cld     
*            07EA9 0000:7EA9  be00f4             mov     si, 0xf400
*            07EAC 0000:7EAC  bf0018             mov     di, 0x1800
*            07EAF 0000:7EAF  033e7203           add     di, word ptr [0x372]   ; math_ram (shared)
*            07EB3 0000:7EB3  bd9c03             mov     bp, 0x39c
*            07EB6 0000:7EB6  b94000             mov     cx, 0x40
*            07EB9 0000:7EB9  c7068a030000       mov     word ptr [0x38a], 0   ; math_ram (shared)
*            07EBF 0000:7EBF  e99600             jmp     0x7f58
*   L_07EC2: 07EC2 0000:7EC2  c70500c0           mov     word ptr [di], 0xc000
*            07EC6 0000:7EC6  83c708             add     di, 8
*            07EC9 0000:7EC9  e2f7               loop    0x7ec2
*            07ECB 0000:7ECB  ebd7               jmp     0x7ea4
*   L_07ECD: 07ECD 0000:7ECD  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            07ED0 0000:7ED0  8bd8               mov     bx, ax
*            07ED2 0000:7ED2  d0e3               shl     bl, 1
*            07ED4 0000:7ED4  d0e3               shl     bl, 1
*            07ED6 0000:7ED6  d0e3               shl     bl, 1
*            07ED8 0000:7ED8  a10e30             mov     ax, word ptr [0x300e]   ; MATH UNIT (mul/div/geometry)
*            07EDB 0000:7EDB  d1c0               rol     ax, 1
*            07EDD 0000:7EDD  d1c0               rol     ax, 1
*            07EDF 0000:7EDF  d1c0               rol     ax, 1
*            07EE1 0000:7EE1  2407               and     al, 7
*            07EE3 0000:7EE3  0ac3               or      al, bl
*            07EE5 0000:7EE5  86c4               xchg    ah, al
*            07EE7 0000:7EE7  a30036             mov     word ptr [0x3600], ax   ; MATH UNIT (mul/div/geometry)
*            07EEA 0000:7EEA  eb4a               jmp     0x7f36
             07EEC 0000:7EEC  8b168203           mov     dx, word ptr [0x382]   ; math_ram (shared)
             07EF0 0000:7EF0  8b45fc             mov     ax, word ptr [di - 4]
             07EF3 0000:7EF3  8bd8               mov     bx, ax
             07EF5 0000:7EF5  8b45f8             mov     ax, word ptr [di - 8]
             07EF8 0000:7EF8  2bc3               sub     ax, bx
             07EFA 0000:7EFA  93                 xchg    bx, ax
             07EFB 0000:7EFB  2bc3               sub     ax, bx
             07EFD 0000:7EFD  52                 push    dx
             07EFE 0000:7EFE  8905               mov     word ptr [di], ax
             07F00 0000:7F00  83c704             add     di, 4
             07F03 0000:7F03  e2f6               loop    0x7efb
             07F05 0000:7F05  e9bc00             jmp     0x7fc4
*   L_07F08: 07F08 0000:7F08  8b04               mov     ax, word ptr [si]
*            07F0A 0000:7F0A  8b54fc             mov     dx, word ptr [si - 4]
*            07F0D 0000:7F0D  2bc2               sub     ax, dx
*            07F0F 0000:7F0F  a34c31             mov     word ptr [0x314c], ax   ; MATH UNIT (mul/div/geometry)
*            07F12 0000:7F12  8a5efb             mov     bl, byte ptr [bp - 5]
*            07F15 0000:7F15  32ff               xor     bh, bh
*            07F17 0000:7F17  d1e3               shl     bx, 1
*            07F19 0000:7F19  8b8704f5           mov     ax, word ptr [bx - 0xafc]
*            07F1D 0000:7F1D  8bd8               mov     bx, ax
*            07F1F 0000:7F1F  f746f80040         test    word ptr [bp - 8], 0x4000
*            07F24 0000:7F24  7502               jne     0x7f28
*   L_07F26: 07F26 0000:7F26  f7d8               neg     ax
*   L_07F28: 07F28 0000:7F28  a38036             mov     word ptr [0x3680], ax   ; MATH UNIT (mul/div/geometry)
*            07F2B 0000:7F2B  a38203             mov     word ptr [0x382], ax   ; math_ram (shared)
*            07F2E 0000:7F2E  8bd0               mov     dx, ax
*            07F30 0000:7F30  81fb8003           cmp     bx, 0x380
*            07F34 0000:7F34  7397               jae     0x7ecd
*   L_07F36: 07F36 0000:7F36  a18403             mov     ax, word ptr [0x384]   ; math_ram (shared)
*            07F39 0000:7F39  01068036           add     word ptr [0x3680], ax   ; MATH UNIT (mul/div/geometry)
*            07F3D 0000:7F3D  d1e1               shl     cx, 1
*            07F3F 0000:7F3F  890e0437           mov     word ptr [0x3704], cx   ; MATH UNIT (mul/div/geometry)
*            07F43 0000:7F43  d1f9               sar     cx, 1
*            07F45 0000:7F45  52                 push    dx
*            07F46 0000:7F46  a08b03             mov     al, byte ptr [0x38b]   ; math_ram (shared)
*            07F49 0000:7F49  98                 cwde    
*            07F4A 0000:7F4A  03060036           add     ax, word ptr [0x3600]   ; MATH UNIT (mul/div/geometry)
*            07F4E 0000:7F4E  8905               mov     word ptr [di], ax
*            07F50 0000:7F50  83c704             add     di, 4
*            07F53 0000:7F53  e297               loop    0x7eec
*            07F55 0000:7F55  eb6d               jmp     0x7fc4
             07F57 0000:7F57  90                 nop     
*   L_07F58: 07F58 0000:7F58  bc801a             mov     sp, 0x1a80
*            07F5B 0000:7F5B  03267203           add     sp, word ptr [0x372]   ; math_ram (shared)
*   L_07F5F: 07F5F 0000:7F5F  83c508             add     bp, 8
*            07F62 0000:7F62  8b860008           mov     ax, word ptr [bp + 0x800]
*            07F66 0000:7F66  8af4               mov     dh, ah
*            07F68 0000:7F68  80fcc0             cmp     ah, 0xc0
*            07F6B 0000:7F6B  749b               je      0x7f08
*            07F6D 0000:7F6D  3df0ff             cmp     ax, 0xfff0
*            07F70 0000:7F70  73ed               jae     0x7f5f
*            07F72 0000:7F72  25ff3f             and     ax, 0x3fff
*            07F75 0000:7F75  3b04               cmp     ax, word ptr [si]
*            07F77 0000:7F77  76e6               jbe     0x7f5f
*            07F79 0000:7F79  8b04               mov     ax, word ptr [si]
*            07F7B 0000:7F7B  83c604             add     si, 4
*            07F7E 0000:7F7E  2b46e0             sub     ax, word ptr [bp - 0x20]
*            07F81 0000:7F81  2400               and     al, 0
      07F83 0000:7F83  db   '$ $B$'
             07F88 0000:7F88  0224               add     ah, byte ptr [si]
             07F8A 0000:7F8A  2224               and     ah, byte ptr [si]
             07F8C 0000:7F8C  a02460             mov     al, byte ptr [0x6024]
*            07F8F 0000:7F8F  2482               and     al, 0x82
*            07F91 0000:7F91  2462               and     al, 0x62
*            07F93 0000:7F93  24c0               and     al, 0xc0
      07F95 0000:7F95  db   '$0123456789ABCDEF'
*            07FA6 0000:7FA6  82801e1108         add     byte ptr [bx + si + 0x111e], 8
      07FAB 0000:7FAB  db   'ERROR RAM  ADR T.DATA F.DATA'
*            07FC7 0000:7FC7  96                 xchg    si, ax
*            07FC8 0000:7FC8  8104a481           add     word ptr [si], 0x81a4
*            07FCC 0000:7FCC  04b2               add     al, 0xb2
*            07FCE 0000:7FCE  81040000           add     word ptr [si], 0
*            07FD2 0000:7FD2  2000               and     byte ptr [bx + si], al
*            07FD4 0000:7FD4  0000               add     byte ptr [bx + si], al
*            07FD6 0000:7FD6  fa                 cli     
*            07FD7 0000:7FD7  2e8e1e0200         mov     ds, word ptr cs:[2]   ; math_ram (shared)
*            07FDC 0000:7FDC  ea000000fc         ljmp    0xfc00:0
             07FE1 0000:7FE1  f7d5               not     bp
             07FE3 0000:7FE3  892f               mov     word ptr [bx], bp
             07FE5 0000:7FE5  8b07               mov     ax, word ptr [bx]
             07FE7 0000:7FE7  3bc5               cmp     ax, bp
             07FE9 0000:7FE9  7403               je      0x7fee
             07FEB 0000:7FEB  e94901             jmp     0x8137
*            07FEE 0000:7FEE  83c3ea             add     bx, -0x16
*            07FF1 0000:7FF1  06                 push    es
*            07FF2 0000:7FF2  00fd               add     ch, bh
*            07FF4 0000:7FF4  ff00               inc     word ptr [bx + si]
*            07FF6 0000:7FF6  80b9060050         cmp     byte ptr [bx + di + 6], 0x50
*            07FFB 0000:7FFB  40                 inc     ax
*            07FFC 0000:7FFC  e2fc               loop    0x7ffa
*            07FFE 0000:7FFE  8bd8               mov     bx, ax