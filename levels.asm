restoreLevel:
    ld a, (curLevel)
    ld hl, 0
    ld bc, levelSize
    cp 5 : jr c, .ok
    ld a, 5 
.ok
    and a : jr z,  1f 
.nxtLvl
    add hl, bc
    sub 1
    jr nz, .nxtLvl
1
    ld de, level1
    add hl, de

    ld de, #d820
    ldir
    ret

curLevel db 0

level1:
.bitmapStart
; line based output of attribute data:
    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32
levelSize = $ - .bitmapStart

level2:
; line based output of attribute data:

    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32

level3:
; line based output of attribute data:
    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32

level4:
; line based output of attribute data:

    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32

level5:
; line based output of attribute data:

    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #00, #32, #00, #00, #00, #00, #32, #00, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32
    db #32, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #32
    db #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #00, #32, #32, #32, #32, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #32, #32, #32, #32, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #32, #32, #32, #00, #32, #00, #00, #00, #00, #32, #00, #32, #32, #32, #32, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #32, #32, #32, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #32, #32, #32, #00, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32
level6:
    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32
    db #32, #32, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32
    db #32, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #32
    db #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #32, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #32, #00, #00, #00, #00, #32, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #32, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #32
    db #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32
    db #32, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #32
    db #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #32, #00, #32, #32, #32, #32, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #32, #00, #32, #32, #32, #32, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #32, #32, #32, #00, #32, #00, #00, #00, #00, #32, #00, #32, #32, #32, #32, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #32, #32, #32, #00, #32, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #32, #00, #32, #32, #32, #00, #32, #00, #00, #00, #00, #32, #32, #32, #32, #32, #32, #32, #32, #00, #00, #00, #00, #00, #32
    db #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32
    db #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32
    db #32, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #32
    db #32, #32, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #32, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #00, #32, #32, #32, #32
    db #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32, #32