;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module cdesign
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _set_bkg_tiles
	.globl _p_cdesign_umwandlung
	.globl _p_cdesign_showLP
	.globl _p_cdesign_showKey
	.globl _p_cdesign_showWeihwasser
	.globl _p_cdesign_showTime
	.globl _p_cdesign_showMapKoord
	.globl _p_cdesign_showXK
	.globl _p_cdesign_showYK
	.globl _p_cdesign_showStatus
	.globl _p_cdesign_init
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
;cdesign.c:28: void p_cdesign_umwandlung (uint8_t l_w, uint8_t l_xk, uint8_t l_yk) __nonbanked
;	---------------------------------
; Function p_cdesign_umwandlung
; ---------------------------------
_p_cdesign_umwandlung::
	dec	sp
	dec	sp
	ld	c, a
	ldhl	sp,	#1
	ld	(hl), e
;cdesign.c:34: if (l_w == 0) l_tile [0] = 91;
	ld	a, c
	or	a, a
	jr	NZ, 00112$
	dec	hl
	ld	(hl), #0x5b
;cdesign.c:36: for (l_i = 0x01; l_i != 0x0A; ++l_i) {
00112$:
	ld	b, #0x01
00106$:
;cdesign.c:37: if (l_w == l_i) l_tile [0] = 0x65 - l_i;
	ld	a, c
	sub	a, b
	jr	NZ, 00107$
	ld	e, b
	ld	a, #0x65
	sub	a, e
	ldhl	sp,	#0
	ld	(hl), a
00107$:
;cdesign.c:36: for (l_i = 0x01; l_i != 0x0A; ++l_i) {
	inc	b
	ld	a, b
	sub	a, #0x0a
	jr	NZ, 00106$
;cdesign.c:40: set_bkg_tiles (l_xk, l_yk, 1, 1, l_tile);
	ld	hl, #0
	add	hl, sp
	push	hl
	ld	hl, #0x101
	push	hl
	ldhl	sp,	#8
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#6
	ld	a, (hl)
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;cdesign.c:41: }
	inc	sp
	inc	sp
	pop	hl
	inc	sp
	jp	(hl)
;cdesign.c:44: void p_cdesign_showLP (void) __nonbanked
;	---------------------------------
; Function p_cdesign_showLP
; ---------------------------------
_p_cdesign_showLP::
;cdesign.c:46: p_cdesign_umwandlung (v_slp, 3, 16);
	ld	a, #0x10
	push	af
	inc	sp
	ld	e, #0x03
	ld	a, (_v_slp)
	call	_p_cdesign_umwandlung
;cdesign.c:47: }
	ret
;cdesign.c:50: void p_cdesign_showKey (void) __nonbanked
;	---------------------------------
; Function p_cdesign_showKey
; ---------------------------------
_p_cdesign_showKey::
;cdesign.c:52: p_cdesign_umwandlung (v_skey % 10, 12, 16);
	ld	a, (_v_skey)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x10
	push	hl
	inc	sp
	ld	e, #0x0c
	call	_p_cdesign_umwandlung
;cdesign.c:53: }
	ret
;cdesign.c:56: void p_cdesign_showWeihwasser (void) __nonbanked
;	---------------------------------
; Function p_cdesign_showWeihwasser
; ---------------------------------
_p_cdesign_showWeihwasser::
;cdesign.c:58: p_cdesign_umwandlung (v_sweih % 10, 7, 16);
	ld	a, (_v_sweih)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x10
	push	hl
	inc	sp
	ld	e, #0x07
	call	_p_cdesign_umwandlung
;cdesign.c:59: }
	ret
;cdesign.c:62: void p_cdesign_showTime (void) __nonbanked
;	---------------------------------
; Function p_cdesign_showTime
; ---------------------------------
_p_cdesign_showTime::
;cdesign.c:64: p_cdesign_umwandlung (v_time % 10, 18, 16);
	ld	a, (_v_time)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x10
	push	hl
	inc	sp
	ld	e, #0x12
	call	_p_cdesign_umwandlung
;cdesign.c:65: p_cdesign_umwandlung ((v_time / 10 ) % 10, 17, 16);
	ld	a, (_v_time)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x10
	push	hl
	inc	sp
	ld	e, #0x11
	call	_p_cdesign_umwandlung
;cdesign.c:66: p_cdesign_umwandlung (((v_time / 10) / 10 ) % 10, 16, 16);
	ld	a, (_v_time)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x10
	push	hl
	inc	sp
	ld	e, #0x10
	call	_p_cdesign_umwandlung
;cdesign.c:67: }
	ret
;cdesign.c:70: void p_cdesign_showMapKoord (void) __nonbanked
;	---------------------------------
; Function p_cdesign_showMapKoord
; ---------------------------------
_p_cdesign_showMapKoord::
;cdesign.c:72: p_cdesign_umwandlung (v_smk % 10, 10, 17);
	ld	a, (_v_smk)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x11
	push	hl
	inc	sp
	ld	e, #0x0a
	call	_p_cdesign_umwandlung
;cdesign.c:73: p_cdesign_umwandlung ((v_smk / 10 ) % 10, 9, 17);
	ld	a, (_v_smk)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x11
	push	hl
	inc	sp
	ld	e, #0x09
	call	_p_cdesign_umwandlung
;cdesign.c:74: p_cdesign_umwandlung (((v_smk / 10) / 10 ) % 10, 8, 17);	
	ld	a, (_v_smk)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x11
	push	hl
	inc	sp
	ld	e, #0x08
	call	_p_cdesign_umwandlung
;cdesign.c:75: }
	ret
;cdesign.c:78: void p_cdesign_showXK (void) __nonbanked
;	---------------------------------
; Function p_cdesign_showXK
; ---------------------------------
_p_cdesign_showXK::
;cdesign.c:80: p_cdesign_umwandlung (v_sxk % 10, 3, 15);
	ld	a, (_v_sxk)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x0f
	push	hl
	inc	sp
	ld	e, #0x03
	call	_p_cdesign_umwandlung
;cdesign.c:81: p_cdesign_umwandlung ((v_sxk / 10 )  % 10, 2, 15);
	ld	a, (_v_sxk)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x0f
	push	hl
	inc	sp
	ld	e, #0x02
	call	_p_cdesign_umwandlung
;cdesign.c:82: p_cdesign_umwandlung (((v_sxk / 10) /10 ) % 10, 1, 15);
	ld	a, (_v_sxk)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x0f
	push	hl
	inc	sp
	ld	e, #0x01
	call	_p_cdesign_umwandlung
;cdesign.c:83: }
	ret
;cdesign.c:85: void p_cdesign_showYK (void) __nonbanked
;	---------------------------------
; Function p_cdesign_showYK
; ---------------------------------
_p_cdesign_showYK::
;cdesign.c:87: p_cdesign_umwandlung (v_syk % 10, 7, 15);
	ld	a, (_v_syk)
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x0f
	push	hl
	inc	sp
	ld	e, #0x07
	call	_p_cdesign_umwandlung
;cdesign.c:88: p_cdesign_umwandlung ((v_syk / 10 )  % 10, 6, 15);
	ld	a, (_v_syk)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x0f
	push	hl
	inc	sp
	ld	e, #0x06
	call	_p_cdesign_umwandlung
;cdesign.c:89: p_cdesign_umwandlung (((v_syk / 10) /10 ) % 10, 5, 15);
	ld	a, (_v_syk)
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__divuchar
	ld	a, c
	ld	e, #0x0a
	call	__moduchar
	ld	a, c
	ld	h, #0x0f
	push	hl
	inc	sp
	ld	e, #0x05
	call	_p_cdesign_umwandlung
;cdesign.c:90: }	
	ret
;cdesign.c:93: void p_cdesign_showStatus (void) __nonbanked
;	---------------------------------
; Function p_cdesign_showStatus
; ---------------------------------
_p_cdesign_showStatus::
;cdesign.c:95: p_cdesign_showLP ();
	call	_p_cdesign_showLP
;cdesign.c:96: p_cdesign_showWeihwasser ();
	call	_p_cdesign_showWeihwasser
;cdesign.c:97: p_cdesign_showKey ();
	call	_p_cdesign_showKey
;cdesign.c:98: p_cdesign_showMapKoord ();
	call	_p_cdesign_showMapKoord
;cdesign.c:99: p_cdesign_showTime ();
;cdesign.c:100: }
	jp	_p_cdesign_showTime
;cdesign.c:103: void p_cdesign_init (void) __nonbanked
;	---------------------------------
; Function p_cdesign_init
; ---------------------------------
_p_cdesign_init::
;cdesign.c:105: set_bkg_tiles (0, 0, 20, 18, gameborder);
	ld	de, #_gameborder
	push	de
	ld	hl, #0x1214
	push	hl
	xor	a, a
	rrca
	push	af
	call	_set_bkg_tiles
	add	sp, #6
;cdesign.c:106: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
