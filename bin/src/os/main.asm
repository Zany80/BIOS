;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jun 28 2018) (Linux)
; This file was generated Thu Jun 28 01:36:03 2018
;--------------------------------------------------------
	.module main
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _main_nodisk
	.globl _main_disk
	.globl _execute_application
	.globl _null_function
	.globl _show_file
	.globl _render_file
	.globl _post_execute
	.globl _getDiskPresent
	.globl _noDisk
	.globl _disk
	.globl _mapInFileSystem
	.globl _strnequal
	.globl _invalidImage
	.globl _startupScreen
	.globl _getRenderFunction
	.globl _setRenderFunction
	.globl _getNode
	.globl _getKeys
	.globl _jumpWithoutStack
	.globl _text
	.globl _cls
	.globl _released
	.globl _version_str
	.globl _name
	.globl _main_zad
	.globl _default_name
	.globl _shutdown
	.globl _reset
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _RSEG (ABS)
	.org 0x0000
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_main_zad::
	.ds 2
_name::
	.ds 2
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_version_str::
	.ds 5
_released::
	.ds 1
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
	.map	src/os/main.c, 9, "void setRenderFunction(function new_render) {"
;	---------------------------------
; Function setRenderFunction
; ---------------------------------
_setRenderFunction_start::
_setRenderFunction:
	.map	src/os/main.c, 13, "__endasm;"
	pop bc \ pop hl \ push hl \ push bc
	ld (0x100), hl
	.map	src/os/main.c, 14, "new_render;"
	ret
	_setRenderFunction_end::
.function	_setRenderFunction, _setRenderFunction_start, _setRenderFunction_end
	.map	src/os/main.c, 17, "function getRenderFunction() {"
;	---------------------------------
; Function getRenderFunction
; ---------------------------------
_getRenderFunction_start::
_getRenderFunction:
	.map	src/os/main.c, 18, "__asm__("ld hl, (0x100)");"
	ld hl, (0x100)
	ret
	_getRenderFunction_end::
.function	_getRenderFunction, _getRenderFunction_start, _getRenderFunction_end
	.map	src/os/main.c, 21, "void startupScreen() {"
;	---------------------------------
; Function startupScreen
; ---------------------------------
_startupScreen_start::
_startupScreen:
	.map	src/os/main.c, 22, "cls(4);"
	ld	a,#0x04
	push	af
	inc	sp
	call	_cls
	inc	sp
	.map	src/os/main.c, 23, "text("ZanyOS v", 0, 0, 1);"
	ld	de,#___str_0
	ld	hl,#0x0100
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	.map	src/os/main.c, 24, "text(version_str, 8 * GLYPH_WIDTH, 0, 1);"
	ld	de,#_version_str
	ld	hl,#0x0100
	push	hl
	ld	a,#0x30
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	.map	src/os/main.c, 25, "text("Booting...", 0, GLYPH_HEIGHT, 1);"
	ld	de,#___str_1
	ld	hl,#0x010C
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	ret
	_startupScreen_end::
.function	_startupScreen, _startupScreen_start, _startupScreen_end
___str_0:
	.ascii "ZanyOS v"
	.db 0x00
___str_1:
	.ascii "Booting..."
	.db 0x00
	.map	src/os/main.c, 28, "void invalidImage() {"
;	---------------------------------
; Function invalidImage
; ---------------------------------
_invalidImage_start::
_invalidImage:
	.map	src/os/main.c, 29, "cls(4);"
	ld	a,#0x04
	push	af
	inc	sp
	call	_cls
	inc	sp
	.map	src/os/main.c, 30, "text("Disk not recognized!", 0, 0, 1);"
	ld	de,#___str_2
	ld	hl,#0x0100
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	ret
	_invalidImage_end::
.function	_invalidImage, _invalidImage_start, _invalidImage_end
___str_2:
	.ascii "Disk not recognized!"
	.db 0x00
	.map	src/os/main.c, 33, "bool strnequal(const char *s1, const char *s2, int length) {"
;	---------------------------------
; Function strnequal
; ---------------------------------
_strnequal_start::
_strnequal:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/os/main.c, 35, "for (index = 0; index < length; index++) {"
	ld	de,#0x0000
00105$:
	ld	a,e
	sub	a, (ix + 8)
	ld	a,d
	sbc	a, (ix + 9)
	jp	PO, 00121$
	xor	a, #0x80
00121$:
	jp	P,00103$
	.map	src/os/main.c, 36, "if (s1[index] != s2[index]) {"
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	add	hl,de
	ld	b,(hl)
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	add	hl,de
	ld	c,(hl)
	ld	a,b
	sub	a, c
	jp	Z,00106$
	.map	src/os/main.c, 37, "return false;"
	ld	l,#0x00
	jp	00107$
00106$:
	.map	src/os/main.c, 35, "for (index = 0; index < length; index++) {"
	inc	de
	jp	00105$
00103$:
	.map	src/os/main.c, 40, "return true;"
	ld	l,#0x01
00107$:
	pop	ix
	ret
	_strnequal_end::
.function	_strnequal, _strnequal_start, _strnequal_end
	.map	src/os/main.c, 43, "void mapInFileSystem() {"
;	---------------------------------
; Function mapInFileSystem
; ---------------------------------
_mapInFileSystem_start::
_mapInFileSystem:
	.map	src/os/main.c, 49, "__endasm;"
	ld a, 0
	out (1), a
	inc a
	out (1), a
	.map	src/os/main.c, 50, "if (!strnequal((char*)0x4000, "ZANY", 4)) {"
	ld	hl,#___str_3+0
	ld	bc,#0x0004
	push	bc
	push	hl
	ld	hl,#0x4000
	push	hl
	call	_strnequal
	pop	af
	pop	af
	pop	af
	bit	0,l
	ret	NZ
	.map	src/os/main.c, 51, "setRenderFunction(invalidImage);"
	ld	hl,#_invalidImage
	push	hl
	call	_setRenderFunction
	pop	af
	.map	src/os/main.c, 52, "while (true) {"
00102$:
	.map	include/system.h, 9, "__asm__("halt");"
	halt
	.map	src/os/main.c, 53, "halt();"
	jp	00102$
	_mapInFileSystem_end::
.function	_mapInFileSystem, _mapInFileSystem_start, _mapInFileSystem_end
___str_3:
	.ascii "ZANY"
	.db 0x00
	.map	src/os/main.c, 62, "void disk() {"
;	---------------------------------
; Function disk
; ---------------------------------
_disk_start::
_disk:
	.map	src/os/main.c, 63, "cls(4);"
	ld	a,#0x04
	push	af
	inc	sp
	call	_cls
	inc	sp
	.map src/os/main.c, 64, "text("Disk inserted: ", 0, 0, 1);"
	ld	de,#___str_4
	ld	hl,#0x0100
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	.map	src/os/main.c, 65, "text(name, 14 * GLYPH_WIDTH, 0, 1);"
	ld	hl,#0x0100
	push	hl
	ld	a,#0x54
	push	af
	inc	sp
	ld	hl,(_name)
	push	hl
	call	_text
	pop	af
	pop	af
	inc	sp
	.map	src/os/main.c, 66, "if (main_zad) {"
	ld	iy,#_main_zad
	ld	a,(iy + 1)
	or	a,(iy + 0)
	jp	Z,00107$
	.map	src/os/main.c, 67, "if (main_zad->is_file) {"
	ld	de,(_main_zad)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,(hl)
	or	a, a
	ret	Z
	.map	src/os/main.c, 68, "if (main_zad->file->executable) {"
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	de, #0x0004
	add	hl, de
	ld	a,(hl)
	bit	0,a
	jp	Z,00102$
	.map	src/os/main.c, 69, "text("Do you wish to launch the application?", 0, GLYPH_HEIGHT, 1);"
	ld	de,#___str_5
	ld	hl,#0x010C
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	.map	src/os/main.c, 70, "text("\x01 to launch, \x02 to power off.", 0, GLYPH_HEIGHT * 2, 1);"
	ld	de,#___str_6
	ld	hl,#0x0118
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	ret
00102$:
	.map	src/os/main.c, 73, "text("Do you wish to view the data?", 0, GLYPH_HEIGHT, 1);"
	ld	de,#___str_7
	ld	hl,#0x010C
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	.map	src/os/main.c, 74, "text("\x01 to view, \x02 to power off.", 0, GLYPH_HEIGHT * 2, 1);"
	ld	de,#___str_8
	ld	hl,#0x0118
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	ret
00107$:
	.map	src/os/main.c, 79, "text("No main.zad file found!", 0, GLYPH_HEIGHT, 1);"
	ld	de,#___str_9
	ld	hl,#0x010C
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	ret
	_disk_end::
.function	_disk, _disk_start, _disk_end
_default_name:
	.dw __str_10
___str_4:
	.ascii "Disk inserted: "
	.db 0x00
___str_5:
	.ascii "Do you wish to launch the application?"
	.db 0x00
___str_6:
	.db 0x01
	.ascii " to launch, "
	.db 0x02
	.ascii " to power off."
	.db 0x00
___str_7:
	.ascii "Do you wish to view the data?"
	.db 0x00
___str_8:
	.db 0x01
	.ascii " to view, "
	.db 0x02
	.ascii " to power off."
	.db 0x00
___str_9:
	.ascii "No main.zad file found!"
	.db 0x00
__str_10:
	.ascii "Disk name not specified"
	.db 0x00
	.map	src/os/main.c, 83, "void noDisk() {"
;	---------------------------------
; Function noDisk
; ---------------------------------
_noDisk_start::
_noDisk:
	.map	src/os/main.c, 84, "cls(4);"
	ld	a,#0x04
	push	af
	inc	sp
	call	_cls
	inc	sp
	.map	src/os/main.c, 85, "text("No disk inserted!", 0, 0, 1);"
	ld	de,#___str_11
	ld	hl,#0x0100
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	.map	src/os/main.c, 86, "text("Insert a disk, or press \x01 to shut down.", 0, GLYPH_HEIGHT, 1);"
	ld	de,#___str_12
	ld	hl,#0x010C
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	ret
	_noDisk_end::
.function	_noDisk, _noDisk_start, _noDisk_end
___str_11:
	.ascii "No disk inserted!"
	.db 0x00
___str_12:
	.ascii "Insert a disk, or press "
	.db 0x01
	.ascii " to shut down."
	.db 0x00
	.map	src/os/main.c, 89, "char getDiskPresent() __naked {"
;	---------------------------------
; Function getDiskPresent
; ---------------------------------
_getDiskPresent_start::
_getDiskPresent:
	.map	src/os/main.c, 94, "__endasm;"
	in a, (1)
	ld l, a
	ret
	_getDiskPresent_end::
.function	_getDiskPresent, _getDiskPresent_start, _getDiskPresent_end
	.map	src/os/main.c, 97, "void post_execute() {"
;	---------------------------------
; Function post_execute
; ---------------------------------
_post_execute_start::
_post_execute:
	.map	src/os/main.c, 98, "cls(4);"
	ld	a,#0x04
	push	af
	inc	sp
	call	_cls
	inc	sp
	.map	src/os/main.c, 99, "text("Application finished! Press any button to power off.", 0, 0, 1);"
	ld	de,#___str_13
	ld	hl,#0x0100
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	ret
	_post_execute_end::
.function	_post_execute, _post_execute_start, _post_execute_end
___str_13:
	.ascii "Application finished! Press any button to power off."
	.db 0x00
	.map	src/os/main.c, 104, "void render_file() {"
;	---------------------------------
; Function render_file
; ---------------------------------
_render_file_start::
_render_file:
	.map	src/os/main.c, 105, "cls(4);"
	ld	a,#0x04
	push	af
	inc	sp
	call	_cls
	inc	sp
	.map	src/os/main.c, 106, "text("Press any button to power off.", 0, 0, 1);"
	ld	de,#___str_14
	ld	hl,#0x0100
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	.map	src/os/main.c, 107, "text(main_zad->file->data, 0, GLYPH_HEIGHT * 2, 1);"
	ld	hl,(_main_zad)
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	hl,#0x0118
	push	hl
	xor	a, a
	push	af
	inc	sp
	push	de
	call	_text
	pop	af
	pop	af
	inc	sp
	ret
	_render_file_end::
.function	_render_file, _render_file_start, _render_file_end
___str_14:
	.ascii "Press any button to power off."
	.db 0x00
	.map	src/os/main.c, 110, "void show_file() {"
;	---------------------------------
; Function show_file
; ---------------------------------
_show_file_start::
_show_file:
	.map	src/os/main.c, 111, "setRenderFunction(render_file);"
	ld	hl,#_render_file
	push	hl
	call	_setRenderFunction
	pop	af
	.map	src/os/main.c, 112, "while (true) {"
00108$:
	.map	include/system.h, 9, "__asm__("halt");"
	halt
	.map	src/os/main.c, 114, "if (released && getKeys())"
	ld	iy,#_released
	bit	0,(iy + 0)
	jp	Z,00102$
	call	_getKeys
	ld	a,l
	or	a, a
	jp	Z,00102$
	.map	src/os/main.c, 115, "shutdown();"
	call	_shutdown
00102$:
	.map	src/os/main.c, 116, "if (!released && !getKeys())"
	ld	iy,#_released
	bit	0,(iy + 0)
	jp	NZ,00108$
	call	_getKeys
	ld	a,l
	or	a, a
	jp	NZ,00108$
	.map	src/os/main.c, 117, "released = true;"
	ld	iy,#_released
	ld	(iy + 0),#0x01
	jp	00108$
	_show_file_end::
.function	_show_file, _show_file_start, _show_file_end
	.map	src/os/main.c, 121, "void null_function(){}"
;	---------------------------------
; Function null_function
; ---------------------------------
_null_function_start::
_null_function:
	ret
	_null_function_end::
.function	_null_function, _null_function_start, _null_function_end
	.map	src/os/main.c, 123, "void execute_application() {"
;	---------------------------------
; Function execute_application
; ---------------------------------
_execute_application_start::
_execute_application:
	.map	src/os/main.c, 124, "setRenderFunction(null_function);"
	ld	hl,#_null_function
	push	hl
	call	_setRenderFunction
	pop	af
	.map	src/os/main.c, 125, "((function)main_zad->file->data)();"
	ld	hl,(_main_zad)
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	call	__sdcc_call_hl
	.map	src/os/main.c, 127, "setRenderFunction(post_execute);"
	ld	hl,#_post_execute
	push	hl
	call	_setRenderFunction
	pop	af
	.map	src/os/main.c, 128, "while(true) {"
00108$:
	.map	include/system.h, 9, "__asm__("halt");"
	halt
	.map	src/os/main.c, 130, "if (released && getKeys())"
	ld	iy,#_released
	bit	0,(iy + 0)
	jp	Z,00102$
	call	_getKeys
	ld	a,l
	or	a, a
	jp	Z,00102$
	.map	src/os/main.c, 131, "shutdown();"
	call	_shutdown
00102$:
	.map	src/os/main.c, 132, "if (!released && !getKeys())"
	ld	iy,#_released
	bit	0,(iy + 0)
	jp	NZ,00108$
	call	_getKeys
	ld	a,l
	or	a, a
	jp	NZ,00108$
	.map	src/os/main.c, 133, "released = true;"
	ld	iy,#_released
	ld	(iy + 0),#0x01
	jp	00108$
	_execute_application_end::
.function	_execute_application, _execute_application_start, _execute_application_end
	.map	src/os/main.c, 137, "void main_disk() {"
;	---------------------------------
; Function main_disk
; ---------------------------------
_main_disk_start::
_main_disk:
	.map	src/os/main.c, 138, "mapInFileSystem();"
	call	_mapInFileSystem
	.map	src/os/main.c, 139, "main_zad = getNode(&((zanyfs_t*)0x4000)->root, "main.zad");"
	ld	hl,#___str_16
	push	hl
	ld	hl,#0x4004
	push	hl
	call	_getNode
	pop	af
	pop	af
	ld	(_main_zad),hl
	.map	src/os/main.c, 140, "name = default_name;"
	ld	hl,(_default_name)
	ld	(_name),hl
	.map	src/os/main.c, 142, "node_t *metadata = getNode(&((zanyfs_t*)0x4000)->root, "metadata");"
	ld	hl,#___str_15
	push	hl
	ld	hl,#0x4004
	push	hl
	call	_getNode
	pop	af
	pop	af
	ld	e, l
	ld	d, h
	.map	src/os/main.c, 143, "if (metadata && !metadata->is_file) {"
	ld	a,d
	or	a,e
	jp	Z,00105$
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00105$
	.map	src/os/main.c, 144, "metadata = getNode(metadata, "rom_name");"
	ld	hl,#___str_17
	push	hl
	push	de
	call	_getNode
	pop	af
	pop	af
	ld	e, l
	ld	d, h
	.map	src/os/main.c, 145, "if (metadata && metadata->is_file) {"
	ld	a,d
	or	a,e
	jp	Z,00105$
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	Z,00105$
	.map	src/os/main.c, 146, "name = metadata->file->data;"
	push	de
	pop	iy
	ld	l,(iy + 3)
	ld	h,(iy + 4)
	ld	a,(hl)
	ld	iy,#_name
	ld	(iy + 0),a
	inc	hl
	ld	a,(hl)
	ld	iy,#_name
	ld	(iy + 1),a
00105$:
	.map	src/os/main.c, 150, "setRenderFunction(disk);"
	ld	hl,#_disk
	push	hl
	call	_setRenderFunction
	pop	af
	.map	src/os/main.c, 151, "while (true) {"
00114$:
	.map	include/system.h, 9, "__asm__("halt");"
	halt
	.map	src/os/main.c, 153, "switch (getKeys()) {"
	call	_getKeys
	ld	a,l
	dec	a
	jp	Z,00107$
	ld	a,l
	sub	a, #0x02
	jp	Z,00111$
	jp	00114$
	.map src/os/main.c, 154, "case 1:"
00107$:
	.map	src/os/main.c, 155, "if (main_zad->file->executable)"
	ld	iy,(_main_zad)
	ld	l,(iy + 3)
	ld	h,(iy + 4)
	ld	de, #0x0004
	add	hl, de
	ld	a,(hl)
	bit	0,a
	jp	Z,00109$
	.map	src/os/main.c, 156, "jumpWithoutStack(execute_application);"
	ld	hl,#_execute_application
	push	hl
	call	_jumpWithoutStack
	pop	af
	jp	00114$
00109$:
	.map	src/os/main.c, 158, "jumpWithoutStack(show_file);"
	ld	hl,#_show_file
	push	hl
	call	_jumpWithoutStack
	pop	af
	.map	src/os/main.c, 159, "break;"
	jp	00114$
	.map src/os/main.c, 160, "case 2:"
00111$:
	.map	src/os/main.c, 161, "shutdown();"
	call	_shutdown
	.map	src/os/main.c, 163, "}"
	jp	00114$
	_main_disk_end::
.function	_main_disk, _main_disk_start, _main_disk_end
___str_15:
	.ascii "metadata"
	.db 0x00
___str_16:
	.ascii "main.zad"
	.db 0x00
___str_17:
	.ascii "rom_name"
	.db 0x00
	.map	src/os/main.c, 167, "void main_nodisk() {"
;	---------------------------------
; Function main_nodisk
; ---------------------------------
_main_nodisk_start::
_main_nodisk:
	.map	src/os/main.c, 168, "setRenderFunction(noDisk);"
	ld	hl,#_noDisk
	push	hl
	call	_setRenderFunction
	pop	af
	.map	src/os/main.c, 169, "while (true) {"
00106$:
	.map	include/system.h, 9, "__asm__("halt");"
	halt
	.map	src/os/main.c, 174, "if (getDiskPresent() > 0) {"
	call	_getDiskPresent
	xor	a, a
	sub	a, l
	jp	PO, 00123$
	xor	a, #0x80
00123$:
	jp	P,00102$
	.map	src/os/main.c, 175, "jumpWithoutStack(main_disk);"
	ld	hl,#_main_disk
	push	hl
	call	_jumpWithoutStack
	pop	af
00102$:
	.map	src/os/main.c, 177, "if (getKeys() == 1)"
	call	_getKeys
	dec	l
	jp	NZ,00106$
	.map	src/os/main.c, 178, "shutdown();"
	call	_shutdown
	jp	00106$
	_main_nodisk_end::
.function	_main_nodisk, _main_nodisk_start, _main_nodisk_end
	.map	src/os/main.c, 182, "void main() {"
;	---------------------------------
; Function main
; ---------------------------------
_main_start::
_main:
	.map	src/os/main.c, 185, "for (i = 0; i < 4; i++) {"
	ld	e,#0x00
00111$:
	.map	src/os/main.c, 186, "version_str[i] = version[i] + '0';"
	ld	a,_version_str&0xFF
	add	a, e
	ld	c,a
	ld	a,_version_str>>8
	adc	a, #0x00
	ld	b,a
	ld	hl,#_version
	ld	d,#0x00
	add	hl, de
	ld	a,(hl)
	add	a, #0x30
	ld	(bc),a
	.map	src/os/main.c, 185, "for (i = 0; i < 4; i++) {"
	inc	e
	ld	a,e
	sub	a, #0x04
	jp	C,00111$
	.map	src/os/main.c, 189, "setRenderFunction(startupScreen);"
	ld	hl,#_startupScreen
	push	hl
	call	_setRenderFunction
	pop	af
	.map	src/os/main.c, 190, "while (true) {"
	ld	d,#0x00
00108$:
	.map	include/system.h, 9, "__asm__("halt");"
	halt
	.map	src/os/main.c, 192, "if (i++ > 1 seconds) {"
	ld	h,d
	inc	d
	ld	a,#0x3C
	sub	a, h
	jp	NC,00108$
	.map	src/os/main.c, 193, "if (getDiskPresent() > 0) {"
	push	de
	call	_getDiskPresent
	pop	de
	xor	a, a
	sub	a, l
	jp	PO, 00136$
	xor	a, #0x80
00136$:
	jp	P,00103$
	.map	src/os/main.c, 194, "jumpWithoutStack(main_disk);"
	push	de
	ld	hl,#_main_disk
	push	hl
	call	_jumpWithoutStack
	pop	af
	pop	de
	jp	00108$
00103$:
	.map	src/os/main.c, 197, "jumpWithoutStack(main_nodisk);"
	push	de
	ld	hl,#_main_nodisk
	push	hl
	call	_jumpWithoutStack
	pop	af
	pop	de
	jp	00108$
	_main_end::
.function	_main, _main_start, _main_end
	.map	src/os/main.c, 203, "void shutdown() {"
;	---------------------------------
; Function shutdown
; ---------------------------------
_shutdown_start::
_shutdown:
	.map	src/os/main.c, 209, "__endasm;"
	ld a, 1
	out (1), a
	ld a, 0
	out (1), a
	ret
	_shutdown_end::
.function	_shutdown, _shutdown_start, _shutdown_end
	.map	src/os/main.c, 212, "void reset() {"
;	---------------------------------
; Function reset
; ---------------------------------
_reset_start::
_reset:
	.map	src/os/main.c, 218, "__endasm;"
	ld a, 0
	out (1), a
	ld a, 4
	out (1), a
	.map	src/os/main.c, 219, "setRenderFunction(startupScreen);	"
	ld	hl,#_startupScreen
	push	hl
	call	_setRenderFunction
	pop	af
	.map	src/os/main.c, 220, "jumpWithoutStack(main);"
	ld	hl,#_main
	push	hl
	call	_jumpWithoutStack
	pop	af
	ret
	_reset_end::
.function	_reset, _reset_start, _reset_end
	.area _CODE
	.area _INITIALIZER
__xinit__version_str:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	;  0
__xinit__released:
	.db #0x00	;  0
	.area _CABS (ABS)
