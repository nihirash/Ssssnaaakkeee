;; Int handler
intHandler:
    push af, bc, de, ix
    xor a : call Memory.setTempPage
    call BgMidi.tick
	call QAOP.read
	call rnd
    call Memory.restorePage
    pop ix, de, bc, af
    ei
    ret

rnd:
	ld a, r
	ld l, a
	ld a, (seed)
	rlc a
	xor l
	ld (seed), a
	ret

seed db 17

;; Install int-handler
im2On
    ld hl, intHandler
	ld    a, 195       ; JP
	ld    (#bdbd), a
	ld    (#bdbe), hl  ;HL - in handler
	ld    hl, #be00    
	ld    de, #be01
	ld    bc, 256      
	ld    (hl), #bd    
	ld    a, h         
	ldir               
	di                 
	ld    i, a         
	im    2            
	ret