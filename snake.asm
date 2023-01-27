    module Snake
MAX_LEN = 10

;; Hides just last tile of snake
hideTail:
    ld a, (len), b, a
    ld ix, body
    dec b
1
    inc ix: inc ix
    djnz 1b
    ld e, (ix), d, (ix + 1)
    call Attr.xyToAttr
    xor a : ld (hl), a
    ret

;; Draws snake :-)
drawSnake:
    ld a, (len), b, a
    ld ix, body
    
    ld e, (ix), d, (ix + 1)
    call Attr.xyToAttr
    ld a, 0124o : ld (hl), a
    inc ix : inc ix
    dec b
    ld a, 034o 
.loop
    ld e, (ix), d, (ix + 1)
    call Attr.xyToAttr
    ld (hl), a
    inc ix : inc ix
    djnz .loop
    ret

;; Move snake's body
moveSnake:
    ld hl, (body) : push hl
    ld hl, last - 2
    ld de, last 
    ld b, MAX_LEN 
1
    ld a, (hl) : ld (de), a : dec hl : dec de
    ld a, (hl) : ld (de), a : dec hl : dec de
    djnz 1b
    
    ld a, (direction)
    pop hl
    cp LEFT  : jr z, .left
    cp RIGHT : jr z, .right
    cp UP    : jr z, .up
    inc h 
.up
    dec h
    jr .exit
.right
    inc l 
    jr .exit
.left
    dec l
.exit
    ld (body), hl
    ret

checkBounds:
    ld de, (body)
    call Attr.xyToAttr
    ld a, (hl)
    cp #ff : jr z, reborn
    ret

reborn:
;;; Hide all snake
    ld a, (len), b, a
    ld ix, body + 2

    dec b
    xor a
.loop
    ld e, (ix), d, (ix + 1)
    call Attr.xyToAttr
    ld (hl), a
    inc ix : inc ix
    djnz .loop
    
.fill
    ld hl, restart
    ld de, direction
    ld bc, restart_len
    ldir
    ret

LEFT  = 0
RIGHT = 1
UP    = 2
DOWN  = 3

direction db LEFT
len db 4
body
    ds MAX_LEN * 2
last
    dw 0

restart 
    db LEFT
    db 4
    dw  #1010
    dw  #1011
    dw  #1012
    dw  #1013
restart_len = $ - restart

    endmodule