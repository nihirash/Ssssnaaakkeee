    module Snake
MAX_LEN = 100
WALL = #ff
FOOD = 0240o
HEAD = 0140o
TAIL = 030o

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
    ld a, HEAD : ld (hl), a
    inc ix : inc ix
    dec b
    ld a, TAIL 
.loop
    ld e, (ix), d, (ix + 1)
    call Attr.xyToAttr
    ld (hl), a
    inc ix : inc ix
    djnz .loop
    ret

;; Move snake's body
moveSnake:
    ld a, (direction), b, a
    ld a, (QAOP.direction) : and a : jr z, .skipControls
    ld c, a

    ld a, UP : cp b : jr nz, .dnCheck
    cp c : jr z, .skipControls
    ld a, DOWN : cp c : jr z, .skipControls
    jr  .write 
.dnCheck
    ld a, DOWN : cp b : jr nz, .ltCheck
    cp c : jr z, .skipControls
    ld a, UP : cp c : jr z, .skipControls
    jr  .write
.ltCheck
    ld a, LEFT : cp b : jr nz, .rtCheck
    cp c : jr z, .skipControls
    ld a, RIGHT : cp c : jr z, .skipControls
    jr  .write
.rtCheck
    cp c : jr z, .skipControls
    ld a, LEFT : cp c : jr z, .skipControls
.write
    ld a,c
    ld (direction), a
.skipControls

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
    jr .exit 
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
    cp FOOD : jr z, .food
    and a : jr nz, reborn
    ret
.food
    ld a, HEAD : ld (hl), a
    ld hl, len : inc (hl)
makeRabbit:
    call Text.showLen
    call rnd : ld a, (seed) : and 31 :  ld e, a
    call rnd : ld a, (seed) : and 23 : ld d,a 
    call Attr.xyToAttr
    ld a, (hl) : and a : jr nz, makeRabbit
    ld a, FOOD : ld (hl), a
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
    call Text.updateUI
    ret

LEFT  = QAOP.LT
RIGHT = QAOP.RT
UP    = QAOP.UP
DOWN  = QAOP.DN

direction db LEFT
len db 4
body
    ds MAX_LEN * 2
last
    dw 0

restart 
    db LEFT
    db 4
    dw  #0a10
    dw  #0a11
    dw  #0a12
    dw  #0a13
restart_len = $ - restart

    endmodule