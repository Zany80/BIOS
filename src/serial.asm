.equ serial_port_in, 1
.equ serial_port_out, 1

.global putchar
putchar:
	out (serial_port_out), a
	ret

; hl: string
.global serial_write
serial_write:
	ld a, (hl)
	cp 0
	ret z
	call putchar
	inc hl
	jr serial_write

.global serial_read
serial_read:
	in a, (serial_port_in)
	ret
