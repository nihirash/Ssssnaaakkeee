    module QAOP
UP = 1
DN = 2
RT = 3
LT = 4

read:
    ;; Q
    ld bc, #fbfe : in a, (c)
    rr a  : ld a, UP : jr nc, write
    ;; A
    ld bc, #fdfe : in a, (c)
    rr a  : ld a, DN : jr nc, write
    ;; P
    ld bc, #dffe : in a, (c)
    rr a  : ld b,a : ld a, RT : jr nc, write
    ;; O
    ld a,b
    rr a  : ld a, LT : jr nc, write
    ;; Nothing
    xor a
write
    ld (direction),a
    ret

direction db 0 

    endmodule