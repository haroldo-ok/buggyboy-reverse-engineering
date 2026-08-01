# Buggy Boy Jr — Main CPU Subroutine Inventory

Recovered 69 directly-called subroutines (7118 reachable instructions). Names are inferred from behaviour; `sub_XXXXX` = unnamed. Addresses are physical (8086 linear).

| # | addr | name | callers | first bytes |
|--:|:--|:--|--:|:--|
| 1 | `FE123` | entity_update | 18 | `cmp bx, 0x500` |
| 2 | `F3060` | draw_strlist | 13 | `mov di, word ptr cs:[si]` |
| 3 | `F3066` | draw_strlist_cont | 12 | `call 0xf302d` |
| 4 | `F02B6` | emit_char | 11 | `push bx` |
| 5 | `F25CC` | util_25CC | 8 | `mov ax, word ptr [0x11f0]` |
| 6 | `F02C5` | emit_char_masked | 7 | `push bx` |
| 7 | `F2CD2` | util_2CD2 | 7 | `mov ax, word ptr [0x1160]` |
| 8 | `F302D` | strlist_setattr | 6 | `test ah, 0x80` |
| 9 | `F4816` | util_4816 | 6 | `mov al, dl` |
| 10 | `F2B84` | sub_F2B84 | 5 | `mov ax, 0x9c40` |
| 11 | `F2BB1` | sub_F2BB1 | 5 | `mov ax, 0x4650` |
| 12 | `F4727` | sub_F4727 | 5 | `mov al, 0x34` |
| 13 | `F3196` | util_3196 | 4 | `push ax` |
| 14 | `F444A` | util_444A | 4 | `mov bl, byte ptr [0x115c]` |
| 15 | `F9B0B` | util_9B0B | 4 | `mov ax, word ptr [bx + 8]` |
| 16 | `F9B24` | util_9B24 | 4 | `mov dx, 0x100` |
| 17 | `F2B2D` | sub_F2B2D | 3 | `mov dx, bx` |
| 18 | `F3186` | util_3186 | 3 | `xor dh, dh` |
| 19 | `F97B8` | sub_F97B8 | 3 | `mov dx, word ptr cs:[si - 0x53c2]` |
| 20 | `F997A` | sub_F997A | 3 | `mov ax, word ptr [bx + 0x1e]` |
| 21 | `F9F0B` | sub_F9F0B | 3 | `mov bp, word ptr cs:[si]` |
| 22 | `F2FE6` | plot_char | 2 | `mov ch, 8` |
| 23 | `F3184` | sub_F3184 | 2 | `mov dl, byte ptr [si]` |
| 24 | `F318B` | sub_F318B | 2 | `mov dx, word ptr [si]` |
| 25 | `F36F6` | sub_F36F6 | 2 | `std ` |
| 26 | `F4036` | sub_F4036 | 2 | `mov di, 0x8000` |
| 27 | `F429A` | sub_F429A | 2 | `mov word ptr [0xf000], ax` |
| 28 | `F42AD` | sub_F42AD | 2 | `mov al, 0xff` |
| 29 | `F9102` | sub_F9102 | 2 | `push ax` |
| 30 | `F9B88` | sub_F9B88 | 2 | `call 0xf9b0b` |
| 31 | `FDFD4` | sub_FDFD4 | 2 | `test word ptr [bx + 0x3c], 0x10` |
| 32 | `FE0E0` | sub_FE0E0 | 2 | `or word ptr [bx + 0x52], 0x2000` |
| 33 | `002B6` | sub_002B6 | 1 | `add byte ptr [bx + si], al` |
| 34 | `00604` | sub_00604 | 1 | `add byte ptr [bx + si], al` |
| 35 | `25E6A` | sub_25E6A | 1 | `mov byte ptr [bp + 0x40], bl` |
| 36 | `2C59A` | sub_2C59A | 1 | `cdq ` |
| 37 | `F271A` | sub_F271A | 1 | `mov si, 4` |
| 38 | `F2B1A` | sub_F2B1A | 1 | `mov cx, 3` |
| 39 | `F3100` | sub_F3100 | 1 | `mov di, word ptr cs:[si]` |
| 40 | `F3106` | sub_F3106 | 1 | `call 0xf302d` |
| 41 | `F318D` | sub_F318D | 1 | `mov si, 0x11b6` |
| 42 | `F3C5E` | sub_F3C5E | 1 | `mov byte ptr [bx + 4], 0xff` |
| 43 | `F3D64` | sub_F3D64 | 1 | `mov bx, word ptr [0x1160]` |
| 44 | `F3FE8` | sub_F3FE8 | 1 | `xor ax, ax` |
| 45 | `F4054` | sub_F4054 | 1 | `cwde ` |
| 46 | `F418E` | sub_F418E | 1 | `mov ch, 8` |
| 47 | `F41D2` | sub_F41D2 | 1 | `test ah, 0x80` |
| 48 | `F4205` | sub_F4205 | 1 | `mov di, word ptr [si]` |
| 49 | `F432E` | sub_F432E | 1 | `mov si, word ptr [0x52a]` |
| 50 | `F43BC` | sub_F43BC | 1 | `mov word ptr [0x11cc], bx` |
| 51 | `F445A` | sub_F445A | 1 | `push cx` |
| 52 | `F455D` | sub_F455D | 1 | `call 0xf444a` |
| 53 | `F469E` | sub_F469E | 1 | `mov al, byte ptr [0xaa8]` |
| 54 | `F48E7` | sub_F48E7 | 1 | `mov di, 0x8880` |
| 55 | `F4AAC` | sub_F4AAC | 1 | `mov dx, word ptr [si]` |
| 56 | `F94BD` | sub_F94BD | 1 | `mov cx, dx` |
| 57 | `F9534` | sub_F9534 | 1 | `test word ptr cs:[0xac3a], 2` |
| 58 | `F9563` | sub_F9563 | 1 | `test word ptr cs:[0xac3a], 2` |
| 59 | `F96E8` | sub_F96E8 | 1 | `mov ax, word ptr [bx]` |
| 60 | `F975B` | sub_F975B | 1 | `mov ax, word ptr [bx + 0x24]` |
| 61 | `F9838` | sub_F9838 | 1 | `cmp si, 0x7d` |
| 62 | `F9892` | sub_F9892 | 1 | `mov ax, word ptr [bx]` |
| 63 | `F98F0` | sub_F98F0 | 1 | `push ax` |
| 64 | `F9907` | sub_F9907 | 1 | `mov ax, word ptr [bx + 0x28]` |
| 65 | `F99F2` | sub_F99F2 | 1 | `and dx, dx` |
| 66 | `F9AF2` | sub_F9AF2 | 1 | `mov ax, word ptr [bx]` |
| 67 | `F9D95` | sub_F9D95 | 1 | `mov dx, word ptr cs:[si + 8]` |
| 68 | `FAB50` | sub_FAB50 | 1 | `test word ptr cs:[0xac3c], 0x20` |
| 69 | `FABE2` | sub_FABE2 | 1 | `mov ax, word ptr cs:[si]` |