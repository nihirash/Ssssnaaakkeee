    module Text
status_bar db "  Nivel 00 Long 00   ", #7f, " Nihirash ", 0

drawUI:
    ld hl, 0, (coords), hl
    
    ld hl, status_bar
    call printZ
    di
    ld (Attr.spSave), sp
    ld sp, #D820
    ld de, #4747
    ld hl, #4444
    .7 push de
    push hl
    .3 push de
    push hl
    .4 push de
    ld sp, (Attr.spSave)
    ei
    ret


updateUI:
    ld hl, 8, (coords), hl
    ld a, (curLevel) : inc a : call dispA 
showLen:
    ld hl, #0010, (coords), hl
    ld a, (Snake.len) : call dispA
    ret

printZ:
    ld a, (hl) : and a : ret z 
    push hl
    call putC
    pop hl 
    inc hl
    jr printZ

printZWhite:
    ld a, (hl) : and a : ret z 
    push hl
    call putCWhite
    pop hl 
    inc hl
    jr printZWhite

;; https://wikiti.brandonw.net/index.php?title=Z80_Routines:Other:DispA
dispA:
	ld	c,-10
	call	.na1
	ld	c,-1
.na1	ld	b,'0'-1
.na2	inc	b
	add	a,c
	jr	c, .na2
	sub	c		;works as add 100/10/1
	push af		;safer than ld c,a
	ld	a,b		;char is in b
	call putC	;plot a char. Replace with bcall(_PutC) or similar.
	pop af		;safer than ld a,c
	ret

putCWhite:
    push af
    ld de, (coords)
    ld h, 0 : ld l, d
    dup 5
    add hl, hl
    edup 
    ld d, #D8
    add hl, de 
    ld a, 0107o
    ld (hl), a
    pop af
putC:
    sub ' '
    ld l, a, h, 0
    .3 add hl, hl
    ld bc, font
    add hl, bc
    ld de, (coords)
    ld a, d
    and 7
    .3 rrca
    or e
    ld e, a, a, d
    and 24
    or #c0
    ld d,a, b, 8
.print
    ld a, (hl)
    ld c, a
    rr a
    or c
    ld (de), a
    inc hl
    inc d
    djnz .print
    ld hl, coords : inc (hl)
    ret

coords dw 0
font = #3D00
    endmodule