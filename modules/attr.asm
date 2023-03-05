    module Attr
font               equ #3d00

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
    
    .16 push hl
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
    xor a
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


; DE - coords
; HL - string
printAttr:
    ld a, (hl)
    or a : ret z
    push hl : push de

    sub 32
    push de
    ld l, a
    ld h,0
    dup 3
    add hl, hl
    edup
    ld de, font
    add hl, de
    ld bc, hl
    pop de

    ld h, 0 : ld l, d
    dup 5
    add hl, hl
    edup
    ld d, #d8
    add hl, de
    ex hl, de

   jr nz, .skp
   ld a, 1
.skp
    ;ld h, a : rla : rla : rla : or h : ld (.charColor), a

    ld hl, bc
    ld b, 8
.loop
    ld a, (hl)

    dup 8
    rla
    push af
    ld a, 0
    jr nc, 1F

    ld a, (.charColor)
1   ld (de), a
    pop af
    inc de
    edup

    push hl
    ld hl, 32 - 8
    add hl, de
    ex hl, de
    pop hl
    inc hl
    djnz .loop

    pop de
    ld hl, 7
    add hl, de
    ex hl, de
    pop hl
    inc hl
    jp printAttr
.charColor  db 150o

    endmodule