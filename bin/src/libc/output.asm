;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Aug  2 2018) (Linux)
; This file was generated Thu Aug  2 12:38:03 2018
;--------------------------------------------------------
	.module output
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _drawSprite
	.globl _uploadSprite
	.globl _text
	.globl __text
	.globl _cls
	.globl _halt
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _RSEG (ABS)
	.org 0x0000
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _CODE
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _CODE
	.area _CODE
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.map	src/libc/output.c, 1, "void halt() {"
;	---------------------------------
; Function halt
; ---------------------------------
_halt_start::
_halt:
	.map	src/libc/output.c, 2, "__asm__("halt");"
	halt
	ret
	_halt_end::
.function	_halt, _halt_start, _halt_end
	.map	src/libc/output.c, 5, "void cls(char color) {"
;	---------------------------------
; Function cls
; ---------------------------------
_cls_start::
_cls:
	.map	src/libc/output.c, 12, "__endasm;"
	pop af \ pop bc
	push bc \ push af
	ld b, c
	ld a, 0
	call 0x8000
	.map	src/libc/output.c, 13, "color;"
	ret
	_cls_end::
.function	_cls, _cls_start, _cls_end
	.map	src/libc/output.c, 16, "void _text(const char *string, int position, char color) {"
;	---------------------------------
; Function _text
; ---------------------------------
__text_start::
__text:
	.map	src/libc/output.c, 25, "__endasm;"
	pop af
	pop hl \ pop bc \ pop de
	push de \ push bc \ push hl
	push af
	ld a, 1
	call 0x8000
	ret
	__text_end::
.function	__text, __text_start, __text_end
	.map	src/libc/output.c, 28, "void text(const char *string, char x, char y, char color) {"
;	---------------------------------
; Function text
; ---------------------------------
_text_start::
_text:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/libc/output.c, 29, "_text(string, (x << 8) | y, color);"
	ld	l,(ix + 6)
	ld	a,(ix + 6)
	rla
	sbc	a, a
	ld	h,a
	ld	h,#0x00
	ld	e,(ix + 7)
	ld	a,(ix + 7)
	rla
	sbc	a, a
	ld	d,a
	ld	a,e
	or	a, h
	ld	e,a
	ld	a,d
	or	a, l
	ld	d,a
	ld	a,(ix + 8)
	push	af
	inc	sp
	push	de
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	push	hl
	call	__text
	pop	af
	pop	af
	inc	sp
	pop	ix
	ret
	_text_end::
.function	_text, _text_start, _text_end
	.map	src/libc/output.c, 32, "char uploadSprite(unsigned char *address, int index) __naked {"
;	---------------------------------
; Function uploadSprite
; ---------------------------------
_uploadSprite_start::
_uploadSprite:
	.map	src/libc/output.c, 43, "__endasm;"
	pop af
	pop hl \ pop bc
	push bc \ push hl
	push af
	ld a, 5
	call 0x8000
	ld l, a
	ret
	_uploadSprite_end::
.function	_uploadSprite, _uploadSprite_start, _uploadSprite_end
	.map	src/libc/output.c, 46, "void drawSprite(int index, char x, char y) {"
;	---------------------------------
; Function drawSprite
; ---------------------------------
_drawSprite_start::
_drawSprite:
	.map	src/libc/output.c, 55, "__endasm;"
	pop af
	pop hl \ pop bc
	push bc \ push hl
	push af
	ld a, 6
	call 0x8000
	ret
	_drawSprite_end::
.function	_drawSprite, _drawSprite_start, _drawSprite_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
