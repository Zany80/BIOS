;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jun 28 2018) (Linux)
; This file was generated Thu Jun 28 01:36:03 2018
;--------------------------------------------------------
	.module string
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _strequal
	.globl _strcpy
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
	.map	src/bios/string.c, 3, "void strcpy(char * dest, const char * src){"
;	---------------------------------
; Function strcpy
; ---------------------------------
_strcpy_start::
_strcpy:
	dec	sp
	.map	src/bios/string.c, 5, "for (index = 0; src[index] != 0; index++) {"
	ld	de,#0x0000
00103$:
	ld	iy,#5
	add	iy,sp
	ld	l,(iy + 0)
	ld	h,(iy + 1)
	add	hl,de
	ld	a,(hl)
	ld	iy,#0
	add	iy,sp
	ld	(iy + 0),a
	ld	a,(iy + 0)
	or	a, a
	jp	Z,00105$
	.map	src/bios/string.c, 6, "dest[index] = src[index];"
	ld	iy,#3
	add	iy,sp
	ld	l,(iy + 0)
	ld	h,(iy + 1)
	add	hl,de
	ld	iy,#0
	add	iy,sp
	ld	a,(iy + 0)
	ld	(hl),a
	.map	src/bios/string.c, 5, "for (index = 0; src[index] != 0; index++) {"
	inc	de
	jp	00103$
00105$:
	inc	sp
	ret
	_strcpy_end::
.function	_strcpy, _strcpy_start, _strcpy_end
	.map	src/bios/string.c, 10, "bool strequal(const char *s1, const char *s2) {"
;	---------------------------------
; Function strequal
; ---------------------------------
_strequal_start::
_strequal:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	.map	src/bios/string.c, 12, "for (index = 0; s1[index] != 0 && s2[index] != 0; index++) {"
	ld	bc,#0x0000
	ld	de,#0x0000
00106$:
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	add	hl,de
	ld	a,(hl)
	ld	(ix + -1), a
	or	a, a
	jp	Z,00103$
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	add	hl,de
	ld	a,(hl)
	ld	(ix + -2), a
	or	a, a
	jp	Z,00103$
	.map	src/bios/string.c, 13, "if (s1[index] != s2[index]) {"
	ld	a,(ix + -1)
	sub	a, (ix + -2)
	jp	Z,00107$
	.map	src/bios/string.c, 14, "return false;"
	ld	l,#0x00
	jp	00108$
00107$:
	.map	src/bios/string.c, 12, "for (index = 0; s1[index] != 0 && s2[index] != 0; index++) {"
	inc	de
	ld	c, e
	ld	b, d
	jp	00106$
00103$:
	.map	src/bios/string.c, 17, "return s1[index] == s2[index];"
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	add	hl,bc
	ld	d,(hl)
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	add	hl,bc
	ld	e,(hl)
	ld	a,d
	sub	a, e
	jp	NZ,00129$
	ld	a,#0x01
	jp	00130$
00129$:
	xor	a,a
00130$:
	ld	l,a
00108$:
	ld	sp, ix
	pop	ix
	ret
	_strequal_end::
.function	_strequal, _strequal_start, _strequal_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
