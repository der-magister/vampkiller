;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module globals
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _v_kolidat
	.globl _v_tuer
	.globl _v_kiste
	.globl _v_gri
	.globl _v_gmk
	.globl _v_gyk
	.globl _v_gxk
	.globl _v_glp
	.globl _v_sri
	.globl _v_smk
	.globl _v_syk
	.globl _v_sxk
	.globl _v_pflock
	.globl _v_sweih
	.globl _v_skey
	.globl _v_slp
	.globl _v_lvldatmod
	.globl _v_lvldat
	.globl _v_time
	.globl _v_room
	.globl _v_timertimer
	.globl _v_gegnertimer
	.globl _v_angriffstimer
	.globl _v_movetimer
	.globl _v_action
	.globl _v_angriff
	.globl _v_gameover
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area _HRAM
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_v_gameover::
	.ds 1
_v_angriff::
	.ds 1
_v_action::
	.ds 1
_v_movetimer::
	.ds 1
_v_angriffstimer::
	.ds 1
_v_gegnertimer::
	.ds 1
_v_timertimer::
	.ds 1
_v_room::
	.ds 1
_v_time::
	.ds 1
_v_lvldat::
	.ds 252
_v_lvldatmod::
	.ds 252
_v_slp::
	.ds 1
_v_skey::
	.ds 1
_v_sweih::
	.ds 1
_v_pflock::
	.ds 1
_v_sxk::
	.ds 1
_v_syk::
	.ds 1
_v_smk::
	.ds 1
_v_sri::
	.ds 1
_v_glp::
	.ds 5
_v_gxk::
	.ds 5
_v_gyk::
	.ds 5
_v_gmk::
	.ds 5
_v_gri::
	.ds 5
_v_kiste::
	.ds 5
_v_tuer::
	.ds 3
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
_v_kolidat:
	.db #0x38	; 56	'8'
	.db #0x3a	; 58
	.db #0x3c	; 60
	.db #0x3d	; 61
	.area _INITIALIZER
	.area _CABS (ABS)
