    module Memory
BANKM = #5b5c
MEM_PORT = #7ffd

init:
    di
    res 4, (iy + 1)
    xor a : call setPage.noScreen 
    ret

; a - page
setPage:
    or #18 
.noScreen
    ld (BANKM), a 
    ld bc, MEM_PORT : out (c), a
    ret

restorePage:
    ld a, (BANKM)
setTempPage:
    ld bc, MEM_PORT : out (c),a
    ret

    endmodule