void serialWrite(const char *string) __naked {
	__asm
	pop af
	pop hl \ push hl
	push af
	call serial_write
	ret
	__endasm;
}

void putchar(int data) __naked {
	__asm
	pop bc
	pop hl \ push hl
	push bc
	ld a, l
	call putchar
	ret
	__endasm;
}
