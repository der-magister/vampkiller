;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module vampkiller
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _p_level_control
	.globl _p_gegner_move
	.globl _p_cdesign_showYK
	.globl _p_cdesign_showXK
	.globl _p_cdesign_showMapKoord
	.globl _p_cdesign_showTime
	.globl _p_player_attack
	.globl _p_player_move
	.globl _p_init_stage_2
	.globl _p_init_stage_1
	.globl _wait_vbl_done
	.globl _joypad
	.globl _main
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
;vampkiller.c:30: void main (void) __nonbanked
;	---------------------------------
; Function main
; ---------------------------------
_main::
;vampkiller.c:32: p_init_stage_1 ();
	call	_p_init_stage_1
;vampkiller.c:33: p_init_stage_2 ();
	call	_p_init_stage_2
;vampkiller.c:35: v_angriffstimer = 0;
	xor	a, a
	ld	(#_v_angriffstimer),a
;vampkiller.c:38: while (v_gameover == FALSE)
00127$:
	ld	a, (#_v_gameover)
	or	a, a
	ret	NZ
;vampkiller.c:41: if (v_movetimer == 7) {
	ld	a, (#_v_movetimer)
	sub	a, #0x07
	jr	NZ, 00113$
;vampkiller.c:42: if (joypad () & J_UP) p_player_move (UP);
	call	_joypad
	bit	2, a
	jr	Z, 00110$
	ld	a, #0x01
	call	_p_player_move
	jr	00111$
00110$:
;vampkiller.c:43: else if (joypad () & J_DOWN) p_player_move (DOWN);
	call	_joypad
	bit	3, a
	jr	Z, 00107$
	ld	a, #0x02
	call	_p_player_move
	jr	00111$
00107$:
;vampkiller.c:44: else if (joypad () & J_LEFT) p_player_move (LEFT);
	call	_joypad
	bit	1, a
	jr	Z, 00104$
	ld	a, #0x03
	call	_p_player_move
	jr	00111$
00104$:
;vampkiller.c:45: else if (joypad () & J_RIGHT) p_player_move (RIGHT);
	call	_joypad
	rrca
	jr	NC, 00111$
	ld	a, #0x04
	call	_p_player_move
00111$:
;vampkiller.c:47: v_movetimer = 0;
	xor	a, a
	ld	(#_v_movetimer),a
;vampkiller.c:48: p_cdesign_showMapKoord ();
	call	_p_cdesign_showMapKoord
;vampkiller.c:49: p_cdesign_showXK ();
	call	_p_cdesign_showXK
;vampkiller.c:50: p_cdesign_showYK ();
	call	_p_cdesign_showYK
00113$:
;vampkiller.c:53: if ((joypad () & J_A) && (v_angriff == FALSE)) {
	call	_joypad
	bit	4, a
	jr	Z, 00115$
	ld	a, (#_v_angriff)
	or	a, a
	jr	NZ, 00115$
;vampkiller.c:54: p_level_control ();
	call	_p_level_control
;vampkiller.c:56: p_player_attack ();
	call	_p_player_attack
00115$:
;vampkiller.c:64: if (v_angriffstimer == 8) {
	ld	a, (#_v_angriffstimer)
	sub	a, #0x08
	jr	NZ, 00118$
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	xor	a, a
	ld	(hl+), a
	ld	(hl), a
;vampkiller.c:65: move_sprite (1, 0, 0); v_angriff = FALSE;
	xor	a, a
	ld	(#_v_angriff),a
00118$:
;vampkiller.c:68: if (v_gegnertimer == 9) {
	ld	a, (#_v_gegnertimer)
	sub	a, #0x09
	jr	NZ, 00120$
;vampkiller.c:69: p_gegner_move ();
	call	_p_gegner_move
00120$:
;vampkiller.c:72: if (v_angriff == TRUE) v_angriffstimer++;
	ld	a, (#_v_angriff)
	dec	a
	jr	NZ, 00122$
	ld	hl, #_v_angriffstimer
	inc	(hl)
00122$:
;vampkiller.c:74: if (v_gegnertimer < 255) v_gegnertimer++;
	ld	hl, #_v_gegnertimer
	ld	a, (hl)
	sub	a, #0xff
	jr	NC, 00124$
	inc	(hl)
00124$:
;vampkiller.c:76: ++v_movetimer;
	ld	hl, #_v_movetimer
	inc	(hl)
;vampkiller.c:77: ++v_timertimer;
	ld	hl, #_v_timertimer
	inc	(hl)
;vampkiller.c:79: if (v_timertimer == 100) {
	ld	a, (hl)
	sub	a, #0x64
	jr	NZ, 00126$
;vampkiller.c:80: --v_time;
	ld	hl, #_v_time
	dec	(hl)
;vampkiller.c:81: p_cdesign_showTime ();
	call	_p_cdesign_showTime
;vampkiller.c:82: v_timertimer = 0;
	xor	a, a
	ld	(#_v_timertimer),a
00126$:
;vampkiller.c:84: wait_vbl_done ();
	call	_wait_vbl_done
;vampkiller.c:86: }
	jp	00127$
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
