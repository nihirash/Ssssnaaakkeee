    module BgMidi

; Should be called on int or with disabled interrupts 
tick:
    DISPLAY "Tick addr: ", $
    ld hl, wait_frames : ld a, (hl) : and a : jr z, .play
    dec a : jr z, .play
    ld (hl), a
    ret
.play
    ld hl, (buffer)
    ld a, (hl) : inc hl : ld b, a
    ld a, (hl) : ld (wait_frames), a : inc hl  
    or b : jr z, reset ; if song ended
    call Midi.sendBuffer
    ld (buffer), hl
    ret
reset:
    ld hl, song, (buffer), hl
    ld a, #ff : call Midi.sendByte
    ld a, #ff : call Midi.sendByte
    ret

wait_frames db 0
buffer dw song

    endmodule
