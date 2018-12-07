.equ mmu_port, 0
.equ idt, 0xFF00

start:
	jp main

.block 0x100 - $
main:
	ld hl, mapping
	call serial_write
	; Map in pages 1, 2, and 3
	ld a, 1
	ld b, 3
.loop:
	out (mmu_port), a
	out (mmu_port), a
	inc a
	djnz .loop
	ld hl, shadow
	call serial_write
	ld hl, 0x0000
	ld de, 0x4000
	ld bc, 0x4000
	ldir
	ld a, 0
	out (mmu_port), a
	ld a, 1
	out (mmu_port), a
	out (mmu_port), a
	ld a, 4
	out (mmu_port), a
	ld hl, done
	call serial_write
	ld hl, initializing_idt
	call serial_write
	ld hl, idt
	ld b, 128
.idt_loop:
	ld (hl), unhandled_interrupt & 0xFF
	inc hl
	ld (hl), (unhandled_interrupt & 0xFF00) >> 8
	inc hl
	djnz .idt_loop
	ld a, (idt & 0xFF00) >> 8
	ld i, a
	ld hl, loading_kbd
	call serial_write
	ld hl, keyboard_handler
	ld (idt), hl
	ld hl, enabling
	call serial_write
	im 2
	ei
	jp _main

unhandled_interrupt:
	di
	exx
	ld hl, unknown
	call serial_write
	exx
	ei
	reti

mapping: .asciiz "Mapping in pages 1, 2, and 3...\n"
initializing_idt: .asciiz "Initializing interrupt descriptor table...\n"
loading_kbd: .asciiz "Loading in keyboard handler...\n"
unknown: .asciiz "Unknown interrupt received\n"
enabling: .asciiz "Enabling interrupts...\n"
shadow: .asciiz "Shadowing BIOS..."
done: .asciiz "done!\n"
