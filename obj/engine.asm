;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module engine
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _p_engine_loadTileset
	.globl _p_engine_loadSpriteset
	.globl _p_engine_loadMap
	.globl _p_engine_showMap
	.globl _p_engine_calcCoord
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
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
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
;engine.c:33: void p_engine_loadTileset (uint8_t l_ftile, uint8_t l_ltile, unsigned char l_tileset [80]) __nonbanked
;	---------------------------------
; Function p_engine_loadTileset
; ---------------------------------
_p_engine_loadTileset::
	ld	b, e
;engine.c:35: set_bkg_data (l_ftile, l_ltile + 1, l_tileset);
	inc	b
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;engine.c:36: }
	pop	hl
	pop	af
	jp	(hl)
;engine.c:44: void p_engine_loadSpriteset (uint8_t l_fsprite, uint8_t l_lsprite, unsigned char l_spriteset [5]) __nonbanked
;	---------------------------------
; Function p_engine_loadSpriteset
; ---------------------------------
_p_engine_loadSpriteset::
	ld	b, e
;engine.c:46: set_sprite_data (l_fsprite, l_lsprite + 1, l_spriteset);
	inc	b
	ldhl	sp,	#2
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	push	bc
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;engine.c:47: }
	pop	hl
	pop	af
	jp	(hl)
;engine.c:50: void p_engine_loadMap (unsigned char l_lvldat [252]) __nonbanked
;	---------------------------------
; Function p_engine_loadMap
; ---------------------------------
_p_engine_loadMap::
	add	sp, #-1
	push	de
;engine.c:54: for (l_i = 0; l_i != 253; ++l_i) v_lvldat [l_i] = l_lvldat [l_i];
	ldhl	sp,	#2
	ld	(hl), #0x00
00102$:
	ld	de, #_v_lvldat
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	pop	de
	push	de
	ldhl	sp,	#2
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ld	(bc), a
	ldhl	sp,	#2
	inc	(hl)
	ld	a, (hl)
	sub	a, #0xfd
	jr	NZ, 00102$
;engine.c:55: }
	add	sp, #3
	ret
;engine.c:58: void p_engine_showMap (unsigned char l_lvldat [252]) __nonbanked
;	---------------------------------
; Function p_engine_showMap
; ---------------------------------
_p_engine_showMap::
;engine.c:60: set_bkg_tiles (1, 1, 18, 14, l_lvldat);
	push	de
	ld	hl, #0xe12
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_bkg_tiles
	add	sp, #6
;engine.c:61: }
	ret
;engine.c:64: uint8_t p_engine_calcCoord (uint8_t l_w1, uint8_t l_w2) __nonbanked
;	---------------------------------
; Function p_engine_calcCoord
; ---------------------------------
_p_engine_calcCoord::
	add	sp, #-6
	ldhl	sp,	#5
	ld	(hl), e
;engine.c:66: return ((l_w1 - 16) / 8) + 18 * ((l_w2 - 24) / 8);
	ldhl	sp,	#1
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0010
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00103$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xfff7
	add	hl, de
	ld	c, l
	ld	b, h
00103$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ldhl	sp,	#0
	ld	(hl), c
	ldhl	sp,	#5
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0018
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	(hl), e
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	bit	7, (hl)
	jr	Z, 00104$
	dec	hl
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0xffef
	add	hl, de
	ld	c, l
	ld	b, h
00104$:
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
	ld	a, c
	add	a, a
	add	a, a
	add	a, a
	add	a, c
	add	a, a
	ldhl	sp,	#0
	add	a, (hl)
;engine.c:67: }
	add	sp, #6
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
