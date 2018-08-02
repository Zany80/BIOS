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
	.globl _createFile
	.globl _getNode
	.globl _getNodeFromIndex
	.globl _getName
	.globl _node_count
	.globl _strequal
	.globl _strcpy
	.globl _malloc
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
	.map	src/bios/fs/main.c, 5, "int node_count(const node_t *directory) {"
;	---------------------------------
; Function node_count
; ---------------------------------
_node_count_start::
_node_count:
	push	ix
	ld	ix,#0
	add	ix,sp
	push	af
	.map	src/bios/fs/main.c, 8, "if (directory->is_file) {"
	ld	c,(ix + 4)
	ld	b,(ix + 5)
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	Z,00102$
	.map	src/bios/fs/main.c, 9, "return 0;"
	ld	hl,#0x0000
	jp	00107$
00102$:
	.map	src/bios/fs/main.c, 11, "for (nodes = 0, current = directory->dir.children[0]; current != 0; nodes++) {"
	ld	l, c
	ld	h, b
	inc	hl
	inc	hl
	inc	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l, c
	ld	h, b
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	ld	(ix + -2),#0x00
	ld	(ix + -1),#0x00
00105$:
	ld	a,e
	or	a, h
	jp	Z,00103$
	.map	src/bios/fs/main.c, 12, "current = directory->dir.children[nodes];"
	pop	hl
	push	hl
	add	hl, hl
	add	hl,bc
	ld	e,(hl)
	inc	hl
	ld	h,(hl)
	.map	src/bios/fs/main.c, 11, "for (nodes = 0, current = directory->dir.children[0]; current != 0; nodes++) {"
	inc	(ix + -2)
	jp	NZ,00105$
	inc	(ix + -1)
	jp	00105$
00103$:
	.map	src/bios/fs/main.c, 14, "return nodes;"
	pop	hl
	push	hl
00107$:
	ld	sp, ix
	pop	ix
	ret
	_node_count_end::
.function	_node_count, _node_count_start, _node_count_end
	.map	src/bios/fs/main.c, 17, "char *getName(const node_t *address, char *target) {"
;	---------------------------------
; Function getName
; ---------------------------------
_getName_start::
_getName:
	.map	src/bios/fs/main.c, 18, "strcpy(target, address->name);"
	pop	bc
	pop	hl
	push	hl
	push	bc
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	push	de
	ld	hl, #6
	add	hl, sp
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	push	bc
	call	_strcpy
	pop	af
	pop	af
	.map	src/bios/fs/main.c, 19, "return target;"
	ld	hl, #4
	add	hl, sp
	ld	a, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, a
	ret
	_getName_end::
.function	_getName, _getName_start, _getName_end
	.map	src/bios/fs/main.c, 22, "node_t *getNodeFromIndex(const node_t *parent, const int index) {"
;	---------------------------------
; Function getNodeFromIndex
; ---------------------------------
_getNodeFromIndex_start::
_getNodeFromIndex:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/bios/fs/main.c, 23, "if (parent->is_file || index > node_count(parent)) {"
	ld	e,(ix + 4)
	ld	d,(ix + 5)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00101$
	push	de
	push	de
	call	_node_count
	pop	af
	pop	de
	ld	a,l
	sub	a, (ix + 6)
	ld	a,h
	sbc	a, (ix + 7)
	jp	PO, 00110$
	xor	a, #0x80
00110$:
	jp	P,00102$
00101$:
	.map	src/bios/fs/main.c, 24, "return 0;"
	ld	hl,#0x0000
	jp	00104$
00102$:
	.map	src/bios/fs/main.c, 26, "return parent->dir.children[index];"
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	add	hl, hl
	add	hl,de
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
00104$:
	pop	ix
	ret
	_getNodeFromIndex_end::
.function	_getNodeFromIndex, _getNodeFromIndex_start, _getNodeFromIndex_end
	.map	src/bios/fs/main.c, 29, "node_t *getNode(const node_t *const parent, const char *const name) {"
;	---------------------------------
; Function getNode
; ---------------------------------
_getNode_start::
_getNode:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-8
	add	hl,sp
	ld	sp,hl
	.map	src/bios/fs/main.c, 31, "if (!parent->is_file) {"
	ld	e,(ix + 4)
	ld	d,(ix + 5)
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	a,(hl)
	or	a, a
	jp	NZ,00105$
	.map	src/bios/fs/main.c, 32, "int length = node_count(parent);"
	push	de
	push	de
	call	_node_count
	pop	af
	pop	de
	inc	sp
	inc	sp
	push	hl
	.map	src/bios/fs/main.c, 33, "for (i = 0; i < length; i++) {"
	ld	bc,#0x0000
00107$:
	ld	a,c
	sub	a, (ix + -8)
	ld	a,b
	sbc	a, (ix + -7)
	jp	PO, 00127$
	xor	a, #0x80
00127$:
	jp	P,00105$
	.map	src/bios/fs/main.c, 34, "if (strequal(parent->dir.children[i]->name, name)) {"
	ld	hl,#0x0003
	add	hl,de
	ld	(ix + -2),l
	ld	(ix + -1),h
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	(ix + -4),c
	ld	(ix + -3),b
	sla	(ix + -4)
	rl	(ix + -3)
	ld	a,(ix + -4)
	add	a, l
	ld	l,a
	ld	a,(ix + -3)
	adc	a, h
	ld	h,a
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	ld	a,(hl)
	ld	(ix + -6),a
	inc	hl
	ld	a,(hl)
	ld	(ix + -5),a
	push	bc
	push	de
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	push	hl
	ld	l,(ix + -6)
	ld	h,(ix + -5)
	push	hl
	call	_strequal
	pop	af
	pop	af
	pop	de
	pop	bc
	bit	0,l
	jp	Z,00108$
	.map	src/bios/fs/main.c, 35, "return parent->dir.children[i];"
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	ld	e,(hl)
	inc	hl
	ld	d,(hl)
	ld	l,(ix + -4)
	ld	h,(ix + -3)
	add	hl,de
	ld	a, (hl)
	inc	hl
	ld	h,(hl)
	ld	l,a
	jp	00109$
00108$:
	.map	src/bios/fs/main.c, 33, "for (i = 0; i < length; i++) {"
	inc	bc
	jp	00107$
00105$:
	.map	src/bios/fs/main.c, 39, "return 0;"
	ld	hl,#0x0000
00109$:
	ld	sp, ix
	pop	ix
	ret
	_getNode_end::
.function	_getNode, _getNode_start, _getNode_end
	.map	src/bios/fs/main.c, 47, "node_t *createFile(const zanyfs_t *const file_system, const char *const name, node_t *const parent) {"
;	---------------------------------
; Function createFile
; ---------------------------------
_createFile_start::
_createFile:
	push	ix
	ld	ix,#0
	add	ix,sp
	.map	src/bios/fs/main.c, 48, "file_node_t *file_node = (file_node_t*)malloc(sizeof(file_node_t), file_system);"
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	push	hl
	ld	hl,#0x000C
	push	hl
	call	_malloc
	pop	af
	pop	af
	ld	e, l
	ld	d, h
	.map	src/bios/fs/main.c, 49, "if (file_node != 0) {"
	ld	a,d
	or	a,e
	jp	Z,00102$
	.map	src/bios/fs/main.c, 50, "file_node->node.name = name;"
	ld	l, e
	ld	h, d
	ld	a,(ix + 6)
	ld	(hl),a
	inc	hl
	ld	a,(ix + 7)
	ld	(hl),a
	.map	src/bios/fs/main.c, 51, "file_node->node.is_file = true;"
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	ld	(hl),#0x01
	.map	src/bios/fs/main.c, 52, "file_node->node.file = &file_node->file;"
	ld	l, e
	ld	h, d
	inc	hl
	inc	hl
	inc	hl
	ld	a,e
	add	a, #0x07
	ld	b,a
	ld	a,d
	adc	a, #0x00
	ld	c,a
	ld	(hl),b
	inc	hl
	ld	(hl),c
	.map	src/bios/fs/main.c, 53, "file_node->node.parent = parent;"
	ld	hl,#0x0005
	add	hl,de
	ld	a,(ix + 8)
	ld	(hl),a
	inc	hl
	ld	a,(ix + 9)
	ld	(hl),a
00102$:
	.map	src/bios/fs/main.c, 55, "return &file_node->node;"
	ex	de,hl
	pop	ix
	ret
	_createFile_end::
.function	_createFile, _createFile_start, _createFile_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
