;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module umgebung
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _p_cdesign_showTime
	.globl _p_cdesign_showWeihwasser
	.globl _p_cdesign_showKey
	.globl _p_cdesign_showLP
	.globl _p_text_viewTXT
	.globl _p_umgebung_schild
	.globl _p_umgebung_truheEispflock
	.globl _p_umgebung_truheWeihwasser
	.globl _p_umgebung_tuerzu
	.globl _p_umgebung_truheHerz
	.globl _p_umgebung_truheSchluessel
	.globl _p_umgebung_truheUhr
	.globl _p_umgebung_disables
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
;umgebung.c:31: void p_umgebung_schild (uint8_t l_mk, unsigned char l_txt [81]) __nonbanked
;	---------------------------------
; Function p_umgebung_schild
; ---------------------------------
_p_umgebung_schild::
;umgebung.c:33: if (l_mk == v_smk) {
	ld	hl, #_v_smk
	sub	a, (hl)
	jp	Z, _p_text_viewTXT
;umgebung.c:34: p_text_viewTXT (l_txt);
;umgebung.c:36: }
	ret
;umgebung.c:39: void p_umgebung_truheEispflock (uint8_t l_mk, uint8_t l_nr) __nonbanked
;	---------------------------------
; Function p_umgebung_truheEispflock
; ---------------------------------
_p_umgebung_truheEispflock::
;umgebung.c:41: if ((l_mk == v_smk) && (v_kiste [l_nr] == 0)) {
	ld	hl, #_v_smk
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00139$
	xor	a, a
00139$:
	ld	d, a
	or	a, a
	jr	Z, 00105$
	ld	a, #<(_v_kiste)
	add	a, e
	ld	c, a
	ld	a, #>(_v_kiste)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	NZ, 00105$
;umgebung.c:42: p_text_viewTXT (eispflock);
	push	bc
	ld	de, #_eispflock
	call	_p_text_viewTXT
	pop	bc
;umgebung.c:44: v_kiste [l_nr] = 1; v_pflock = TRUE; v_tuer [0] = TRUE;
	ld	a, #0x01
	ld	(bc), a
	ld	hl, #_v_pflock
	ld	(hl), #0x01
	ld	hl, #_v_tuer
	ld	(hl), #0x01
	ret
00105$:
;umgebung.c:46: else if ((l_mk == v_smk) && (v_kiste [l_nr] == 1)) {
	ld	a, d
	or	a, a
	ret	Z
	ld	hl, #_v_kiste
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	dec	a
	ret	NZ
;umgebung.c:47: p_text_viewTXT (leer);
	ld	de, #_leer
;umgebung.c:49: }
	jp	_p_text_viewTXT
;umgebung.c:52: void p_umgebung_truheWeihwasser (uint8_t l_mk, uint8_t l_nr) __nonbanked
;	---------------------------------
; Function p_umgebung_truheWeihwasser
; ---------------------------------
_p_umgebung_truheWeihwasser::
;umgebung.c:54: if ((l_mk == v_smk) && (v_kiste [l_nr] == 0)) {
	ld	hl, #_v_smk
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00139$
	xor	a, a
00139$:
	ld	d, a
	or	a, a
	jr	Z, 00105$
	ld	a, #<(_v_kiste)
	add	a, e
	ld	c, a
	ld	a, #>(_v_kiste)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	NZ, 00105$
;umgebung.c:55: p_text_viewTXT (weihwasser);
	push	bc
	ld	de, #_weihwasser
	call	_p_text_viewTXT
	pop	bc
;umgebung.c:57: v_kiste [l_nr] = 1; v_sweih += 1;
	ld	a, #0x01
	ld	(bc), a
	ld	a, (_v_sweih)
	inc	a
;umgebung.c:58: p_cdesign_showWeihwasser ();
	ld	(#_v_sweih), a
	jp	_p_cdesign_showWeihwasser
00105$:
;umgebung.c:60: else if ((l_mk == v_smk) && (v_kiste [l_nr] == 1)) {
	ld	a, d
	or	a, a
	ret	Z
	ld	hl, #_v_kiste
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	dec	a
	ret	NZ
;umgebung.c:61: p_text_viewTXT (leer);
	ld	de, #_leer
;umgebung.c:64: }
	jp	_p_text_viewTXT
;umgebung.c:66: void p_umgebung_tuerzu (uint8_t l_mk, uint8_t l_nr) __nonbanked
;	---------------------------------
; Function p_umgebung_tuerzu
; ---------------------------------
_p_umgebung_tuerzu::
;umgebung.c:68: if ((l_mk == v_smk) && (v_tuer [l_nr] == FALSE)) {
	ld	hl, #_v_smk
	sub	a, (hl)
	ret	NZ
	ld	hl, #_v_tuer
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	or	a, a
	ret	NZ
;umgebung.c:69: p_text_viewTXT (tuerzu);
	ld	de, #_tuerzu
;umgebung.c:71: }
	jp	_p_text_viewTXT
;umgebung.c:74: void p_umgebung_truheHerz (uint8_t l_mk, uint8_t l_nr) __nonbanked
;	---------------------------------
; Function p_umgebung_truheHerz
; ---------------------------------
_p_umgebung_truheHerz::
;umgebung.c:76: if ((l_mk == v_smk) && (v_kiste [l_nr] == 0)) { 
	ld	hl, #_v_smk
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00158$
	xor	a, a
00158$:
	ld	d, a
	or	a, a
	jr	Z, 00110$
	ld	a, #<(_v_kiste)
	add	a, e
	ld	c, a
	ld	a, #>(_v_kiste)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	NZ, 00110$
;umgebung.c:78: if (v_slp < 3) {
	ld	a, (#_v_slp)
	sub	a, #0x03
	jr	NC, 00104$
;umgebung.c:79: p_text_viewTXT (herz);
	push	bc
	ld	de, #_herz
	call	_p_text_viewTXT
	pop	bc
;umgebung.c:80: v_kiste [l_nr] = 1; v_slp += 1;
	ld	a, #0x01
	ld	(bc), a
	ld	a, (_v_slp)
	inc	a
;umgebung.c:81: p_cdesign_showLP ();
	ld	(#_v_slp), a
	jp	_p_cdesign_showLP
00104$:
;umgebung.c:83: else if (v_slp > 2) {
	ld	a, #0x02
	ld	hl, #_v_slp
	sub	a, (hl)
	ret	NC
;umgebung.c:84: p_text_viewTXT (nichtnuetzlich);	
	ld	de, #_nichtnuetzlich
	jp	_p_text_viewTXT
00110$:
;umgebung.c:87: else if ((l_mk == v_smk) && (v_kiste [l_nr] == 1)) {
	ld	a, d
	or	a, a
	ret	Z
	ld	hl, #_v_kiste
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	dec	a
	ret	NZ
;umgebung.c:88: p_text_viewTXT (leer);
	ld	de, #_leer
;umgebung.c:90: }
	jp	_p_text_viewTXT
;umgebung.c:93: void p_umgebung_truheSchluessel (uint8_t l_mk, uint8_t l_nr) __nonbanked
;	---------------------------------
; Function p_umgebung_truheSchluessel
; ---------------------------------
_p_umgebung_truheSchluessel::
;umgebung.c:95: if ((l_mk == v_smk) && (v_kiste [l_nr] == 0)) {
	ld	hl, #_v_smk
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00158$
	xor	a, a
00158$:
	ld	d, a
	or	a, a
	jr	Z, 00110$
	ld	a, #<(_v_kiste)
	add	a, e
	ld	c, a
	ld	a, #>(_v_kiste)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	NZ, 00110$
;umgebung.c:96: p_text_viewTXT (schluessel);
	push	bc
	ld	de, #_schluessel
	call	_p_text_viewTXT
	pop	bc
;umgebung.c:98: if (v_skey < 3) {
	ld	hl, #_v_skey
	ld	a, (hl)
	sub	a, #0x03
	jr	NC, 00104$
;umgebung.c:99: v_kiste [l_nr] = 1;  v_skey += 1;
	ld	a, #0x01
	ld	(bc), a
;umgebung.c:100: p_cdesign_showKey ();
	inc	(hl)
	jp	_p_cdesign_showKey
00104$:
;umgebung.c:102: else if (v_skey > 2) {
	ld	a, #0x02
	ld	hl, #_v_skey
	sub	a, (hl)
	ret	NC
;umgebung.c:103: p_text_viewTXT (nichtnuetzlich);
	ld	de, #_nichtnuetzlich
	jp	_p_text_viewTXT
00110$:
;umgebung.c:107: else if ((l_mk == v_smk) && (v_kiste [l_nr] == 1)) {
	ld	a, d
	or	a, a
	ret	Z
	ld	hl, #_v_kiste
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	dec	a
	ret	NZ
;umgebung.c:108: p_text_viewTXT (leer);
	ld	de, #_leer
;umgebung.c:110: }
	jp	_p_text_viewTXT
;umgebung.c:113: void p_umgebung_truheUhr (uint8_t l_mk, uint8_t l_nr) __nonbanked
;	---------------------------------
; Function p_umgebung_truheUhr
; ---------------------------------
_p_umgebung_truheUhr::
;umgebung.c:115: if ((l_mk == v_smk) && (v_kiste [l_nr] == 0)) {
	ld	hl, #_v_smk
	sub	a, (hl)
	ld	a, #0x01
	jr	Z, 00158$
	xor	a, a
00158$:
	ld	d, a
	or	a, a
	jr	Z, 00110$
	ld	a, #<(_v_kiste)
	add	a, e
	ld	c, a
	ld	a, #>(_v_kiste)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	or	a, a
	jr	NZ, 00110$
;umgebung.c:117: if (v_time < 245) {
	ld	a, (#_v_time)
	sub	a, #0xf5
	jr	NC, 00104$
;umgebung.c:118: p_text_viewTXT (uhr);
	push	bc
	ld	de, #_uhr
	call	_p_text_viewTXT
	pop	bc
;umgebung.c:120: v_kiste [l_nr] = 1; v_time += 10;
	ld	a, #0x01
	ld	(bc), a
	ld	a, (_v_time)
	add	a, #0x0a
;umgebung.c:121: p_cdesign_showTime ();
	ld	(#_v_time), a
	jp	_p_cdesign_showTime
00104$:
;umgebung.c:123: else if (v_time > 244) {
	ld	a, #0xf4
	ld	hl, #_v_time
	sub	a, (hl)
	ret	NC
;umgebung.c:124: p_text_viewTXT (nichtnuetzlich); 
	ld	de, #_nichtnuetzlich
	jp	_p_text_viewTXT
00110$:
;umgebung.c:127: else if ((l_mk == v_smk) && (v_kiste [l_nr] == 1)) {
	ld	a, d
	or	a, a
	ret	Z
	ld	hl, #_v_kiste
	ld	d, #0x00
	add	hl, de
	ld	a, (hl)
	dec	a
	ret	NZ
;umgebung.c:128: p_text_viewTXT (leer);
	ld	de, #_leer
;umgebung.c:130: }
	jp	_p_text_viewTXT
;umgebung.c:132: void p_umgebung_disables (void) __nonbanked
;	---------------------------------
; Function p_umgebung_disables
; ---------------------------------
_p_umgebung_disables::
;umgebung.c:133: {}
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
