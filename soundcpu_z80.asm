; **************************************************************************
; * SOUND CPU (Zilog Z80)
; * Buggy Boy Junior / Speed Buggy (Tatsumi, 1986) -- static disassembly 2026-08-01
; * map: 0000-1FFF ROM | 3000-37FF RAM | 4000 INTREQ | 5000 i8255 PPI
; *      6000 i8253 PIT | 7000 PPI latch | B000 shared mailbox (<-main CPU)
; * 2x AY-3-8910 PSG + discrete engine/skid LFSR synthesis.
; * cols: [*]=reachable  addr  bytes  mnemonic
; **************************************************************************
*  L_0000: 0000  ed56       IM 1
*          0002  c36700     JP 0x0067
           0005  00         NOP
           0006  00         NOP
           0007  00         NOP
*          0008  00         NOP
*          0009  00         NOP
*          000A  00         NOP
*          000B  00         NOP
*          000C  00         NOP
*          000D  00         NOP
*          000E  00         NOP
*          000F  00         NOP
*          0010  85         ADD A,L
*          0011  6f         LD L,A
*          0012  3e00       LD A,0
*          0014  8c         ADC A,H
*          0015  67         LD H,A
*          0016  c9         RET
           0017  00         NOP
*          0018  d7         RST 0x10
*          0019  e7         RST 0x20
*          001A  33         INC SP
*          001B  33         INC SP
*          001C  e9         JP (HL)
           001D  00         NOP
           001E  00         NOP
           001F  00         NOP
*          0020  5e         LD E,(HL)
*          0021  23         INC HL
*          0022  56         LD D,(HL)
*          0023  eb         EX DE,HL
*          0024  c9         RET
           0025  00         NOP
           0026  00         NOP
           0027  00         NOP
*          0028  00         NOP
*          0029  00         NOP
*          002A  00         NOP
*          002B  00         NOP
*          002C  00         NOP
*          002D  00         NOP
*          002E  00         NOP
*          002F  00         NOP
*          0030  00         NOP
*          0031  00         NOP
*          0032  00         NOP
*          0033  00         NOP
*          0034  00         NOP
*          0035  00         NOP
*          0036  00         NOP
*          0037  00         NOP
*          0038  c37508     JP 0x0875
           003B  00         NOP
           003C  00         NOP
           003D  00         NOP
           003E  00         NOP
           003F  00         NOP
           0040  00         NOP
           0041  00         NOP
           0042  00         NOP
           0043  00         NOP
           0044  00         NOP
           0045  00         NOP
           0046  00         NOP
           0047  00         NOP
           0048  00         NOP
           0049  00         NOP
           004A  00         NOP
           004B  00         NOP
           004C  00         NOP
           004D  00         NOP
           004E  00         NOP
           004F  00         NOP
           0050  00         NOP
           0051  00         NOP
           0052  00         NOP
           0053  00         NOP
           0054  00         NOP
           0055  00         NOP
           0056  00         NOP
           0057  00         NOP
           0058  00         NOP
           0059  00         NOP
           005A  00         NOP
           005B  00         NOP
           005C  00         NOP
           005D  00         NOP
           005E  00         NOP
           005F  00         NOP
           0060  00         NOP
           0061  00         NOP
           0062  00         NOP
           0063  00         NOP
           0064  00         NOP
           0065  00         NOP
*          0066  76         HALT
*  L_0067: 0067  310048     LD SP,0x4800
*          006A  3e0f       LD A,15
*          006C  d381       OUT (0x0081),A
*          006E  3ef7       LD A,0xf7
*          0070  d380       OUT (0x0080),A
*          0072  3e07       LD A,7
*          0074  d381       OUT (0x0081),A
*          0076  3ef8       LD A,0xf8
*          0078  d380       OUT (0x0080),A
*          007A  3e0f       LD A,15
*          007C  d381       OUT (0x0081),A
*          007E  3ef7       LD A,0xf7
*          0080  d380       OUT (0x0080),A
*          0082  3e0e       LD A,14
*          0084  d381       OUT (0x0081),A
*          0086  3e00       LD A,0
*          0088  d380       OUT (0x0080),A
*          008A  3e07       LD A,7
*          008C  d341       OUT (0x0041),A
*          008E  3e38       LD A,0x38
*          0090  d340       OUT (0x0040),A
*          0092  3e36       LD A,0x36
*          0094  320350     LD (0x5003),A
*          0097  3e76       LD A,0x76
*          0099  320350     LD (0x5003),A
*          009C  3eb6       LD A,0xb6
*          009E  320350     LD (0x5003),A
*          00A1  af         XOR A
*          00A2  320050     LD (0x5000),A
*          00A5  320150     LD (0x5001),A
*          00A8  320250     LD (0x5002),A
*          00AB  210040     LD HL,0x4000
*          00AE  01ff07     LD BC,0x7ff
*          00B1  af         XOR A
*          00B2  77         LD (HL),A
*          00B3  54         LD D,H
*          00B4  5d         LD E,L
*          00B5  1c         INC E
*          00B6  edb0       LDIR
*          00B8  3ef0       LD A,0xf0
*          00BA  320141     LD (0x4101),A
*          00BD  3e38       LD A,0x38
*          00BF  320841     LD (0x4108),A
*          00C2  3ef8       LD A,0xf8
*          00C4  320a41     LD (0x410a),A
*          00C7  3e07       LD A,7
*          00C9  323140     LD (0x4031),A
*          00CC  3ef7       LD A,0xf7
*          00CE  322b40     LD (0x402b),A
*          00D1  3e00       LD A,0
*          00D3  320441     LD (0x4104),A
*          00D6  3e70       LD A,0x70
*          00D8  320341     LD (0x4103),A
       00DB  db   '2ZA2'
           00DF  9a         SBC A,D
           00E0  41         LD B,C
*          00E1  32da41     LD (0x41da),A
       00E4  db   '2YA2'
           00E8  99         SBC A,C
           00E9  41         LD B,C
*          00EA  32d941     LD (0x41d9),A
*          00ED  3e70       LD A,0x70
*          00EF  320541     LD (0x4105),A
*          00F2  321a42     LD (0x421a),A
       00F5  db   '2ZB2'
           00F9  9a         SBC A,D
           00FA  42         LD B,D
*          00FB  321942     LD (0x4219),A
       00FE  db   '2YB2'
           0102  99         SBC A,C
           0103  42         LD B,D
*          0104  216002     LD HL,0x260
*          0107  224041     LD (0x4140),HL
*          010A  228041     LD (0x4180),HL
*          010D  22c041     LD (0x41c0),HL
*          0110  220042     LD (0x4200),HL
       0113  db   '"@B"'
           0117  80         ADD A,B
       0118  db   'B"sA"'
           011D  b3         OR E
           011E  41         LD B,C
*          011F  22f341     LD (0x41f3),HL
       0122  db   '"3B"sB"'
           0129  b3         OR E
           012A  42         LD B,D
*          012B  3e80       LD A,0x80
*          012D  324241     LD (0x4142),A
*          0130  328241     LD (0x4182),A
*          0133  32c241     LD (0x41c2),A
*          0136  320242     LD (0x4202),A
       0139  db   '2BB2'
           013D  82         ADD A,D
           013E  42         LD B,D
*          013F  21f401     LD HL,0x1f4
*          0142  116041     LD DE,0x4160
*          0145  011200     LD BC,0x12
*          0148  edb0       LDIR
*          014A  210602     LD HL,0x206
*          014D  11a041     LD DE,0x41a0
*          0150  011200     LD BC,0x12
*          0153  edb0       LDIR
*          0155  211802     LD HL,0x218
*          0158  11e041     LD DE,0x41e0
*          015B  011200     LD BC,0x12
*          015E  edb0       LDIR
*          0160  212a02     LD HL,0x22a
*          0163  112042     LD DE,0x4220
*          0166  011200     LD BC,0x12
*          0169  edb0       LDIR
*          016B  213c02     LD HL,0x23c
*          016E  116042     LD DE,0x4260
*          0171  011200     LD BC,0x12
*          0174  edb0       LDIR
*          0176  214e02     LD HL,0x24e
*          0179  11a042     LD DE,0x42a0
*          017C  011200     LD BC,0x12
*          017F  edb0       LDIR
*          0181  3a0060     LD A,(0x6000)
*          0184  320344     LD (0x4403),A
*          0187  3a0160     LD A,(0x6001)
*          018A  320444     LD (0x4404),A
*          018D  3a0344     LD A,(0x4403)
*          0190  e60f       AND 15
*          0192  320544     LD (0x4405),A
*          0195  3a0444     LD A,(0x4404)
*          0198  e60f       AND 15
*          019A  320644     LD (0x4406),A
*          019D  3a0344     LD A,(0x4403)
*          01A0  0f         RRCA
*          01A1  0f         RRCA
*          01A2  0f         RRCA
*          01A3  0f         RRCA
*          01A4  e60f       AND 15
*          01A6  320744     LD (0x4407),A
*          01A9  3a0444     LD A,(0x4404)
*          01AC  0f         RRCA
*          01AD  0f         RRCA
*          01AE  0f         RRCA
*          01AF  0f         RRCA
*          01B0  e60f       AND 15
*          01B2  320844     LD (0x4408),A
*          01B5  cda50b     CALL 0x0ba5
*  L_01B8: 01B8  dd214041   LD IX,0x4140
*          01BC  cd7804     CALL 0x0478
*          01BF  dd218041   LD IX,0x4180
*          01C3  cd7804     CALL 0x0478
*          01C6  dd21c041   LD IX,0x41c0
*          01CA  cd7804     CALL 0x0478
*          01CD  dd210042   LD IX,0x4200
*          01D1  cd7804     CALL 0x0478
*          01D4  dd214042   LD IX,0x4240
*          01D8  cd7804     CALL 0x0478
*          01DB  dd218042   LD IX,0x4280
*          01DF  cd7804     CALL 0x0478
*  L_01E2: 01E2  fb         EI
*          01E3  3a0641     LD A,(0x4106)
*          01E6  a7         AND A
*          01E7  28f9       JR z,0x01e2
*          01E9  fe40       CP 0x40
*          01EB  38cb       JR c,0x01b8
*          01ED  de40       SBC A,0x40
*          01EF  320641     LD (0x4106),A
*          01F2  18c4       JR 0x01b8
           01F4  00         NOP
           01F5  0108f7     LD BC,0xf708
           01F8  c1         POP BC
           01F9  fec8       CP 0xc8
*  L_01FB: 01FB  80         ADD A,B
*          01FC  81         ADD A,C
*          01FD  010741     LD BC,0x4107
*          0200  08         EX AF,AF'
*          0201  41         LD B,C
*          0202  03         INC BC
*          0203  41         LD B,C
*          0204  0b         DEC BC
*          0205  41         LD B,C
*          0206  02         LD (BC),A
*          0207  03         INC BC
*          0208  09         ADD HL,BC
*          0209  ef         RST 0x28
*          020A  c2fdd0     JP nz,0xd0fd
*          020D  80         ADD A,B
*          020E  81         ADD A,C
*          020F  02         LD (BC),A
*          0210  07         RLCA
*          0211  41         LD B,C
*          0212  08         EX AF,AF'
*  L_0213: 0213  41         LD B,C
*          0214  03         INC BC
*          0215  41         LD B,C
*          0216  0b         DEC BC
*          0217  41         LD B,C
*          0218  04         INC B
*          0219  05         DEC B
*          021A  0a         LD A,(BC)
*          021B  df         RST 0x18
*          021C  c4fbe0     CALL nz,0xe0fb
*          021F  80         ADD A,B
*          0220  81         ADD A,C
*          0221  04         INC B
*          0222  07         RLCA
*          0223  41         LD B,C
*          0224  08         EX AF,AF'
*          0225  41         LD B,C
*          0226  03         INC BC
*          0227  41         LD B,C
*          0228  0b         DEC BC
*          0229  41         LD B,C
*          022A  00         NOP
*          022B  0108f7     LD BC,0xf708
*          022E  c1         POP BC
*          022F  fec8       CP 0xc8
*          0231  40         LD B,B
*          0232  41         LD B,C
*          0233  08         EX AF,AF'
*          0234  09         ADD HL,BC
*          0235  41         LD B,C
*          0236  0a         LD A,(BC)
*          0237  41         LD B,C
*          0238  05         DEC B
*          0239  41         LD B,C
*          023A  0d         DEC C
*          023B  41         LD B,C
*          023C  02         LD (BC),A
*          023D  03         INC BC
*          023E  09         ADD HL,BC
*          023F  ef         RST 0x28
*          0240  c2fdd0     JP nz,0xd0fd
*          0243  40         LD B,B
*          0244  41         LD B,C
*          0245  1009       DJNZ 0x0250
*          0247  41         LD B,C
*          0248  0a         LD A,(BC)
*          0249  41         LD B,C
*          024A  05         DEC B
*          024B  41         LD B,C
*          024C  0d         DEC C
*          024D  41         LD B,C
*          024E  04         INC B
*          024F  05         DEC B
*  L_0250: 0250  0a         LD A,(BC)
*          0251  df         RST 0x18
*          0252  c4fbe0     CALL nz,0xe0fb
*          0255  40         LD B,B
*          0256  41         LD B,C
*          0257  2009       JR nz,0x0262
*          0259  41         LD B,C
*          025A  0a         LD A,(BC)
*          025B  41         LD B,C
*          025C  05         DEC B
*          025D  41         LD B,C
*          025E  0d         DEC C
*          025F  41         LD B,C
*          0260  6e         LD L,(HL)
*          0261  00         NOP
*  L_0262: 0262  ae         XOR (HL)
*          0263  70         LD (HL),B
*          0264  fe00       CP 0
*          0266  08         EX AF,AF'
*          0267  0e00       LD C,0
*          0269  00         NOP
*          026A  a0         AND B
*          026B  02         LD (BC),A
*          026C  1004       DJNZ 0x0272
*          026E  1008       DJNZ 0x0278
*          0270  1010       DJNZ 0x0282
*  L_0272: 0272  70         LD (HL),B
*          0273  02         LD (BC),A
*          0274  70         LD (HL),B
*          0275  04         INC B
*          0276  70         LD (HL),B
*          0277  08         EX AF,AF'
*  L_0278: 0278  70         LD (HL),B
*          0279  1080       DJNZ 0x01fb
*          027B  02         LD (BC),A
*          027C  80         ADD A,B
*          027D  04         INC B
*          027E  80         ADD A,B
*          027F  08         EX AF,AF'
*          0280  80         ADD A,B
*          0281  1090       DJNZ 0x0213
*          0283  0610       LD B,0x10
*          0285  01ffff     LD BC,0xffff
*          0288  00         NOP
*          0289  ff         RST 0x38
*          028A  00         NOP
*          028B  00         NOP
*          028C  00         NOP
*          028D  00         NOP
*          028E  00         NOP
*          028F  00         NOP
*          0290  00         NOP
*          0291  00         NOP
*          0292  00         NOP
*          0293  00         NOP
*          0294  00         NOP
*          0295  00         NOP
*          0296  00         NOP
*          0297  00         NOP
*          0298  00         NOP
*          0299  00         NOP
*          029A  ff         RST 0x38
*          029B  eedd       XOR 0xdd
*          029D  ccbbaa     CALL z,0xaabb
*          02A0  99         SBC A,C
*          02A1  88         ADC A,B
       02A2  db   'wfUD3"'
           02A8  110055     LD DE,0x5500
*          02AB  66         LD H,(HL)
*          02AC  67         LD H,A
*          02AD  77         LD (HL),A
*          02AE  88         ADC A,B
*          02AF  89         ADC A,C
*          02B0  99         SBC A,C
*          02B1  aa         XOR D
*          02B2  ab         XOR E
*          02B3  bb         CP E
*          02B4  cccddd     CALL z,0xddcd
*          02B7  eeef       XOR 0xef
*          02B9  ff         RST 0x38
*          02BA  88         ADC A,B
*          02BB  88         ADC A,B
*          02BC  88         ADC A,B
*          02BD  88         ADC A,B
*          02BE  88         ADC A,B
*          02BF  88         ADC A,B
*          02C0  88         ADC A,B
*          02C1  88         ADC A,B
*          02C2  88         ADC A,B
*          02C3  88         ADC A,B
*          02C4  88         ADC A,B
*          02C5  88         ADC A,B
*          02C6  88         ADC A,B
*          02C7  88         ADC A,B
*          02C8  88         ADC A,B
*          02C9  88         ADC A,B
*          02CA  89         ADC A,C
*          02CB  52         LD D,D
*          02CC  57         LD D,A
*          02CD  a7         AND A
*          02CE  52         LD D,D
*          02CF  57         LD D,A
*          02D0  a7         AND A
*          02D1  52         LD D,D
*          02D2  57         LD D,A
*          02D3  a7         AND A
*          02D4  52         LD D,D
*          02D5  57         LD D,A
*          02D6  a7         AND A
*          02D7  52         LD D,D
*          02D8  52         LD D,D
*          02D9  1079       DJNZ 0x0354
*          02DB  64         LD H,H
*          02DC  24         INC H
*          02DD  68         LD L,B
*          02DE  a8         XOR B
*          02DF  64         LD H,H
*          02E0  24         INC H
*          02E1  68         LD L,B
*          02E2  a8         XOR B
*          02E3  64         LD H,H
*          02E4  24         INC H
*          02E5  68         LD L,B
*          02E6  a8         XOR B
*          02E7  64         LD H,H
*          02E8  31108a     LD SP,0x8a10
*          02EB  98         SBC A,B
*          02EC  87         ADD A,A
*          02ED  87         ADD A,A
       02EE  db   'vueTSC21!'
*          02F7  1010       DJNZ 0x0309
*          02F9  00         NOP
*  L_02FA: 02FA  cf         RST 8
*          02FB  eedd       XOR 0xdd
*          02FD  ccbbaa     CALL z,0xaabb
*          0300  99         SBC A,C
*          0301  88         ADC A,B
       0302  db   'wfUD3"'
           0308  1100ad     LD DE,0xad00
*          030B  ccbbaa     CALL z,0xaabb
*          030E  aa         XOR D
*          030F  99         SBC A,C
*          0310  88         ADC A,B
       0311  db   'wfUD3""'
           0318  11009c     LD DE,0x9c00
*          031B  bb         CP E
*          031C  aa         XOR D
*          031D  aa         XOR D
*          031E  99         SBC A,C
*          031F  88         ADC A,B
       0320  db   'wffUD3""'
           0328  1100ff     LD DE,0xff00
*          032B  eedd       XOR 0xdd
*          032D  ccbbaa     CALL z,0xaabb
*          0330  99         SBC A,C
*          0331  88         ADC A,B
       0332  db   'wfUD3"'
           0338  1100dd     LD DE,0xdd00
           033B  ccbbaa     CALL z,0xaabb
*          033E  aa         XOR D
*          033F  99         SBC A,C
*          0340  88         ADC A,B
       0341  db   'wfUD33"'
           0348  1100cc     LD DE,0xcc00
           034B  bb         CP E
           034C  aa         XOR D
*          034D  aa         XOR D
*          034E  99         SBC A,C
*          034F  88         ADC A,B
       0350  db   'wffUD3""'
           0358  1100dd     LD DE,0xdd00
           035B  cb02       RLC D
           035D  96         SUB (HL)
*          035E  ddcb0276   BIT 6,(IX+2)
*          0362  207b       JR nz,0x03df
*          0364  dd7e1b     LD A,(IX+0x1b)
*          0367  3d         DEC A
*          0368  2875       JR z,0x03df
*          036A  fe01       CP 1
*          036C  dd771b     LD (IX+0x1b),A
*          036F  2008       JR nz,0x0379
*          0371  210f41     LD HL,0x410f
*          0374  dd7e29     LD A,(IX+0x29)
*          0377  b6         OR (HL)
*          0378  77         LD (HL),A
*  L_0379: 0379  ddcb0266   BIT 4,(IX+2)
*          037D  c8         RET z
           037E  dd6e17     LD L,(IX+0x17)
           0381  dd6618     LD H,(IX+0x18)
           0384  3e0f       LD A,15
           0386  a4         AND H
           0387  67         LD H,A
           0388  cb3c       SRL H
           038A  cb1d       RR L
           038C  cb3c       SRL H
           038E  cb1d       RR L
           0390  ddcb025e   BIT 3,(IX+2)
           0394  2810       JR z,0x03a6
           0396  5d         LD E,L
           0397  54         LD D,H
           0398  29         ADD HL,HL
           0399  29         ADD HL,HL
           039A  19         ADD HL,DE
       039B  db   '))MD)'
           03A0  09         ADD HL,BC
           03A1  19         ADD HL,DE
           03A2  19         ADD HL,DE
           03A3  19         ADD HL,DE
           03A4  180e       JR 0x03b4
       03A6  db   ']T))))))'
*          03AE  19         ADD HL,DE
*          03AF  3003       JR nc,0x03b4
*          03B1  21ffff     LD HL,0xffff
*  L_03B4: 03B4  cb3c       SRL H
*          03B6  cb1d       RR L
*          03B8  cb3c       SRL H
*          03BA  cb1d       RR L
*          03BC  cb3c       SRL H
*          03BE  cb1d       RR L
*          03C0  cb3c       SRL H
*          03C2  cb1d       RR L
*          03C4  dd7517     LD (IX+0x17),L
*          03C7  dd7418     LD (IX+0x18),H
*          03CA  dd4e28     LD C,(IX+0x28)
*          03CD  dd7e20     LD A,(IX+0x20)
*          03D0  ed79       OUT (C),A
*          03D2  0d         DEC C
*          03D3  ed69       OUT (C),L
*          03D5  dd7e21     LD A,(IX+0x21)
*          03D8  0c         INC C
*          03D9  ed79       OUT (C),A
*          03DB  0d         DEC C
*          03DC  ed61       OUT (C),H
*          03DE  c9         RET
*  L_03DF: 03DF  dd4e28     LD C,(IX+0x28)
*          03E2  dd461f     LD B,(IX+0x1f)
*          03E5  dd7032     LD (IX+0x32),B
*          03E8  dd7e25     LD A,(IX+0x25)
*          03EB  a8         XOR B
*          03EC  201f       JR nz,0x040d
*          03EE  dd7e20     LD A,(IX+0x20)
*          03F1  ed79       OUT (C),A
*          03F3  dd7e0b     LD A,(IX+11)
*          03F6  dd7717     LD (IX+0x17),A
*          03F9  0d         DEC C
*          03FA  ed79       OUT (C),A
*          03FC  dd7e21     LD A,(IX+0x21)
*          03FF  0c         INC C
*          0400  ed79       OUT (C),A
*          0402  dd7e0c     LD A,(IX+12)
*          0405  dd7718     LD (IX+0x18),A
*          0408  0d         DEC C
*          0409  ed79       OUT (C),A
*          040B  180e       JR 0x041b
*  L_040D: 040D  3e06       LD A,6
*          040F  ed79       OUT (C),A
*          0411  dd5e2a     LD E,(IX+0x2a)
*          0414  dd562b     LD D,(IX+0x2b)
*          0417  1a         LD A,(DE)
*          0418  0d         DEC C
*          0419  ed79       OUT (C),A
*  L_041B: 041B  dd7e09     LD A,(IX+9)
*          041E  dd771b     LD (IX+0x1b),A
*          0421  dd7e19     LD A,(IX+0x19)
*          0424  dd771a     LD (IX+0x1a),A
*          0427  dd7e0d     LD A,(IX+13)
*          042A  dd771c     LD (IX+0x1c),A
*          042D  dd7e0f     LD A,(IX+15)
*          0430  dd771d     LD (IX+0x1d),A
*          0433  dd7e10     LD A,(IX+0x10)
*          0436  dd771e     LD (IX+0x1e),A
*          0439  dd360400   LD (IX+4),0
*          043D  ddcb024e   BIT 1,(IX+2)
*          0441  280c       JR z,0x044f
*          0443  dd7e15     LD A,(IX+0x15)
*          0446  dd7704     LD (IX+4),A
*          0449  dd7e16     LD A,(IX+0x16)
*          044C  dd771e     LD (IX+0x1e),A
*  L_044F: 044F  ddcb0296   RES 2,(IX+2)
*          0453  ddcb026e   BIT 5,(IX+2)
*          0457  2808       JR z,0x0461
*          0459  ddcb02ae   RES 5,(IX+2)
*          045D  ddcb02d6   SET 2,(IX+2)
*  L_0461: 0461  210f41     LD HL,0x410f
*          0464  dd7e29     LD A,(IX+0x29)
*          0467  5f         LD E,A
*          0468  2f         CPL
*          0469  a6         AND (HL)
*          046A  f6c0       OR 0xc0
*          046C  77         LD (HL),A
*          046D  210641     LD HL,0x4106
*          0470  7b         LD A,E
*          0471  b6         OR (HL)
*          0472  77         LD (HL),A
*          0473  ddcb02b6   RES 6,(IX+2)
*          0477  c9         RET
*  L_0478: 0478  ddcb027e   BIT 7,(IX+2)
*          047C  2831       JR z,0x04af
*          047E  ddcb02c6   SET 0,(IX+2)
*          0482  ddcb0296   RES 2,(IX+2)
*          0486  ddcb02ae   RES 5,(IX+2)
*          048A  ddcb02be   RES 7,(IX+2)
*          048E  dd360300   LD (IX+3),0
*          0492  dd361300   LD (IX+0x13),0
*          0496  dd361400   LD (IX+0x14),0
*          049A  dd36197f   LD (IX+0x19),0x7f
*          049E  dde5       PUSH IX
*          04A0  e1         POP HL
*          04A1  dd7507     LD (IX+7),L
*          04A4  dd7408     LD (IX+8),H
*          04A7  dd6e00     LD L,(IX)
*          04AA  dd6601     LD H,(IX+1)
*          04AD  180e       JR 0x04bd
*  L_04AF: 04AF  210641     LD HL,0x4106
*          04B2  dd7e29     LD A,(IX+0x29)
*          04B5  a6         AND (HL)
*          04B6  c8         RET z
           04B7  dd6634     LD H,(IX+0x34)
           04BA  dd6e33     LD L,(IX+0x33)
*  L_04BD: 04BD  ddcb028e   RES 1,(IX+2)
*          04C1  dd361001   LD (IX+0x10),1
*  L_04C5: 04C5  7e         LD A,(HL)
*          04C6  3c         INC A
*          04C7  2006       JR nz,0x04cf
*          04C9  23         INC HL
*          04CA  18f9       JR 0x04c5
*          04CC  23         INC HL
*          04CD  23         INC HL
*          04CE  23         INC HL
*  L_04CF: 04CF  7e         LD A,(HL)
*          04D0  e60f       AND 15
*          04D2  fe0e       CP 14
*          04D4  c2d705     JP nz,0x05d7
*          04D7  7e         LD A,(HL)
*          04D8  cb0f       RRC A
*          04DA  cb0f       RRC A
*          04DC  cb0f       RRC A
*          04DE  e61e       AND 0x1e
*          04E0  eb         EX DE,HL
*          04E1  216706     LD HL,0x667
*          04E4  0600       LD B,0
*          04E6  4f         LD C,A
*          04E7  09         ADD HL,BC
       04E8  db   'N#Fi`'
*          04ED  e9         JP (HL)
*          04EE  eb         EX DE,HL
*          04EF  23         INC HL
*          04F0  5e         LD E,(HL)
*          04F1  23         INC HL
*          04F2  56         LD D,(HL)
*          04F3  af         XOR A
*          04F4  b3         OR E
*          04F5  b2         OR D
*          04F6  200b       JR nz,0x0503
*          04F8  116002     LD DE,0x260
*          04FB  ddcb0296   RES 2,(IX+2)
*          04FF  ddcb02ee   SET 5,(IX+2)
*  L_0503: 0503  eb         EX DE,HL
*          0504  18bf       JR 0x04c5
           0506  eb         EX DE,HL
           0507  23         INC HL
           0508  7e         LD A,(HL)
           0509  dd7705     LD (IX+5),A
           050C  23         INC HL
           050D  7e         LD A,(HL)
           050E  dd7706     LD (IX+6),A
           0511  23         INC HL
           0512  18b1       JR 0x04c5
           0514  eb         EX DE,HL
       0515  db   '#^#~W'
           051A  b3         OR E
           051B  2809       JR z,0x0526
           051D  dd4e13     LD C,(IX+0x13)
           0520  dd4614     LD B,(IX+0x14)
           0523  eb         EX DE,HL
           0524  09         ADD HL,BC
           0525  eb         EX DE,HL
*          0526  dd7313     LD (IX+0x13),E
*          0529  dd7214     LD (IX+0x14),D
*          052C  23         INC HL
*          052D  1896       JR 0x04c5
           052F  eb         EX DE,HL
           0530  ddcb02ce   SET 1,(IX+2)
           0534  23         INC HL
           0535  188e       JR 0x04c5
           0537  eb         EX DE,HL
           0538  23         INC HL
           0539  7e         LD A,(HL)
           053A  dd7712     LD (IX+0x12),A
           053D  23         INC HL
           053E  c3c504     JP 0x04c5
           0541  dd3512     DEC (IX+0x12)
           0544  20a8       JR nz,0x04ee
           0546  eb         EX DE,HL
           0547  c3cc04     JP 0x04cc
           054A  eb         EX DE,HL
           054B  23         INC HL
           054C  7e         LD A,(HL)
           054D  dd7711     LD (IX+0x11),A
           0550  23         INC HL
           0551  c3c504     JP 0x04c5
           0554  dd3511     DEC (IX+0x11)
           0557  2095       JR nz,0x04ee
           0559  eb         EX DE,HL
           055A  c3cc04     JP 0x04cc
           055D  eb         EX DE,HL
           055E  23         INC HL
           055F  dd360af0   LD (IX+10),0xf0
           0563  dd361fff   LD (IX+0x1f),0xff
           0567  c31506     JP 0x0615
           056A  eb         EX DE,HL
           056B  23         INC HL
           056C  7e         LD A,(HL)
           056D  ddb619     OR (IX+0x19)
           0570  dd7719     LD (IX+0x19),A
           0573  23         INC HL
           0574  c3c504     JP 0x04c5
           0577  eb         EX DE,HL
           0578  23         INC HL
           0579  7e         LD A,(HL)
           057A  2f         CPL
           057B  dda619     AND (IX+0x19)
           057E  dd7719     LD (IX+0x19),A
           0581  23         INC HL
           0582  c3c504     JP 0x04c5
           0585  eb         EX DE,HL
           0586  23         INC HL
           0587  7e         LD A,(HL)
           0588  dd7703     LD (IX+3),A
           058B  23         INC HL
           058C  c3c504     JP 0x04c5
           058F  13         INC DE
           0590  1a         LD A,(DE)
           0591  4f         LD C,A
           0592  13         INC DE
           0593  1a         LD A,(DE)
           0594  47         LD B,A
           0595  13         INC DE
           0596  dd6e07     LD L,(IX+7)
           0599  dd6608     LD H,(IX+8)
           059C  2b         DEC HL
           059D  72         LD (HL),D
           059E  2b         DEC HL
           059F  73         LD (HL),E
           05A0  dd7507     LD (IX+7),L
           05A3  dd7408     LD (IX+8),H
           05A6  69         LD L,C
           05A7  60         LD H,B
           05A8  c3c504     JP 0x04c5
           05AB  dd6e07     LD L,(IX+7)
           05AE  dd6608     LD H,(IX+8)
           05B1  5e         LD E,(HL)
           05B2  23         INC HL
           05B3  56         LD D,(HL)
           05B4  23         INC HL
           05B5  dd7507     LD (IX+7),L
           05B8  dd7408     LD (IX+8),H
           05BB  eb         EX DE,HL
           05BC  c3c504     JP 0x04c5
           05BF  eb         EX DE,HL
           05C0  ddcb02e6   SET 4,(IX+2)
           05C4  ddcb02de   SET 3,(IX+2)
           05C8  23         INC HL
           05C9  1810       JR 0x05db
           05CB  eb         EX DE,HL
           05CC  ddcb02e6   SET 4,(IX+2)
           05D0  ddcb029e   RES 3,(IX+2)
           05D4  23         INC HL
           05D5  1804       JR 0x05db
*  L_05D7: 05D7  ddcb02a6   RES 4,(IX+2)
*          05DB  7e         LD A,(HL)
*          05DC  dd770a     LD (IX+10),A
*          05DF  e60f       AND 15
*          05E1  fe0f       CP 15
*          05E3  2011       JR nz,0x05f6
*          05E5  23         INC HL
*          05E6  7e         LD A,(HL)
*          05E7  dd5e2a     LD E,(IX+0x2a)
*          05EA  dd562b     LD D,(IX+0x2b)
*          05ED  12         LD (DE),A
*          05EE  dd7e23     LD A,(IX+0x23)
*          05F1  dd771f     LD (IX+0x1f),A
*          05F4  181f       JR 0x0615
*  L_05F6: 05F6  dd7e25     LD A,(IX+0x25)
*          05F9  dd771f     LD (IX+0x1f),A
*          05FC  7e         LD A,(HL)
*          05FD  e60f       AND 15
*          05FF  57         LD D,A
*          0600  23         INC HL
*          0601  5e         LD E,(HL)
*          0602  dd4e13     LD C,(IX+0x13)
*          0605  dd7e14     LD A,(IX+0x14)
*          0608  47         LD B,A
*          0609  b1         OR C
*          060A  2803       JR z,0x060f
*          060C  eb         EX DE,HL
*          060D  09         ADD HL,BC
*          060E  eb         EX DE,HL
*  L_060F: 060F  dd720c     LD (IX+12),D
*          0612  dd730b     LD (IX+11),E
*  L_0615: 0615  dd7e03     LD A,(IX+3)
*          0618  a7         AND A
*          0619  2002       JR nz,0x061d
*          061B  23         INC HL
*          061C  7e         LD A,(HL)
*  L_061D: 061D  dd7709     LD (IX+9),A
*          0620  23         INC HL
*          0621  dd7434     LD (IX+0x34),H
*          0624  dd7533     LD (IX+0x33),L
*          0627  dd7e0a     LD A,(IX+10)
*          062A  0f         RRCA
*          062B  0f         RRCA
*          062C  0f         RRCA
*          062D  e61e       AND 0x1e
*          062F  fe1c       CP 0x1c
*          0631  200d       JR nz,0x0640
*          0633  dd7e05     LD A,(IX+5)
*          0636  e6f0       AND 0xf0
*          0638  dd770d     LD (IX+13),A
*          063B  dd7e06     LD A,(IX+6)
*          063E  180c       JR 0x064c
*  L_0640: 0640  216a02     LD HL,0x26a
*          0643  d7         RST 0x10
*          0644  7e         LD A,(HL)
*          0645  e6f0       AND 0xf0
*          0647  dd770d     LD (IX+13),A
*          064A  23         INC HL
*          064B  7e         LD A,(HL)
*  L_064C: 064C  dd770f     LD (IX+15),A
*          064F  ddcb0246   BIT 0,(IX+2)
*          0653  2808       JR z,0x065d
*          0655  ddcb02f6   SET 6,(IX+2)
*          0659  ddcb0286   RES 0,(IX+2)
*  L_065D: 065D  210641     LD HL,0x4106
*          0660  dd7e29     LD A,(IX+0x29)
*          0663  2f         CPL
*          0664  a6         AND (HL)
*          0665  77         LD (HL),A
*          0666  c9         RET
           0667  ee04       XOR 4
           0669  bf         CP A
           066A  05         DEC B
           066B  cb05       RLC L
           066D  0605       LD B,5
           066F  14         INC D
           0670  05         DEC B
           0671  2f         CPL
           0672  05         DEC B
           0673  85         ADD A,L
           0674  05         DEC B
           0675  41         LD B,C
           0676  05         DEC B
           0677  37         SCF
           0678  05         DEC B
           0679  77         LD (HL),A
           067A  05         DEC B
           067B  6a         LD L,D
           067C  05         DEC B
           067D  54         LD D,H
           067E  05         DEC B
           067F  4a         LD C,D
           0680  05         DEC B
           0681  8f         ADC A,A
           0682  05         DEC B
           0683  ab         XOR E
           0684  05         DEC B
           0685  5d         LD E,L
           0686  05         DEC B
*  L_0687: 0687  3a0940     LD A,(0x4009)
*          068A  cb77       BIT 6,A
*          068C  200d       JR nz,0x069b
*          068E  111041     LD DE,0x4110
*          0691  210640     LD HL,0x4006
*          0694  dd214041   LD IX,0x4140
*          0698  cdaf06     CALL 0x06af
*  L_069B: 069B  3a0940     LD A,(0x4009)
*          069E  cb7f       BIT 7,A
*          06A0  c0         RET nz
           06A1  111141     LD DE,0x4111
           06A4  210740     LD HL,0x4007
           06A7  dd210042   LD IX,0x4200
           06AB  cdaf06     CALL 0x06af
           06AE  c9         RET
*  L_06AF: 06AF  cb7e       BIT 7,(HL)
*          06B1  2018       JR nz,0x06cb
*          06B3  ddcb0256   BIT 2,(IX+2)
*          06B7  2818       JR z,0x06d1
*          06B9  ddcb027e   BIT 7,(IX+2)
*          06BD  2012       JR nz,0x06d1
*          06BF  ddcb0246   BIT 0,(IX+2)
*          06C3  200c       JR nz,0x06d1
*          06C5  ddcb0276   BIT 6,(IX+2)
*          06C9  2006       JR nz,0x06d1
*  L_06CB: 06CB  af         XOR A
*          06CC  12         LD (DE),A
*          06CD  ddcb0296   RES 2,(IX+2)
*  L_06D1: 06D1  1a         LD A,(DE)
*          06D2  47         LD B,A
*          06D3  7e         LD A,(HL)
*          06D4  4f         LD C,A
*          06D5  3600       LD (HL),0
*          06D7  e67f       AND 0x7f
*          06D9  c8         RET z
           06DA  b8         CP B
           06DB  d8         RET c
           06DC  217408     LD HL,0x874
           06DF  46         LD B,(HL)
           06E0  b8         CP B
           06E1  3804       JR c,0x06e7
           06E3  3a7408     LD A,(0x0874)
           06E6  4f         LD C,A
*          06E7  79         LD A,C
*          06E8  12         LD (DE),A
*          06E9  87         ADD A,A
*          06EA  211808     LD HL,0x818
*          06ED  0600       LD B,0
*          06EF  4f         LD C,A
*          06F0  09         ADD HL,BC
*          06F1  5e         LD E,(HL)
*          06F2  23         INC HL
*          06F3  56         LD D,(HL)
*          06F4  cdf007     CALL 0x07f0
*          06F7  210641     LD HL,0x4106
*          06FA  cbfe       SET 7,(HL)
*          06FC  c9         RET
       06FD  db   '!rA~!'
           0702  b2         OR D
           0703  41         LD B,C
*          0704  a6         AND (HL)
*          0705  21f241     LD HL,0x41f2
*          0708  a6         AND (HL)
*          0709  f6c0       OR 0xc0
*          070B  47         LD B,A
*          070C  3a0a41     LD A,(0x410a)
*          070F  a8         XOR B
*          0710  280a       JR z,0x071c
*          0712  3e07       LD A,7
*          0714  d381       OUT (0x0081),A
*          0716  78         LD A,B
*          0717  320a41     LD (0x410a),A
*          071A  d380       OUT (0x0080),A
       071C  db   '!2B~!rB'
*          0723  a6         AND (HL)
*          0724  21b242     LD HL,0x42b2
*          0727  a6         AND (HL)
*          0728  e63f       AND 0x3f
*          072A  47         LD B,A
*          072B  3a0841     LD A,(0x4108)
*          072E  a8         XOR B
*          072F  280a       JR z,0x073b
*          0731  3e07       LD A,7
*          0733  d341       OUT (0x0041),A
*          0735  78         LD A,B
*          0736  320841     LD (0x4108),A
*          0739  d340       OUT (0x0040),A
*  L_073B: 073B  3a0341     LD A,(0x4103)
*          073E  f670       OR 0x70
*          0740  215a41     LD HL,0x415a
*          0743  a6         AND (HL)
*          0744  219a41     LD HL,0x419a
*          0747  a6         AND (HL)
*          0748  21da41     LD HL,0x41da
*          074B  a6         AND (HL)
*          074C  320341     LD (0x4103),A
*          074F  3a0541     LD A,(0x4105)
*          0752  f670       OR 0x70
*          0754  211a42     LD HL,0x421a
*          0757  a6         AND (HL)
*          0758  215a42     LD HL,0x425a
*          075B  a6         AND (HL)
*          075C  219a42     LD HL,0x429a
*          075F  a6         AND (HL)
*          0760  320541     LD (0x4105),A
*          0763  3a0840     LD A,(0x4008)
*          0766  cb7f       BIT 7,A
*          0768  200b       JR nz,0x0775
*          076A  010400     LD BC,4
*          076D  210241     LD HL,0x4102
*          0770  112040     LD DE,0x4020
*          0773  edb0       LDIR
       0775  db   '!+@: @'
*          077B  cb47       BIT 0,A
*          077D  2804       JR z,0x0783
*          077F  cbde       SET 3,(HL)
*          0781  1802       JR 0x0785
*  L_0783: 0783  cb9e       RES 3,(HL)
*  L_0785: 0785  3a2140     LD A,(0x4021)
*          0788  cb77       BIT 6,A
*          078A  2806       JR z,0x0792
*          078C  cbfe       SET 7,(HL)
*          078E  cbf6       SET 6,(HL)
*          0790  1804       JR 0x0796
*  L_0792: 0792  cbbe       RES 7,(HL)
*          0794  cbb6       RES 6,(HL)
*  L_0796: 0796  3a2340     LD A,(0x4023)
*          0799  e630       AND 0x30
*          079B  5f         LD E,A
*          079C  7e         LD A,(HL)
*          079D  e6cf       AND 0xcf
*          079F  b3         OR E
*          07A0  77         LD (HL),A
*          07A1  c9         RET
*  L_07A2: 07A2  dd7e1e     LD A,(IX+0x1e)
*          07A5  3d         DEC A
*          07A6  dd771e     LD (IX+0x1e),A
*          07A9  dd7716     LD (IX+0x16),A
*          07AC  c0         RET nz
           07AD  dd4e28     LD C,(IX+0x28)
           07B0  dd7e22     LD A,(IX+0x22)
           07B3  ed79       OUT (C),A
           07B5  dd7e1d     LD A,(IX+0x1d)
           07B8  dd771e     LD (IX+0x1e),A
           07BB  dd7716     LD (IX+0x16),A
           07BE  dd7e04     LD A,(IX+4)
           07C1  fe1f       CP 0x1f
           07C3  300a       JR nc,0x07cf
           07C5  dd4604     LD B,(IX+4)
           07C8  04         INC B
           07C9  dd7004     LD (IX+4),B
           07CC  dd7015     LD (IX+0x15),B
*          07CF  cb2f       SRA A
*          07D1  218a02     LD HL,0x28a
*          07D4  1600       LD D,0
*          07D6  5f         LD E,A
*          07D7  19         ADD HL,DE
*          07D8  dd7e1c     LD A,(IX+0x1c)
*          07DB  e6f0       AND 0xf0
*          07DD  5f         LD E,A
*          07DE  19         ADD HL,DE
*          07DF  7e         LD A,(HL)
*          07E0  ddcb0446   BIT 0,(IX+4)
*          07E4  2004       JR nz,0x07ea
*          07E6  0f         RRCA
*          07E7  0f         RRCA
*          07E8  0f         RRCA
*          07E9  0f         RRCA
*  L_07EA: 07EA  e60f       AND 15
*          07EC  0d         DEC C
*          07ED  ed79       OUT (C),A
*          07EF  c9         RET
*  L_07F0: 07F0  214041     LD HL,0x4140
*          07F3  0606       LD B,6
*          07F5  af         XOR A
*          07F6  1a         LD A,(DE)
*          07F7  a7         AND A
*          07F8  2006       JR nz,0x0800
*          07FA  13         INC DE
*          07FB  1a         LD A,(DE)
*          07FC  a7         AND A
*          07FD  280c       JR z,0x080b
*          07FF  1b         DEC DE
*  L_0800: 0800  1a         LD A,(DE)
*          0801  77         LD (HL),A
*          0802  13         INC DE
*          0803  23         INC HL
*          0804  1a         LD A,(DE)
*          0805  77         LD (HL),A
*          0806  23         INC HL
*          0807  cbfe       SET 7,(HL)
*          0809  2b         DEC HL
*          080A  2b         DEC HL
*  L_080B: 080B  05         DEC B
*          080C  c8         RET z
           080D  13         INC DE
           080E  7d         LD A,L
           080F  c640       ADD A,0x40
           0811  6f         LD L,A
           0812  3e00       LD A,0
           0814  8c         ADC A,H
           0815  67         LD H,A
           0816  18dd       JR 0x07f5
           0818  5b         LD E,E
           0819  0d         DEC C
           081A  67         LD H,A
           081B  0d         DEC C
           081C  73         LD (HL),E
           081D  0d         DEC C
           081E  7f         LD A,A
           081F  0d         DEC C
           0820  8b         ADC A,E
           0821  0d         DEC C
           0822  011297     LD BC,0x9712
           0825  0d         DEC C
           0826  a3         AND E
           0827  0d         DEC C
           0828  af         XOR A
           0829  0d         DEC C
           082A  160e       LD D,14
           082C  2e12       LD L,0x12
           082E  75         LD (HL),L
           082F  12         LD (DE),A
           0830  2e0e       LD L,14
           0832  3a0e3a     LD A,(0x3a0e)
           0835  12         LD (DE),A
           0836  220e73     LD (0x730e),HL
           0839  0f         RRCA
           083A  9a         SBC A,D
           083B  0f         RRCA
*  L_083C: 083C  b9         CP C
*          083D  11f112     LD DE,0x12f1
*          0840  fd12       LD (DE),A
*          0842  ad         XOR L
*          0843  13         INC DE
*          0844  46         LD B,(HL)
*          0845  0e52       LD C,0x52
*          0847  0ec7       LD C,0xc7
*          0849  12         LD (DE),A
*          084A  83         ADD A,E
*          084B  10f9       DJNZ 0x0846
*          084D  1009       DJNZ 0x0858
*          084F  13         INC DE
*          0850  c30fcf     JP 0xcf0f
           0853  0f         RRCA
           0854  db0f       IN A,(0x000f)
           0856  e7         RST 0x20
           0857  0f         RRCA
*  L_0858: 0858  f3         DI
*          0859  0f         RRCA
*          085A  ff         RST 0x38
*          085B  0f         RRCA
*          085C  0b         DEC BC
*          085D  1017       DJNZ 0x0876
*          085F  10db       DJNZ 0x083c
*          0861  13         INC DE
*          0862  1c         INC E
*          0863  15         DEC D
*          0864  9a         SBC A,D
*          0865  15         DEC D
*          0866  1816       JR 0x087e
           0868  88         ADC A,B
           0869  17         RLA
           086A  95         SUB L
           086B  18d5       JR 0x0842
           086D  19         ADD HL,DE
           086E  27         DAA
           086F  2073       JR nz,0x08e4
           0871  0d         DEC C
           0872  67         LD H,A
           0873  0d         DEC C
           0874  2d         DEC L
*  L_0875: 0875  f5         PUSH AF
*  L_0876: 0876  dde5       PUSH IX
*          0878  e5         PUSH HL
*          0879  d5         PUSH DE
*          087A  c5         PUSH BC
*          087B  3a0840     LD A,(0x4008)
*  L_087E: 087E  feff       CP 0xff
*          0880  ca0000     JP z,0x0000
*          0883  cdd70b     CALL 0x0bd7
*          0886  3a0060     LD A,(0x6000)
*          0889  320344     LD (0x4403),A
*          088C  3a0160     LD A,(0x6001)
*          088F  320444     LD (0x4404),A
*          0892  cd4809     CALL 0x0948
*          0895  cd7009     CALL 0x0970
*          0898  3a0041     LD A,(0x4100)
*          089B  3c         INC A
*          089C  320041     LD (0x4100),A
*          089F  e603       AND 3
*          08A1  6f         LD L,A
*          08A2  87         ADD A,A
*          08A3  85         ADD A,L
*          08A4  21ac08     LD HL,0x8ac
*          08A7  1600       LD D,0
*          08A9  5f         LD E,A
*          08AA  19         ADD HL,DE
*          08AB  e9         JP (HL)
           08AC  c3b808     JP 0x08b8
           08AF  c3d308     JP 0x08d3
           08B2  c3c708     JP 0x08c7
           08B5  c3d308     JP 0x08d3
*          08B8  cd470c     CALL 0x0c47
*          08BB  cd320d     CALL 0x0d32
*          08BE  cdd009     CALL 0x09d0
*          08C1  cd730a     CALL 0x0a73
*          08C4  c31609     JP 0x0916
*          08C7  cdac0a     CALL 0x0aac
*          08CA  cd130c     CALL 0x0c13
*          08CD  cd880c     CALL 0x0c88
*          08D0  c31609     JP 0x0916
*          08D3  210f41     LD HL,0x410f
*          08D6  3a0641     LD A,(0x4106)
*          08D9  a6         AND (HL)
*          08DA  2032       JR nz,0x090e
*          08DC  dd214041   LD IX,0x4140
*          08E0  cd5a03     CALL 0x035a
*          08E3  dd218041   LD IX,0x4180
*          08E7  cd5a03     CALL 0x035a
*          08EA  dd21c041   LD IX,0x41c0
*          08EE  cd5a03     CALL 0x035a
*          08F1  dd210042   LD IX,0x4200
*          08F5  cd5a03     CALL 0x035a
*          08F8  dd214042   LD IX,0x4240
*          08FC  cd5a03     CALL 0x035a
*          08FF  dd218042   LD IX,0x4280
*          0903  cd5a03     CALL 0x035a
*          0906  3a0940     LD A,(0x4009)
*          0909  e601       AND 1
*          090B  ccfd06     CALL z,0x06fd
*  L_090E: 090E  3a0940     LD A,(0x4009)
*          0911  e601       AND 1
*          0913  cc8706     CALL z,0x0687
*  L_0916: 0916  dd214041   LD IX,0x4140
*          091A  cda207     CALL 0x07a2
*          091D  dd218041   LD IX,0x4180
*          0921  cda207     CALL 0x07a2
*          0924  dd21c041   LD IX,0x41c0
*          0928  cda207     CALL 0x07a2
*          092B  dd210042   LD IX,0x4200
*          092F  cda207     CALL 0x07a2
*          0932  dd214042   LD IX,0x4240
*          0936  cda207     CALL 0x07a2
*          0939  dd218042   LD IX,0x4280
*          093D  cda207     CALL 0x07a2
*          0940  c1         POP BC
*          0941  d1         POP DE
*          0942  e1         POP HL
*          0943  dde1       POP IX
*          0945  f1         POP AF
*          0946  fb         EI
*          0947  c9         RET
*  L_0948: 0948  110240     LD DE,0x4002
*          094B  210544     LD HL,0x4405
*          094E  3a0344     LD A,(0x4403)
*          0951  cd5509     CALL 0x0955
*          0954  c9         RET
*  L_0955: 0955  e60f       AND 15
*          0957  46         LD B,(HL)
*          0958  77         LD (HL),A
*          0959  90         SUB B
*          095A  c8         RET z
           095B  eb         EX DE,HL
           095C  cb5f       BIT 3,A
           095E  2809       JR z,0x0969
           0960  f6f0       OR 0xf0
           0962  ed44       NEG
           0964  47         LD B,A
*  L_0965: 0965  35         DEC (HL)
*          0966  10fd       DJNZ 0x0965
*          0968  c9         RET
*          0969  e60f       AND 15
*          096B  47         LD B,A
*  L_096C: 096C  34         INC (HL)
*          096D  10fd       DJNZ 0x096c
*          096F  c9         RET
*  L_0970: 0970  114040     LD DE,0x4040
*          0973  210744     LD HL,0x4407
*          0976  3a0344     LD A,(0x4403)
*          0979  cd9d09     CALL 0x099d
*          097C  77         LD (HL),A
*          097D  110040     LD DE,0x4000
*          0980  21ba09     LD HL,0x9ba
*          0983  d7         RST 0x10
*          0984  eda0       LDI
*          0986  114140     LD DE,0x4041
*          0989  210844     LD HL,0x4408
*          098C  3a0444     LD A,(0x4404)
*          098F  cd9d09     CALL 0x099d
*          0992  77         LD (HL),A
*          0993  110140     LD DE,0x4001
*          0996  21ba09     LD HL,0x9ba
*          0999  d7         RST 0x10
*          099A  eda0       LDI
*          099C  c9         RET
*  L_099D: 099D  4e         LD C,(HL)
*          099E  e6f0       AND 0xf0
*          09A0  0f         RRCA
*          09A1  0f         RRCA
*          09A2  0f         RRCA
*          09A3  0f         RRCA
*          09A4  77         LD (HL),A
*          09A5  eb         EX DE,HL
*          09A6  91         SUB C
*          09A7  cb5f       BIT 3,A
*          09A9  2806       JR z,0x09b1
*          09AB  f6f0       OR 0xf0
*          09AD  86         ADD A,(HL)
*          09AE  f0         RET p
           09AF  af         XOR A
           09B0  c9         RET
*  L_09B1: 09B1  e60f       AND 15
*          09B3  86         ADD A,(HL)
*          09B4  fe15       CP 0x15
*          09B6  d8         RET c
           09B7  3e15       LD A,0x15
           09B9  c9         RET
           09BA  00         NOP
           09BB  00         NOP
           09BC  00         NOP
           09BD  00         NOP
           09BE  010203     LD BC,0x302
           09C1  04         INC B
           09C2  05         DEC B
           09C3  0607       LD B,7
           09C5  08         EX AF,AF'
           09C6  09         ADD HL,BC
           09C7  0a         LD A,(BC)
           09C8  0b         DEC BC
           09C9  0c         INC C
           09CA  0d         DEC C
           09CB  0e0f       LD C,15
           09CD  0f         RRCA
           09CE  0f         RRCA
           09CF  0f         RRCA
*  L_09D0: 09D0  210b44     LD HL,0x440b
*          09D3  3a3040     LD A,(0x4030)
*          09D6  0606       LD B,6
*  L_09D8: 09D8  cbae       RES 5,(HL)
*          09DA  0f         RRCA
*          09DB  3002       JR nc,0x09df
*          09DD  cbee       SET 5,(HL)
*  L_09DF: 09DF  23         INC HL
*          09E0  10f6       DJNZ 0x09d8
*          09E2  3a3040     LD A,(0x4030)
*          09E5  e680       AND 0x80
*          09E7  321b44     LD (0x441b),A
*          09EA  210b44     LD HL,0x440b
*          09ED  111744     LD DE,0x4417
*          09F0  011144     LD BC,0x4411
*          09F3  cd300a     CALL 0x0a30
*          09F6  23         INC HL
*          09F7  13         INC DE
*          09F8  03         INC BC
*          09F9  cd300a     CALL 0x0a30
*          09FC  3a3240     LD A,(0x4032)
*          09FF  cb7f       BIT 7,A
*          0A01  2805       JR z,0x0a08
*          0A03  3e80       LD A,0x80
*          0A05  321b44     LD (0x441b),A
*  L_0A08: 0A08  111944     LD DE,0x4419
*          0A0B  210d44     LD HL,0x440d
*          0A0E  011344     LD BC,0x4413
*          0A11  cd300a     CALL 0x0a30
*          0A14  210440     LD HL,0x4004
*          0A17  3a0b44     LD A,(0x440b)
*          0A1A  07         RLCA
*          0A1B  3002       JR nc,0x0a1f
*          0A1D  cbc6       SET 0,(HL)
*  L_0A1F: 0A1F  3a0c44     LD A,(0x440c)
*          0A22  07         RLCA
*          0A23  3002       JR nc,0x0a27
*          0A25  cbce       SET 1,(HL)
*  L_0A27: 0A27  3a0d44     LD A,(0x440d)
*          0A2A  07         RLCA
*          0A2B  3002       JR nc,0x0a2f
*          0A2D  cbd6       SET 2,(HL)
*  L_0A2F: 0A2F  c9         RET
*  L_0A30: 0A30  cbbe       RES 7,(HL)
*          0A32  cb76       BIT 6,(HL)
*          0A34  202a       JR nz,0x0a60
*          0A36  cb6e       BIT 5,(HL)
*          0A38  282f       JR z,0x0a69
*          0A3A  0a         LD A,(BC)
*          0A3B  e61f       AND 0x1f
*          0A3D  ee03       XOR 3
*          0A3F  200c       JR nz,0x0a4d
*          0A41  cbf6       SET 6,(HL)
*          0A43  3a1b44     LD A,(0x441b)
*          0A46  b7         OR A
*          0A47  2804       JR z,0x0a4d
*          0A49  cbfe       SET 7,(HL)
*          0A4B  cbb6       RES 6,(HL)
*  L_0A4D: 0A4D  0a         LD A,(BC)
*          0A4E  07         RLCA
*          0A4F  cbc7       SET 0,A
*          0A51  02         LD (BC),A
*          0A52  34         INC (HL)
*          0A53  7e         LD A,(HL)
*          0A54  e61f       AND 0x1f
*          0A56  fe1e       CP 0x1e
*          0A58  d8         RET c
           0A59  7e         LD A,(HL)
           0A5A  e6be       AND 0xbe
           0A5C  f63e       OR 0x3e
           0A5E  77         LD (HL),A
           0A5F  c9         RET
*  L_0A60: 0A60  cb6e       BIT 5,(HL)
*          0A62  20e9       JR nz,0x0a4d
*          0A64  cbfe       SET 7,(HL)
*          0A66  1a         LD A,(DE)
*          0A67  3c         INC A
*          0A68  12         LD (DE),A
*  L_0A69: 0A69  0a         LD A,(BC)
*          0A6A  07         RLCA
*          0A6B  cb87       RES 0,A
*          0A6D  02         LD (BC),A
*          0A6E  7e         LD A,(HL)
*          0A6F  e680       AND 0x80
*          0A71  77         LD (HL),A
*          0A72  c9         RET
*  L_0A73: 0A73  3a0041     LD A,(0x4100)
*          0A76  e61f       AND 0x1f
*          0A78  c0         RET nz
           0A79  213140     LD HL,0x4031
           0A7C  cbc6       SET 0,(HL)
           0A7E  cbce       SET 1,(HL)
           0A80  cbd6       SET 2,(HL)
           0A82  3a0041     LD A,(0x4100)
           0A85  e620       AND 0x20
           0A87  c0         RET nz
           0A88  3a1744     LD A,(0x4417)
           0A8B  a7         AND A
           0A8C  2806       JR z,0x0a94
           0A8E  3d         DEC A
           0A8F  321744     LD (0x4417),A
           0A92  cb86       RES 0,(HL)
*          0A94  3a1844     LD A,(0x4418)
*          0A97  a7         AND A
*          0A98  2806       JR z,0x0aa0
*          0A9A  3d         DEC A
*          0A9B  321844     LD (0x4418),A
*          0A9E  cb8e       RES 1,(HL)
*  L_0AA0: 0AA0  3a1944     LD A,(0x4419)
*          0AA3  a7         AND A
*          0AA4  c8         RET z
           0AA5  3d         DEC A
           0AA6  321944     LD (0x4419),A
           0AA9  cb96       RES 2,(HL)
           0AAB  c9         RET
*  L_0AAC: 0AAC  3a0940     LD A,(0x4009)
*          0AAF  e601       AND 1
*          0AB1  201c       JR nz,0x0acf
*          0AB3  3a0840     LD A,(0x4008)
*          0AB6  e60f       AND 15
*          0AB8  fe05       CP 5
*          0ABA  3813       JR c,0x0acf
*          0ABC  fe06       CP 6
*          0ABE  3822       JR c,0x0ae2
*          0AC0  fe07       CP 7
*          0AC2  300b       JR nc,0x0acf
*          0AC4  3a1041     LD A,(0x4110)
*          0AC7  fe0f       CP 15
*          0AC9  2804       JR z,0x0acf
*          0ACB  fe1b       CP 0x1b
*          0ACD  2056       JR nz,0x0b25
*  L_0ACF: 0ACF  af         XOR A
*          0AD0  320050     LD (0x5000),A
*          0AD3  320050     LD (0x5000),A
*          0AD6  3e36       LD A,0x36
*          0AD8  320350     LD (0x5003),A
*          0ADB  210000     LD HL,0
*          0ADE  222044     LD (0x4420),HL
*          0AE1  c9         RET
*  L_0AE2: 0AE2  3a0040     LD A,(0x4000)
*          0AE5  87         ADD A,A
*          0AE6  21850b     LD HL,0xb85
*          0AE9  d7         RST 0x10
*          0AEA  e7         RST 0x20
*          0AEB  ed5b2044   LD DE,(0x4420)
*          0AEF  ed52       SBC HL,DE
*          0AF1  3815       JR c,0x0b08
*          0AF3  eb         EX DE,HL
*          0AF4  0608       LD B,8
*  L_0AF6: 0AF6  cb3a       SRL D
*          0AF8  cb1b       RR E
*          0AFA  10fa       DJNZ 0x0af6
*          0AFC  13         INC DE
*          0AFD  2a2044     LD HL,(0x4420)
*          0B00  19         ADD HL,DE
       0B01  db   '" DDM'
*          0B06  1834       JR 0x0b3c
*  L_0B08: 0B08  eb         EX DE,HL
*          0B09  af         XOR A
*          0B0A  67         LD H,A
*          0B0B  6f         LD L,A
*          0B0C  ed52       SBC HL,DE
*          0B0E  eb         EX DE,HL
*          0B0F  0605       LD B,5
*  L_0B11: 0B11  cb3a       SRL D
*          0B13  cb1b       RR E
*          0B15  10fa       DJNZ 0x0b11
*          0B17  13         INC DE
*          0B18  2a2044     LD HL,(0x4420)
*          0B1B  b7         OR A
*          0B1C  ed52       SBC HL,DE
       0B1E  db   '" DDM'
*          0B23  1817       JR 0x0b3c
*  L_0B25: 0B25  ed5b0a40   LD DE,(0x400a)
*          0B29  cb2a       SRA D
*          0B2B  cb1b       RR E
*          0B2D  cb7a       BIT 7,D
*          0B2F  2803       JR z,0x0b34
*          0B31  af         XOR A
*          0B32  57         LD D,A
*          0B33  5f         LD E,A
*  L_0B34: 0B34  212c01     LD HL,0x12c
*          0B37  19         ADD HL,DE
*          0B38  eb         EX DE,HL
*          0B39  cd640b     CALL 0x0b64
*  L_0B3C: 0B3C  60         LD H,B
*          0B3D  69         LD L,C
*          0B3E  cd490b     CALL 0x0b49
*          0B41  44         LD B,H
*          0B42  4d         LD C,L
*          0B43  210050     LD HL,0x5000
*          0B46  71         LD (HL),C
*          0B47  70         LD (HL),B
*          0B48  c9         RET
*  L_0B49: 0B49  3a2a44     LD A,(0x442a)
*          0B4C  c610       ADD A,0x10
*          0B4E  322a44     LD (0x442a),A
*          0B51  cb7f       BIT 7,A
*          0B53  ca5a0b     JP z,0x0b5a
*          0B56  f680       OR 0x80
*          0B58  ed44       NEG
*  L_0B5A: 0B5A  0f         RRCA
*          0B5B  0f         RRCA
*          0B5C  0f         RRCA
*          0B5D  e60f       AND 15
*          0B5F  5f         LD E,A
*          0B60  1600       LD D,0
*          0B62  19         ADD HL,DE
*          0B63  c9         RET
*  L_0B64: 0B64  215000     LD HL,0x50
*          0B67  010000     LD BC,0
*          0B6A  3e10       LD A,0x10
*  L_0B6C: 0B6C  ed52       SBC HL,DE
*          0B6E  380b       JR c,0x0b7b
*          0B70  cbc1       SET 0,C
*          0B72  29         ADD HL,HL
*          0B73  cb11       RL C
*          0B75  cb10       RL B
*          0B77  3d         DEC A
*          0B78  20f2       JR nz,0x0b6c
*          0B7A  c9         RET
*  L_0B7B: 0B7B  19         ADD HL,DE
*          0B7C  29         ADD HL,HL
*          0B7D  cb11       RL C
*          0B7F  cb10       RL B
*          0B81  3d         DEC A
*          0B82  20e8       JR nz,0x0b6c
*          0B84  c9         RET
           0B85  b8         CP B
           0B86  44         LD B,H
           0B87  281a       JR z,0x0ba3
           0B89  f0         RET p
           0B8A  12         LD (DE),A
           0B8B  d8         RET c
           0B8C  0e34       LD C,0x34
           0B8E  0c         INC C
           0B8F  a4         AND H
           0B90  0a         LD A,(BC)
           0B91  00         NOP
           0B92  09         ADD HL,BC
           0B93  f607       OR 7
           0B95  220776     LD (0x7607),HL
           0B98  06e8       LD B,0xe8
           0B9A  05         DEC B
           0B9B  70         LD (HL),B
           0B9C  05         DEC B
           0B9D  0a         LD A,(BC)
           0B9E  05         DEC B
           0B9F  c604       ADD A,4
           0BA1  92         SUB D
           0BA2  04         INC B
*          0BA3  64         LD H,H
*          0BA4  04         INC B
*  L_0BA5: 0BA5  3a6500     LD A,(0x0065)
*          0BA8  cb57       BIT 2,A
*          0BAA  c0         RET nz
           0BAB  212440     LD HL,0x4024
           0BAE  3601       LD (HL),1
*          0BB0  3a0840     LD A,(0x4008)
*          0BB3  fefe       CP 0xfe
*          0BB5  c8         RET z
           0BB6  7e         LD A,(HL)
           0BB7  fe02       CP 2
           0BB9  20f5       JR nz,0x0bb0
           0BBB  34         INC (HL)
*          0BBC  3a0840     LD A,(0x4008)
*          0BBF  fefe       CP 0xfe
*          0BC1  c8         RET z
           0BC2  7e         LD A,(HL)
           0BC3  fe04       CP 4
           0BC5  20f5       JR nz,0x0bbc
           0BC7  3c         INC A
           0BC8  3224c0     LD (0xc024),A
*          0BCB  3a0840     LD A,(0x4008)
*          0BCE  fefe       CP 0xfe
*          0BD0  c8         RET z
           0BD1  7e         LD A,(HL)
           0BD2  fe06       CP 6
           0BD4  20f5       JR nz,0x0bcb
           0BD6  c9         RET
*  L_0BD7: 0BD7  211c44     LD HL,0x441c
*          0BDA  7e         LD A,(HL)
*          0BDB  a7         AND A
*          0BDC  200e       JR nz,0x0bec
*          0BDE  36ff       LD (HL),0xff
*          0BE0  fb         EI
*          0BE1  320070     LD (0x7000),A
*          0BE4  f3         DI
*          0BE5  77         LD (HL),A
*          0BE6  3ef0       LD A,0xf0
*          0BE8  320141     LD (0x4101),A
*          0BEB  c9         RET
*  L_0BEC: 0BEC  3600       LD (HL),0
*          0BEE  3a0141     LD A,(0x4101)
*          0BF1  c601       ADD A,1
*          0BF3  320141     LD (0x4101),A
*          0BF6  3015       JR nc,0x0c0d
*          0BF8  3d         DEC A
*          0BF9  320141     LD (0x4101),A
*          0BFC  210440     LD HL,0x4004
*          0BFF  cbfe       SET 7,(HL)
*          0C01  3a6500     LD A,(0x0065)
*          0C04  cb5f       BIT 3,A
*          0C06  2805       JR z,0x0c0d
*          0C08  212b40     LD HL,0x402b
*          0C0B  cbd6       SET 2,(HL)
*  L_0C0D: 0C0D  210e00     LD HL,14
*          0C10  39         ADD HL,SP
*          0C11  f9         LD SP,HL
*          0C12  c9         RET
*  L_0C13: 0C13  3a0940     LD A,(0x4009)
*          0C16  e601       AND 1
*          0C18  2027       JR nz,0x0c41
*          0C1A  3a0840     LD A,(0x4008)
*          0C1D  e60f       AND 15
*          0C1F  fe05       CP 5
*          0C21  381e       JR c,0x0c41
*          0C23  fe07       CP 7
*          0C25  301a       JR nc,0x0c41
*          0C27  2a0e40     LD HL,(0x400e)
*          0C2A  af         XOR A
*          0C2B  b4         OR H
*          0C2C  b5         OR L
*          0C2D  2812       JR z,0x0c41
*          0C2F  217017     LD HL,0x1770
*          0C32  ed5b1840   LD DE,(0x4018)
*          0C36  19         ADD HL,DE
*          0C37  eb         EX DE,HL
*          0C38  cd640b     CALL 0x0b64
*          0C3B  210150     LD HL,0x5001
*          0C3E  71         LD (HL),C
*          0C3F  70         LD (HL),B
*          0C40  c9         RET
*  L_0C41: 0C41  3e76       LD A,0x76
*          0C43  320350     LD (0x5003),A
*          0C46  c9         RET
*  L_0C47: 0C47  3e0e       LD A,14
*          0C49  d341       OUT (0x0041),A
*          0C4B  db40       IN A,(0x0040)
*          0C4D  322840     LD (0x4028),A
*          0C50  e6c7       AND 0xc7
*          0C52  323040     LD (0x4030),A
*          0C55  3e0f       LD A,15
*          0C57  d341       OUT (0x0041),A
*          0C59  db40       IN A,(0x0040)
*          0C5B  322940     LD (0x4029),A
*          0C5E  e6ff       AND 0xff
       0C60  db   '22@:1@'
*          0C66  e607       AND 7
*          0C68  5f         LD E,A
*          0C69  3a2b40     LD A,(0x402b)
*          0C6C  e6f8       AND 0xf8
*          0C6E  b3         OR E
*          0C6F  322b40     LD (0x402b),A
*          0C72  3e0f       LD A,15
*          0C74  d381       OUT (0x0081),A
*          0C76  3a2b40     LD A,(0x402b)
*          0C79  d380       OUT (0x0080),A
*          0C7B  3e0e       LD A,14
*          0C7D  d381       OUT (0x0081),A
*          0C7F  3a2240     LD A,(0x4022)
*          0C82  d380       OUT (0x0080),A
*          0C84  322a40     LD (0x402a),A
*          0C87  c9         RET
*  L_0C88: 0C88  3a0940     LD A,(0x4009)
*          0C8B  1e00       LD E,0
*          0C8D  cb6f       BIT 5,A
*          0C8F  2802       JR z,0x0c93
*          0C91  1eff       LD E,0xff
*  L_0C93: 0C93  7b         LD A,E
*          0C94  320241     LD (0x4102),A
*          0C97  210000     LD HL,0
*          0C9A  ed4b1240   LD BC,(0x4012)
*          0C9E  09         ADD HL,BC
*          0C9F  09         ADD HL,BC
*          0CA0  09         ADD HL,BC
*          0CA1  eb         EX DE,HL
*          0CA2  210000     LD HL,0
*          0CA5  ed4b1a40   LD BC,(0x401a)
*          0CA9  09         ADD HL,BC
*          0CAA  09         ADD HL,BC
*          0CAB  09         ADD HL,BC
*          0CAC  af         XOR A
*          0CAD  ed52       SBC HL,DE
*          0CAF  eb         EX DE,HL
*          0CB0  cde40c     CALL 0x0ce4
*          0CB3  4f         LD C,A
*          0CB4  e60f       AND 15
*          0CB6  cdfb0c     CALL 0x0cfb
*          0CB9  e60f       AND 15
*          0CBB  5f         LD E,A
*          0CBC  3a0441     LD A,(0x4104)
*          0CBF  e6f0       AND 0xf0
*          0CC1  b3         OR E
*          0CC2  320441     LD (0x4104),A
*          0CC5  79         LD A,C
*          0CC6  0f         RRCA
*          0CC7  0f         RRCA
*          0CC8  0f         RRCA
*          0CC9  0f         RRCA
*          0CCA  e60f       AND 15
*          0CCC  cdfb0c     CALL 0x0cfb
*          0CCF  e60f       AND 15
*          0CD1  5f         LD E,A
*          0CD2  3a0441     LD A,(0x4104)
*          0CD5  e60f       AND 15
*          0CD7  cb0b       RRC E
*          0CD9  cb0b       RRC E
*          0CDB  cb0b       RRC E
*          0CDD  cb0b       RRC E
*          0CDF  b3         OR E
*          0CE0  320441     LD (0x4104),A
*          0CE3  c9         RET
*  L_0CE4: 0CE4  21e007     LD HL,0x7e0
*          0CE7  19         ADD HL,DE
*          0CE8  cb7c       BIT 7,H
*          0CEA  2803       JR z,0x0cef
*          0CEC  2600       LD H,0
*          0CEE  6c         LD L,H
*  L_0CEF: 0CEF  7c         LD A,H
*          0CF0  e60f       AND 15
*          0CF2  6f         LD L,A
*          0CF3  2600       LD H,0
*          0CF5  11220d     LD DE,0xd22
*          0CF8  19         ADD HL,DE
*          0CF9  7e         LD A,(HL)
*          0CFA  c9         RET
*  L_0CFB: 0CFB  2a1840     LD HL,(0x4018)
*          0CFE  110001     LD DE,0x100
*          0D01  19         ADD HL,DE
*          0D02  5d         LD E,L
*          0D03  54         LD D,H
*          0D04  210001     LD HL,0x100
*          0D07  a7         AND A
*          0D08  2804       JR z,0x0d0e
*          0D0A  ed52       SBC HL,DE
*          0D0C  3802       JR c,0x0d10
*  L_0D0E: 0D0E  af         XOR A
*          0D0F  c9         RET
*  L_0D10: 0D10  113001     LD DE,0x130
*          0D13  19         ADD HL,DE
*          0D14  30f8       JR nc,0x0d0e
*          0D16  47         LD B,A
*          0D17  5d         LD E,L
*          0D18  54         LD D,H
*          0D19  2e00       LD L,0
*          0D1B  2600       LD H,0
*  L_0D1D: 0D1D  19         ADD HL,DE
*          0D1E  10fd       DJNZ 0x0d1d
*          0D20  7c         LD A,H
*          0D21  c9         RET
           0D22  f1         POP AF
           0D23  f2f4f6     JP p,0xf6f4
           0D26  f8         RET m
           0D27  fafced     JP m,0xedfc
           0D2A  decf       SBC A,0xcf
           0D2C  af         XOR A
           0D2D  8f         ADC A,A
           0D2E  6f         LD L,A
           0D2F  4f         LD C,A
           0D30  2f         CPL
           0D31  1f         RRA
*  L_0D32: 0D32  3a3040     LD A,(0x4030)
*          0D35  210440     LD HL,0x4004
*          0D38  cb7f       BIT 7,A
*          0D3A  2804       JR z,0x0d40
*          0D3C  cbf6       SET 6,(HL)
*          0D3E  1802       JR 0x0d42
*  L_0D40: 0D40  cbb6       RES 6,(HL)
*  L_0D42: 0D42  210540     LD HL,0x4005
*          0D45  cb77       BIT 6,A
*          0D47  2804       JR z,0x0d4d
*          0D49  cbc6       SET 0,(HL)
*          0D4B  1802       JR 0x0d4f
*  L_0D4D: 0D4D  cb86       RES 0,(HL)
*  L_0D4F: 0D4F  3a3240     LD A,(0x4032)
*          0D52  e6fc       AND 0xfc
*          0D54  5f         LD E,A
*          0D55  7e         LD A,(HL)
*          0D56  e603       AND 3
*          0D58  b3         OR E
*          0D59  77         LD (HL),A
*          0D5A  c9         RET
           0D5B  00         NOP
           0D5C  00         NOP
           0D5D  00         NOP
           0D5E  00         NOP
           0D5F  00         NOP
           0D60  00         NOP
           0D61  00         NOP
           0D62  00         NOP
           0D63  00         NOP
           0D64  00         NOP
           0D65  00         NOP
           0D66  00         NOP
           0D67  60         LD H,B
           0D68  02         LD (BC),A
           0D69  60         LD H,B
           0D6A  02         LD (BC),A
           0D6B  60         LD H,B
           0D6C  02         LD (BC),A
           0D6D  60         LD H,B
           0D6E  02         LD (BC),A
           0D6F  60         LD H,B
           0D70  02         LD (BC),A
           0D71  60         LD H,B
           0D72  02         LD (BC),A
           0D73  be         CP (HL)
           0D74  0d         DEC C
           0D75  bb         CP E
           0D76  0d         DEC C
           0D77  60         LD H,B
           0D78  02         LD (BC),A
           0D79  be         CP (HL)
           0D7A  0d         DEC C
           0D7B  bb         CP E
           0D7C  0d         DEC C
           0D7D  60         LD H,B
           0D7E  02         LD (BC),A
           0D7F  de0d       SBC A,13
           0D81  60         LD H,B
           0D82  02         LD (BC),A
           0D83  60         LD H,B
           0D84  02         LD (BC),A
           0D85  de0d       SBC A,13
           0D87  60         LD H,B
           0D88  02         LD (BC),A
           0D89  60         LD H,B
           0D8A  02         LD (BC),A
           0D8B  e7         RST 0x20
           0D8C  0d         DEC C
           0D8D  60         LD H,B
           0D8E  02         LD (BC),A
           0D8F  60         LD H,B
           0D90  02         LD (BC),A
           0D91  e7         RST 0x20
           0D92  0d         DEC C
           0D93  60         LD H,B
           0D94  02         LD (BC),A
           0D95  60         LD H,B
           0D96  02         LD (BC),A
           0D97  f0         RET p
           0D98  0d         DEC C
           0D99  f0         RET p
           0D9A  0d         DEC C
           0D9B  f0         RET p
           0D9C  0d         DEC C
           0D9D  f0         RET p
           0D9E  0d         DEC C
           0D9F  f0         RET p
           0DA0  0d         DEC C
           0DA1  f0         RET p
           0DA2  0d         DEC C
           0DA3  02         LD (BC),A
           0DA4  0e60       LD C,0x60
           0DA6  02         LD (BC),A
           0DA7  60         LD H,B
           0DA8  02         LD (BC),A
           0DA9  02         LD (BC),A
           0DAA  0e60       LD C,0x60
           0DAC  02         LD (BC),A
           0DAD  60         LD H,B
           0DAE  02         LD (BC),A
           0DAF  0c         INC C
           0DB0  0e60       LD C,0x60
           0DB2  02         LD (BC),A
           0DB3  60         LD H,B
           0DB4  02         LD (BC),A
           0DB5  0c         INC C
*  L_0DB6: 0DB6  0e60       LD C,0x60
*          0DB8  02         LD (BC),A
*          0DB9  60         LD H,B
*          0DBA  02         LD (BC),A
*          0DBB  4e         LD C,(HL)
*          0DBC  ff         RST 0x38
*          0DBD  ff         RST 0x38
*          0DBE  3ea0       LD A,0xa0
*  L_0DC0: 0DC0  106e       DJNZ 0x0e30
*          0DC2  08         EX AF,AF'
*          0DC3  e0         RET po
           0DC4  97         SUB A
           0DC5  e0         RET po
           0DC6  cae0b4     JP z,0xb4e0
           0DC9  e0         RET po
           0DCA  97         SUB A
           0DCB  e0         RET po
           0DCC  b4         OR H
           0DCD  e0         RET po
           0DCE  f0         RET p
           0DCF  e0         RET po
           0DD0  cae097     JP z,0x97e0
           0DD3  e0         RET po
           0DD4  b4         OR H
           0DD5  e0         RET po
           0DD6  cae0b4     JP z,0xb4e0
           0DD9  e0         RET po
           0DDA  97         SUB A
           0DDB  0e00       LD C,0
           0DDD  00         NOP
           0DDE  3e10       LD A,0x10
           0DE0  08         EX AF,AF'
           0DE1  ef         RST 0x28
           0DE2  1f         RRA
*  L_0DE3: 0DE3  04         INC B
*          0DE4  0e00       LD C,0
*          0DE6  00         NOP
*          0DE7  3e10       LD A,0x10
*  L_0DE9: 0DE9  08         EX AF,AF'
*          0DEA  ef         RST 0x28
*          0DEB  1004       DJNZ 0x0df1
*          0DED  0e00       LD C,0
*          0DEF  00         NOP
*          0DF0  3eb0       LD A,0xb0
*          0DF2  20ef       JR nz,0x0de3
*          0DF4  1f         RRA
*          0DF5  103e       DJNZ 0x0e35
*          0DF7  b0         OR B
*          0DF8  10ef       DJNZ 0x0de9
*          0DFA  00         NOP
*          0DFB  08         EX AF,AF'
*          0DFC  fe00       CP 0
*          0DFE  40         LD B,B
*          0DFF  0e00       LD C,0
*          0E01  00         NOP
*          0E02  9e         SBC A,(HL)
*  L_0E03: 0E03  10fe       DJNZ 0x0e03
*          0E05  00         NOP
*          0E06  10ae       DJNZ 0x0db6
*          0E08  100e       DJNZ 0x0e18
*          0E0A  00         NOP
*          0E0B  00         NOP
*          0E0C  9e         SBC A,(HL)
*  L_0E0D: 0E0D  20fe       JR nz,0x0e0d
*          0E0F  00         NOP
*          0E10  10ae       DJNZ 0x0dc0
*          0E12  200e       JR nz,0x0e22
*          0E14  00         NOP
*          0E15  00         NOP
*          0E16  5e         LD E,(HL)
*          0E17  0e6d       LD C,0x6d
*          0E19  0e7c       LD C,0x7c
*          0E1B  0e5e       LD C,0x5e
*          0E1D  0e6d       LD C,0x6d
*          0E1F  0e7c       LD C,0x7c
*          0E21  0e14       LD C,0x14
*          0E23  0f         RRCA
*          0E24  310f52     LD SP,0x520f
*          0E27  0f         RRCA
*          0E28  14         INC D
*          0E29  0f         RRCA
*          0E2A  310f52     LD SP,0x520f
*          0E2D  0f         RRCA
*          0E2E  91         SUB C
*          0E2F  0e8e       LD C,0x8e
*          0E31  0e8b       LD C,0x8b
*          0E33  0e91       LD C,0x91
*  L_0E35: 0E35  0e8e       LD C,0x8e
*          0E37  0e8b       LD C,0x8b
*          0E39  0eac       LD C,0xac
*          0E3B  0ea9       LD C,0xa9
*          0E3D  0ea6       LD C,0xa6
*          0E3F  0eac       LD C,0xac
*          0E41  0ea9       LD C,0xa9
*          0E43  0ea6       LD C,0xa6
*          0E45  0ec7       LD C,0xc7
*          0E47  0ec4       LD C,0xc4
*          0E49  0ec1       LD C,0xc1
*          0E4B  0ec7       LD C,0xc7
*          0E4D  0ec4       LD C,0xc4
*  L_0E4F: 0E4F  0ec1       LD C,0xc1
*          0E51  0eeb       LD C,0xeb
*          0E53  0ee8       LD C,0xe8
*          0E55  0ee5       LD C,0xe5
*          0E57  0eeb       LD C,0xeb
*          0E59  0ee8       LD C,0xe8
*          0E5B  0ee5       LD C,0xe5
*          0E5D  0e3e       LD C,0x3e
*          0E5F  b0         OR B
*          0E60  20ed       JR nz,0x0e4f
*          0E62  1d         DEC E
*          0E63  103e       DJNZ 0x0ea3
*          0E65  b0         OR B
*          0E66  08         EX AF,AF'
*          0E67  ecf040     CALL pe,0x40f0
*          0E6A  0e00       LD C,0
*          0E6C  00         NOP
*          0E6D  3eb0       LD A,0xb0
*          0E6F  10eb       DJNZ 0x0e5c
*          0E71  1d         DEC E
*          0E72  103e       DJNZ 0x0eb2
*          0E74  b0         OR B
*          0E75  08         EX AF,AF'
*          0E76  ecf840     CALL pe,0x40f8
*          0E79  0e00       LD C,0
*          0E7B  00         NOP
*          0E7C  3eb0       LD A,0xb0
*          0E7E  08         EX AF,AF'
*          0E7F  ef         RST 0x28
*          0E80  1d         DEC E
*          0E81  103e       DJNZ 0x0ec1
*          0E83  b0         OR B
*          0E84  08         EX AF,AF'
*          0E85  ef         RST 0x28
*          0E86  00         NOP
*          0E87  40         LD B,B
*          0E88  0e00       LD C,0
*          0E8A  00         NOP
*          0E8B  4e         LD C,(HL)
*          0E8C  ff         RST 0x38
*          0E8D  ff         RST 0x38
*          0E8E  4e         LD C,(HL)
*          0E8F  ff         RST 0x38
*  L_0E90: 0E90  ff         RST 0x38
*          0E91  3e10       LD A,0x10
*          0E93  40         LD B,B
*          0E94  e2fa02     JP po,0x02fa
*          0E97  ce60       ADC A,0x60
*          0E99  5e         LD E,(HL)
*          0E9A  e2fa04     JP po,0x04fa
*          0E9D  4e         LD C,(HL)
*          0E9E  fdff       RST 0x38
*          0EA0  be         CP (HL)
*          0EA1  99         SBC A,C
*          0EA2  0e0e       LD C,14
*          0EA4  00         NOP
*          0EA5  00         NOP
*          0EA6  4e         LD C,(HL)
*          0EA7  ff         RST 0x38
*          0EA8  ff         RST 0x38
*          0EA9  4e         LD C,(HL)
*          0EAA  ff         RST 0x38
*          0EAB  ff         RST 0x38
*          0EAC  3e10       LD A,0x10
*          0EAE  40         LD B,B
*          0EAF  e0         RET po
           0EB0  80         ADD A,B
           0EB1  02         LD (BC),A
*  L_0EB2: 0EB2  ce60       ADC A,0x60
*          0EB4  5e         LD E,(HL)
*          0EB5  e0         RET po
           0EB6  80         ADD A,B
           0EB7  04         INC B
           0EB8  4e         LD C,(HL)
           0EB9  03         INC BC
           0EBA  00         NOP
           0EBB  be         CP (HL)
           0EBC  b4         OR H
           0EBD  0e0e       LD C,14
           0EBF  00         NOP
           0EC0  00         NOP
*  L_0EC1: 0EC1  4e         LD C,(HL)
*  L_0EC2: 0EC2  f8         RET m
           0EC3  ff         RST 0x38
           0EC4  4e         LD C,(HL)
           0EC5  f8         RET m
           0EC6  ff         RST 0x38
           0EC7  3e10       LD A,0x10
           0EC9  04         INC B
           0ECA  2ee2       LD L,0xe2
           0ECC  3b         DEC SP
           0ECD  40         LD B,B
           0ECE  2ee2       LD L,0xe2
           0ED0  81         ADD A,C
           0ED1  33         INC SP
*          0ED2  2ee2       LD L,0xe2
*          0ED4  a7         AND A
*          0ED5  29         ADD HL,HL
*          0ED6  2ee2       LD L,0xe2
*          0ED8  fa212e     JP m,0x2e21
*          0EDB  e3         EX (SP),HL
*          0EDC  57         LD D,A
*          0EDD  1a         LD A,(DE)
*          0EDE  2ee3       LD L,0xe3
*          0EE0  8a         ADC A,D
*          0EE1  80         ADD A,B
*          0EE2  0e00       LD C,0
*          0EE4  00         NOP
*          0EE5  4e         LD C,(HL)
*          0EE6  ff         RST 0x38
*          0EE7  ff         RST 0x38
*          0EE8  4e         LD C,(HL)
*          0EE9  ff         RST 0x38
*          0EEA  ff         RST 0x38
*          0EEB  3e10       LD A,0x10
*          0EED  20e0       JR nz,0x0ecf
*          0EEF  ff         RST 0x38
*          0EF0  04         INC B
*          0EF1  8e         ADC A,(HL)
*          0EF2  10ce       DJNZ 0x0ec2
*          0EF4  08         EX AF,AF'
*          0EF5  4e         LD C,(HL)
*          0EF6  f0         RET p
           0EF7  ff         RST 0x38
           0EF8  5e         LD E,(HL)
           0EF9  e0         RET po
           0EFA  ff         RST 0x38
           0EFB  02         LD (BC),A
           0EFC  be         CP (HL)
           0EFD  f5         PUSH AF
           0EFE  0ece       LD C,0xce
           0F00  08         EX AF,AF'
*          0F01  4e         LD C,(HL)
*          0F02  1000       DJNZ 0x0f04
*  L_0F04: 0F04  5e         LD E,(HL)
*          0F05  e0         RET po
           0F06  ff         RST 0x38
           0F07  02         LD (BC),A
           0F08  be         CP (HL)
           0F09  010f4e     LD BC,0x4e0f
*          0F0C  fcff7e     CALL m,0x7eff
*          0F0F  f3         DI
*          0F10  0e0e       LD C,14
*          0F12  00         NOP
*  L_0F13: 0F13  00         NOP
*          0F14  9e         SBC A,(HL)
*          0F15  40         LD B,B
*          0F16  3eb0       LD A,0xb0
*  L_0F18: 0F18  08         EX AF,AF'
*          0F19  ed1d       
*          0F1B  203e       JR nz,0x0f5b
*          0F1D  b0         OR B
*          0F1E  20eb       JR nz,0x0f0b
*  L_0F20: 0F20  80         ADD A,B
*          0F21  103e       DJNZ 0x0f61
*          0F23  b0         OR B
*          0F24  20ed       JR nz,0x0f13
*          0F26  80         ADD A,B
*          0F27  183e       JR 0x0f67
           0F29  b0         OR B
*          0F2A  20ec       JR nz,0x0f18
*          0F2C  f0         RET p
           0F2D  f0         RET p
           0F2E  0e00       LD C,0
           0F30  00         NOP
           0F31  3eb0       LD A,0xb0
*          0F33  20eb       JR nz,0x0f20
*          0F35  1d         DEC E
*          0F36  203e       JR nz,0x0f76
*          0F38  b0         OR B
*  L_0F39: 0F39  20ed       JR nz,0x0f28
*          0F3B  ff         RST 0x38
*          0F3C  183e       JR 0x0f7c
           0F3E  b0         OR B
           0F3F  20eb       JR nz,0x0f2c
*          0F41  ff         RST 0x38
*          0F42  183e       JR 0x0f82
           0F44  b0         OR B
           0F45  20ec       JR nz,0x0f33
           0F47  ff         RST 0x38
           0F48  183e       JR 0x0f88
           0F4A  b0         OR B
*  L_0F4B: 0F4B  20ec       JR nz,0x0f39
*          0F4D  f8         RET m
           0F4E  f0         RET p
*          0F4F  0e00       LD C,0
*          0F51  00         NOP
*          0F52  3eb0       LD A,0xb0
*          0F54  10ea       DJNZ 0x0f40
*          0F56  1d         DEC E
*  L_0F57: 0F57  203e       JR nz,0x0f97
*          0F59  b0         OR B
*          0F5A  20ef       JR nz,0x0f4b
*          0F5C  1008       DJNZ 0x0f66
*          0F5E  3eb0       LD A,0xb0
*          0F60  20ea       JR nz,0x0f4c
*          0F62  1f         RRA
*          0F63  203e       JR nz,0x0fa3
*          0F65  b0         OR B
*  L_0F66: 0F66  20ef       JR nz,0x0f57
*          0F68  1c         INC E
*          0F69  203e       JR nz,0x0fa9
*          0F6B  b0         OR B
*          0F6C  20ed       JR nz,0x0f5b
*          0F6E  1f         RRA
*          0F6F  f0         RET p
           0F70  0e00       LD C,0
           0F72  00         NOP
           0F73  8e         ADC A,(HL)
           0F74  0f         RRCA
           0F75  8b         ADC A,E
*  L_0F76: 0F76  0f         RRCA
*          0F77  88         ADC A,B
*          0F78  0f         RRCA
*          0F79  82         ADD A,D
*          0F7A  0f         RRCA
*          0F7B  82         ADD A,D
*  L_0F7C: 0F7C  0f         RRCA
*          0F7D  7f         LD A,A
*          0F7E  0f         RRCA
*          0F7F  4e         LD C,(HL)
*          0F80  feff       CP 0xff
*  L_0F82: 0F82  4e         LD C,(HL)
*          0F83  feff       CP 0xff
*          0F85  4e         LD C,(HL)
*          0F86  feff       CP 0xff
*          0F88  4e         LD C,(HL)
*          0F89  feff       CP 0xff
*          0F8B  4e         LD C,(HL)
*          0F8C  feff       CP 0xff
*          0F8E  4e         LD C,(HL)
*          0F8F  feff       CP 0xff
*          0F91  3e20       LD A,0x20
*          0F93  08         EX AF,AF'
*          0F94  e0         RET po
           0F95  d6ff       SUB 0xff
*  L_0F97: 0F97  0e00       LD C,0
*          0F99  00         NOP
*          0F9A  ac         XOR H
*          0F9B  0f         RRCA
*          0F9C  a9         XOR C
*          0F9D  0f         RRCA
*          0F9E  a6         AND (HL)
*          0F9F  0f         RRCA
*          0FA0  ac         XOR H
*          0FA1  0f         RRCA
*          0FA2  a9         XOR C
*  L_0FA3: 0FA3  0f         RRCA
*          0FA4  a6         AND (HL)
*          0FA5  0f         RRCA
*          0FA6  4e         LD C,(HL)
*          0FA7  feff       CP 0xff
*  L_0FA9: 0FA9  4e         LD C,(HL)
*          0FAA  feff       CP 0xff
*          0FAC  3eb0       LD A,0xb0
*          0FAE  08         EX AF,AF'
*          0FAF  ce0c       ADC A,12
*          0FB1  e0         RET po
           0FB2  8f         ADC A,A
           0FB3  08         EX AF,AF'
           0FB4  e0         RET po
           0FB5  aa         XOR D
           0FB6  08         EX AF,AF'
           0FB7  be         CP (HL)
           0FB8  b1         OR C
           0FB9  0f         RRCA
           0FBA  3eb0       LD A,0xb0
           0FBC  10e0       DJNZ 0x0f9e
           0FBE  8f         ADC A,A
           0FBF  ff         RST 0x38
           0FC0  0e00       LD C,0
           0FC2  00         NOP
           0FC3  23         INC HL
           0FC4  1029       DJNZ 0x0fef
           0FC6  1060       DJNZ 0x1028
           0FC8  02         LD (BC),A
           0FC9  23         INC HL
           0FCA  1029       DJNZ 0x0ff5
           0FCC  1060       DJNZ 0x102e
           0FCE  02         LD (BC),A
           0FCF  2f         CPL
           0FD0  1035       DJNZ 0x1007
           0FD2  1060       DJNZ 0x1034
           0FD4  02         LD (BC),A
           0FD5  2f         CPL
           0FD6  1035       DJNZ 0x100d
           0FD8  1060       DJNZ 0x103a
           0FDA  02         LD (BC),A
           0FDB  3b         DEC SP
           0FDC  1041       DJNZ 0x101f
           0FDE  1060       DJNZ 0x1040
           0FE0  02         LD (BC),A
           0FE1  3b         DEC SP
           0FE2  1041       DJNZ 0x1025
*  L_0FE4: 0FE4  1060       DJNZ 0x1046
*          0FE6  02         LD (BC),A
*  L_0FE7: 0FE7  47         LD B,A
*          0FE8  104d       DJNZ 0x1037
*          0FEA  1060       DJNZ 0x104c
*          0FEC  02         LD (BC),A
*          0FED  47         LD B,A
*  L_0FEE: 0FEE  104d       DJNZ 0x103d
*  L_0FF0: 0FF0  1060       DJNZ 0x1052
*          0FF2  02         LD (BC),A
*          0FF3  53         LD D,E
*          0FF4  1059       DJNZ 0x104f
*  L_0FF6: 0FF6  1060       DJNZ 0x1058
*          0FF8  02         LD (BC),A
*          0FF9  53         LD D,E
*          0FFA  1059       DJNZ 0x1055
*          0FFC  1060       DJNZ 0x105e
*          0FFE  02         LD (BC),A
*          0FFF  5f         LD E,A
*          1000  1065       DJNZ 0x1067
*  L_1002: 1002  1060       DJNZ 0x1064
*          1004  02         LD (BC),A
*          1005  5f         LD E,A
*          1006  1065       DJNZ 0x106d
*          1008  1060       DJNZ 0x106a
*          100A  02         LD (BC),A
*          100B  6b         LD L,E
*          100C  1071       DJNZ 0x107f
*          100E  1060       DJNZ 0x1070
*          1010  02         LD (BC),A
*          1011  6b         LD L,E
*          1012  1071       DJNZ 0x1085
*          1014  1060       DJNZ 0x1076
*          1016  02         LD (BC),A
*          1017  77         LD (HL),A
*          1018  107d       DJNZ 0x1097
*          101A  1060       DJNZ 0x107c
*          101C  02         LD (BC),A
*          101D  77         LD (HL),A
*          101E  107d       DJNZ 0x109d
*          1020  1060       DJNZ 0x1082
*          1022  02         LD (BC),A
*  L_1023: 1023  10d6       DJNZ 0x0ffb
*          1025  100e       DJNZ 0x1035
*          1027  00         NOP
*          1028  00         NOP
*          1029  10d7       DJNZ 0x1002
*          102B  100e       DJNZ 0x103b
*          102D  00         NOP
*          102E  00         NOP
*          102F  10be       DJNZ 0x0fef
*          1031  100e       DJNZ 0x1041
*          1033  00         NOP
*          1034  00         NOP
*  L_1035: 1035  10bf       DJNZ 0x0ff6
*  L_1037: 1037  100e       DJNZ 0x1047
*          1039  00         NOP
*          103A  00         NOP
*  L_103B: 103B  10aa       DJNZ 0x0fe7
*  L_103D: 103D  100e       DJNZ 0x104d
*          103F  00         NOP
*          1040  00         NOP
*  L_1041: 1041  10ab       DJNZ 0x0fee
*          1043  100e       DJNZ 0x1053
*          1045  00         NOP
*  L_1046: 1046  00         NOP
*  L_1047: 1047  10a0       DJNZ 0x0fe9
*          1049  100e       DJNZ 0x1059
*          104B  00         NOP
*  L_104C: 104C  00         NOP
*  L_104D: 104D  10a1       DJNZ 0x0ff0
*  L_104F: 104F  100e       DJNZ 0x105f
*          1051  00         NOP
*  L_1052: 1052  00         NOP
*  L_1053: 1053  108f       DJNZ 0x0fe4
*  L_1055: 1055  100e       DJNZ 0x1065
*          1057  00         NOP
*  L_1058: 1058  00         NOP
*  L_1059: 1059  1090       DJNZ 0x0feb
*  L_105B: 105B  100e       DJNZ 0x106b
*          105D  00         NOP
*  L_105E: 105E  00         NOP
*  L_105F: 105F  107f       DJNZ 0x10e0
*          1061  100e       DJNZ 0x1071
*          1063  00         NOP
*  L_1064: 1064  00         NOP
*  L_1065: 1065  1080       DJNZ 0x0fe7
*  L_1067: 1067  100e       DJNZ 0x1077
*          1069  00         NOP
*  L_106A: 106A  00         NOP
*  L_106B: 106B  1071       DJNZ 0x10de
*  L_106D: 106D  100e       DJNZ 0x107d
*          106F  00         NOP
*  L_1070: 1070  00         NOP
*  L_1071: 1071  1072       DJNZ 0x10e5
*          1073  100e       DJNZ 0x1083
*          1075  00         NOP
*  L_1076: 1076  00         NOP
*  L_1077: 1077  106b       DJNZ 0x10e4
*          1079  100e       DJNZ 0x1089
*          107B  00         NOP
*  L_107C: 107C  00         NOP
*  L_107D: 107D  106c       DJNZ 0x10eb
*  L_107F: 107F  100e       DJNZ 0x108f
*          1081  00         NOP
*  L_1082: 1082  00         NOP
*  L_1083: 1083  8f         ADC A,A
*          1084  10c1       DJNZ 0x1047
*          1086  10c7       DJNZ 0x104f
*          1088  108f       DJNZ 0x1019
*          108A  10c1       DJNZ 0x104d
*          108C  10c7       DJNZ 0x1055
*          108E  103e       DJNZ 0x10ce
*          1090  a0         AND B
*          1091  106e       DJNZ 0x1101
*          1093  188e       JR 0x1023
           1095  04         INC B
           1096  e1         POP HL
*  L_1097: 1097  53         LD D,E
*          1098  e1         POP HL
*          1099  0d         DEC C
*          109A  e1         POP HL
*          109B  2ee0       LD L,0xe0
*  L_109D: 109D  fee1       CP 0xe1
*          109F  0d         DEC C
*          10A0  e0         RET po
           10A1  e2e0fe     JP po,0xfee0
           10A4  e0         RET po
           10A5  ca7e96     JP z,0x967e
           10A8  10e0       DJNZ 0x108a
           10AA  b4         OR H
           10AB  e0         RET po
           10AC  fee0       CP 0xe0
           10AE  e2e0ca     JP po,0xcae0
           10B1  e0         RET po
           10B2  b4         OR H
           10B3  e0         RET po
           10B4  e2e0ca     JP po,0xcae0
           10B7  e0         RET po
           10B8  b4         OR H
           10B9  6e         LD L,(HL)
           10BA  00         NOP
           10BB  e0         RET po
           10BC  aa         XOR D
           10BD  90         SUB B
           10BE  0e00       LD C,0
           10C0  00         NOP
           10C1  4e         LD C,(HL)
*  L_10C2: 10C2  feff       CP 0xff
*          10C4  0e8f       LD C,0x8f
*          10C6  103e       DJNZ 0x1106
*          10C8  b0         OR B
*          10C9  106e       DJNZ 0x1139
*          10CB  188e       JR 0x105b
           10CD  04         INC B
*  L_10CE: 10CE  e0         RET po
           10CF  aa         XOR D
           10D0  e0         RET po
           10D1  87         ADD A,A
           10D2  e0         RET po
           10D3  97         SUB A
           10D4  e0         RET po
           10D5  7f         LD A,A
           10D6  e0         RET po
           10D7  87         ADD A,A
           10D8  e0         RET po
           10D9  71         LD (HL),C
           10DA  e0         RET po
           10DB  7f         LD A,A
           10DC  e0         RET po
           10DD  65         LD H,L
*  L_10DE: 10DE  7e         LD A,(HL)
*          10DF  ce10       ADC A,0x10
*          10E1  e0         RET po
*          10E2  5a         LD E,D
*          10E3  e0         RET po
*  L_10E4: 10E4  7f         LD A,A
*  L_10E5: 10E5  e0         RET po
           10E6  71         LD (HL),C
           10E7  e0         RET po
           10E8  65         LD H,L
           10E9  e0         RET po
*  L_10EA: 10EA  5a         LD E,D
*  L_10EB: 10EB  e0         RET po
           10EC  71         LD (HL),C
           10ED  e0         RET po
           10EE  65         LD H,L
           10EF  e0         RET po
           10F0  5a         LD E,D
           10F1  6e         LD L,(HL)
           10F2  00         NOP
*  L_10F3: 10F3  e0         RET po
           10F4  55         LD D,L
           10F5  90         SUB B
           10F6  0e00       LD C,0
           10F8  00         NOP
*  L_10F9: 10F9  05         DEC B
*          10FA  115511     LD DE,0x1155
*          10FD  71         LD (HL),C
*  L_10FE: 10FE  112d11     LD DE,0x112d
*  L_1101: 1101  7a         LD A,D
*          1102  118311     LD DE,0x1183
*          1105  3ea0       LD A,0xa0
*          1107  10e1       DJNZ 0x10ea
*          1109  40         LD B,B
*          110A  40         LD B,B
*          110B  e1         POP HL
*          110C  40         LD B,B
*          110D  203e       JR nz,0x114d
*          110F  a0         AND B
*          1110  20e1       JR nz,0x10f3
*          1112  1d         DEC E
*          1113  60         LD H,B
*          1114  3ea0       LD A,0xa0
*          1116  10e1       DJNZ 0x10f9
*          1118  40         LD B,B
*          1119  20e1       JR nz,0x10fc
*          111B  1d         DEC E
*          111C  20e0       JR nz,0x10fe
*          111E  fe20       CP 0x20
*          1120  3ea0       LD A,0xa0
*          1122  20e0       JR nz,0x1104
*          1124  d660       SUB 0x60
*          1126  5e         LD E,(HL)
*          1127  e0         RET po
           1128  d6c0       SUB 0xc0
*  L_112A: 112A  0e00       LD C,0
*          112C  00         NOP
*          112D  3ea0       LD A,0xa0
*          112F  10e0       DJNZ 0x1111
*          1131  fe40       CP 0x40
*          1133  e0         RET po
           1134  fe20       CP 0x20
           1136  3ea0       LD A,0xa0
           1138  20e0       JR nz,0x111a
           113A  e2603e     JP po,0x3e60
           113D  a0         AND B
           113E  10e0       DJNZ 0x1120
           1140  fe20       CP 0x20
*          1142  e0         RET po
           1143  e220e0     JP po,0xe020
           1146  d620       SUB 0x20
           1148  3ea0       LD A,0xa0
           114A  20e0       JR nz,0x112c
           114C  aa         XOR D
*  L_114D: 114D  60         LD H,B
*          114E  5e         LD E,(HL)
*          114F  e0         RET po
           1150  aa         XOR D
           1151  c0         RET nz
           1152  0e00       LD C,0
           1154  00         NOP
           1155  3ea0       LD A,0xa0
           1157  10e0       DJNZ 0x1139
           1159  d640       SUB 0x40
           115B  e0         RET po
           115C  d620       SUB 0x20
           115E  3ea0       LD A,0xa0
           1160  20e0       JR nz,0x1142
           1162  be         CP (HL)
           1163  60         LD H,B
           1164  fe00       CP 0
           1166  60         LD H,B
           1167  e0         RET po
           1168  8f         ADC A,A
           1169  60         LD H,B
           116A  5e         LD E,(HL)
           116B  e0         RET po
           116C  8f         ADC A,A
           116D  c0         RET nz
           116E  0e00       LD C,0
           1170  00         NOP
           1171  4e         LD C,(HL)
           1172  feff       CP 0xff
           1174  fe00       CP 0
           1176  04         INC B
           1177  0e2d       LD C,0x2d
           1179  114efe     LD DE,0xfe4e
           117C  ff         RST 0x38
           117D  fe00       CP 0
           117F  04         INC B
           1180  0e05       LD C,5
*          1182  114efe     LD DE,0xfe4e
*          1185  ff         RST 0x38
*          1186  fe00       CP 0
*          1188  04         INC B
*          1189  0e55       LD C,0x55
*          118B  119811     LD DE,0x1198
*          118E  b0         OR B
*          118F  116002     LD DE,0x260
*          1192  98         SBC A,B
*          1193  11b011     LD DE,0x11b0
*          1196  60         LD H,B
*          1197  02         LD (BC),A
*          1198  3ea0       LD A,0xa0
*          119A  188e       JR 0x112a
           119C  02         LD (BC),A
           119D  e0         RET po
           119E  87         ADD A,A
           119F  18e0       JR 0x1181
           11A1  e248e0     JP po,0xe048
           11A4  aa         XOR D
           11A5  78         LD A,B
           11A6  7e         LD A,(HL)
           11A7  9d         SBC A,L
           11A8  115ee0     LD DE,0xe05e
           11AB  aa         XOR D
           11AC  80         ADD A,B
           11AD  0e00       LD C,0
           11AF  00         NOP
           11B0  4e         LD C,(HL)
           11B1  feff       CP 0xff
           11B3  fe00       CP 0
           11B5  04         INC B
           11B6  0e98       LD C,0x98
           11B8  11d711     LD DE,0x11d7
           11BB  e9         JP (HL)
           11BC  11fb11     LD DE,0x11fb
           11BF  c5         PUSH BC
           11C0  11cb11     LD DE,0x11cb
           11C3  d1         POP DE
           11C4  11fe00     LD DE,0xfe
           11C7  0c         INC C
           11C8  0ed7       LD C,0xd7
           11CA  11fe00     LD DE,0xfe
           11CD  0c         INC C
           11CE  0ee9       LD C,0xe9
           11D0  11fe00     LD DE,0xfe
           11D3  0c         INC C
           11D4  0efb       LD C,0xfb
           11D6  113ef0     LD DE,0xf03e
           11D9  1c         INC E
           11DA  6e         LD L,(HL)
           11DB  19         ADD HL,DE
           11DC  e0         RET po
           11DD  fee0       CP 0xe0
           11DF  cae0be     JP z,0xbee0
           11E2  e0         RET po
           11E3  aa         XOR D
           11E4  e0         RET po
           11E5  be         CP (HL)
           11E6  0e00       LD C,0
           11E8  00         NOP
           11E9  3ef0       LD A,0xf0
           11EB  1c         INC E
           11EC  6e         LD L,(HL)
           11ED  19         ADD HL,DE
           11EE  e0         RET po
           11EF  7f         LD A,A
           11F0  e0         RET po
           11F1  65         LD H,L
           11F2  e0         RET po
           11F3  5f         LD E,A
           11F4  e0         RET po
           11F5  55         LD D,L
           11F6  e0         RET po
           11F7  5f         LD E,A
           11F8  0e00       LD C,0
           11FA  00         NOP
           11FB  4e         LD C,(HL)
           11FC  feff       CP 0xff
           11FE  0ed7       LD C,0xd7
           1200  111f12     LD DE,0x121f
*  L_1203: 1203  1612       LD D,0x12
*          1205  0d         DEC C
*          1206  12         LD (DE),A
*          1207  1f         RRA
*          1208  12         LD (DE),A
*          1209  1612       LD D,0x12
*          120B  0d         DEC C
*          120C  12         LD (DE),A
*          120D  3ea0       LD A,0xa0
*          120F  104e       DJNZ 0x125f
*          1211  fcff0e     CALL m,0x0eff
*          1214  22123e     LD (0x3e12),HL
*          1217  b0         OR B
*          1218  104e       DJNZ 0x1268
*          121A  feff       CP 0xff
*          121C  0e22       LD C,0x22
*          121E  12         LD (DE),A
*          121F  3ea0       LD A,0xa0
*          1221  10e0       DJNZ 0x1203
*          1223  6b         LD L,E
*          1224  06e0       LD B,0xe0
*          1226  5f         LD E,A
*          1227  06e0       LD B,0xe0
*          1229  55         LD D,L
*          122A  0c         INC C
*          122B  0e00       LD C,0
*          122D  00         NOP
*          122E  4c         LD C,H
*          122F  12         LD (DE),A
*          1230  49         LD C,C
*          1231  12         LD (DE),A
*          1232  46         LD B,(HL)
*          1233  12         LD (DE),A
*          1234  4c         LD C,H
*          1235  12         LD (DE),A
*          1236  49         LD C,C
*          1237  12         LD (DE),A
*          1238  46         LD B,(HL)
*          1239  12         LD (DE),A
*          123A  67         LD H,A
*          123B  12         LD (DE),A
*          123C  64         LD H,H
*          123D  12         LD (DE),A
*          123E  61         LD H,C
*          123F  12         LD (DE),A
*          1240  67         LD H,A
*          1241  12         LD (DE),A
*          1242  64         LD H,H
*          1243  12         LD (DE),A
*          1244  61         LD H,C
*          1245  12         LD (DE),A
*          1246  4e         LD C,(HL)
*          1247  ff         RST 0x38
*          1248  ff         RST 0x38
*          1249  4e         LD C,(HL)
*          124A  ff         RST 0x38
*          124B  ff         RST 0x38
*          124C  3e10       LD A,0x10
*          124E  40         LD B,B
*          124F  e2fa04     JP po,0x04fa
*          1252  ce20       ADC A,0x20
*          1254  5e         LD E,(HL)
*          1255  e2fa02     JP po,0x02fa
*          1258  4e         LD C,(HL)
*          1259  faffbe     JP m,0xbeff
*          125C  54         LD D,H
*          125D  12         LD (DE),A
*          125E  0e00       LD C,0
*          1260  00         NOP
*          1261  4e         LD C,(HL)
*          1262  f8         RET m
           1263  ff         RST 0x38
           1264  4e         LD C,(HL)
           1265  f8         RET m
           1266  ff         RST 0x38
           1267  3e10       LD A,0x10
           1269  04         INC B
*          126A  2ee3       LD L,0xe3
*          126C  57         LD D,A
*          126D  202e       JR nz,0x129d
*          126F  e3         EX (SP),HL
*          1270  8a         ADC A,D
*          1271  40         LD B,B
*  L_1272: 1272  0e00       LD C,0
*          1274  00         NOP
*          1275  a5         AND L
*          1276  12         LD (DE),A
*          1277  93         SUB E
*          1278  12         LD (DE),A
*          1279  81         ADD A,C
*          127A  12         LD (DE),A
*          127B  a5         AND L
*          127C  12         LD (DE),A
*          127D  93         SUB E
*          127E  12         LD (DE),A
*          127F  81         ADD A,C
*          1280  12         LD (DE),A
*          1281  3eb0       LD A,0xb0
*          1283  20ed       JR nz,0x1272
*          1285  1d         DEC E
*          1286  103e       DJNZ 0x12c6
*          1288  b0         OR B
*          1289  08         EX AF,AF'
*          128A  ecf040     CALL pe,0x40f0
*          128D  4e         LD C,(HL)
*          128E  02         LD (BC),A
*          128F  00         NOP
*          1290  0eb1       LD C,0xb1
*          1292  12         LD (DE),A
*          1293  3eb0       LD A,0xb0
*          1295  10eb       DJNZ 0x1282
*          1297  1d         DEC E
*          1298  103e       DJNZ 0x12d8
*          129A  b0         OR B
*          129B  08         EX AF,AF'
*          129C  ecf840     CALL pe,0x40f8
*          129F  4e         LD C,(HL)
*          12A0  02         LD (BC),A
*          12A1  00         NOP
*          12A2  0eb1       LD C,0xb1
*          12A4  12         LD (DE),A
*          12A5  3eb0       LD A,0xb0
*          12A7  08         EX AF,AF'
*          12A8  ef         RST 0x28
*          12A9  1d         DEC E
*          12AA  103e       DJNZ 0x12ea
*          12AC  b0         OR B
*          12AD  08         EX AF,AF'
*          12AE  ef         RST 0x28
*          12AF  00         NOP
*          12B0  40         LD B,B
*          12B1  8e         ADC A,(HL)
*          12B2  05         DEC B
*          12B3  ce08       ADC A,8
*          12B5  e0         RET po
           12B6  d608       SUB 8
           12B8  4e         LD C,(HL)
           12B9  08         EX AF,AF'
           12BA  00         NOP
           12BB  be         CP (HL)
           12BC  b5         OR L
           12BD  12         LD (DE),A
           12BE  4e         LD C,(HL)
           12BF  e8         RET pe
           12C0  ff         RST 0x38
           12C1  7e         LD A,(HL)
           12C2  b3         OR E
           12C3  12         LD (DE),A
           12C4  0e00       LD C,0
*  L_12C6: 12C6  00         NOP
*          12C7  e5         PUSH HL
*          12C8  12         LD (DE),A
*  L_12C9: 12C9  dc12d3     CALL c,0xd312
*          12CC  12         LD (DE),A
*          12CD  e5         PUSH HL
*          12CE  12         LD (DE),A
*          12CF  dc12d3     CALL c,0xd312
*          12D2  12         LD (DE),A
*          12D3  3ea0       LD A,0xa0
*          12D5  204e       JR nz,0x1325
*          12D7  fcff0e     CALL m,0x0eff
*          12DA  e8         RET pe
*          12DB  12         LD (DE),A
*          12DC  3eb0       LD A,0xb0
*          12DE  204e       JR nz,0x132e
*          12E0  feff       CP 0xff
*          12E2  0ee8       LD C,0xe8
*          12E4  12         LD (DE),A
*          12E5  3ea0       LD A,0xa0
*          12E7  20e0       JR nz,0x12c9
*          12E9  6b         LD L,E
*  L_12EA: 12EA  06e0       LD B,0xe0
*          12EC  5f         LD E,A
*          12ED  200e       JR nz,0x12fd
*          12EF  00         NOP
*          12F0  00         NOP
*          12F1  15         DEC D
*          12F2  13         INC DE
*          12F3  27         DAA
*          12F4  13         INC DE
*          12F5  24         INC H
*          12F6  13         INC DE
*          12F7  15         DEC D
*          12F8  13         INC DE
*          12F9  27         DAA
*          12FA  13         INC DE
*          12FB  24         INC H
*  L_12FC: 12FC  13         INC DE
*  L_12FD: 12FD  3013       JR nc,0x1312
*  L_12FF: 12FF  42         LD B,D
*          1300  13         INC DE
*          1301  45         LD B,L
*  L_1302: 1302  13         INC DE
*          1303  3013       JR nc,0x1318
*          1305  42         LD B,D
*          1306  13         INC DE
*          1307  45         LD B,L
*          1308  13         INC DE
*          1309  4e         LD C,(HL)
*          130A  13         INC DE
*          130B  6b         LD L,E
*          130C  13         INC DE
*          130D  8c         ADC A,H
*          130E  13         INC DE
*          130F  4e         LD C,(HL)
*          1310  13         INC DE
*          1311  6b         LD L,E
*  L_1312: 1312  13         INC DE
*          1313  8c         ADC A,H
*          1314  13         INC DE
*          1315  3ea0       LD A,0xa0
*          1317  08         EX AF,AF'
*  L_1318: 1318  e0         RET po
           1319  d610       SUB 0x10
           131B  e0         RET po
*          131C  be         CP (HL)
*          131D  10e0       DJNZ 0x12ff
*          131F  a0         AND B
*          1320  10e0       DJNZ 0x1302
*          1322  8f         ADC A,A
*          1323  200e       JR nz,0x1333
*  L_1325: 1325  00         NOP
*          1326  00         NOP
*          1327  3eb0       LD A,0xb0
*          1329  08         EX AF,AF'
*          132A  4e         LD C,(HL)
*          132B  feff       CP 0xff
*          132D  0e18       LD C,0x18
*          132F  13         INC DE
*          1330  3ea0       LD A,0xa0
*          1332  08         EX AF,AF'
*  L_1333: 1333  e0         RET po
           1334  8f         ADC A,A
           1335  10e0       DJNZ 0x1317
           1337  a0         AND B
           1338  10e0       DJNZ 0x131a
           133A  be         CP (HL)
           133B  10e0       DJNZ 0x131d
           133D  d620       SUB 0x20
           133F  0e00       LD C,0
           1341  00         NOP
           1342  0e00       LD C,0
*          1344  00         NOP
*  L_1345: 1345  3eb0       LD A,0xb0
*          1347  08         EX AF,AF'
*          1348  4e         LD C,(HL)
*          1349  feff       CP 0xff
*          134B  0e33       LD C,0x33
*  L_134D: 134D  13         INC DE
*          134E  9e         SBC A,(HL)
*          134F  40         LD B,B
*          1350  3eb0       LD A,0xb0
*  L_1352: 1352  08         EX AF,AF'
*          1353  ed1d       
*          1355  203e       JR nz,0x1395
*          1357  b0         OR B
*          1358  20eb       JR nz,0x1345
*  L_135A: 135A  80         ADD A,B
*          135B  103e       DJNZ 0x139b
*          135D  b0         OR B
*          135E  20ed       JR nz,0x134d
*          1360  80         ADD A,B
*          1361  183e       JR 0x13a1
           1363  b0         OR B
*          1364  20ec       JR nz,0x1352
*          1366  f0         RET p
           1367  ff         RST 0x38
           1368  0e00       LD C,0
           136A  00         NOP
           136B  3eb0       LD A,0xb0
*  L_136D: 136D  20eb       JR nz,0x135a
*          136F  1d         DEC E
*          1370  203e       JR nz,0x13b0
*          1372  b0         OR B
*  L_1373: 1373  20ed       JR nz,0x1362
*          1375  ff         RST 0x38
*          1376  183e       JR 0x13b6
           1378  b0         OR B
           1379  20eb       JR nz,0x1366
           137B  ff         RST 0x38
           137C  183e       JR 0x13bc
           137E  b0         OR B
*  L_137F: 137F  20ec       JR nz,0x136d
*          1381  ff         RST 0x38
*          1382  183e       JR 0x13c2
           1384  b0         OR B
*  L_1385: 1385  20ec       JR nz,0x1373
*          1387  f8         RET m
           1388  ff         RST 0x38
           1389  0e00       LD C,0
*  L_138B: 138B  00         NOP
*          138C  3eb0       LD A,0xb0
*          138E  10ef       DJNZ 0x137f
*          1390  1d         DEC E
*  L_1391: 1391  203e       JR nz,0x13d1
*          1393  b0         OR B
*          1394  20ef       JR nz,0x1385
*          1396  1008       DJNZ 0x13a0
*          1398  3eb0       LD A,0xb0
*          139A  20ef       JR nz,0x138b
*          139C  1f         RRA
*  L_139D: 139D  203e       JR nz,0x13dd
*          139F  b0         OR B
*  L_13A0: 13A0  20ef       JR nz,0x1391
*          13A2  1c         INC E
*          13A3  203e       JR nz,0x13e3
*          13A5  b0         OR B
*          13A6  20ef       JR nz,0x1397
*          13A8  1f         RRA
*          13A9  ff         RST 0x38
*          13AA  0e00       LD C,0
*          13AC  00         NOP
*          13AD  b9         CP C
*          13AE  13         INC DE
*          13AF  d213b9     JP nc,0xb913
*          13B2  13         INC DE
*          13B3  d213b9     JP nc,0xb913
*  L_13B6: 13B6  13         INC DE
*          13B7  d2133e     JP nc,0x3e13
*          13BA  a0         AND B
*          13BB  10e0       DJNZ 0x139d
*          13BD  d614       SUB 0x14
*          13BF  e0         RET po
           13C0  fe14       CP 0x14
*  L_13C2: 13C2  e0         RET po
           13C3  d614       SUB 0x14
           13C5  e0         RET po
           13C6  fe14       CP 0x14
           13C8  e0         RET po
           13C9  a0         AND B
           13CA  50         LD D,B
           13CB  5e         LD E,(HL)
           13CC  e0         RET po
           13CD  a0         AND B
           13CE  50         LD D,B
*  L_13CF: 13CF  0e00       LD C,0
*  L_13D1: 13D1  00         NOP
*  L_13D2: 13D2  4e         LD C,(HL)
*          13D3  feff       CP 0xff
*          13D5  fe00       CP 0
*          13D7  04         INC B
*  L_13D8: 13D8  0eb9       LD C,0xb9
*          13DA  13         INC DE
*          13DB  e7         RST 0x20
*          13DC  13         INC DE
*  L_13DD: 13DD  1f         RRA
*          13DE  14         INC D
*          13DF  6b         LD L,E
*          13E0  14         INC D
*          13E1  83         ADD A,E
*          13E2  14         INC D
*  L_13E3: 13E3  bd         CP L
*          13E4  14         INC D
*          13E5  fa143e     JP m,0x3e14
*          13E8  a0         AND B
*          13E9  08         EX AF,AF'
*          13EA  e1         POP HL
*          13EB  40         LD B,B
*          13EC  20e1       JR nz,0x13cf
*          13EE  40         LD B,B
*          13EF  20e1       JR nz,0x13d2
*          13F1  40         LD B,B
*          13F2  203e       JR nz,0x1432
*          13F4  a0         AND B
*          13F5  20e1       JR nz,0x13d8
*          13F7  1d         DEC E
*          13F8  60         LD H,B
*          13F9  e0         RET po
           13FA  fe60       CP 0x60
           13FC  e1         POP HL
           13FD  1d         DEC E
           13FE  60         LD H,B
           13FF  5e         LD E,(HL)
           1400  e1         POP HL
           1401  1d         DEC E
           1402  c0         RET nz
           1403  fe00       CP 0
           1405  c0         RET nz
           1406  3ea0       LD A,0xa0
           1408  08         EX AF,AF'
           1409  e0         RET po
*  L_140A: 140A  fe20       CP 0x20
*          140C  e0         RET po
*  L_140D: 140D  fe20       CP 0x20
*          140F  e0         RET po
           1410  fe20       CP 0x20
           1412  3ea0       LD A,0xa0
*          1414  20e0       JR nz,0x13f6
*          1416  e2c05e     JP po,0x5ec0
*          1419  e0         RET po
           141A  e2600e     JP po,0x0e60
           141D  00         NOP
           141E  00         NOP
           141F  4e         LD C,(HL)
           1420  feff       CP 0xff
           1422  3ea0       LD A,0xa0
*          1424  08         EX AF,AF'
*          1425  e1         POP HL
*          1426  40         LD B,B
*          1427  20e1       JR nz,0x140a
*          1429  40         LD B,B
*          142A  20e1       JR nz,0x140d
*          142C  40         LD B,B
*          142D  203e       JR nz,0x146d
*          142F  a0         AND B
*          1430  20e1       JR nz,0x1413
*  L_1432: 1432  1d         DEC E
*          1433  60         LD H,B
*          1434  e0         RET po
           1435  fe60       CP 0x60
           1437  e1         POP HL
           1438  1d         DEC E
           1439  60         LD H,B
           143A  4e         LD C,(HL)
           143B  00         NOP
           143C  00         NOP
           143D  3ec0       LD A,0xc0
*          143F  20e2       JR nz,0x1423
*          1441  3b         DEC SP
*          1442  60         LD H,B
*          1443  e1         POP HL
*          1444  fc60e1     CALL m,0xe160
*          1447  c5         PUSH BC
*          1448  60         LD H,B
*          1449  e1         POP HL
*          144A  fc604e     CALL m,0x4e60
*          144D  feff       CP 0xff
*          144F  3ea0       LD A,0xa0
*          1451  08         EX AF,AF'
*          1452  e0         RET po
           1453  fe20       CP 0x20
           1455  e0         RET po
           1456  fe20       CP 0x20
           1458  e0         RET po
           1459  fe20       CP 0x20
           145B  3ea0       LD A,0xa0
           145D  20e0       JR nz,0x143f
           145F  e2c05e     JP po,0x5ec0
           1462  e0         RET po
           1463  e2604e     JP po,0x4e60
           1466  00         NOP
           1467  00         NOP
           1468  0e00       LD C,0
           146A  00         NOP
           146B  3ec0       LD A,0xc0
*  L_146D: 146D  20fe       JR nz,0x146d
*          146F  00         NOP
*          1470  60         LD H,B
*          1471  e1         POP HL
*          1472  ac         XOR H
*          1473  c0         RET nz
           1474  e1         POP HL
           1475  ac         XOR H
           1476  c0         RET nz
           1477  e1         POP HL
           1478  7d         LD A,L
           1479  c0         RET nz
           147A  e1         POP HL
           147B  7d         LD A,L
           147C  c0         RET nz
*  L_147D: 147D  e1         POP HL
*          147E  53         LD D,E
*          147F  c0         RET nz
*  L_1480: 1480  0e00       LD C,0
*          1482  00         NOP
*          1483  3ea0       LD A,0xa0
*  L_1485: 1485  103e       DJNZ 0x14c5
*          1487  c0         RET nz
           1488  20e2       JR nz,0x146c
           148A  81         ADD A,C
           148B  60         LD H,B
           148C  e23b60     JP po,0x603b
           148F  e1         POP HL
           1490  fc60e2     CALL m,0xe260
           1493  3b         DEC SP
           1494  60         LD H,B
*          1495  3ea0       LD A,0xa0
*          1497  08         EX AF,AF'
*          1498  e1         POP HL
*          1499  1d         DEC E
*          149A  20e1       JR nz,0x147d
*          149C  1d         DEC E
*          149D  20e1       JR nz,0x1480
*          149F  1d         DEC E
*          14A0  203e       JR nz,0x14e0
*          14A2  a0         AND B
*          14A3  20e0       JR nz,0x1485
*          14A5  fe60       CP 0x60
*          14A7  e0         RET po
           14A8  e260e0     JP po,0xe060
           14AB  fe60       CP 0x60
           14AD  3ec0       LD A,0xc0
           14AF  20e1       JR nz,0x1492
*  L_14B1: 14B1  fc60e1     CALL m,0xe160
*          14B4  c5         PUSH BC
*          14B5  c0         RET nz
*  L_14B6: 14B6  5e         LD E,(HL)
*          14B7  e0         RET po
           14B8  e2600e     JP po,0x0e60
           14BB  00         NOP
           14BC  00         NOP
           14BD  fe00       CP 0
           14BF  c0         RET nz
           14C0  fe00       CP 0
           14C2  c0         RET nz
           14C3  4e         LD C,(HL)
           14C4  feff       CP 0xff
*          14C6  3ea0       LD A,0xa0
*          14C8  08         EX AF,AF'
*          14C9  e1         POP HL
*          14CA  1d         DEC E
*          14CB  20e1       JR nz,0x14ae
*          14CD  1d         DEC E
*          14CE  20e1       JR nz,0x14b1
*          14D0  1d         DEC E
*          14D1  203e       JR nz,0x1511
*          14D3  a0         AND B
*          14D4  20e0       JR nz,0x14b6
*          14D6  fe60       CP 0x60
*          14D8  e0         RET po
           14D9  e260e0     JP po,0xe060
           14DC  fe60       CP 0x60
           14DE  3ea0       LD A,0xa0
*  L_14E0: 14E0  08         EX AF,AF'
*          14E1  e0         RET po
           14E2  fe20       CP 0x20
           14E4  e0         RET po
           14E5  fe20       CP 0x20
           14E7  e0         RET po
           14E8  fe20       CP 0x20
           14EA  3ea0       LD A,0xa0
           14EC  20e0       JR nz,0x14ce
           14EE  e2c05e     JP po,0x5ec0
           14F1  e0         RET po
           14F2  e2604e     JP po,0x4e60
           14F5  00         NOP
           14F6  00         NOP
           14F7  0e00       LD C,0
           14F9  00         NOP
           14FA  3eb0       LD A,0xb0
*  L_14FC: 14FC  20fe       JR nz,0x14fc
*          14FE  00         NOP
*          14FF  60         LD H,B
*          1500  e3         EX (SP),HL
*          1501  57         LD D,A
*          1502  c0         RET nz
           1503  e47560     CALL po,0x6075
           1506  e3         EX (SP),HL
           1507  57         LD D,A
           1508  60         LD H,B
           1509  e2fac0     JP po,0xc0fa
           150C  e3         EX (SP),HL
*  L_150D: 150D  f9         LD SP,HL
*          150E  60         LD H,B
*          150F  e2fa60     JP po,0x60fa
*          1512  e2a7c0     JP po,0xc0a7
*  L_1515: 1515  5e         LD E,(HL)
*          1516  e2a7c0     JP po,0xc0a7
*          1519  0e00       LD C,0
*          151B  00         NOP
*  L_151C: 151C  2815       JR z,0x1533
*          151E  5b         LD E,E
*          151F  15         DEC D
*          1520  64         LD H,H
*          1521  15         DEC D
*          1522  2815       JR z,0x1539
*          1524  5b         LD E,E
*          1525  15         DEC D
*          1526  64         LD H,H
*          1527  15         DEC D
*          1528  3ea0       LD A,0xa0
*          152A  10e1       DJNZ 0x150d
*          152C  0d         DEC C
*          152D  18e1       JR 0x1510
*          152F  1d         DEC E
*          1530  18e1       JR 0x1513
*          1532  0d         DEC C
*  L_1533: 1533  18e0       JR 0x1515
           1535  e230e1     JP po,0xe130
*          1538  0d         DEC C
*  L_1539: 1539  18e1       JR 0x151c
           153B  53         LD D,E
           153C  30e1       JR nc,0x151f
           153E  53         LD D,E
           153F  18e1       JR 0x1522
           1541  68         LD L,B
           1542  30e1       JR nc,0x1525
           1544  94         SUB H
           1545  18e1       JR 0x1528
           1547  c5         PUSH BC
           1548  30e1       JR nc,0x152b
           154A  c5         PUSH BC
*  L_154B: 154B  18e1       JR 0x152e
           154D  68         LD L,B
*  L_154E: 154E  18e1       JR 0x1531
           1550  7d         LD A,L
*  L_1551: 1551  18e1       JR 0x1534
           1553  68         LD L,B
*  L_1554: 1554  18e1       JR 0x1537
           1556  53         LD D,E
*  L_1557: 1557  90         SUB B
*          1558  0e00       LD C,0
*  L_155A: 155A  00         NOP
*          155B  3eb0       LD A,0xb0
*          155D  104e       DJNZ 0x15ad
*          155F  feff       CP 0xff
*          1561  0e2b       LD C,0x2b
*          1563  15         DEC D
*          1564  4e         LD C,(HL)
*          1565  fb         EI
*          1566  ff         RST 0x38
*          1567  3eb0       LD A,0xb0
*          1569  10e0       DJNZ 0x154b
*          156B  87         ADD A,A
*          156C  18e0       JR 0x154e
           156E  8f         ADC A,A
*          156F  18e0       JR 0x1551
           1571  87         ADD A,A
*          1572  18e0       JR 0x1554
           1574  71         LD (HL),C
*  L_1575: 1575  30e0       JR nc,0x1557
*          1577  87         ADD A,A
*          1578  18e0       JR 0x155a
           157A  aa         XOR D
           157B  30e0       JR nc,0x155d
           157D  aa         XOR D
           157E  18e0       JR 0x1560
           1580  b4         OR H
           1581  30e0       JR nc,0x1563
           1583  ca18e0     JP z,0xe018
           1586  e230e0     JP po,0xe030
           1589  e218e0     JP po,0xe018
           158C  b4         OR H
           158D  18e0       JR 0x156f
           158F  be         CP (HL)
           1590  18e0       JR 0x1572
           1592  b4         OR H
*  L_1593: 1593  18e0       JR 0x1575
           1595  aa         XOR D
           1596  90         SUB B
           1597  0e00       LD C,0
           1599  00         NOP
*  L_159A: 159A  a6         AND (HL)
*          159B  15         DEC D
*          159C  d9         EXX
*          159D  15         DEC D
*          159E  e215a6     JP po,0xa615
*          15A1  15         DEC D
*          15A2  d9         EXX
*          15A3  15         DEC D
*          15A4  e2153e     JP po,0x3e15
*          15A7  a0         AND B
*          15A8  10e1       DJNZ 0x158b
*          15AA  0d         DEC C
*          15AB  18e1       JR 0x158e
*  L_15AD: 15AD  1d         DEC E
*          15AE  18e1       JR 0x1591
*          15B0  0d         DEC C
*          15B1  18e0       JR 0x1593
           15B3  e230e1     JP po,0xe130
*          15B6  0d         DEC C
*          15B7  18e1       JR 0x159a
           15B9  53         LD D,E
           15BA  30e1       JR nc,0x159d
           15BC  53         LD D,E
           15BD  18e1       JR 0x15a0
           15BF  68         LD L,B
           15C0  30e1       JR nc,0x15a3
           15C2  94         SUB H
           15C3  18e1       JR 0x15a6
           15C5  c5         PUSH BC
           15C6  30e1       JR nc,0x15a9
           15C8  c5         PUSH BC
*  L_15C9: 15C9  18e1       JR 0x15ac
           15CB  68         LD L,B
*  L_15CC: 15CC  18e1       JR 0x15af
           15CE  7d         LD A,L
*  L_15CF: 15CF  18e1       JR 0x15b2
           15D1  68         LD L,B
*  L_15D2: 15D2  18e1       JR 0x15b5
           15D4  53         LD D,E
*  L_15D5: 15D5  90         SUB B
*          15D6  0e00       LD C,0
*  L_15D8: 15D8  00         NOP
*          15D9  3eb0       LD A,0xb0
*          15DB  104e       DJNZ 0x162b
*          15DD  feff       CP 0xff
*          15DF  0ea9       LD C,0xa9
*          15E1  15         DEC D
*          15E2  4e         LD C,(HL)
*          15E3  fb         EI
*          15E4  ff         RST 0x38
*          15E5  3eb0       LD A,0xb0
*          15E7  10e0       DJNZ 0x15c9
*          15E9  87         ADD A,A
*          15EA  18e0       JR 0x15cc
           15EC  8f         ADC A,A
*          15ED  18e0       JR 0x15cf
           15EF  87         ADD A,A
*          15F0  18e0       JR 0x15d2
           15F2  71         LD (HL),C
*          15F3  30e0       JR nc,0x15d5
*          15F5  87         ADD A,A
*          15F6  18e0       JR 0x15d8
           15F8  aa         XOR D
           15F9  30e0       JR nc,0x15db
           15FB  aa         XOR D
           15FC  18e0       JR 0x15de
           15FE  b4         OR H
           15FF  30e0       JR nc,0x15e1
           1601  ca18e0     JP z,0xe018
           1604  e230e0     JP po,0xe030
           1607  e218e0     JP po,0xe018
           160A  b4         OR H
           160B  18e0       JR 0x15ed
           160D  be         CP (HL)
           160E  18e0       JR 0x15f0
           1610  b4         OR H
           1611  18e0       JR 0x15f3
           1613  aa         XOR D
           1614  90         SUB B
           1615  0e00       LD C,0
           1617  00         NOP
           1618  24         INC H
           1619  1673       LD D,0x73
           161B  17         RLA
           161C  1e17       LD E,0x17
           161E  89         ADC A,C
           161F  16ea       LD D,0xea
           1621  167c       LD D,0x7c
           1623  17         RLA
           1624  3ea0       LD A,0xa0
           1626  18de       JR 0x1606
           1628  52         LD D,D
           1629  16e0       LD D,0xe0
*  L_162B: 162B  fe48       CP 0x48
*          162D  e0         RET po
           162E  fe18       CP 0x18
           1630  e0         RET po
           1631  e218e0     JP po,0xe018
           1634  fe18       CP 0x18
           1636  e1         POP HL
*          1637  1d         DEC E
*          1638  48         LD C,B
*          1639  de52       SBC A,0x52
*          163B  16e0       LD D,0xe0
*  L_163D: 163D  fe48       CP 0x48
*          163F  e0         RET po
           1640  fe18       CP 0x18
           1642  e0         RET po
           1643  e218e0     JP po,0xe018
           1646  d618       SUB 0x18
           1648  e0         RET po
*          1649  be         CP (HL)
*          164A  48         LD C,B
*          164B  5e         LD E,(HL)
*          164C  e0         RET po
           164D  be         CP (HL)
           164E  48         LD C,B
           164F  0e00       LD C,0
           1651  00         NOP
           1652  e1         POP HL
           1653  ac         XOR H
           1654  18e1       JR 0x1637
           1656  ac         XOR H
           1657  18e1       JR 0x163a
*          1659  ac         XOR H
*          165A  18e1       JR 0x163d
*          165C  1d         DEC E
*          165D  90         SUB B
*  L_165E: 165E  e1         POP HL
*          165F  ac         XOR H
*          1660  48         LD C,B
*          1661  e0         RET po
           1662  fe18       CP 0x18
           1664  e1         POP HL
           1665  1d         DEC E
           1666  18e1       JR 0x1649
           1668  40         LD B,B
           1669  18e1       JR 0x164c
*  L_166B: 166B  53         LD D,E
*          166C  48         LD C,B
*          166D  e1         POP HL
*          166E  40         LD B,B
*          166F  48         LD C,B
*          1670  e1         POP HL
*          1671  1d         DEC E
*          1672  48         LD C,B
*          1673  e1         POP HL
*          1674  7d         LD A,L
*          1675  18e1       JR 0x1658
*          1677  7d         LD A,L
*          1678  18e1       JR 0x165b
*          167A  7d         LD A,L
*          167B  18e1       JR 0x165e
*          167D  2e90       LD L,0x90
*          167F  e1         POP HL
*          1680  7d         LD A,L
*          1681  48         LD C,B
*          1682  e0         RET po
           1683  e230e0     JP po,0xe030
           1686  fe18       CP 0x18
*  L_1688: 1688  ee3e       XOR 0x3e
*          168A  b0         OR B
*  L_168B: 168B  10de       DJNZ 0x166b
*          168D  b3         OR E
*  L_168E: 168E  16e0       LD D,0xe0
*          1690  7f         LD A,A
*          1691  48         LD C,B
*          1692  e0         RET po
           1693  7f         LD A,A
           1694  18e0       JR 0x1676
           1696  71         LD (HL),C
           1697  18e0       JR 0x1679
           1699  7f         LD A,A
*  L_169A: 169A  18e0       JR 0x167c
           169C  8f         ADC A,A
*  L_169D: 169D  48         LD C,B
*          169E  deb3       SBC A,0xb3
*          16A0  16e0       LD D,0xe0
*          16A2  7f         LD A,A
*          16A3  48         LD C,B
*          16A4  e0         RET po
           16A5  7f         LD A,A
*          16A6  18e0       JR 0x1688
           16A8  71         LD (HL),C
*  L_16A9: 16A9  18e0       JR 0x168b
           16AB  6b         LD L,E
*          16AC  18e0       JR 0x168e
           16AE  5f         LD E,A
           16AF  48         LD C,B
           16B0  0e00       LD C,0
           16B2  00         NOP
           16B3  e0         RET po
           16B4  d618       SUB 0x18
           16B6  e0         RET po
           16B7  d618       SUB 0x18
           16B9  e0         RET po
           16BA  d618       SUB 0x18
           16BC  e0         RET po
           16BD  8f         ADC A,A
*          16BE  90         SUB B
*          16BF  e0         RET po
           16C0  d648       SUB 0x48
           16C2  e0         RET po
           16C3  7f         LD A,A
           16C4  18e0       JR 0x16a6
           16C6  8f         ADC A,A
*          16C7  18e0       JR 0x16a9
           16C9  a0         AND B
           16CA  18e0       JR 0x16ac
           16CC  aa         XOR D
           16CD  48         LD C,B
           16CE  e0         RET po
           16CF  a0         AND B
           16D0  48         LD C,B
           16D1  e0         RET po
           16D2  8f         ADC A,A
           16D3  48         LD C,B
           16D4  e0         RET po
           16D5  be         CP (HL)
           16D6  18e0       JR 0x16b8
*          16D8  be         CP (HL)
*          16D9  18e0       JR 0x16bb
           16DB  be         CP (HL)
           16DC  18e0       JR 0x16be
           16DE  97         SUB A
           16DF  90         SUB B
           16E0  e0         RET po
           16E1  be         CP (HL)
           16E2  48         LD C,B
           16E3  e0         RET po
           16E4  71         LD (HL),C
           16E5  30e0       JR nc,0x16c7
           16E7  7f         LD A,A
           16E8  18ee       JR 0x16d8
           16EA  3eb0       LD A,0xb0
*  L_16EC: 16EC  20fe       JR nz,0x16ec
*          16EE  00         NOP
*          16EF  48         LD C,B
*          16F0  de0b       SBC A,11
*          16F2  17         RLA
*          16F3  e2fa48     JP po,0x48fa
*          16F6  e47548     CALL po,0x4875
*          16F9  e3         EX (SP),HL
*          16FA  f9         LD SP,HL
*          16FB  48         LD C,B
*          16FC  e3         EX (SP),HL
*          16FD  8a         ADC A,D
*          16FE  48         LD C,B
*          16FF  de0b       SBC A,11
*          1701  17         RLA
*          1702  e2fa90     JP po,0x90fa
*          1705  e5         PUSH HL
*          1706  f4900e     CALL p,0x0e90
*          1709  00         NOP
*          170A  00         NOP
*          170B  e3         EX (SP),HL
*          170C  57         LD D,A
*          170D  90         SUB B
*          170E  e47590     CALL po,0x9075
*          1711  e3         EX (SP),HL
*          1712  57         LD D,A
*          1713  90         SUB B
*          1714  e47590     CALL po,0x9075
*          1717  e2fa90     JP po,0x90fa
*          171A  e3         EX (SP),HL
*  L_171B: 171B  f9         LD SP,HL
*          171C  90         SUB B
*          171D  ee3e       XOR 0x3e
*          171F  b0         OR B
*  L_1720: 1720  20fe       JR nz,0x1720
*          1722  00         NOP
*          1723  48         LD C,B
*  L_1724: 1724  de33       SBC A,0x33
*          1726  17         RLA
*          1727  e0         RET po
           1728  e290de     JP po,0xde90
           172B  33         INC SP
           172C  17         RLA
*  L_172D: 172D  e1         POP HL
*          172E  2e90       LD L,0x90
*  L_1730: 1730  0e00       LD C,0
*          1732  00         NOP
*  L_1733: 1733  e1         POP HL
*          1734  1d         DEC E
*          1735  48         LD C,B
*  L_1736: 1736  e1         POP HL
*          1737  53         LD D,E
*          1738  30e1       JR nc,0x171b
*          173A  ac         XOR H
*          173B  18e1       JR 0x171e
           173D  7d         LD A,L
           173E  30e1       JR nc,0x1721
*          1740  53         LD D,E
*          1741  18e1       JR 0x1724
           1743  40         LD B,B
           1744  48         LD C,B
           1745  e1         POP HL
           1746  1d         DEC E
           1747  48         LD C,B
           1748  e1         POP HL
           1749  53         LD D,E
*          174A  30e1       JR nc,0x172d
*          174C  ac         XOR H
*          174D  18e1       JR 0x1730
           174F  7d         LD A,L
*          1750  30e1       JR nc,0x1733
*          1752  53         LD D,E
*          1753  18e1       JR 0x1736
           1755  40         LD B,B
           1756  48         LD C,B
           1757  e1         POP HL
           1758  2e48       LD L,0x48
           175A  e1         POP HL
           175B  53         LD D,E
           175C  30e1       JR nc,0x173f
           175E  2e18       LD L,0x18
           1760  e1         POP HL
           1761  1d         DEC E
           1762  48         LD C,B
           1763  e1         POP HL
           1764  2e30       LD L,0x30
           1766  e1         POP HL
           1767  1d         DEC E
           1768  18e0       JR 0x174a
           176A  fe48       CP 0x48
           176C  e1         POP HL
           176D  1d         DEC E
           176E  30e0       JR nc,0x1750
           1770  fe18       CP 0x18
           1772  ee3e       XOR 0x3e
           1774  b0         OR B
           1775  204e       JR nz,0x17c5
           1777  feff       CP 0xff
           1779  0e21       LD C,0x21
           177B  17         RLA
           177C  3e80       LD A,0x80
*  L_177E: 177E  10fe       DJNZ 0x177e
*          1780  00         NOP
*          1781  04         INC B
*          1782  4e         LD C,(HL)
*  L_1783: 1783  ff         RST 0x38
*  L_1784: 1784  ff         RST 0x38
*          1785  0e27       LD C,0x27
*          1787  1694       LD D,0x94
*          1789  17         RLA
*  L_178A: 178A  fd17       RLA
*          178C  4c         LD C,H
*          178D  18f4       JR 0x1783
           178F  17         RLA
           1790  2618       LD H,0x18
           1792  60         LD H,B
           1793  02         LD (BC),A
           1794  3ea0       LD A,0xa0
           1796  0ede       LD C,0xde
           1798  d417de     CALL nc,0xde17
           179B  e417de     CALL po,0xde17
           179E  e417e0     CALL po,0xe017
           17A1  fe30       CP 0x30
           17A3  e0         RET po
*          17A4  ca18fe     JP z,0xfe18
*          17A7  00         NOP
*  L_17A8: 17A8  18e0       JR 0x178a
           17AA  e260de     JP po,0xde60
           17AD  d417de     CALL nc,0xde17
           17B0  e417e1     CALL po,0xe117
*          17B3  2e18       LD L,0x18
*          17B5  e1         POP HL
*          17B6  0d         DEC C
*  L_17B7: 17B7  18fe       JR 0x17b7
           17B9  00         NOP
*          17BA  18e0       JR 0x179c
           17BC  fe18       CP 0x18
           17BE  fe00       CP 0
           17C0  18e0       JR 0x17a2
           17C2  e218fe     JP po,0xfe18
*          17C5  00         NOP
*          17C6  18e0       JR 0x17a8
           17C8  b4         OR H
           17C9  18e0       JR 0x17ab
           17CB  aa         XOR D
           17CC  60         LD H,B
           17CD  5e         LD E,(HL)
           17CE  e0         RET po
           17CF  aa         XOR D
           17D0  60         LD H,B
*          17D1  0e00       LD C,0
*          17D3  00         NOP
*          17D4  e0         RET po
           17D5  e230e0     JP po,0xe030
           17D8  e230e0     JP po,0xe030
           17DB  e218e0     JP po,0xe018
*  L_17DE: 17DE  f0         RET p
           17DF  18e0       JR 0x17c1
           17E1  e230ee     JP po,0xee30
           17E4  e0         RET po
           17E5  fe30       CP 0x30
           17E7  e0         RET po
           17E8  fe30       CP 0x30
           17EA  e0         RET po
           17EB  fe18       CP 0x18
           17ED  e1         POP HL
           17EE  0d         DEC C
           17EF  18e0       JR 0x17d1
           17F1  fe30       CP 0x30
           17F3  ee4e       XOR 0x4e
           17F5  feff       CP 0xff
           17F7  fe00       CP 0
           17F9  04         INC B
           17FA  0e94       LD C,0x94
           17FC  17         RLA
           17FD  3eb0       LD A,0xb0
           17FF  206e       JR nz,0x186f
           1801  60         LD H,B
           1802  e2a7e2     JP po,0xe2a7
           1805  a7         AND A
           1806  e3         EX (SP),HL
           1807  8a         ADC A,D
           1808  e3         EX (SP),HL
           1809  8a         ADC A,D
           180A  e3         EX (SP),HL
           180B  f9         LD SP,HL
           180C  e3         EX (SP),HL
           180D  f9         LD SP,HL
           180E  e3         EX (SP),HL
*  L_180F: 180F  8a         ADC A,D
*          1810  e3         EX (SP),HL
*          1811  8a         ADC A,D
*  L_1812: 1812  e2a7e2     JP po,0xe2a7
*  L_1815: 1815  a7         AND A
*          1816  e3         EX (SP),HL
*          1817  8a         ADC A,D
*          1818  e3         EX (SP),HL
*          1819  8a         ADC A,D
*          181A  e3         EX (SP),HL
*  L_181B: 181B  f9         LD SP,HL
*          181C  e3         EX (SP),HL
*          181D  8a         ADC A,D
*  L_181E: 181E  6e         LD L,(HL)
*          181F  00         NOP
*          1820  e2a7c0     JP po,0xc0a7
*          1823  0e00       LD C,0
*          1825  00         NOP
*          1826  3ec0       LD A,0xc0
*          1828  108e       DJNZ 0x17b8
*          182A  06e0       LD B,0xe0
*          182C  87         ADD A,A
*          182D  30e0       JR nc,0x180f
*          182F  aa         XOR D
*          1830  30e0       JR nc,0x1812
*          1832  97         SUB A
*          1833  30e0       JR nc,0x1815
*  L_1835: 1835  aa         XOR D
*          1836  307e       JR nc,0x18b6
*  L_1838: 1838  2b         DEC HL
*          1839  18e0       JR 0x181b
*  L_183B: 183B  71         LD (HL),C
*          183C  30e0       JR nc,0x181e
*          183E  aa         XOR D
*          183F  30e0       JR nc,0x1821
*  L_1841: 1841  7f         LD A,A
*          1842  30e0       JR nc,0x1824
*  L_1844: 1844  aa         XOR D
*          1845  30e0       JR nc,0x1827
*          1847  87         ADD A,A
*          1848  c0         RET nz
           1849  0e00       LD C,0
*          184B  00         NOP
*          184C  3ec0       LD A,0xc0
*          184E  108e       DJNZ 0x17de
*          1850  03         INC BC
*          1851  e0         RET po
*  L_1852: 1852  71         LD (HL),C
*          1853  30e0       JR nc,0x1835
*  L_1855: 1855  87         ADD A,A
*          1856  30e0       JR nc,0x1838
*  L_1858: 1858  7f         LD A,A
*          1859  30e0       JR nc,0x183b
*          185B  87         ADD A,A
*          185C  307e       JR nc,0x18dc
*  L_185E: 185E  51         LD D,C
*          185F  18e0       JR 0x1841
*          1861  87         ADD A,A
*          1862  30e0       JR nc,0x1844
*          1864  65         LD H,L
*  L_1865: 1865  18fe       JR 0x1865
*  L_1867: 1867  00         NOP
*          1868  18e0       JR 0x184a
*  L_186A: 186A  71         LD (HL),C
*          186B  60         LD H,B
*          186C  8e         ADC A,(HL)
*          186D  02         LD (BC),A
*          186E  e0         RET po
*          186F  71         LD (HL),C
*  L_1870: 1870  30e0       JR nc,0x1852
*          1872  87         ADD A,A
*          1873  30e0       JR nc,0x1855
*          1875  7f         LD A,A
*          1876  30e0       JR nc,0x1858
*          1878  87         ADD A,A
*          1879  307e       JR nc,0x18f9
*          187B  6e         LD L,(HL)
*          187C  18e0       JR 0x185e
           187E  87         ADD A,A
           187F  18e0       JR 0x1861
           1881  fe18       CP 0x18
           1883  e0         RET po
           1884  71         LD (HL),C
*  L_1885: 1885  30e0       JR nc,0x1867
*          1887  87         ADD A,A
*          1888  18e0       JR 0x186a
           188A  7f         LD A,A
           188B  18e0       JR 0x186d
           188D  71         LD (HL),C
*  L_188E: 188E  30e0       JR nc,0x1870
*          1890  55         LD D,L
*          1891  c0         RET nz
           1892  0e00       LD C,0
*  L_1894: 1894  00         NOP
*          1895  a1         AND C
*          1896  1818       JR 0x18b0
           1898  19         ADD HL,DE
           1899  57         LD D,A
           189A  19         ADD HL,DE
           189B  0c         INC C
           189C  19         ADD HL,DE
*  L_189D: 189D  96         SUB (HL)
*          189E  19         ADD HL,DE
*          189F  60         LD H,B
*          18A0  02         LD (BC),A
*          18A1  3ea0       LD A,0xa0
*          18A3  10e0       DJNZ 0x1885
*          18A5  e218e0     JP po,0xe018
*          18A8  e218fe     JP po,0xfe18
*          18AB  00         NOP
*          18AC  18e0       JR 0x188e
           18AE  e218e1     JP po,0xe118
*          18B1  0d         DEC C
*          18B2  30e0       JR nc,0x1894
*          18B4  fe30       CP 0x30
*  L_18B6: 18B6  e0         RET po
           18B7  e2c0e0     JP po,0xe0c0
           18BA  e218e0     JP po,0xe018
           18BD  e218fe     JP po,0xfe18
           18C0  00         NOP
           18C1  18e0       JR 0x18a3
           18C3  fe18       CP 0x18
           18C5  e1         POP HL
           18C6  0d         DEC C
           18C7  30e1       JR nc,0x18aa
           18C9  1d         DEC E
           18CA  30e1       JR nc,0x18ad
           18CC  0d         DEC C
*          18CD  c0         RET nz
           18CE  e0         RET po
           18CF  fe18       CP 0x18
           18D1  e1         POP HL
           18D2  2e18       LD L,0x18
           18D4  e0         RET po
*          18D5  fe18       CP 0x18
*          18D7  e0         RET po
           18D8  aa         XOR D
           18D9  18e0       JR 0x18bb
           18DB  b4         OR H
*  L_18DC: 18DC  30e0       JR nc,0x18be
*          18DE  ca30e0     JP z,0xe030
*          18E1  fe18       CP 0x18
*          18E3  e1         POP HL
*          18E4  2e18       LD L,0x18
*          18E6  e0         RET po
           18E7  fe18       CP 0x18
           18E9  e0         RET po
           18EA  aa         XOR D
           18EB  18e0       JR 0x18cd
           18ED  b4         OR H
           18EE  30e0       JR nc,0x18d0
           18F0  ca306e     JP z,0x6e30
           18F3  18e0       JR 0x18d5
           18F5  e2e0f0     JP po,0xf0e0
           18F8  e0         RET po
*  L_18F9: 18F9  e2e0ca     JP po,0xcae0
*          18FC  e0         RET po
           18FD  b4         OR H
*          18FE  e0         RET po
           18FF  e2e0ca     JP po,0xcae0
           1902  e0         RET po
           1903  b4         OR H
           1904  6e         LD L,(HL)
           1905  00         NOP
           1906  e0         RET po
*          1907  aa         XOR D
*          1908  c0         RET nz
           1909  0e00       LD C,0
           190B  00         NOP
           190C  3ea0       LD A,0xa0
           190E  104e       DJNZ 0x195e
           1910  feff       CP 0xff
           1912  fe00       CP 0
           1914  04         INC B
*  L_1915: 1915  0ea1       LD C,0xa1
*  L_1917: 1917  183e       JR 0x1957
           1919  b0         OR B
           191A  20e2       JR nz,0x18fe
           191C  a7         AND A
           191D  60         LD H,B
           191E  e2a730     JP po,0x30a7
           1921  e3         EX (SP),HL
           1922  8a         ADC A,D
           1923  30e2       JR nc,0x1907
*  L_1925: 1925  a7         AND A
*          1926  60         LD H,B
*          1927  e3         EX (SP),HL
*          1928  8a         ADC A,D
*          1929  60         LD H,B
*          192A  e3         EX (SP),HL
*          192B  27         DAA
*          192C  60         LD H,B
*          192D  e3         EX (SP),HL
*          192E  27         DAA
*          192F  30e4       JR nc,0x1915
*  L_1931: 1931  35         DEC (HL)
*          1932  30e3       JR nc,0x1917
*  L_1934: 1934  27         DAA
*          1935  60         LD H,B
*          1936  e43560     CALL po,0x6035
*          1939  e25d60     JP po,0x605d
*          193C  e25d30     JP po,0x305d
*          193F  e3         EX (SP),HL
*          1940  27         DAA
*          1941  30e2       JR nc,0x1925
*          1943  5d         LD E,L
*          1944  60         LD H,B
*          1945  e3         EX (SP),HL
*          1946  27         DAA
*          1947  60         LD H,B
*          1948  e3         EX (SP),HL
*          1949  8a         ADC A,D
*          194A  60         LD H,B
*          194B  e3         EX (SP),HL
*          194C  27         DAA
*          194D  30e2       JR nc,0x1931
*          194F  cf         RST 8
*          1950  30e2       JR nc,0x1934
*          1952  a7         AND A
*          1953  c0         RET nz
           1954  0e00       LD C,0
*          1956  00         NOP
*  L_1957: 1957  3eb0       LD A,0xb0
*          1959  0c         INC C
*          195A  e0         RET po
           195B  71         LD (HL),C
*          195C  60         LD H,B
*          195D  e0         RET po
*          195E  87         ADD A,A
*          195F  60         LD H,B
*          1960  e0         RET po
           1961  71         LD (HL),C
           1962  30e0       JR nc,0x1944
           1964  71         LD (HL),C
           1965  18e0       JR 0x1947
           1967  55         LD D,L
           1968  18e0       JR 0x194a
           196A  71         LD (HL),C
           196B  60         LD H,B
           196C  e0         RET po
           196D  87         ADD A,A
           196E  60         LD H,B
           196F  e0         RET po
           1970  a0         AND B
           1971  60         LD H,B
           1972  e0         RET po
           1973  87         ADD A,A
           1974  30e0       JR nc,0x1956
           1976  87         ADD A,A
           1977  18e0       JR 0x1959
           1979  65         LD H,L
           197A  18e0       JR 0x195c
           197C  87         ADD A,A
           197D  60         LD H,B
           197E  e0         RET po
           197F  7f         LD A,A
           1980  60         LD H,B
           1981  e0         RET po
           1982  97         SUB A
           1983  60         LD H,B
           1984  e0         RET po
           1985  7f         LD A,A
           1986  60         LD H,B
           1987  e0         RET po
           1988  65         LD H,L
*          1989  60         LD H,B
*          198A  e0         RET po
           198B  5a         LD E,D
           198C  60         LD H,B
           198D  e0         RET po
           198E  71         LD (HL),C
           198F  60         LD H,B
           1990  e0         RET po
           1991  55         LD D,L
           1992  c0         RET nz
           1993  0e00       LD C,0
           1995  00         NOP
*          1996  3eb0       LD A,0xb0
*          1998  0c         INC C
*          1999  e0         RET po
           199A  e260e1     JP po,0xe160
           199D  0d         DEC C
           199E  60         LD H,B
           199F  e0         RET po
           19A0  e230e0     JP po,0xe030
           19A3  e218e0     JP po,0xe018
           19A6  aa         XOR D
           19A7  18e0       JR 0x1989
           19A9  e260e1     JP po,0xe160
           19AC  0d         DEC C
           19AD  60         LD H,B
           19AE  e1         POP HL
           19AF  40         LD B,B
           19B0  60         LD H,B
           19B1  e1         POP HL
           19B2  0d         DEC C
           19B3  30e1       JR nc,0x1996
           19B5  0d         DEC C
           19B6  18e0       JR 0x1998
           19B8  ca18e1     JP z,0xe118
           19BB  0d         DEC C
           19BC  60         LD H,B
           19BD  e0         RET po
           19BE  fe60       CP 0x60
           19C0  e1         POP HL
           19C1  2e60       LD L,0x60
           19C3  e0         RET po
           19C4  fe60       CP 0x60
           19C6  e0         RET po
*  L_19C7: 19C7  ca60e0     JP z,0xe060
*          19CA  b4         OR H
*          19CB  60         LD H,B
*          19CC  e0         RET po
           19CD  e260e0     JP po,0xe060
*  L_19D0: 19D0  aa         XOR D
*          19D1  c0         RET nz
           19D2  0e00       LD C,0
*          19D4  00         NOP
*          19D5  e1         POP HL
*          19D6  19         ADD HL,DE
*          19D7  40         LD B,B
*          19D8  1a         LD A,(DE)
*          19D9  bf         CP A
*          19DA  1c         INC E
*          19DB  f21a69     JP p,0x691a
*          19DE  1c         INC E
*          19DF  93         SUB E
*          19E0  1a         LD A,(DE)
*          19E1  ce02       ADC A,2
*          19E3  3e80       LD A,0x80
*          19E5  10e0       DJNZ 0x19c7
*          19E7  d620       SUB 0x20
*          19E9  e0         RET po
           19EA  d620       SUB 0x20
           19EC  fe00       CP 0
*          19EE  20e0       JR nz,0x19d0
*          19F0  d620       SUB 0x20
*          19F2  e0         RET po
*          19F3  d680       SUB 0x80
*          19F5  e0         RET po
           19F6  d620       SUB 0x20
           19F8  e0         RET po
           19F9  d620       SUB 0x20
           19FB  fe00       CP 0
           19FD  20e0       JR nz,0x19df
           19FF  d620       SUB 0x20
           1A01  e0         RET po
           1A02  d680       SUB 0x80
           1A04  e0         RET po
           1A05  be         CP (HL)
*  L_1A06: 1A06  20fe       JR nz,0x1a06
*          1A08  00         NOP
*          1A09  20e0       JR nz,0x19eb
*          1A0B  ca20fe     JP z,0xfe20
*          1A0E  00         NOP
*          1A0F  20e0       JR nz,0x19f1
*          1A11  be         CP (HL)
*          1A12  20e0       JR nz,0x19f4
*          1A14  d620       SUB 0x20
*          1A16  fe00       CP 0
*          1A18  40         LD B,B
*          1A19  e0         RET po
           1A1A  e280fe     JP po,0xfe80
           1A1D  00         NOP
           1A1E  80         ADD A,B
           1A1F  decb       SBC A,0xcb
           1A21  1c         INC E
           1A22  de87       SBC A,0x87
           1A24  1f         RRA
           1A25  decb       SBC A,0xcb
           1A27  1c         INC E
           1A28  defc       SBC A,0xfc
           1A2A  1c         INC E
           1A2B  de29       SBC A,0x29
*          1A2D  1ede       LD E,0xde
*          1A2F  29         ADD HL,HL
*          1A30  1ede       LD E,0xde
*  L_1A32: 1A32  4e         LD C,(HL)
*          1A33  1ede       LD E,0xde
*  L_1A35: 1A35  cb1c       RR H
*          1A37  defc       SBC A,0xfc
*          1A39  1c         INC E
*          1A3A  be         CP (HL)
*          1A3B  e3         EX (SP),HL
*          1A3C  19         ADD HL,DE
*          1A3D  0e00       LD C,0
*          1A3F  00         NOP
*          1A40  4e         LD C,(HL)
*  L_1A41: 1A41  feff       CP 0xff
*          1A43  ce02       ADC A,2
*          1A45  3e80       LD A,0x80
*          1A47  10e0       DJNZ 0x1a29
*          1A49  aa         XOR D
*          1A4A  20e0       JR nz,0x1a2c
*          1A4C  aa         XOR D
*  L_1A4D: 1A4D  20fe       JR nz,0x1a4d
*          1A4F  00         NOP
*          1A50  20e0       JR nz,0x1a32
*          1A52  aa         XOR D
*          1A53  20e0       JR nz,0x1a35
*          1A55  aa         XOR D
*          1A56  80         ADD A,B
*          1A57  e0         RET po
           1A58  b4         OR H
           1A59  20e0       JR nz,0x1a3b
           1A5B  b4         OR H
*  L_1A5C: 1A5C  20fe       JR nz,0x1a5c
*          1A5E  00         NOP
*          1A5F  20e0       JR nz,0x1a41
*          1A61  b4         OR H
*          1A62  20e0       JR nz,0x1a44
*          1A64  b4         OR H
*          1A65  80         ADD A,B
*          1A66  fe00       CP 0
*          1A68  80         ADD A,B
*          1A69  fe00       CP 0
*          1A6B  80         ADD A,B
*          1A6C  fe00       CP 0
*          1A6E  80         ADD A,B
*          1A6F  fe00       CP 0
*          1A71  80         ADD A,B
*          1A72  de27       SBC A,0x27
*          1A74  1d         DEC E
*          1A75  deaf       SBC A,0xaf
*          1A77  1f         RRA
*          1A78  de27       SBC A,0x27
*          1A7A  1d         DEC E
*          1A7B  de58       SBC A,0x58
*          1A7D  1d         DEC E
*          1A7E  de79       SBC A,0x79
*          1A80  1ede       LD E,0xde
*  L_1A82: 1A82  79         LD A,C
*          1A83  1ede       LD E,0xde
*  L_1A85: 1A85  9e         SBC A,(HL)
*          1A86  1ede       LD E,0xde
*          1A88  27         DAA
*          1A89  1d         DEC E
*          1A8A  de58       SBC A,0x58
*          1A8C  1d         DEC E
*          1A8D  be         CP (HL)
*          1A8E  45         LD B,L
*          1A8F  1a         LD A,(DE)
*          1A90  0e00       LD C,0
*          1A92  00         NOP
*          1A93  ce02       ADC A,2
*          1A95  3e80       LD A,0x80
*          1A97  10e0       DJNZ 0x1a79
*          1A99  8f         ADC A,A
*          1A9A  20e0       JR nz,0x1a7c
*          1A9C  8f         ADC A,A
*  L_1A9D: 1A9D  20fe       JR nz,0x1a9d
*          1A9F  00         NOP
*          1AA0  20e0       JR nz,0x1a82
*          1AA2  8f         ADC A,A
*  L_1AA3: 1AA3  20e0       JR nz,0x1a85
*          1AA5  8f         ADC A,A
*  L_1AA6: 1AA6  80         ADD A,B
*          1AA7  e0         RET po
           1AA8  7f         LD A,A
           1AA9  20e0       JR nz,0x1a8b
           1AAB  7f         LD A,A
*  L_1AAC: 1AAC  20fe       JR nz,0x1aac
*          1AAE  00         NOP
*          1AAF  20e0       JR nz,0x1a91
*          1AB1  7f         LD A,A
*          1AB2  20e0       JR nz,0x1a94
*          1AB4  7f         LD A,A
*          1AB5  80         ADD A,B
*          1AB6  e0         RET po
           1AB7  71         LD (HL),C
*  L_1AB8: 1AB8  20fe       JR nz,0x1ab8
*          1ABA  00         NOP
*          1ABB  20e0       JR nz,0x1a9d
*          1ABD  78         LD A,B
*  L_1ABE: 1ABE  20fe       JR nz,0x1abe
*          1AC0  00         NOP
*          1AC1  20e0       JR nz,0x1aa3
*          1AC3  71         LD (HL),C
*  L_1AC4: 1AC4  20e0       JR nz,0x1aa6
*          1AC6  7f         LD A,A
*  L_1AC7: 1AC7  20fe       JR nz,0x1ac7
*          1AC9  00         NOP
*          1ACA  40         LD B,B
*          1ACB  e0         RET po
           1ACC  8f         ADC A,A
           1ACD  80         ADD A,B
           1ACE  fe00       CP 0
           1AD0  80         ADD A,B
           1AD1  de74       SBC A,0x74
           1AD3  1d         DEC E
           1AD4  ded7       SBC A,0xd7
           1AD6  1f         RRA
           1AD7  de74       SBC A,0x74
           1AD9  1d         DEC E
           1ADA  dea5       SBC A,0xa5
           1ADC  1d         DEC E
           1ADD  dec9       SBC A,0xc9
           1ADF  1ede       LD E,0xde
           1AE1  c9         RET
           1AE2  1ede       LD E,0xde
*  L_1AE4: 1AE4  ee1e       XOR 0x1e
*  L_1AE6: 1AE6  de74       SBC A,0x74
*          1AE8  1d         DEC E
*          1AE9  dea5       SBC A,0xa5
*          1AEB  1d         DEC E
*          1AEC  be         CP (HL)
*          1AED  95         SUB L
*          1AEE  1a         LD A,(DE)
*          1AEF  0e00       LD C,0
*          1AF1  00         NOP
*          1AF2  3ea0       LD A,0xa0
*          1AF4  10ce       DJNZ 0x1ac4
*          1AF6  02         LD (BC),A
*          1AF7  8e         ADC A,(HL)
*          1AF8  07         RLCA
*          1AF9  fe00       CP 0
*          1AFB  80         ADD A,B
*          1AFC  7e         LD A,(HL)
*          1AFD  f9         LD SP,HL
*          1AFE  1a         LD A,(DE)
*          1AFF  fe00       CP 0
*          1B01  20e1       JR nz,0x1ae4
*          1B03  1d         DEC E
*          1B04  20e0       JR nz,0x1ae6
*          1B06  fe20       CP 0x20
*          1B08  e0         RET po
           1B09  f0         RET p
           1B0A  20de       JR nz,0x1aea
           1B0C  381b       JR c,0x1b29
           1B0E  de53       SBC A,0x53
           1B10  1b         DEC DE
           1B11  de38       SBC A,0x38
           1B13  1b         DEC DE
           1B14  de78       SBC A,0x78
           1B16  1b         DEC DE
           1B17  de38       SBC A,0x38
           1B19  1b         DEC DE
           1B1A  de53       SBC A,0x53
           1B1C  1b         DEC DE
           1B1D  de9d       SBC A,0x9d
           1B1F  1b         DEC DE
           1B20  ded8       SBC A,0xd8
           1B22  1b         DEC DE
           1B23  ded8       SBC A,0xd8
           1B25  1b         DEC DE
           1B26  de12       SBC A,0x12
           1B28  1c         INC E
*          1B29  de38       SBC A,0x38
*          1B2B  1b         DEC DE
*          1B2C  de53       SBC A,0x53
*          1B2E  1b         DEC DE
*          1B2F  de9d       SBC A,0x9d
*          1B31  1b         DEC DE
*          1B32  be         CP (HL)
*          1B33  f7         RST 0x30
*          1B34  1a         LD A,(DE)
*          1B35  0e00       LD C,0
*          1B37  00         NOP
*          1B38  8e         ADC A,(HL)
*          1B39  02         LD (BC),A
*          1B3A  e0         RET po
           1B3B  e220e0     JP po,0xe020
           1B3E  f0         RET p
           1B3F  20e0       JR nz,0x1b21
           1B41  e220e0     JP po,0xe020
           1B44  fe40       CP 0x40
           1B46  e1         POP HL
*  L_1B47: 1B47  1d         DEC E
*          1B48  20e0       JR nz,0x1b2a
*          1B4A  e220e1     JP po,0xe120
*          1B4D  1d         DEC E
*          1B4E  207e       JR nz,0x1bce
*          1B50  3a1bee     LD A,(0xee1b)
*          1B53  6e         LD L,(HL)
*          1B54  20e0       JR nz,0x1b36
*          1B56  d6e1       SUB 0xe1
*          1B58  1d         DEC E
*          1B59  e0         RET po
           1B5A  fee0       CP 0xe0
           1B5C  d6e0       SUB 0xe0
           1B5E  b4         OR H
           1B5F  e0         RET po
           1B60  aa         XOR D
           1B61  e0         RET po
           1B62  d6e1       SUB 0xe1
           1B64  1d         DEC E
           1B65  e0         RET po
           1B66  d6e0       SUB 0xe0
           1B68  fee0       CP 0xe0
           1B6A  b4         OR H
           1B6B  e0         RET po
           1B6C  aa         XOR D
           1B6D  e0         RET po
           1B6E  d6e0       SUB 0xe0
           1B70  f0         RET p
           1B71  e0         RET po
           1B72  fee1       CP 0xe1
           1B74  1d         DEC E
           1B75  6e         LD L,(HL)
           1B76  00         NOP
           1B77  ee6e       XOR 0x6e
           1B79  20e0       JR nz,0x1b5b
           1B7B  d6e0       SUB 0xe0
           1B7D  d6e0       SUB 0xe0
           1B7F  be         CP (HL)
*          1B80  e0         RET po
           1B81  d6e0       SUB 0xe0
           1B83  aa         XOR D
           1B84  e0         RET po
           1B85  d6e0       SUB 0xe0
           1B87  a0         AND B
           1B88  e0         RET po
           1B89  d6e0       SUB 0xe0
           1B8B  97         SUB A
           1B8C  e0         RET po
           1B8D  8f         ADC A,A
           1B8E  e0         RET po
           1B8F  7f         LD A,A
           1B90  e0         RET po
           1B91  8f         ADC A,A
           1B92  e0         RET po
           1B93  a0         AND B
           1B94  e0         RET po
           1B95  aa         XOR D
           1B96  e0         RET po
           1B97  be         CP (HL)
           1B98  e0         RET po
           1B99  d66e       SUB 0x6e
           1B9B  00         NOP
           1B9C  ee6e       XOR 0x6e
           1B9E  20e0       JR nz,0x1b80
           1BA0  fee1       CP 0xe1
           1BA2  0d         DEC C
           1BA3  e0         RET po
           1BA4  fee0       CP 0xe0
           1BA6  e2e0be     JP po,0xbee0
           1BA9  e0         RET po
           1BAA  d6e0       SUB 0xe0
           1BAC  e2e0fe     JP po,0xfee0
           1BAF  e1         POP HL
           1BB0  1d         DEC E
           1BB1  e1         POP HL
           1BB2  2ee1       LD L,0xe1
           1BB4  1d         DEC E
           1BB5  e1         POP HL
           1BB6  0d         DEC C
           1BB7  e0         RET po
           1BB8  fee1       CP 0xe1
           1BBA  1d         DEC E
           1BBB  e1         POP HL
*  L_1BBC: 1BBC  40         LD B,B
*          1BBD  e1         POP HL
*          1BBE  53         LD D,E
*          1BBF  e1         POP HL
*          1BC0  1d         DEC E
*          1BC1  e0         RET po
*  L_1BC2: 1BC2  fee0       CP 0xe0
*          1BC4  be         CP (HL)
*          1BC5  e0         RET po
           1BC6  d6e0       SUB 0xe0
*  L_1BC8: 1BC8  f0         RET p
           1BC9  e0         RET po
           1BCA  e2e168     JP po,0x68e1
           1BCD  e1         POP HL
*  L_1BCE: 1BCE  53         LD D,E
*          1BCF  6e         LD L,(HL)
*          1BD0  00         NOP
*          1BD1  e1         POP HL
*          1BD2  ac         XOR H
*          1BD3  80         ADD A,B
*          1BD4  fe00       CP 0
*          1BD6  80         ADD A,B
*          1BD7  eee0       XOR 0xe0
*          1BD9  8f         ADC A,A
*  L_1BDA: 1BDA  20e0       JR nz,0x1bbc
*          1BDC  8f         ADC A,A
*  L_1BDD: 1BDD  20fe       JR nz,0x1bdd
*          1BDF  00         NOP
*  L_1BE0: 1BE0  20e0       JR nz,0x1bc2
*          1BE2  8f         ADC A,A
*          1BE3  40         LD B,B
*          1BE4  e0         RET po
           1BE5  97         SUB A
*  L_1BE6: 1BE6  20e0       JR nz,0x1bc8
*          1BE8  8f         ADC A,A
*  L_1BE9: 1BE9  40         LD B,B
*          1BEA  e0         RET po
           1BEB  7f         LD A,A
           1BEC  80         ADD A,B
           1BED  e0         RET po
           1BEE  aa         XOR D
           1BEF  80         ADD A,B
           1BF0  e0         RET po
           1BF1  a0         AND B
           1BF2  20e0       JR nz,0x1bd4
           1BF4  a0         AND B
*  L_1BF5: 1BF5  20fe       JR nz,0x1bf5
*          1BF7  00         NOP
*  L_1BF8: 1BF8  20e0       JR nz,0x1bda
*          1BFA  a0         AND B
*  L_1BFB: 1BFB  40         LD B,B
*          1BFC  e0         RET po
           1BFD  aa         XOR D
*  L_1BFE: 1BFE  20e0       JR nz,0x1be0
*          1C00  be         CP (HL)
*          1C01  40         LD B,B
*          1C02  e0         RET po
           1C03  e220e0     JP po,0xe020
*          1C06  f0         RET p
*  L_1C07: 1C07  20e0       JR nz,0x1be9
*          1C09  e220e0     JP po,0xe020
*          1C0C  d620       SUB 0x20
*          1C0E  e0         RET po
           1C0F  be         CP (HL)
           1C10  80         ADD A,B
           1C11  ee8e       XOR 0x8e
           1C13  02         LD (BC),A
           1C14  e0         RET po
           1C15  a0         AND B
*          1C16  20e0       JR nz,0x1bf8
*          1C18  aa         XOR D
*          1C19  20e0       JR nz,0x1bfb
*          1C1B  a0         AND B
*          1C1C  20e0       JR nz,0x1bfe
*          1C1E  aa         XOR D
*          1C1F  40         LD B,B
*          1C20  e0         RET po
           1C21  be         CP (HL)
           1C22  20e0       JR nz,0x1c04
           1C24  a0         AND B
*          1C25  20e0       JR nz,0x1c07
*          1C27  be         CP (HL)
*          1C28  207e       JR nz,0x1ca8
*          1C2A  14         INC D
*          1C2B  1c         INC E
*          1C2C  e0         RET po
           1C2D  aa         XOR D
*          1C2E  40         LD B,B
*          1C2F  e0         RET po
           1C30  a0         AND B
*          1C31  40         LD B,B
*          1C32  e0         RET po
           1C33  aa         XOR D
           1C34  20e0       JR nz,0x1c16
           1C36  b4         OR H
           1C37  60         LD H,B
           1C38  e0         RET po
           1C39  aa         XOR D
           1C3A  80         ADD A,B
           1C3B  fe00       CP 0
           1C3D  80         ADD A,B
           1C3E  fe00       CP 0
*  L_1C40: 1C40  60         LD H,B
*          1C41  e0         RET po
           1C42  aa         XOR D
           1C43  20e0       JR nz,0x1c25
           1C45  a0         AND B
           1C46  20e0       JR nz,0x1c28
           1C48  aa         XOR D
           1C49  20e0       JR nz,0x1c2b
           1C4B  b4         OR H
           1C4C  20e0       JR nz,0x1c2e
           1C4E  aa         XOR D
           1C4F  20e0       JR nz,0x1c31
           1C51  7f         LD A,A
*  L_1C52: 1C52  80         ADD A,B
*          1C53  e0         RET po
           1C54  aa         XOR D
*  L_1C55: 1C55  80         ADD A,B
*          1C56  e0         RET po
           1C57  a0         AND B
           1C58  40         LD B,B
           1C59  e0         RET po
           1C5A  a0         AND B
*  L_1C5B: 1C5B  40         LD B,B
*          1C5C  e0         RET po
           1C5D  aa         XOR D
*  L_1C5E: 1C5E  20e0       JR nz,0x1c40
*          1C60  be         CP (HL)
*          1C61  60         LD H,B
*          1C62  e0         RET po
           1C63  fe80       CP 0x80
           1C65  fe00       CP 0
*  L_1C67: 1C67  80         ADD A,B
*          1C68  eece       XOR 0xce
*          1C6A  02         LD (BC),A
*          1C6B  3e80       LD A,0x80
*  L_1C6D: 1C6D  10e3       DJNZ 0x1c52
*          1C6F  57         LD D,A
*  L_1C70: 1C70  20e3       JR nz,0x1c55
*          1C72  57         LD D,A
*  L_1C73: 1C73  20fe       JR nz,0x1c73
*          1C75  00         NOP
*          1C76  20e3       JR nz,0x1c5b
*          1C78  57         LD D,A
*          1C79  20e3       JR nz,0x1c5e
*          1C7B  57         LD D,A
*          1C7C  40         LD B,B
*          1C7D  e3         EX (SP),HL
*          1C7E  57         LD D,A
*          1C7F  40         LD B,B
*          1C80  e3         EX (SP),HL
*          1C81  f9         LD SP,HL
*          1C82  20e3       JR nz,0x1c67
*          1C84  f9         LD SP,HL
*  L_1C85: 1C85  20fe       JR nz,0x1c85
*          1C87  00         NOP
*          1C88  20e3       JR nz,0x1c6d
*          1C8A  f9         LD SP,HL
*          1C8B  20e3       JR nz,0x1c70
*          1C8D  f9         LD SP,HL
*          1C8E  40         LD B,B
*          1C8F  e3         EX (SP),HL
*          1C90  f9         LD SP,HL
*          1C91  40         LD B,B
*          1C92  e47580     CALL po,0x8075
*          1C95  fe00       CP 0
*          1C97  80         ADD A,B
*          1C98  fe00       CP 0
*          1C9A  80         ADD A,B
*          1C9B  fe00       CP 0
*          1C9D  80         ADD A,B
*          1C9E  ded0       SBC A,0xd0
*          1CA0  1d         DEC E
*          1CA1  deff       SBC A,0xff
*          1CA3  1f         RRA
*          1CA4  ded0       SBC A,0xd0
*          1CA6  1d         DEC E
*          1CA7  de01       SBC A,1
*          1CA9  1ede       LD E,0xde
*          1CAB  19         ADD HL,DE
*          1CAC  1f         RRA
*          1CAD  de19       SBC A,0x19
*          1CAF  1f         RRA
*          1CB0  de3e       SBC A,0x3e
*          1CB2  1f         RRA
*          1CB3  ded0       SBC A,0xd0
*          1CB5  1d         DEC E
*          1CB6  de01       SBC A,1
*          1CB8  1ebe       LD E,0xbe
*          1CBA  6b         LD L,E
*          1CBB  1c         INC E
*          1CBC  0e00       LD C,0
*          1CBE  00         NOP
*          1CBF  3ea0       LD A,0xa0
*  L_1CC1: 1CC1  10fe       DJNZ 0x1cc1
*          1CC3  00         NOP
*          1CC4  02         LD (BC),A
*          1CC5  4e         LD C,(HL)
*          1CC6  feff       CP 0xff
*          1CC8  0ef5       LD C,0xf5
*          1CCA  1a         LD A,(DE)
*          1CCB  e0         RET po
           1CCC  e240e0     JP po,0xe040
           1CCF  f0         RET p
*          1CD0  40         LD B,B
*          1CD1  e0         RET po
           1CD2  e240fe     JP po,0xfe40
           1CD5  00         NOP
           1CD6  20e0       JR nz,0x1cb8
           1CD8  e240e0     JP po,0xe040
           1CDB  e220e0     JP po,0xe020
           1CDE  f0         RET p
           1CDF  40         LD B,B
           1CE0  e0         RET po
           1CE1  e280e0     JP po,0xe080
           1CE4  d640       SUB 0x40
           1CE6  e0         RET po
           1CE7  d640       SUB 0x40
           1CE9  e0         RET po
           1CEA  d640       SUB 0x40
           1CEC  fe00       CP 0
           1CEE  20e0       JR nz,0x1cd0
*          1CF0  d640       SUB 0x40
*          1CF2  e0         RET po
           1CF3  d620       SUB 0x20
           1CF5  e0         RET po
*  L_1CF6: 1CF6  d640       SUB 0x40
*          1CF8  e0         RET po
           1CF9  d680       SUB 0x80
           1CFB  eee0       XOR 0xe0
           1CFD  d680       SUB 0x80
*  L_1CFF: 1CFF  e0         RET po
           1D00  aa         XOR D
           1D01  80         ADD A,B
           1D02  e0         RET po
           1D03  d660       SUB 0x60
           1D05  e0         RET po
           1D06  ca40e0     JP z,0xe040
           1D09  ca60e1     JP z,0xe160
           1D0C  1d         DEC E
           1D0D  20e1       JR nz,0x1cf0
           1D0F  1d         DEC E
*  L_1D10: 1D10  20fe       JR nz,0x1d10
*          1D12  00         NOP
*          1D13  20e1       JR nz,0x1cf6
*          1D15  1d         DEC E
*  L_1D16: 1D16  20fe       JR nz,0x1d16
*          1D18  00         NOP
*          1D19  20e1       JR nz,0x1cfc
*          1D1B  1d         DEC E
*          1D1C  20e1       JR nz,0x1cff
*          1D1E  40         LD B,B
*          1D1F  40         LD B,B
*          1D20  e1         POP HL
*          1D21  53         LD D,E
*          1D22  80         ADD A,B
*          1D23  fe00       CP 0
*          1D25  80         ADD A,B
*          1D26  eee0       XOR 0xe0
*          1D28  be         CP (HL)
*          1D29  40         LD B,B
*          1D2A  e0         RET po
           1D2B  be         CP (HL)
*          1D2C  40         LD B,B
*          1D2D  e0         RET po
           1D2E  be         CP (HL)
           1D2F  40         LD B,B
           1D30  fe00       CP 0
*          1D32  20e0       JR nz,0x1d14
*          1D34  be         CP (HL)
*          1D35  40         LD B,B
*          1D36  e0         RET po
           1D37  be         CP (HL)
           1D38  20e0       JR nz,0x1d1a
           1D3A  be         CP (HL)
           1D3B  40         LD B,B
           1D3C  e0         RET po
           1D3D  be         CP (HL)
           1D3E  80         ADD A,B
           1D3F  e0         RET po
           1D40  aa         XOR D
           1D41  40         LD B,B
           1D42  e0         RET po
           1D43  b4         OR H
           1D44  40         LD B,B
           1D45  e0         RET po
           1D46  aa         XOR D
           1D47  40         LD B,B
           1D48  fe00       CP 0
           1D4A  20e0       JR nz,0x1d2c
           1D4C  aa         XOR D
           1D4D  40         LD B,B
           1D4E  e0         RET po
           1D4F  aa         XOR D
           1D50  20e0       JR nz,0x1d32
           1D52  b4         OR H
           1D53  40         LD B,B
           1D54  e0         RET po
           1D55  aa         XOR D
           1D56  80         ADD A,B
           1D57  eee0       XOR 0xe0
           1D59  a0         AND B
           1D5A  80         ADD A,B
           1D5B  e0         RET po
           1D5C  7f         LD A,A
           1D5D  80         ADD A,B
           1D5E  e0         RET po
           1D5F  aa         XOR D
           1D60  60         LD H,B
*  L_1D61: 1D61  e0         RET po
           1D62  aa         XOR D
           1D63  40         LD B,B
           1D64  e0         RET po
           1D65  aa         XOR D
           1D66  60         LD H,B
*          1D67  fe00       CP 0
*          1D69  80         ADD A,B
*          1D6A  fe00       CP 0
*          1D6C  80         ADD A,B
*          1D6D  fe00       CP 0
*          1D6F  80         ADD A,B
*          1D70  fe00       CP 0
*          1D72  80         ADD A,B
*          1D73  eee0       XOR 0xe0
*          1D75  a0         AND B
*          1D76  40         LD B,B
*          1D77  e0         RET po
           1D78  a0         AND B
*          1D79  40         LD B,B
*          1D7A  e0         RET po
           1D7B  a0         AND B
           1D7C  40         LD B,B
           1D7D  fe00       CP 0
*          1D7F  20e0       JR nz,0x1d61
*          1D81  a0         AND B
*          1D82  40         LD B,B
*          1D83  e0         RET po
           1D84  a0         AND B
           1D85  20e0       JR nz,0x1d67
           1D87  a0         AND B
           1D88  40         LD B,B
           1D89  e0         RET po
           1D8A  a0         AND B
           1D8B  80         ADD A,B
           1D8C  e0         RET po
           1D8D  8f         ADC A,A
           1D8E  40         LD B,B
           1D8F  e0         RET po
           1D90  97         SUB A
           1D91  40         LD B,B
           1D92  e0         RET po
           1D93  8f         ADC A,A
           1D94  40         LD B,B
           1D95  fe00       CP 0
           1D97  20e0       JR nz,0x1d79
           1D99  8f         ADC A,A
           1D9A  40         LD B,B
           1D9B  e0         RET po
           1D9C  8f         ADC A,A
           1D9D  20e0       JR nz,0x1d7f
           1D9F  97         SUB A
           1DA0  40         LD B,B
           1DA1  e0         RET po
           1DA2  8f         ADC A,A
           1DA3  80         ADD A,B
*  L_1DA4: 1DA4  eee0       XOR 0xe0
*          1DA6  7f         LD A,A
*  L_1DA7: 1DA7  80         ADD A,B
*          1DA8  e0         RET po
           1DA9  6b         LD L,E
           1DAA  80         ADD A,B
           1DAB  e0         RET po
           1DAC  8f         ADC A,A
           1DAD  60         LD H,B
           1DAE  e0         RET po
           1DAF  7f         LD A,A
           1DB0  40         LD B,B
           1DB1  e0         RET po
           1DB2  7f         LD A,A
           1DB3  60         LD H,B
           1DB4  e0         RET po
           1DB5  aa         XOR D
           1DB6  20e0       JR nz,0x1d98
           1DB8  aa         XOR D
*  L_1DB9: 1DB9  20fe       JR nz,0x1db9
*          1DBB  00         NOP
*          1DBC  20e0       JR nz,0x1d9e
*          1DBE  aa         XOR D
*  L_1DBF: 1DBF  20fe       JR nz,0x1dbf
*          1DC1  00         NOP
*          1DC2  20e0       JR nz,0x1da4
*          1DC4  aa         XOR D
*          1DC5  20e0       JR nz,0x1da7
*          1DC7  be         CP (HL)
*          1DC8  40         LD B,B
*          1DC9  e0         RET po
           1DCA  d680       SUB 0x80
           1DCC  fe00       CP 0
           1DCE  80         ADD A,B
           1DCF  eee3       XOR 0xe3
           1DD1  8a         ADC A,D
           1DD2  40         LD B,B
           1DD3  e3         EX (SP),HL
           1DD4  f9         LD SP,HL
           1DD5  40         LD B,B
           1DD6  e47540     CALL po,0x4075
*          1DD9  fe00       CP 0
*          1DDB  20e3       JR nz,0x1dc0
*          1DDD  8a         ADC A,D
*          1DDE  40         LD B,B
*          1DDF  e3         EX (SP),HL
*          1DE0  8a         ADC A,D
*          1DE1  20e3       JR nz,0x1dc6
*          1DE3  f9         LD SP,HL
*          1DE4  40         LD B,B
*          1DE5  e47580     CALL po,0x8075
*          1DE8  e3         EX (SP),HL
*          1DE9  57         LD D,A
*          1DEA  40         LD B,B
*          1DEB  e3         EX (SP),HL
*          1DEC  f9         LD SP,HL
*          1DED  40         LD B,B
*          1DEE  e47540     CALL po,0x4075
*          1DF1  fe00       CP 0
*          1DF3  20e3       JR nz,0x1dd8
*          1DF5  57         LD D,A
*          1DF6  40         LD B,B
*          1DF7  e47520     CALL po,0x2075
*          1DFA  e3         EX (SP),HL
*          1DFB  f9         LD SP,HL
*          1DFC  40         LD B,B
*          1DFD  e47580     CALL po,0x8075
*          1E00  eee5       XOR 0xe5
*          1E02  0180e3     LD BC,0xe380
*  L_1E05: 1E05  f9         LD SP,HL
*          1E06  80         ADD A,B
*          1E07  e47560     CALL po,0x6075
*          1E0A  e3         EX (SP),HL
*          1E0B  f9         LD SP,HL
*          1E0C  40         LD B,B
*          1E0D  e3         EX (SP),HL
*          1E0E  f9         LD SP,HL
*          1E0F  60         LD H,B
*          1E10  e5         PUSH HL
*          1E11  4d         LD C,L
*  L_1E12: 1E12  20fe       JR nz,0x1e12
*          1E14  00         NOP
*          1E15  40         LD B,B
*          1E16  e5         PUSH HL
*          1E17  4d         LD C,L
*  L_1E18: 1E18  20fe       JR nz,0x1e18
*          1E1A  00         NOP
*          1E1B  20e4       JR nz,0x1e01
*          1E1D  75         LD (HL),L
*          1E1E  20e5       JR nz,0x1e05
*          1E20  4d         LD C,L
*          1E21  40         LD B,B
*          1E22  e6ae       AND 0xae
*          1E24  80         ADD A,B
*          1E25  fe00       CP 0
*          1E27  80         ADD A,B
*          1E28  eee0       XOR 0xe0
*          1E2A  d640       SUB 0x40
*          1E2C  fe00       CP 0
*          1E2E  80         ADD A,B
*          1E2F  e0         RET po
           1E30  d640       SUB 0x40
           1E32  e0         RET po
           1E33  ca40fe     JP z,0xfe40
           1E36  00         NOP
           1E37  80         ADD A,B
           1E38  e0         RET po
           1E39  ca40e0     JP z,0xe040
           1E3C  fe40       CP 0x40
           1E3E  fe00       CP 0
           1E40  80         ADD A,B
           1E41  e0         RET po
           1E42  fe40       CP 0x40
           1E44  e0         RET po
           1E45  e240fe     JP po,0xfe40
           1E48  00         NOP
           1E49  80         ADD A,B
           1E4A  e0         RET po
           1E4B  e240ee     JP po,0xee40
           1E4E  3e90       LD A,0x90
           1E50  80         ADD A,B
           1E51  6e         LD L,(HL)
           1E52  80         ADD A,B
           1E53  e0         RET po
           1E54  d6e0       SUB 0xe0
           1E56  d6e0       SUB 0xe0
           1E58  d6e0       SUB 0xe0
           1E5A  d6e0       SUB 0xe0
           1E5C  e2e0e2     JP po,0xe2e0
           1E5F  e0         RET po
           1E60  e2e0e2     JP po,0xe2e0
           1E63  e0         RET po
           1E64  cae0ca     JP z,0xcae0
*          1E67  e0         RET po
           1E68  cae0ca     JP z,0xcae0
           1E6B  e0         RET po
           1E6C  fee0       CP 0xe0
           1E6E  fee0       CP 0xe0
           1E70  fee0       CP 0xe0
           1E72  fe6e       CP 0x6e
           1E74  00         NOP
           1E75  3e90       LD A,0x90
           1E77  10ee       DJNZ 0x1e67
           1E79  e0         RET po
           1E7A  aa         XOR D
           1E7B  40         LD B,B
           1E7C  fe00       CP 0
           1E7E  80         ADD A,B
           1E7F  e0         RET po
           1E80  aa         XOR D
           1E81  40         LD B,B
           1E82  e0         RET po
           1E83  aa         XOR D
           1E84  40         LD B,B
           1E85  fe00       CP 0
           1E87  80         ADD A,B
           1E88  e0         RET po
           1E89  aa         XOR D
           1E8A  40         LD B,B
           1E8B  e0         RET po
           1E8C  d640       SUB 0x40
           1E8E  fe00       CP 0
           1E90  80         ADD A,B
           1E91  e0         RET po
           1E92  d640       SUB 0x40
           1E94  e0         RET po
           1E95  be         CP (HL)
           1E96  40         LD B,B
           1E97  fe00       CP 0
           1E99  80         ADD A,B
           1E9A  e0         RET po
           1E9B  be         CP (HL)
           1E9C  40         LD B,B
           1E9D  ee3e       XOR 0x3e
           1E9F  90         SUB B
           1EA0  80         ADD A,B
           1EA1  6e         LD L,(HL)
           1EA2  80         ADD A,B
           1EA3  e0         RET po
           1EA4  a0         AND B
           1EA5  e0         RET po
           1EA6  a0         AND B
           1EA7  e0         RET po
           1EA8  a0         AND B
           1EA9  e0         RET po
           1EAA  a0         AND B
           1EAB  e0         RET po
           1EAC  aa         XOR D
           1EAD  e0         RET po
           1EAE  aa         XOR D
           1EAF  e0         RET po
           1EB0  aa         XOR D
           1EB1  e0         RET po
           1EB2  aa         XOR D
           1EB3  e0         RET po
           1EB4  aa         XOR D
           1EB5  e0         RET po
           1EB6  aa         XOR D
*          1EB7  e0         RET po
           1EB8  aa         XOR D
           1EB9  e0         RET po
           1EBA  aa         XOR D
           1EBB  e0         RET po
           1EBC  be         CP (HL)
           1EBD  e0         RET po
           1EBE  be         CP (HL)
           1EBF  e0         RET po
           1EC0  be         CP (HL)
           1EC1  e0         RET po
           1EC2  d66e       SUB 0x6e
           1EC4  00         NOP
           1EC5  3e90       LD A,0x90
           1EC7  10ee       DJNZ 0x1eb7
           1EC9  e0         RET po
           1ECA  d640       SUB 0x40
           1ECC  fe00       CP 0
           1ECE  80         ADD A,B
           1ECF  e0         RET po
           1ED0  d640       SUB 0x40
           1ED2  e0         RET po
           1ED3  7f         LD A,A
           1ED4  40         LD B,B
           1ED5  fe00       CP 0
           1ED7  80         ADD A,B
           1ED8  e0         RET po
           1ED9  7f         LD A,A
           1EDA  40         LD B,B
           1EDB  e0         RET po
           1EDC  a0         AND B
           1EDD  40         LD B,B
           1EDE  fe00       CP 0
           1EE0  80         ADD A,B
           1EE1  e0         RET po
           1EE2  a0         AND B
           1EE3  40         LD B,B
           1EE4  e0         RET po
           1EE5  8f         ADC A,A
           1EE6  40         LD B,B
           1EE7  fe00       CP 0
           1EE9  80         ADD A,B
           1EEA  e0         RET po
           1EEB  8f         ADC A,A
           1EEC  40         LD B,B
           1EED  ee3e       XOR 0x3e
           1EEF  90         SUB B
           1EF0  80         ADD A,B
           1EF1  6e         LD L,(HL)
           1EF2  80         ADD A,B
           1EF3  e0         RET po
           1EF4  7f         LD A,A
           1EF5  e0         RET po
           1EF6  7f         LD A,A
           1EF7  e0         RET po
           1EF8  7f         LD A,A
           1EF9  e0         RET po
           1EFA  7f         LD A,A
           1EFB  e0         RET po
           1EFC  87         ADD A,A
           1EFD  e0         RET po
           1EFE  87         ADD A,A
           1EFF  e0         RET po
           1F00  87         ADD A,A
           1F01  e0         RET po
           1F02  87         ADD A,A
           1F03  e0         RET po
           1F04  7f         LD A,A
           1F05  e0         RET po
           1F06  7f         LD A,A
*          1F07  e0         RET po
           1F08  7f         LD A,A
           1F09  e0         RET po
           1F0A  7f         LD A,A
           1F0B  e0         RET po
           1F0C  a0         AND B
           1F0D  e0         RET po
           1F0E  a0         AND B
           1F0F  e0         RET po
           1F10  a0         AND B
           1F11  e0         RET po
           1F12  a0         AND B
           1F13  6e         LD L,(HL)
           1F14  00         NOP
           1F15  3e90       LD A,0x90
           1F17  10ee       DJNZ 0x1f07
           1F19  e3         EX (SP),HL
           1F1A  57         LD D,A
           1F1B  40         LD B,B
           1F1C  fe00       CP 0
           1F1E  80         ADD A,B
           1F1F  e3         EX (SP),HL
           1F20  57         LD D,A
           1F21  40         LD B,B
           1F22  e3         EX (SP),HL
           1F23  f9         LD SP,HL
           1F24  40         LD B,B
           1F25  fe00       CP 0
           1F27  80         ADD A,B
           1F28  e3         EX (SP),HL
           1F29  f9         LD SP,HL
           1F2A  40         LD B,B
           1F2B  e5         PUSH HL
           1F2C  0140fe     LD BC,0xfe40
           1F2F  00         NOP
           1F30  80         ADD A,B
           1F31  e5         PUSH HL
           1F32  0140e4     LD BC,0xe440
           1F35  75         LD (HL),L
           1F36  40         LD B,B
           1F37  fe00       CP 0
           1F39  80         ADD A,B
           1F3A  e47540     CALL po,0x4075
           1F3D  eee5       XOR 0xe5
           1F3F  0140fe     LD BC,0xfe40
           1F42  00         NOP
           1F43  80         ADD A,B
           1F44  e5         PUSH HL
           1F45  0140e5     LD BC,0xe540
           1F48  0140fe     LD BC,0xfe40
           1F4B  00         NOP
           1F4C  80         ADD A,B
           1F4D  e5         PUSH HL
           1F4E  0140e2     LD BC,0xe240
           1F51  a7         AND A
           1F52  40         LD B,B
           1F53  fe00       CP 0
           1F55  80         ADD A,B
           1F56  e2a740     JP po,0x40a7
           1F59  e2a740     JP po,0x40a7
           1F5C  fe00       CP 0
           1F5E  80         ADD A,B
           1F5F  e2a740     JP po,0x40a7
           1F62  e3         EX (SP),HL
           1F63  f9         LD SP,HL
           1F64  40         LD B,B
           1F65  fe00       CP 0
           1F67  80         ADD A,B
           1F68  e3         EX (SP),HL
           1F69  f9         LD SP,HL
           1F6A  40         LD B,B
           1F6B  e3         EX (SP),HL
           1F6C  f9         LD SP,HL
           1F6D  40         LD B,B
           1F6E  fe00       CP 0
           1F70  80         ADD A,B
           1F71  e3         EX (SP),HL
           1F72  f9         LD SP,HL
           1F73  40         LD B,B
*          1F74  e2fa40     JP po,0x40fa
*          1F77  fe00       CP 0
*          1F79  80         ADD A,B
*          1F7A  e2fa40     JP po,0x40fa
*          1F7D  e5         PUSH HL
*          1F7E  0140fe     LD BC,0xfe40
*          1F81  00         NOP
*          1F82  80         ADD A,B
*          1F83  e5         PUSH HL
*          1F84  0140ee     LD BC,0xee40
*          1F87  e0         RET po
           1F88  e240e0     JP po,0xe040
           1F8B  f0         RET p
           1F8C  40         LD B,B
           1F8D  e0         RET po
           1F8E  e240fe     JP po,0xfe40
           1F91  00         NOP
           1F92  20e0       JR nz,0x1f74
           1F94  e240e0     JP po,0xe040
           1F97  e220e0     JP po,0xe020
           1F9A  f0         RET p
           1F9B  40         LD B,B
*          1F9C  e0         RET po
           1F9D  e280e0     JP po,0xe080
           1FA0  d640       SUB 0x40
*          1FA2  fe00       CP 0
*          1FA4  40         LD B,B
*          1FA5  fe00       CP 0
*          1FA7  80         ADD A,B
*          1FA8  fe00       CP 0
*          1FAA  80         ADD A,B
*          1FAB  fe00       CP 0
*          1FAD  80         ADD A,B
*          1FAE  eee0       XOR 0xe0
*          1FB0  be         CP (HL)
*          1FB1  40         LD B,B
*          1FB2  e0         RET po
           1FB3  be         CP (HL)
           1FB4  40         LD B,B
           1FB5  e0         RET po
           1FB6  be         CP (HL)
           1FB7  40         LD B,B
           1FB8  fe00       CP 0
           1FBA  20e0       JR nz,0x1f9c
           1FBC  be         CP (HL)
           1FBD  40         LD B,B
           1FBE  e0         RET po
           1FBF  be         CP (HL)
           1FC0  20e0       JR nz,0x1fa2
           1FC2  be         CP (HL)
           1FC3  40         LD B,B
*          1FC4  e0         RET po
           1FC5  be         CP (HL)
           1FC6  80         ADD A,B
           1FC7  e0         RET po
           1FC8  aa         XOR D
           1FC9  40         LD B,B
*  L_1FCA: 1FCA  fe00       CP 0
*          1FCC  40         LD B,B
*          1FCD  fe00       CP 0
*          1FCF  80         ADD A,B
*          1FD0  fe00       CP 0
*          1FD2  80         ADD A,B
*          1FD3  fe00       CP 0
*          1FD5  80         ADD A,B
*          1FD6  eee0       XOR 0xe0
*          1FD8  a0         AND B
*          1FD9  40         LD B,B
*          1FDA  e0         RET po
           1FDB  a0         AND B
           1FDC  40         LD B,B
           1FDD  e0         RET po
           1FDE  a0         AND B
           1FDF  40         LD B,B
           1FE0  fe00       CP 0
           1FE2  20e0       JR nz,0x1fc4
           1FE4  a0         AND B
           1FE5  40         LD B,B
           1FE6  e0         RET po
*  L_1FE7: 1FE7  a0         AND B
*          1FE8  20e0       JR nz,0x1fca
*          1FEA  a0         AND B
*          1FEB  40         LD B,B
*          1FEC  e0         RET po
           1FED  a0         AND B
           1FEE  80         ADD A,B
*  L_1FEF: 1FEF  e0         RET po
           1FF0  8f         ADC A,A
           1FF1  40         LD B,B
           1FF2  fe00       CP 0
           1FF4  40         LD B,B
*  L_1FF5: 1FF5  fe00       CP 0
*          1FF7  80         ADD A,B
*          1FF8  fe00       CP 0
*          1FFA  80         ADD A,B
*          1FFB  fe00       CP 0
*          1FFD  80         ADD A,B
*          1FFE  eee3       XOR 0xe3
*          2000  8a         ADC A,D
*          2001  40         LD B,B
*          2002  e3         EX (SP),HL
*          2003  f9         LD SP,HL
*          2004  40         LD B,B
*          2005  e47540     CALL po,0x4075
*          2008  fe00       CP 0
*          200A  20e3       JR nz,0x1fef
*          200C  8a         ADC A,D
*          200D  40         LD B,B
*          200E  e3         EX (SP),HL
*          200F  8a         ADC A,D
*          2010  20e3       JR nz,0x1ff5
*          2012  f9         LD SP,HL
*          2013  40         LD B,B
*  L_2014: 2014  e47580     CALL po,0x8075
*          2017  e3         EX (SP),HL
*  L_2018: 2018  57         LD D,A
*          2019  40         LD B,B
*          201A  fe00       CP 0
*          201C  40         LD B,B
*          201D  fe00       CP 0
*  L_201F: 201F  80         ADD A,B
*          2020  fe00       CP 0
*          2022  80         ADD A,B
*          2023  fe00       CP 0
*  L_2025: 2025  80         ADD A,B
*          2026  ee33       XOR 0x33
*          2028  20ea       JR nz,0x2014
*          202A  20bb       JR nz,0x1fe7
*          202C  21b521     LD HL,0x21b5
       202F  db   'p"v">'
           2034  a0         AND B
*          2035  0c         INC C
*          2036  de7b       SBC A,0x7b
*          2038  20de       JR nz,0x2018
*          203A  aa         XOR D
*          203B  20de       JR nz,0x201b
*          203D  7b         LD A,E
*          203E  208e       JR nz,0x1fce
*          2040  02         LD (BC),A
*          2041  e0         RET po
           2042  d620       SUB 0x20
           2044  e0         RET po
*          2045  d620       SUB 0x20
*          2047  e0         RET po
           2048  d620       SUB 0x20
           204A  e0         RET po
           204B  d640       SUB 0x40
           204D  e0         RET po
           204E  d620       SUB 0x20
           2050  7e         LD A,(HL)
           2051  41         LD B,C
           2052  20de       JR nz,0x2032
           2054  bf         CP A
           2055  20de       JR nz,0x2035
           2057  bf         CP A
           2058  20de       JR nz,0x2038
           205A  7b         LD A,E
           205B  20de       JR nz,0x203b
           205D  aa         XOR D
           205E  206e       JR nz,0x20ce
           2060  20e1       JR nz,0x2043
*          2062  40         LD B,B
*          2063  e0         RET po
*  L_2064: 2064  fee0       CP 0xe0
*          2066  d6e1       SUB 0xe1
*          2068  1d         DEC E
*          2069  e0         RET po
           206A  e2e0be     JP po,0xbee0
*          206D  e0         RET po
           206E  e2e0be     JP po,0xbee0
           2071  e0         RET po
           2072  a0         AND B
           2073  6e         LD L,(HL)
           2074  00         NOP
*  L_2075: 2075  e0         RET po
*          2076  d6c0       SUB 0xc0
*          2078  0e00       LD C,0
*          207A  00         NOP
*          207B  8e         ADC A,(HL)
*          207C  02         LD (BC),A
*          207D  e0         RET po
           207E  aa         XOR D
           207F  20e0       JR nz,0x2061
           2081  aa         XOR D
*          2082  20e0       JR nz,0x2064
*          2084  aa         XOR D
*          2085  20e0       JR nz,0x2067
*          2087  aa         XOR D
*          2088  40         LD B,B
*          2089  e0         RET po
           208A  aa         XOR D
           208B  20e0       JR nz,0x206d
           208D  aa         XOR D
           208E  40         LD B,B
           208F  e0         RET po
           2090  aa         XOR D
           2091  80         ADD A,B
           2092  e0         RET po
           2093  a0         AND B
           2094  20e0       JR nz,0x2076
           2096  a0         AND B
           2097  20e0       JR nz,0x2079
           2099  a0         AND B
           209A  20e0       JR nz,0x207c
           209C  a0         AND B
           209D  40         LD B,B
           209E  e0         RET po
           209F  a0         AND B
           20A0  20e0       JR nz,0x2082
           20A2  aa         XOR D
           20A3  40         LD B,B
           20A4  e0         RET po
           20A5  be         CP (HL)
           20A6  80         ADD A,B
           20A7  7e         LD A,(HL)
           20A8  7d         LD A,L
           20A9  208e       JR nz,0x2039
           20AB  02         LD (BC),A
           20AC  e0         RET po
*          20AD  d620       SUB 0x20
*          20AF  e0         RET po
           20B0  d620       SUB 0x20
           20B2  e0         RET po
           20B3  d620       SUB 0x20
           20B5  e0         RET po
           20B6  d640       SUB 0x40
           20B8  e0         RET po
           20B9  d620       SUB 0x20
           20BB  7e         LD A,(HL)
           20BC  ac         XOR H
           20BD  20ee       JR nz,0x20ad
           20BF  e0         RET po
           20C0  fe20       CP 0x20
           20C2  e0         RET po
           20C3  fe20       CP 0x20
           20C5  e0         RET po
           20C6  fe20       CP 0x20
           20C8  e0         RET po
           20C9  fe40       CP 0x40
           20CB  e0         RET po
           20CC  fe20       CP 0x20
*          20CE  e0         RET po
           20CF  fe40       CP 0x40
           20D1  e0         RET po
           20D2  fe80       CP 0x80
           20D4  e0         RET po
           20D5  e220e0     JP po,0xe020
           20D8  e220e0     JP po,0xe020
           20DB  e220e0     JP po,0xe020
           20DE  e240e0     JP po,0xe040
           20E1  e220e0     JP po,0xe020
           20E4  d640       SUB 0x40
           20E6  e0         RET po
           20E7  e280ee     JP po,0xee80
*          20EA  3ea0       LD A,0xa0
*          20EC  0c         INC C
*          20ED  de3c       SBC A,0x3c
*          20EF  21de6b     LD HL,0x6bde
*          20F2  21de3c     LD HL,0x3cde
*          20F5  21e0fe     LD HL,0xfee0
*          20F8  20e0       JR nz,0x20da
*          20FA  fe20       CP 0x20
*          20FC  e0         RET po
           20FD  fe20       CP 0x20
           20FF  e0         RET po
           2100  fe40       CP 0x40
           2102  e0         RET po
           2103  fe20       CP 0x20
           2105  e1         POP HL
           2106  1d         DEC E
           2107  20e1       JR nz,0x20ea
           2109  1d         DEC E
           210A  20e1       JR nz,0x20ed
           210C  1d         DEC E
           210D  20e1       JR nz,0x20f0
           210F  1d         DEC E
           2110  40         LD B,B
           2111  e1         POP HL
           2112  1d         DEC E
           2113  20de       JR nz,0x20f3
           2115  8a         ADC A,D
           2116  21de8a     LD HL,0x8ade
           2119  21de3c     LD HL,0x3cde
           211C  21de6b     LD HL,0x6bde
           211F  216e20     LD HL,0x206e
           2122  e1         POP HL
           2123  ac         XOR H
           2124  e1         POP HL
*  L_2125: 2125  53         LD D,E
*          2126  e1         POP HL
*          2127  1d         DEC E
*          2128  e1         POP HL
*          2129  7d         LD A,L
*          212A  e1         POP HL
*          212B  40         LD B,B
*          212C  e0         RET po
           212D  fee1       CP 0xe1
           212F  40         LD B,B
           2130  e0         RET po
           2131  fee0       CP 0xe0
           2133  d66e       SUB 0x6e
           2135  00         NOP
           2136  e1         POP HL
           2137  1d         DEC E
           2138  c0         RET nz
           2139  0e00       LD C,0
           213B  00         NOP
           213C  8e         ADC A,(HL)
           213D  02         LD (BC),A
           213E  e0         RET po
           213F  d620       SUB 0x20
           2141  e0         RET po
           2142  d620       SUB 0x20
           2144  e0         RET po
*          2145  d620       SUB 0x20
*          2147  e0         RET po
           2148  d640       SUB 0x40
           214A  e0         RET po
           214B  d620       SUB 0x20
           214D  e0         RET po
           214E  d640       SUB 0x40
           2150  e0         RET po
           2151  d680       SUB 0x80
           2153  e0         RET po
           2154  d620       SUB 0x20
           2156  e0         RET po
           2157  d620       SUB 0x20
           2159  e0         RET po
           215A  d620       SUB 0x20
           215C  e0         RET po
           215D  d640       SUB 0x40
*          215F  e0         RET po
           2160  d620       SUB 0x20
           2162  e0         RET po
*          2163  d640       SUB 0x40
*          2165  e0         RET po
           2166  e2807e     JP po,0x7e80
           2169  3e21       LD A,0x21
           216B  e0         RET po
           216C  fe20       CP 0x20
           216E  e0         RET po
           216F  fe20       CP 0x20
           2171  e0         RET po
*  L_2172: 2172  fe20       CP 0x20
*          2174  e0         RET po
           2175  fe40       CP 0x40
           2177  e0         RET po
*          2178  fe20       CP 0x20
*          217A  e0         RET po
           217B  f0         RET p
           217C  20e0       JR nz,0x215e
           217E  f0         RET p
           217F  20e0       JR nz,0x2161
           2181  f0         RET p
           2182  20e0       JR nz,0x2164
*  L_2184: 2184  f0         RET p
           2185  40         LD B,B
           2186  e0         RET po
*  L_2187: 2187  f0         RET p
           2188  20ee       JR nz,0x2178
*  L_218A: 218A  e1         POP HL
*          218B  2e20       LD L,0x20
*          218D  e1         POP HL
*          218E  2e20       LD L,0x20
*          2190  e1         POP HL
*          2191  2e20       LD L,0x20
*          2193  e1         POP HL
*          2194  2e40       LD L,0x40
*          2196  e1         POP HL
*          2197  2e20       LD L,0x20
*          2199  e1         POP HL
*  L_219A: 219A  2e40       LD L,0x40
*          219C  e1         POP HL
*          219D  2e80       LD L,0x80
*          219F  e1         POP HL
*          21A0  1d         DEC E
*          21A1  20e1       JR nz,0x2184
*          21A3  1d         DEC E
*          21A4  20e1       JR nz,0x2187
*          21A6  1d         DEC E
*          21A7  20e1       JR nz,0x218a
*          21A9  1d         DEC E
*          21AA  40         LD B,B
*          21AB  e1         POP HL
*          21AC  1d         DEC E
*          21AD  20e0       JR nz,0x218f
*          21AF  fe40       CP 0x40
*          21B1  e1         POP HL
*          21B2  1d         DEC E
*          21B3  80         ADD A,B
*          21B4  ee4e       XOR 0x4e
*          21B6  02         LD (BC),A
*          21B7  00         NOP
*          21B8  0eea       LD C,0xea
*          21BA  20de       JR nz,0x219a
*          21BC  d621       SUB 0x21
*          21BE  ded6       SBC A,0xd6
*          21C0  21de37     LD HL,0x37de
*          21C3  22ded6     LD (0xd6de),HL
*          21C6  213eb0     LD HL,0xb03e
*  L_21C9: 21C9  20fe       JR nz,0x21c9
*          21CB  00         NOP
*          21CC  c0         RET nz
           21CD  fe00       CP 0
           21CF  60         LD H,B
           21D0  e1         POP HL
           21D1  ac         XOR H
           21D2  c0         RET nz
           21D3  0e00       LD C,0
           21D5  00         NOP
           21D6  3eb0       LD A,0xb0
           21D8  80         ADD A,B
           21D9  e0         RET po
           21DA  d6c0       SUB 0xc0
           21DC  e1         POP HL
           21DD  ac         XOR H
*          21DE  c0         RET nz
           21DF  de17       SBC A,0x17
           21E1  223eb0     LD (0xb03e),HL
           21E4  80         ADD A,B
           21E5  e1         POP HL
           21E6  1d         DEC E
           21E7  c0         RET nz
           21E8  e1         POP HL
           21E9  ac         XOR H
           21EA  c0         RET nz
           21EB  de17       SBC A,0x17
           21ED  223eb0     LD (0xb03e),HL
           21F0  80         ADD A,B
           21F1  e1         POP HL
           21F2  40         LD B,B
           21F3  c0         RET nz
           21F4  e1         POP HL
           21F5  40         LD B,B
           21F6  c0         RET nz
           21F7  3eb0       LD A,0xb0
           21F9  106e       DJNZ 0x2269
           21FB  20e1       JR nz,0x21de
           21FD  40         LD B,B
*          21FE  e1         POP HL
*          21FF  53         LD D,E
*          2200  e1         POP HL
*          2201  40         LD B,B
*          2202  e1         POP HL
*          2203  1d         DEC E
*          2204  e1         POP HL
*          2205  40         LD B,B
*          2206  e1         POP HL
*          2207  1d         DEC E
*          2208  e0         RET po
           2209  fee1       CP 0xe1
           220B  40         LD B,B
           220C  e0         RET po
           220D  fee0       CP 0xe0
           220F  f0         RET p
           2210  e0         RET po
           2211  fee0       CP 0xe0
           2213  f0         RET p
           2214  6e         LD L,(HL)
           2215  00         NOP
           2216  ee3e       XOR 0x3e
           2218  b0         OR B
           2219  106e       DJNZ 0x2289
           221B  20e1       JR nz,0x21fe
           221D  ac         XOR H
           221E  e1         POP HL
           221F  c5         PUSH BC
           2220  e1         POP HL
           2221  ac         XOR H
           2222  e1         POP HL
           2223  7d         LD A,L
           2224  e1         POP HL
           2225  ac         XOR H
           2226  e1         POP HL
           2227  7d         LD A,L
           2228  e1         POP HL
           2229  53         LD D,E
           222A  e1         POP HL
           222B  7d         LD A,L
           222C  e1         POP HL
           222D  53         LD D,E
           222E  e1         POP HL
           222F  40         LD B,B
           2230  e1         POP HL
           2231  53         LD D,E
           2232  e1         POP HL
           2233  40         LD B,B
           2234  6e         LD L,(HL)
           2235  00         NOP
           2236  ee3e       XOR 0x3e
           2238  b0         OR B
*          2239  80         ADD A,B
*          223A  e0         RET po
           223B  be         CP (HL)
           223C  c0         RET nz
           223D  e1         POP HL
           223E  7d         LD A,L
           223F  c0         RET nz
           2240  de50       SBC A,0x50
           2242  223eb0     LD (0xb03e),HL
           2245  80         ADD A,B
           2246  e0         RET po
           2247  fec0       CP 0xc0
           2249  e1         POP HL
           224A  7d         LD A,L
           224B  c0         RET nz
           224C  de50       SBC A,0x50
           224E  22ee3e     LD (0x3eee),HL
           2251  b0         OR B
           2252  106e       DJNZ 0x22c2
           2254  20e1       JR nz,0x2237
           2256  7d         LD A,L
           2257  e1         POP HL
*  L_2258: 2258  94         SUB H
*          2259  e1         POP HL
*          225A  7d         LD A,L
*          225B  e1         POP HL
*          225C  53         LD D,E
*          225D  e1         POP HL
*          225E  7d         LD A,L
*          225F  e1         POP HL
*          2260  53         LD D,E
*          2261  e1         POP HL
*          2262  2ee1       LD L,0xe1
*          2264  53         LD D,E
*          2265  e1         POP HL
*          2266  2ee1       LD L,0xe1
*          2268  1d         DEC E
*          2269  e1         POP HL
*          226A  2ee1       LD L,0xe1
*          226C  1d         DEC E
*          226D  6e         LD L,(HL)
*          226E  00         NOP
*          226F  ee4e       XOR 0x4e
*          2271  feff       CP 0xff
*          2273  0ebb       LD C,0xbb
*          2275  213e80     LD HL,0x803e
*          2278  20de       JR nz,0x2258
*          227A  af         XOR A
*          227B  22deaf     LD (0xafde),HL
*          227E  22dec4     LD (0xc4de),HL
*          2281  22dec4     LD (0xc4de),HL
*          2284  22deaf     LD (0xafde),HL
*          2287  22deaf     LD (0xafde),HL
*          228A  22dec4     LD (0xc4de),HL
*          228D  22dec4     LD (0xc4de),HL
*          2290  22ded1     LD (0xd1de),HL
*          2293  22ded1     LD (0xd1de),HL
*          2296  22deaf     LD (0xafde),HL
*          2299  22deaf     LD (0xafde),HL
*          229C  22dec4     LD (0xc4de),HL
*          229F  22dec4     LD (0xc4de),HL
*          22A2  22fe00     LD (0x00fe),HL
*          22A5  c0         RET nz
           22A6  fe00       CP 0
           22A8  60         LD H,B
           22A9  e6ae       AND 0xae
           22AB  c0         RET nz
           22AC  0e00       LD C,0
           22AE  00         NOP
           22AF  6e         LD L,(HL)
           22B0  60         LD H,B
           22B1  e3         EX (SP),HL
           22B2  57         LD D,A
           22B3  e3         EX (SP),HL
           22B4  8a         ADC A,D
           22B5  e3         EX (SP),HL
           22B6  f9         LD SP,HL
           22B7  e475e5     CALL po,0xe575
           22BA  01e54d     LD BC,0x4de5
           22BD  e5         PUSH HL
           22BE  f4e6ae     CALL p,0xaee6
           22C1  6e         LD L,(HL)
*          22C2  00         NOP
*          22C3  ee6e       XOR 0x6e
*          22C5  60         LD H,B
*          22C6  e5         PUSH HL
*          22C7  01e54d     LD BC,0x4de5
*          22CA  e5         PUSH HL
*          22CB  f4e6ae     CALL p,0xaee6
*          22CE  6e         LD L,(HL)
*          22CF  00         NOP
*          22D0  ee6e       XOR 0x6e
*          22D2  60         LD H,B
*          22D3  e3         EX (SP),HL
*          22D4  f9         LD SP,HL
*          22D5  e475e4     CALL po,0xe475
*          22D8  b9         CP C
*          22D9  e5         PUSH HL
*          22DA  4d         LD C,L
*          22DB  e3         EX (SP),HL
*          22DC  8a         ADC A,D
*          22DD  e3         EX (SP),HL
*          22DE  f9         LD SP,HL
*          22DF  e475e4     CALL po,0xe475
*          22E2  b9         CP C
*          22E3  6e         LD L,(HL)
*          22E4  00         NOP
*          22E5  ee00       XOR 0
*          22E7  00         NOP
*          22E8  00         NOP
*          22E9  00         NOP
*          22EA  00         NOP
*          22EB  00         NOP
*          22EC  00         NOP
*          22ED  00         NOP
*          22EE  00         NOP
*          22EF  00         NOP
*          22F0  00         NOP
*          22F1  00         NOP
*          22F2  00         NOP
*          22F3  00         NOP
*          22F4  00         NOP
*          22F5  00         NOP
*          22F6  00         NOP
*          22F7  00         NOP
*          22F8  00         NOP
*          22F9  00         NOP
*          22FA  00         NOP
*          22FB  00         NOP
*          22FC  00         NOP
*          22FD  00         NOP
*          22FE  00         NOP
*          22FF  00         NOP
*          2300  00         NOP
*          2301  00         NOP
*          2302  00         NOP
*          2303  00         NOP
*          2304  00         NOP
*          2305  00         NOP
*          2306  00         NOP
*          2307  00         NOP
*          2308  00         NOP
*          2309  00         NOP
*          230A  00         NOP
*          230B  00         NOP
*          230C  00         NOP
*          230D  00         NOP
*          230E  00         NOP
*          230F  00         NOP
*          2310  00         NOP
*          2311  00         NOP
*          2312  00         NOP
*          2313  00         NOP
*          2314  00         NOP
*          2315  00         NOP
*          2316  00         NOP
*          2317  00         NOP
*          2318  00         NOP
*          2319  00         NOP
*          231A  00         NOP
*          231B  00         NOP
*          231C  00         NOP
*          231D  00         NOP
*          231E  00         NOP
*          231F  00         NOP
*          2320  00         NOP
*          2321  00         NOP
*          2322  00         NOP
*          2323  00         NOP
*          2324  00         NOP
*          2325  00         NOP
*          2326  00         NOP
*          2327  00         NOP
*          2328  00         NOP
*          2329  00         NOP
*          232A  00         NOP
*          232B  00         NOP
*          232C  00         NOP
*          232D  00         NOP
*          232E  00         NOP
*          232F  00         NOP
*          2330  00         NOP
*          2331  00         NOP
*          2332  00         NOP
*          2333  00         NOP
*          2334  00         NOP
*          2335  00         NOP
*          2336  00         NOP
*          2337  00         NOP
*          2338  00         NOP
*          2339  00         NOP
*          233A  00         NOP
*          233B  00         NOP
*          233C  00         NOP
*          233D  00         NOP
*          233E  00         NOP
*          233F  00         NOP
*          2340  00         NOP
*          2341  00         NOP
*          2342  00         NOP
*          2343  00         NOP
*          2344  00         NOP
*          2345  00         NOP
*          2346  00         NOP
*          2347  00         NOP
*          2348  00         NOP
*          2349  00         NOP
*          234A  00         NOP
*          234B  00         NOP
*          234C  00         NOP
*          234D  00         NOP
*          234E  00         NOP
*          234F  00         NOP
*          2350  00         NOP
*          2351  00         NOP
*          2352  00         NOP
*          2353  00         NOP
*          2354  00         NOP
*          2355  00         NOP
*          2356  00         NOP
*          2357  00         NOP
*          2358  00         NOP
*          2359  00         NOP
*          235A  00         NOP
*          235B  00         NOP
*          235C  00         NOP
*          235D  00         NOP
*          235E  00         NOP
*          235F  00         NOP
*          2360  00         NOP
*          2361  00         NOP
*          2362  00         NOP
*          2363  00         NOP
*          2364  00         NOP
*          2365  00         NOP
*          2366  00         NOP
*          2367  00         NOP
*          2368  00         NOP
*          2369  00         NOP
*          236A  00         NOP
*          236B  00         NOP
*          236C  00         NOP
*          236D  00         NOP
*          236E  00         NOP
*          236F  00         NOP
*          2370  00         NOP
*          2371  00         NOP
*          2372  00         NOP
*          2373  00         NOP
*          2374  00         NOP
*          2375  00         NOP
*          2376  00         NOP
*          2377  00         NOP
*          2378  00         NOP
*          2379  00         NOP
*          237A  00         NOP
*          237B  00         NOP
*          237C  00         NOP
*          237D  00         NOP
*          237E  00         NOP
*          237F  00         NOP
*          2380  00         NOP
*          2381  00         NOP
*          2382  00         NOP
*          2383  00         NOP
*          2384  00         NOP
*          2385  00         NOP
*          2386  00         NOP
*          2387  00         NOP
*          2388  00         NOP
*          2389  00         NOP
*          238A  00         NOP
*          238B  00         NOP
*          238C  00         NOP
*          238D  00         NOP
*          238E  00         NOP
*          238F  00         NOP
*          2390  00         NOP
*          2391  00         NOP
*          2392  00         NOP
*          2393  00         NOP
*          2394  00         NOP
*          2395  00         NOP
*          2396  00         NOP
*          2397  00         NOP
*          2398  00         NOP
*          2399  00         NOP
*          239A  00         NOP
*          239B  00         NOP
*          239C  00         NOP
*          239D  00         NOP
*          239E  00         NOP
*          239F  00         NOP
*          23A0  00         NOP
*          23A1  00         NOP
*          23A2  00         NOP
*          23A3  00         NOP
*          23A4  00         NOP
*          23A5  00         NOP
*          23A6  00         NOP
*          23A7  00         NOP
*          23A8  00         NOP
*          23A9  00         NOP
*          23AA  00         NOP
*          23AB  00         NOP
*          23AC  00         NOP
*          23AD  00         NOP
*          23AE  00         NOP
*          23AF  00         NOP
*          23B0  00         NOP
*          23B1  00         NOP
*          23B2  00         NOP
*          23B3  00         NOP
*          23B4  00         NOP
*          23B5  00         NOP
*          23B6  00         NOP
*          23B7  00         NOP
*          23B8  00         NOP
*          23B9  00         NOP
*          23BA  00         NOP
*          23BB  00         NOP
*          23BC  00         NOP
*          23BD  00         NOP
*          23BE  00         NOP
*          23BF  00         NOP
*          23C0  00         NOP
*          23C1  00         NOP
*          23C2  00         NOP
*          23C3  00         NOP
*          23C4  00         NOP
*          23C5  00         NOP
*          23C6  00         NOP
*          23C7  00         NOP
*          23C8  00         NOP
*          23C9  00         NOP
*          23CA  00         NOP
*          23CB  00         NOP
*          23CC  00         NOP
*          23CD  00         NOP
*          23CE  00         NOP
*          23CF  00         NOP
*          23D0  00         NOP
*          23D1  00         NOP
*          23D2  00         NOP
*          23D3  00         NOP
*          23D4  00         NOP
*          23D5  00         NOP
*          23D6  00         NOP
*          23D7  00         NOP
*          23D8  00         NOP
*          23D9  00         NOP
*          23DA  00         NOP
*          23DB  00         NOP
*          23DC  00         NOP
*          23DD  00         NOP
*          23DE  00         NOP
*          23DF  00         NOP
*          23E0  00         NOP
*          23E1  00         NOP
*          23E2  00         NOP
*          23E3  00         NOP
*          23E4  00         NOP
*          23E5  00         NOP
*          23E6  00         NOP
*          23E7  00         NOP
*          23E8  00         NOP
*          23E9  00         NOP
*          23EA  00         NOP
*          23EB  00         NOP
*          23EC  00         NOP
*          23ED  00         NOP
*          23EE  00         NOP
*          23EF  00         NOP
*          23F0  00         NOP
*          23F1  00         NOP
*          23F2  00         NOP
*          23F3  00         NOP
*          23F4  00         NOP
*          23F5  00         NOP
*          23F6  00         NOP
*          23F7  00         NOP
*          23F8  00         NOP
*          23F9  00         NOP
*          23FA  00         NOP
*          23FB  00         NOP
*          23FC  00         NOP
*          23FD  00         NOP
*          23FE  00         NOP
*          23FF  00         NOP
*          2400  ff         RST 0x38
*          2401  ff         RST 0x38
*          2402  ff         RST 0x38
*          2403  ff         RST 0x38
*          2404  ff         RST 0x38
*          2405  ff         RST 0x38
*          2406  ff         RST 0x38
*          2407  ff         RST 0x38
*          2408  ff         RST 0x38
*          2409  ff         RST 0x38
*          240A  ff         RST 0x38
*          240B  ff         RST 0x38
*          240C  ff         RST 0x38
*          240D  ff         RST 0x38
*          240E  ff         RST 0x38
*          240F  ff         RST 0x38
*          2410  ff         RST 0x38
*          2411  ff         RST 0x38
*          2412  ff         RST 0x38
*          2413  ff         RST 0x38
*          2414  ff         RST 0x38
*          2415  ff         RST 0x38
*          2416  ff         RST 0x38
*          2417  ff         RST 0x38
*          2418  ff         RST 0x38
*          2419  ff         RST 0x38
*          241A  ff         RST 0x38
*          241B  ff         RST 0x38
*          241C  ff         RST 0x38
*          241D  ff         RST 0x38
*          241E  ff         RST 0x38
*          241F  ff         RST 0x38
*          2420  ff         RST 0x38
*          2421  ff         RST 0x38
*          2422  ff         RST 0x38
*          2423  ff         RST 0x38
*          2424  ff         RST 0x38
*          2425  ff         RST 0x38
*          2426  ff         RST 0x38
*          2427  ff         RST 0x38
*          2428  ff         RST 0x38
*          2429  ff         RST 0x38
*          242A  ff         RST 0x38
*          242B  ff         RST 0x38
*          242C  ff         RST 0x38
*          242D  ff         RST 0x38
*          242E  ff         RST 0x38
*          242F  ff         RST 0x38
*          2430  ff         RST 0x38
*          2431  ff         RST 0x38
*          2432  ff         RST 0x38
*          2433  ff         RST 0x38
*          2434  ff         RST 0x38
*          2435  ff         RST 0x38
*          2436  ff         RST 0x38
*          2437  ff         RST 0x38
*          2438  ff         RST 0x38
*          2439  ff         RST 0x38
*          243A  ff         RST 0x38
*          243B  ff         RST 0x38
*          243C  ff         RST 0x38
*          243D  ff         RST 0x38
*          243E  ff         RST 0x38
*          243F  ff         RST 0x38
*          2440  ff         RST 0x38
*          2441  ff         RST 0x38
*          2442  ff         RST 0x38
*          2443  ff         RST 0x38
*          2444  ff         RST 0x38
*          2445  ff         RST 0x38
*          2446  ff         RST 0x38
*          2447  ff         RST 0x38
*          2448  ff         RST 0x38
*          2449  ff         RST 0x38
*          244A  ff         RST 0x38
*          244B  ff         RST 0x38
*          244C  ff         RST 0x38
*          244D  ff         RST 0x38
*          244E  ff         RST 0x38
*          244F  ff         RST 0x38
*          2450  ff         RST 0x38
*          2451  ff         RST 0x38
*          2452  ff         RST 0x38
*          2453  ff         RST 0x38
*          2454  ff         RST 0x38
*          2455  ff         RST 0x38
*          2456  ff         RST 0x38
*          2457  ff         RST 0x38
*          2458  ff         RST 0x38
*          2459  ff         RST 0x38
*          245A  ff         RST 0x38
*          245B  ff         RST 0x38
*          245C  ff         RST 0x38
*          245D  ff         RST 0x38
*          245E  ff         RST 0x38
*          245F  ff         RST 0x38
*          2460  ff         RST 0x38
*          2461  ff         RST 0x38
*          2462  ff         RST 0x38
*          2463  ff         RST 0x38
*          2464  ff         RST 0x38
*          2465  ff         RST 0x38
*          2466  ff         RST 0x38
*          2467  ff         RST 0x38
*          2468  ff         RST 0x38
*          2469  ff         RST 0x38
*          246A  ff         RST 0x38
*          246B  ff         RST 0x38
*          246C  ff         RST 0x38
*          246D  ff         RST 0x38
*          246E  ff         RST 0x38
*          246F  ff         RST 0x38
*          2470  ff         RST 0x38
*          2471  ff         RST 0x38
*          2472  ff         RST 0x38
*          2473  ff         RST 0x38
*          2474  ff         RST 0x38
*          2475  ff         RST 0x38
*          2476  ff         RST 0x38
*          2477  ff         RST 0x38
*          2478  ff         RST 0x38
*          2479  ff         RST 0x38
*          247A  ff         RST 0x38
*          247B  ff         RST 0x38
*          247C  ff         RST 0x38
*          247D  ff         RST 0x38
*          247E  ff         RST 0x38
*          247F  ff         RST 0x38
*          2480  ff         RST 0x38
*          2481  ff         RST 0x38
*          2482  ff         RST 0x38
*          2483  ff         RST 0x38
*          2484  ff         RST 0x38
*          2485  ff         RST 0x38
*          2486  ff         RST 0x38
*          2487  ff         RST 0x38
*          2488  ff         RST 0x38
*          2489  ff         RST 0x38
*          248A  ff         RST 0x38
*          248B  ff         RST 0x38
*          248C  ff         RST 0x38
*          248D  ff         RST 0x38
*          248E  ff         RST 0x38
*          248F  ff         RST 0x38
*          2490  ff         RST 0x38
*          2491  ff         RST 0x38
*          2492  ff         RST 0x38
*          2493  ff         RST 0x38
*          2494  ff         RST 0x38
*          2495  ff         RST 0x38
*          2496  ff         RST 0x38
*          2497  ff         RST 0x38
*          2498  ff         RST 0x38
*          2499  ff         RST 0x38
*          249A  ff         RST 0x38
*          249B  ff         RST 0x38
*          249C  ff         RST 0x38
*          249D  ff         RST 0x38
*          249E  ff         RST 0x38
*          249F  ff         RST 0x38
*          24A0  ff         RST 0x38
*          24A1  ff         RST 0x38
*          24A2  ff         RST 0x38
*          24A3  ff         RST 0x38
*          24A4  ff         RST 0x38
*          24A5  ff         RST 0x38
*          24A6  ff         RST 0x38
*          24A7  ff         RST 0x38
*          24A8  ff         RST 0x38
*          24A9  ff         RST 0x38
*          24AA  ff         RST 0x38
*          24AB  ff         RST 0x38
*          24AC  ff         RST 0x38
*          24AD  ff         RST 0x38
*          24AE  ff         RST 0x38
*          24AF  ff         RST 0x38
*          24B0  ff         RST 0x38
*          24B1  ff         RST 0x38
*          24B2  ff         RST 0x38
*          24B3  ff         RST 0x38
*          24B4  ff         RST 0x38
*          24B5  ff         RST 0x38
*          24B6  ff         RST 0x38
*          24B7  ff         RST 0x38
*          24B8  ff         RST 0x38
*          24B9  ff         RST 0x38
*          24BA  ff         RST 0x38
*          24BB  ff         RST 0x38
*          24BC  ff         RST 0x38
*          24BD  ff         RST 0x38
*          24BE  ff         RST 0x38
*          24BF  ff         RST 0x38
*          24C0  ff         RST 0x38
*          24C1  ff         RST 0x38
*          24C2  ff         RST 0x38
*          24C3  ff         RST 0x38
*          24C4  ff         RST 0x38
*          24C5  ff         RST 0x38
*          24C6  ff         RST 0x38
*          24C7  ff         RST 0x38
*          24C8  ff         RST 0x38
*          24C9  ff         RST 0x38
*          24CA  ff         RST 0x38
*          24CB  ff         RST 0x38
*          24CC  ff         RST 0x38
*          24CD  ff         RST 0x38
*          24CE  ff         RST 0x38
*          24CF  ff         RST 0x38
*          24D0  ff         RST 0x38
*          24D1  ff         RST 0x38
*          24D2  ff         RST 0x38
*          24D3  ff         RST 0x38
*          24D4  ff         RST 0x38
*          24D5  ff         RST 0x38
*          24D6  ff         RST 0x38
*          24D7  ff         RST 0x38
*          24D8  ff         RST 0x38
*          24D9  ff         RST 0x38
*          24DA  ff         RST 0x38
*          24DB  ff         RST 0x38
*          24DC  ff         RST 0x38
*          24DD  ff         RST 0x38
*          24DE  ff         RST 0x38
*          24DF  ff         RST 0x38
*          24E0  ff         RST 0x38
*          24E1  ff         RST 0x38
*          24E2  ff         RST 0x38
*          24E3  ff         RST 0x38
*          24E4  ff         RST 0x38
*          24E5  ff         RST 0x38
*          24E6  ff         RST 0x38
*          24E7  ff         RST 0x38
*          24E8  ff         RST 0x38
*          24E9  ff         RST 0x38
*          24EA  ff         RST 0x38
*          24EB  ff         RST 0x38
*          24EC  ff         RST 0x38
*          24ED  ff         RST 0x38
*          24EE  ff         RST 0x38
*          24EF  ff         RST 0x38
*          24F0  ff         RST 0x38
*          24F1  ff         RST 0x38
*          24F2  ff         RST 0x38
*          24F3  ff         RST 0x38
*          24F4  ff         RST 0x38
*          24F5  ff         RST 0x38
*          24F6  ff         RST 0x38
*          24F7  ff         RST 0x38
*          24F8  ff         RST 0x38
*          24F9  ff         RST 0x38
*          24FA  ff         RST 0x38
*          24FB  ff         RST 0x38
*          24FC  ff         RST 0x38
*          24FD  ff         RST 0x38
*          24FE  ff         RST 0x38
*          24FF  ff         RST 0x38
*          2500  ff         RST 0x38
*          2501  ff         RST 0x38
*          2502  ff         RST 0x38
*          2503  ff         RST 0x38
*          2504  ff         RST 0x38
*          2505  ff         RST 0x38
*          2506  ff         RST 0x38
*          2507  ff         RST 0x38
*          2508  ff         RST 0x38
*          2509  ff         RST 0x38
*          250A  ff         RST 0x38
*          250B  ff         RST 0x38
*          250C  ff         RST 0x38
*          250D  ff         RST 0x38
*          250E  ff         RST 0x38
*          250F  ff         RST 0x38
*          2510  ff         RST 0x38
*          2511  ff         RST 0x38
*          2512  ff         RST 0x38
*          2513  ff         RST 0x38
*          2514  ff         RST 0x38
*          2515  ff         RST 0x38
*          2516  ff         RST 0x38
*          2517  ff         RST 0x38
*          2518  ff         RST 0x38
*          2519  ff         RST 0x38
*          251A  ff         RST 0x38
*          251B  ff         RST 0x38
*          251C  ff         RST 0x38
*          251D  ff         RST 0x38
*          251E  ff         RST 0x38
*          251F  ff         RST 0x38
*          2520  ff         RST 0x38
*          2521  ff         RST 0x38
*          2522  ff         RST 0x38
*          2523  ff         RST 0x38
*          2524  ff         RST 0x38
*          2525  ff         RST 0x38
*          2526  ff         RST 0x38
*          2527  ff         RST 0x38
*          2528  ff         RST 0x38
*          2529  ff         RST 0x38
*          252A  ff         RST 0x38
*          252B  ff         RST 0x38
*          252C  ff         RST 0x38
*          252D  ff         RST 0x38
*          252E  ff         RST 0x38
*          252F  ff         RST 0x38
*          2530  ff         RST 0x38
*          2531  ff         RST 0x38
*          2532  ff         RST 0x38
*          2533  ff         RST 0x38
*          2534  ff         RST 0x38
*          2535  ff         RST 0x38
*          2536  ff         RST 0x38
*          2537  ff         RST 0x38
*          2538  ff         RST 0x38
*          2539  ff         RST 0x38
*          253A  ff         RST 0x38
*          253B  ff         RST 0x38
*          253C  ff         RST 0x38
*          253D  ff         RST 0x38
*          253E  ff         RST 0x38
*          253F  ff         RST 0x38
*          2540  ff         RST 0x38
*          2541  ff         RST 0x38
*          2542  ff         RST 0x38
*          2543  ff         RST 0x38
*          2544  ff         RST 0x38
*          2545  ff         RST 0x38
*          2546  ff         RST 0x38
*          2547  ff         RST 0x38
*          2548  ff         RST 0x38
*          2549  ff         RST 0x38
*          254A  ff         RST 0x38
*          254B  ff         RST 0x38
*          254C  ff         RST 0x38
*          254D  ff         RST 0x38
*          254E  ff         RST 0x38
*          254F  ff         RST 0x38
*          2550  ff         RST 0x38
*          2551  ff         RST 0x38
*          2552  ff         RST 0x38
*          2553  ff         RST 0x38
*          2554  ff         RST 0x38
*          2555  ff         RST 0x38
*          2556  ff         RST 0x38
*          2557  ff         RST 0x38
*          2558  ff         RST 0x38
*          2559  ff         RST 0x38
*          255A  ff         RST 0x38
*          255B  ff         RST 0x38
*          255C  ff         RST 0x38
*          255D  ff         RST 0x38
*          255E  ff         RST 0x38
*          255F  ff         RST 0x38
*          2560  ff         RST 0x38
*          2561  ff         RST 0x38
*          2562  ff         RST 0x38
*          2563  ff         RST 0x38
*          2564  ff         RST 0x38
*          2565  ff         RST 0x38
*          2566  ff         RST 0x38
*          2567  ff         RST 0x38
*          2568  ff         RST 0x38
*          2569  ff         RST 0x38
*          256A  ff         RST 0x38
*          256B  ff         RST 0x38
*          256C  ff         RST 0x38
*          256D  ff         RST 0x38
*          256E  ff         RST 0x38
*          256F  ff         RST 0x38
*          2570  ff         RST 0x38
*          2571  ff         RST 0x38
*          2572  ff         RST 0x38
*          2573  ff         RST 0x38
*          2574  ff         RST 0x38
*          2575  ff         RST 0x38
*          2576  ff         RST 0x38
*          2577  ff         RST 0x38
*          2578  ff         RST 0x38
*          2579  ff         RST 0x38
*          257A  ff         RST 0x38
*          257B  ff         RST 0x38
*          257C  ff         RST 0x38
*          257D  ff         RST 0x38
*          257E  ff         RST 0x38
*          257F  ff         RST 0x38
*          2580  ff         RST 0x38
*          2581  ff         RST 0x38
*          2582  ff         RST 0x38
*          2583  ff         RST 0x38
*          2584  ff         RST 0x38
*          2585  ff         RST 0x38
*          2586  ff         RST 0x38
*          2587  ff         RST 0x38
*          2588  ff         RST 0x38
*          2589  ff         RST 0x38
*          258A  ff         RST 0x38
*          258B  ff         RST 0x38
*          258C  ff         RST 0x38
*          258D  ff         RST 0x38
*          258E  ff         RST 0x38
*          258F  ff         RST 0x38
*          2590  ff         RST 0x38
*          2591  ff         RST 0x38
*          2592  ff         RST 0x38
*          2593  ff         RST 0x38
*          2594  ff         RST 0x38
*          2595  ff         RST 0x38
*          2596  ff         RST 0x38
*          2597  ff         RST 0x38
*          2598  ff         RST 0x38
*          2599  ff         RST 0x38
*          259A  ff         RST 0x38
*          259B  ff         RST 0x38
*          259C  ff         RST 0x38
*          259D  ff         RST 0x38
*          259E  ff         RST 0x38
*          259F  ff         RST 0x38
*          25A0  ff         RST 0x38
*          25A1  ff         RST 0x38
*          25A2  ff         RST 0x38
*          25A3  ff         RST 0x38
*          25A4  ff         RST 0x38
*          25A5  ff         RST 0x38
*          25A6  ff         RST 0x38
*          25A7  ff         RST 0x38
*          25A8  ff         RST 0x38
*          25A9  ff         RST 0x38
*          25AA  ff         RST 0x38
*          25AB  ff         RST 0x38
*          25AC  ff         RST 0x38
*          25AD  ff         RST 0x38
*          25AE  ff         RST 0x38
*          25AF  ff         RST 0x38
*          25B0  ff         RST 0x38
*          25B1  ff         RST 0x38
*          25B2  ff         RST 0x38
*          25B3  ff         RST 0x38
*          25B4  ff         RST 0x38
*          25B5  ff         RST 0x38
*          25B6  ff         RST 0x38
*          25B7  ff         RST 0x38
*          25B8  ff         RST 0x38
*          25B9  ff         RST 0x38
*          25BA  ff         RST 0x38
*          25BB  ff         RST 0x38
*          25BC  ff         RST 0x38
*          25BD  ff         RST 0x38
*          25BE  ff         RST 0x38
*          25BF  ff         RST 0x38
*          25C0  ff         RST 0x38
*          25C1  ff         RST 0x38
*          25C2  ff         RST 0x38
*          25C3  ff         RST 0x38
*          25C4  ff         RST 0x38
*          25C5  ff         RST 0x38
*          25C6  ff         RST 0x38
*          25C7  ff         RST 0x38
*          25C8  ff         RST 0x38
*          25C9  ff         RST 0x38
*          25CA  ff         RST 0x38
*          25CB  ff         RST 0x38
*          25CC  ff         RST 0x38
*          25CD  ff         RST 0x38
*          25CE  ff         RST 0x38
*          25CF  ff         RST 0x38
*          25D0  ff         RST 0x38
*          25D1  ff         RST 0x38
*          25D2  ff         RST 0x38
*          25D3  ff         RST 0x38
*          25D4  ff         RST 0x38
*          25D5  ff         RST 0x38
*          25D6  ff         RST 0x38
*          25D7  ff         RST 0x38
*          25D8  ff         RST 0x38
*          25D9  ff         RST 0x38
*          25DA  ff         RST 0x38
*          25DB  ff         RST 0x38
*          25DC  ff         RST 0x38
*          25DD  ff         RST 0x38
*          25DE  ff         RST 0x38
*          25DF  ff         RST 0x38
*          25E0  ff         RST 0x38
*          25E1  ff         RST 0x38
*          25E2  ff         RST 0x38
*          25E3  ff         RST 0x38
*          25E4  ff         RST 0x38
*          25E5  ff         RST 0x38
*          25E6  ff         RST 0x38
*          25E7  ff         RST 0x38
*          25E8  ff         RST 0x38
*          25E9  ff         RST 0x38
*          25EA  ff         RST 0x38
*          25EB  ff         RST 0x38
*          25EC  ff         RST 0x38
*          25ED  ff         RST 0x38
*          25EE  ff         RST 0x38
*          25EF  ff         RST 0x38
*          25F0  ff         RST 0x38
*          25F1  ff         RST 0x38
*          25F2  ff         RST 0x38
*          25F3  ff         RST 0x38
*          25F4  ff         RST 0x38
*          25F5  ff         RST 0x38
*          25F6  ff         RST 0x38
*          25F7  ff         RST 0x38
*          25F8  ff         RST 0x38
*          25F9  ff         RST 0x38
*          25FA  ff         RST 0x38
*          25FB  ff         RST 0x38
*          25FC  ff         RST 0x38
*          25FD  ff         RST 0x38
*          25FE  ff         RST 0x38
*          25FF  ff         RST 0x38
*          2600  ff         RST 0x38
*          2601  ff         RST 0x38
*          2602  ff         RST 0x38
*          2603  ff         RST 0x38
*          2604  ff         RST 0x38
*          2605  ff         RST 0x38
*          2606  ff         RST 0x38
*          2607  ff         RST 0x38
*          2608  ff         RST 0x38
*          2609  ff         RST 0x38
*          260A  ff         RST 0x38
*          260B  ff         RST 0x38
*          260C  ff         RST 0x38
*          260D  ff         RST 0x38
*          260E  ff         RST 0x38
*          260F  ff         RST 0x38
*          2610  ff         RST 0x38
*          2611  ff         RST 0x38
*          2612  ff         RST 0x38
*          2613  ff         RST 0x38
*          2614  ff         RST 0x38
*          2615  ff         RST 0x38
*          2616  ff         RST 0x38
*          2617  ff         RST 0x38
*          2618  ff         RST 0x38
*          2619  ff         RST 0x38
*          261A  ff         RST 0x38
*          261B  ff         RST 0x38
*          261C  ff         RST 0x38
*          261D  ff         RST 0x38
*          261E  ff         RST 0x38
*          261F  ff         RST 0x38
*          2620  ff         RST 0x38
*          2621  ff         RST 0x38
*          2622  ff         RST 0x38
*          2623  ff         RST 0x38
*          2624  ff         RST 0x38
*          2625  ff         RST 0x38
*          2626  ff         RST 0x38
*          2627  ff         RST 0x38
*          2628  ff         RST 0x38
*          2629  ff         RST 0x38
*          262A  ff         RST 0x38
*          262B  ff         RST 0x38
*          262C  ff         RST 0x38
*          262D  ff         RST 0x38
*          262E  ff         RST 0x38
*          262F  ff         RST 0x38
*          2630  ff         RST 0x38
*          2631  ff         RST 0x38
*          2632  ff         RST 0x38
*          2633  ff         RST 0x38
*          2634  ff         RST 0x38
*          2635  ff         RST 0x38
*          2636  ff         RST 0x38
*          2637  ff         RST 0x38
*          2638  ff         RST 0x38
*          2639  ff         RST 0x38
*          263A  ff         RST 0x38
*          263B  ff         RST 0x38
*          263C  ff         RST 0x38
*          263D  ff         RST 0x38
*          263E  ff         RST 0x38
*          263F  ff         RST 0x38
*          2640  ff         RST 0x38
*          2641  ff         RST 0x38
*          2642  ff         RST 0x38
*          2643  ff         RST 0x38
*          2644  ff         RST 0x38
*          2645  ff         RST 0x38
*          2646  ff         RST 0x38
*          2647  ff         RST 0x38
*          2648  ff         RST 0x38
*          2649  ff         RST 0x38
*          264A  ff         RST 0x38
*          264B  ff         RST 0x38
*          264C  ff         RST 0x38
*          264D  ff         RST 0x38
*          264E  ff         RST 0x38
*          264F  ff         RST 0x38
*          2650  ff         RST 0x38
*          2651  ff         RST 0x38
*          2652  ff         RST 0x38
*          2653  ff         RST 0x38
*          2654  ff         RST 0x38
*          2655  ff         RST 0x38
*          2656  ff         RST 0x38
*          2657  ff         RST 0x38
*          2658  ff         RST 0x38
*          2659  ff         RST 0x38
*          265A  ff         RST 0x38
*          265B  ff         RST 0x38
*          265C  ff         RST 0x38
*          265D  ff         RST 0x38
*          265E  ff         RST 0x38
*          265F  ff         RST 0x38
*          2660  ff         RST 0x38
*          2661  ff         RST 0x38
*          2662  ff         RST 0x38
*          2663  ff         RST 0x38
*          2664  ff         RST 0x38
*          2665  ff         RST 0x38
*          2666  ff         RST 0x38
*          2667  ff         RST 0x38
*          2668  ff         RST 0x38
*          2669  ff         RST 0x38
*          266A  ff         RST 0x38
*          266B  ff         RST 0x38
*          266C  ff         RST 0x38
*          266D  ff         RST 0x38
*          266E  ff         RST 0x38
*          266F  ff         RST 0x38
*          2670  ff         RST 0x38
*          2671  ff         RST 0x38
*          2672  ff         RST 0x38
*          2673  ff         RST 0x38
*          2674  ff         RST 0x38
*          2675  ff         RST 0x38
*          2676  ff         RST 0x38
*          2677  ff         RST 0x38
*          2678  ff         RST 0x38
*          2679  ff         RST 0x38
*          267A  ff         RST 0x38
*          267B  ff         RST 0x38
*          267C  ff         RST 0x38
*          267D  ff         RST 0x38
*          267E  ff         RST 0x38
*          267F  ff         RST 0x38
*          2680  ff         RST 0x38
*          2681  ff         RST 0x38
*          2682  ff         RST 0x38
*          2683  ff         RST 0x38
*          2684  ff         RST 0x38
*          2685  ff         RST 0x38
*          2686  ff         RST 0x38
*          2687  ff         RST 0x38
*          2688  ff         RST 0x38
*          2689  ff         RST 0x38
*          268A  ff         RST 0x38
*          268B  ff         RST 0x38
*          268C  ff         RST 0x38
*          268D  ff         RST 0x38
*          268E  ff         RST 0x38
*          268F  ff         RST 0x38
*          2690  ff         RST 0x38
*          2691  ff         RST 0x38
*          2692  ff         RST 0x38
*          2693  ff         RST 0x38
*          2694  ff         RST 0x38
*          2695  ff         RST 0x38
*          2696  ff         RST 0x38
*          2697  ff         RST 0x38
*          2698  ff         RST 0x38
*          2699  ff         RST 0x38
*          269A  ff         RST 0x38
*          269B  ff         RST 0x38
*          269C  ff         RST 0x38
*          269D  ff         RST 0x38
*          269E  ff         RST 0x38
*          269F  ff         RST 0x38
*          26A0  ff         RST 0x38
*          26A1  ff         RST 0x38
*          26A2  ff         RST 0x38
*          26A3  ff         RST 0x38
*          26A4  ff         RST 0x38
*          26A5  ff         RST 0x38
*          26A6  ff         RST 0x38
*          26A7  ff         RST 0x38
*          26A8  ff         RST 0x38
*          26A9  ff         RST 0x38
*          26AA  ff         RST 0x38
*          26AB  ff         RST 0x38
*          26AC  ff         RST 0x38
*          26AD  ff         RST 0x38
*          26AE  ff         RST 0x38
*          26AF  ff         RST 0x38
*          26B0  ff         RST 0x38
*          26B1  ff         RST 0x38
*          26B2  ff         RST 0x38
*          26B3  ff         RST 0x38
*          26B4  ff         RST 0x38
*          26B5  ff         RST 0x38
*          26B6  ff         RST 0x38
*          26B7  ff         RST 0x38
*          26B8  ff         RST 0x38
*          26B9  ff         RST 0x38
*          26BA  ff         RST 0x38
*          26BB  ff         RST 0x38
*          26BC  ff         RST 0x38
*          26BD  ff         RST 0x38
*          26BE  ff         RST 0x38
*          26BF  ff         RST 0x38
*          26C0  ff         RST 0x38
*          26C1  ff         RST 0x38
*          26C2  ff         RST 0x38
*          26C3  ff         RST 0x38
*          26C4  ff         RST 0x38
*          26C5  ff         RST 0x38
*          26C6  ff         RST 0x38
*          26C7  ff         RST 0x38
*          26C8  ff         RST 0x38
*          26C9  ff         RST 0x38
*          26CA  ff         RST 0x38
*          26CB  ff         RST 0x38
*          26CC  ff         RST 0x38
*          26CD  ff         RST 0x38
*          26CE  ff         RST 0x38
*          26CF  ff         RST 0x38
*          26D0  ff         RST 0x38
*          26D1  ff         RST 0x38
*          26D2  ff         RST 0x38
*          26D3  ff         RST 0x38
*          26D4  ff         RST 0x38
*          26D5  ff         RST 0x38
*          26D6  ff         RST 0x38
*          26D7  ff         RST 0x38
*          26D8  ff         RST 0x38
*          26D9  ff         RST 0x38
*          26DA  ff         RST 0x38
*          26DB  ff         RST 0x38
*          26DC  ff         RST 0x38
*          26DD  ff         RST 0x38
*          26DE  ff         RST 0x38
*          26DF  ff         RST 0x38
*          26E0  ff         RST 0x38
*          26E1  ff         RST 0x38
*          26E2  ff         RST 0x38
*          26E3  ff         RST 0x38
*          26E4  ff         RST 0x38
*          26E5  ff         RST 0x38
*          26E6  ff         RST 0x38
*          26E7  ff         RST 0x38
*          26E8  ff         RST 0x38
*          26E9  ff         RST 0x38
*          26EA  ff         RST 0x38
*          26EB  ff         RST 0x38
*          26EC  ff         RST 0x38
*          26ED  ff         RST 0x38
*          26EE  ff         RST 0x38
*          26EF  ff         RST 0x38
*          26F0  ff         RST 0x38
*          26F1  ff         RST 0x38
*          26F2  ff         RST 0x38
*          26F3  ff         RST 0x38
*          26F4  ff         RST 0x38
*          26F5  ff         RST 0x38
*          26F6  ff         RST 0x38
*          26F7  ff         RST 0x38
*          26F8  ff         RST 0x38
*          26F9  ff         RST 0x38
*          26FA  ff         RST 0x38
*          26FB  ff         RST 0x38
*          26FC  ff         RST 0x38
*          26FD  ff         RST 0x38
*          26FE  ff         RST 0x38
*          26FF  ff         RST 0x38
*          2700  ff         RST 0x38
*          2701  ff         RST 0x38
*          2702  ff         RST 0x38
*          2703  ff         RST 0x38
*          2704  ff         RST 0x38
*          2705  ff         RST 0x38
*          2706  ff         RST 0x38
*          2707  ff         RST 0x38
*          2708  ff         RST 0x38
*          2709  ff         RST 0x38
*          270A  ff         RST 0x38
*          270B  ff         RST 0x38
*          270C  ff         RST 0x38
*          270D  ff         RST 0x38
*          270E  ff         RST 0x38
*          270F  ff         RST 0x38
*          2710  ff         RST 0x38
*          2711  ff         RST 0x38
*          2712  ff         RST 0x38
*          2713  ff         RST 0x38
*          2714  ff         RST 0x38
*          2715  ff         RST 0x38
*          2716  ff         RST 0x38
*          2717  ff         RST 0x38
*          2718  ff         RST 0x38
*          2719  ff         RST 0x38
*          271A  ff         RST 0x38
*          271B  ff         RST 0x38
*          271C  ff         RST 0x38
*          271D  ff         RST 0x38
*          271E  ff         RST 0x38
*          271F  ff         RST 0x38
*          2720  ff         RST 0x38
*          2721  ff         RST 0x38
*          2722  ff         RST 0x38
*          2723  ff         RST 0x38
*          2724  ff         RST 0x38
*          2725  ff         RST 0x38
*          2726  ff         RST 0x38
*          2727  ff         RST 0x38
*          2728  ff         RST 0x38
*          2729  ff         RST 0x38
*          272A  ff         RST 0x38
*          272B  ff         RST 0x38
*          272C  ff         RST 0x38
*          272D  ff         RST 0x38
*          272E  ff         RST 0x38
*          272F  ff         RST 0x38
*          2730  ff         RST 0x38
*          2731  ff         RST 0x38
*          2732  ff         RST 0x38
*          2733  ff         RST 0x38
*          2734  ff         RST 0x38
*          2735  ff         RST 0x38
*          2736  ff         RST 0x38
*          2737  ff         RST 0x38
*          2738  ff         RST 0x38
*          2739  ff         RST 0x38
*          273A  ff         RST 0x38
*          273B  ff         RST 0x38
*          273C  ff         RST 0x38
*          273D  ff         RST 0x38
*          273E  ff         RST 0x38
*          273F  ff         RST 0x38
*          2740  ff         RST 0x38
*          2741  ff         RST 0x38
*          2742  ff         RST 0x38
*          2743  ff         RST 0x38
*          2744  ff         RST 0x38
*          2745  ff         RST 0x38
*          2746  ff         RST 0x38
*          2747  ff         RST 0x38
*          2748  ff         RST 0x38
*          2749  ff         RST 0x38
*          274A  ff         RST 0x38
*          274B  ff         RST 0x38
*          274C  ff         RST 0x38
*          274D  ff         RST 0x38
*          274E  ff         RST 0x38
*          274F  ff         RST 0x38
*          2750  ff         RST 0x38
*          2751  ff         RST 0x38
*          2752  ff         RST 0x38
*          2753  ff         RST 0x38
*          2754  ff         RST 0x38
*          2755  ff         RST 0x38
*          2756  ff         RST 0x38
*          2757  ff         RST 0x38
*          2758  ff         RST 0x38
*          2759  ff         RST 0x38
*          275A  ff         RST 0x38
*          275B  ff         RST 0x38
*          275C  ff         RST 0x38
*          275D  ff         RST 0x38
*          275E  ff         RST 0x38
*          275F  ff         RST 0x38
*          2760  ff         RST 0x38
*          2761  ff         RST 0x38
*          2762  ff         RST 0x38
*          2763  ff         RST 0x38
*          2764  ff         RST 0x38
*          2765  ff         RST 0x38
*          2766  ff         RST 0x38
*          2767  ff         RST 0x38
*          2768  ff         RST 0x38
*          2769  ff         RST 0x38
*          276A  ff         RST 0x38
*          276B  ff         RST 0x38
*          276C  ff         RST 0x38
*          276D  ff         RST 0x38
*          276E  ff         RST 0x38
*          276F  ff         RST 0x38
*          2770  ff         RST 0x38
*          2771  ff         RST 0x38
*          2772  ff         RST 0x38
*          2773  ff         RST 0x38
*          2774  ff         RST 0x38
*          2775  ff         RST 0x38
*          2776  ff         RST 0x38
*          2777  ff         RST 0x38
*          2778  ff         RST 0x38
*          2779  ff         RST 0x38
*          277A  ff         RST 0x38
*          277B  ff         RST 0x38
*          277C  ff         RST 0x38
*          277D  ff         RST 0x38
*          277E  ff         RST 0x38
*          277F  ff         RST 0x38
*          2780  ff         RST 0x38
*          2781  ff         RST 0x38
*          2782  ff         RST 0x38
*          2783  ff         RST 0x38
*          2784  ff         RST 0x38
*          2785  ff         RST 0x38
*          2786  ff         RST 0x38
*          2787  ff         RST 0x38
*          2788  ff         RST 0x38
*          2789  ff         RST 0x38
*          278A  ff         RST 0x38
*          278B  ff         RST 0x38
*          278C  ff         RST 0x38
*          278D  ff         RST 0x38
*          278E  ff         RST 0x38
*          278F  ff         RST 0x38
*          2790  ff         RST 0x38
*          2791  ff         RST 0x38
*          2792  ff         RST 0x38
*          2793  ff         RST 0x38
*          2794  ff         RST 0x38
*          2795  ff         RST 0x38
*          2796  ff         RST 0x38
*          2797  ff         RST 0x38
*          2798  ff         RST 0x38
*          2799  ff         RST 0x38
*          279A  ff         RST 0x38
*          279B  ff         RST 0x38
*          279C  ff         RST 0x38
*          279D  ff         RST 0x38
*          279E  ff         RST 0x38
*          279F  ff         RST 0x38
*          27A0  ff         RST 0x38
*          27A1  ff         RST 0x38
*          27A2  ff         RST 0x38
*          27A3  ff         RST 0x38
*          27A4  ff         RST 0x38
*          27A5  ff         RST 0x38
*          27A6  ff         RST 0x38
*          27A7  ff         RST 0x38
*          27A8  ff         RST 0x38
*          27A9  ff         RST 0x38
*          27AA  ff         RST 0x38
*          27AB  ff         RST 0x38
*          27AC  ff         RST 0x38
*          27AD  ff         RST 0x38
*          27AE  ff         RST 0x38
*          27AF  ff         RST 0x38
*          27B0  ff         RST 0x38
*          27B1  ff         RST 0x38
*          27B2  ff         RST 0x38
*          27B3  ff         RST 0x38
*          27B4  ff         RST 0x38
*          27B5  ff         RST 0x38
*          27B6  ff         RST 0x38
*          27B7  ff         RST 0x38
*          27B8  ff         RST 0x38
*          27B9  ff         RST 0x38
*          27BA  ff         RST 0x38
*          27BB  ff         RST 0x38
*          27BC  ff         RST 0x38
*          27BD  ff         RST 0x38
*          27BE  ff         RST 0x38
*          27BF  ff         RST 0x38
*          27C0  ff         RST 0x38
*          27C1  ff         RST 0x38
*          27C2  ff         RST 0x38
*          27C3  ff         RST 0x38
*          27C4  ff         RST 0x38
*          27C5  ff         RST 0x38
*          27C6  ff         RST 0x38
*          27C7  ff         RST 0x38
*          27C8  ff         RST 0x38
*          27C9  ff         RST 0x38
*          27CA  ff         RST 0x38
*          27CB  ff         RST 0x38
*          27CC  ff         RST 0x38
*          27CD  ff         RST 0x38
*          27CE  ff         RST 0x38
*          27CF  ff         RST 0x38
*          27D0  ff         RST 0x38
*          27D1  ff         RST 0x38
*          27D2  ff         RST 0x38
*          27D3  ff         RST 0x38
*          27D4  ff         RST 0x38
*          27D5  ff         RST 0x38
*          27D6  ff         RST 0x38
*          27D7  ff         RST 0x38
*          27D8  ff         RST 0x38
*          27D9  ff         RST 0x38
*          27DA  ff         RST 0x38
*          27DB  ff         RST 0x38
*          27DC  ff         RST 0x38
*          27DD  ff         RST 0x38
*          27DE  ff         RST 0x38
*          27DF  ff         RST 0x38
*          27E0  ff         RST 0x38
*          27E1  ff         RST 0x38
*          27E2  ff         RST 0x38
*          27E3  ff         RST 0x38
*          27E4  ff         RST 0x38
*          27E5  ff         RST 0x38
*          27E6  ff         RST 0x38
*          27E7  ff         RST 0x38
*          27E8  ff         RST 0x38
*          27E9  ff         RST 0x38
*          27EA  ff         RST 0x38
*          27EB  ff         RST 0x38
*          27EC  ff         RST 0x38
*          27ED  ff         RST 0x38
*          27EE  ff         RST 0x38
*          27EF  ff         RST 0x38
*          27F0  ff         RST 0x38
*          27F1  ff         RST 0x38
*          27F2  ff         RST 0x38
*          27F3  ff         RST 0x38
*          27F4  ff         RST 0x38
*          27F5  ff         RST 0x38
*          27F6  ff         RST 0x38
*          27F7  ff         RST 0x38
*          27F8  ff         RST 0x38
*          27F9  ff         RST 0x38
*          27FA  ff         RST 0x38
*          27FB  ff         RST 0x38
*          27FC  ff         RST 0x38
*          27FD  ff         RST 0x38
*          27FE  ff         RST 0x38
*          27FF  ff         RST 0x38
*          2800  ff         RST 0x38
*          2801  ff         RST 0x38
*          2802  ff         RST 0x38
*          2803  ff         RST 0x38
*          2804  ff         RST 0x38
*          2805  ff         RST 0x38
*          2806  ff         RST 0x38
*          2807  ff         RST 0x38
*          2808  ff         RST 0x38
*          2809  ff         RST 0x38
*          280A  ff         RST 0x38
*          280B  ff         RST 0x38
*          280C  ff         RST 0x38
*          280D  ff         RST 0x38
*          280E  ff         RST 0x38
*          280F  ff         RST 0x38
*          2810  ff         RST 0x38
*          2811  ff         RST 0x38
*          2812  ff         RST 0x38
*          2813  ff         RST 0x38
*          2814  ff         RST 0x38
*          2815  ff         RST 0x38
*          2816  ff         RST 0x38
*          2817  ff         RST 0x38
*          2818  ff         RST 0x38
*          2819  ff         RST 0x38
*          281A  ff         RST 0x38
*          281B  ff         RST 0x38
*          281C  ff         RST 0x38
*          281D  ff         RST 0x38
*          281E  ff         RST 0x38
*          281F  ff         RST 0x38
*          2820  ff         RST 0x38
*          2821  ff         RST 0x38
*          2822  ff         RST 0x38
*          2823  ff         RST 0x38
*          2824  ff         RST 0x38
*          2825  ff         RST 0x38
*          2826  ff         RST 0x38
*          2827  ff         RST 0x38
*          2828  ff         RST 0x38
*          2829  ff         RST 0x38
*          282A  ff         RST 0x38
*          282B  ff         RST 0x38
*          282C  ff         RST 0x38
*          282D  ff         RST 0x38
*          282E  ff         RST 0x38
*          282F  ff         RST 0x38
*          2830  ff         RST 0x38
*          2831  ff         RST 0x38
*          2832  ff         RST 0x38
*          2833  ff         RST 0x38
*          2834  ff         RST 0x38
*          2835  ff         RST 0x38
*          2836  ff         RST 0x38
*          2837  ff         RST 0x38
*          2838  ff         RST 0x38
*          2839  ff         RST 0x38
*          283A  ff         RST 0x38
*          283B  ff         RST 0x38
*          283C  ff         RST 0x38
*          283D  ff         RST 0x38
*          283E  ff         RST 0x38
*          283F  ff         RST 0x38
*          2840  ff         RST 0x38
*          2841  ff         RST 0x38
*          2842  ff         RST 0x38
*          2843  ff         RST 0x38
*          2844  ff         RST 0x38
*          2845  ff         RST 0x38
*          2846  ff         RST 0x38
*          2847  ff         RST 0x38
*          2848  ff         RST 0x38
*          2849  ff         RST 0x38
*          284A  ff         RST 0x38
*          284B  ff         RST 0x38
*          284C  ff         RST 0x38
*          284D  ff         RST 0x38
*          284E  ff         RST 0x38
*          284F  ff         RST 0x38
*          2850  ff         RST 0x38
*          2851  ff         RST 0x38
*          2852  ff         RST 0x38
*          2853  ff         RST 0x38
*          2854  ff         RST 0x38
*          2855  ff         RST 0x38
*          2856  ff         RST 0x38
*          2857  ff         RST 0x38
*          2858  ff         RST 0x38
*          2859  ff         RST 0x38
*          285A  ff         RST 0x38
*          285B  ff         RST 0x38
*          285C  ff         RST 0x38
*          285D  ff         RST 0x38
*          285E  ff         RST 0x38
*          285F  ff         RST 0x38
*          2860  ff         RST 0x38
*          2861  ff         RST 0x38
*          2862  ff         RST 0x38
*          2863  ff         RST 0x38
*          2864  ff         RST 0x38
*          2865  ff         RST 0x38
*          2866  ff         RST 0x38
*          2867  ff         RST 0x38
*          2868  ff         RST 0x38
*          2869  ff         RST 0x38
*          286A  ff         RST 0x38
*          286B  ff         RST 0x38
*          286C  ff         RST 0x38
*          286D  ff         RST 0x38
*          286E  ff         RST 0x38
*          286F  ff         RST 0x38
*          2870  ff         RST 0x38
*          2871  ff         RST 0x38
*          2872  ff         RST 0x38
*          2873  ff         RST 0x38
*          2874  ff         RST 0x38
*          2875  ff         RST 0x38
*          2876  ff         RST 0x38
*          2877  ff         RST 0x38
*          2878  ff         RST 0x38
*          2879  ff         RST 0x38
*          287A  ff         RST 0x38
*          287B  ff         RST 0x38
*          287C  ff         RST 0x38
*          287D  ff         RST 0x38
*          287E  ff         RST 0x38
*          287F  ff         RST 0x38
*          2880  ff         RST 0x38
*          2881  ff         RST 0x38
*          2882  ff         RST 0x38
*          2883  ff         RST 0x38
*          2884  ff         RST 0x38
*          2885  ff         RST 0x38
*          2886  ff         RST 0x38
*          2887  ff         RST 0x38
*          2888  ff         RST 0x38
*          2889  ff         RST 0x38
*          288A  ff         RST 0x38
*          288B  ff         RST 0x38
*          288C  ff         RST 0x38
*          288D  ff         RST 0x38
*          288E  ff         RST 0x38
*          288F  ff         RST 0x38
*          2890  ff         RST 0x38
*          2891  ff         RST 0x38
*          2892  ff         RST 0x38
*          2893  ff         RST 0x38
*          2894  ff         RST 0x38
*          2895  ff         RST 0x38
*          2896  ff         RST 0x38
*          2897  ff         RST 0x38
*          2898  ff         RST 0x38
*          2899  ff         RST 0x38
*          289A  ff         RST 0x38
*          289B  ff         RST 0x38
*          289C  ff         RST 0x38
*          289D  ff         RST 0x38
*          289E  ff         RST 0x38
*          289F  ff         RST 0x38
*          28A0  ff         RST 0x38
*          28A1  ff         RST 0x38
*          28A2  ff         RST 0x38
*          28A3  ff         RST 0x38
*          28A4  ff         RST 0x38
*          28A5  ff         RST 0x38
*          28A6  ff         RST 0x38
*          28A7  ff         RST 0x38
*          28A8  ff         RST 0x38
*          28A9  ff         RST 0x38
*          28AA  ff         RST 0x38
*          28AB  ff         RST 0x38
*          28AC  ff         RST 0x38
*          28AD  ff         RST 0x38
*          28AE  ff         RST 0x38
*          28AF  ff         RST 0x38
*          28B0  ff         RST 0x38
*          28B1  ff         RST 0x38
*          28B2  ff         RST 0x38
*          28B3  ff         RST 0x38
*          28B4  ff         RST 0x38
*          28B5  ff         RST 0x38
*          28B6  ff         RST 0x38
*          28B7  ff         RST 0x38
*          28B8  ff         RST 0x38
*          28B9  ff         RST 0x38
*          28BA  ff         RST 0x38
*          28BB  ff         RST 0x38
*          28BC  ff         RST 0x38
*          28BD  ff         RST 0x38
*          28BE  ff         RST 0x38
*          28BF  ff         RST 0x38
*          28C0  ff         RST 0x38
*          28C1  ff         RST 0x38
*          28C2  ff         RST 0x38
*          28C3  ff         RST 0x38
*          28C4  ff         RST 0x38
*          28C5  ff         RST 0x38
*          28C6  ff         RST 0x38
*          28C7  ff         RST 0x38
*          28C8  ff         RST 0x38
*          28C9  ff         RST 0x38
*          28CA  ff         RST 0x38
*          28CB  ff         RST 0x38
*          28CC  ff         RST 0x38
*          28CD  ff         RST 0x38
*          28CE  ff         RST 0x38
*          28CF  ff         RST 0x38
*          28D0  ff         RST 0x38
*          28D1  ff         RST 0x38
*          28D2  ff         RST 0x38
*          28D3  ff         RST 0x38
*          28D4  ff         RST 0x38
*          28D5  ff         RST 0x38
*          28D6  ff         RST 0x38
*          28D7  ff         RST 0x38
*          28D8  ff         RST 0x38
*          28D9  ff         RST 0x38
*          28DA  ff         RST 0x38
*          28DB  ff         RST 0x38
*          28DC  ff         RST 0x38
*          28DD  ff         RST 0x38
*          28DE  ff         RST 0x38
*          28DF  ff         RST 0x38
*          28E0  ff         RST 0x38
*          28E1  ff         RST 0x38
*          28E2  ff         RST 0x38
*          28E3  ff         RST 0x38
*          28E4  ff         RST 0x38
*          28E5  ff         RST 0x38
*          28E6  ff         RST 0x38
*          28E7  ff         RST 0x38
*          28E8  ff         RST 0x38
*          28E9  ff         RST 0x38
*          28EA  ff         RST 0x38
*          28EB  ff         RST 0x38
*          28EC  ff         RST 0x38
*          28ED  ff         RST 0x38
*          28EE  ff         RST 0x38
*          28EF  ff         RST 0x38
*          28F0  ff         RST 0x38
*          28F1  ff         RST 0x38
*          28F2  ff         RST 0x38
*          28F3  ff         RST 0x38
*          28F4  ff         RST 0x38
*          28F5  ff         RST 0x38
*          28F6  ff         RST 0x38
*          28F7  ff         RST 0x38
*          28F8  ff         RST 0x38
*          28F9  ff         RST 0x38
*          28FA  ff         RST 0x38
*          28FB  ff         RST 0x38
*          28FC  ff         RST 0x38
*          28FD  ff         RST 0x38
*          28FE  ff         RST 0x38
*          28FF  ff         RST 0x38
*          2900  ff         RST 0x38
*          2901  ff         RST 0x38
*          2902  ff         RST 0x38
*          2903  ff         RST 0x38
*          2904  ff         RST 0x38
*          2905  ff         RST 0x38
*          2906  ff         RST 0x38
*          2907  ff         RST 0x38
*          2908  ff         RST 0x38
*          2909  ff         RST 0x38
*          290A  ff         RST 0x38
*          290B  ff         RST 0x38
*          290C  ff         RST 0x38
*          290D  ff         RST 0x38
*          290E  ff         RST 0x38
*          290F  ff         RST 0x38
*          2910  ff         RST 0x38
*          2911  ff         RST 0x38
*          2912  ff         RST 0x38
*          2913  ff         RST 0x38
*          2914  ff         RST 0x38
*          2915  ff         RST 0x38
*          2916  ff         RST 0x38
*          2917  ff         RST 0x38
*          2918  ff         RST 0x38
*          2919  ff         RST 0x38
*          291A  ff         RST 0x38
*          291B  ff         RST 0x38
*          291C  ff         RST 0x38
*          291D  ff         RST 0x38
*          291E  ff         RST 0x38
*          291F  ff         RST 0x38
*          2920  ff         RST 0x38
*          2921  ff         RST 0x38
*          2922  ff         RST 0x38
*          2923  ff         RST 0x38
*          2924  ff         RST 0x38
*          2925  ff         RST 0x38
*          2926  ff         RST 0x38
*          2927  ff         RST 0x38
*          2928  ff         RST 0x38
*          2929  ff         RST 0x38
*          292A  ff         RST 0x38
*          292B  ff         RST 0x38
*          292C  ff         RST 0x38
*          292D  ff         RST 0x38
*          292E  ff         RST 0x38
*          292F  ff         RST 0x38
*          2930  ff         RST 0x38
*          2931  ff         RST 0x38
*          2932  ff         RST 0x38
*          2933  ff         RST 0x38
*          2934  ff         RST 0x38
*          2935  ff         RST 0x38
*          2936  ff         RST 0x38
*          2937  ff         RST 0x38
*          2938  ff         RST 0x38
*          2939  ff         RST 0x38
*          293A  ff         RST 0x38
*          293B  ff         RST 0x38
*          293C  ff         RST 0x38
*          293D  ff         RST 0x38
*          293E  ff         RST 0x38
*          293F  ff         RST 0x38
*          2940  ff         RST 0x38
*          2941  ff         RST 0x38
*          2942  ff         RST 0x38
*          2943  ff         RST 0x38
*          2944  ff         RST 0x38
*          2945  ff         RST 0x38
*          2946  ff         RST 0x38
*          2947  ff         RST 0x38
*          2948  ff         RST 0x38
*          2949  ff         RST 0x38
*          294A  ff         RST 0x38
*          294B  ff         RST 0x38
*          294C  ff         RST 0x38
*          294D  ff         RST 0x38
*          294E  ff         RST 0x38
*          294F  ff         RST 0x38
*          2950  ff         RST 0x38
*          2951  ff         RST 0x38
*          2952  ff         RST 0x38
*          2953  ff         RST 0x38
*          2954  ff         RST 0x38
*          2955  ff         RST 0x38
*          2956  ff         RST 0x38
*          2957  ff         RST 0x38
*          2958  ff         RST 0x38
*          2959  ff         RST 0x38
*          295A  ff         RST 0x38
*          295B  ff         RST 0x38
*          295C  ff         RST 0x38
*          295D  ff         RST 0x38
*          295E  ff         RST 0x38
*          295F  ff         RST 0x38
*          2960  ff         RST 0x38
*          2961  ff         RST 0x38
*          2962  ff         RST 0x38
*          2963  ff         RST 0x38
*          2964  ff         RST 0x38
*          2965  ff         RST 0x38
*          2966  ff         RST 0x38
*          2967  ff         RST 0x38
*          2968  ff         RST 0x38
*          2969  ff         RST 0x38
*          296A  ff         RST 0x38
*          296B  ff         RST 0x38
*          296C  ff         RST 0x38
*          296D  ff         RST 0x38
*          296E  ff         RST 0x38
*          296F  ff         RST 0x38
*          2970  ff         RST 0x38
*          2971  ff         RST 0x38
*          2972  ff         RST 0x38
*          2973  ff         RST 0x38
*          2974  ff         RST 0x38
*          2975  ff         RST 0x38
*          2976  ff         RST 0x38
*          2977  ff         RST 0x38
*          2978  ff         RST 0x38
*          2979  ff         RST 0x38
*          297A  ff         RST 0x38
*          297B  ff         RST 0x38
*          297C  ff         RST 0x38
*          297D  ff         RST 0x38
*          297E  ff         RST 0x38
*          297F  ff         RST 0x38
*          2980  ff         RST 0x38
*          2981  ff         RST 0x38
*          2982  ff         RST 0x38
*          2983  ff         RST 0x38
*          2984  ff         RST 0x38
*          2985  ff         RST 0x38
*          2986  ff         RST 0x38
*          2987  ff         RST 0x38
*          2988  ff         RST 0x38
*          2989  ff         RST 0x38
*          298A  ff         RST 0x38
*          298B  ff         RST 0x38
*          298C  ff         RST 0x38
*          298D  ff         RST 0x38
*          298E  ff         RST 0x38
*          298F  ff         RST 0x38
*          2990  ff         RST 0x38
*          2991  ff         RST 0x38
*          2992  ff         RST 0x38
*          2993  ff         RST 0x38
*          2994  ff         RST 0x38
*          2995  ff         RST 0x38
*          2996  ff         RST 0x38
*          2997  ff         RST 0x38
*          2998  ff         RST 0x38
*          2999  ff         RST 0x38
*          299A  ff         RST 0x38
*          299B  ff         RST 0x38
*          299C  ff         RST 0x38
*          299D  ff         RST 0x38
*          299E  ff         RST 0x38
*          299F  ff         RST 0x38
*          29A0  ff         RST 0x38
*          29A1  ff         RST 0x38
*          29A2  ff         RST 0x38
*          29A3  ff         RST 0x38
*          29A4  ff         RST 0x38
*          29A5  ff         RST 0x38
*          29A6  ff         RST 0x38
*          29A7  ff         RST 0x38
*          29A8  ff         RST 0x38
*          29A9  ff         RST 0x38
*          29AA  ff         RST 0x38
*          29AB  ff         RST 0x38
*          29AC  ff         RST 0x38
*          29AD  ff         RST 0x38
*          29AE  ff         RST 0x38
*          29AF  ff         RST 0x38
*          29B0  ff         RST 0x38
*          29B1  ff         RST 0x38
*          29B2  ff         RST 0x38
*          29B3  ff         RST 0x38
*          29B4  ff         RST 0x38
*          29B5  ff         RST 0x38
*          29B6  ff         RST 0x38
*          29B7  ff         RST 0x38
*          29B8  ff         RST 0x38
*          29B9  ff         RST 0x38
*          29BA  ff         RST 0x38
*          29BB  ff         RST 0x38
*          29BC  ff         RST 0x38
*          29BD  ff         RST 0x38
*          29BE  ff         RST 0x38
*          29BF  ff         RST 0x38
*          29C0  ff         RST 0x38
*          29C1  ff         RST 0x38
*          29C2  ff         RST 0x38
*          29C3  ff         RST 0x38
*          29C4  ff         RST 0x38
*          29C5  ff         RST 0x38
*          29C6  ff         RST 0x38
*          29C7  ff         RST 0x38
*          29C8  ff         RST 0x38
*          29C9  ff         RST 0x38
*          29CA  ff         RST 0x38
*          29CB  ff         RST 0x38
*          29CC  ff         RST 0x38
*          29CD  ff         RST 0x38
*          29CE  ff         RST 0x38
*          29CF  ff         RST 0x38
*          29D0  ff         RST 0x38
*          29D1  ff         RST 0x38
*          29D2  ff         RST 0x38
*          29D3  ff         RST 0x38
*          29D4  ff         RST 0x38
*          29D5  ff         RST 0x38
*          29D6  ff         RST 0x38
*          29D7  ff         RST 0x38
*          29D8  ff         RST 0x38
*          29D9  ff         RST 0x38
*          29DA  ff         RST 0x38
*          29DB  ff         RST 0x38
*          29DC  ff         RST 0x38
*          29DD  ff         RST 0x38
*          29DE  ff         RST 0x38
*          29DF  ff         RST 0x38
*          29E0  ff         RST 0x38
*          29E1  ff         RST 0x38
*          29E2  ff         RST 0x38
*          29E3  ff         RST 0x38
*          29E4  ff         RST 0x38
*          29E5  ff         RST 0x38
*          29E6  ff         RST 0x38
*          29E7  ff         RST 0x38
*          29E8  ff         RST 0x38
*          29E9  ff         RST 0x38
*          29EA  ff         RST 0x38
*          29EB  ff         RST 0x38
*          29EC  ff         RST 0x38
*          29ED  ff         RST 0x38
*          29EE  ff         RST 0x38
*          29EF  ff         RST 0x38
*          29F0  ff         RST 0x38
*          29F1  ff         RST 0x38
*          29F2  ff         RST 0x38
*          29F3  ff         RST 0x38
*          29F4  ff         RST 0x38
*          29F5  ff         RST 0x38
*          29F6  ff         RST 0x38
*          29F7  ff         RST 0x38
*          29F8  ff         RST 0x38
*          29F9  ff         RST 0x38
*          29FA  ff         RST 0x38
*          29FB  ff         RST 0x38
*          29FC  ff         RST 0x38
*          29FD  ff         RST 0x38
*          29FE  ff         RST 0x38
*          29FF  ff         RST 0x38
*          2A00  ff         RST 0x38
*          2A01  ff         RST 0x38
*          2A02  ff         RST 0x38
*          2A03  ff         RST 0x38
*          2A04  ff         RST 0x38
*          2A05  ff         RST 0x38
*          2A06  ff         RST 0x38
*          2A07  ff         RST 0x38
*          2A08  ff         RST 0x38
*          2A09  ff         RST 0x38
*          2A0A  ff         RST 0x38
*          2A0B  ff         RST 0x38
*          2A0C  ff         RST 0x38
*          2A0D  ff         RST 0x38
*          2A0E  ff         RST 0x38
*          2A0F  ff         RST 0x38
*          2A10  ff         RST 0x38
*          2A11  ff         RST 0x38
*          2A12  ff         RST 0x38
*          2A13  ff         RST 0x38
*          2A14  ff         RST 0x38
*          2A15  ff         RST 0x38
*          2A16  ff         RST 0x38
*          2A17  ff         RST 0x38
*          2A18  ff         RST 0x38
*          2A19  ff         RST 0x38
*          2A1A  ff         RST 0x38
*          2A1B  ff         RST 0x38
*          2A1C  ff         RST 0x38
*          2A1D  ff         RST 0x38
*          2A1E  ff         RST 0x38
*          2A1F  ff         RST 0x38
*          2A20  ff         RST 0x38
*          2A21  ff         RST 0x38
*          2A22  ff         RST 0x38
*          2A23  ff         RST 0x38
*          2A24  ff         RST 0x38
*          2A25  ff         RST 0x38
*          2A26  ff         RST 0x38
*          2A27  ff         RST 0x38
*          2A28  ff         RST 0x38
*          2A29  ff         RST 0x38
*          2A2A  ff         RST 0x38
*          2A2B  ff         RST 0x38
*          2A2C  ff         RST 0x38
*          2A2D  ff         RST 0x38
*          2A2E  ff         RST 0x38
*          2A2F  ff         RST 0x38
*          2A30  ff         RST 0x38
*          2A31  ff         RST 0x38
*          2A32  ff         RST 0x38
*          2A33  ff         RST 0x38
*          2A34  ff         RST 0x38
*          2A35  ff         RST 0x38
*          2A36  ff         RST 0x38
*          2A37  ff         RST 0x38
*          2A38  ff         RST 0x38
*          2A39  ff         RST 0x38
*          2A3A  ff         RST 0x38
*          2A3B  ff         RST 0x38
*          2A3C  ff         RST 0x38
*          2A3D  ff         RST 0x38
*          2A3E  ff         RST 0x38
*          2A3F  ff         RST 0x38
*          2A40  ff         RST 0x38
*          2A41  ff         RST 0x38
*          2A42  ff         RST 0x38
*          2A43  ff         RST 0x38
*          2A44  ff         RST 0x38
*          2A45  ff         RST 0x38
*          2A46  ff         RST 0x38
*          2A47  ff         RST 0x38
*          2A48  ff         RST 0x38
*          2A49  ff         RST 0x38
*          2A4A  ff         RST 0x38
*          2A4B  ff         RST 0x38
*          2A4C  ff         RST 0x38
*          2A4D  ff         RST 0x38
*          2A4E  ff         RST 0x38
*          2A4F  ff         RST 0x38
*          2A50  ff         RST 0x38
*          2A51  ff         RST 0x38
*          2A52  ff         RST 0x38
*          2A53  ff         RST 0x38
*          2A54  ff         RST 0x38
*          2A55  ff         RST 0x38
*          2A56  ff         RST 0x38
*          2A57  ff         RST 0x38
*          2A58  ff         RST 0x38
*          2A59  ff         RST 0x38
*          2A5A  ff         RST 0x38
*          2A5B  ff         RST 0x38
*          2A5C  ff         RST 0x38
*          2A5D  ff         RST 0x38
*          2A5E  ff         RST 0x38
*          2A5F  ff         RST 0x38
*          2A60  ff         RST 0x38
*          2A61  ff         RST 0x38
*          2A62  ff         RST 0x38
*          2A63  ff         RST 0x38
*          2A64  ff         RST 0x38
*          2A65  ff         RST 0x38
*          2A66  ff         RST 0x38
*          2A67  ff         RST 0x38
*          2A68  ff         RST 0x38
*          2A69  ff         RST 0x38
*          2A6A  ff         RST 0x38
*          2A6B  ff         RST 0x38
*          2A6C  ff         RST 0x38
*          2A6D  ff         RST 0x38
*          2A6E  ff         RST 0x38
*          2A6F  ff         RST 0x38
*          2A70  ff         RST 0x38
*          2A71  ff         RST 0x38
*          2A72  ff         RST 0x38
*          2A73  ff         RST 0x38
*          2A74  ff         RST 0x38
*          2A75  ff         RST 0x38
*          2A76  ff         RST 0x38
*          2A77  ff         RST 0x38
*          2A78  ff         RST 0x38
*          2A79  ff         RST 0x38
*          2A7A  ff         RST 0x38
*          2A7B  ff         RST 0x38
*          2A7C  ff         RST 0x38
*          2A7D  ff         RST 0x38
*          2A7E  ff         RST 0x38
*          2A7F  ff         RST 0x38
*          2A80  ff         RST 0x38
*          2A81  ff         RST 0x38
*          2A82  ff         RST 0x38
*          2A83  ff         RST 0x38
*          2A84  ff         RST 0x38
*          2A85  ff         RST 0x38
*          2A86  ff         RST 0x38
*          2A87  ff         RST 0x38
*          2A88  ff         RST 0x38
*          2A89  ff         RST 0x38
*          2A8A  ff         RST 0x38
*          2A8B  ff         RST 0x38
*          2A8C  ff         RST 0x38
*          2A8D  ff         RST 0x38
*          2A8E  ff         RST 0x38
*          2A8F  ff         RST 0x38
*          2A90  ff         RST 0x38
*          2A91  ff         RST 0x38
*          2A92  ff         RST 0x38
*          2A93  ff         RST 0x38
*          2A94  ff         RST 0x38
*          2A95  ff         RST 0x38
*          2A96  ff         RST 0x38
*          2A97  ff         RST 0x38
*          2A98  ff         RST 0x38
*          2A99  ff         RST 0x38
*          2A9A  ff         RST 0x38
*          2A9B  ff         RST 0x38
*          2A9C  ff         RST 0x38
*          2A9D  ff         RST 0x38
*          2A9E  ff         RST 0x38
*          2A9F  ff         RST 0x38
*          2AA0  ff         RST 0x38
*          2AA1  ff         RST 0x38
*          2AA2  ff         RST 0x38
*          2AA3  ff         RST 0x38
*          2AA4  ff         RST 0x38
*          2AA5  ff         RST 0x38
*          2AA6  ff         RST 0x38
*          2AA7  ff         RST 0x38
*          2AA8  ff         RST 0x38
*          2AA9  ff         RST 0x38
*          2AAA  ff         RST 0x38
*          2AAB  ff         RST 0x38
*          2AAC  ff         RST 0x38
*          2AAD  ff         RST 0x38
*          2AAE  ff         RST 0x38
*          2AAF  ff         RST 0x38
*          2AB0  ff         RST 0x38
*          2AB1  ff         RST 0x38
*          2AB2  ff         RST 0x38
*          2AB3  ff         RST 0x38
*          2AB4  ff         RST 0x38
*          2AB5  ff         RST 0x38
*          2AB6  ff         RST 0x38
*          2AB7  ff         RST 0x38
*          2AB8  ff         RST 0x38
*          2AB9  ff         RST 0x38
*          2ABA  ff         RST 0x38
*          2ABB  ff         RST 0x38
*          2ABC  ff         RST 0x38
*          2ABD  ff         RST 0x38
*          2ABE  ff         RST 0x38
*          2ABF  ff         RST 0x38
*          2AC0  ff         RST 0x38
*          2AC1  ff         RST 0x38
*          2AC2  ff         RST 0x38
*          2AC3  ff         RST 0x38
*          2AC4  ff         RST 0x38
*          2AC5  ff         RST 0x38
*          2AC6  ff         RST 0x38
*          2AC7  ff         RST 0x38
*          2AC8  ff         RST 0x38
*          2AC9  ff         RST 0x38
*          2ACA  ff         RST 0x38
*          2ACB  ff         RST 0x38
*          2ACC  ff         RST 0x38
*          2ACD  ff         RST 0x38
*          2ACE  ff         RST 0x38
*          2ACF  ff         RST 0x38
*          2AD0  ff         RST 0x38
*          2AD1  ff         RST 0x38
*          2AD2  ff         RST 0x38
*          2AD3  ff         RST 0x38
*          2AD4  ff         RST 0x38
*          2AD5  ff         RST 0x38
*          2AD6  ff         RST 0x38
*          2AD7  ff         RST 0x38
*          2AD8  ff         RST 0x38
*          2AD9  ff         RST 0x38
*          2ADA  ff         RST 0x38
*          2ADB  ff         RST 0x38
*          2ADC  ff         RST 0x38
*          2ADD  ff         RST 0x38
*          2ADE  ff         RST 0x38
*          2ADF  ff         RST 0x38
*          2AE0  ff         RST 0x38
*          2AE1  ff         RST 0x38
*          2AE2  ff         RST 0x38
*          2AE3  ff         RST 0x38
*          2AE4  ff         RST 0x38
*          2AE5  ff         RST 0x38
*          2AE6  ff         RST 0x38
*          2AE7  ff         RST 0x38
*          2AE8  ff         RST 0x38
*          2AE9  ff         RST 0x38
*          2AEA  ff         RST 0x38
*          2AEB  ff         RST 0x38
*          2AEC  ff         RST 0x38
*          2AED  ff         RST 0x38
*          2AEE  ff         RST 0x38
*          2AEF  ff         RST 0x38
*          2AF0  ff         RST 0x38
*          2AF1  ff         RST 0x38
*          2AF2  ff         RST 0x38
*          2AF3  ff         RST 0x38
*          2AF4  ff         RST 0x38
*          2AF5  ff         RST 0x38
*          2AF6  ff         RST 0x38
*          2AF7  ff         RST 0x38
*          2AF8  ff         RST 0x38
*          2AF9  ff         RST 0x38
*          2AFA  ff         RST 0x38
*          2AFB  ff         RST 0x38
*          2AFC  ff         RST 0x38
*          2AFD  ff         RST 0x38
*          2AFE  ff         RST 0x38
*          2AFF  ff         RST 0x38
*          2B00  ff         RST 0x38
*          2B01  ff         RST 0x38
*          2B02  ff         RST 0x38
*          2B03  ff         RST 0x38
*          2B04  ff         RST 0x38
*          2B05  ff         RST 0x38
*          2B06  ff         RST 0x38
*          2B07  ff         RST 0x38
*          2B08  ff         RST 0x38
*          2B09  ff         RST 0x38
*          2B0A  ff         RST 0x38
*          2B0B  ff         RST 0x38
*          2B0C  ff         RST 0x38
*          2B0D  ff         RST 0x38
*          2B0E  ff         RST 0x38
*          2B0F  ff         RST 0x38
*          2B10  ff         RST 0x38
*          2B11  ff         RST 0x38
*          2B12  ff         RST 0x38
*          2B13  ff         RST 0x38
*          2B14  ff         RST 0x38
*          2B15  ff         RST 0x38
*          2B16  ff         RST 0x38
*          2B17  ff         RST 0x38
*          2B18  ff         RST 0x38
*          2B19  ff         RST 0x38
*          2B1A  ff         RST 0x38
*          2B1B  ff         RST 0x38
*          2B1C  ff         RST 0x38
*          2B1D  ff         RST 0x38
*          2B1E  ff         RST 0x38
*          2B1F  ff         RST 0x38
*          2B20  ff         RST 0x38
*          2B21  ff         RST 0x38
*          2B22  ff         RST 0x38
*          2B23  ff         RST 0x38
*          2B24  ff         RST 0x38
*          2B25  ff         RST 0x38
*          2B26  ff         RST 0x38
*          2B27  ff         RST 0x38
*          2B28  ff         RST 0x38
*          2B29  ff         RST 0x38
*          2B2A  ff         RST 0x38
*          2B2B  ff         RST 0x38
*          2B2C  ff         RST 0x38
*          2B2D  ff         RST 0x38
*          2B2E  ff         RST 0x38
*          2B2F  ff         RST 0x38
*          2B30  ff         RST 0x38
*          2B31  ff         RST 0x38
*          2B32  ff         RST 0x38
*          2B33  ff         RST 0x38
*          2B34  ff         RST 0x38
*          2B35  ff         RST 0x38
*          2B36  ff         RST 0x38
*          2B37  ff         RST 0x38
*          2B38  ff         RST 0x38
*          2B39  ff         RST 0x38
*          2B3A  ff         RST 0x38
*          2B3B  ff         RST 0x38
*          2B3C  ff         RST 0x38
*          2B3D  ff         RST 0x38
*          2B3E  ff         RST 0x38
*          2B3F  ff         RST 0x38
*          2B40  ff         RST 0x38
*          2B41  ff         RST 0x38
*          2B42  ff         RST 0x38
*          2B43  ff         RST 0x38
*          2B44  ff         RST 0x38
*          2B45  ff         RST 0x38
*          2B46  ff         RST 0x38
*          2B47  ff         RST 0x38
*          2B48  ff         RST 0x38
*          2B49  ff         RST 0x38
*          2B4A  ff         RST 0x38
*          2B4B  ff         RST 0x38
*          2B4C  ff         RST 0x38
*          2B4D  ff         RST 0x38
*          2B4E  ff         RST 0x38
*          2B4F  ff         RST 0x38
*          2B50  ff         RST 0x38
*          2B51  ff         RST 0x38
*          2B52  ff         RST 0x38
*          2B53  ff         RST 0x38
*          2B54  ff         RST 0x38
*          2B55  ff         RST 0x38
*          2B56  ff         RST 0x38
*          2B57  ff         RST 0x38
*          2B58  ff         RST 0x38
*          2B59  ff         RST 0x38
*          2B5A  ff         RST 0x38
*          2B5B  ff         RST 0x38
*          2B5C  ff         RST 0x38
*          2B5D  ff         RST 0x38
*          2B5E  ff         RST 0x38
*          2B5F  ff         RST 0x38
*          2B60  ff         RST 0x38
*          2B61  ff         RST 0x38
*          2B62  ff         RST 0x38
*          2B63  ff         RST 0x38
*          2B64  ff         RST 0x38
*          2B65  ff         RST 0x38
*          2B66  ff         RST 0x38
*          2B67  ff         RST 0x38
*          2B68  ff         RST 0x38
*          2B69  ff         RST 0x38
*          2B6A  ff         RST 0x38
*          2B6B  ff         RST 0x38
*          2B6C  ff         RST 0x38
*          2B6D  ff         RST 0x38
*          2B6E  ff         RST 0x38
*          2B6F  ff         RST 0x38
*          2B70  ff         RST 0x38
*          2B71  ff         RST 0x38
*          2B72  ff         RST 0x38
*          2B73  ff         RST 0x38
*          2B74  ff         RST 0x38
*          2B75  ff         RST 0x38
*          2B76  ff         RST 0x38
*          2B77  ff         RST 0x38
*          2B78  ff         RST 0x38
*          2B79  ff         RST 0x38
*          2B7A  ff         RST 0x38
*          2B7B  ff         RST 0x38
*          2B7C  ff         RST 0x38
*          2B7D  ff         RST 0x38
*          2B7E  ff         RST 0x38
*          2B7F  ff         RST 0x38
*          2B80  ff         RST 0x38
*          2B81  ff         RST 0x38
*          2B82  ff         RST 0x38
*          2B83  ff         RST 0x38
*          2B84  ff         RST 0x38
*          2B85  ff         RST 0x38
*          2B86  ff         RST 0x38
*          2B87  ff         RST 0x38
*          2B88  ff         RST 0x38
*          2B89  ff         RST 0x38
*          2B8A  ff         RST 0x38
*          2B8B  ff         RST 0x38
*          2B8C  ff         RST 0x38
*          2B8D  ff         RST 0x38
*          2B8E  ff         RST 0x38
*          2B8F  ff         RST 0x38
*          2B90  ff         RST 0x38
*          2B91  ff         RST 0x38
*          2B92  ff         RST 0x38
*          2B93  ff         RST 0x38
*          2B94  ff         RST 0x38
*          2B95  ff         RST 0x38
*          2B96  ff         RST 0x38
*          2B97  ff         RST 0x38
*          2B98  ff         RST 0x38
*          2B99  ff         RST 0x38
*          2B9A  ff         RST 0x38
*          2B9B  ff         RST 0x38
*          2B9C  ff         RST 0x38
*          2B9D  ff         RST 0x38
*          2B9E  ff         RST 0x38
*          2B9F  ff         RST 0x38
*          2BA0  ff         RST 0x38
*          2BA1  ff         RST 0x38
*          2BA2  ff         RST 0x38
*          2BA3  ff         RST 0x38
*          2BA4  ff         RST 0x38
*          2BA5  ff         RST 0x38
*          2BA6  ff         RST 0x38
*          2BA7  ff         RST 0x38
*          2BA8  ff         RST 0x38
*          2BA9  ff         RST 0x38
*          2BAA  ff         RST 0x38
*          2BAB  ff         RST 0x38
*          2BAC  ff         RST 0x38
*          2BAD  ff         RST 0x38
*          2BAE  ff         RST 0x38
*          2BAF  ff         RST 0x38
*          2BB0  ff         RST 0x38
*          2BB1  ff         RST 0x38
*          2BB2  ff         RST 0x38
*          2BB3  ff         RST 0x38
*          2BB4  ff         RST 0x38
*          2BB5  ff         RST 0x38
*          2BB6  ff         RST 0x38
*          2BB7  ff         RST 0x38
*          2BB8  ff         RST 0x38
*          2BB9  ff         RST 0x38
*          2BBA  ff         RST 0x38
*          2BBB  ff         RST 0x38
*          2BBC  ff         RST 0x38
*          2BBD  ff         RST 0x38
*          2BBE  ff         RST 0x38
*          2BBF  ff         RST 0x38
*          2BC0  ff         RST 0x38
*          2BC1  ff         RST 0x38
*          2BC2  ff         RST 0x38
*          2BC3  ff         RST 0x38
*          2BC4  ff         RST 0x38
*          2BC5  ff         RST 0x38
*          2BC6  ff         RST 0x38
*          2BC7  ff         RST 0x38
*          2BC8  ff         RST 0x38
*          2BC9  ff         RST 0x38
*          2BCA  ff         RST 0x38
*          2BCB  ff         RST 0x38
*          2BCC  ff         RST 0x38
*          2BCD  ff         RST 0x38
*          2BCE  ff         RST 0x38
*          2BCF  ff         RST 0x38
*          2BD0  ff         RST 0x38
*          2BD1  ff         RST 0x38
*          2BD2  ff         RST 0x38
*          2BD3  ff         RST 0x38
*          2BD4  ff         RST 0x38
*          2BD5  ff         RST 0x38
*          2BD6  ff         RST 0x38
*          2BD7  ff         RST 0x38
*          2BD8  ff         RST 0x38
*          2BD9  ff         RST 0x38
*          2BDA  ff         RST 0x38
*          2BDB  ff         RST 0x38
*          2BDC  ff         RST 0x38
*          2BDD  ff         RST 0x38
*          2BDE  ff         RST 0x38
*          2BDF  ff         RST 0x38
*          2BE0  ff         RST 0x38
*          2BE1  ff         RST 0x38
*          2BE2  ff         RST 0x38
*          2BE3  ff         RST 0x38
*          2BE4  ff         RST 0x38
*          2BE5  ff         RST 0x38
*          2BE6  ff         RST 0x38
*          2BE7  ff         RST 0x38
*          2BE8  ff         RST 0x38
*          2BE9  ff         RST 0x38
*          2BEA  ff         RST 0x38
*          2BEB  ff         RST 0x38
*          2BEC  ff         RST 0x38
*          2BED  ff         RST 0x38
*          2BEE  ff         RST 0x38
*          2BEF  ff         RST 0x38
*          2BF0  ff         RST 0x38
*          2BF1  ff         RST 0x38
*          2BF2  ff         RST 0x38
*          2BF3  ff         RST 0x38
*          2BF4  ff         RST 0x38
*          2BF5  ff         RST 0x38
*          2BF6  ff         RST 0x38
*          2BF7  ff         RST 0x38
*          2BF8  ff         RST 0x38
*          2BF9  ff         RST 0x38
*          2BFA  ff         RST 0x38
*          2BFB  ff         RST 0x38
*          2BFC  ff         RST 0x38
*          2BFD  ff         RST 0x38
*          2BFE  ff         RST 0x38
*          2BFF  ff         RST 0x38
*          2C00  ff         RST 0x38
*          2C01  ff         RST 0x38
*          2C02  ff         RST 0x38
*          2C03  ff         RST 0x38
*          2C04  ff         RST 0x38
*          2C05  ff         RST 0x38
*          2C06  ff         RST 0x38
*          2C07  ff         RST 0x38
*          2C08  ff         RST 0x38
*          2C09  ff         RST 0x38
*          2C0A  ff         RST 0x38
*          2C0B  ff         RST 0x38
*          2C0C  ff         RST 0x38
*          2C0D  ff         RST 0x38
*          2C0E  ff         RST 0x38
*          2C0F  ff         RST 0x38
*          2C10  ff         RST 0x38
*          2C11  ff         RST 0x38
*          2C12  ff         RST 0x38
*          2C13  ff         RST 0x38
*          2C14  ff         RST 0x38
*          2C15  ff         RST 0x38
*          2C16  ff         RST 0x38
*          2C17  ff         RST 0x38
*          2C18  ff         RST 0x38
*          2C19  ff         RST 0x38
*          2C1A  ff         RST 0x38
*          2C1B  ff         RST 0x38
*          2C1C  ff         RST 0x38
*          2C1D  ff         RST 0x38
*          2C1E  ff         RST 0x38
*          2C1F  ff         RST 0x38
*          2C20  ff         RST 0x38
*          2C21  ff         RST 0x38
*          2C22  ff         RST 0x38
*          2C23  ff         RST 0x38
*          2C24  ff         RST 0x38
*          2C25  ff         RST 0x38
*          2C26  ff         RST 0x38
*          2C27  ff         RST 0x38
*          2C28  ff         RST 0x38
*          2C29  ff         RST 0x38
*          2C2A  ff         RST 0x38
*          2C2B  ff         RST 0x38
*          2C2C  ff         RST 0x38
*          2C2D  ff         RST 0x38
*          2C2E  ff         RST 0x38
*          2C2F  ff         RST 0x38
*          2C30  ff         RST 0x38
*          2C31  ff         RST 0x38
*          2C32  ff         RST 0x38
*          2C33  ff         RST 0x38
*          2C34  ff         RST 0x38
*          2C35  ff         RST 0x38
*          2C36  ff         RST 0x38
*          2C37  ff         RST 0x38
*          2C38  ff         RST 0x38
*          2C39  ff         RST 0x38
*          2C3A  ff         RST 0x38
*          2C3B  ff         RST 0x38
*          2C3C  ff         RST 0x38
*          2C3D  ff         RST 0x38
*          2C3E  ff         RST 0x38
*          2C3F  ff         RST 0x38
*          2C40  ff         RST 0x38
*          2C41  ff         RST 0x38
*          2C42  ff         RST 0x38
*          2C43  ff         RST 0x38
*          2C44  ff         RST 0x38
*          2C45  ff         RST 0x38
*          2C46  ff         RST 0x38
*          2C47  ff         RST 0x38
*          2C48  ff         RST 0x38
*          2C49  ff         RST 0x38
*          2C4A  ff         RST 0x38
*          2C4B  ff         RST 0x38
*          2C4C  ff         RST 0x38
*          2C4D  ff         RST 0x38
*          2C4E  ff         RST 0x38
*          2C4F  ff         RST 0x38
*          2C50  ff         RST 0x38
*          2C51  ff         RST 0x38
*          2C52  ff         RST 0x38
*          2C53  ff         RST 0x38
*          2C54  ff         RST 0x38
*          2C55  ff         RST 0x38
*          2C56  ff         RST 0x38
*          2C57  ff         RST 0x38
*          2C58  ff         RST 0x38
*          2C59  ff         RST 0x38
*          2C5A  ff         RST 0x38
*          2C5B  ff         RST 0x38
*          2C5C  ff         RST 0x38
*          2C5D  ff         RST 0x38
*          2C5E  ff         RST 0x38
*          2C5F  ff         RST 0x38
*          2C60  ff         RST 0x38
*          2C61  ff         RST 0x38
*          2C62  ff         RST 0x38
*          2C63  ff         RST 0x38
*          2C64  ff         RST 0x38
*          2C65  ff         RST 0x38
*          2C66  ff         RST 0x38
*          2C67  ff         RST 0x38
*          2C68  ff         RST 0x38
*          2C69  ff         RST 0x38
*          2C6A  ff         RST 0x38
*          2C6B  ff         RST 0x38
*          2C6C  ff         RST 0x38
*          2C6D  ff         RST 0x38
*          2C6E  ff         RST 0x38
*          2C6F  ff         RST 0x38
*          2C70  ff         RST 0x38
*          2C71  ff         RST 0x38
*          2C72  ff         RST 0x38
*          2C73  ff         RST 0x38
*          2C74  ff         RST 0x38
*          2C75  ff         RST 0x38
*          2C76  ff         RST 0x38
*          2C77  ff         RST 0x38
*          2C78  ff         RST 0x38
*          2C79  ff         RST 0x38
*          2C7A  ff         RST 0x38
*          2C7B  ff         RST 0x38
*          2C7C  ff         RST 0x38
*          2C7D  ff         RST 0x38
*          2C7E  ff         RST 0x38
*          2C7F  ff         RST 0x38
*          2C80  ff         RST 0x38
*          2C81  ff         RST 0x38
*          2C82  ff         RST 0x38
*          2C83  ff         RST 0x38
*          2C84  ff         RST 0x38
*          2C85  ff         RST 0x38
*          2C86  ff         RST 0x38
*          2C87  ff         RST 0x38
*          2C88  ff         RST 0x38
*          2C89  ff         RST 0x38
*          2C8A  ff         RST 0x38
*          2C8B  ff         RST 0x38
*          2C8C  ff         RST 0x38
*          2C8D  ff         RST 0x38
*          2C8E  ff         RST 0x38
*          2C8F  ff         RST 0x38
*          2C90  ff         RST 0x38
*          2C91  ff         RST 0x38
*          2C92  ff         RST 0x38
*          2C93  ff         RST 0x38
*          2C94  ff         RST 0x38
*          2C95  ff         RST 0x38
*          2C96  ff         RST 0x38
*          2C97  ff         RST 0x38
*          2C98  ff         RST 0x38
*          2C99  ff         RST 0x38
*          2C9A  ff         RST 0x38
*          2C9B  ff         RST 0x38
*          2C9C  ff         RST 0x38
*          2C9D  ff         RST 0x38
*          2C9E  ff         RST 0x38
*          2C9F  ff         RST 0x38
*          2CA0  ff         RST 0x38
*          2CA1  ff         RST 0x38
*          2CA2  ff         RST 0x38
*          2CA3  ff         RST 0x38
*          2CA4  ff         RST 0x38
*          2CA5  ff         RST 0x38
*          2CA6  ff         RST 0x38
*          2CA7  ff         RST 0x38
*          2CA8  ff         RST 0x38
*          2CA9  ff         RST 0x38
*          2CAA  ff         RST 0x38
*          2CAB  ff         RST 0x38
*          2CAC  ff         RST 0x38
*          2CAD  ff         RST 0x38
*          2CAE  ff         RST 0x38
*          2CAF  ff         RST 0x38
*          2CB0  ff         RST 0x38
*          2CB1  ff         RST 0x38
*          2CB2  ff         RST 0x38
*          2CB3  ff         RST 0x38
*          2CB4  ff         RST 0x38
*          2CB5  ff         RST 0x38
*          2CB6  ff         RST 0x38
*          2CB7  ff         RST 0x38
*          2CB8  ff         RST 0x38
*          2CB9  ff         RST 0x38
*          2CBA  ff         RST 0x38
*          2CBB  ff         RST 0x38
*          2CBC  ff         RST 0x38
*          2CBD  ff         RST 0x38
*          2CBE  ff         RST 0x38
*          2CBF  ff         RST 0x38
*          2CC0  ff         RST 0x38
*          2CC1  ff         RST 0x38
*          2CC2  ff         RST 0x38
*          2CC3  ff         RST 0x38
*          2CC4  ff         RST 0x38
*          2CC5  ff         RST 0x38
*          2CC6  ff         RST 0x38
*          2CC7  ff         RST 0x38
*          2CC8  ff         RST 0x38
*          2CC9  ff         RST 0x38
*          2CCA  ff         RST 0x38
*          2CCB  ff         RST 0x38
*          2CCC  ff         RST 0x38
*          2CCD  ff         RST 0x38
*          2CCE  ff         RST 0x38
*          2CCF  ff         RST 0x38
*          2CD0  ff         RST 0x38
*          2CD1  ff         RST 0x38
*          2CD2  ff         RST 0x38
*          2CD3  ff         RST 0x38
*          2CD4  ff         RST 0x38
*          2CD5  ff         RST 0x38
*          2CD6  ff         RST 0x38
*          2CD7  ff         RST 0x38
*          2CD8  ff         RST 0x38
*          2CD9  ff         RST 0x38
*          2CDA  ff         RST 0x38
*          2CDB  ff         RST 0x38
*          2CDC  ff         RST 0x38
*          2CDD  ff         RST 0x38
*          2CDE  ff         RST 0x38
*          2CDF  ff         RST 0x38
*          2CE0  ff         RST 0x38
*          2CE1  ff         RST 0x38
*          2CE2  ff         RST 0x38
*          2CE3  ff         RST 0x38
*          2CE4  ff         RST 0x38
*          2CE5  ff         RST 0x38
*          2CE6  ff         RST 0x38
*          2CE7  ff         RST 0x38
*          2CE8  ff         RST 0x38
*          2CE9  ff         RST 0x38
*          2CEA  ff         RST 0x38
*          2CEB  ff         RST 0x38
*          2CEC  ff         RST 0x38
*          2CED  ff         RST 0x38
*          2CEE  ff         RST 0x38
*          2CEF  ff         RST 0x38
*          2CF0  ff         RST 0x38
*          2CF1  ff         RST 0x38
*          2CF2  ff         RST 0x38
*          2CF3  ff         RST 0x38
*          2CF4  ff         RST 0x38
*          2CF5  ff         RST 0x38
*          2CF6  ff         RST 0x38
*          2CF7  ff         RST 0x38
*          2CF8  ff         RST 0x38
*          2CF9  ff         RST 0x38
*          2CFA  ff         RST 0x38
*          2CFB  ff         RST 0x38
*          2CFC  ff         RST 0x38
*          2CFD  ff         RST 0x38
*          2CFE  ff         RST 0x38
*          2CFF  ff         RST 0x38
*          2D00  ff         RST 0x38
*          2D01  ff         RST 0x38
*          2D02  ff         RST 0x38
*          2D03  ff         RST 0x38
*          2D04  ff         RST 0x38
*          2D05  ff         RST 0x38
*          2D06  ff         RST 0x38
*          2D07  ff         RST 0x38
*          2D08  ff         RST 0x38
*          2D09  ff         RST 0x38
*          2D0A  ff         RST 0x38
*          2D0B  ff         RST 0x38
*          2D0C  ff         RST 0x38
*          2D0D  ff         RST 0x38
*          2D0E  ff         RST 0x38
*          2D0F  ff         RST 0x38
*          2D10  ff         RST 0x38
*          2D11  ff         RST 0x38
*          2D12  ff         RST 0x38
*          2D13  ff         RST 0x38
*          2D14  ff         RST 0x38
*          2D15  ff         RST 0x38
*          2D16  ff         RST 0x38
*          2D17  ff         RST 0x38
*          2D18  ff         RST 0x38
*          2D19  ff         RST 0x38
*          2D1A  ff         RST 0x38
*          2D1B  ff         RST 0x38
*          2D1C  ff         RST 0x38
*          2D1D  ff         RST 0x38
*          2D1E  ff         RST 0x38
*          2D1F  ff         RST 0x38
*          2D20  ff         RST 0x38
*          2D21  ff         RST 0x38
*          2D22  ff         RST 0x38
*          2D23  ff         RST 0x38
*          2D24  ff         RST 0x38
*          2D25  ff         RST 0x38
*          2D26  ff         RST 0x38
*          2D27  ff         RST 0x38
*          2D28  ff         RST 0x38
*          2D29  ff         RST 0x38
*          2D2A  ff         RST 0x38
*          2D2B  ff         RST 0x38
*          2D2C  ff         RST 0x38
*          2D2D  ff         RST 0x38
*          2D2E  ff         RST 0x38
*          2D2F  ff         RST 0x38
*          2D30  ff         RST 0x38
*          2D31  ff         RST 0x38
*          2D32  ff         RST 0x38
*          2D33  ff         RST 0x38
*          2D34  ff         RST 0x38
*          2D35  ff         RST 0x38
*          2D36  ff         RST 0x38
*          2D37  ff         RST 0x38
*          2D38  ff         RST 0x38
*          2D39  ff         RST 0x38
*          2D3A  ff         RST 0x38
*          2D3B  ff         RST 0x38
*          2D3C  ff         RST 0x38
*          2D3D  ff         RST 0x38
*          2D3E  ff         RST 0x38
*          2D3F  ff         RST 0x38
*          2D40  ff         RST 0x38
*          2D41  ff         RST 0x38
*          2D42  ff         RST 0x38
*          2D43  ff         RST 0x38
*          2D44  ff         RST 0x38
*          2D45  ff         RST 0x38
*          2D46  ff         RST 0x38
*          2D47  ff         RST 0x38
*          2D48  ff         RST 0x38
*          2D49  ff         RST 0x38
*          2D4A  ff         RST 0x38
*          2D4B  ff         RST 0x38
*          2D4C  ff         RST 0x38
*          2D4D  ff         RST 0x38
*          2D4E  ff         RST 0x38
*          2D4F  ff         RST 0x38
*          2D50  ff         RST 0x38
*          2D51  ff         RST 0x38
*          2D52  ff         RST 0x38
*          2D53  ff         RST 0x38
*          2D54  ff         RST 0x38
*          2D55  ff         RST 0x38
*          2D56  ff         RST 0x38
*          2D57  ff         RST 0x38
*          2D58  ff         RST 0x38
*          2D59  ff         RST 0x38
*          2D5A  ff         RST 0x38
*          2D5B  ff         RST 0x38
*          2D5C  ff         RST 0x38
*          2D5D  ff         RST 0x38
*          2D5E  ff         RST 0x38
*          2D5F  ff         RST 0x38
*          2D60  ff         RST 0x38
*          2D61  ff         RST 0x38
*          2D62  ff         RST 0x38
*          2D63  ff         RST 0x38
*          2D64  ff         RST 0x38
*          2D65  ff         RST 0x38
*          2D66  ff         RST 0x38
*          2D67  ff         RST 0x38
*          2D68  ff         RST 0x38
*          2D69  ff         RST 0x38
*          2D6A  ff         RST 0x38
*          2D6B  ff         RST 0x38
*          2D6C  ff         RST 0x38
*          2D6D  ff         RST 0x38
*          2D6E  ff         RST 0x38
*          2D6F  ff         RST 0x38
*          2D70  ff         RST 0x38
*          2D71  ff         RST 0x38
*          2D72  ff         RST 0x38
*          2D73  ff         RST 0x38
*          2D74  ff         RST 0x38
*          2D75  ff         RST 0x38
*          2D76  ff         RST 0x38
*          2D77  ff         RST 0x38
*          2D78  ff         RST 0x38
*          2D79  ff         RST 0x38
*          2D7A  ff         RST 0x38
*          2D7B  ff         RST 0x38
*          2D7C  ff         RST 0x38
*          2D7D  ff         RST 0x38
*          2D7E  ff         RST 0x38
*          2D7F  ff         RST 0x38
*          2D80  ff         RST 0x38
*          2D81  ff         RST 0x38
*          2D82  ff         RST 0x38
*          2D83  ff         RST 0x38
*          2D84  ff         RST 0x38
*          2D85  ff         RST 0x38
*          2D86  ff         RST 0x38
*          2D87  ff         RST 0x38
*          2D88  ff         RST 0x38
*          2D89  ff         RST 0x38
*          2D8A  ff         RST 0x38
*          2D8B  ff         RST 0x38
*          2D8C  ff         RST 0x38
*          2D8D  ff         RST 0x38
*          2D8E  ff         RST 0x38
*          2D8F  ff         RST 0x38
*          2D90  ff         RST 0x38
*          2D91  ff         RST 0x38
*          2D92  ff         RST 0x38
*          2D93  ff         RST 0x38
*          2D94  ff         RST 0x38
*          2D95  ff         RST 0x38
*          2D96  ff         RST 0x38
*          2D97  ff         RST 0x38
*          2D98  ff         RST 0x38
*          2D99  ff         RST 0x38
*          2D9A  ff         RST 0x38
*          2D9B  ff         RST 0x38
*          2D9C  ff         RST 0x38
*          2D9D  ff         RST 0x38
*          2D9E  ff         RST 0x38
*          2D9F  ff         RST 0x38
*          2DA0  ff         RST 0x38
*          2DA1  ff         RST 0x38
*          2DA2  ff         RST 0x38
*          2DA3  ff         RST 0x38
*          2DA4  ff         RST 0x38
*          2DA5  ff         RST 0x38
*          2DA6  ff         RST 0x38
*          2DA7  ff         RST 0x38
*          2DA8  ff         RST 0x38
*          2DA9  ff         RST 0x38
*          2DAA  ff         RST 0x38
*          2DAB  ff         RST 0x38
*          2DAC  ff         RST 0x38
*          2DAD  ff         RST 0x38
*          2DAE  ff         RST 0x38
*          2DAF  ff         RST 0x38
*          2DB0  ff         RST 0x38
*          2DB1  ff         RST 0x38
*          2DB2  ff         RST 0x38
*          2DB3  ff         RST 0x38
*          2DB4  ff         RST 0x38
*          2DB5  ff         RST 0x38
*          2DB6  ff         RST 0x38
*          2DB7  ff         RST 0x38
*          2DB8  ff         RST 0x38
*          2DB9  ff         RST 0x38
*          2DBA  ff         RST 0x38
*          2DBB  ff         RST 0x38
*          2DBC  ff         RST 0x38
*          2DBD  ff         RST 0x38
*          2DBE  ff         RST 0x38
*          2DBF  ff         RST 0x38
*          2DC0  ff         RST 0x38
*          2DC1  ff         RST 0x38
*          2DC2  ff         RST 0x38
*          2DC3  ff         RST 0x38
*          2DC4  ff         RST 0x38
*          2DC5  ff         RST 0x38
*          2DC6  ff         RST 0x38
*          2DC7  ff         RST 0x38
*          2DC8  ff         RST 0x38
*          2DC9  ff         RST 0x38
*          2DCA  ff         RST 0x38
*          2DCB  ff         RST 0x38
*          2DCC  ff         RST 0x38
*          2DCD  ff         RST 0x38
*          2DCE  ff         RST 0x38
*          2DCF  ff         RST 0x38
*          2DD0  ff         RST 0x38
*          2DD1  ff         RST 0x38
*          2DD2  ff         RST 0x38
*          2DD3  ff         RST 0x38
*          2DD4  ff         RST 0x38
*          2DD5  ff         RST 0x38
*          2DD6  ff         RST 0x38
*          2DD7  ff         RST 0x38
*          2DD8  ff         RST 0x38
*          2DD9  ff         RST 0x38
*          2DDA  ff         RST 0x38
*          2DDB  ff         RST 0x38
*          2DDC  ff         RST 0x38
*          2DDD  ff         RST 0x38
*          2DDE  ff         RST 0x38
*          2DDF  ff         RST 0x38
*          2DE0  ff         RST 0x38
*          2DE1  ff         RST 0x38
*          2DE2  ff         RST 0x38
*          2DE3  ff         RST 0x38
*          2DE4  ff         RST 0x38
*          2DE5  ff         RST 0x38
*          2DE6  ff         RST 0x38
*          2DE7  ff         RST 0x38
*          2DE8  ff         RST 0x38
*          2DE9  ff         RST 0x38
*          2DEA  ff         RST 0x38
*          2DEB  ff         RST 0x38
*          2DEC  ff         RST 0x38
*          2DED  ff         RST 0x38
*          2DEE  ff         RST 0x38
*          2DEF  ff         RST 0x38
*          2DF0  ff         RST 0x38
*          2DF1  ff         RST 0x38
*          2DF2  ff         RST 0x38
*          2DF3  ff         RST 0x38
*          2DF4  ff         RST 0x38
*          2DF5  ff         RST 0x38
*          2DF6  ff         RST 0x38
*          2DF7  ff         RST 0x38
*          2DF8  ff         RST 0x38
*          2DF9  ff         RST 0x38
*          2DFA  ff         RST 0x38
*          2DFB  ff         RST 0x38
*          2DFC  ff         RST 0x38
*          2DFD  ff         RST 0x38
*          2DFE  ff         RST 0x38
*          2DFF  ff         RST 0x38
*          2E00  ff         RST 0x38
*          2E01  ff         RST 0x38
*          2E02  ff         RST 0x38
*          2E03  ff         RST 0x38
*          2E04  ff         RST 0x38
*          2E05  ff         RST 0x38
*          2E06  ff         RST 0x38
*          2E07  ff         RST 0x38
*          2E08  ff         RST 0x38
*          2E09  ff         RST 0x38
*          2E0A  ff         RST 0x38
*          2E0B  ff         RST 0x38
*          2E0C  ff         RST 0x38
*          2E0D  ff         RST 0x38
*          2E0E  ff         RST 0x38
*          2E0F  ff         RST 0x38
*          2E10  ff         RST 0x38
*          2E11  ff         RST 0x38
*          2E12  ff         RST 0x38
*          2E13  ff         RST 0x38
*          2E14  ff         RST 0x38
*          2E15  ff         RST 0x38
*          2E16  ff         RST 0x38
*          2E17  ff         RST 0x38
*          2E18  ff         RST 0x38
*          2E19  ff         RST 0x38
*          2E1A  ff         RST 0x38
*          2E1B  ff         RST 0x38
*          2E1C  ff         RST 0x38
*          2E1D  ff         RST 0x38
*          2E1E  ff         RST 0x38
*          2E1F  ff         RST 0x38
*          2E20  ff         RST 0x38
*  L_2E21: 2E21  ff         RST 0x38
*          2E22  ff         RST 0x38
*          2E23  ff         RST 0x38
*          2E24  ff         RST 0x38
*          2E25  ff         RST 0x38
*          2E26  ff         RST 0x38
*          2E27  ff         RST 0x38
*          2E28  ff         RST 0x38
*          2E29  ff         RST 0x38
*          2E2A  ff         RST 0x38
*          2E2B  ff         RST 0x38
*          2E2C  ff         RST 0x38
*          2E2D  ff         RST 0x38
*          2E2E  ff         RST 0x38
*          2E2F  ff         RST 0x38
*          2E30  ff         RST 0x38
*          2E31  ff         RST 0x38
*          2E32  ff         RST 0x38
*          2E33  ff         RST 0x38
*          2E34  ff         RST 0x38
*          2E35  ff         RST 0x38
*          2E36  ff         RST 0x38
*          2E37  ff         RST 0x38
*          2E38  ff         RST 0x38
*          2E39  ff         RST 0x38
*          2E3A  ff         RST 0x38
*          2E3B  ff         RST 0x38
*          2E3C  ff         RST 0x38
*          2E3D  ff         RST 0x38
*          2E3E  ff         RST 0x38
*          2E3F  ff         RST 0x38
*          2E40  ff         RST 0x38
*          2E41  ff         RST 0x38
*          2E42  ff         RST 0x38
*          2E43  ff         RST 0x38
*          2E44  ff         RST 0x38
*          2E45  ff         RST 0x38
*          2E46  ff         RST 0x38
*          2E47  ff         RST 0x38
*          2E48  ff         RST 0x38
*          2E49  ff         RST 0x38
*          2E4A  ff         RST 0x38
*          2E4B  ff         RST 0x38
*          2E4C  ff         RST 0x38
*          2E4D  ff         RST 0x38
*          2E4E  ff         RST 0x38
*          2E4F  ff         RST 0x38
*          2E50  ff         RST 0x38
*          2E51  ff         RST 0x38
*          2E52  ff         RST 0x38
*          2E53  ff         RST 0x38
*          2E54  ff         RST 0x38
*          2E55  ff         RST 0x38
*          2E56  ff         RST 0x38
*          2E57  ff         RST 0x38
*          2E58  ff         RST 0x38
*          2E59  ff         RST 0x38
*          2E5A  ff         RST 0x38
*          2E5B  ff         RST 0x38
*          2E5C  ff         RST 0x38
*          2E5D  ff         RST 0x38
*          2E5E  ff         RST 0x38
*          2E5F  ff         RST 0x38
*          2E60  ff         RST 0x38
*          2E61  ff         RST 0x38
*          2E62  ff         RST 0x38
*          2E63  ff         RST 0x38
*          2E64  ff         RST 0x38
*          2E65  ff         RST 0x38
*          2E66  ff         RST 0x38
*          2E67  ff         RST 0x38
*          2E68  ff         RST 0x38
*          2E69  ff         RST 0x38
*          2E6A  ff         RST 0x38
*          2E6B  ff         RST 0x38
*          2E6C  ff         RST 0x38
*          2E6D  ff         RST 0x38
*          2E6E  ff         RST 0x38
*          2E6F  ff         RST 0x38
*          2E70  ff         RST 0x38
*          2E71  ff         RST 0x38
*          2E72  ff         RST 0x38
*          2E73  ff         RST 0x38
*          2E74  ff         RST 0x38
*          2E75  ff         RST 0x38
*          2E76  ff         RST 0x38
*          2E77  ff         RST 0x38
*          2E78  ff         RST 0x38
*          2E79  ff         RST 0x38
*          2E7A  ff         RST 0x38
*          2E7B  ff         RST 0x38
*          2E7C  ff         RST 0x38
*          2E7D  ff         RST 0x38
*          2E7E  ff         RST 0x38
*          2E7F  ff         RST 0x38
*          2E80  ff         RST 0x38
*          2E81  ff         RST 0x38
*          2E82  ff         RST 0x38
*          2E83  ff         RST 0x38
*          2E84  ff         RST 0x38
*          2E85  ff         RST 0x38
*          2E86  ff         RST 0x38
*          2E87  ff         RST 0x38
*          2E88  ff         RST 0x38
*          2E89  ff         RST 0x38
*          2E8A  ff         RST 0x38
*          2E8B  ff         RST 0x38
*          2E8C  ff         RST 0x38
*          2E8D  ff         RST 0x38
*          2E8E  ff         RST 0x38
*          2E8F  ff         RST 0x38
*          2E90  ff         RST 0x38
*          2E91  ff         RST 0x38
*          2E92  ff         RST 0x38
*          2E93  ff         RST 0x38
*          2E94  ff         RST 0x38
*          2E95  ff         RST 0x38
*          2E96  ff         RST 0x38
*          2E97  ff         RST 0x38
*          2E98  ff         RST 0x38
*          2E99  ff         RST 0x38
*          2E9A  ff         RST 0x38
*          2E9B  ff         RST 0x38
*          2E9C  ff         RST 0x38
*          2E9D  ff         RST 0x38
*          2E9E  ff         RST 0x38
*          2E9F  ff         RST 0x38
*          2EA0  ff         RST 0x38
*          2EA1  ff         RST 0x38
*          2EA2  ff         RST 0x38
*          2EA3  ff         RST 0x38
*          2EA4  ff         RST 0x38
*          2EA5  ff         RST 0x38
*          2EA6  ff         RST 0x38
*          2EA7  ff         RST 0x38
*          2EA8  ff         RST 0x38
*          2EA9  ff         RST 0x38
*          2EAA  ff         RST 0x38
*          2EAB  ff         RST 0x38
*          2EAC  ff         RST 0x38
*          2EAD  ff         RST 0x38
*          2EAE  ff         RST 0x38
*          2EAF  ff         RST 0x38
*          2EB0  ff         RST 0x38
*          2EB1  ff         RST 0x38
*          2EB2  ff         RST 0x38
*          2EB3  ff         RST 0x38
*          2EB4  ff         RST 0x38
*          2EB5  ff         RST 0x38
*          2EB6  ff         RST 0x38
*          2EB7  ff         RST 0x38
*          2EB8  ff         RST 0x38
*          2EB9  ff         RST 0x38
*          2EBA  ff         RST 0x38
*          2EBB  ff         RST 0x38
*          2EBC  ff         RST 0x38
*          2EBD  ff         RST 0x38
*          2EBE  ff         RST 0x38
*          2EBF  ff         RST 0x38
*          2EC0  ff         RST 0x38
*          2EC1  ff         RST 0x38
*          2EC2  ff         RST 0x38
*          2EC3  ff         RST 0x38
*          2EC4  ff         RST 0x38
*          2EC5  ff         RST 0x38
*          2EC6  ff         RST 0x38
*          2EC7  ff         RST 0x38
*          2EC8  ff         RST 0x38
*          2EC9  ff         RST 0x38
*          2ECA  ff         RST 0x38
*          2ECB  ff         RST 0x38
*          2ECC  ff         RST 0x38
*          2ECD  ff         RST 0x38
*          2ECE  ff         RST 0x38
*          2ECF  ff         RST 0x38
*          2ED0  ff         RST 0x38
*          2ED1  ff         RST 0x38
*          2ED2  ff         RST 0x38
*          2ED3  ff         RST 0x38
*          2ED4  ff         RST 0x38
*          2ED5  ff         RST 0x38
*          2ED6  ff         RST 0x38
*          2ED7  ff         RST 0x38
*          2ED8  ff         RST 0x38
*          2ED9  ff         RST 0x38
*          2EDA  ff         RST 0x38
*          2EDB  ff         RST 0x38
*          2EDC  ff         RST 0x38
*          2EDD  ff         RST 0x38
*          2EDE  ff         RST 0x38
*          2EDF  ff         RST 0x38
*          2EE0  ff         RST 0x38
*          2EE1  ff         RST 0x38
*          2EE2  ff         RST 0x38
*          2EE3  ff         RST 0x38
*          2EE4  ff         RST 0x38
*          2EE5  ff         RST 0x38
*          2EE6  ff         RST 0x38
*          2EE7  ff         RST 0x38
*          2EE8  ff         RST 0x38
*          2EE9  ff         RST 0x38
*          2EEA  ff         RST 0x38
*          2EEB  ff         RST 0x38
*          2EEC  ff         RST 0x38
*          2EED  ff         RST 0x38
*          2EEE  ff         RST 0x38
*          2EEF  ff         RST 0x38
*          2EF0  ff         RST 0x38
*          2EF1  ff         RST 0x38
*          2EF2  ff         RST 0x38
*          2EF3  ff         RST 0x38
*          2EF4  ff         RST 0x38
*          2EF5  ff         RST 0x38
*          2EF6  ff         RST 0x38
*          2EF7  ff         RST 0x38
*          2EF8  ff         RST 0x38
*          2EF9  ff         RST 0x38
*          2EFA  ff         RST 0x38
*          2EFB  ff         RST 0x38
*          2EFC  ff         RST 0x38
*          2EFD  ff         RST 0x38
*          2EFE  ff         RST 0x38
*          2EFF  ff         RST 0x38
*          2F00  ff         RST 0x38
*          2F01  ff         RST 0x38
*          2F02  ff         RST 0x38
*          2F03  ff         RST 0x38
*          2F04  ff         RST 0x38
*          2F05  ff         RST 0x38
*          2F06  ff         RST 0x38
*          2F07  ff         RST 0x38
*          2F08  ff         RST 0x38
*          2F09  ff         RST 0x38
*          2F0A  ff         RST 0x38
*          2F0B  ff         RST 0x38
*          2F0C  ff         RST 0x38
*          2F0D  ff         RST 0x38
*          2F0E  ff         RST 0x38
*          2F0F  ff         RST 0x38
*          2F10  ff         RST 0x38
*          2F11  ff         RST 0x38
*          2F12  ff         RST 0x38
*          2F13  ff         RST 0x38
*          2F14  ff         RST 0x38
*          2F15  ff         RST 0x38
*          2F16  ff         RST 0x38
*          2F17  ff         RST 0x38
*          2F18  ff         RST 0x38
*          2F19  ff         RST 0x38
*          2F1A  ff         RST 0x38
*          2F1B  ff         RST 0x38
*          2F1C  ff         RST 0x38
*          2F1D  ff         RST 0x38
*          2F1E  ff         RST 0x38
*          2F1F  ff         RST 0x38
*          2F20  ff         RST 0x38
*          2F21  ff         RST 0x38
*          2F22  ff         RST 0x38
*          2F23  ff         RST 0x38
*          2F24  ff         RST 0x38
*          2F25  ff         RST 0x38
*          2F26  ff         RST 0x38
*          2F27  ff         RST 0x38
*          2F28  ff         RST 0x38
*          2F29  ff         RST 0x38
*          2F2A  ff         RST 0x38
*          2F2B  ff         RST 0x38
*          2F2C  ff         RST 0x38
*          2F2D  ff         RST 0x38
*          2F2E  ff         RST 0x38
*          2F2F  ff         RST 0x38
*          2F30  ff         RST 0x38
*          2F31  ff         RST 0x38
*          2F32  ff         RST 0x38
*          2F33  ff         RST 0x38
*          2F34  ff         RST 0x38
*          2F35  ff         RST 0x38
*          2F36  ff         RST 0x38
*          2F37  ff         RST 0x38
*          2F38  ff         RST 0x38
*          2F39  ff         RST 0x38
*          2F3A  ff         RST 0x38
*          2F3B  ff         RST 0x38
*          2F3C  ff         RST 0x38
*          2F3D  ff         RST 0x38
*          2F3E  ff         RST 0x38
*          2F3F  ff         RST 0x38
*          2F40  ff         RST 0x38
*          2F41  ff         RST 0x38
*          2F42  ff         RST 0x38
*          2F43  ff         RST 0x38
*          2F44  ff         RST 0x38
*          2F45  ff         RST 0x38
*          2F46  ff         RST 0x38
*          2F47  ff         RST 0x38
*          2F48  ff         RST 0x38
*          2F49  ff         RST 0x38
*          2F4A  ff         RST 0x38
*          2F4B  ff         RST 0x38
*          2F4C  ff         RST 0x38
*          2F4D  ff         RST 0x38
*          2F4E  ff         RST 0x38
*          2F4F  ff         RST 0x38
*          2F50  ff         RST 0x38
*          2F51  ff         RST 0x38
*          2F52  ff         RST 0x38
*          2F53  ff         RST 0x38
*          2F54  ff         RST 0x38
*          2F55  ff         RST 0x38
*          2F56  ff         RST 0x38
*          2F57  ff         RST 0x38
*          2F58  ff         RST 0x38
*          2F59  ff         RST 0x38
*          2F5A  ff         RST 0x38
*          2F5B  ff         RST 0x38
*          2F5C  ff         RST 0x38
*          2F5D  ff         RST 0x38
*          2F5E  ff         RST 0x38
*          2F5F  ff         RST 0x38
*          2F60  ff         RST 0x38
*          2F61  ff         RST 0x38
*          2F62  ff         RST 0x38
*          2F63  ff         RST 0x38
*          2F64  ff         RST 0x38
*          2F65  ff         RST 0x38
*          2F66  ff         RST 0x38
*          2F67  ff         RST 0x38
*          2F68  ff         RST 0x38
*          2F69  ff         RST 0x38
*          2F6A  ff         RST 0x38
*          2F6B  ff         RST 0x38
*          2F6C  ff         RST 0x38
*          2F6D  ff         RST 0x38
*          2F6E  ff         RST 0x38
*          2F6F  ff         RST 0x38
*          2F70  ff         RST 0x38
*          2F71  ff         RST 0x38
*          2F72  ff         RST 0x38
*          2F73  ff         RST 0x38
*          2F74  ff         RST 0x38
*          2F75  ff         RST 0x38
*          2F76  ff         RST 0x38
*          2F77  ff         RST 0x38
*          2F78  ff         RST 0x38
*          2F79  ff         RST 0x38
*          2F7A  ff         RST 0x38
*          2F7B  ff         RST 0x38
*          2F7C  ff         RST 0x38
*          2F7D  ff         RST 0x38
*          2F7E  ff         RST 0x38
*          2F7F  ff         RST 0x38
*          2F80  ff         RST 0x38
*          2F81  ff         RST 0x38
*          2F82  ff         RST 0x38
*          2F83  ff         RST 0x38
*          2F84  ff         RST 0x38
*          2F85  ff         RST 0x38
*          2F86  ff         RST 0x38
*          2F87  ff         RST 0x38
*          2F88  ff         RST 0x38
*          2F89  ff         RST 0x38
*          2F8A  ff         RST 0x38
*          2F8B  ff         RST 0x38
*          2F8C  ff         RST 0x38
*          2F8D  ff         RST 0x38
*          2F8E  ff         RST 0x38
*          2F8F  ff         RST 0x38
*          2F90  ff         RST 0x38
*          2F91  ff         RST 0x38
*          2F92  ff         RST 0x38
*          2F93  ff         RST 0x38
*          2F94  ff         RST 0x38
*          2F95  ff         RST 0x38
*          2F96  ff         RST 0x38
*          2F97  ff         RST 0x38
*          2F98  ff         RST 0x38
*          2F99  ff         RST 0x38
*          2F9A  ff         RST 0x38
*          2F9B  ff         RST 0x38
*          2F9C  ff         RST 0x38
*          2F9D  ff         RST 0x38
*          2F9E  ff         RST 0x38
*          2F9F  ff         RST 0x38
*          2FA0  ff         RST 0x38
*          2FA1  ff         RST 0x38
*          2FA2  ff         RST 0x38
*          2FA3  ff         RST 0x38
*          2FA4  ff         RST 0x38
*          2FA5  ff         RST 0x38
*          2FA6  ff         RST 0x38
*          2FA7  ff         RST 0x38
*          2FA8  ff         RST 0x38
*          2FA9  ff         RST 0x38
*          2FAA  ff         RST 0x38
*          2FAB  ff         RST 0x38
*          2FAC  ff         RST 0x38
*          2FAD  ff         RST 0x38
*          2FAE  ff         RST 0x38
*          2FAF  ff         RST 0x38
*          2FB0  ff         RST 0x38
*          2FB1  ff         RST 0x38
*          2FB2  ff         RST 0x38
*          2FB3  ff         RST 0x38
*          2FB4  ff         RST 0x38
*          2FB5  ff         RST 0x38
*          2FB6  ff         RST 0x38
*          2FB7  ff         RST 0x38
*          2FB8  ff         RST 0x38
*          2FB9  ff         RST 0x38
*          2FBA  ff         RST 0x38
*          2FBB  ff         RST 0x38
*          2FBC  ff         RST 0x38
*          2FBD  ff         RST 0x38
*          2FBE  ff         RST 0x38
*          2FBF  ff         RST 0x38
*          2FC0  ff         RST 0x38
*          2FC1  ff         RST 0x38
*          2FC2  ff         RST 0x38
*          2FC3  ff         RST 0x38
*          2FC4  ff         RST 0x38
*          2FC5  ff         RST 0x38
*          2FC6  ff         RST 0x38
*          2FC7  ff         RST 0x38
*          2FC8  ff         RST 0x38
*          2FC9  ff         RST 0x38
*          2FCA  ff         RST 0x38
*          2FCB  ff         RST 0x38
*          2FCC  ff         RST 0x38
*          2FCD  ff         RST 0x38
*          2FCE  ff         RST 0x38
*          2FCF  ff         RST 0x38
*          2FD0  ff         RST 0x38
*          2FD1  ff         RST 0x38
*          2FD2  ff         RST 0x38
*          2FD3  ff         RST 0x38
*          2FD4  ff         RST 0x38
*          2FD5  ff         RST 0x38
*          2FD6  ff         RST 0x38
*          2FD7  ff         RST 0x38
*          2FD8  ff         RST 0x38
*          2FD9  ff         RST 0x38
*          2FDA  ff         RST 0x38
*          2FDB  ff         RST 0x38
*          2FDC  ff         RST 0x38
*          2FDD  ff         RST 0x38
*          2FDE  ff         RST 0x38
*          2FDF  ff         RST 0x38
*          2FE0  ff         RST 0x38
*          2FE1  ff         RST 0x38
*          2FE2  ff         RST 0x38
*          2FE3  ff         RST 0x38
*          2FE4  ff         RST 0x38
*          2FE5  ff         RST 0x38
*          2FE6  ff         RST 0x38
*          2FE7  ff         RST 0x38
*          2FE8  ff         RST 0x38
*          2FE9  ff         RST 0x38
*          2FEA  ff         RST 0x38
*          2FEB  ff         RST 0x38
*          2FEC  ff         RST 0x38
*          2FED  ff         RST 0x38
*          2FEE  ff         RST 0x38
*          2FEF  ff         RST 0x38
*          2FF0  ff         RST 0x38
*          2FF1  ff         RST 0x38
*          2FF2  ff         RST 0x38
*          2FF3  ff         RST 0x38
*          2FF4  ff         RST 0x38
*          2FF5  ff         RST 0x38
*          2FF6  ff         RST 0x38
*          2FF7  ff         RST 0x38
*          2FF8  ff         RST 0x38
*          2FF9  ff         RST 0x38
*          2FFA  ff         RST 0x38
*          2FFB  ff         RST 0x38
*          2FFC  ff         RST 0x38
*          2FFD  ff         RST 0x38
*          2FFE  ff         RST 0x38
*          2FFF  ff         RST 0x38
*          3000  ff         RST 0x38
*          3001  ff         RST 0x38
*          3002  ff         RST 0x38
*          3003  ff         RST 0x38
*          3004  ff         RST 0x38
*          3005  ff         RST 0x38
*          3006  ff         RST 0x38
*          3007  ff         RST 0x38
*          3008  ff         RST 0x38
*          3009  ff         RST 0x38
*          300A  ff         RST 0x38
*          300B  ff         RST 0x38
*          300C  ff         RST 0x38
*          300D  ff         RST 0x38
*          300E  ff         RST 0x38
*          300F  ff         RST 0x38
*          3010  ff         RST 0x38
*          3011  ff         RST 0x38
*          3012  ff         RST 0x38
*          3013  ff         RST 0x38
*          3014  ff         RST 0x38
*          3015  ff         RST 0x38
*          3016  ff         RST 0x38
*          3017  ff         RST 0x38
*          3018  ff         RST 0x38
*          3019  ff         RST 0x38
*          301A  ff         RST 0x38
*          301B  ff         RST 0x38
*          301C  ff         RST 0x38
*          301D  ff         RST 0x38
*          301E  ff         RST 0x38
*          301F  ff         RST 0x38
*          3020  ff         RST 0x38
*          3021  ff         RST 0x38
*          3022  ff         RST 0x38
*          3023  ff         RST 0x38
*          3024  ff         RST 0x38
*          3025  ff         RST 0x38
*          3026  ff         RST 0x38
*          3027  ff         RST 0x38
*          3028  ff         RST 0x38
*          3029  ff         RST 0x38
*          302A  ff         RST 0x38
*          302B  ff         RST 0x38
*          302C  ff         RST 0x38
*          302D  ff         RST 0x38
*          302E  ff         RST 0x38
*          302F  ff         RST 0x38
*          3030  ff         RST 0x38
*          3031  ff         RST 0x38
*          3032  ff         RST 0x38
*          3033  ff         RST 0x38
*          3034  ff         RST 0x38
*          3035  ff         RST 0x38
*          3036  ff         RST 0x38
*          3037  ff         RST 0x38
*          3038  ff         RST 0x38
*          3039  ff         RST 0x38
*          303A  ff         RST 0x38
*          303B  ff         RST 0x38
*          303C  ff         RST 0x38
*          303D  ff         RST 0x38
*          303E  ff         RST 0x38
*          303F  ff         RST 0x38
*          3040  ff         RST 0x38
*          3041  ff         RST 0x38
*          3042  ff         RST 0x38
*          3043  ff         RST 0x38
*          3044  ff         RST 0x38
*          3045  ff         RST 0x38
*          3046  ff         RST 0x38
*          3047  ff         RST 0x38
*          3048  ff         RST 0x38
*          3049  ff         RST 0x38
*          304A  ff         RST 0x38
*          304B  ff         RST 0x38
*          304C  ff         RST 0x38
*          304D  ff         RST 0x38
*          304E  ff         RST 0x38
*          304F  ff         RST 0x38
*          3050  ff         RST 0x38
*          3051  ff         RST 0x38
*          3052  ff         RST 0x38
*          3053  ff         RST 0x38
*          3054  ff         RST 0x38
*          3055  ff         RST 0x38
*          3056  ff         RST 0x38
*          3057  ff         RST 0x38
*          3058  ff         RST 0x38
*          3059  ff         RST 0x38
*          305A  ff         RST 0x38
*          305B  ff         RST 0x38
*          305C  ff         RST 0x38
*  L_305D: 305D  ff         RST 0x38
*          305E  ff         RST 0x38
*          305F  ff         RST 0x38
*          3060  ff         RST 0x38
*          3061  ff         RST 0x38
*          3062  ff         RST 0x38
*          3063  ff         RST 0x38
*          3064  ff         RST 0x38
*          3065  ff         RST 0x38
*          3066  ff         RST 0x38
*          3067  ff         RST 0x38
*          3068  ff         RST 0x38
*          3069  ff         RST 0x38
*          306A  ff         RST 0x38
*          306B  ff         RST 0x38
*          306C  ff         RST 0x38
*          306D  ff         RST 0x38
*          306E  ff         RST 0x38
*          306F  ff         RST 0x38
*          3070  ff         RST 0x38
*          3071  ff         RST 0x38
*          3072  ff         RST 0x38
*          3073  ff         RST 0x38
*          3074  ff         RST 0x38
*          3075  ff         RST 0x38
*          3076  ff         RST 0x38
*          3077  ff         RST 0x38
*          3078  ff         RST 0x38
*          3079  ff         RST 0x38
*          307A  ff         RST 0x38
*          307B  ff         RST 0x38
*          307C  ff         RST 0x38
*          307D  ff         RST 0x38
*          307E  ff         RST 0x38
*          307F  ff         RST 0x38
*          3080  ff         RST 0x38
*          3081  ff         RST 0x38
*          3082  ff         RST 0x38
*          3083  ff         RST 0x38
*          3084  ff         RST 0x38
*          3085  ff         RST 0x38
*          3086  ff         RST 0x38
*          3087  ff         RST 0x38
*          3088  ff         RST 0x38
*          3089  ff         RST 0x38
*          308A  ff         RST 0x38
*          308B  ff         RST 0x38
*          308C  ff         RST 0x38
*          308D  ff         RST 0x38
*          308E  ff         RST 0x38
*          308F  ff         RST 0x38
*          3090  ff         RST 0x38
*          3091  ff         RST 0x38
*          3092  ff         RST 0x38
*          3093  ff         RST 0x38
*          3094  ff         RST 0x38
*          3095  ff         RST 0x38
*          3096  ff         RST 0x38
*          3097  ff         RST 0x38
*          3098  ff         RST 0x38
*          3099  ff         RST 0x38
*          309A  ff         RST 0x38
*          309B  ff         RST 0x38
*          309C  ff         RST 0x38
*          309D  ff         RST 0x38
*          309E  ff         RST 0x38
*          309F  ff         RST 0x38
*          30A0  ff         RST 0x38
*          30A1  ff         RST 0x38
*          30A2  ff         RST 0x38
*          30A3  ff         RST 0x38
*          30A4  ff         RST 0x38
*          30A5  ff         RST 0x38
*          30A6  ff         RST 0x38
*          30A7  ff         RST 0x38
*          30A8  ff         RST 0x38
*          30A9  ff         RST 0x38
*          30AA  ff         RST 0x38
*          30AB  ff         RST 0x38
*          30AC  ff         RST 0x38
*          30AD  ff         RST 0x38
*          30AE  ff         RST 0x38
*          30AF  ff         RST 0x38
*          30B0  ff         RST 0x38
*          30B1  ff         RST 0x38
*          30B2  ff         RST 0x38
*          30B3  ff         RST 0x38
*          30B4  ff         RST 0x38
*          30B5  ff         RST 0x38
*          30B6  ff         RST 0x38
*          30B7  ff         RST 0x38
*          30B8  ff         RST 0x38
*          30B9  ff         RST 0x38
*          30BA  ff         RST 0x38
*          30BB  ff         RST 0x38
*          30BC  ff         RST 0x38
*          30BD  ff         RST 0x38
*          30BE  ff         RST 0x38
*          30BF  ff         RST 0x38
*          30C0  ff         RST 0x38
*          30C1  ff         RST 0x38
*          30C2  ff         RST 0x38
*          30C3  ff         RST 0x38
*          30C4  ff         RST 0x38
*          30C5  ff         RST 0x38
*          30C6  ff         RST 0x38
*          30C7  ff         RST 0x38
*          30C8  ff         RST 0x38
*          30C9  ff         RST 0x38
*          30CA  ff         RST 0x38
*          30CB  ff         RST 0x38
*          30CC  ff         RST 0x38
*          30CD  ff         RST 0x38
*          30CE  ff         RST 0x38
*          30CF  ff         RST 0x38
*          30D0  ff         RST 0x38
*          30D1  ff         RST 0x38
*          30D2  ff         RST 0x38
*          30D3  ff         RST 0x38
*          30D4  ff         RST 0x38
*          30D5  ff         RST 0x38
*          30D6  ff         RST 0x38
*          30D7  ff         RST 0x38
*          30D8  ff         RST 0x38
*          30D9  ff         RST 0x38
*          30DA  ff         RST 0x38
*          30DB  ff         RST 0x38
*          30DC  ff         RST 0x38
*          30DD  ff         RST 0x38
*          30DE  ff         RST 0x38
*          30DF  ff         RST 0x38
*          30E0  ff         RST 0x38
*          30E1  ff         RST 0x38
*          30E2  ff         RST 0x38
*          30E3  ff         RST 0x38
*          30E4  ff         RST 0x38
*          30E5  ff         RST 0x38
*          30E6  ff         RST 0x38
*          30E7  ff         RST 0x38
*          30E8  ff         RST 0x38
*          30E9  ff         RST 0x38
*          30EA  ff         RST 0x38
*          30EB  ff         RST 0x38
*          30EC  ff         RST 0x38
*          30ED  ff         RST 0x38
*          30EE  ff         RST 0x38
*          30EF  ff         RST 0x38
*          30F0  ff         RST 0x38
*          30F1  ff         RST 0x38
*          30F2  ff         RST 0x38
*          30F3  ff         RST 0x38
*          30F4  ff         RST 0x38
*          30F5  ff         RST 0x38
*          30F6  ff         RST 0x38
*          30F7  ff         RST 0x38
*          30F8  ff         RST 0x38
*          30F9  ff         RST 0x38
*          30FA  ff         RST 0x38
*          30FB  ff         RST 0x38
*          30FC  ff         RST 0x38
*          30FD  ff         RST 0x38
*          30FE  ff         RST 0x38
*          30FF  ff         RST 0x38
*          3100  ff         RST 0x38
*          3101  ff         RST 0x38
*          3102  ff         RST 0x38
*          3103  ff         RST 0x38
*          3104  ff         RST 0x38
*          3105  ff         RST 0x38
*          3106  ff         RST 0x38
*          3107  ff         RST 0x38
*          3108  ff         RST 0x38
*          3109  ff         RST 0x38
*          310A  ff         RST 0x38
*          310B  ff         RST 0x38
*          310C  ff         RST 0x38
*          310D  ff         RST 0x38
*          310E  ff         RST 0x38
*          310F  ff         RST 0x38
*          3110  ff         RST 0x38
*          3111  ff         RST 0x38
*          3112  ff         RST 0x38
*          3113  ff         RST 0x38
*          3114  ff         RST 0x38
*          3115  ff         RST 0x38
*          3116  ff         RST 0x38
*          3117  ff         RST 0x38
*          3118  ff         RST 0x38
*          3119  ff         RST 0x38
*          311A  ff         RST 0x38
*          311B  ff         RST 0x38
*          311C  ff         RST 0x38
*          311D  ff         RST 0x38
*          311E  ff         RST 0x38
*          311F  ff         RST 0x38
*          3120  ff         RST 0x38
*          3121  ff         RST 0x38
*          3122  ff         RST 0x38
*          3123  ff         RST 0x38
*          3124  ff         RST 0x38
*          3125  ff         RST 0x38
*          3126  ff         RST 0x38
*          3127  ff         RST 0x38
*          3128  ff         RST 0x38
*          3129  ff         RST 0x38
*          312A  ff         RST 0x38
*          312B  ff         RST 0x38
*          312C  ff         RST 0x38
*          312D  ff         RST 0x38
*          312E  ff         RST 0x38
*          312F  ff         RST 0x38
*          3130  ff         RST 0x38
*          3131  ff         RST 0x38
*          3132  ff         RST 0x38
*          3133  ff         RST 0x38
*          3134  ff         RST 0x38
*          3135  ff         RST 0x38
*          3136  ff         RST 0x38
*          3137  ff         RST 0x38
*          3138  ff         RST 0x38
*          3139  ff         RST 0x38
*          313A  ff         RST 0x38
*          313B  ff         RST 0x38
*          313C  ff         RST 0x38
*          313D  ff         RST 0x38
*          313E  ff         RST 0x38
*          313F  ff         RST 0x38
*          3140  ff         RST 0x38
*          3141  ff         RST 0x38
*          3142  ff         RST 0x38
*          3143  ff         RST 0x38
*          3144  ff         RST 0x38
*          3145  ff         RST 0x38
*          3146  ff         RST 0x38
*          3147  ff         RST 0x38
*          3148  ff         RST 0x38
*          3149  ff         RST 0x38
*          314A  ff         RST 0x38
*          314B  ff         RST 0x38
*          314C  ff         RST 0x38
*          314D  ff         RST 0x38
*          314E  ff         RST 0x38
*          314F  ff         RST 0x38
*          3150  ff         RST 0x38
*          3151  ff         RST 0x38
*          3152  ff         RST 0x38
*          3153  ff         RST 0x38
*          3154  ff         RST 0x38
*          3155  ff         RST 0x38
*          3156  ff         RST 0x38
*          3157  ff         RST 0x38
*          3158  ff         RST 0x38
*          3159  ff         RST 0x38
*          315A  ff         RST 0x38
*          315B  ff         RST 0x38
*          315C  ff         RST 0x38
*          315D  ff         RST 0x38
*          315E  ff         RST 0x38
*          315F  ff         RST 0x38
*          3160  ff         RST 0x38
*          3161  ff         RST 0x38
*          3162  ff         RST 0x38
*          3163  ff         RST 0x38
*          3164  ff         RST 0x38
*          3165  ff         RST 0x38
*          3166  ff         RST 0x38
*          3167  ff         RST 0x38
*          3168  ff         RST 0x38
*          3169  ff         RST 0x38
*          316A  ff         RST 0x38
*          316B  ff         RST 0x38
*          316C  ff         RST 0x38
*          316D  ff         RST 0x38
*          316E  ff         RST 0x38
*          316F  ff         RST 0x38
*          3170  ff         RST 0x38
*          3171  ff         RST 0x38
*          3172  ff         RST 0x38
*          3173  ff         RST 0x38
*          3174  ff         RST 0x38
*          3175  ff         RST 0x38
*          3176  ff         RST 0x38
*          3177  ff         RST 0x38
*          3178  ff         RST 0x38
*          3179  ff         RST 0x38
*          317A  ff         RST 0x38
*          317B  ff         RST 0x38
*          317C  ff         RST 0x38
*          317D  ff         RST 0x38
*          317E  ff         RST 0x38
*          317F  ff         RST 0x38
*          3180  ff         RST 0x38
*          3181  ff         RST 0x38
*          3182  ff         RST 0x38
*          3183  ff         RST 0x38
*          3184  ff         RST 0x38
*          3185  ff         RST 0x38
*          3186  ff         RST 0x38
*          3187  ff         RST 0x38
*          3188  ff         RST 0x38
*          3189  ff         RST 0x38
*          318A  ff         RST 0x38
*          318B  ff         RST 0x38
*          318C  ff         RST 0x38
*          318D  ff         RST 0x38
*          318E  ff         RST 0x38
*          318F  ff         RST 0x38
*          3190  ff         RST 0x38
*          3191  ff         RST 0x38
*          3192  ff         RST 0x38
*          3193  ff         RST 0x38
*          3194  ff         RST 0x38
*          3195  ff         RST 0x38
*          3196  ff         RST 0x38
*          3197  ff         RST 0x38
*          3198  ff         RST 0x38
*          3199  ff         RST 0x38
*          319A  ff         RST 0x38
*          319B  ff         RST 0x38
*          319C  ff         RST 0x38
*          319D  ff         RST 0x38
*          319E  ff         RST 0x38
*          319F  ff         RST 0x38
*          31A0  ff         RST 0x38
*          31A1  ff         RST 0x38
*          31A2  ff         RST 0x38
*          31A3  ff         RST 0x38
*          31A4  ff         RST 0x38
*          31A5  ff         RST 0x38
*          31A6  ff         RST 0x38
*          31A7  ff         RST 0x38
*          31A8  ff         RST 0x38
*          31A9  ff         RST 0x38
*          31AA  ff         RST 0x38
*          31AB  ff         RST 0x38
*          31AC  ff         RST 0x38
*          31AD  ff         RST 0x38
*          31AE  ff         RST 0x38
*          31AF  ff         RST 0x38
*          31B0  ff         RST 0x38
*          31B1  ff         RST 0x38
*          31B2  ff         RST 0x38
*          31B3  ff         RST 0x38
*          31B4  ff         RST 0x38
*          31B5  ff         RST 0x38
*          31B6  ff         RST 0x38
*          31B7  ff         RST 0x38
*          31B8  ff         RST 0x38
*          31B9  ff         RST 0x38
*          31BA  ff         RST 0x38
*          31BB  ff         RST 0x38
*          31BC  ff         RST 0x38
*          31BD  ff         RST 0x38
*          31BE  ff         RST 0x38
*          31BF  ff         RST 0x38
*          31C0  ff         RST 0x38
*          31C1  ff         RST 0x38
*          31C2  ff         RST 0x38
*          31C3  ff         RST 0x38
*          31C4  ff         RST 0x38
*          31C5  ff         RST 0x38
*          31C6  ff         RST 0x38
*          31C7  ff         RST 0x38
*          31C8  ff         RST 0x38
*          31C9  ff         RST 0x38
*          31CA  ff         RST 0x38
*          31CB  ff         RST 0x38
*          31CC  ff         RST 0x38
*          31CD  ff         RST 0x38
*          31CE  ff         RST 0x38
*          31CF  ff         RST 0x38
*          31D0  ff         RST 0x38
*          31D1  ff         RST 0x38
*          31D2  ff         RST 0x38
*          31D3  ff         RST 0x38
*          31D4  ff         RST 0x38
*          31D5  ff         RST 0x38
*          31D6  ff         RST 0x38
*          31D7  ff         RST 0x38
*          31D8  ff         RST 0x38
*          31D9  ff         RST 0x38
*          31DA  ff         RST 0x38
*          31DB  ff         RST 0x38
*          31DC  ff         RST 0x38
*          31DD  ff         RST 0x38
*          31DE  ff         RST 0x38
*          31DF  ff         RST 0x38
*          31E0  ff         RST 0x38
*          31E1  ff         RST 0x38
*          31E2  ff         RST 0x38
*          31E3  ff         RST 0x38
*          31E4  ff         RST 0x38
*          31E5  ff         RST 0x38
*          31E6  ff         RST 0x38
*          31E7  ff         RST 0x38
*          31E8  ff         RST 0x38
*          31E9  ff         RST 0x38
*          31EA  ff         RST 0x38
*          31EB  ff         RST 0x38
*          31EC  ff         RST 0x38
*          31ED  ff         RST 0x38
*          31EE  ff         RST 0x38
*          31EF  ff         RST 0x38
*          31F0  ff         RST 0x38
*          31F1  ff         RST 0x38
*          31F2  ff         RST 0x38
*          31F3  ff         RST 0x38
*          31F4  ff         RST 0x38
*          31F5  ff         RST 0x38
*          31F6  ff         RST 0x38
*          31F7  ff         RST 0x38
*          31F8  ff         RST 0x38
*          31F9  ff         RST 0x38
*          31FA  ff         RST 0x38
*          31FB  ff         RST 0x38
*          31FC  ff         RST 0x38
*          31FD  ff         RST 0x38
*          31FE  ff         RST 0x38
*          31FF  ff         RST 0x38
*          3200  ff         RST 0x38
*          3201  ff         RST 0x38
*          3202  ff         RST 0x38
*          3203  ff         RST 0x38
*          3204  ff         RST 0x38
*          3205  ff         RST 0x38
*          3206  ff         RST 0x38
*          3207  ff         RST 0x38
*          3208  ff         RST 0x38
*          3209  ff         RST 0x38
*          320A  ff         RST 0x38
*          320B  ff         RST 0x38
*          320C  ff         RST 0x38
*          320D  ff         RST 0x38
*          320E  ff         RST 0x38
*          320F  ff         RST 0x38
*          3210  ff         RST 0x38
*          3211  ff         RST 0x38
*          3212  ff         RST 0x38
*          3213  ff         RST 0x38
*          3214  ff         RST 0x38
*          3215  ff         RST 0x38
*          3216  ff         RST 0x38
*          3217  ff         RST 0x38
*          3218  ff         RST 0x38
*          3219  ff         RST 0x38
*          321A  ff         RST 0x38
*          321B  ff         RST 0x38
*          321C  ff         RST 0x38
*          321D  ff         RST 0x38
*          321E  ff         RST 0x38
*          321F  ff         RST 0x38
*          3220  ff         RST 0x38
*          3221  ff         RST 0x38
*          3222  ff         RST 0x38
*          3223  ff         RST 0x38
*          3224  ff         RST 0x38
*          3225  ff         RST 0x38
*          3226  ff         RST 0x38
*          3227  ff         RST 0x38
*          3228  ff         RST 0x38
*          3229  ff         RST 0x38
*          322A  ff         RST 0x38
*          322B  ff         RST 0x38
*          322C  ff         RST 0x38
*          322D  ff         RST 0x38
*          322E  ff         RST 0x38
*          322F  ff         RST 0x38
*          3230  ff         RST 0x38
*          3231  ff         RST 0x38
*          3232  ff         RST 0x38
*          3233  ff         RST 0x38
*          3234  ff         RST 0x38
*          3235  ff         RST 0x38
*          3236  ff         RST 0x38
*          3237  ff         RST 0x38
*          3238  ff         RST 0x38
*          3239  ff         RST 0x38
*          323A  ff         RST 0x38
*          323B  ff         RST 0x38
*          323C  ff         RST 0x38
*          323D  ff         RST 0x38
*          323E  ff         RST 0x38
*          323F  ff         RST 0x38
*          3240  ff         RST 0x38
*          3241  ff         RST 0x38
*          3242  ff         RST 0x38
*          3243  ff         RST 0x38
*          3244  ff         RST 0x38
*          3245  ff         RST 0x38
*          3246  ff         RST 0x38
*          3247  ff         RST 0x38
*          3248  ff         RST 0x38
*          3249  ff         RST 0x38
*          324A  ff         RST 0x38
*          324B  ff         RST 0x38
*          324C  ff         RST 0x38
*          324D  ff         RST 0x38
*          324E  ff         RST 0x38
*          324F  ff         RST 0x38
*          3250  ff         RST 0x38
*          3251  ff         RST 0x38
*          3252  ff         RST 0x38
*          3253  ff         RST 0x38
*          3254  ff         RST 0x38
*          3255  ff         RST 0x38
*          3256  ff         RST 0x38
*          3257  ff         RST 0x38
*          3258  ff         RST 0x38
*          3259  ff         RST 0x38
*          325A  ff         RST 0x38
*          325B  ff         RST 0x38
*          325C  ff         RST 0x38
*          325D  ff         RST 0x38
*          325E  ff         RST 0x38
*          325F  ff         RST 0x38
*          3260  ff         RST 0x38
*          3261  ff         RST 0x38
*          3262  ff         RST 0x38
*          3263  ff         RST 0x38
*          3264  ff         RST 0x38
*          3265  ff         RST 0x38
*          3266  ff         RST 0x38
*          3267  ff         RST 0x38
*          3268  ff         RST 0x38
*          3269  ff         RST 0x38
*          326A  ff         RST 0x38
*          326B  ff         RST 0x38
*          326C  ff         RST 0x38
*          326D  ff         RST 0x38
*          326E  ff         RST 0x38
*          326F  ff         RST 0x38
*          3270  ff         RST 0x38
*          3271  ff         RST 0x38
*          3272  ff         RST 0x38
*          3273  ff         RST 0x38
*          3274  ff         RST 0x38
*          3275  ff         RST 0x38
*          3276  ff         RST 0x38
*          3277  ff         RST 0x38
*          3278  ff         RST 0x38
*          3279  ff         RST 0x38
*          327A  ff         RST 0x38
*          327B  ff         RST 0x38
*          327C  ff         RST 0x38
*          327D  ff         RST 0x38
*          327E  ff         RST 0x38
*          327F  ff         RST 0x38
*          3280  ff         RST 0x38
*          3281  ff         RST 0x38
*          3282  ff         RST 0x38
*          3283  ff         RST 0x38
*          3284  ff         RST 0x38
*          3285  ff         RST 0x38
*          3286  ff         RST 0x38
*          3287  ff         RST 0x38
*          3288  ff         RST 0x38
*          3289  ff         RST 0x38
*          328A  ff         RST 0x38
*          328B  ff         RST 0x38
*          328C  ff         RST 0x38
*          328D  ff         RST 0x38
*          328E  ff         RST 0x38
*          328F  ff         RST 0x38
*          3290  ff         RST 0x38
*          3291  ff         RST 0x38
*          3292  ff         RST 0x38
*          3293  ff         RST 0x38
*          3294  ff         RST 0x38
*          3295  ff         RST 0x38
*          3296  ff         RST 0x38
*          3297  ff         RST 0x38
*          3298  ff         RST 0x38
*          3299  ff         RST 0x38
*          329A  ff         RST 0x38
*          329B  ff         RST 0x38
*          329C  ff         RST 0x38
*          329D  ff         RST 0x38
*          329E  ff         RST 0x38
*          329F  ff         RST 0x38
*          32A0  ff         RST 0x38
*          32A1  ff         RST 0x38
*          32A2  ff         RST 0x38
*          32A3  ff         RST 0x38
*          32A4  ff         RST 0x38
*          32A5  ff         RST 0x38
*          32A6  ff         RST 0x38
*          32A7  ff         RST 0x38
*          32A8  ff         RST 0x38
*          32A9  ff         RST 0x38
*          32AA  ff         RST 0x38
*          32AB  ff         RST 0x38
*          32AC  ff         RST 0x38
*          32AD  ff         RST 0x38
*          32AE  ff         RST 0x38
*          32AF  ff         RST 0x38
*          32B0  ff         RST 0x38
*          32B1  ff         RST 0x38
*          32B2  ff         RST 0x38
*          32B3  ff         RST 0x38
*          32B4  ff         RST 0x38
*          32B5  ff         RST 0x38
*          32B6  ff         RST 0x38
*          32B7  ff         RST 0x38
*          32B8  ff         RST 0x38
*          32B9  ff         RST 0x38
*          32BA  ff         RST 0x38
*          32BB  ff         RST 0x38
*          32BC  ff         RST 0x38
*          32BD  ff         RST 0x38
*          32BE  ff         RST 0x38
*          32BF  ff         RST 0x38
*          32C0  ff         RST 0x38
*          32C1  ff         RST 0x38
*          32C2  ff         RST 0x38
*          32C3  ff         RST 0x38
*          32C4  ff         RST 0x38
*          32C5  ff         RST 0x38
*          32C6  ff         RST 0x38
*          32C7  ff         RST 0x38
*          32C8  ff         RST 0x38
*          32C9  ff         RST 0x38
*          32CA  ff         RST 0x38
*          32CB  ff         RST 0x38
*          32CC  ff         RST 0x38
*          32CD  ff         RST 0x38
*          32CE  ff         RST 0x38
*          32CF  ff         RST 0x38
*          32D0  ff         RST 0x38
*          32D1  ff         RST 0x38
*          32D2  ff         RST 0x38
*          32D3  ff         RST 0x38
*          32D4  ff         RST 0x38
*          32D5  ff         RST 0x38
*          32D6  ff         RST 0x38
*          32D7  ff         RST 0x38
*          32D8  ff         RST 0x38
*          32D9  ff         RST 0x38
*          32DA  ff         RST 0x38
*          32DB  ff         RST 0x38
*          32DC  ff         RST 0x38
*          32DD  ff         RST 0x38
*          32DE  ff         RST 0x38
*          32DF  ff         RST 0x38
*          32E0  ff         RST 0x38
*          32E1  ff         RST 0x38
*          32E2  ff         RST 0x38
*          32E3  ff         RST 0x38
*          32E4  ff         RST 0x38
*          32E5  ff         RST 0x38
*          32E6  ff         RST 0x38
*          32E7  ff         RST 0x38
*          32E8  ff         RST 0x38
*          32E9  ff         RST 0x38
*          32EA  ff         RST 0x38
*          32EB  ff         RST 0x38
*          32EC  ff         RST 0x38
*          32ED  ff         RST 0x38
*          32EE  ff         RST 0x38
*          32EF  ff         RST 0x38
*          32F0  ff         RST 0x38
*          32F1  ff         RST 0x38
*          32F2  ff         RST 0x38
*          32F3  ff         RST 0x38
*          32F4  ff         RST 0x38
*          32F5  ff         RST 0x38
*          32F6  ff         RST 0x38
*          32F7  ff         RST 0x38
*          32F8  ff         RST 0x38
*          32F9  ff         RST 0x38
*          32FA  ff         RST 0x38
*          32FB  ff         RST 0x38
*          32FC  ff         RST 0x38
*          32FD  ff         RST 0x38
*          32FE  ff         RST 0x38
*          32FF  ff         RST 0x38
*          3300  ff         RST 0x38
*          3301  ff         RST 0x38
*          3302  ff         RST 0x38
*          3303  ff         RST 0x38
*          3304  ff         RST 0x38
*          3305  ff         RST 0x38
*          3306  ff         RST 0x38
*          3307  ff         RST 0x38
*          3308  ff         RST 0x38
*          3309  ff         RST 0x38
*          330A  ff         RST 0x38
*          330B  ff         RST 0x38
*          330C  ff         RST 0x38
*          330D  ff         RST 0x38
*          330E  ff         RST 0x38
*          330F  ff         RST 0x38
*          3310  ff         RST 0x38
*          3311  ff         RST 0x38
*          3312  ff         RST 0x38
*          3313  ff         RST 0x38
*          3314  ff         RST 0x38
*          3315  ff         RST 0x38
*          3316  ff         RST 0x38
*          3317  ff         RST 0x38
*          3318  ff         RST 0x38
*          3319  ff         RST 0x38
*          331A  ff         RST 0x38
*          331B  ff         RST 0x38
*          331C  ff         RST 0x38
*          331D  ff         RST 0x38
*          331E  ff         RST 0x38
*          331F  ff         RST 0x38
*          3320  ff         RST 0x38
*          3321  ff         RST 0x38
*          3322  ff         RST 0x38
*          3323  ff         RST 0x38
*          3324  ff         RST 0x38
*          3325  ff         RST 0x38
*          3326  ff         RST 0x38
*          3327  ff         RST 0x38
*          3328  ff         RST 0x38
*          3329  ff         RST 0x38
*          332A  ff         RST 0x38
*          332B  ff         RST 0x38
*          332C  ff         RST 0x38
*          332D  ff         RST 0x38
*          332E  ff         RST 0x38
*          332F  ff         RST 0x38
*          3330  ff         RST 0x38
*          3331  ff         RST 0x38
*          3332  ff         RST 0x38
*          3333  ff         RST 0x38
*          3334  ff         RST 0x38
*          3335  ff         RST 0x38
*          3336  ff         RST 0x38
*          3337  ff         RST 0x38
*          3338  ff         RST 0x38
*          3339  ff         RST 0x38
*          333A  ff         RST 0x38
*          333B  ff         RST 0x38
*          333C  ff         RST 0x38
*          333D  ff         RST 0x38
*          333E  ff         RST 0x38
*          333F  ff         RST 0x38
*          3340  ff         RST 0x38
*          3341  ff         RST 0x38
*          3342  ff         RST 0x38
*          3343  ff         RST 0x38
*          3344  ff         RST 0x38
*          3345  ff         RST 0x38
*          3346  ff         RST 0x38
*          3347  ff         RST 0x38
*          3348  ff         RST 0x38
*          3349  ff         RST 0x38
*          334A  ff         RST 0x38
*          334B  ff         RST 0x38
*          334C  ff         RST 0x38
*          334D  ff         RST 0x38
*          334E  ff         RST 0x38
*          334F  ff         RST 0x38
*          3350  ff         RST 0x38
*          3351  ff         RST 0x38
*          3352  ff         RST 0x38
*          3353  ff         RST 0x38
*          3354  ff         RST 0x38
*          3355  ff         RST 0x38
*          3356  ff         RST 0x38
*          3357  ff         RST 0x38
*          3358  ff         RST 0x38
*          3359  ff         RST 0x38
*          335A  ff         RST 0x38
*          335B  ff         RST 0x38
*          335C  ff         RST 0x38
*          335D  ff         RST 0x38
*          335E  ff         RST 0x38
*          335F  ff         RST 0x38
*          3360  ff         RST 0x38
*          3361  ff         RST 0x38
*          3362  ff         RST 0x38
*          3363  ff         RST 0x38
*          3364  ff         RST 0x38
*          3365  ff         RST 0x38
*          3366  ff         RST 0x38
*          3367  ff         RST 0x38
*          3368  ff         RST 0x38
*          3369  ff         RST 0x38
*          336A  ff         RST 0x38
*          336B  ff         RST 0x38
*          336C  ff         RST 0x38
*          336D  ff         RST 0x38
*          336E  ff         RST 0x38
*          336F  ff         RST 0x38
*          3370  ff         RST 0x38
*          3371  ff         RST 0x38
*          3372  ff         RST 0x38
*          3373  ff         RST 0x38
*          3374  ff         RST 0x38
*          3375  ff         RST 0x38
*          3376  ff         RST 0x38
*          3377  ff         RST 0x38
*          3378  ff         RST 0x38
*          3379  ff         RST 0x38
*          337A  ff         RST 0x38
*          337B  ff         RST 0x38
*          337C  ff         RST 0x38
*          337D  ff         RST 0x38
*          337E  ff         RST 0x38
*          337F  ff         RST 0x38
*          3380  ff         RST 0x38
*  L_3381: 3381  ff         RST 0x38
*          3382  ff         RST 0x38
*          3383  ff         RST 0x38
*          3384  ff         RST 0x38
*          3385  ff         RST 0x38
*          3386  ff         RST 0x38
*          3387  ff         RST 0x38
*          3388  ff         RST 0x38
*          3389  ff         RST 0x38
*          338A  ff         RST 0x38
*          338B  ff         RST 0x38
*          338C  ff         RST 0x38
*          338D  ff         RST 0x38
*          338E  ff         RST 0x38
*          338F  ff         RST 0x38
*          3390  ff         RST 0x38
*          3391  ff         RST 0x38
*          3392  ff         RST 0x38
*          3393  ff         RST 0x38
*          3394  ff         RST 0x38
*          3395  ff         RST 0x38
*          3396  ff         RST 0x38
*          3397  ff         RST 0x38
*          3398  ff         RST 0x38
*          3399  ff         RST 0x38
*          339A  ff         RST 0x38
*          339B  ff         RST 0x38
*          339C  ff         RST 0x38
*          339D  ff         RST 0x38
*          339E  ff         RST 0x38
*          339F  ff         RST 0x38
*          33A0  ff         RST 0x38
*          33A1  ff         RST 0x38
*          33A2  ff         RST 0x38
*          33A3  ff         RST 0x38
*          33A4  ff         RST 0x38
*          33A5  ff         RST 0x38
*          33A6  ff         RST 0x38
*          33A7  ff         RST 0x38
*          33A8  ff         RST 0x38
*          33A9  ff         RST 0x38
*          33AA  ff         RST 0x38
*          33AB  ff         RST 0x38
*          33AC  ff         RST 0x38
*          33AD  ff         RST 0x38
*          33AE  ff         RST 0x38
*          33AF  ff         RST 0x38
*          33B0  ff         RST 0x38
*          33B1  ff         RST 0x38
*          33B2  ff         RST 0x38
*          33B3  ff         RST 0x38
*          33B4  ff         RST 0x38
*          33B5  ff         RST 0x38
*          33B6  ff         RST 0x38
*          33B7  ff         RST 0x38
*          33B8  ff         RST 0x38
*          33B9  ff         RST 0x38
*          33BA  ff         RST 0x38
*          33BB  ff         RST 0x38
*          33BC  ff         RST 0x38
*          33BD  ff         RST 0x38
*          33BE  ff         RST 0x38
*          33BF  ff         RST 0x38
*          33C0  ff         RST 0x38
*          33C1  ff         RST 0x38
*          33C2  ff         RST 0x38
*          33C3  ff         RST 0x38
*          33C4  ff         RST 0x38
*          33C5  ff         RST 0x38
*          33C6  ff         RST 0x38
*          33C7  ff         RST 0x38
*          33C8  ff         RST 0x38
*          33C9  ff         RST 0x38
*          33CA  ff         RST 0x38
*          33CB  ff         RST 0x38
*          33CC  ff         RST 0x38
*          33CD  ff         RST 0x38
*          33CE  ff         RST 0x38
*          33CF  ff         RST 0x38
*          33D0  ff         RST 0x38
*          33D1  ff         RST 0x38
*          33D2  ff         RST 0x38
*          33D3  ff         RST 0x38
*          33D4  ff         RST 0x38
*          33D5  ff         RST 0x38
*          33D6  ff         RST 0x38
*          33D7  ff         RST 0x38
*          33D8  ff         RST 0x38
*          33D9  ff         RST 0x38
*          33DA  ff         RST 0x38
*          33DB  ff         RST 0x38
*          33DC  ff         RST 0x38
*          33DD  ff         RST 0x38
*          33DE  ff         RST 0x38
*          33DF  ff         RST 0x38
*          33E0  ff         RST 0x38
*          33E1  ff         RST 0x38
*          33E2  ff         RST 0x38
*          33E3  ff         RST 0x38
*          33E4  ff         RST 0x38
*          33E5  ff         RST 0x38
*          33E6  ff         RST 0x38
*          33E7  ff         RST 0x38
*          33E8  ff         RST 0x38
*          33E9  ff         RST 0x38
*          33EA  ff         RST 0x38
*          33EB  ff         RST 0x38
*          33EC  ff         RST 0x38
*          33ED  ff         RST 0x38
*          33EE  ff         RST 0x38
*          33EF  ff         RST 0x38
*          33F0  ff         RST 0x38
*          33F1  ff         RST 0x38
*          33F2  ff         RST 0x38
*          33F3  ff         RST 0x38
*          33F4  ff         RST 0x38
*          33F5  ff         RST 0x38
*          33F6  ff         RST 0x38
*          33F7  ff         RST 0x38
*          33F8  ff         RST 0x38
*          33F9  ff         RST 0x38
*          33FA  ff         RST 0x38
*          33FB  ff         RST 0x38
*          33FC  ff         RST 0x38
*          33FD  ff         RST 0x38
*          33FE  ff         RST 0x38
*          33FF  ff         RST 0x38
*          3400  ff         RST 0x38
*          3401  ff         RST 0x38
*          3402  ff         RST 0x38
*          3403  ff         RST 0x38
*          3404  ff         RST 0x38
*          3405  ff         RST 0x38
*          3406  ff         RST 0x38
*          3407  ff         RST 0x38
*          3408  ff         RST 0x38
*          3409  ff         RST 0x38
*          340A  ff         RST 0x38
*          340B  ff         RST 0x38
*          340C  ff         RST 0x38
*          340D  ff         RST 0x38
*          340E  ff         RST 0x38
*          340F  ff         RST 0x38
*          3410  ff         RST 0x38
*          3411  ff         RST 0x38
*          3412  ff         RST 0x38
*          3413  ff         RST 0x38
*          3414  ff         RST 0x38
*          3415  ff         RST 0x38
*          3416  ff         RST 0x38
*          3417  ff         RST 0x38
*          3418  ff         RST 0x38
*          3419  ff         RST 0x38
*          341A  ff         RST 0x38
*          341B  ff         RST 0x38
*          341C  ff         RST 0x38
*          341D  ff         RST 0x38
*          341E  ff         RST 0x38
*          341F  ff         RST 0x38
*          3420  ff         RST 0x38
*          3421  ff         RST 0x38
*          3422  ff         RST 0x38
*          3423  ff         RST 0x38
*          3424  ff         RST 0x38
*          3425  ff         RST 0x38
*          3426  ff         RST 0x38
*          3427  ff         RST 0x38
*          3428  ff         RST 0x38
*          3429  ff         RST 0x38
*          342A  ff         RST 0x38
*          342B  ff         RST 0x38
*          342C  ff         RST 0x38
*          342D  ff         RST 0x38
*          342E  ff         RST 0x38
*          342F  ff         RST 0x38
*          3430  ff         RST 0x38
*          3431  ff         RST 0x38
*          3432  ff         RST 0x38
*          3433  ff         RST 0x38
*          3434  ff         RST 0x38
*          3435  ff         RST 0x38
*          3436  ff         RST 0x38
*          3437  ff         RST 0x38
*          3438  ff         RST 0x38
*          3439  ff         RST 0x38
*          343A  ff         RST 0x38
*          343B  ff         RST 0x38
*          343C  ff         RST 0x38
*          343D  ff         RST 0x38
*          343E  ff         RST 0x38
*          343F  ff         RST 0x38
*          3440  ff         RST 0x38
*          3441  ff         RST 0x38
*          3442  ff         RST 0x38
*          3443  ff         RST 0x38
*          3444  ff         RST 0x38
*          3445  ff         RST 0x38
*          3446  ff         RST 0x38
*          3447  ff         RST 0x38
*          3448  ff         RST 0x38
*          3449  ff         RST 0x38
*          344A  ff         RST 0x38
*          344B  ff         RST 0x38
*          344C  ff         RST 0x38
*          344D  ff         RST 0x38
*          344E  ff         RST 0x38
*          344F  ff         RST 0x38
*          3450  ff         RST 0x38
*          3451  ff         RST 0x38
*          3452  ff         RST 0x38
*          3453  ff         RST 0x38
*          3454  ff         RST 0x38
*          3455  ff         RST 0x38
*          3456  ff         RST 0x38
*          3457  ff         RST 0x38
*          3458  ff         RST 0x38
*          3459  ff         RST 0x38
*          345A  ff         RST 0x38
*          345B  ff         RST 0x38
*          345C  ff         RST 0x38
*          345D  ff         RST 0x38
*          345E  ff         RST 0x38
*          345F  ff         RST 0x38
*          3460  ff         RST 0x38
*          3461  ff         RST 0x38
*          3462  ff         RST 0x38
*          3463  ff         RST 0x38
*          3464  ff         RST 0x38
*          3465  ff         RST 0x38
*          3466  ff         RST 0x38
*          3467  ff         RST 0x38
*          3468  ff         RST 0x38
*          3469  ff         RST 0x38
*          346A  ff         RST 0x38
*          346B  ff         RST 0x38
*          346C  ff         RST 0x38
*          346D  ff         RST 0x38
*          346E  ff         RST 0x38
*          346F  ff         RST 0x38
*          3470  ff         RST 0x38
*          3471  ff         RST 0x38
*          3472  ff         RST 0x38
*          3473  ff         RST 0x38
*          3474  ff         RST 0x38
*          3475  ff         RST 0x38
*          3476  ff         RST 0x38
*          3477  ff         RST 0x38
*          3478  ff         RST 0x38
*          3479  ff         RST 0x38
*          347A  ff         RST 0x38
*          347B  ff         RST 0x38
*          347C  ff         RST 0x38
*          347D  ff         RST 0x38
*          347E  ff         RST 0x38
*          347F  ff         RST 0x38
*          3480  ff         RST 0x38
*          3481  ff         RST 0x38
*          3482  ff         RST 0x38
*          3483  ff         RST 0x38
*          3484  ff         RST 0x38
*          3485  ff         RST 0x38
*          3486  ff         RST 0x38
*          3487  ff         RST 0x38
*          3488  ff         RST 0x38
*          3489  ff         RST 0x38
*          348A  ff         RST 0x38
*          348B  ff         RST 0x38
*          348C  ff         RST 0x38
*          348D  ff         RST 0x38
*          348E  ff         RST 0x38
*          348F  ff         RST 0x38
*          3490  ff         RST 0x38
*          3491  ff         RST 0x38
*          3492  ff         RST 0x38
*          3493  ff         RST 0x38
*          3494  ff         RST 0x38
*          3495  ff         RST 0x38
*          3496  ff         RST 0x38
*          3497  ff         RST 0x38
*          3498  ff         RST 0x38
*          3499  ff         RST 0x38
*          349A  ff         RST 0x38
*          349B  ff         RST 0x38
*          349C  ff         RST 0x38
*          349D  ff         RST 0x38
*          349E  ff         RST 0x38
*          349F  ff         RST 0x38
*          34A0  ff         RST 0x38
*          34A1  ff         RST 0x38
*          34A2  ff         RST 0x38
*          34A3  ff         RST 0x38
*          34A4  ff         RST 0x38
*          34A5  ff         RST 0x38
*          34A6  ff         RST 0x38
*          34A7  ff         RST 0x38
*          34A8  ff         RST 0x38
*          34A9  ff         RST 0x38
*          34AA  ff         RST 0x38
*          34AB  ff         RST 0x38
*          34AC  ff         RST 0x38
*          34AD  ff         RST 0x38
*          34AE  ff         RST 0x38
*          34AF  ff         RST 0x38
*          34B0  ff         RST 0x38
*          34B1  ff         RST 0x38
*          34B2  ff         RST 0x38
*          34B3  ff         RST 0x38
*          34B4  ff         RST 0x38
*          34B5  ff         RST 0x38
*          34B6  ff         RST 0x38
*          34B7  ff         RST 0x38
*          34B8  ff         RST 0x38
*          34B9  ff         RST 0x38
*          34BA  ff         RST 0x38
*          34BB  ff         RST 0x38
*          34BC  ff         RST 0x38
*          34BD  ff         RST 0x38
*          34BE  ff         RST 0x38
*          34BF  ff         RST 0x38
*          34C0  ff         RST 0x38
*          34C1  ff         RST 0x38
*          34C2  ff         RST 0x38
*          34C3  ff         RST 0x38
*          34C4  ff         RST 0x38
*          34C5  ff         RST 0x38
*          34C6  ff         RST 0x38
*          34C7  ff         RST 0x38
*          34C8  ff         RST 0x38
*          34C9  ff         RST 0x38
*          34CA  ff         RST 0x38
*          34CB  ff         RST 0x38
*          34CC  ff         RST 0x38
*          34CD  ff         RST 0x38
*          34CE  ff         RST 0x38
*          34CF  ff         RST 0x38
*          34D0  ff         RST 0x38
*          34D1  ff         RST 0x38
*          34D2  ff         RST 0x38
*          34D3  ff         RST 0x38
*          34D4  ff         RST 0x38
*          34D5  ff         RST 0x38
*          34D6  ff         RST 0x38
*          34D7  ff         RST 0x38
*          34D8  ff         RST 0x38
*          34D9  ff         RST 0x38
*          34DA  ff         RST 0x38
*          34DB  ff         RST 0x38
*          34DC  ff         RST 0x38
*          34DD  ff         RST 0x38
*          34DE  ff         RST 0x38
*          34DF  ff         RST 0x38
*          34E0  ff         RST 0x38
*          34E1  ff         RST 0x38
*          34E2  ff         RST 0x38
*          34E3  ff         RST 0x38
*          34E4  ff         RST 0x38
*          34E5  ff         RST 0x38
*          34E6  ff         RST 0x38
*          34E7  ff         RST 0x38
*          34E8  ff         RST 0x38
*          34E9  ff         RST 0x38
*          34EA  ff         RST 0x38
*          34EB  ff         RST 0x38
*          34EC  ff         RST 0x38
*          34ED  ff         RST 0x38
*          34EE  ff         RST 0x38
*          34EF  ff         RST 0x38
*          34F0  ff         RST 0x38
*          34F1  ff         RST 0x38
*          34F2  ff         RST 0x38
*          34F3  ff         RST 0x38
*          34F4  ff         RST 0x38
*          34F5  ff         RST 0x38
*          34F6  ff         RST 0x38
*          34F7  ff         RST 0x38
*          34F8  ff         RST 0x38
*          34F9  ff         RST 0x38
*          34FA  ff         RST 0x38
*          34FB  ff         RST 0x38
*          34FC  ff         RST 0x38
*          34FD  ff         RST 0x38
*          34FE  ff         RST 0x38
*          34FF  ff         RST 0x38
*          3500  ff         RST 0x38
*          3501  ff         RST 0x38
*          3502  ff         RST 0x38
*          3503  ff         RST 0x38
*          3504  ff         RST 0x38
*          3505  ff         RST 0x38
*          3506  ff         RST 0x38
*          3507  ff         RST 0x38
*          3508  ff         RST 0x38
*          3509  ff         RST 0x38
*          350A  ff         RST 0x38
*          350B  ff         RST 0x38
*          350C  ff         RST 0x38
*          350D  ff         RST 0x38
*          350E  ff         RST 0x38
*          350F  ff         RST 0x38
*          3510  ff         RST 0x38
*          3511  ff         RST 0x38
*          3512  ff         RST 0x38
*          3513  ff         RST 0x38
*          3514  ff         RST 0x38
*          3515  ff         RST 0x38
*          3516  ff         RST 0x38
*          3517  ff         RST 0x38
*          3518  ff         RST 0x38
*          3519  ff         RST 0x38
*          351A  ff         RST 0x38
*          351B  ff         RST 0x38
*          351C  ff         RST 0x38
*          351D  ff         RST 0x38
*          351E  ff         RST 0x38
*          351F  ff         RST 0x38
*          3520  ff         RST 0x38
*          3521  ff         RST 0x38
*          3522  ff         RST 0x38
*          3523  ff         RST 0x38
*          3524  ff         RST 0x38
*          3525  ff         RST 0x38
*          3526  ff         RST 0x38
*          3527  ff         RST 0x38
*          3528  ff         RST 0x38
*          3529  ff         RST 0x38
*          352A  ff         RST 0x38
*          352B  ff         RST 0x38
*          352C  ff         RST 0x38
*          352D  ff         RST 0x38
*          352E  ff         RST 0x38
*          352F  ff         RST 0x38
*          3530  ff         RST 0x38
*          3531  ff         RST 0x38
*          3532  ff         RST 0x38
*          3533  ff         RST 0x38
*          3534  ff         RST 0x38
*          3535  ff         RST 0x38
*          3536  ff         RST 0x38
*          3537  ff         RST 0x38
*          3538  ff         RST 0x38
*          3539  ff         RST 0x38
*          353A  ff         RST 0x38
*          353B  ff         RST 0x38
*          353C  ff         RST 0x38
*          353D  ff         RST 0x38
*          353E  ff         RST 0x38
*          353F  ff         RST 0x38
*          3540  ff         RST 0x38
*          3541  ff         RST 0x38
*          3542  ff         RST 0x38
*          3543  ff         RST 0x38
*          3544  ff         RST 0x38
*          3545  ff         RST 0x38
*          3546  ff         RST 0x38
*          3547  ff         RST 0x38
*          3548  ff         RST 0x38
*          3549  ff         RST 0x38
*          354A  ff         RST 0x38
*          354B  ff         RST 0x38
*          354C  ff         RST 0x38
*          354D  ff         RST 0x38
*          354E  ff         RST 0x38
*          354F  ff         RST 0x38
*          3550  ff         RST 0x38
*          3551  ff         RST 0x38
*          3552  ff         RST 0x38
*          3553  ff         RST 0x38
*          3554  ff         RST 0x38
*          3555  ff         RST 0x38
*          3556  ff         RST 0x38
*          3557  ff         RST 0x38
*          3558  ff         RST 0x38
*          3559  ff         RST 0x38
*          355A  ff         RST 0x38
*          355B  ff         RST 0x38
*          355C  ff         RST 0x38
*          355D  ff         RST 0x38
*          355E  ff         RST 0x38
*          355F  ff         RST 0x38
*          3560  ff         RST 0x38
*          3561  ff         RST 0x38
*          3562  ff         RST 0x38
*          3563  ff         RST 0x38
*          3564  ff         RST 0x38
*          3565  ff         RST 0x38
*          3566  ff         RST 0x38
*          3567  ff         RST 0x38
*          3568  ff         RST 0x38
*          3569  ff         RST 0x38
*          356A  ff         RST 0x38
*          356B  ff         RST 0x38
*          356C  ff         RST 0x38
*          356D  ff         RST 0x38
*          356E  ff         RST 0x38
*          356F  ff         RST 0x38
*          3570  ff         RST 0x38
*          3571  ff         RST 0x38
*          3572  ff         RST 0x38
*          3573  ff         RST 0x38
*          3574  ff         RST 0x38
*          3575  ff         RST 0x38
*          3576  ff         RST 0x38
*          3577  ff         RST 0x38
*          3578  ff         RST 0x38
*          3579  ff         RST 0x38
*          357A  ff         RST 0x38
*          357B  ff         RST 0x38
*          357C  ff         RST 0x38
*          357D  ff         RST 0x38
*          357E  ff         RST 0x38
*          357F  ff         RST 0x38
*          3580  ff         RST 0x38
*          3581  ff         RST 0x38
*          3582  ff         RST 0x38
*          3583  ff         RST 0x38
*          3584  ff         RST 0x38
*          3585  ff         RST 0x38
*          3586  ff         RST 0x38
*          3587  ff         RST 0x38
*          3588  ff         RST 0x38
*          3589  ff         RST 0x38
*          358A  ff         RST 0x38
*          358B  ff         RST 0x38
*          358C  ff         RST 0x38
*          358D  ff         RST 0x38
*          358E  ff         RST 0x38
*          358F  ff         RST 0x38
*          3590  ff         RST 0x38
*          3591  ff         RST 0x38
*          3592  ff         RST 0x38
*          3593  ff         RST 0x38
*          3594  ff         RST 0x38
*          3595  ff         RST 0x38
*          3596  ff         RST 0x38
*          3597  ff         RST 0x38
*          3598  ff         RST 0x38
*          3599  ff         RST 0x38
*          359A  ff         RST 0x38
*          359B  ff         RST 0x38
*          359C  ff         RST 0x38
*          359D  ff         RST 0x38
*          359E  ff         RST 0x38
*          359F  ff         RST 0x38
*          35A0  ff         RST 0x38
*          35A1  ff         RST 0x38
*          35A2  ff         RST 0x38
*          35A3  ff         RST 0x38
*          35A4  ff         RST 0x38
*          35A5  ff         RST 0x38
*          35A6  ff         RST 0x38
*          35A7  ff         RST 0x38
*          35A8  ff         RST 0x38
*          35A9  ff         RST 0x38
*          35AA  ff         RST 0x38
*          35AB  ff         RST 0x38
*          35AC  ff         RST 0x38
*          35AD  ff         RST 0x38
*          35AE  ff         RST 0x38
*          35AF  ff         RST 0x38
*          35B0  ff         RST 0x38
*          35B1  ff         RST 0x38
*          35B2  ff         RST 0x38
*          35B3  ff         RST 0x38
*          35B4  ff         RST 0x38
*          35B5  ff         RST 0x38
*          35B6  ff         RST 0x38
*          35B7  ff         RST 0x38
*          35B8  ff         RST 0x38
*          35B9  ff         RST 0x38
*          35BA  ff         RST 0x38
*          35BB  ff         RST 0x38
*          35BC  ff         RST 0x38
*          35BD  ff         RST 0x38
*          35BE  ff         RST 0x38
*          35BF  ff         RST 0x38
*          35C0  ff         RST 0x38
*          35C1  ff         RST 0x38
*          35C2  ff         RST 0x38
*          35C3  ff         RST 0x38
*          35C4  ff         RST 0x38
*          35C5  ff         RST 0x38
*          35C6  ff         RST 0x38
*          35C7  ff         RST 0x38
*          35C8  ff         RST 0x38
*          35C9  ff         RST 0x38
*          35CA  ff         RST 0x38
*          35CB  ff         RST 0x38
*          35CC  ff         RST 0x38
*          35CD  ff         RST 0x38
*          35CE  ff         RST 0x38
*          35CF  ff         RST 0x38
*          35D0  ff         RST 0x38
*          35D1  ff         RST 0x38
*          35D2  ff         RST 0x38
*          35D3  ff         RST 0x38
*          35D4  ff         RST 0x38
*          35D5  ff         RST 0x38
*          35D6  ff         RST 0x38
*          35D7  ff         RST 0x38
*          35D8  ff         RST 0x38
*          35D9  ff         RST 0x38
*          35DA  ff         RST 0x38
*          35DB  ff         RST 0x38
*          35DC  ff         RST 0x38
*          35DD  ff         RST 0x38
*          35DE  ff         RST 0x38
*          35DF  ff         RST 0x38
*          35E0  ff         RST 0x38
*          35E1  ff         RST 0x38
*          35E2  ff         RST 0x38
*          35E3  ff         RST 0x38
*          35E4  ff         RST 0x38
*          35E5  ff         RST 0x38
*          35E6  ff         RST 0x38
*          35E7  ff         RST 0x38
*          35E8  ff         RST 0x38
*          35E9  ff         RST 0x38
*          35EA  ff         RST 0x38
*          35EB  ff         RST 0x38
*          35EC  ff         RST 0x38
*          35ED  ff         RST 0x38
*          35EE  ff         RST 0x38
*          35EF  ff         RST 0x38
*          35F0  ff         RST 0x38
*          35F1  ff         RST 0x38
*          35F2  ff         RST 0x38
*          35F3  ff         RST 0x38
*          35F4  ff         RST 0x38
*          35F5  ff         RST 0x38
*          35F6  ff         RST 0x38
*          35F7  ff         RST 0x38
*          35F8  ff         RST 0x38
*          35F9  ff         RST 0x38
*          35FA  ff         RST 0x38
*          35FB  ff         RST 0x38
*          35FC  ff         RST 0x38
*          35FD  ff         RST 0x38
*          35FE  ff         RST 0x38
*          35FF  ff         RST 0x38
*          3600  ff         RST 0x38
*          3601  ff         RST 0x38
*          3602  ff         RST 0x38
*          3603  ff         RST 0x38
*          3604  ff         RST 0x38
*          3605  ff         RST 0x38
*          3606  ff         RST 0x38
*          3607  ff         RST 0x38
*          3608  ff         RST 0x38
*          3609  ff         RST 0x38
*          360A  ff         RST 0x38
*          360B  ff         RST 0x38
*          360C  ff         RST 0x38
*          360D  ff         RST 0x38
*          360E  ff         RST 0x38
*          360F  ff         RST 0x38
*          3610  ff         RST 0x38
*          3611  ff         RST 0x38
*          3612  ff         RST 0x38
*          3613  ff         RST 0x38
*          3614  ff         RST 0x38
*          3615  ff         RST 0x38
*          3616  ff         RST 0x38
*          3617  ff         RST 0x38
*          3618  ff         RST 0x38
*          3619  ff         RST 0x38
*          361A  ff         RST 0x38
*          361B  ff         RST 0x38
*          361C  ff         RST 0x38
*          361D  ff         RST 0x38
*          361E  ff         RST 0x38
*          361F  ff         RST 0x38
*          3620  ff         RST 0x38
*          3621  ff         RST 0x38
*          3622  ff         RST 0x38
*          3623  ff         RST 0x38
*          3624  ff         RST 0x38
*          3625  ff         RST 0x38
*          3626  ff         RST 0x38
*          3627  ff         RST 0x38
*          3628  ff         RST 0x38
*          3629  ff         RST 0x38
*          362A  ff         RST 0x38
*          362B  ff         RST 0x38
*          362C  ff         RST 0x38
*          362D  ff         RST 0x38
*          362E  ff         RST 0x38
*          362F  ff         RST 0x38
*          3630  ff         RST 0x38
*          3631  ff         RST 0x38
*          3632  ff         RST 0x38
*          3633  ff         RST 0x38
*          3634  ff         RST 0x38
*          3635  ff         RST 0x38
*          3636  ff         RST 0x38
*          3637  ff         RST 0x38
*          3638  ff         RST 0x38
*          3639  ff         RST 0x38
*          363A  ff         RST 0x38
*          363B  ff         RST 0x38
*          363C  ff         RST 0x38
*          363D  ff         RST 0x38
*          363E  ff         RST 0x38
*          363F  ff         RST 0x38
*          3640  ff         RST 0x38
*          3641  ff         RST 0x38
*          3642  ff         RST 0x38
*          3643  ff         RST 0x38
*          3644  ff         RST 0x38
*          3645  ff         RST 0x38
*          3646  ff         RST 0x38
*          3647  ff         RST 0x38
*          3648  ff         RST 0x38
*          3649  ff         RST 0x38
*          364A  ff         RST 0x38
*          364B  ff         RST 0x38
*          364C  ff         RST 0x38
*          364D  ff         RST 0x38
*          364E  ff         RST 0x38
*          364F  ff         RST 0x38
*          3650  ff         RST 0x38
*          3651  ff         RST 0x38
*          3652  ff         RST 0x38
*          3653  ff         RST 0x38
*          3654  ff         RST 0x38
*          3655  ff         RST 0x38
*          3656  ff         RST 0x38
*          3657  ff         RST 0x38
*          3658  ff         RST 0x38
*          3659  ff         RST 0x38
*          365A  ff         RST 0x38
*          365B  ff         RST 0x38
*          365C  ff         RST 0x38
*          365D  ff         RST 0x38
*          365E  ff         RST 0x38
*          365F  ff         RST 0x38
*          3660  ff         RST 0x38
*          3661  ff         RST 0x38
*          3662  ff         RST 0x38
*          3663  ff         RST 0x38
*          3664  ff         RST 0x38
*          3665  ff         RST 0x38
*          3666  ff         RST 0x38
*          3667  ff         RST 0x38
*          3668  ff         RST 0x38
*          3669  ff         RST 0x38
*          366A  ff         RST 0x38
*          366B  ff         RST 0x38
*          366C  ff         RST 0x38
*          366D  ff         RST 0x38
*          366E  ff         RST 0x38
*          366F  ff         RST 0x38
*          3670  ff         RST 0x38
*          3671  ff         RST 0x38
*          3672  ff         RST 0x38
*          3673  ff         RST 0x38
*          3674  ff         RST 0x38
*          3675  ff         RST 0x38
*          3676  ff         RST 0x38
*          3677  ff         RST 0x38
*          3678  ff         RST 0x38
*          3679  ff         RST 0x38
*          367A  ff         RST 0x38
*          367B  ff         RST 0x38
*          367C  ff         RST 0x38
*          367D  ff         RST 0x38
*          367E  ff         RST 0x38
*          367F  ff         RST 0x38
*          3680  ff         RST 0x38
*          3681  ff         RST 0x38
*          3682  ff         RST 0x38
*          3683  ff         RST 0x38
*          3684  ff         RST 0x38
*          3685  ff         RST 0x38
*          3686  ff         RST 0x38
*          3687  ff         RST 0x38
*          3688  ff         RST 0x38
*          3689  ff         RST 0x38
*          368A  ff         RST 0x38
*          368B  ff         RST 0x38
*          368C  ff         RST 0x38
*          368D  ff         RST 0x38
*          368E  ff         RST 0x38
*          368F  ff         RST 0x38
*          3690  ff         RST 0x38
*          3691  ff         RST 0x38
*          3692  ff         RST 0x38
*          3693  ff         RST 0x38
*          3694  ff         RST 0x38
*          3695  ff         RST 0x38
*          3696  ff         RST 0x38
*          3697  ff         RST 0x38
*          3698  ff         RST 0x38
*          3699  ff         RST 0x38
*          369A  ff         RST 0x38
*          369B  ff         RST 0x38
*          369C  ff         RST 0x38
*          369D  ff         RST 0x38
*          369E  ff         RST 0x38
*          369F  ff         RST 0x38
*          36A0  ff         RST 0x38
*          36A1  ff         RST 0x38
*          36A2  ff         RST 0x38
*          36A3  ff         RST 0x38
*          36A4  ff         RST 0x38
*          36A5  ff         RST 0x38
*          36A6  ff         RST 0x38
*          36A7  ff         RST 0x38
*          36A8  ff         RST 0x38
*          36A9  ff         RST 0x38
*          36AA  ff         RST 0x38
*          36AB  ff         RST 0x38
*          36AC  ff         RST 0x38
*          36AD  ff         RST 0x38
*          36AE  ff         RST 0x38
*          36AF  ff         RST 0x38
*          36B0  ff         RST 0x38
*          36B1  ff         RST 0x38
*          36B2  ff         RST 0x38
*          36B3  ff         RST 0x38
*          36B4  ff         RST 0x38
*          36B5  ff         RST 0x38
*          36B6  ff         RST 0x38
*          36B7  ff         RST 0x38
*          36B8  ff         RST 0x38
*          36B9  ff         RST 0x38
*          36BA  ff         RST 0x38
*          36BB  ff         RST 0x38
*          36BC  ff         RST 0x38
*          36BD  ff         RST 0x38
*          36BE  ff         RST 0x38
*          36BF  ff         RST 0x38
*          36C0  ff         RST 0x38
*          36C1  ff         RST 0x38
*          36C2  ff         RST 0x38
*          36C3  ff         RST 0x38
*          36C4  ff         RST 0x38
*          36C5  ff         RST 0x38
*          36C6  ff         RST 0x38
*          36C7  ff         RST 0x38
*          36C8  ff         RST 0x38
*          36C9  ff         RST 0x38
*          36CA  ff         RST 0x38
*          36CB  ff         RST 0x38
*          36CC  ff         RST 0x38
*          36CD  ff         RST 0x38
*          36CE  ff         RST 0x38
*          36CF  ff         RST 0x38
*          36D0  ff         RST 0x38
*          36D1  ff         RST 0x38
*          36D2  ff         RST 0x38
*          36D3  ff         RST 0x38
*          36D4  ff         RST 0x38
*          36D5  ff         RST 0x38
*          36D6  ff         RST 0x38
*          36D7  ff         RST 0x38
*          36D8  ff         RST 0x38
*          36D9  ff         RST 0x38
*          36DA  ff         RST 0x38
*          36DB  ff         RST 0x38
*          36DC  ff         RST 0x38
*          36DD  ff         RST 0x38
*          36DE  ff         RST 0x38
*          36DF  ff         RST 0x38
*          36E0  ff         RST 0x38
*          36E1  ff         RST 0x38
*          36E2  ff         RST 0x38
*          36E3  ff         RST 0x38
*          36E4  ff         RST 0x38
*          36E5  ff         RST 0x38
*          36E6  ff         RST 0x38
*          36E7  ff         RST 0x38
*          36E8  ff         RST 0x38
*          36E9  ff         RST 0x38
*          36EA  ff         RST 0x38
*          36EB  ff         RST 0x38
*          36EC  ff         RST 0x38
*          36ED  ff         RST 0x38
*          36EE  ff         RST 0x38
*          36EF  ff         RST 0x38
*          36F0  ff         RST 0x38
*          36F1  ff         RST 0x38
*          36F2  ff         RST 0x38
*          36F3  ff         RST 0x38
*          36F4  ff         RST 0x38
*          36F5  ff         RST 0x38
*          36F6  ff         RST 0x38
*          36F7  ff         RST 0x38
*          36F8  ff         RST 0x38
*          36F9  ff         RST 0x38
*          36FA  ff         RST 0x38
*          36FB  ff         RST 0x38
*          36FC  ff         RST 0x38
*          36FD  ff         RST 0x38
*          36FE  ff         RST 0x38
*          36FF  ff         RST 0x38
*          3700  ff         RST 0x38
*          3701  ff         RST 0x38
*          3702  ff         RST 0x38
*          3703  ff         RST 0x38
*          3704  ff         RST 0x38
*          3705  ff         RST 0x38
*          3706  ff         RST 0x38
*          3707  ff         RST 0x38
*          3708  ff         RST 0x38
*          3709  ff         RST 0x38
*          370A  ff         RST 0x38
*          370B  ff         RST 0x38
*          370C  ff         RST 0x38
*          370D  ff         RST 0x38
*          370E  ff         RST 0x38
*          370F  ff         RST 0x38
*          3710  ff         RST 0x38
*          3711  ff         RST 0x38
*          3712  ff         RST 0x38
*          3713  ff         RST 0x38
*          3714  ff         RST 0x38
*          3715  ff         RST 0x38
*          3716  ff         RST 0x38
*          3717  ff         RST 0x38
*          3718  ff         RST 0x38
*          3719  ff         RST 0x38
*          371A  ff         RST 0x38
*          371B  ff         RST 0x38
*          371C  ff         RST 0x38
*          371D  ff         RST 0x38
*          371E  ff         RST 0x38
*          371F  ff         RST 0x38
*          3720  ff         RST 0x38
*          3721  ff         RST 0x38
*          3722  ff         RST 0x38
*          3723  ff         RST 0x38
*          3724  ff         RST 0x38
*          3725  ff         RST 0x38
*          3726  ff         RST 0x38
*          3727  ff         RST 0x38
*          3728  ff         RST 0x38
*          3729  ff         RST 0x38
*          372A  ff         RST 0x38
*          372B  ff         RST 0x38
*          372C  ff         RST 0x38
*          372D  ff         RST 0x38
*          372E  ff         RST 0x38
*          372F  ff         RST 0x38
*          3730  ff         RST 0x38
*          3731  ff         RST 0x38
*          3732  ff         RST 0x38
*          3733  ff         RST 0x38
*          3734  ff         RST 0x38
*          3735  ff         RST 0x38
*          3736  ff         RST 0x38
*          3737  ff         RST 0x38
*          3738  ff         RST 0x38
*          3739  ff         RST 0x38
*          373A  ff         RST 0x38
*          373B  ff         RST 0x38
*          373C  ff         RST 0x38
*          373D  ff         RST 0x38
*          373E  ff         RST 0x38
*          373F  ff         RST 0x38
*          3740  ff         RST 0x38
*          3741  ff         RST 0x38
*          3742  ff         RST 0x38
*          3743  ff         RST 0x38
*          3744  ff         RST 0x38
*          3745  ff         RST 0x38
*          3746  ff         RST 0x38
*          3747  ff         RST 0x38
*          3748  ff         RST 0x38
*          3749  ff         RST 0x38
*          374A  ff         RST 0x38
*          374B  ff         RST 0x38
*          374C  ff         RST 0x38
*          374D  ff         RST 0x38
*          374E  ff         RST 0x38
*          374F  ff         RST 0x38
*          3750  ff         RST 0x38
*          3751  ff         RST 0x38
*          3752  ff         RST 0x38
*          3753  ff         RST 0x38
*          3754  ff         RST 0x38
*          3755  ff         RST 0x38
*          3756  ff         RST 0x38
*          3757  ff         RST 0x38
*          3758  ff         RST 0x38
*          3759  ff         RST 0x38
*          375A  ff         RST 0x38
*          375B  ff         RST 0x38
*          375C  ff         RST 0x38
*          375D  ff         RST 0x38
*          375E  ff         RST 0x38
*          375F  ff         RST 0x38
*          3760  ff         RST 0x38
*          3761  ff         RST 0x38
*          3762  ff         RST 0x38
*          3763  ff         RST 0x38
*          3764  ff         RST 0x38
*          3765  ff         RST 0x38
*          3766  ff         RST 0x38
*          3767  ff         RST 0x38
*          3768  ff         RST 0x38
*          3769  ff         RST 0x38
*          376A  ff         RST 0x38
*          376B  ff         RST 0x38
*          376C  ff         RST 0x38
*          376D  ff         RST 0x38
*          376E  ff         RST 0x38
*          376F  ff         RST 0x38
*          3770  ff         RST 0x38
*          3771  ff         RST 0x38
*          3772  ff         RST 0x38
*          3773  ff         RST 0x38
*          3774  ff         RST 0x38
*          3775  ff         RST 0x38
*          3776  ff         RST 0x38
*          3777  ff         RST 0x38
*          3778  ff         RST 0x38
*          3779  ff         RST 0x38
*          377A  ff         RST 0x38
*          377B  ff         RST 0x38
*          377C  ff         RST 0x38
*          377D  ff         RST 0x38
*          377E  ff         RST 0x38
*          377F  ff         RST 0x38
*          3780  ff         RST 0x38
*          3781  ff         RST 0x38
*          3782  ff         RST 0x38
*          3783  ff         RST 0x38
*          3784  ff         RST 0x38
*          3785  ff         RST 0x38
*          3786  ff         RST 0x38
*          3787  ff         RST 0x38
*          3788  ff         RST 0x38
*          3789  ff         RST 0x38
*          378A  ff         RST 0x38
*          378B  ff         RST 0x38
*          378C  ff         RST 0x38
*          378D  ff         RST 0x38
*          378E  ff         RST 0x38
*          378F  ff         RST 0x38
*          3790  ff         RST 0x38
*          3791  ff         RST 0x38
*          3792  ff         RST 0x38
*          3793  ff         RST 0x38
*          3794  ff         RST 0x38
*          3795  ff         RST 0x38
*          3796  ff         RST 0x38
*          3797  ff         RST 0x38
*          3798  ff         RST 0x38
*          3799  ff         RST 0x38
*          379A  ff         RST 0x38
*          379B  ff         RST 0x38
*          379C  ff         RST 0x38
*          379D  ff         RST 0x38
*          379E  ff         RST 0x38
*          379F  ff         RST 0x38
*          37A0  ff         RST 0x38
*          37A1  ff         RST 0x38
*          37A2  ff         RST 0x38
*          37A3  ff         RST 0x38
*          37A4  ff         RST 0x38
*          37A5  ff         RST 0x38
*          37A6  ff         RST 0x38
*          37A7  ff         RST 0x38
*          37A8  ff         RST 0x38
*          37A9  ff         RST 0x38
*          37AA  ff         RST 0x38
*          37AB  ff         RST 0x38
*          37AC  ff         RST 0x38
*          37AD  ff         RST 0x38
*          37AE  ff         RST 0x38
*          37AF  ff         RST 0x38
*          37B0  ff         RST 0x38
*          37B1  ff         RST 0x38
*          37B2  ff         RST 0x38
*          37B3  ff         RST 0x38
*          37B4  ff         RST 0x38
*          37B5  ff         RST 0x38
*          37B6  ff         RST 0x38
*          37B7  ff         RST 0x38
*          37B8  ff         RST 0x38
*          37B9  ff         RST 0x38
*          37BA  ff         RST 0x38
*          37BB  ff         RST 0x38
*          37BC  ff         RST 0x38
*          37BD  ff         RST 0x38
*          37BE  ff         RST 0x38
*          37BF  ff         RST 0x38
*          37C0  ff         RST 0x38
*          37C1  ff         RST 0x38
*          37C2  ff         RST 0x38
*          37C3  ff         RST 0x38
*          37C4  ff         RST 0x38
*          37C5  ff         RST 0x38
*          37C6  ff         RST 0x38
*          37C7  ff         RST 0x38
*          37C8  ff         RST 0x38
*          37C9  ff         RST 0x38
*          37CA  ff         RST 0x38
*          37CB  ff         RST 0x38
*          37CC  ff         RST 0x38
*          37CD  ff         RST 0x38
*          37CE  ff         RST 0x38
*          37CF  ff         RST 0x38
*          37D0  ff         RST 0x38
*          37D1  ff         RST 0x38
*          37D2  ff         RST 0x38
*          37D3  ff         RST 0x38
*          37D4  ff         RST 0x38
*          37D5  ff         RST 0x38
*          37D6  ff         RST 0x38
*          37D7  ff         RST 0x38
*          37D8  ff         RST 0x38
*          37D9  ff         RST 0x38
*          37DA  ff         RST 0x38
*          37DB  ff         RST 0x38
*          37DC  ff         RST 0x38
*          37DD  ff         RST 0x38
*          37DE  ff         RST 0x38
*          37DF  ff         RST 0x38
*          37E0  ff         RST 0x38
*          37E1  ff         RST 0x38
*          37E2  ff         RST 0x38
*          37E3  ff         RST 0x38
*          37E4  ff         RST 0x38
*          37E5  ff         RST 0x38
*          37E6  ff         RST 0x38
*          37E7  ff         RST 0x38
*          37E8  ff         RST 0x38
*          37E9  ff         RST 0x38
*          37EA  ff         RST 0x38
*          37EB  ff         RST 0x38
*          37EC  ff         RST 0x38
*          37ED  ff         RST 0x38
*          37EE  ff         RST 0x38
*          37EF  ff         RST 0x38
*          37F0  ff         RST 0x38
*          37F1  ff         RST 0x38
*          37F2  ff         RST 0x38
*          37F3  ff         RST 0x38
*          37F4  ff         RST 0x38
*          37F5  ff         RST 0x38
*          37F6  ff         RST 0x38
*          37F7  ff         RST 0x38
*          37F8  ff         RST 0x38
*          37F9  ff         RST 0x38
*          37FA  ff         RST 0x38
*          37FB  ff         RST 0x38
*          37FC  ff         RST 0x38
*          37FD  ff         RST 0x38
*          37FE  ff         RST 0x38
*          37FF  ff         RST 0x38
*          3800  ff         RST 0x38
*          3801  ff         RST 0x38
*          3802  ff         RST 0x38
*          3803  ff         RST 0x38
*          3804  ff         RST 0x38
*          3805  ff         RST 0x38
*          3806  ff         RST 0x38
*          3807  ff         RST 0x38
*          3808  ff         RST 0x38
*          3809  ff         RST 0x38
*          380A  ff         RST 0x38
*          380B  ff         RST 0x38
*          380C  ff         RST 0x38
*          380D  ff         RST 0x38
*          380E  ff         RST 0x38
*          380F  ff         RST 0x38
*          3810  ff         RST 0x38
*          3811  ff         RST 0x38
*          3812  ff         RST 0x38
*          3813  ff         RST 0x38
*          3814  ff         RST 0x38
*          3815  ff         RST 0x38
*          3816  ff         RST 0x38
*          3817  ff         RST 0x38
*          3818  ff         RST 0x38
*          3819  ff         RST 0x38
*          381A  ff         RST 0x38
*          381B  ff         RST 0x38
*          381C  ff         RST 0x38
*          381D  ff         RST 0x38
*          381E  ff         RST 0x38
*          381F  ff         RST 0x38
*          3820  ff         RST 0x38
*          3821  ff         RST 0x38
*          3822  ff         RST 0x38
*          3823  ff         RST 0x38
*          3824  ff         RST 0x38
*          3825  ff         RST 0x38
*          3826  ff         RST 0x38
*          3827  ff         RST 0x38
*          3828  ff         RST 0x38
*          3829  ff         RST 0x38
*          382A  ff         RST 0x38
*          382B  ff         RST 0x38
*          382C  ff         RST 0x38
*          382D  ff         RST 0x38
*          382E  ff         RST 0x38
*          382F  ff         RST 0x38
*          3830  ff         RST 0x38
*          3831  ff         RST 0x38
*          3832  ff         RST 0x38
*          3833  ff         RST 0x38
*          3834  ff         RST 0x38
*          3835  ff         RST 0x38
*          3836  ff         RST 0x38
*          3837  ff         RST 0x38
*          3838  ff         RST 0x38
*          3839  ff         RST 0x38
*          383A  ff         RST 0x38
*          383B  ff         RST 0x38
*          383C  ff         RST 0x38
*          383D  ff         RST 0x38
*          383E  ff         RST 0x38
*          383F  ff         RST 0x38
*          3840  ff         RST 0x38
*          3841  ff         RST 0x38
*          3842  ff         RST 0x38
*          3843  ff         RST 0x38
*          3844  ff         RST 0x38
*          3845  ff         RST 0x38
*          3846  ff         RST 0x38
*          3847  ff         RST 0x38
*          3848  ff         RST 0x38
*          3849  ff         RST 0x38
*          384A  ff         RST 0x38
*          384B  ff         RST 0x38
*          384C  ff         RST 0x38
*          384D  ff         RST 0x38
*          384E  ff         RST 0x38
*          384F  ff         RST 0x38
*          3850  ff         RST 0x38
*          3851  ff         RST 0x38
*          3852  ff         RST 0x38
*          3853  ff         RST 0x38
*          3854  ff         RST 0x38
*          3855  ff         RST 0x38
*          3856  ff         RST 0x38
*          3857  ff         RST 0x38
*          3858  ff         RST 0x38
*          3859  ff         RST 0x38
*          385A  ff         RST 0x38
*          385B  ff         RST 0x38
*          385C  ff         RST 0x38
*          385D  ff         RST 0x38
*          385E  ff         RST 0x38
*          385F  ff         RST 0x38
*          3860  ff         RST 0x38
*          3861  ff         RST 0x38
*          3862  ff         RST 0x38
*          3863  ff         RST 0x38
*          3864  ff         RST 0x38
*          3865  ff         RST 0x38
*          3866  ff         RST 0x38
*          3867  ff         RST 0x38
*          3868  ff         RST 0x38
*          3869  ff         RST 0x38
*          386A  ff         RST 0x38
*          386B  ff         RST 0x38
*          386C  ff         RST 0x38
*          386D  ff         RST 0x38
*          386E  ff         RST 0x38
*          386F  ff         RST 0x38
*          3870  ff         RST 0x38
*          3871  ff         RST 0x38
*          3872  ff         RST 0x38
*          3873  ff         RST 0x38
*          3874  ff         RST 0x38
*          3875  ff         RST 0x38
*          3876  ff         RST 0x38
*          3877  ff         RST 0x38
*          3878  ff         RST 0x38
*          3879  ff         RST 0x38
*          387A  ff         RST 0x38
*          387B  ff         RST 0x38
*          387C  ff         RST 0x38
*          387D  ff         RST 0x38
*          387E  ff         RST 0x38
*          387F  ff         RST 0x38
*          3880  ff         RST 0x38
*          3881  ff         RST 0x38
*          3882  ff         RST 0x38
*          3883  ff         RST 0x38
*          3884  ff         RST 0x38
*          3885  ff         RST 0x38
*          3886  ff         RST 0x38
*          3887  ff         RST 0x38
*          3888  ff         RST 0x38
*          3889  ff         RST 0x38
*          388A  ff         RST 0x38
*          388B  ff         RST 0x38
*          388C  ff         RST 0x38
*          388D  ff         RST 0x38
*          388E  ff         RST 0x38
*          388F  ff         RST 0x38
*          3890  ff         RST 0x38
*          3891  ff         RST 0x38
*          3892  ff         RST 0x38
*          3893  ff         RST 0x38
*          3894  ff         RST 0x38
*          3895  ff         RST 0x38
*          3896  ff         RST 0x38
*          3897  ff         RST 0x38
*          3898  ff         RST 0x38
*          3899  ff         RST 0x38
*          389A  ff         RST 0x38
*          389B  ff         RST 0x38
*          389C  ff         RST 0x38
*          389D  ff         RST 0x38
*          389E  ff         RST 0x38
*          389F  ff         RST 0x38
*          38A0  ff         RST 0x38
*          38A1  ff         RST 0x38
*          38A2  ff         RST 0x38
*          38A3  ff         RST 0x38
*          38A4  ff         RST 0x38
*          38A5  ff         RST 0x38
*          38A6  ff         RST 0x38
*          38A7  ff         RST 0x38
*          38A8  ff         RST 0x38
*          38A9  ff         RST 0x38
*          38AA  ff         RST 0x38
*          38AB  ff         RST 0x38
*          38AC  ff         RST 0x38
*          38AD  ff         RST 0x38
*          38AE  ff         RST 0x38
*          38AF  ff         RST 0x38
*          38B0  ff         RST 0x38
*          38B1  ff         RST 0x38
*          38B2  ff         RST 0x38
*          38B3  ff         RST 0x38
*          38B4  ff         RST 0x38
*          38B5  ff         RST 0x38
*          38B6  ff         RST 0x38
*          38B7  ff         RST 0x38
*          38B8  ff         RST 0x38
*          38B9  ff         RST 0x38
*          38BA  ff         RST 0x38
*          38BB  ff         RST 0x38
*          38BC  ff         RST 0x38
*          38BD  ff         RST 0x38
*          38BE  ff         RST 0x38
*          38BF  ff         RST 0x38
*          38C0  ff         RST 0x38
*          38C1  ff         RST 0x38
*          38C2  ff         RST 0x38
*          38C3  ff         RST 0x38
*          38C4  ff         RST 0x38
*          38C5  ff         RST 0x38
*          38C6  ff         RST 0x38
*          38C7  ff         RST 0x38
*          38C8  ff         RST 0x38
*          38C9  ff         RST 0x38
*          38CA  ff         RST 0x38
*          38CB  ff         RST 0x38
*          38CC  ff         RST 0x38
*          38CD  ff         RST 0x38
*          38CE  ff         RST 0x38
*          38CF  ff         RST 0x38
*          38D0  ff         RST 0x38
*          38D1  ff         RST 0x38
*          38D2  ff         RST 0x38
*          38D3  ff         RST 0x38
*          38D4  ff         RST 0x38
*          38D5  ff         RST 0x38
*          38D6  ff         RST 0x38
*          38D7  ff         RST 0x38
*          38D8  ff         RST 0x38
*          38D9  ff         RST 0x38
*          38DA  ff         RST 0x38
*          38DB  ff         RST 0x38
*          38DC  ff         RST 0x38
*          38DD  ff         RST 0x38
*          38DE  ff         RST 0x38
*          38DF  ff         RST 0x38
*          38E0  ff         RST 0x38
*          38E1  ff         RST 0x38
*          38E2  ff         RST 0x38
*          38E3  ff         RST 0x38
*          38E4  ff         RST 0x38
*          38E5  ff         RST 0x38
*          38E6  ff         RST 0x38
*          38E7  ff         RST 0x38
*          38E8  ff         RST 0x38
*          38E9  ff         RST 0x38
*          38EA  ff         RST 0x38
*          38EB  ff         RST 0x38
*          38EC  ff         RST 0x38
*          38ED  ff         RST 0x38
*          38EE  ff         RST 0x38
*          38EF  ff         RST 0x38
*          38F0  ff         RST 0x38
*          38F1  ff         RST 0x38
*          38F2  ff         RST 0x38
*          38F3  ff         RST 0x38
*          38F4  ff         RST 0x38
*          38F5  ff         RST 0x38
*          38F6  ff         RST 0x38
*          38F7  ff         RST 0x38
*          38F8  ff         RST 0x38
*          38F9  ff         RST 0x38
*          38FA  ff         RST 0x38
*          38FB  ff         RST 0x38
*          38FC  ff         RST 0x38
*          38FD  ff         RST 0x38
*          38FE  ff         RST 0x38
*          38FF  ff         RST 0x38
*          3900  ff         RST 0x38
*          3901  ff         RST 0x38
*          3902  ff         RST 0x38
*          3903  ff         RST 0x38
*          3904  ff         RST 0x38
*          3905  ff         RST 0x38
*          3906  ff         RST 0x38
*          3907  ff         RST 0x38
*          3908  ff         RST 0x38
*          3909  ff         RST 0x38
*          390A  ff         RST 0x38
*          390B  ff         RST 0x38
*          390C  ff         RST 0x38
*          390D  ff         RST 0x38
*          390E  ff         RST 0x38
*          390F  ff         RST 0x38
*          3910  ff         RST 0x38
*          3911  ff         RST 0x38
*          3912  ff         RST 0x38
*          3913  ff         RST 0x38
*          3914  ff         RST 0x38
*          3915  ff         RST 0x38
*          3916  ff         RST 0x38
*          3917  ff         RST 0x38
*          3918  ff         RST 0x38
*          3919  ff         RST 0x38
*          391A  ff         RST 0x38
*          391B  ff         RST 0x38
*          391C  ff         RST 0x38
*          391D  ff         RST 0x38
*          391E  ff         RST 0x38
*          391F  ff         RST 0x38
*          3920  ff         RST 0x38
*          3921  ff         RST 0x38
*          3922  ff         RST 0x38
*          3923  ff         RST 0x38
*          3924  ff         RST 0x38
*          3925  ff         RST 0x38
*          3926  ff         RST 0x38
*          3927  ff         RST 0x38
*          3928  ff         RST 0x38
*          3929  ff         RST 0x38
*          392A  ff         RST 0x38
*          392B  ff         RST 0x38
*          392C  ff         RST 0x38
*          392D  ff         RST 0x38
*          392E  ff         RST 0x38
*          392F  ff         RST 0x38
*          3930  ff         RST 0x38
*          3931  ff         RST 0x38
*          3932  ff         RST 0x38
*          3933  ff         RST 0x38
*          3934  ff         RST 0x38
*          3935  ff         RST 0x38
*          3936  ff         RST 0x38
*          3937  ff         RST 0x38
*          3938  ff         RST 0x38
*          3939  ff         RST 0x38
*          393A  ff         RST 0x38
*          393B  ff         RST 0x38
*          393C  ff         RST 0x38
*          393D  ff         RST 0x38
*          393E  ff         RST 0x38
*          393F  ff         RST 0x38
*          3940  ff         RST 0x38
*          3941  ff         RST 0x38
*          3942  ff         RST 0x38
*          3943  ff         RST 0x38
*          3944  ff         RST 0x38
*          3945  ff         RST 0x38
*          3946  ff         RST 0x38
*          3947  ff         RST 0x38
*          3948  ff         RST 0x38
*          3949  ff         RST 0x38
*          394A  ff         RST 0x38
*          394B  ff         RST 0x38
*          394C  ff         RST 0x38
*          394D  ff         RST 0x38
*          394E  ff         RST 0x38
*          394F  ff         RST 0x38
*          3950  ff         RST 0x38
*          3951  ff         RST 0x38
*          3952  ff         RST 0x38
*          3953  ff         RST 0x38
*          3954  ff         RST 0x38
*          3955  ff         RST 0x38
*          3956  ff         RST 0x38
*          3957  ff         RST 0x38
*          3958  ff         RST 0x38
*          3959  ff         RST 0x38
*          395A  ff         RST 0x38
*          395B  ff         RST 0x38
*          395C  ff         RST 0x38
*          395D  ff         RST 0x38
*          395E  ff         RST 0x38
*          395F  ff         RST 0x38
*          3960  ff         RST 0x38
*          3961  ff         RST 0x38
*          3962  ff         RST 0x38
*          3963  ff         RST 0x38
*          3964  ff         RST 0x38
*          3965  ff         RST 0x38
*          3966  ff         RST 0x38
*          3967  ff         RST 0x38
*          3968  ff         RST 0x38
*          3969  ff         RST 0x38
*          396A  ff         RST 0x38
*          396B  ff         RST 0x38
*          396C  ff         RST 0x38
*          396D  ff         RST 0x38
*          396E  ff         RST 0x38
*          396F  ff         RST 0x38
*          3970  ff         RST 0x38
*          3971  ff         RST 0x38
*          3972  ff         RST 0x38
*          3973  ff         RST 0x38
*          3974  ff         RST 0x38
*          3975  ff         RST 0x38
*          3976  ff         RST 0x38
*          3977  ff         RST 0x38
*          3978  ff         RST 0x38
*          3979  ff         RST 0x38
*          397A  ff         RST 0x38
*          397B  ff         RST 0x38
*          397C  ff         RST 0x38
*          397D  ff         RST 0x38
*          397E  ff         RST 0x38
*          397F  ff         RST 0x38
*          3980  ff         RST 0x38
*          3981  ff         RST 0x38
*          3982  ff         RST 0x38
*          3983  ff         RST 0x38
*          3984  ff         RST 0x38
*          3985  ff         RST 0x38
*          3986  ff         RST 0x38
*          3987  ff         RST 0x38
*          3988  ff         RST 0x38
*          3989  ff         RST 0x38
*          398A  ff         RST 0x38
*          398B  ff         RST 0x38
*          398C  ff         RST 0x38
*          398D  ff         RST 0x38
*          398E  ff         RST 0x38
*          398F  ff         RST 0x38
*          3990  ff         RST 0x38
*          3991  ff         RST 0x38
*          3992  ff         RST 0x38
*          3993  ff         RST 0x38
*          3994  ff         RST 0x38
*          3995  ff         RST 0x38
*          3996  ff         RST 0x38
*          3997  ff         RST 0x38
*          3998  ff         RST 0x38
*          3999  ff         RST 0x38
*          399A  ff         RST 0x38
*          399B  ff         RST 0x38
*          399C  ff         RST 0x38
*          399D  ff         RST 0x38
*          399E  ff         RST 0x38
*          399F  ff         RST 0x38
*          39A0  ff         RST 0x38
*          39A1  ff         RST 0x38
*          39A2  ff         RST 0x38
*          39A3  ff         RST 0x38
*          39A4  ff         RST 0x38
*          39A5  ff         RST 0x38
*          39A6  ff         RST 0x38
*          39A7  ff         RST 0x38
*          39A8  ff         RST 0x38
*          39A9  ff         RST 0x38
*          39AA  ff         RST 0x38
*          39AB  ff         RST 0x38
*          39AC  ff         RST 0x38
*          39AD  ff         RST 0x38
*          39AE  ff         RST 0x38
*          39AF  ff         RST 0x38
*          39B0  ff         RST 0x38
*          39B1  ff         RST 0x38
*          39B2  ff         RST 0x38
*          39B3  ff         RST 0x38
*          39B4  ff         RST 0x38
*          39B5  ff         RST 0x38
*          39B6  ff         RST 0x38
*          39B7  ff         RST 0x38
*          39B8  ff         RST 0x38
*          39B9  ff         RST 0x38
*          39BA  ff         RST 0x38
*          39BB  ff         RST 0x38
*          39BC  ff         RST 0x38
*          39BD  ff         RST 0x38
*          39BE  ff         RST 0x38
*          39BF  ff         RST 0x38
*          39C0  ff         RST 0x38
*          39C1  ff         RST 0x38
*          39C2  ff         RST 0x38
*          39C3  ff         RST 0x38
*          39C4  ff         RST 0x38
*          39C5  ff         RST 0x38
*          39C6  ff         RST 0x38
*          39C7  ff         RST 0x38
*          39C8  ff         RST 0x38
*          39C9  ff         RST 0x38
*          39CA  ff         RST 0x38
*          39CB  ff         RST 0x38
*          39CC  ff         RST 0x38
*          39CD  ff         RST 0x38
*          39CE  ff         RST 0x38
*          39CF  ff         RST 0x38
*          39D0  ff         RST 0x38
*          39D1  ff         RST 0x38
*          39D2  ff         RST 0x38
*          39D3  ff         RST 0x38
*          39D4  ff         RST 0x38
*          39D5  ff         RST 0x38
*          39D6  ff         RST 0x38
*          39D7  ff         RST 0x38
*          39D8  ff         RST 0x38
*          39D9  ff         RST 0x38
*          39DA  ff         RST 0x38
*          39DB  ff         RST 0x38
*          39DC  ff         RST 0x38
*          39DD  ff         RST 0x38
*          39DE  ff         RST 0x38
*          39DF  ff         RST 0x38
*          39E0  ff         RST 0x38
*          39E1  ff         RST 0x38
*          39E2  ff         RST 0x38
*          39E3  ff         RST 0x38
*          39E4  ff         RST 0x38
*          39E5  ff         RST 0x38
*          39E6  ff         RST 0x38
*          39E7  ff         RST 0x38
*          39E8  ff         RST 0x38
*          39E9  ff         RST 0x38
*          39EA  ff         RST 0x38
*          39EB  ff         RST 0x38
*          39EC  ff         RST 0x38
*          39ED  ff         RST 0x38
*          39EE  ff         RST 0x38
*          39EF  ff         RST 0x38
*          39F0  ff         RST 0x38
*          39F1  ff         RST 0x38
*          39F2  ff         RST 0x38
*          39F3  ff         RST 0x38
*          39F4  ff         RST 0x38
*          39F5  ff         RST 0x38
*          39F6  ff         RST 0x38
*          39F7  ff         RST 0x38
*          39F8  ff         RST 0x38
*          39F9  ff         RST 0x38
*          39FA  ff         RST 0x38
*          39FB  ff         RST 0x38
*          39FC  ff         RST 0x38
*          39FD  ff         RST 0x38
*          39FE  ff         RST 0x38
*          39FF  ff         RST 0x38
*          3A00  ff         RST 0x38
*          3A01  ff         RST 0x38
*          3A02  ff         RST 0x38
*          3A03  ff         RST 0x38
*          3A04  ff         RST 0x38
*          3A05  ff         RST 0x38
*          3A06  ff         RST 0x38
*          3A07  ff         RST 0x38
*          3A08  ff         RST 0x38
*          3A09  ff         RST 0x38
*          3A0A  ff         RST 0x38
*          3A0B  ff         RST 0x38
*          3A0C  ff         RST 0x38
*          3A0D  ff         RST 0x38
*          3A0E  ff         RST 0x38
*          3A0F  ff         RST 0x38
*          3A10  ff         RST 0x38
*          3A11  ff         RST 0x38
*          3A12  ff         RST 0x38
*          3A13  ff         RST 0x38
*          3A14  ff         RST 0x38
*          3A15  ff         RST 0x38
*          3A16  ff         RST 0x38
*          3A17  ff         RST 0x38
*          3A18  ff         RST 0x38
*          3A19  ff         RST 0x38
*          3A1A  ff         RST 0x38
*          3A1B  ff         RST 0x38
*          3A1C  ff         RST 0x38
*          3A1D  ff         RST 0x38
*          3A1E  ff         RST 0x38
*          3A1F  ff         RST 0x38
*          3A20  ff         RST 0x38
*          3A21  ff         RST 0x38
*          3A22  ff         RST 0x38
*          3A23  ff         RST 0x38
*          3A24  ff         RST 0x38
*          3A25  ff         RST 0x38
*          3A26  ff         RST 0x38
*          3A27  ff         RST 0x38
*          3A28  ff         RST 0x38
*          3A29  ff         RST 0x38
*          3A2A  ff         RST 0x38
*          3A2B  ff         RST 0x38
*          3A2C  ff         RST 0x38
*          3A2D  ff         RST 0x38
*          3A2E  ff         RST 0x38
*          3A2F  ff         RST 0x38
*          3A30  ff         RST 0x38
*          3A31  ff         RST 0x38
*          3A32  ff         RST 0x38
*          3A33  ff         RST 0x38
*          3A34  ff         RST 0x38
*          3A35  ff         RST 0x38
*          3A36  ff         RST 0x38
*          3A37  ff         RST 0x38
*          3A38  ff         RST 0x38
*          3A39  ff         RST 0x38
*          3A3A  ff         RST 0x38
*          3A3B  ff         RST 0x38
*          3A3C  ff         RST 0x38
*          3A3D  ff         RST 0x38
*          3A3E  ff         RST 0x38
*          3A3F  ff         RST 0x38
*          3A40  ff         RST 0x38
*          3A41  ff         RST 0x38
*          3A42  ff         RST 0x38
*          3A43  ff         RST 0x38
*          3A44  ff         RST 0x38
*          3A45  ff         RST 0x38
*          3A46  ff         RST 0x38
*          3A47  ff         RST 0x38
*          3A48  ff         RST 0x38
*          3A49  ff         RST 0x38
*          3A4A  ff         RST 0x38
*          3A4B  ff         RST 0x38
*          3A4C  ff         RST 0x38
*          3A4D  ff         RST 0x38
*          3A4E  ff         RST 0x38
*          3A4F  ff         RST 0x38
*          3A50  ff         RST 0x38
*          3A51  ff         RST 0x38
*          3A52  ff         RST 0x38
*          3A53  ff         RST 0x38
*          3A54  ff         RST 0x38
*          3A55  ff         RST 0x38
*          3A56  ff         RST 0x38
*          3A57  ff         RST 0x38
*          3A58  ff         RST 0x38
*          3A59  ff         RST 0x38
*          3A5A  ff         RST 0x38
*          3A5B  ff         RST 0x38
*          3A5C  ff         RST 0x38
*          3A5D  ff         RST 0x38
*          3A5E  ff         RST 0x38
*          3A5F  ff         RST 0x38
*          3A60  ff         RST 0x38
*          3A61  ff         RST 0x38
*          3A62  ff         RST 0x38
*          3A63  ff         RST 0x38
*          3A64  ff         RST 0x38
*          3A65  ff         RST 0x38
*          3A66  ff         RST 0x38
*          3A67  ff         RST 0x38
*          3A68  ff         RST 0x38
*          3A69  ff         RST 0x38
*          3A6A  ff         RST 0x38
*          3A6B  ff         RST 0x38
*          3A6C  ff         RST 0x38
*          3A6D  ff         RST 0x38
*          3A6E  ff         RST 0x38
*          3A6F  ff         RST 0x38
*          3A70  ff         RST 0x38
*          3A71  ff         RST 0x38
*          3A72  ff         RST 0x38
*          3A73  ff         RST 0x38
*          3A74  ff         RST 0x38
*          3A75  ff         RST 0x38
*          3A76  ff         RST 0x38
*          3A77  ff         RST 0x38
*          3A78  ff         RST 0x38
*          3A79  ff         RST 0x38
*          3A7A  ff         RST 0x38
*          3A7B  ff         RST 0x38
*          3A7C  ff         RST 0x38
*          3A7D  ff         RST 0x38
*          3A7E  ff         RST 0x38
*          3A7F  ff         RST 0x38
*          3A80  ff         RST 0x38
*          3A81  ff         RST 0x38
*          3A82  ff         RST 0x38
*          3A83  ff         RST 0x38
*          3A84  ff         RST 0x38
*          3A85  ff         RST 0x38
*          3A86  ff         RST 0x38
*          3A87  ff         RST 0x38
*          3A88  ff         RST 0x38
*          3A89  ff         RST 0x38
*          3A8A  ff         RST 0x38
*          3A8B  ff         RST 0x38
*          3A8C  ff         RST 0x38
*          3A8D  ff         RST 0x38
*          3A8E  ff         RST 0x38
*          3A8F  ff         RST 0x38
*          3A90  ff         RST 0x38
*          3A91  ff         RST 0x38
*          3A92  ff         RST 0x38
*          3A93  ff         RST 0x38
*          3A94  ff         RST 0x38
*          3A95  ff         RST 0x38
*          3A96  ff         RST 0x38
*          3A97  ff         RST 0x38
*          3A98  ff         RST 0x38
*          3A99  ff         RST 0x38
*          3A9A  ff         RST 0x38
*          3A9B  ff         RST 0x38
*          3A9C  ff         RST 0x38
*          3A9D  ff         RST 0x38
*          3A9E  ff         RST 0x38
*          3A9F  ff         RST 0x38
*          3AA0  ff         RST 0x38
*          3AA1  ff         RST 0x38
*          3AA2  ff         RST 0x38
*          3AA3  ff         RST 0x38
*          3AA4  ff         RST 0x38
*          3AA5  ff         RST 0x38
*          3AA6  ff         RST 0x38
*          3AA7  ff         RST 0x38
*          3AA8  ff         RST 0x38
*          3AA9  ff         RST 0x38
*          3AAA  ff         RST 0x38
*          3AAB  ff         RST 0x38
*          3AAC  ff         RST 0x38
*          3AAD  ff         RST 0x38
*          3AAE  ff         RST 0x38
*          3AAF  ff         RST 0x38
*          3AB0  ff         RST 0x38
*          3AB1  ff         RST 0x38
*          3AB2  ff         RST 0x38
*          3AB3  ff         RST 0x38
*          3AB4  ff         RST 0x38
*          3AB5  ff         RST 0x38
*          3AB6  ff         RST 0x38
*          3AB7  ff         RST 0x38
*          3AB8  ff         RST 0x38
*          3AB9  ff         RST 0x38
*          3ABA  ff         RST 0x38
*          3ABB  ff         RST 0x38
*          3ABC  ff         RST 0x38
*          3ABD  ff         RST 0x38
*          3ABE  ff         RST 0x38
*          3ABF  ff         RST 0x38
*          3AC0  ff         RST 0x38
*          3AC1  ff         RST 0x38
*          3AC2  ff         RST 0x38
*          3AC3  ff         RST 0x38
*          3AC4  ff         RST 0x38
*          3AC5  ff         RST 0x38
*          3AC6  ff         RST 0x38
*          3AC7  ff         RST 0x38
*          3AC8  ff         RST 0x38
*          3AC9  ff         RST 0x38
*          3ACA  ff         RST 0x38
*          3ACB  ff         RST 0x38
*          3ACC  ff         RST 0x38
*          3ACD  ff         RST 0x38
*          3ACE  ff         RST 0x38
*          3ACF  ff         RST 0x38
*          3AD0  ff         RST 0x38
*          3AD1  ff         RST 0x38
*          3AD2  ff         RST 0x38
*          3AD3  ff         RST 0x38
*          3AD4  ff         RST 0x38
*          3AD5  ff         RST 0x38
*          3AD6  ff         RST 0x38
*          3AD7  ff         RST 0x38
*          3AD8  ff         RST 0x38
*          3AD9  ff         RST 0x38
*          3ADA  ff         RST 0x38
*          3ADB  ff         RST 0x38
*          3ADC  ff         RST 0x38
*          3ADD  ff         RST 0x38
*          3ADE  ff         RST 0x38
*          3ADF  ff         RST 0x38
*          3AE0  ff         RST 0x38
*          3AE1  ff         RST 0x38
*          3AE2  ff         RST 0x38
*          3AE3  ff         RST 0x38
*          3AE4  ff         RST 0x38
*          3AE5  ff         RST 0x38
*          3AE6  ff         RST 0x38
*          3AE7  ff         RST 0x38
*          3AE8  ff         RST 0x38
*          3AE9  ff         RST 0x38
*          3AEA  ff         RST 0x38
*          3AEB  ff         RST 0x38
*          3AEC  ff         RST 0x38
*          3AED  ff         RST 0x38
*          3AEE  ff         RST 0x38
*          3AEF  ff         RST 0x38
*          3AF0  ff         RST 0x38
*          3AF1  ff         RST 0x38
*          3AF2  ff         RST 0x38
*          3AF3  ff         RST 0x38
*          3AF4  ff         RST 0x38
*          3AF5  ff         RST 0x38
*          3AF6  ff         RST 0x38
*          3AF7  ff         RST 0x38
*          3AF8  ff         RST 0x38
*          3AF9  ff         RST 0x38
*          3AFA  ff         RST 0x38
*          3AFB  ff         RST 0x38
*          3AFC  ff         RST 0x38
*          3AFD  ff         RST 0x38
*          3AFE  ff         RST 0x38
*          3AFF  ff         RST 0x38
*          3B00  ff         RST 0x38
*          3B01  ff         RST 0x38
*          3B02  ff         RST 0x38
*          3B03  ff         RST 0x38
*          3B04  ff         RST 0x38
*          3B05  ff         RST 0x38
*          3B06  ff         RST 0x38
*          3B07  ff         RST 0x38
*          3B08  ff         RST 0x38
*          3B09  ff         RST 0x38
*          3B0A  ff         RST 0x38
*          3B0B  ff         RST 0x38
*          3B0C  ff         RST 0x38
*          3B0D  ff         RST 0x38
*          3B0E  ff         RST 0x38
*          3B0F  ff         RST 0x38
*          3B10  ff         RST 0x38
*          3B11  ff         RST 0x38
*          3B12  ff         RST 0x38
*          3B13  ff         RST 0x38
*          3B14  ff         RST 0x38
*          3B15  ff         RST 0x38
*          3B16  ff         RST 0x38
*          3B17  ff         RST 0x38
*          3B18  ff         RST 0x38
*          3B19  ff         RST 0x38
*          3B1A  ff         RST 0x38
*          3B1B  ff         RST 0x38
*          3B1C  ff         RST 0x38
*          3B1D  ff         RST 0x38
*          3B1E  ff         RST 0x38
*          3B1F  ff         RST 0x38
*          3B20  ff         RST 0x38
*          3B21  ff         RST 0x38
*          3B22  ff         RST 0x38
*          3B23  ff         RST 0x38
*          3B24  ff         RST 0x38
*          3B25  ff         RST 0x38
*          3B26  ff         RST 0x38
*          3B27  ff         RST 0x38
*          3B28  ff         RST 0x38
*          3B29  ff         RST 0x38
*          3B2A  ff         RST 0x38
*          3B2B  ff         RST 0x38
*          3B2C  ff         RST 0x38
*          3B2D  ff         RST 0x38
*          3B2E  ff         RST 0x38
*          3B2F  ff         RST 0x38
*          3B30  ff         RST 0x38
*          3B31  ff         RST 0x38
*          3B32  ff         RST 0x38
*          3B33  ff         RST 0x38
*          3B34  ff         RST 0x38
*          3B35  ff         RST 0x38
*          3B36  ff         RST 0x38
*          3B37  ff         RST 0x38
*          3B38  ff         RST 0x38
*          3B39  ff         RST 0x38
*          3B3A  ff         RST 0x38
*          3B3B  ff         RST 0x38
*          3B3C  ff         RST 0x38
*          3B3D  ff         RST 0x38
*          3B3E  ff         RST 0x38
*          3B3F  ff         RST 0x38
*          3B40  ff         RST 0x38
*          3B41  ff         RST 0x38
*          3B42  ff         RST 0x38
*          3B43  ff         RST 0x38
*          3B44  ff         RST 0x38
*          3B45  ff         RST 0x38
*          3B46  ff         RST 0x38
*          3B47  ff         RST 0x38
*          3B48  ff         RST 0x38
*          3B49  ff         RST 0x38
*          3B4A  ff         RST 0x38
*          3B4B  ff         RST 0x38
*          3B4C  ff         RST 0x38
*          3B4D  ff         RST 0x38
*          3B4E  ff         RST 0x38
*          3B4F  ff         RST 0x38
*          3B50  ff         RST 0x38
*          3B51  ff         RST 0x38
*          3B52  ff         RST 0x38
*          3B53  ff         RST 0x38
*          3B54  ff         RST 0x38
*          3B55  ff         RST 0x38
*          3B56  ff         RST 0x38
*          3B57  ff         RST 0x38
*          3B58  ff         RST 0x38
*          3B59  ff         RST 0x38
*          3B5A  ff         RST 0x38
*          3B5B  ff         RST 0x38
*          3B5C  ff         RST 0x38
*          3B5D  ff         RST 0x38
*          3B5E  ff         RST 0x38
*          3B5F  ff         RST 0x38
*          3B60  ff         RST 0x38
*          3B61  ff         RST 0x38
*          3B62  ff         RST 0x38
*          3B63  ff         RST 0x38
*          3B64  ff         RST 0x38
*          3B65  ff         RST 0x38
*          3B66  ff         RST 0x38
*          3B67  ff         RST 0x38
*          3B68  ff         RST 0x38
*          3B69  ff         RST 0x38
*          3B6A  ff         RST 0x38
*          3B6B  ff         RST 0x38
*          3B6C  ff         RST 0x38
*          3B6D  ff         RST 0x38
*          3B6E  ff         RST 0x38
*          3B6F  ff         RST 0x38
*          3B70  ff         RST 0x38
*          3B71  ff         RST 0x38
*          3B72  ff         RST 0x38
*          3B73  ff         RST 0x38
*          3B74  ff         RST 0x38
*          3B75  ff         RST 0x38
*          3B76  ff         RST 0x38
*          3B77  ff         RST 0x38
*          3B78  ff         RST 0x38
*          3B79  ff         RST 0x38
*          3B7A  ff         RST 0x38
*          3B7B  ff         RST 0x38
*          3B7C  ff         RST 0x38
*          3B7D  ff         RST 0x38
*          3B7E  ff         RST 0x38
*          3B7F  ff         RST 0x38
*          3B80  ff         RST 0x38
*          3B81  ff         RST 0x38
*          3B82  ff         RST 0x38
*          3B83  ff         RST 0x38
*          3B84  ff         RST 0x38
*          3B85  ff         RST 0x38
*          3B86  ff         RST 0x38
*          3B87  ff         RST 0x38
*          3B88  ff         RST 0x38
*          3B89  ff         RST 0x38
*          3B8A  ff         RST 0x38
*          3B8B  ff         RST 0x38
*          3B8C  ff         RST 0x38
*          3B8D  ff         RST 0x38
*          3B8E  ff         RST 0x38
*          3B8F  ff         RST 0x38
*          3B90  ff         RST 0x38
*          3B91  ff         RST 0x38
*          3B92  ff         RST 0x38
*          3B93  ff         RST 0x38
*          3B94  ff         RST 0x38
*          3B95  ff         RST 0x38
*          3B96  ff         RST 0x38
*          3B97  ff         RST 0x38
*          3B98  ff         RST 0x38
*          3B99  ff         RST 0x38
*          3B9A  ff         RST 0x38
*          3B9B  ff         RST 0x38
*          3B9C  ff         RST 0x38
*          3B9D  ff         RST 0x38
*          3B9E  ff         RST 0x38
*          3B9F  ff         RST 0x38
*          3BA0  ff         RST 0x38
*          3BA1  ff         RST 0x38
*          3BA2  ff         RST 0x38
*          3BA3  ff         RST 0x38
*          3BA4  ff         RST 0x38
*          3BA5  ff         RST 0x38
*          3BA6  ff         RST 0x38
*          3BA7  ff         RST 0x38
*          3BA8  ff         RST 0x38
*          3BA9  ff         RST 0x38
*          3BAA  ff         RST 0x38
*          3BAB  ff         RST 0x38
*          3BAC  ff         RST 0x38
*          3BAD  ff         RST 0x38
*          3BAE  ff         RST 0x38
*          3BAF  ff         RST 0x38
*          3BB0  ff         RST 0x38
*          3BB1  ff         RST 0x38
*          3BB2  ff         RST 0x38
*          3BB3  ff         RST 0x38
*          3BB4  ff         RST 0x38
*          3BB5  ff         RST 0x38
*          3BB6  ff         RST 0x38
*          3BB7  ff         RST 0x38
*          3BB8  ff         RST 0x38
*          3BB9  ff         RST 0x38
*          3BBA  ff         RST 0x38
*          3BBB  ff         RST 0x38
*          3BBC  ff         RST 0x38
*          3BBD  ff         RST 0x38
*          3BBE  ff         RST 0x38
*          3BBF  ff         RST 0x38
*          3BC0  ff         RST 0x38
*          3BC1  ff         RST 0x38
*          3BC2  ff         RST 0x38
*          3BC3  ff         RST 0x38
*          3BC4  ff         RST 0x38
*          3BC5  ff         RST 0x38
*          3BC6  ff         RST 0x38
*          3BC7  ff         RST 0x38
*          3BC8  ff         RST 0x38
*          3BC9  ff         RST 0x38
*          3BCA  ff         RST 0x38
*          3BCB  ff         RST 0x38
*          3BCC  ff         RST 0x38
*          3BCD  ff         RST 0x38
*          3BCE  ff         RST 0x38
*          3BCF  ff         RST 0x38
*          3BD0  ff         RST 0x38
*          3BD1  ff         RST 0x38
*          3BD2  ff         RST 0x38
*          3BD3  ff         RST 0x38
*          3BD4  ff         RST 0x38
*          3BD5  ff         RST 0x38
*          3BD6  ff         RST 0x38
*          3BD7  ff         RST 0x38
*          3BD8  ff         RST 0x38
*          3BD9  ff         RST 0x38
*          3BDA  ff         RST 0x38
*          3BDB  ff         RST 0x38
*          3BDC  ff         RST 0x38
*          3BDD  ff         RST 0x38
*          3BDE  ff         RST 0x38
*          3BDF  ff         RST 0x38
*          3BE0  ff         RST 0x38
*          3BE1  ff         RST 0x38
*          3BE2  ff         RST 0x38
*          3BE3  ff         RST 0x38
*          3BE4  ff         RST 0x38
*          3BE5  ff         RST 0x38
*          3BE6  ff         RST 0x38
*          3BE7  ff         RST 0x38
*          3BE8  ff         RST 0x38
*          3BE9  ff         RST 0x38
*          3BEA  ff         RST 0x38
*          3BEB  ff         RST 0x38
*          3BEC  ff         RST 0x38
*          3BED  ff         RST 0x38
*          3BEE  ff         RST 0x38
*          3BEF  ff         RST 0x38
*          3BF0  ff         RST 0x38
*          3BF1  ff         RST 0x38
*          3BF2  ff         RST 0x38
*          3BF3  ff         RST 0x38
*          3BF4  ff         RST 0x38
*          3BF5  ff         RST 0x38
*          3BF6  ff         RST 0x38
*          3BF7  ff         RST 0x38
*          3BF8  ff         RST 0x38
*          3BF9  ff         RST 0x38
*          3BFA  ff         RST 0x38
*          3BFB  ff         RST 0x38
*          3BFC  ff         RST 0x38
*          3BFD  ff         RST 0x38
*          3BFE  ff         RST 0x38
*          3BFF  ff         RST 0x38
*          3C00  ff         RST 0x38
*          3C01  ff         RST 0x38
*          3C02  ff         RST 0x38
*          3C03  ff         RST 0x38
*          3C04  ff         RST 0x38
*          3C05  ff         RST 0x38
*          3C06  ff         RST 0x38
*          3C07  ff         RST 0x38
*          3C08  ff         RST 0x38
*          3C09  ff         RST 0x38
*          3C0A  ff         RST 0x38
*          3C0B  ff         RST 0x38
*          3C0C  ff         RST 0x38
*          3C0D  ff         RST 0x38
*          3C0E  ff         RST 0x38
*          3C0F  ff         RST 0x38
*          3C10  ff         RST 0x38
*          3C11  ff         RST 0x38
*          3C12  ff         RST 0x38
*          3C13  ff         RST 0x38
*          3C14  ff         RST 0x38
*          3C15  ff         RST 0x38
*          3C16  ff         RST 0x38
*          3C17  ff         RST 0x38
*          3C18  ff         RST 0x38
*          3C19  ff         RST 0x38
*          3C1A  ff         RST 0x38
*          3C1B  ff         RST 0x38
*          3C1C  ff         RST 0x38
*          3C1D  ff         RST 0x38
*          3C1E  ff         RST 0x38
*          3C1F  ff         RST 0x38
*          3C20  ff         RST 0x38
*          3C21  ff         RST 0x38
*          3C22  ff         RST 0x38
*          3C23  ff         RST 0x38
*          3C24  ff         RST 0x38
*          3C25  ff         RST 0x38
*          3C26  ff         RST 0x38
*          3C27  ff         RST 0x38
*          3C28  ff         RST 0x38
*          3C29  ff         RST 0x38
*          3C2A  ff         RST 0x38
*          3C2B  ff         RST 0x38
*          3C2C  ff         RST 0x38
*          3C2D  ff         RST 0x38
*          3C2E  ff         RST 0x38
*          3C2F  ff         RST 0x38
*          3C30  ff         RST 0x38
*          3C31  ff         RST 0x38
*          3C32  ff         RST 0x38
*          3C33  ff         RST 0x38
*          3C34  ff         RST 0x38
*          3C35  ff         RST 0x38
*          3C36  ff         RST 0x38
*          3C37  ff         RST 0x38
*          3C38  ff         RST 0x38
*          3C39  ff         RST 0x38
*          3C3A  ff         RST 0x38
*          3C3B  ff         RST 0x38
*          3C3C  ff         RST 0x38
*          3C3D  ff         RST 0x38
*          3C3E  ff         RST 0x38
*          3C3F  ff         RST 0x38
*          3C40  ff         RST 0x38
*          3C41  ff         RST 0x38
*          3C42  ff         RST 0x38
*          3C43  ff         RST 0x38
*          3C44  ff         RST 0x38
*          3C45  ff         RST 0x38
*          3C46  ff         RST 0x38
*          3C47  ff         RST 0x38
*          3C48  ff         RST 0x38
*          3C49  ff         RST 0x38
*          3C4A  ff         RST 0x38
*          3C4B  ff         RST 0x38
*          3C4C  ff         RST 0x38
*          3C4D  ff         RST 0x38
*          3C4E  ff         RST 0x38
*          3C4F  ff         RST 0x38
*          3C50  ff         RST 0x38
*          3C51  ff         RST 0x38
*          3C52  ff         RST 0x38
*          3C53  ff         RST 0x38
*          3C54  ff         RST 0x38
*          3C55  ff         RST 0x38
*          3C56  ff         RST 0x38
*          3C57  ff         RST 0x38
*          3C58  ff         RST 0x38
*          3C59  ff         RST 0x38
*          3C5A  ff         RST 0x38
*          3C5B  ff         RST 0x38
*          3C5C  ff         RST 0x38
*          3C5D  ff         RST 0x38
*          3C5E  ff         RST 0x38
*          3C5F  ff         RST 0x38
*          3C60  ff         RST 0x38
*          3C61  ff         RST 0x38
*          3C62  ff         RST 0x38
*          3C63  ff         RST 0x38
*          3C64  ff         RST 0x38
*          3C65  ff         RST 0x38
*          3C66  ff         RST 0x38
*          3C67  ff         RST 0x38
*          3C68  ff         RST 0x38
*          3C69  ff         RST 0x38
*          3C6A  ff         RST 0x38
*          3C6B  ff         RST 0x38
*          3C6C  ff         RST 0x38
*          3C6D  ff         RST 0x38
*          3C6E  ff         RST 0x38
*          3C6F  ff         RST 0x38
*          3C70  ff         RST 0x38
*          3C71  ff         RST 0x38
*          3C72  ff         RST 0x38
*          3C73  ff         RST 0x38
*          3C74  ff         RST 0x38
*          3C75  ff         RST 0x38
*          3C76  ff         RST 0x38
*          3C77  ff         RST 0x38
*          3C78  ff         RST 0x38
*          3C79  ff         RST 0x38
*          3C7A  ff         RST 0x38
*          3C7B  ff         RST 0x38
*          3C7C  ff         RST 0x38
*          3C7D  ff         RST 0x38
*          3C7E  ff         RST 0x38
*          3C7F  ff         RST 0x38
*          3C80  ff         RST 0x38
*          3C81  ff         RST 0x38
*          3C82  ff         RST 0x38
*          3C83  ff         RST 0x38
*          3C84  ff         RST 0x38
*          3C85  ff         RST 0x38
*          3C86  ff         RST 0x38
*          3C87  ff         RST 0x38
*          3C88  ff         RST 0x38
*          3C89  ff         RST 0x38
*          3C8A  ff         RST 0x38
*          3C8B  ff         RST 0x38
*          3C8C  ff         RST 0x38
*          3C8D  ff         RST 0x38
*          3C8E  ff         RST 0x38
*          3C8F  ff         RST 0x38
*          3C90  ff         RST 0x38
*          3C91  ff         RST 0x38
*          3C92  ff         RST 0x38
*          3C93  ff         RST 0x38
*          3C94  ff         RST 0x38
*          3C95  ff         RST 0x38
*          3C96  ff         RST 0x38
*          3C97  ff         RST 0x38
*          3C98  ff         RST 0x38
*          3C99  ff         RST 0x38
*          3C9A  ff         RST 0x38
*          3C9B  ff         RST 0x38
*          3C9C  ff         RST 0x38
*          3C9D  ff         RST 0x38
*          3C9E  ff         RST 0x38
*          3C9F  ff         RST 0x38
*          3CA0  ff         RST 0x38
*          3CA1  ff         RST 0x38
*          3CA2  ff         RST 0x38
*          3CA3  ff         RST 0x38
*          3CA4  ff         RST 0x38
*          3CA5  ff         RST 0x38
*          3CA6  ff         RST 0x38
*          3CA7  ff         RST 0x38
*          3CA8  ff         RST 0x38
*          3CA9  ff         RST 0x38
*          3CAA  ff         RST 0x38
*          3CAB  ff         RST 0x38
*          3CAC  ff         RST 0x38
*          3CAD  ff         RST 0x38
*          3CAE  ff         RST 0x38
*          3CAF  ff         RST 0x38
*          3CB0  ff         RST 0x38
*          3CB1  ff         RST 0x38
*          3CB2  ff         RST 0x38
*          3CB3  ff         RST 0x38
*          3CB4  ff         RST 0x38
*          3CB5  ff         RST 0x38
*          3CB6  ff         RST 0x38
*          3CB7  ff         RST 0x38
*          3CB8  ff         RST 0x38
*          3CB9  ff         RST 0x38
*          3CBA  ff         RST 0x38
*          3CBB  ff         RST 0x38
*          3CBC  ff         RST 0x38
*          3CBD  ff         RST 0x38
*          3CBE  ff         RST 0x38
*          3CBF  ff         RST 0x38
*          3CC0  ff         RST 0x38
*          3CC1  ff         RST 0x38
*          3CC2  ff         RST 0x38
*          3CC3  ff         RST 0x38
*          3CC4  ff         RST 0x38
*          3CC5  ff         RST 0x38
*          3CC6  ff         RST 0x38
*          3CC7  ff         RST 0x38
*          3CC8  ff         RST 0x38
*          3CC9  ff         RST 0x38
*          3CCA  ff         RST 0x38
*          3CCB  ff         RST 0x38
*          3CCC  ff         RST 0x38
*          3CCD  ff         RST 0x38
*          3CCE  ff         RST 0x38
*          3CCF  ff         RST 0x38
*          3CD0  ff         RST 0x38
*          3CD1  ff         RST 0x38
*          3CD2  ff         RST 0x38
*          3CD3  ff         RST 0x38
*          3CD4  ff         RST 0x38
*          3CD5  ff         RST 0x38
*          3CD6  ff         RST 0x38
*          3CD7  ff         RST 0x38
*          3CD8  ff         RST 0x38
*          3CD9  ff         RST 0x38
*          3CDA  ff         RST 0x38
*          3CDB  ff         RST 0x38
*          3CDC  ff         RST 0x38
*          3CDD  ff         RST 0x38
*          3CDE  ff         RST 0x38
*          3CDF  ff         RST 0x38
*          3CE0  ff         RST 0x38
*          3CE1  ff         RST 0x38
*          3CE2  ff         RST 0x38
*          3CE3  ff         RST 0x38
*          3CE4  ff         RST 0x38
*          3CE5  ff         RST 0x38
*          3CE6  ff         RST 0x38
*          3CE7  ff         RST 0x38
*          3CE8  ff         RST 0x38
*          3CE9  ff         RST 0x38
*          3CEA  ff         RST 0x38
*          3CEB  ff         RST 0x38
*          3CEC  ff         RST 0x38
*          3CED  ff         RST 0x38
*          3CEE  ff         RST 0x38
*          3CEF  ff         RST 0x38
*          3CF0  ff         RST 0x38
*          3CF1  ff         RST 0x38
*          3CF2  ff         RST 0x38
*          3CF3  ff         RST 0x38
*          3CF4  ff         RST 0x38
*          3CF5  ff         RST 0x38
*          3CF6  ff         RST 0x38
*          3CF7  ff         RST 0x38
*          3CF8  ff         RST 0x38
*          3CF9  ff         RST 0x38
*          3CFA  ff         RST 0x38
*          3CFB  ff         RST 0x38
*          3CFC  ff         RST 0x38
*          3CFD  ff         RST 0x38
*          3CFE  ff         RST 0x38
*          3CFF  ff         RST 0x38
*          3D00  ff         RST 0x38
*          3D01  ff         RST 0x38
*          3D02  ff         RST 0x38
*          3D03  ff         RST 0x38
*          3D04  ff         RST 0x38
*          3D05  ff         RST 0x38
*          3D06  ff         RST 0x38
*          3D07  ff         RST 0x38
*          3D08  ff         RST 0x38
*          3D09  ff         RST 0x38
*          3D0A  ff         RST 0x38
*          3D0B  ff         RST 0x38
*          3D0C  ff         RST 0x38
*          3D0D  ff         RST 0x38
*          3D0E  ff         RST 0x38
*          3D0F  ff         RST 0x38
*          3D10  ff         RST 0x38
*          3D11  ff         RST 0x38
*          3D12  ff         RST 0x38
*          3D13  ff         RST 0x38
*          3D14  ff         RST 0x38
*          3D15  ff         RST 0x38
*          3D16  ff         RST 0x38
*          3D17  ff         RST 0x38
*          3D18  ff         RST 0x38
*          3D19  ff         RST 0x38
*          3D1A  ff         RST 0x38
*          3D1B  ff         RST 0x38
*          3D1C  ff         RST 0x38
*          3D1D  ff         RST 0x38
*          3D1E  ff         RST 0x38
*          3D1F  ff         RST 0x38
*          3D20  ff         RST 0x38
*          3D21  ff         RST 0x38
*          3D22  ff         RST 0x38
*          3D23  ff         RST 0x38
*          3D24  ff         RST 0x38
*          3D25  ff         RST 0x38
*          3D26  ff         RST 0x38
*          3D27  ff         RST 0x38
*          3D28  ff         RST 0x38
*          3D29  ff         RST 0x38
*          3D2A  ff         RST 0x38
*          3D2B  ff         RST 0x38
*          3D2C  ff         RST 0x38
*          3D2D  ff         RST 0x38
*          3D2E  ff         RST 0x38
*          3D2F  ff         RST 0x38
*          3D30  ff         RST 0x38
*          3D31  ff         RST 0x38
*          3D32  ff         RST 0x38
*          3D33  ff         RST 0x38
*          3D34  ff         RST 0x38
*          3D35  ff         RST 0x38
*          3D36  ff         RST 0x38
*          3D37  ff         RST 0x38
*          3D38  ff         RST 0x38
*          3D39  ff         RST 0x38
*          3D3A  ff         RST 0x38
*          3D3B  ff         RST 0x38
*          3D3C  ff         RST 0x38
*          3D3D  ff         RST 0x38
*          3D3E  ff         RST 0x38
*          3D3F  ff         RST 0x38
*          3D40  ff         RST 0x38
*          3D41  ff         RST 0x38
*          3D42  ff         RST 0x38
*          3D43  ff         RST 0x38
*          3D44  ff         RST 0x38
*          3D45  ff         RST 0x38
*          3D46  ff         RST 0x38
*          3D47  ff         RST 0x38
*          3D48  ff         RST 0x38
*          3D49  ff         RST 0x38
*          3D4A  ff         RST 0x38
*          3D4B  ff         RST 0x38
*          3D4C  ff         RST 0x38
*          3D4D  ff         RST 0x38
*          3D4E  ff         RST 0x38
*          3D4F  ff         RST 0x38
*          3D50  ff         RST 0x38
*          3D51  ff         RST 0x38
*          3D52  ff         RST 0x38
*          3D53  ff         RST 0x38
*          3D54  ff         RST 0x38
*          3D55  ff         RST 0x38
*          3D56  ff         RST 0x38
*          3D57  ff         RST 0x38
*          3D58  ff         RST 0x38
*          3D59  ff         RST 0x38
*          3D5A  ff         RST 0x38
*          3D5B  ff         RST 0x38
*          3D5C  ff         RST 0x38
*          3D5D  ff         RST 0x38
*          3D5E  ff         RST 0x38
*          3D5F  ff         RST 0x38
*          3D60  ff         RST 0x38
*          3D61  ff         RST 0x38
*          3D62  ff         RST 0x38
*          3D63  ff         RST 0x38
*          3D64  ff         RST 0x38
*          3D65  ff         RST 0x38
*          3D66  ff         RST 0x38
*          3D67  ff         RST 0x38
*          3D68  ff         RST 0x38
*          3D69  ff         RST 0x38
*          3D6A  ff         RST 0x38
*          3D6B  ff         RST 0x38
*          3D6C  ff         RST 0x38
*          3D6D  ff         RST 0x38
*          3D6E  ff         RST 0x38
*          3D6F  ff         RST 0x38
*          3D70  ff         RST 0x38
*          3D71  ff         RST 0x38
*          3D72  ff         RST 0x38
*          3D73  ff         RST 0x38
*          3D74  ff         RST 0x38
*          3D75  ff         RST 0x38
*          3D76  ff         RST 0x38
*          3D77  ff         RST 0x38
*          3D78  ff         RST 0x38
*          3D79  ff         RST 0x38
*          3D7A  ff         RST 0x38
*          3D7B  ff         RST 0x38
*          3D7C  ff         RST 0x38
*          3D7D  ff         RST 0x38
*          3D7E  ff         RST 0x38
*          3D7F  ff         RST 0x38
*          3D80  ff         RST 0x38
*          3D81  ff         RST 0x38
*          3D82  ff         RST 0x38
*          3D83  ff         RST 0x38
*          3D84  ff         RST 0x38
*          3D85  ff         RST 0x38
*          3D86  ff         RST 0x38
*          3D87  ff         RST 0x38
*          3D88  ff         RST 0x38
*          3D89  ff         RST 0x38
*          3D8A  ff         RST 0x38
*          3D8B  ff         RST 0x38
*          3D8C  ff         RST 0x38
*          3D8D  ff         RST 0x38
*          3D8E  ff         RST 0x38
*          3D8F  ff         RST 0x38
*          3D90  ff         RST 0x38
*          3D91  ff         RST 0x38
*          3D92  ff         RST 0x38
*          3D93  ff         RST 0x38
*          3D94  ff         RST 0x38
*          3D95  ff         RST 0x38
*          3D96  ff         RST 0x38
*          3D97  ff         RST 0x38
*          3D98  ff         RST 0x38
*          3D99  ff         RST 0x38
*          3D9A  ff         RST 0x38
*          3D9B  ff         RST 0x38
*          3D9C  ff         RST 0x38
*          3D9D  ff         RST 0x38
*          3D9E  ff         RST 0x38
*          3D9F  ff         RST 0x38
*          3DA0  ff         RST 0x38
*          3DA1  ff         RST 0x38
*          3DA2  ff         RST 0x38
*          3DA3  ff         RST 0x38
*          3DA4  ff         RST 0x38
*          3DA5  ff         RST 0x38
*          3DA6  ff         RST 0x38
*          3DA7  ff         RST 0x38
*          3DA8  ff         RST 0x38
*          3DA9  ff         RST 0x38
*          3DAA  ff         RST 0x38
*          3DAB  ff         RST 0x38
*          3DAC  ff         RST 0x38
*          3DAD  ff         RST 0x38
*          3DAE  ff         RST 0x38
*          3DAF  ff         RST 0x38
*          3DB0  ff         RST 0x38
*          3DB1  ff         RST 0x38
*          3DB2  ff         RST 0x38
*          3DB3  ff         RST 0x38
*          3DB4  ff         RST 0x38
*          3DB5  ff         RST 0x38
*          3DB6  ff         RST 0x38
*          3DB7  ff         RST 0x38
*          3DB8  ff         RST 0x38
*          3DB9  ff         RST 0x38
*          3DBA  ff         RST 0x38
*          3DBB  ff         RST 0x38
*          3DBC  ff         RST 0x38
*          3DBD  ff         RST 0x38
*          3DBE  ff         RST 0x38
*          3DBF  ff         RST 0x38
*          3DC0  ff         RST 0x38
*          3DC1  ff         RST 0x38
*          3DC2  ff         RST 0x38
*          3DC3  ff         RST 0x38
*          3DC4  ff         RST 0x38
*          3DC5  ff         RST 0x38
*          3DC6  ff         RST 0x38
*          3DC7  ff         RST 0x38
*          3DC8  ff         RST 0x38
*          3DC9  ff         RST 0x38
*          3DCA  ff         RST 0x38
*          3DCB  ff         RST 0x38
*          3DCC  ff         RST 0x38
*          3DCD  ff         RST 0x38
*          3DCE  ff         RST 0x38
*          3DCF  ff         RST 0x38
*          3DD0  ff         RST 0x38
*          3DD1  ff         RST 0x38
*          3DD2  ff         RST 0x38
*          3DD3  ff         RST 0x38
*          3DD4  ff         RST 0x38
*          3DD5  ff         RST 0x38
*          3DD6  ff         RST 0x38
*          3DD7  ff         RST 0x38
*          3DD8  ff         RST 0x38
*          3DD9  ff         RST 0x38
*          3DDA  ff         RST 0x38
*          3DDB  ff         RST 0x38
*          3DDC  ff         RST 0x38
*          3DDD  ff         RST 0x38
*          3DDE  ff         RST 0x38
*          3DDF  ff         RST 0x38
*          3DE0  ff         RST 0x38
*          3DE1  ff         RST 0x38
*          3DE2  ff         RST 0x38
*          3DE3  ff         RST 0x38
*          3DE4  ff         RST 0x38
*          3DE5  ff         RST 0x38
*          3DE6  ff         RST 0x38
*          3DE7  ff         RST 0x38
*          3DE8  ff         RST 0x38
*          3DE9  ff         RST 0x38
*          3DEA  ff         RST 0x38
*          3DEB  ff         RST 0x38
*          3DEC  ff         RST 0x38
*          3DED  ff         RST 0x38
*          3DEE  ff         RST 0x38
*          3DEF  ff         RST 0x38
*          3DF0  ff         RST 0x38
*          3DF1  ff         RST 0x38
*          3DF2  ff         RST 0x38
*          3DF3  ff         RST 0x38
*          3DF4  ff         RST 0x38
*          3DF5  ff         RST 0x38
*          3DF6  ff         RST 0x38
*          3DF7  ff         RST 0x38
*          3DF8  ff         RST 0x38
*          3DF9  ff         RST 0x38
*          3DFA  ff         RST 0x38
*          3DFB  ff         RST 0x38
*          3DFC  ff         RST 0x38
*          3DFD  ff         RST 0x38
*          3DFE  ff         RST 0x38
*          3DFF  ff         RST 0x38
*          3E00  ff         RST 0x38
*          3E01  ff         RST 0x38
*          3E02  ff         RST 0x38
*          3E03  ff         RST 0x38
*          3E04  ff         RST 0x38
*          3E05  ff         RST 0x38
*          3E06  ff         RST 0x38
*          3E07  ff         RST 0x38
*          3E08  ff         RST 0x38
*          3E09  ff         RST 0x38
*          3E0A  ff         RST 0x38
*          3E0B  ff         RST 0x38
*          3E0C  ff         RST 0x38
*          3E0D  ff         RST 0x38
*          3E0E  ff         RST 0x38
*          3E0F  ff         RST 0x38
*          3E10  ff         RST 0x38
*          3E11  ff         RST 0x38
*          3E12  ff         RST 0x38
*  L_3E13: 3E13  ff         RST 0x38
*  L_3E14: 3E14  ff         RST 0x38
*  L_3E15: 3E15  ff         RST 0x38
*          3E16  ff         RST 0x38
*          3E17  ff         RST 0x38
*          3E18  ff         RST 0x38
*          3E19  ff         RST 0x38
*          3E1A  ff         RST 0x38
*          3E1B  ff         RST 0x38
*          3E1C  ff         RST 0x38
*          3E1D  ff         RST 0x38
*          3E1E  ff         RST 0x38
*          3E1F  ff         RST 0x38
*          3E20  ff         RST 0x38
*          3E21  ff         RST 0x38
*          3E22  ff         RST 0x38
*          3E23  ff         RST 0x38
*          3E24  ff         RST 0x38
*          3E25  ff         RST 0x38
*          3E26  ff         RST 0x38
*          3E27  ff         RST 0x38
*          3E28  ff         RST 0x38
*          3E29  ff         RST 0x38
*          3E2A  ff         RST 0x38
*          3E2B  ff         RST 0x38
*          3E2C  ff         RST 0x38
*          3E2D  ff         RST 0x38
*          3E2E  ff         RST 0x38
*          3E2F  ff         RST 0x38
*          3E30  ff         RST 0x38
*          3E31  ff         RST 0x38
*          3E32  ff         RST 0x38
*          3E33  ff         RST 0x38
*          3E34  ff         RST 0x38
*          3E35  ff         RST 0x38
*          3E36  ff         RST 0x38
*          3E37  ff         RST 0x38
*          3E38  ff         RST 0x38
*          3E39  ff         RST 0x38
*          3E3A  ff         RST 0x38
*          3E3B  ff         RST 0x38
*          3E3C  ff         RST 0x38
*          3E3D  ff         RST 0x38
*          3E3E  ff         RST 0x38
*          3E3F  ff         RST 0x38
*          3E40  ff         RST 0x38
*          3E41  ff         RST 0x38
*          3E42  ff         RST 0x38
*          3E43  ff         RST 0x38
*          3E44  ff         RST 0x38
*          3E45  ff         RST 0x38
*          3E46  ff         RST 0x38
*          3E47  ff         RST 0x38
*          3E48  ff         RST 0x38
*          3E49  ff         RST 0x38
*          3E4A  ff         RST 0x38
*          3E4B  ff         RST 0x38
*          3E4C  ff         RST 0x38
*          3E4D  ff         RST 0x38
*          3E4E  ff         RST 0x38
*          3E4F  ff         RST 0x38
*          3E50  ff         RST 0x38
*          3E51  ff         RST 0x38
*          3E52  ff         RST 0x38
*          3E53  ff         RST 0x38
*          3E54  ff         RST 0x38
*          3E55  ff         RST 0x38
*          3E56  ff         RST 0x38
*          3E57  ff         RST 0x38
*          3E58  ff         RST 0x38
*          3E59  ff         RST 0x38
*          3E5A  ff         RST 0x38
*          3E5B  ff         RST 0x38
*          3E5C  ff         RST 0x38
*          3E5D  ff         RST 0x38
*          3E5E  ff         RST 0x38
*          3E5F  ff         RST 0x38
*          3E60  ff         RST 0x38
*          3E61  ff         RST 0x38
*          3E62  ff         RST 0x38
*          3E63  ff         RST 0x38
*          3E64  ff         RST 0x38
*          3E65  ff         RST 0x38
*          3E66  ff         RST 0x38
*          3E67  ff         RST 0x38
*          3E68  ff         RST 0x38
*          3E69  ff         RST 0x38
*          3E6A  ff         RST 0x38
*          3E6B  ff         RST 0x38
*          3E6C  ff         RST 0x38
*          3E6D  ff         RST 0x38
*          3E6E  ff         RST 0x38
*          3E6F  ff         RST 0x38
*          3E70  ff         RST 0x38
*          3E71  ff         RST 0x38
*          3E72  ff         RST 0x38
*          3E73  ff         RST 0x38
*          3E74  ff         RST 0x38
*          3E75  ff         RST 0x38
*          3E76  ff         RST 0x38
*          3E77  ff         RST 0x38
*          3E78  ff         RST 0x38
*          3E79  ff         RST 0x38
*          3E7A  ff         RST 0x38
*          3E7B  ff         RST 0x38
*          3E7C  ff         RST 0x38
*          3E7D  ff         RST 0x38
*          3E7E  ff         RST 0x38
*          3E7F  ff         RST 0x38
*          3E80  ff         RST 0x38
*          3E81  ff         RST 0x38
*          3E82  ff         RST 0x38
*          3E83  ff         RST 0x38
*          3E84  ff         RST 0x38
*          3E85  ff         RST 0x38
*          3E86  ff         RST 0x38
*          3E87  ff         RST 0x38
*          3E88  ff         RST 0x38
*          3E89  ff         RST 0x38
*          3E8A  ff         RST 0x38
*          3E8B  ff         RST 0x38
*          3E8C  ff         RST 0x38
*          3E8D  ff         RST 0x38
*          3E8E  ff         RST 0x38
*          3E8F  ff         RST 0x38
*          3E90  ff         RST 0x38
*          3E91  ff         RST 0x38
*          3E92  ff         RST 0x38
*          3E93  ff         RST 0x38
*          3E94  ff         RST 0x38
*          3E95  ff         RST 0x38
*          3E96  ff         RST 0x38
*          3E97  ff         RST 0x38
*          3E98  ff         RST 0x38
*          3E99  ff         RST 0x38
*          3E9A  ff         RST 0x38
*          3E9B  ff         RST 0x38
*          3E9C  ff         RST 0x38
*          3E9D  ff         RST 0x38
*          3E9E  ff         RST 0x38
*          3E9F  ff         RST 0x38
*          3EA0  ff         RST 0x38
*          3EA1  ff         RST 0x38
*          3EA2  ff         RST 0x38
*          3EA3  ff         RST 0x38
*          3EA4  ff         RST 0x38
*          3EA5  ff         RST 0x38
*          3EA6  ff         RST 0x38
*          3EA7  ff         RST 0x38
*          3EA8  ff         RST 0x38
*          3EA9  ff         RST 0x38
*          3EAA  ff         RST 0x38
*          3EAB  ff         RST 0x38
*          3EAC  ff         RST 0x38
*          3EAD  ff         RST 0x38
*          3EAE  ff         RST 0x38
*          3EAF  ff         RST 0x38
*          3EB0  ff         RST 0x38
*          3EB1  ff         RST 0x38
*          3EB2  ff         RST 0x38
*          3EB3  ff         RST 0x38
*          3EB4  ff         RST 0x38
*          3EB5  ff         RST 0x38
*          3EB6  ff         RST 0x38
*          3EB7  ff         RST 0x38
*          3EB8  ff         RST 0x38
*          3EB9  ff         RST 0x38
*          3EBA  ff         RST 0x38
*          3EBB  ff         RST 0x38
*          3EBC  ff         RST 0x38
*          3EBD  ff         RST 0x38
*          3EBE  ff         RST 0x38
*          3EBF  ff         RST 0x38
*          3EC0  ff         RST 0x38
*          3EC1  ff         RST 0x38
*          3EC2  ff         RST 0x38
*          3EC3  ff         RST 0x38
*          3EC4  ff         RST 0x38
*          3EC5  ff         RST 0x38
*          3EC6  ff         RST 0x38
*          3EC7  ff         RST 0x38
*          3EC8  ff         RST 0x38
*          3EC9  ff         RST 0x38
*          3ECA  ff         RST 0x38
*          3ECB  ff         RST 0x38
*          3ECC  ff         RST 0x38
*          3ECD  ff         RST 0x38
*          3ECE  ff         RST 0x38
*          3ECF  ff         RST 0x38
*          3ED0  ff         RST 0x38
*          3ED1  ff         RST 0x38
*          3ED2  ff         RST 0x38
*          3ED3  ff         RST 0x38
*          3ED4  ff         RST 0x38
*          3ED5  ff         RST 0x38
*          3ED6  ff         RST 0x38
*          3ED7  ff         RST 0x38
*          3ED8  ff         RST 0x38
*          3ED9  ff         RST 0x38
*          3EDA  ff         RST 0x38
*          3EDB  ff         RST 0x38
*          3EDC  ff         RST 0x38
*          3EDD  ff         RST 0x38
*          3EDE  ff         RST 0x38
*          3EDF  ff         RST 0x38
*          3EE0  ff         RST 0x38
*          3EE1  ff         RST 0x38
*          3EE2  ff         RST 0x38
*          3EE3  ff         RST 0x38
*          3EE4  ff         RST 0x38
*          3EE5  ff         RST 0x38
*          3EE6  ff         RST 0x38
*          3EE7  ff         RST 0x38
*          3EE8  ff         RST 0x38
*          3EE9  ff         RST 0x38
*          3EEA  ff         RST 0x38
*          3EEB  ff         RST 0x38
*          3EEC  ff         RST 0x38
*          3EED  ff         RST 0x38
*          3EEE  ff         RST 0x38
*          3EEF  ff         RST 0x38
*          3EF0  ff         RST 0x38
*          3EF1  ff         RST 0x38
*          3EF2  ff         RST 0x38
*          3EF3  ff         RST 0x38
*          3EF4  ff         RST 0x38
*          3EF5  ff         RST 0x38
*          3EF6  ff         RST 0x38
*          3EF7  ff         RST 0x38
*          3EF8  ff         RST 0x38
*          3EF9  ff         RST 0x38
*          3EFA  ff         RST 0x38
*          3EFB  ff         RST 0x38
*          3EFC  ff         RST 0x38
*          3EFD  ff         RST 0x38
*          3EFE  ff         RST 0x38
*          3EFF  ff         RST 0x38
*          3F00  ff         RST 0x38
*          3F01  ff         RST 0x38
*          3F02  ff         RST 0x38
*          3F03  ff         RST 0x38
*          3F04  ff         RST 0x38
*          3F05  ff         RST 0x38
*          3F06  ff         RST 0x38
*          3F07  ff         RST 0x38
*          3F08  ff         RST 0x38
*          3F09  ff         RST 0x38
*          3F0A  ff         RST 0x38
*          3F0B  ff         RST 0x38
*          3F0C  ff         RST 0x38
*          3F0D  ff         RST 0x38
*          3F0E  ff         RST 0x38
*          3F0F  ff         RST 0x38
*          3F10  ff         RST 0x38
*          3F11  ff         RST 0x38
*          3F12  ff         RST 0x38
*          3F13  ff         RST 0x38
*          3F14  ff         RST 0x38
*          3F15  ff         RST 0x38
*          3F16  ff         RST 0x38
*          3F17  ff         RST 0x38
*          3F18  ff         RST 0x38
*          3F19  ff         RST 0x38
*          3F1A  ff         RST 0x38
*          3F1B  ff         RST 0x38
*          3F1C  ff         RST 0x38
*          3F1D  ff         RST 0x38
*          3F1E  ff         RST 0x38
*          3F1F  ff         RST 0x38
*          3F20  ff         RST 0x38
*          3F21  ff         RST 0x38
*          3F22  ff         RST 0x38
*          3F23  ff         RST 0x38
*          3F24  ff         RST 0x38
*          3F25  ff         RST 0x38
*          3F26  ff         RST 0x38
*          3F27  ff         RST 0x38
*          3F28  ff         RST 0x38
*          3F29  ff         RST 0x38
*          3F2A  ff         RST 0x38
*          3F2B  ff         RST 0x38
*          3F2C  ff         RST 0x38
*          3F2D  ff         RST 0x38
*          3F2E  ff         RST 0x38
*          3F2F  ff         RST 0x38
*          3F30  ff         RST 0x38
*          3F31  ff         RST 0x38
*          3F32  ff         RST 0x38
*          3F33  ff         RST 0x38
*          3F34  ff         RST 0x38
*          3F35  ff         RST 0x38
*          3F36  ff         RST 0x38
*          3F37  ff         RST 0x38
*          3F38  ff         RST 0x38
*          3F39  ff         RST 0x38
*          3F3A  ff         RST 0x38
*          3F3B  ff         RST 0x38
*          3F3C  ff         RST 0x38
*          3F3D  ff         RST 0x38
*          3F3E  ff         RST 0x38
*          3F3F  ff         RST 0x38
*          3F40  ff         RST 0x38
*          3F41  ff         RST 0x38
*          3F42  ff         RST 0x38
*          3F43  ff         RST 0x38
*          3F44  ff         RST 0x38
*          3F45  ff         RST 0x38
*          3F46  ff         RST 0x38
*          3F47  ff         RST 0x38
*          3F48  ff         RST 0x38
*          3F49  ff         RST 0x38
*          3F4A  ff         RST 0x38
*          3F4B  ff         RST 0x38
*          3F4C  ff         RST 0x38
*          3F4D  ff         RST 0x38
*          3F4E  ff         RST 0x38
*          3F4F  ff         RST 0x38
*          3F50  ff         RST 0x38
*          3F51  ff         RST 0x38
*          3F52  ff         RST 0x38
*          3F53  ff         RST 0x38
*          3F54  ff         RST 0x38
*          3F55  ff         RST 0x38
*          3F56  ff         RST 0x38
*          3F57  ff         RST 0x38
*          3F58  ff         RST 0x38
*          3F59  ff         RST 0x38
*          3F5A  ff         RST 0x38
*          3F5B  ff         RST 0x38
*          3F5C  ff         RST 0x38
*          3F5D  ff         RST 0x38
*          3F5E  ff         RST 0x38
*          3F5F  ff         RST 0x38
*          3F60  ff         RST 0x38
*          3F61  ff         RST 0x38
*          3F62  ff         RST 0x38
*          3F63  ff         RST 0x38
*          3F64  ff         RST 0x38
*          3F65  ff         RST 0x38
*          3F66  ff         RST 0x38
*          3F67  ff         RST 0x38
*          3F68  ff         RST 0x38
*          3F69  ff         RST 0x38
*          3F6A  ff         RST 0x38
*          3F6B  ff         RST 0x38
*          3F6C  ff         RST 0x38
*          3F6D  ff         RST 0x38
*          3F6E  ff         RST 0x38
*          3F6F  ff         RST 0x38
*          3F70  ff         RST 0x38
*          3F71  ff         RST 0x38
*          3F72  ff         RST 0x38
*          3F73  ff         RST 0x38
*          3F74  ff         RST 0x38
*          3F75  ff         RST 0x38
*          3F76  ff         RST 0x38
*          3F77  ff         RST 0x38
*          3F78  ff         RST 0x38
*          3F79  ff         RST 0x38
*          3F7A  ff         RST 0x38
*          3F7B  ff         RST 0x38
*          3F7C  ff         RST 0x38
*          3F7D  ff         RST 0x38
*          3F7E  ff         RST 0x38
*          3F7F  ff         RST 0x38
*          3F80  ff         RST 0x38
*          3F81  ff         RST 0x38
*          3F82  ff         RST 0x38
*          3F83  ff         RST 0x38
*          3F84  ff         RST 0x38
*          3F85  ff         RST 0x38
*          3F86  ff         RST 0x38
*          3F87  ff         RST 0x38
*          3F88  ff         RST 0x38
*          3F89  ff         RST 0x38
*          3F8A  ff         RST 0x38
*          3F8B  ff         RST 0x38
*          3F8C  ff         RST 0x38
*          3F8D  ff         RST 0x38
*          3F8E  ff         RST 0x38
*          3F8F  ff         RST 0x38
*          3F90  ff         RST 0x38
*          3F91  ff         RST 0x38
*          3F92  ff         RST 0x38
*          3F93  ff         RST 0x38
*          3F94  ff         RST 0x38
*          3F95  ff         RST 0x38
*          3F96  ff         RST 0x38
*          3F97  ff         RST 0x38
*          3F98  ff         RST 0x38
*          3F99  ff         RST 0x38
*          3F9A  ff         RST 0x38
*          3F9B  ff         RST 0x38
*          3F9C  ff         RST 0x38
*          3F9D  ff         RST 0x38
*          3F9E  ff         RST 0x38
*          3F9F  ff         RST 0x38
*          3FA0  ff         RST 0x38
*          3FA1  ff         RST 0x38
*          3FA2  ff         RST 0x38
*          3FA3  ff         RST 0x38
*          3FA4  ff         RST 0x38
*          3FA5  ff         RST 0x38
*          3FA6  ff         RST 0x38
*          3FA7  ff         RST 0x38
*          3FA8  ff         RST 0x38
*          3FA9  ff         RST 0x38
*          3FAA  ff         RST 0x38
*          3FAB  ff         RST 0x38
*          3FAC  ff         RST 0x38
*          3FAD  ff         RST 0x38
*          3FAE  ff         RST 0x38
*          3FAF  ff         RST 0x38
*          3FB0  ff         RST 0x38
*          3FB1  ff         RST 0x38
*          3FB2  ff         RST 0x38
*          3FB3  ff         RST 0x38
*          3FB4  ff         RST 0x38
*          3FB5  ff         RST 0x38
*          3FB6  ff         RST 0x38
*          3FB7  ff         RST 0x38
*          3FB8  ff         RST 0x38
*          3FB9  ff         RST 0x38
*          3FBA  ff         RST 0x38
*          3FBB  ff         RST 0x38
*          3FBC  ff         RST 0x38
*          3FBD  ff         RST 0x38
*          3FBE  ff         RST 0x38
*          3FBF  ff         RST 0x38
*          3FC0  ff         RST 0x38
*          3FC1  ff         RST 0x38
*          3FC2  ff         RST 0x38
*          3FC3  ff         RST 0x38
*          3FC4  ff         RST 0x38
*          3FC5  ff         RST 0x38
*          3FC6  ff         RST 0x38
*          3FC7  ff         RST 0x38
*          3FC8  ff         RST 0x38
*          3FC9  ff         RST 0x38
*          3FCA  ff         RST 0x38
*          3FCB  ff         RST 0x38
*          3FCC  ff         RST 0x38
*          3FCD  ff         RST 0x38
*          3FCE  ff         RST 0x38
*          3FCF  ff         RST 0x38
*          3FD0  ff         RST 0x38
*          3FD1  ff         RST 0x38
*          3FD2  ff         RST 0x38
*          3FD3  ff         RST 0x38
*          3FD4  ff         RST 0x38
*          3FD5  ff         RST 0x38
*          3FD6  ff         RST 0x38
*          3FD7  ff         RST 0x38
*          3FD8  ff         RST 0x38
*          3FD9  ff         RST 0x38
*          3FDA  ff         RST 0x38
*          3FDB  ff         RST 0x38
*          3FDC  ff         RST 0x38
*          3FDD  ff         RST 0x38
*          3FDE  ff         RST 0x38
*          3FDF  ff         RST 0x38
*          3FE0  ff         RST 0x38
*          3FE1  ff         RST 0x38
*          3FE2  ff         RST 0x38
*          3FE3  ff         RST 0x38
*          3FE4  ff         RST 0x38
*          3FE5  ff         RST 0x38
*          3FE6  ff         RST 0x38
*          3FE7  ff         RST 0x38
*          3FE8  ff         RST 0x38
*          3FE9  ff         RST 0x38
*          3FEA  ff         RST 0x38
*          3FEB  ff         RST 0x38
*          3FEC  ff         RST 0x38
*          3FED  ff         RST 0x38
*          3FEE  ff         RST 0x38
*          3FEF  ff         RST 0x38
*          3FF0  ff         RST 0x38
*          3FF1  ff         RST 0x38
*          3FF2  ff         RST 0x38
*          3FF3  ff         RST 0x38
*          3FF4  ff         RST 0x38
*          3FF5  ff         RST 0x38
*          3FF6  ff         RST 0x38
*          3FF7  ff         RST 0x38
*          3FF8  ff         RST 0x38
*          3FF9  ff         RST 0x38
*          3FFA  ff         RST 0x38
*          3FFB  ff         RST 0x38
*          3FFC  ff         RST 0x38
*          3FFD  ff         RST 0x38
*          3FFE  a4         AND H
*          3FFF  5a         LD E,D