;; Int handler
intHandler:
    push af, bc, de, ix
    xor a : call Memory.setTempPage
    call BgMidi.tick
    call Memory.restorePage
    pop ix, de, bc, af
    ei
    ret

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