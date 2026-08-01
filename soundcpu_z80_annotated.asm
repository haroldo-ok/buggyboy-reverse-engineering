; ============================================================================
; BUGGY BOY JR — Z80 SOUND ENGINE  (bug35s.21, 16 KiB)   annotated disassembly
; ----------------------------------------------------------------------------
; Hardware:  Z80 @ ROM 0000-3FFF, RAM 4000-47FF, SP=4800
;   AY-3-8910 #1: OUT (0x81)=addr latch, OUT (0x80)=data
;   AY-3-8910 #2: OUT (0x41)=addr latch, OUT (0x40)=data   (or via C register)
;   i8255 PPI @ 0x5000-0x5003  (status back to main CPU)
;   i8253 PIT @ 0x6000-0x6001  (timer / engine-pitch source)
;   mailbox window @ 0xB000 (<- main CPU), ack latch @ 0x7000
;   6 voice control blocks @ 0x4140,+0x40 each (2 AY x 3 tone channels)
;
; Voice control block (IX-relative) fields recovered:
;   +0x17/+0x18 current tone period (lo/hi)   +0x1F volume/level
;   +0x20 AY reg# tone-lo   +0x21 AY reg# tone-hi   +0x25 AY reg# volume
;   +0x28 AY addr-latch port (0x81/0x41)   +0x32 volume shadow (change-detect)
; ============================================================================


RESET:
    0000  ed56       IM 1                   ; reset: IM1; JP init
    0002  c36700     JP 0x0067           
    0005  00         NOP                 
    0006  00         NOP                 
    0007  00         NOP                 

RST08:
    0008  00         NOP                 
    0009  00         NOP                 
    000A  00         NOP                 
    000B  00         NOP                 
    000C  00         NOP                 
    000D  00         NOP                 
    000E  00         NOP                 
    000F  00         NOP                 

idx_HLplusA:
    0010  85         ADD A,L                ; HL += A  (table index helper; ADD A,L / ADC A,H)
    0011  6f         LD L,A              
    0012  3e00       LD A,0              
    0014  8c         ADC A,H             
    0015  67         LD H,A              
    0016  c9         RET                 
    0017  00         NOP                 
    0018  d7         RST 0x10            
    0019  e7         RST 0x20            
    001A  33         INC SP              
    001B  33         INC SP              
    001C  e9         JP (HL)             
    001D  00         NOP                 
    001E  00         NOP                 
    001F  00         NOP                 
    0020  5e         LD E,(HL)           
    0021  23         INC HL              
    0022  56         LD D,(HL)           
    0023  eb         EX DE,HL            
    0024  c9         RET                 
    0025  00         NOP                 
    0026  00         NOP                 
    0027  00         NOP                 
    0028  00         NOP                 
    0029  00         NOP                 
    002A  00         NOP                 
    002B  00         NOP                 
    002C  00         NOP                 
    002D  00         NOP                 
    002E  00         NOP                 
    002F  00         NOP                 
    0030  00         NOP                 
    0031  00         NOP                 
    0032  00         NOP                 
    0033  00         NOP                 
    0034  00         NOP                 
    0035  00         NOP                 
    0036  00         NOP                 
    0037  00         NOP                 

IRQ_IM1:
    0038  c37508     JP 0x0875              ; IM1 interrupt entry -> JP snd_tick(0x0875)
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

NMI_halt:
    0066  76         HALT                   ; NMI = HALT (falls into init)

init:
    0067  310048     LD SP,0x4800           ; LD SP,0x4800  (stack top; RAM = 0x4000-0x47FF)
    006A  3e0f       LD A,15             
    006C  d381       OUT (0x0081),A         ; AY1 latch=reg15 (I/O port A) ...engine gain lines
    006E  3ef7       LD A,0xf7           
    0070  d380       OUT (0x0080),A      
    0072  3e07       LD A,7                 ; AY1 reg7 mixer = 0xF8
    0074  d381       OUT (0x0081),A      
    0076  3ef8       LD A,0xf8           
    0078  d380       OUT (0x0080),A      
    007A  3e0f       LD A,15             
    007C  d381       OUT (0x0081),A      
    007E  3ef7       LD A,0xf7           
    0080  d380       OUT (0x0080),A      
    0082  3e0e       LD A,14                ; AY1 reg14 (I/O port B)=0
    0084  d381       OUT (0x0081),A      
    0086  3e00       LD A,0              
    0088  d380       OUT (0x0080),A      
    008A  3e07       LD A,7              
    008C  d341       OUT (0x0041),A         ; AY2 reg7 mixer
    008E  3e38       LD A,0x38           
    0090  d340       OUT (0x0040),A      
    0092  3e36       LD A,0x36           
    0094  320350     LD (0x5003),A          ; i8255 PPI control word (0x5003) = mode config
    0097  3e76       LD A,0x76           
    0099  320350     LD (0x5003),A       
    009C  3eb6       LD A,0xb6           
    009E  320350     LD (0x5003),A       
    00A1  af         XOR A               
    00A2  320050     LD (0x5000),A          ; zero PPI ports A/B/C (0x5000-2)
    00A5  320150     LD (0x5001),A       
    00A8  320250     LD (0x5002),A       
    00AB  210040     LD HL,0x4000        
    00AE  01ff07     LD BC,0x7ff         
    00B1  af         XOR A               
    00B2  77         LD (HL),A           
    00B3  54         LD D,H              
    00B4  5d         LD E,L              
    00B5  1c         INC E               
    00B6  edb0       LDIR                
    00B8  3ef0       LD A,0xf0           
    00BA  320141     LD (0x4101),A       
    00BD  3e38       LD A,0x38           
    00BF  320841     LD (0x4108),A       
    00C2  3ef8       LD A,0xf8           
    00C4  320a41     LD (0x410a),A       
    00C7  3e07       LD A,7              
    00C9  323140     LD (0x4031),A       
    00CC  3ef7       LD A,0xf7           
    00CE  322b40     LD (0x402b),A       
    00D1  3e00       LD A,0              
    00D3  320441     LD (0x4104),A       
    00D6  3e70       LD A,0x70           
    00D8  320341     LD (0x4103),A       
    00DB  325a41     LD (0x415a),A       
    00DE  329a41     LD (0x419a),A       
    00E1  32da41     LD (0x41da),A       
    00E4  325941     LD (0x4159),A       
    00E7  329941     LD (0x4199),A       
    00EA  32d941     LD (0x41d9),A       
    00ED  3e70       LD A,0x70           
    00EF  320541     LD (0x4105),A       
    00F2  321a42     LD (0x421a),A       
    00F5  325a42     LD (0x425a),A       
    00F8  329a42     LD (0x429a),A       
    00FB  321942     LD (0x4219),A       
    00FE  325942     LD (0x4259),A       
    0101  329942     LD (0x4299),A       
    0104  216002     LD HL,0x260         
    0107  224041     LD (0x4140),HL      
    010A  228041     LD (0x4180),HL      
    010D  22c041     LD (0x41c0),HL      
    0110  220042     LD (0x4200),HL      
    0113  224042     LD (0x4240),HL      
    0116  228042     LD (0x4280),HL      
    0119  227341     LD (0x4173),HL      
    011C  22b341     LD (0x41b3),HL      
    011F  22f341     LD (0x41f3),HL      
    0122  223342     LD (0x4233),HL      
    0125  227342     LD (0x4273),HL      
    0128  22b342     LD (0x42b3),HL      
    012B  3e80       LD A,0x80           
    012D  324241     LD (0x4142),A       
    0130  328241     LD (0x4182),A       
    0133  32c241     LD (0x41c2),A       
    0136  320242     LD (0x4202),A       
    0139  324242     LD (0x4242),A       
    013C  328242     LD (0x4282),A       
    013F  21f401     LD HL,0x1f4         
    0142  116041     LD DE,0x4160        
    0145  011200     LD BC,0x12          
    0148  edb0       LDIR                
    014A  210602     LD HL,0x206         
    014D  11a041     LD DE,0x41a0        
    0150  011200     LD BC,0x12          
    0153  edb0       LDIR                
    0155  211802     LD HL,0x218         
    0158  11e041     LD DE,0x41e0        
    015B  011200     LD BC,0x12          
    015E  edb0       LDIR                
    0160  212a02     LD HL,0x22a         
    0163  112042     LD DE,0x4220        
    0166  011200     LD BC,0x12          
    0169  edb0       LDIR                
    016B  213c02     LD HL,0x23c         
    016E  116042     LD DE,0x4260        
    0171  011200     LD BC,0x12          
    0174  edb0       LDIR                
    0176  214e02     LD HL,0x24e         
    0179  11a042     LD DE,0x42a0        
    017C  011200     LD BC,0x12          
    017F  edb0       LDIR                
    0181  3a0060     LD A,(0x6000)       
    0184  320344     LD (0x4403),A       
    0187  3a0160     LD A,(0x6001)       
    018A  320444     LD (0x4404),A       
    018D  3a0344     LD A,(0x4403)       
    0190  e60f       AND 15              
    0192  320544     LD (0x4405),A       
    0195  3a0444     LD A,(0x4404)       
    0198  e60f       AND 15              
    019A  320644     LD (0x4406),A       
    019D  3a0344     LD A,(0x4403)       
    01A0  0f         RRCA                
    01A1  0f         RRCA                
    01A2  0f         RRCA                
    01A3  0f         RRCA                
    01A4  e60f       AND 15              
    01A6  320744     LD (0x4407),A       
    01A9  3a0444     LD A,(0x4404)       
    01AC  0f         RRCA                
    01AD  0f         RRCA                
    01AE  0f         RRCA                
    01AF  0f         RRCA                
    01B0  e60f       AND 15              
    01B2  320844     LD (0x4408),A       
    01B5  cda50b     CALL 0x0ba5         
    01B8  dd214041   LD IX,0x4140        
    01BC  cd7804     CALL 0x0478         
    01BF  dd218041   LD IX,0x4180        
    01C3  cd7804     CALL 0x0478         
    01C6  dd21c041   LD IX,0x41c0        
    01CA  cd7804     CALL 0x0478         
    01CD  dd210042   LD IX,0x4200        
    01D1  cd7804     CALL 0x0478         
    01D4  dd214042   LD IX,0x4240        
    01D8  cd7804     CALL 0x0478         
    01DB  dd218042   LD IX,0x4280        
    01DF  cd7804     CALL 0x0478         
    01E2  fb         EI                  
    01E3  3a0641     LD A,(0x4106)       
    01E6  a7         AND A               
    01E7  28f9       JR z,0x01e2         
    01E9  fe40       CP 0x40             
    01EB  38cb       JR c,0x01b8         
    01ED  de40       SBC A,0x40          
    01EF  320641     LD (0x4106),A       
    01F2  18c4       JR 0x01b8           
    01F4  00         NOP                 
    01F5  0108f7     LD BC,0xf708        
    01F8  c1         POP BC              
    01F9  fec8       CP 0xc8             
    01FB  80         ADD A,B             
    01FC  81         ADD A,C             
    01FD  010741     LD BC,0x4107        
    0200  08         EX AF,AF'           
    0201  41         LD B,C              
    0202  03         INC BC              
    0203  41         LD B,C              
    0204  0b         DEC BC              
    0205  41         LD B,C              
    0206  02         LD (BC),A           
    0207  03         INC BC              
    0208  09         ADD HL,BC           
    0209  ef         RST 0x28            
    020A  c2fdd0     JP nz,0xd0fd        
    020D  80         ADD A,B             
    020E  81         ADD A,C             
    020F  02         LD (BC),A           
    0210  07         RLCA                
    0211  41         LD B,C              
    0212  08         EX AF,AF'           
    0213  41         LD B,C              
    0214  03         INC BC              
    0215  41         LD B,C              
    0216  0b         DEC BC              
    0217  41         LD B,C              
    0218  04         INC B               
    0219  05         DEC B               
    021A  0a         LD A,(BC)           
    021B  df         RST 0x18            
    021C  c4fbe0     CALL nz,0xe0fb      
    021F  80         ADD A,B             
    0220  81         ADD A,C             
    0221  04         INC B               
    0222  07         RLCA                
    0223  41         LD B,C              
    0224  08         EX AF,AF'           
    0225  41         LD B,C              
    0226  03         INC BC              
    0227  41         LD B,C              
    0228  0b         DEC BC              
    0229  41         LD B,C              
    022A  00         NOP                 
    022B  0108f7     LD BC,0xf708        
    022E  c1         POP BC              
    022F  fec8       CP 0xc8             
    0231  40         LD B,B              
    0232  41         LD B,C              
    0233  08         EX AF,AF'           
    0234  09         ADD HL,BC           
    0235  41         LD B,C              
    0236  0a         LD A,(BC)           
    0237  41         LD B,C              
    0238  05         DEC B               
    0239  41         LD B,C              
    023A  0d         DEC C               
    023B  41         LD B,C              
    023C  02         LD (BC),A           
    023D  03         INC BC              
    023E  09         ADD HL,BC           
    023F  ef         RST 0x28            
    0240  c2fdd0     JP nz,0xd0fd        
    0243  40         LD B,B              
    0244  41         LD B,C              
    0245  1009       DJNZ 0x0250         
    0247  41         LD B,C              
    0248  0a         LD A,(BC)           
    0249  41         LD B,C              
    024A  05         DEC B               
    024B  41         LD B,C              
    024C  0d         DEC C               
    024D  41         LD B,C              
    024E  04         INC B               
    024F  05         DEC B               
    0250  0a         LD A,(BC)           
    0251  df         RST 0x18            
    0252  c4fbe0     CALL nz,0xe0fb      
    0255  40         LD B,B              
    0256  41         LD B,C              
    0257  2009       JR nz,0x0262        
    0259  41         LD B,C              
    025A  0a         LD A,(BC)           
    025B  41         LD B,C              
    025C  05         DEC B               
    025D  41         LD B,C              
    025E  0d         DEC C               
    025F  41         LD B,C              
    0260  6e         LD L,(HL)           
    0261  00         NOP                 
    0262  ae         XOR (HL)            
    0263  70         LD (HL),B           
    0264  fe00       CP 0                
    0266  08         EX AF,AF'           
    0267  0e00       LD C,0              
    0269  00         NOP                 
    026A  a0         AND B               
    026B  02         LD (BC),A           
    026C  1004       DJNZ 0x0272         
    026E  1008       DJNZ 0x0278         
    0270  1010       DJNZ 0x0282         
    0272  70         LD (HL),B           
    0273  02         LD (BC),A           
    0274  70         LD (HL),B           
    0275  04         INC B               
    0276  70         LD (HL),B           
    0277  08         EX AF,AF'           
    0278  70         LD (HL),B           
    0279  1080       DJNZ 0x01fb         
    027B  02         LD (BC),A           
    027C  80         ADD A,B             
    027D  04         INC B               
    027E  80         ADD A,B             
    027F  08         EX AF,AF'           
    0280  80         ADD A,B             
    0281  1090       DJNZ 0x0213         
    0283  0610       LD B,0x10           
    0285  01ffff     LD BC,0xffff        
    0288  00         NOP                 
    0289  ff         RST 0x38            
    028A  00         NOP                 
    028B  00         NOP                 
    028C  00         NOP                 
    028D  00         NOP                 
    028E  00         NOP                 
    028F  00         NOP                 
    0290  00         NOP                 
    0291  00         NOP                 
    0292  00         NOP                 
    0293  00         NOP                 
    0294  00         NOP                 
    0295  00         NOP                 
    0296  00         NOP                 
    0297  00         NOP                 
    0298  00         NOP                 
    0299  00         NOP                 
    029A  ff         RST 0x38            
    029B  eedd       XOR 0xdd            
    029D  ccbbaa     CALL z,0xaabb       
    02A0  99         SBC A,C             
    02A1  88         ADC A,B             
    02A2  77         LD (HL),A           
    02A3  66         LD H,(HL)           
    02A4  55         LD D,L              
    02A5  44         LD B,H              
    02A6  33         INC SP              
    02A7  221100     LD (0x0011),HL      
    02AA  55         LD D,L              
    02AB  66         LD H,(HL)           
    02AC  67         LD H,A              
    02AD  77         LD (HL),A           
    02AE  88         ADC A,B             
    02AF  89         ADC A,C             
    02B0  99         SBC A,C             
    02B1  aa         XOR D               
    02B2  ab         XOR E               
    02B3  bb         CP E                
    02B4  cccddd     CALL z,0xddcd       
    02B7  eeef       XOR 0xef            
    02B9  ff         RST 0x38            
    02BA  88         ADC A,B             
    02BB  88         ADC A,B             
    02BC  88         ADC A,B             
    02BD  88         ADC A,B             
    02BE  88         ADC A,B             
    02BF  88         ADC A,B             
    02C0  88         ADC A,B             
    02C1  88         ADC A,B             
    02C2  88         ADC A,B             
    02C3  88         ADC A,B             
    02C4  88         ADC A,B             
    02C5  88         ADC A,B             
    02C6  88         ADC A,B             
    02C7  88         ADC A,B             
    02C8  88         ADC A,B             
    02C9  88         ADC A,B             
    02CA  89         ADC A,C             
    02CB  52         LD D,D              
    02CC  57         LD D,A              
    02CD  a7         AND A               
    02CE  52         LD D,D              
    02CF  57         LD D,A              
    02D0  a7         AND A               
    02D1  52         LD D,D              
    02D2  57         LD D,A              
    02D3  a7         AND A               
    02D4  52         LD D,D              
    02D5  57         LD D,A              
    02D6  a7         AND A               
    02D7  52         LD D,D              
    02D8  52         LD D,D              
    02D9  1079       DJNZ 0x0354         
    02DB  64         LD H,H              
    02DC  24         INC H               
    02DD  68         LD L,B              
    02DE  a8         XOR B               
    02DF  64         LD H,H              
    02E0  24         INC H               
    02E1  68         LD L,B              
    02E2  a8         XOR B               
    02E3  64         LD H,H              
    02E4  24         INC H               
    02E5  68         LD L,B              
    02E6  a8         XOR B               
    02E7  64         LD H,H              
    02E8  31108a     LD SP,0x8a10        
    02EB  98         SBC A,B             
    02EC  87         ADD A,A             
    02ED  87         ADD A,A             
    02EE  76         HALT                
    02EF  75         LD (HL),L           
    02F0  65         LD H,L              
    02F1  54         LD D,H              
    02F2  53         LD D,E              
    02F3  43         LD B,E              
    02F4  323121     LD (0x2131),A       
    02F7  1010       DJNZ 0x0309         
    02F9  00         NOP                 
    02FA  cf         RST 8               
    02FB  eedd       XOR 0xdd            
    02FD  ccbbaa     CALL z,0xaabb       
    0300  99         SBC A,C             
    0301  88         ADC A,B             
    0302  77         LD (HL),A           
    0303  66         LD H,(HL)           
    0304  55         LD D,L              
    0305  44         LD B,H              
    0306  33         INC SP              
    0307  221100     LD (0x0011),HL      
    030A  ad         XOR L               
    030B  ccbbaa     CALL z,0xaabb       
    030E  aa         XOR D               
    030F  99         SBC A,C             
    0310  88         ADC A,B             
    0311  77         LD (HL),A           
    0312  66         LD H,(HL)           
    0313  55         LD D,L              
    0314  44         LD B,H              
    0315  33         INC SP              
    0316  222211     LD (0x1122),HL      
    0319  00         NOP                 
    031A  9c         SBC A,H             
    031B  bb         CP E                
    031C  aa         XOR D               
    031D  aa         XOR D               
    031E  99         SBC A,C             
    031F  88         ADC A,B             
    0320  77         LD (HL),A           
    0321  66         LD H,(HL)           
    0322  66         LD H,(HL)           
    0323  55         LD D,L              
    0324  44         LD B,H              
    0325  33         INC SP              
    0326  222211     LD (0x1122),HL      
    0329  00         NOP                 
    032A  ff         RST 0x38            
    032B  eedd       XOR 0xdd            
    032D  ccbbaa     CALL z,0xaabb       
    0330  99         SBC A,C             
    0331  88         ADC A,B             
    0332  77         LD (HL),A           
    0333  66         LD H,(HL)           
    0334  55         LD D,L              
    0335  44         LD B,H              
    0336  33         INC SP              
    0337  221100     LD (0x0011),HL      
    033A  ddccbbaa   CALL z,0xaabb       
    033E  aa         XOR D               
    033F  99         SBC A,C             
    0340  88         ADC A,B             
    0341  77         LD (HL),A           
    0342  66         LD H,(HL)           
    0343  55         LD D,L              
    0344  44         LD B,H              
    0345  33         INC SP              
    0346  33         INC SP              
    0347  221100     LD (0x0011),HL      
    034A  ccbbaa     CALL z,0xaabb       
    034D  aa         XOR D               
    034E  99         SBC A,C             
    034F  88         ADC A,B             
    0350  77         LD (HL),A           
    0351  66         LD H,(HL)           
    0352  66         LD H,(HL)           
    0353  55         LD D,L              
    0354  44         LD B,H              
    0355  33         INC SP              
    0356  222211     LD (0x1122),HL      
    0359  00         NOP                 
    035A  ddcb0296   RES 2,(IX+2)        
    035E  ddcb0276   BIT 6,(IX+2)        
    0362  207b       JR nz,0x03df        
    0364  dd7e1b     LD A,(IX+0x1b)      
    0367  3d         DEC A               
    0368  2875       JR z,0x03df         
    036A  fe01       CP 1                
    036C  dd771b     LD (IX+0x1b),A      
    036F  2008       JR nz,0x0379        
    0371  210f41     LD HL,0x410f        
    0374  dd7e29     LD A,(IX+0x29)      
    0377  b6         OR (HL)             
    0378  77         LD (HL),A           
    0379  ddcb0266   BIT 4,(IX+2)        
    037D  c8         RET z               
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
    039B  29         ADD HL,HL           
    039C  29         ADD HL,HL           
    039D  4d         LD C,L              
    039E  44         LD B,H              
    039F  29         ADD HL,HL           
    03A0  09         ADD HL,BC           
    03A1  19         ADD HL,DE           
    03A2  19         ADD HL,DE           
    03A3  19         ADD HL,DE           
    03A4  180e       JR 0x03b4           
    03A6  5d         LD E,L              
    03A7  54         LD D,H              
    03A8  29         ADD HL,HL           
    03A9  29         ADD HL,HL           
    03AA  29         ADD HL,HL           
    03AB  29         ADD HL,HL           
    03AC  29         ADD HL,HL           
    03AD  29         ADD HL,HL           
    03AE  19         ADD HL,DE           
    03AF  3003       JR nc,0x03b4        
    03B1  21ffff     LD HL,0xffff        
    03B4  cb3c       SRL H               
    03B6  cb1d       RR L                
    03B8  cb3c       SRL H               
    03BA  cb1d       RR L                
    03BC  cb3c       SRL H               
    03BE  cb1d       RR L                

ay_flush_tone:
    03C0  cb3c       SRL H                  ; --- AY tone-period flush (IX=voice block) ---
    03C2  cb1d       RR L                
    03C4  dd7517     LD (IX+0x17),L      
    03C7  dd7418     LD (IX+0x18),H      
    03CA  dd4e28     LD C,(IX+0x28)         ; C = IX+0x28 (AY latch port 0x81/0x41)
    03CD  dd7e20     LD A,(IX+0x20)         ; A = IX+0x20 (AY reg# tone-lo); OUT(C),A latch; DEC C; OUT(C),L data-lo
    03D0  ed79       OUT (C),A           
    03D2  0d         DEC C               
    03D3  ed69       OUT (C),L           
    03D5  dd7e21     LD A,(IX+0x21)         ; A = IX+0x21 (AY reg# tone-hi); OUT(C),A latch; OUT(C),H data-hi
    03D8  0c         INC C               
    03D9  ed79       OUT (C),A           
    03DB  0d         DEC C               
    03DC  ed61       OUT (C),H           
    03DE  c9         RET                 

ay_flush_vol:
    03DF  dd4e28     LD C,(IX+0x28)         ; --- AY volume flush w/ change-detect (IX+0x25 reg#, IX+0x32 shadow) ---
    03E2  dd461f     LD B,(IX+0x1f)      
    03E5  dd7032     LD (IX+0x32),B      
    03E8  dd7e25     LD A,(IX+0x25)      
    03EB  a8         XOR B               
    03EC  201f       JR nz,0x040d        
    03EE  dd7e20     LD A,(IX+0x20)      
    03F1  ed79       OUT (C),A           
    03F3  dd7e0b     LD A,(IX+11)        
    03F6  dd7717     LD (IX+0x17),A      
    03F9  0d         DEC C               
    03FA  ed79       OUT (C),A           
    03FC  dd7e21     LD A,(IX+0x21)      
    03FF  0c         INC C               
    0400  ed79       OUT (C),A           
    0402  dd7e0c     LD A,(IX+12)        
    0405  dd7718     LD (IX+0x18),A      
    0408  0d         DEC C               
    0409  ed79       OUT (C),A           
    040B  180e       JR 0x041b           
    040D  3e06       LD A,6              
    040F  ed79       OUT (C),A           
    0411  dd5e2a     LD E,(IX+0x2a)      
    0414  dd562b     LD D,(IX+0x2b)      
    0417  1a         LD A,(DE)           
    0418  0d         DEC C               
    0419  ed79       OUT (C),A           
    041B  dd7e09     LD A,(IX+9)         
    041E  dd771b     LD (IX+0x1b),A      
    0421  dd7e19     LD A,(IX+0x19)      
    0424  dd771a     LD (IX+0x1a),A      
    0427  dd7e0d     LD A,(IX+13)        
    042A  dd771c     LD (IX+0x1c),A      
    042D  dd7e0f     LD A,(IX+15)        
    0430  dd771d     LD (IX+0x1d),A      
    0433  dd7e10     LD A,(IX+0x10)      
    0436  dd771e     LD (IX+0x1e),A      
    0439  dd360400   LD (IX+4),0         
    043D  ddcb024e   BIT 1,(IX+2)        
    0441  280c       JR z,0x044f         
    0443  dd7e15     LD A,(IX+0x15)      
    0446  dd7704     LD (IX+4),A         
    0449  dd7e16     LD A,(IX+0x16)      
    044C  dd771e     LD (IX+0x1e),A      
    044F  ddcb0296   RES 2,(IX+2)        
    0453  ddcb026e   BIT 5,(IX+2)        
    0457  2808       JR z,0x0461         
    0459  ddcb02ae   RES 5,(IX+2)        
    045D  ddcb02d6   SET 2,(IX+2)        
    0461  210f41     LD HL,0x410f        
    0464  dd7e29     LD A,(IX+0x29)      
    0467  5f         LD E,A              
    0468  2f         CPL                 
    0469  a6         AND (HL)            
    046A  f6c0       OR 0xc0             
    046C  77         LD (HL),A           
    046D  210641     LD HL,0x4106        
    0470  7b         LD A,E              
    0471  b6         OR (HL)             
    0472  77         LD (HL),A           
    0473  ddcb02b6   RES 6,(IX+2)        
    0477  c9         RET                 
    0478  ddcb027e   BIT 7,(IX+2)        
    047C  2831       JR z,0x04af         
    047E  ddcb02c6   SET 0,(IX+2)        
    0482  ddcb0296   RES 2,(IX+2)        
    0486  ddcb02ae   RES 5,(IX+2)        
    048A  ddcb02be   RES 7,(IX+2)        
    048E  dd360300   LD (IX+3),0         
    0492  dd361300   LD (IX+0x13),0      
    0496  dd361400   LD (IX+0x14),0      
    049A  dd36197f   LD (IX+0x19),0x7f   
    049E  dde5       PUSH IX             
    04A0  e1         POP HL              
    04A1  dd7507     LD (IX+7),L         
    04A4  dd7408     LD (IX+8),H         
    04A7  dd6e00     LD L,(IX)           
    04AA  dd6601     LD H,(IX+1)         
    04AD  180e       JR 0x04bd           
    04AF  210641     LD HL,0x4106        
    04B2  dd7e29     LD A,(IX+0x29)      
    04B5  a6         AND (HL)            
    04B6  c8         RET z               
    04B7  dd6634     LD H,(IX+0x34)      
    04BA  dd6e33     LD L,(IX+0x33)      
    04BD  ddcb028e   RES 1,(IX+2)        
    04C1  dd361001   LD (IX+0x10),1      
    04C5  7e         LD A,(HL)           
    04C6  3c         INC A               
    04C7  2006       JR nz,0x04cf        
    04C9  23         INC HL              
    04CA  18f9       JR 0x04c5           
    04CC  23         INC HL              
    04CD  23         INC HL              
    04CE  23         INC HL              
    04CF  7e         LD A,(HL)           
    04D0  e60f       AND 15              
    04D2  fe0e       CP 14               
    04D4  c2d705     JP nz,0x05d7        
    04D7  7e         LD A,(HL)           
    04D8  cb0f       RRC A               
    04DA  cb0f       RRC A               
    04DC  cb0f       RRC A               
    04DE  e61e       AND 0x1e            
    04E0  eb         EX DE,HL            
    04E1  216706     LD HL,0x667         
    04E4  0600       LD B,0              
    04E6  4f         LD C,A              
    04E7  09         ADD HL,BC           
    04E8  4e         LD C,(HL)           
    04E9  23         INC HL              
    04EA  46         LD B,(HL)           
    04EB  69         LD L,C              
    04EC  60         LD H,B              
    04ED  e9         JP (HL)             
    04EE  eb         EX DE,HL            
    04EF  23         INC HL              
    04F0  5e         LD E,(HL)           
    04F1  23         INC HL              
    04F2  56         LD D,(HL)           
    04F3  af         XOR A               
    04F4  b3         OR E                
    04F5  b2         OR D                
    04F6  200b       JR nz,0x0503        
    04F8  116002     LD DE,0x260         
    04FB  ddcb0296   RES 2,(IX+2)        
    04FF  ddcb02ee   SET 5,(IX+2)        
    0503  eb         EX DE,HL            
    0504  18bf       JR 0x04c5           
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
    0515  23         INC HL              
    0516  5e         LD E,(HL)           
    0517  23         INC HL              
    0518  7e         LD A,(HL)           
    0519  57         LD D,A              
    051A  b3         OR E                
    051B  2809       JR z,0x0526         
    051D  dd4e13     LD C,(IX+0x13)      
    0520  dd4614     LD B,(IX+0x14)      
    0523  eb         EX DE,HL            
    0524  09         ADD HL,BC           
    0525  eb         EX DE,HL            
    0526  dd7313     LD (IX+0x13),E      
    0529  dd7214     LD (IX+0x14),D      
    052C  23         INC HL              
    052D  1896       JR 0x04c5           
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
    05D7  ddcb02a6   RES 4,(IX+2)        
    05DB  7e         LD A,(HL)           
    05DC  dd770a     LD (IX+10),A        
    05DF  e60f       AND 15              
    05E1  fe0f       CP 15               
    05E3  2011       JR nz,0x05f6        
    05E5  23         INC HL              
    05E6  7e         LD A,(HL)           
    05E7  dd5e2a     LD E,(IX+0x2a)      
    05EA  dd562b     LD D,(IX+0x2b)      
    05ED  12         LD (DE),A           
    05EE  dd7e23     LD A,(IX+0x23)      
    05F1  dd771f     LD (IX+0x1f),A      
    05F4  181f       JR 0x0615           
    05F6  dd7e25     LD A,(IX+0x25)      
    05F9  dd771f     LD (IX+0x1f),A      
    05FC  7e         LD A,(HL)           
    05FD  e60f       AND 15              
    05FF  57         LD D,A              
    0600  23         INC HL              
    0601  5e         LD E,(HL)           
    0602  dd4e13     LD C,(IX+0x13)      
    0605  dd7e14     LD A,(IX+0x14)      
    0608  47         LD B,A              
    0609  b1         OR C                
    060A  2803       JR z,0x060f         
    060C  eb         EX DE,HL            
    060D  09         ADD HL,BC           
    060E  eb         EX DE,HL            
    060F  dd720c     LD (IX+12),D        
    0612  dd730b     LD (IX+11),E        
    0615  dd7e03     LD A,(IX+3)         
    0618  a7         AND A               
    0619  2002       JR nz,0x061d        
    061B  23         INC HL              
    061C  7e         LD A,(HL)           
    061D  dd7709     LD (IX+9),A         
    0620  23         INC HL              
    0621  dd7434     LD (IX+0x34),H      
    0624  dd7533     LD (IX+0x33),L      
    0627  dd7e0a     LD A,(IX+10)        
    062A  0f         RRCA                
    062B  0f         RRCA                
    062C  0f         RRCA                
    062D  e61e       AND 0x1e            
    062F  fe1c       CP 0x1c             
    0631  200d       JR nz,0x0640        
    0633  dd7e05     LD A,(IX+5)         
    0636  e6f0       AND 0xf0            
    0638  dd770d     LD (IX+13),A        
    063B  dd7e06     LD A,(IX+6)         
    063E  180c       JR 0x064c           
    0640  216a02     LD HL,0x26a         
    0643  d7         RST 0x10            
    0644  7e         LD A,(HL)           
    0645  e6f0       AND 0xf0            
    0647  dd770d     LD (IX+13),A        
    064A  23         INC HL              
    064B  7e         LD A,(HL)           
    064C  dd770f     LD (IX+15),A        
    064F  ddcb0246   BIT 0,(IX+2)        
    0653  2808       JR z,0x065d         
    0655  ddcb02f6   SET 6,(IX+2)        
    0659  ddcb0286   RES 0,(IX+2)        
    065D  210641     LD HL,0x4106        
    0660  dd7e29     LD A,(IX+0x29)      
    0663  2f         CPL                 
    0664  a6         AND (HL)            
    0665  77         LD (HL),A           
    0666  c9         RET                 
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
    0687  3a0940     LD A,(0x4009)       
    068A  cb77       BIT 6,A             
    068C  200d       JR nz,0x069b        
    068E  111041     LD DE,0x4110        
    0691  210640     LD HL,0x4006        
    0694  dd214041   LD IX,0x4140        
    0698  cdaf06     CALL 0x06af         
    069B  3a0940     LD A,(0x4009)       
    069E  cb7f       BIT 7,A             
    06A0  c0         RET nz              
    06A1  111141     LD DE,0x4111        
    06A4  210740     LD HL,0x4007        
    06A7  dd210042   LD IX,0x4200        
    06AB  cdaf06     CALL 0x06af         
    06AE  c9         RET                 
    06AF  cb7e       BIT 7,(HL)          
    06B1  2018       JR nz,0x06cb        
    06B3  ddcb0256   BIT 2,(IX+2)        
    06B7  2818       JR z,0x06d1         
    06B9  ddcb027e   BIT 7,(IX+2)        
    06BD  2012       JR nz,0x06d1        
    06BF  ddcb0246   BIT 0,(IX+2)        
    06C3  200c       JR nz,0x06d1        
    06C5  ddcb0276   BIT 6,(IX+2)        
    06C9  2006       JR nz,0x06d1        
    06CB  af         XOR A               
    06CC  12         LD (DE),A           
    06CD  ddcb0296   RES 2,(IX+2)        
    06D1  1a         LD A,(DE)           
    06D2  47         LD B,A              
    06D3  7e         LD A,(HL)           
    06D4  4f         LD C,A              
    06D5  3600       LD (HL),0           
    06D7  e67f       AND 0x7f            
    06D9  c8         RET z               
    06DA  b8         CP B                
    06DB  d8         RET c               
    06DC  217408     LD HL,0x874         
    06DF  46         LD B,(HL)           
    06E0  b8         CP B                
    06E1  3804       JR c,0x06e7         
    06E3  3a7408     LD A,(0x0874)       
    06E6  4f         LD C,A              
    06E7  79         LD A,C              
    06E8  12         LD (DE),A           
    06E9  87         ADD A,A             
    06EA  211808     LD HL,0x818         
    06ED  0600       LD B,0              
    06EF  4f         LD C,A              
    06F0  09         ADD HL,BC           
    06F1  5e         LD E,(HL)           
    06F2  23         INC HL              
    06F3  56         LD D,(HL)           
    06F4  cdf007     CALL 0x07f0         
    06F7  210641     LD HL,0x4106        
    06FA  cbfe       SET 7,(HL)          
    06FC  c9         RET                 
    06FD  217241     LD HL,0x4172        
    0700  7e         LD A,(HL)           
    0701  21b241     LD HL,0x41b2        
    0704  a6         AND (HL)            
    0705  21f241     LD HL,0x41f2        
    0708  a6         AND (HL)            
    0709  f6c0       OR 0xc0             
    070B  47         LD B,A              
    070C  3a0a41     LD A,(0x410a)       
    070F  a8         XOR B               
    0710  280a       JR z,0x071c         
    0712  3e07       LD A,7              
    0714  d381       OUT (0x0081),A      
    0716  78         LD A,B              
    0717  320a41     LD (0x410a),A       
    071A  d380       OUT (0x0080),A      
    071C  213242     LD HL,0x4232        
    071F  7e         LD A,(HL)           
    0720  217242     LD HL,0x4272        
    0723  a6         AND (HL)            
    0724  21b242     LD HL,0x42b2        
    0727  a6         AND (HL)            
    0728  e63f       AND 0x3f            
    072A  47         LD B,A              
    072B  3a0841     LD A,(0x4108)       
    072E  a8         XOR B               
    072F  280a       JR z,0x073b         
    0731  3e07       LD A,7              
    0733  d341       OUT (0x0041),A      
    0735  78         LD A,B              
    0736  320841     LD (0x4108),A       
    0739  d340       OUT (0x0040),A      
    073B  3a0341     LD A,(0x4103)       
    073E  f670       OR 0x70             
    0740  215a41     LD HL,0x415a        
    0743  a6         AND (HL)            
    0744  219a41     LD HL,0x419a        
    0747  a6         AND (HL)            
    0748  21da41     LD HL,0x41da        
    074B  a6         AND (HL)            
    074C  320341     LD (0x4103),A       
    074F  3a0541     LD A,(0x4105)       
    0752  f670       OR 0x70             
    0754  211a42     LD HL,0x421a        
    0757  a6         AND (HL)            
    0758  215a42     LD HL,0x425a        
    075B  a6         AND (HL)            
    075C  219a42     LD HL,0x429a        
    075F  a6         AND (HL)            
    0760  320541     LD (0x4105),A       
    0763  3a0840     LD A,(0x4008)       
    0766  cb7f       BIT 7,A             
    0768  200b       JR nz,0x0775        
    076A  010400     LD BC,4             
    076D  210241     LD HL,0x4102        
    0770  112040     LD DE,0x4020        
    0773  edb0       LDIR                
    0775  212b40     LD HL,0x402b        
    0778  3a2040     LD A,(0x4020)       
    077B  cb47       BIT 0,A             
    077D  2804       JR z,0x0783         
    077F  cbde       SET 3,(HL)          
    0781  1802       JR 0x0785           
    0783  cb9e       RES 3,(HL)          
    0785  3a2140     LD A,(0x4021)       
    0788  cb77       BIT 6,A             
    078A  2806       JR z,0x0792         
    078C  cbfe       SET 7,(HL)          
    078E  cbf6       SET 6,(HL)          
    0790  1804       JR 0x0796           
    0792  cbbe       RES 7,(HL)          
    0794  cbb6       RES 6,(HL)          
    0796  3a2340     LD A,(0x4023)       
    0799  e630       AND 0x30            
    079B  5f         LD E,A              
    079C  7e         LD A,(HL)           
    079D  e6cf       AND 0xcf            
    079F  b3         OR E                
    07A0  77         LD (HL),A           
    07A1  c9         RET                 
    07A2  dd7e1e     LD A,(IX+0x1e)      
    07A5  3d         DEC A               
    07A6  dd771e     LD (IX+0x1e),A      
    07A9  dd7716     LD (IX+0x16),A      
    07AC  c0         RET nz              
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
    07CF  cb2f       SRA A               
    07D1  218a02     LD HL,0x28a         
    07D4  1600       LD D,0              
    07D6  5f         LD E,A              
    07D7  19         ADD HL,DE           
    07D8  dd7e1c     LD A,(IX+0x1c)      
    07DB  e6f0       AND 0xf0            
    07DD  5f         LD E,A              
    07DE  19         ADD HL,DE           
    07DF  7e         LD A,(HL)           
    07E0  ddcb0446   BIT 0,(IX+4)        
    07E4  2004       JR nz,0x07ea        
    07E6  0f         RRCA                
    07E7  0f         RRCA                
    07E8  0f         RRCA                
    07E9  0f         RRCA                
    07EA  e60f       AND 15              
    07EC  0d         DEC C               
    07ED  ed79       OUT (C),A           
    07EF  c9         RET                 
    07F0  214041     LD HL,0x4140        
    07F3  0606       LD B,6              
    07F5  af         XOR A               
    07F6  1a         LD A,(DE)           
    07F7  a7         AND A               
    07F8  2006       JR nz,0x0800        
    07FA  13         INC DE              
    07FB  1a         LD A,(DE)           
    07FC  a7         AND A               
    07FD  280c       JR z,0x080b         
    07FF  1b         DEC DE              
    0800  1a         LD A,(DE)           
    0801  77         LD (HL),A           
    0802  13         INC DE              
    0803  23         INC HL              
    0804  1a         LD A,(DE)           
    0805  77         LD (HL),A           
    0806  23         INC HL              
    0807  cbfe       SET 7,(HL)          
    0809  2b         DEC HL              
    080A  2b         DEC HL              
    080B  05         DEC B               
    080C  c8         RET z               
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
    083C  b9         CP C                
    083D  11f112     LD DE,0x12f1        
    0840  fd12       LD (DE),A           
    0842  ad         XOR L               
    0843  13         INC DE              
    0844  46         LD B,(HL)           
    0845  0e52       LD C,0x52           
    0847  0ec7       LD C,0xc7           
    0849  12         LD (DE),A           
    084A  83         ADD A,E             
    084B  10f9       DJNZ 0x0846         
    084D  1009       DJNZ 0x0858         
    084F  13         INC DE              
    0850  c30fcf     JP 0xcf0f           
    0853  0f         RRCA                
    0854  db0f       IN A,(0x000f)       
    0856  e7         RST 0x20            
    0857  0f         RRCA                
    0858  f3         DI                  
    0859  0f         RRCA                
    085A  ff         RST 0x38            
    085B  0f         RRCA                
    085C  0b         DEC BC              
    085D  1017       DJNZ 0x0876         
    085F  10db       DJNZ 0x083c         
    0861  13         INC DE              
    0862  1c         INC E               
    0863  15         DEC D               
    0864  9a         SBC A,D             
    0865  15         DEC D               
    0866  1816       JR 0x087e           
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

snd_tick:
    0875  f5         PUSH AF                ; IRQ tick: save regs; if [0x4008]==FF ->reset; cmd_handler; sample PIT; voices
    0876  dde5       PUSH IX             
    0878  e5         PUSH HL             
    0879  d5         PUSH DE             
    087A  c5         PUSH BC             
    087B  3a0840     LD A,(0x4008)       
    087E  feff       CP 0xff             
    0880  ca0000     JP z,0x0000         
    0883  cdd70b     CALL 0x0bd7         
    0886  3a0060     LD A,(0x6000)       
    0889  320344     LD (0x4403),A       
    088C  3a0160     LD A,(0x6001)       
    088F  320444     LD (0x4404),A       
    0892  cd4809     CALL 0x0948         
    0895  cd7009     CALL 0x0970         
    0898  3a0041     LD A,(0x4100)       
    089B  3c         INC A               
    089C  320041     LD (0x4100),A       
    089F  e603       AND 3               
    08A1  6f         LD L,A              
    08A2  87         ADD A,A             
    08A3  85         ADD A,L             
    08A4  21ac08     LD HL,0x8ac         
    08A7  1600       LD D,0              
    08A9  5f         LD E,A              
    08AA  19         ADD HL,DE           
    08AB  e9         JP (HL)             
    08AC  c3b808     JP 0x08b8           
    08AF  c3d308     JP 0x08d3           
    08B2  c3c708     JP 0x08c7           
    08B5  c3d308     JP 0x08d3           
    08B8  cd470c     CALL 0x0c47         
    08BB  cd320d     CALL 0x0d32         
    08BE  cdd009     CALL 0x09d0         
    08C1  cd730a     CALL 0x0a73         
    08C4  c31609     JP 0x0916           
    08C7  cdac0a     CALL 0x0aac         
    08CA  cd130c     CALL 0x0c13         
    08CD  cd880c     CALL 0x0c88         
    08D0  c31609     JP 0x0916           
    08D3  210f41     LD HL,0x410f        
    08D6  3a0641     LD A,(0x4106)       
    08D9  a6         AND (HL)            
    08DA  2032       JR nz,0x090e        
    08DC  dd214041   LD IX,0x4140        
    08E0  cd5a03     CALL 0x035a         
    08E3  dd218041   LD IX,0x4180        
    08E7  cd5a03     CALL 0x035a         
    08EA  dd21c041   LD IX,0x41c0        
    08EE  cd5a03     CALL 0x035a         
    08F1  dd210042   LD IX,0x4200        
    08F5  cd5a03     CALL 0x035a         
    08F8  dd214042   LD IX,0x4240        
    08FC  cd5a03     CALL 0x035a         
    08FF  dd218042   LD IX,0x4280        
    0903  cd5a03     CALL 0x035a         
    0906  3a0940     LD A,(0x4009)       
    0909  e601       AND 1               
    090B  ccfd06     CALL z,0x06fd       
    090E  3a0940     LD A,(0x4009)       
    0911  e601       AND 1               
    0913  cc8706     CALL z,0x0687       
    0916  dd214041   LD IX,0x4140        
    091A  cda207     CALL 0x07a2         
    091D  dd218041   LD IX,0x4180        
    0921  cda207     CALL 0x07a2         
    0924  dd21c041   LD IX,0x41c0        
    0928  cda207     CALL 0x07a2         
    092B  dd210042   LD IX,0x4200        
    092F  cda207     CALL 0x07a2         
    0932  dd214042   LD IX,0x4240        
    0936  cda207     CALL 0x07a2         
    0939  dd218042   LD IX,0x4280        
    093D  cda207     CALL 0x07a2         
    0940  c1         POP BC              
    0941  d1         POP DE              
    0942  e1         POP HL              
    0943  dde1       POP IX              
    0945  f1         POP AF              
    0946  fb         EI                  
    0947  c9         RET                 

voice_upd_A:
    0948  110240     LD DE,0x4002           ; voice update A: PIT[0x4403] -> pit_delta -> AY period (engine pitch)
    094B  210544     LD HL,0x4405        
    094E  3a0344     LD A,(0x4403)       
    0951  cd5509     CALL 0x0955         
    0954  c9         RET                 

pit_delta:
    0955  e60f       AND 15                 ; pit_delta: AND 15; edge vs prev; sign-extend; NEG -> signed step
    0957  46         LD B,(HL)           
    0958  77         LD (HL),A           
    0959  90         SUB B               
    095A  c8         RET z               
    095B  eb         EX DE,HL            
    095C  cb5f       BIT 3,A             
    095E  2809       JR z,0x0969         
    0960  f6f0       OR 0xf0             
    0962  ed44       NEG                 
    0964  47         LD B,A              
    0965  35         DEC (HL)            
    0966  10fd       DJNZ 0x0965         
    0968  c9         RET                 
    0969  e60f       AND 15              
    096B  47         LD B,A              
    096C  34         INC (HL)            
    096D  10fd       DJNZ 0x096c         
    096F  c9         RET                 

voice_upd_B:
    0970  114040     LD DE,0x4040           ; voice update B: two voices from PIT[0x4403]/[0x4404]
    0973  210744     LD HL,0x4407        
    0976  3a0344     LD A,(0x4403)       
    0979  cd9d09     CALL 0x099d         
    097C  77         LD (HL),A           
    097D  110040     LD DE,0x4000        
    0980  21ba09     LD HL,0x9ba         
    0983  d7         RST 0x10            
    0984  eda0       LDI                 
    0986  114140     LD DE,0x4041        
    0989  210844     LD HL,0x4408        
    098C  3a0444     LD A,(0x4404)       
    098F  cd9d09     CALL 0x099d         
    0992  77         LD (HL),A           
    0993  110140     LD DE,0x4001        
    0996  21ba09     LD HL,0x9ba         
    0999  d7         RST 0x10            
    099A  eda0       LDI                 
    099C  c9         RET                 

voice_calc:
    099D  4e         LD C,(HL)           
    099E  e6f0       AND 0xf0            
    09A0  0f         RRCA                
    09A1  0f         RRCA                
    09A2  0f         RRCA                
    09A3  0f         RRCA                
    09A4  77         LD (HL),A           
    09A5  eb         EX DE,HL            
    09A6  91         SUB C               
    09A7  cb5f       BIT 3,A             
    09A9  2806       JR z,0x09b1         
    09AB  f6f0       OR 0xf0             
    09AD  86         ADD A,(HL)          
    09AE  f0         RET p               
    09AF  af         XOR A               
    09B0  c9         RET                 
    09B1  e60f       AND 15              
    09B3  86         ADD A,(HL)          
    09B4  fe15       CP 0x15             
    09B6  d8         RET c               
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
    09D0  210b44     LD HL,0x440b        
    09D3  3a3040     LD A,(0x4030)       
    09D6  0606       LD B,6              
    09D8  cbae       RES 5,(HL)          
    09DA  0f         RRCA                
    09DB  3002       JR nc,0x09df        
    09DD  cbee       SET 5,(HL)          
    09DF  23         INC HL              
    09E0  10f6       DJNZ 0x09d8         
    09E2  3a3040     LD A,(0x4030)       
    09E5  e680       AND 0x80            
    09E7  321b44     LD (0x441b),A       
    09EA  210b44     LD HL,0x440b        
    09ED  111744     LD DE,0x4417        
    09F0  011144     LD BC,0x4411        
    09F3  cd300a     CALL 0x0a30         
    09F6  23         INC HL              
    09F7  13         INC DE              
    09F8  03         INC BC              
    09F9  cd300a     CALL 0x0a30         
    09FC  3a3240     LD A,(0x4032)       
    09FF  cb7f       BIT 7,A             
    0A01  2805       JR z,0x0a08         
    0A03  3e80       LD A,0x80           
    0A05  321b44     LD (0x441b),A       
    0A08  111944     LD DE,0x4419        
    0A0B  210d44     LD HL,0x440d        
    0A0E  011344     LD BC,0x4413        
    0A11  cd300a     CALL 0x0a30         
    0A14  210440     LD HL,0x4004        
    0A17  3a0b44     LD A,(0x440b)       
    0A1A  07         RLCA                
    0A1B  3002       JR nc,0x0a1f        
    0A1D  cbc6       SET 0,(HL)          
    0A1F  3a0c44     LD A,(0x440c)       
    0A22  07         RLCA                
    0A23  3002       JR nc,0x0a27        
    0A25  cbce       SET 1,(HL)          
    0A27  3a0d44     LD A,(0x440d)       
    0A2A  07         RLCA                
    0A2B  3002       JR nc,0x0a2f        
    0A2D  cbd6       SET 2,(HL)          
    0A2F  c9         RET                 
    0A30  cbbe       RES 7,(HL)          
    0A32  cb76       BIT 6,(HL)          
    0A34  202a       JR nz,0x0a60        
    0A36  cb6e       BIT 5,(HL)          
    0A38  282f       JR z,0x0a69         
    0A3A  0a         LD A,(BC)           
    0A3B  e61f       AND 0x1f            
    0A3D  ee03       XOR 3               
    0A3F  200c       JR nz,0x0a4d        
    0A41  cbf6       SET 6,(HL)          
    0A43  3a1b44     LD A,(0x441b)       
    0A46  b7         OR A                
    0A47  2804       JR z,0x0a4d         
    0A49  cbfe       SET 7,(HL)          
    0A4B  cbb6       RES 6,(HL)          
    0A4D  0a         LD A,(BC)           
    0A4E  07         RLCA                
    0A4F  cbc7       SET 0,A             
    0A51  02         LD (BC),A           
    0A52  34         INC (HL)            
    0A53  7e         LD A,(HL)           
    0A54  e61f       AND 0x1f            
    0A56  fe1e       CP 0x1e             
    0A58  d8         RET c               
    0A59  7e         LD A,(HL)           
    0A5A  e6be       AND 0xbe            
    0A5C  f63e       OR 0x3e             
    0A5E  77         LD (HL),A           
    0A5F  c9         RET                 
    0A60  cb6e       BIT 5,(HL)          
    0A62  20e9       JR nz,0x0a4d        
    0A64  cbfe       SET 7,(HL)          
    0A66  1a         LD A,(DE)           
    0A67  3c         INC A               
    0A68  12         LD (DE),A           
    0A69  0a         LD A,(BC)           
    0A6A  07         RLCA                
    0A6B  cb87       RES 0,A             
    0A6D  02         LD (BC),A           
    0A6E  7e         LD A,(HL)           
    0A6F  e680       AND 0x80            
    0A71  77         LD (HL),A           
    0A72  c9         RET                 
    0A73  3a0041     LD A,(0x4100)       
    0A76  e61f       AND 0x1f            
    0A78  c0         RET nz              
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
    0A94  3a1844     LD A,(0x4418)       
    0A97  a7         AND A               
    0A98  2806       JR z,0x0aa0         
    0A9A  3d         DEC A               
    0A9B  321844     LD (0x4418),A       
    0A9E  cb8e       RES 1,(HL)          
    0AA0  3a1944     LD A,(0x4419)       
    0AA3  a7         AND A               
    0AA4  c8         RET z               
    0AA5  3d         DEC A               
    0AA6  321944     LD (0x4419),A       
    0AA9  cb96       RES 2,(HL)          
    0AAB  c9         RET                 
    0AAC  3a0940     LD A,(0x4009)       
    0AAF  e601       AND 1               
    0AB1  201c       JR nz,0x0acf        
    0AB3  3a0840     LD A,(0x4008)       
    0AB6  e60f       AND 15              
    0AB8  fe05       CP 5                
    0ABA  3813       JR c,0x0acf         
    0ABC  fe06       CP 6                
    0ABE  3822       JR c,0x0ae2         
    0AC0  fe07       CP 7                
    0AC2  300b       JR nc,0x0acf        
    0AC4  3a1041     LD A,(0x4110)       
    0AC7  fe0f       CP 15               
    0AC9  2804       JR z,0x0acf         
    0ACB  fe1b       CP 0x1b             
    0ACD  2056       JR nz,0x0b25        
    0ACF  af         XOR A               
    0AD0  320050     LD (0x5000),A       
    0AD3  320050     LD (0x5000),A       
    0AD6  3e36       LD A,0x36           
    0AD8  320350     LD (0x5003),A       
    0ADB  210000     LD HL,0             
    0ADE  222044     LD (0x4420),HL      
    0AE1  c9         RET                 
    0AE2  3a0040     LD A,(0x4000)       
    0AE5  87         ADD A,A             
    0AE6  21850b     LD HL,0xb85         
    0AE9  d7         RST 0x10            
    0AEA  e7         RST 0x20            
    0AEB  ed5b2044   LD DE,(0x4420)      
    0AEF  ed52       SBC HL,DE           
    0AF1  3815       JR c,0x0b08         
    0AF3  eb         EX DE,HL            
    0AF4  0608       LD B,8              
    0AF6  cb3a       SRL D               
    0AF8  cb1b       RR E                
    0AFA  10fa       DJNZ 0x0af6         
    0AFC  13         INC DE              
    0AFD  2a2044     LD HL,(0x4420)      
    0B00  19         ADD HL,DE           
    0B01  222044     LD (0x4420),HL      
    0B04  44         LD B,H              
    0B05  4d         LD C,L              
    0B06  1834       JR 0x0b3c           
    0B08  eb         EX DE,HL            
    0B09  af         XOR A               
    0B0A  67         LD H,A              
    0B0B  6f         LD L,A              
    0B0C  ed52       SBC HL,DE           
    0B0E  eb         EX DE,HL            
    0B0F  0605       LD B,5              
    0B11  cb3a       SRL D               
    0B13  cb1b       RR E                
    0B15  10fa       DJNZ 0x0b11         
    0B17  13         INC DE              
    0B18  2a2044     LD HL,(0x4420)      
    0B1B  b7         OR A                
    0B1C  ed52       SBC HL,DE           
    0B1E  222044     LD (0x4420),HL      
    0B21  44         LD B,H              
    0B22  4d         LD C,L              
    0B23  1817       JR 0x0b3c           
    0B25  ed5b0a40   LD DE,(0x400a)      
    0B29  cb2a       SRA D               
    0B2B  cb1b       RR E                
    0B2D  cb7a       BIT 7,D             
    0B2F  2803       JR z,0x0b34         
    0B31  af         XOR A               
    0B32  57         LD D,A              
    0B33  5f         LD E,A              
    0B34  212c01     LD HL,0x12c         
    0B37  19         ADD HL,DE           
    0B38  eb         EX DE,HL            
    0B39  cd640b     CALL 0x0b64         
    0B3C  60         LD H,B              
    0B3D  69         LD L,C              
    0B3E  cd490b     CALL 0x0b49         
    0B41  44         LD B,H              
    0B42  4d         LD C,L              
    0B43  210050     LD HL,0x5000        
    0B46  71         LD (HL),C           
    0B47  70         LD (HL),B           
    0B48  c9         RET                 
    0B49  3a2a44     LD A,(0x442a)       
    0B4C  c610       ADD A,0x10          
    0B4E  322a44     LD (0x442a),A       
    0B51  cb7f       BIT 7,A             
    0B53  ca5a0b     JP z,0x0b5a         
    0B56  f680       OR 0x80             
    0B58  ed44       NEG                 
    0B5A  0f         RRCA                
    0B5B  0f         RRCA                
    0B5C  0f         RRCA                
    0B5D  e60f       AND 15              
    0B5F  5f         LD E,A              
    0B60  1600       LD D,0              
    0B62  19         ADD HL,DE           
    0B63  c9         RET                 
    0B64  215000     LD HL,0x50          
    0B67  010000     LD BC,0             
    0B6A  3e10       LD A,0x10           
    0B6C  ed52       SBC HL,DE           
    0B6E  380b       JR c,0x0b7b         
    0B70  cbc1       SET 0,C             
    0B72  29         ADD HL,HL           
    0B73  cb11       RL C                
    0B75  cb10       RL B                
    0B77  3d         DEC A               
    0B78  20f2       JR nz,0x0b6c        
    0B7A  c9         RET                 
    0B7B  19         ADD HL,DE           
    0B7C  29         ADD HL,HL           
    0B7D  cb11       RL C                
    0B7F  cb10       RL B                
    0B81  3d         DEC A               
    0B82  20e8       JR nz,0x0b6c        
    0B84  c9         RET                 
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
    0BA3  64         LD H,H              
    0BA4  04         INC B               
    0BA5  3a6500     LD A,(0x0065)       
    0BA8  cb57       BIT 2,A             
    0BAA  c0         RET nz              
    0BAB  212440     LD HL,0x4024        
    0BAE  3601       LD (HL),1           
    0BB0  3a0840     LD A,(0x4008)       
    0BB3  fefe       CP 0xfe             
    0BB5  c8         RET z               
    0BB6  7e         LD A,(HL)           
    0BB7  fe02       CP 2                
    0BB9  20f5       JR nz,0x0bb0        
    0BBB  34         INC (HL)            
    0BBC  3a0840     LD A,(0x4008)       
    0BBF  fefe       CP 0xfe             
    0BC1  c8         RET z               
    0BC2  7e         LD A,(HL)           
    0BC3  fe04       CP 4                
    0BC5  20f5       JR nz,0x0bbc        
    0BC7  3c         INC A               
    0BC8  3224c0     LD (0xc024),A       
    0BCB  3a0840     LD A,(0x4008)       
    0BCE  fefe       CP 0xfe             
    0BD0  c8         RET z               
    0BD1  7e         LD A,(HL)           
    0BD2  fe06       CP 6                
    0BD4  20f5       JR nz,0x0bcb        
    0BD6  c9         RET                 

cmd_handler:
    0BD7  211c44     LD HL,0x441c           ; command handler: mailbox flag [0x441C]; ack via PPI latch 0x7000
    0BDA  7e         LD A,(HL)           
    0BDB  a7         AND A               
    0BDC  200e       JR nz,0x0bec        
    0BDE  36ff       LD (HL),0xff        
    0BE0  fb         EI                  
    0BE1  320070     LD (0x7000),A       
    0BE4  f3         DI                  
    0BE5  77         LD (HL),A           
    0BE6  3ef0       LD A,0xf0           
    0BE8  320141     LD (0x4101),A       
    0BEB  c9         RET                 
    0BEC  3600       LD (HL),0           
    0BEE  3a0141     LD A,(0x4101)       
    0BF1  c601       ADD A,1             
    0BF3  320141     LD (0x4101),A       
    0BF6  3015       JR nc,0x0c0d        
    0BF8  3d         DEC A               
    0BF9  320141     LD (0x4101),A       
    0BFC  210440     LD HL,0x4004        
    0BFF  cbfe       SET 7,(HL)          
    0C01  3a6500     LD A,(0x0065)       
    0C04  cb5f       BIT 3,A             
    0C06  2805       JR z,0x0c0d         
    0C08  212b40     LD HL,0x402b        
    0C0B  cbd6       SET 2,(HL)          
    0C0D  210e00     LD HL,14            
    0C10  39         ADD HL,SP           
    0C11  f9         LD SP,HL            
    0C12  c9         RET                 
    0C13  3a0940     LD A,(0x4009)       
    0C16  e601       AND 1               
    0C18  2027       JR nz,0x0c41        
    0C1A  3a0840     LD A,(0x4008)       
    0C1D  e60f       AND 15              
    0C1F  fe05       CP 5                
    0C21  381e       JR c,0x0c41         
    0C23  fe07       CP 7                
    0C25  301a       JR nc,0x0c41        
    0C27  2a0e40     LD HL,(0x400e)      
    0C2A  af         XOR A               
    0C2B  b4         OR H                
    0C2C  b5         OR L                
    0C2D  2812       JR z,0x0c41         
    0C2F  217017     LD HL,0x1770        
    0C32  ed5b1840   LD DE,(0x4018)      
    0C36  19         ADD HL,DE           
    0C37  eb         EX DE,HL            
    0C38  cd640b     CALL 0x0b64         
    0C3B  210150     LD HL,0x5001        
    0C3E  71         LD (HL),C           
    0C3F  70         LD (HL),B           
    0C40  c9         RET                 
    0C41  3e76       LD A,0x76           
    0C43  320350     LD (0x5003),A       
    0C46  c9         RET                 
    0C47  3e0e       LD A,14             
    0C49  d341       OUT (0x0041),A      
    0C4B  db40       IN A,(0x0040)       
    0C4D  322840     LD (0x4028),A       
    0C50  e6c7       AND 0xc7            
    0C52  323040     LD (0x4030),A       
    0C55  3e0f       LD A,15             
    0C57  d341       OUT (0x0041),A      
    0C59  db40       IN A,(0x0040)       
    0C5B  322940     LD (0x4029),A       
    0C5E  e6ff       AND 0xff            

; ... (0x0C60-0x3FFF: sound-sequence data, period tables, and further
;      handlers; the routines above are the engine core) ...