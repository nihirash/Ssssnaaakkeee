    module Attr
init:
    di
    ld a,7 : call Memory.setTempPage
    call fillA
    jp Memory.restorePage

drawRectangle:
    di
    ld (spSave), sp
    ld sp, #DB00
    ld hl, #0000
    ld de, #3232
    ld ix, #3200
    ld iy, #0032
    .16 push de
    ld b,21
1
    push ix
    .14 push hl
    push iy
    djnz 1b
    .16 push de
    
    ld de, #4747
    ld hl, #4444
    .7 push de
    push hl
    .3 push de
    push hl
    .4 push de
    ld sp, (spSave)
    ei
    ret

; DE - COORDS
; HL - Addr
xyToAttr:
    ld h, 0 : ld l, d
    dup 5
    add hl, hl
    edup 
    ld d, #D8
    add hl, de 
    ret

fillA:
    di
    ld (spSave),sp, sp,#D800
    ld hl,#ffff, de,#9999, ix, #8181
    dup 3
    ld b,8
1    .16 push hl
    djnz 1b
    ld b, 16
1   .16 push ix
    djnz 1b
    ld b, 16
1   .16 push de
    djnz 1b
    ld b, 16
1   .16 push ix
    djnz 1b
    ld b,8
1    .16 push hl
    djnz 1b
    edup
    xor a
    jr cla.skip

; A - Color
cla:
    ld a, 0103o
.color
    di
    ld (spSave), sp
.skip
    ld d, a, e, a
    ld sp, #DB00
    ld b, 32
.loop
    dup 12
    push de
    edup
    djnz .loop
    ld sp, (spSave)
    ei
    ret

spSave dw 0

    endmodule