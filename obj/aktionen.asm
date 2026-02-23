;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module aktionen
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _p_cdesign_showWeihwasser
	.globl _p_use_weihwasser
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
;aktionen.c:28: void p_use_weihwasser (void) __nonbanked
;	---------------------------------
; Function p_use_weihwasser
; ---------------------------------
_p_use_weihwasser::
;aktionen.c:30: if (v_sweih > 0) {
	ld	hl, #_v_sweih
	ld	a, (hl)
	or	a, a
	ret	Z
;aktionen.c:32: v_sweih -= 1;
	dec	(hl)
;aktionen.c:35: p_cdesign_showWeihwasser ();
;aktionen.c:37: }
	jp	_p_cdesign_showWeihwasser
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
