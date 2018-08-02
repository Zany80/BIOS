;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jun 28 2018) (Linux)
; This file was generated Thu Jun 28 01:36:03 2018
;--------------------------------------------------------
	.module system
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _jump
	.globl _jumpWithoutStack
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
	.map	src/os/system.c, 3, "void jump(function f) __naked {"
;	---------------------------------
; Function jump
; ---------------------------------
_jump_start::
_jump:
	.map	src/os/system.c, 12, "__endasm;"
	pop hl
	pop hl
	jp (hl)
	_jump_end::
.function	_jump, _jump_start, _jump_end
	.map	src/os/system.c, 15, "void jumpWithoutStack(function f) __naked {"
;	---------------------------------
; Function jumpWithoutStack
; ---------------------------------
_jumpWithoutStack_start::
_jumpWithoutStack:
	.map	src/os/system.c, 26, "__endasm;"
	pop hl
	pop hl
	ld sp, 0
	jp (hl)
	_jumpWithoutStack_end::
.function	_jumpWithoutStack, _jumpWithoutStack_start, _jumpWithoutStack_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
