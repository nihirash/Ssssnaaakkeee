    device ZXSPECTRUM128
    SLDOPT COMMENT WPMEM, LOGPOINT, ASSERTION

    org #6000
start:
    di
    ld sp, stack_top
    call Memory.init
    xor a : out (#fe), a
    call Midi.init
    call im2On
    call Attr.init
    ld a, 7 : call Memory.setPage
    call Attr.drawRectangle
    
    call Snake.reborn.fill
    call Snake.drawSnake
    call Snake.makeRabbit
.loop
    ei
    dup 10
    halt
    edup
    call Snake.hideTail
    
    call Snake.moveSnake
    call Snake.checkBounds
    call Snake.drawSnake
    jr .loop

    include "modules/memory.asm"
    include "modules/im2.asm"
    include "modules/attr.asm"
    include "modules/qaop.asm"
    include "snake.asm"

stack_top equ $bdbb

;; There're only two pages on ZX Spectrum 128 that fast on every model
;; It's page 2 and page 0
;; So we'll use page 0 for playing our midi music
    page 0  
    org #c000
    include "modules/ay-midi.asm"
    include "modules/int-player.asm"
    DISPLAY "Max song size: ", #ffff - $
song:
    incbin "mus/desert.nmf"
    db 0, 0
    DISPLAY "PAGE 0 Bytes free: ", #ffff - $
;; End of page 0 contents 

    savesna "snake.sna",start
    