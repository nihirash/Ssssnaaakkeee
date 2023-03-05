    module KJoy
UP = QAOP.UP
DN = QAOP.DN
RT = QAOP.RT
LT = QAOP.LT

read:
    in a, (#1F)
.right
    bit 0, a : jr z, .left
    ld a, RT : jr .write
.left
    bit 1, a : jr z, .down
    ld a, LT : jr .write
.down
    bit 2, a : jr z, .up
    ld a, DN : jr .write
.up
    bit 3, a : jr z, .nothing
    ld a, UP : jr .write
.nothing
    xor a
.write:
    ld (QAOP.direction), a
    ret
    
    endmodule