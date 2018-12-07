; handleEvent is a C function with this sig:
; void handleEvent(int type, int data)

.global keyboard_handler
keyboard_handler:
	di
	exx
	ld h, 0
	call serial_read
	ld l, a
	push hl
	ld l, 0
	push hl
	call _handleEvent
	pop hl \ pop hl
	exx
	ei
	reti
	
