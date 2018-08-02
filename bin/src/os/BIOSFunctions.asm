;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jun 28 2018) (Linux)
; This file was generated Thu Jun 28 01:36:03 2018
;--------------------------------------------------------
	.module BIOSFunctions
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _getKeys
	.globl _text
	.globl __text
	.globl _cls
	.globl _getNode
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
	.map	src/os/BIOSFunctions.c, 3, "void cls(char color) {"
;	---------------------------------
; Function cls
; ---------------------------------
_cls_start::
_cls:
	.map	src/os/BIOSFunctions.c, 10, "__endasm;"
	pop af \ pop bc
	push bc \ push af
	ld b, c
	ld a, 0
	call 0x8000
	.map	src/os/BIOSFunctions.c, 11, "color;"
	ret
	_cls_end::
.function	_cls, _cls_start, _cls_end
	.map	src/os/BIOSFunctions.c, 14, "void _text(const char *string, int position, char color) {"
;	---------------------------------
; Function _text
; ---------------------------------
__text_start::
__text:
	.map	src/os/BIOSFunctions.c, 23, "__endasm;"
	pop af
	pop hl \ pop bc \ pop de
	push de \ push bc \ push hl
	push af
	ld a, 1
	call 0x8000
	ret
	__text_end::
.function	__text, __text_start, __text_end
	.map	src/os/BIOSFunctions.c, 26, "void text(const char *string, char x, char y, char color) {"
;	---------------------------------
; Function text
; ---------------------------------
_text_start::
_text:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/os/BIOSFunctions.c, 27, "_text(string, (x << 8) | y, color);"
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
	.map	src/os/BIOSFunctions.c, 30, "node_t *getNode(node_t *parent, char *name) __naked {"
;	---------------------------------
; Function getNode
; ---------------------------------
_getNode_start::
_getNode:
	.map	src/os/BIOSFunctions.c, 38, "__endasm;"
	pop af \ pop bc \ pop hl
	push hl \ push bc \ push af
	ld a, 4
	call 0x8000
	ret
	_getNode_end::
.function	_getNode, _getNode_start, _getNode_end
	.map	src/os/BIOSFunctions.c, 41, "unsigned char getKeys() __naked {"
;	---------------------------------
; Function getKeys
; ---------------------------------
_getKeys_start::
_getKeys:
	.map	src/os/BIOSFunctions.c, 47, "__endasm;"
	ld a, 2
	call 0x8000
	ld l, a
	ret
	_getKeys_end::
.function	_getKeys, _getKeys_start, _getKeys_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
