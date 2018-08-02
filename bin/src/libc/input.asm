;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jun 28 2018) (Linux)
; This file was generated Thu Jun 28 01:36:03 2018
;--------------------------------------------------------
	.module input
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _getKeys
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
	.map	src/libc/input.c, 1, "char getKeys() __naked {"
;	---------------------------------
; Function getKeys
; ---------------------------------
_getKeys_start::
_getKeys:
	.map	src/libc/input.c, 7, "__endasm;"
	ld a, 2
	call 0x8000
	ld l, a
	ret
	_getKeys_end::
.function	_getKeys, _getKeys_start, _getKeys_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
