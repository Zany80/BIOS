void halt() __naked {
	__asm
	halt
	ret
	__endasm;
}
