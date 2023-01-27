    device ZXSPECTRUM128
    org #6000
start:
    call Memory.init
    xor a : out (#fe), a
    call Midi.init
    call im2On
    ei
    halt
    jr $
    include "modules/memory.asm"
    include "modules/im2.asm"



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
    