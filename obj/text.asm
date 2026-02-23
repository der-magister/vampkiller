;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module text
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_win_tiles
	.globl _waitpad
	.globl _delay
	.globl _p_text_viewTXT
	.globl _p_text_hideTXT
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
;text.c:28: void p_text_viewTXT (unsigned char l_txt [81]) __nonbanked
;	---------------------------------
; Function p_text_viewTXT
; ---------------------------------
_p_text_viewTXT::
	ld	c, e
	ld	b, d
;text.c:30: set_win_tiles (0, 0, 20, 6, textborder);
	ld	de, #_textborder
	push	de
	ld	hl, #0x614
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_win_tiles
	add	sp, #6
;text.c:31: set_win_tiles (1, 1, 18, 4, l_txt);
	push	bc
	ld	hl, #0x412
	push	hl
	ld	hl, #0x101
	push	hl
	call	_set_win_tiles
	add	sp, #6
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	ld	a, #0x07
	ldh	(_WX_REG + 0), a
	ld	a, #0x60
	ldh	(_WY_REG + 0), a
;text.c:33: SHOW_WIN;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
;text.c:34: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;text.c:35: delay (170);
	ld	de, #0x00aa
	call	_delay
;text.c:36: waitpad (J_A);
	ld	a, #0x10
	call	_waitpad
;text.c:37: p_text_hideTXT ();
;text.c:38: }
	jp	_p_text_hideTXT
;text.c:41: void p_text_hideTXT (void) __nonbanked
;	---------------------------------
; Function p_text_hideTXT
; ---------------------------------
_p_text_hideTXT::
;text.c:43: HIDE_WIN;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;/opt/gbdk/include/gb/gb.h:1739: WX_REG=x, WY_REG=y;
	xor	a, a
	ldh	(_WX_REG + 0), a
	xor	a, a
	ldh	(_WY_REG + 0), a
;text.c:45: delay (160);
	ld	de, #0x00a0
	call	_delay
;text.c:47: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;text.c:48: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
