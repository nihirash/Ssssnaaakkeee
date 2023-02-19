    module Effects


;;; Effect 1 :-)
eff1:
    call Attr.fillA
    ld b, 24
1
    push bc
    ld a, 24 : sub b : call drawCornerStep
    halt
    pop bc
    djnz 1b
    ld b, 31
1
    push bc
    ld de, #daff
    ld b, 24
2
    push bc
    ld hl, de
    dec hl
    ld bc, 31
    lddr
    dec de
    pop bc
    djnz 2b
    halt
    pop bc
    djnz 1b
    ret

; A - step
drawCornerStep:
    ld hl, #d800
    ld e, a, d, 0
    ld c, 0
    add hl, de
1
    ld b, a
    ld a, 102o
    ld (hl), a
    xor a : or b : ret z
    dec a
    ld de, 31 : add hl, de
    inc c
    jr 1b

;;; Effect 2

eff2:
        ld hl, buff, de, buff + 1
        ld bc, 768
        ld (hl), l
        ldir

        ld b, 50
flame          push bc
               LD      ix,buff+32
               LD      de,buff
               LD      bc,768
begin          LD      a,(DE)
               CP      (ix)
               JR      nz,loop1
               XOR     a
loop1          ADD     a,(ix)
               SRL     a
               LD      (de),A
               INC     ix
               INC     de
               DEC     bc
               LD      a,B
               OR      c
               JR      nz,begin
               ei
               HALT
               LD      hl,buff
               LD      de,#D800
               LD      bc,768
               LDIR

               LD      de,buff
               LD      a,R
               AND     %00011111
               LD      h,A
               LD      a,R
               LD      l,A
               LD      de,buff+768
               LD      bc,32
rnd            LD      a,R
               OR      (hl)
rang           AND     31
               LD      (de),A
               INC     hl
               INC     de
               DJNZ    rnd
               pop bc
               djnz flame
    ret

    endmodule