;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.4.1 #9072 (Jun 28 2018) (Linux)
; This file was generated Thu Jun 28 01:36:03 2018
;--------------------------------------------------------
	.module malloc
	.optsdcc -mz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
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
	.map	src/bios/fs/malloc.c, 13, "void *malloc(size_t size, const zanyfs_t *const file_system) {"
;	---------------------------------
; Function malloc
; ---------------------------------
_malloc_start::
_malloc:
	push	ix
	ld	ix,#0
	add	ix,sp
	ld	hl,#-10
	add	hl,sp
	ld	sp,hl
	.map	src/bios/fs/malloc.c, 18, "if(!size || size + offsetof(header_t, next_free) < size)"
	ld	a,(ix + 5)
	or	a,(ix + 4)
	jp	Z,00101$
	ld	l,(ix + 4)
	ld	h,(ix + 5)
	inc	hl
	inc	hl
	ld	a,l
	sub	a, (ix + 4)
	ld	a,h
	sbc	a, (ix + 5)
	jp	NC,00102$
00101$:
	.map	src/bios/fs/malloc.c, 19, "return 0;"
	ld	hl,#0x0000
	jp	00115$
00102$:
	.map	src/bios/fs/malloc.c, 20, "size += offsetof(header_t, next_free);"
	ld	(ix + 4),l
	ld	(ix + 5),h
	.map	src/bios/fs/malloc.c, 21, "if(size < sizeof(header_t))"
	ld	a,(ix + 4)
	sub	a, #0x04
	ld	a,(ix + 5)
	sbc	a, #0x00
	jp	NC,00105$
	.map	src/bios/fs/malloc.c, 22, "size = sizeof(header_t);"
	ld	(ix + 4),#0x04
	ld	(ix + 5),#0x00
00105$:
	.map	src/bios/fs/malloc.c, 24, "for(h = file_system->free, f = &file_system->free; h; f = &(h->next_free), h = h->next_free) {"
	ld	l,(ix + 6)
	ld	h,(ix + 7)
	ld	bc,#0x000F
	add	hl,bc
	push	hl
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	pop	hl
	ld	(ix + -2),l
	ld	(ix + -1),h
00113$:
	ld	a,b
	or	a,c
	jp	Z,00111$
	.map	src/bios/fs/malloc.c, 25, "size_t blocksize = (char *)(h->next) - (char *)h;"
	ld	a,(bc)
	ld	(ix + -4),a
	inc	bc
	ld	a,(bc)
	ld	(ix + -3),a
	dec	bc
	ld	e,(ix + -4)
	ld	d,(ix + -3)
	ld	(ix + -6),c
	ld	(ix + -5),b
	ld	a,e
	sub	a, (ix + -6)
	ld	h,a
	ld	a,d
	sbc	a, (ix + -5)
	ld	l,a
	.map	src/bios/fs/malloc.c, 30, "newheader->next_free = h->next_free;"
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	.map	src/bios/fs/malloc.c, 26, "if(blocksize >= size) {"
	ld	a,h
	sub	a, (ix + 4)
	ld	a,l
	sbc	a, (ix + 5)
	jp	C,00114$
	.map	src/bios/fs/malloc.c, 27, "if(blocksize >= size + sizeof(struct header)) {"
	ld	a,(ix + 4)
	add	a, #0x04
	ld	(ix + -8),a
	ld	a,(ix + 5)
	adc	a, #0x00
	ld	(ix + -7),a
	ld	a,h
	sub	a, (ix + -8)
	ld	a,l
	sbc	a, (ix + -7)
	jp	C,00107$
	.map	src/bios/fs/malloc.c, 28, "header_t *const newheader = (header_t *const)((char *)h + size);"
	ld	a,(ix + -6)
	add	a, (ix + 4)
	ld	h,a
	ld	a,(ix + -5)
	adc	a, (ix + 5)
	ld	l,a
	ld	(ix + -10),h
	ld	(ix + -9),l
	.map	src/bios/fs/malloc.c, 29, "newheader->next = h->next;"
	pop	hl
	push	hl
	ld	a,(ix + -4)
	ld	(hl),a
	inc	hl
	ld	a,(ix + -3)
	ld	(hl),a
	.map	src/bios/fs/malloc.c, 30, "newheader->next_free = h->next_free;"
	pop	iy
	push	iy
	inc	iy
	inc	iy
	ld	l, e
	ld	h, d
	ld	a, (hl)
	inc	hl
	ld	l,(hl)
	ld	h,a
	ld	(iy + 0),h
	ld	(iy + 1),l
	.map	src/bios/fs/malloc.c, 31, "*f = newheader;"
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	ld	a,(ix + -10)
	ld	(hl),a
	inc	hl
	ld	a,(ix + -9)
	ld	(hl),a
	.map	src/bios/fs/malloc.c, 32, "h->next = newheader;"
	ld	a,(ix + -10)
	ld	(bc),a
	inc	bc
	ld	a,(ix + -9)
	ld	(bc),a
	jp	00108$
00107$:
	.map	src/bios/fs/malloc.c, 35, "*f = h->next_free;"
	ld	l, e
	ld	h, d
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ld	l,(ix + -2)
	ld	h,(ix + -1)
	ld	(hl),c
	inc	hl
	ld	(hl),b
00108$:
	.map	src/bios/fs/malloc.c, 37, "return(&(h->next_free));"
	ld	l, e
	ld	h, d
	jp	00115$
00114$:
	.map	src/bios/fs/malloc.c, 24, "for(h = file_system->free, f = &file_system->free; h; f = &(h->next_free), h = h->next_free) {"
	ld	(ix + -2),e
	ld	(ix + -1),d
	ld	l, e
	ld	h, d
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	jp	00113$
00111$:
	.map	src/bios/fs/malloc.c, 41, "return 0;"
	ld	hl,#0x0000
00115$:
	ld	sp, ix
	pop	ix
	ret
	_malloc_end::
.function	_malloc, _malloc_start, _malloc_end
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
