;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module init
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _p_level_init
	.globl _p_player_init
	.globl _p_cdesign_init
	.globl _p_cdesign_showStatus
	.globl _p_engine_showMap
	.globl _p_engine_loadMap
	.globl _p_engine_loadSpriteset
	.globl _p_engine_loadTileset
	.globl _p_init_stage_1
	.globl _p_init_stage_2
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
;init.c:35: void p_init_stage_1 (void) __nonbanked
;	---------------------------------
; Function p_init_stage_1
; ---------------------------------
_p_init_stage_1::
;init.c:37: SPRITES_8x8;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfb
	ldh	(_LCDC_REG + 0), a
;init.c:38: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;init.c:39: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;init.c:42: p_engine_loadTileset (56, 127, fonttiles);
	ld	de, #_fonttiles
	push	de
	ld	e, #0x7f
	ld	a, #0x38
	call	_p_engine_loadTileset
;init.c:43: p_engine_loadSpriteset (0, 3, sprites);
	ld	de, #_sprites
	push	de
	ld	e, #0x03
	xor	a, a
	call	_p_engine_loadSpriteset
;init.c:45: v_time = 255; v_gameover = FALSE; v_movetimer = 0; v_gegnertimer = 0; v_timertimer = 0;
	ld	hl, #_v_time
	ld	(hl), #0xff
	xor	a, a
	ld	(#_v_gameover), a
	ld	(#_v_movetimer),a
	xor	a, a
	ld	(#_v_gegnertimer), a
	ld	(#_v_timertimer),a
;init.c:46: }
	ret
;init.c:48: void p_init_stage_2 (void) __nonbanked
;	---------------------------------
; Function p_init_stage_2
; ---------------------------------
_p_init_stage_2::
;init.c:50: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;init.c:51: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;init.c:53: p_engine_loadMap (room1);
	ld	de, #_room1
	call	_p_engine_loadMap
;init.c:55: p_cdesign_init ();
	call	_p_cdesign_init
;init.c:56: p_engine_showMap (v_lvldat);
	ld	de, #_v_lvldat
	call	_p_engine_showMap
;init.c:58: p_player_init ();
	call	_p_player_init
;init.c:59: p_cdesign_showStatus ();
	call	_p_cdesign_showStatus
;init.c:60: p_level_init ();	
;init.c:61: }
	jp	_p_level_init
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
