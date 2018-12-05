.global keyboard_handler
keyboard_handler:
	di
	exx
	ld hl, value_read
	call serial_write
	call serial_read
	call putchar
	ld a, 0x0A
	call putchar
	exx
	ei
	reti

.global getchar
getchar:
	
	ret

value_read: .asciiz "Keyboard sent: "
