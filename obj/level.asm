;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module level
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _p_gegner_lvlset
	.globl _p_umgebung_tuerzu
	.globl _p_umgebung_truheUhr
	.globl _p_umgebung_truheHerz
	.globl _p_umgebung_truheWeihwasser
	.globl _p_umgebung_truheEispflock
	.globl _p_umgebung_schild
	.globl _p_engine_showMap
	.globl _p_engine_loadMap
	.globl _p_player_setSprite
	.globl _delay
	.globl _p_level_init
	.globl _p_level_changeRoom
	.globl _p_level_room1
	.globl _p_level_room2
	.globl _p_level_room3
	.globl _p_level_room4
	.globl _p_level_room5
	.globl _p_level_room6
	.globl _p_level_room7
	.globl _p_level_room8
	.globl _p_level_room9
	.globl _p_level_room10
	.globl _p_level_room11
	.globl _p_level_room12
	.globl _p_level_room13
	.globl _p_level_room14
	.globl _p_level_room17
	.globl _p_level_control
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
;level.c:34: void p_level_init (void) __nonbanked
;	---------------------------------
; Function p_level_init
; ---------------------------------
_p_level_init::
;level.c:36: v_room = 1;
	ld	hl, #_v_room
	ld	(hl), #0x01
;level.c:37: }
	ret
;level.c:44: void p_level_changeRoom (uint8_t l_room, uint8_t l_sxk, uint8_t l_syk) __nonbanked
;	---------------------------------
; Function p_level_changeRoom
; ---------------------------------
_p_level_changeRoom::
	ld	l, a
;level.c:46: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;level.c:47: HIDE_BKG;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfe
	ldh	(_LCDC_REG + 0), a
;level.c:48: v_angriff = FALSE; v_angriffstimer = 0;
	xor	a, a
	ld	(_v_angriff), a
	ld	(_v_angriffstimer), a
;level.c:49: v_room = l_room;				
	ld	a, l
	ld	(_v_room), a
;level.c:50: v_sxk = l_sxk;
	ld	hl, #_v_sxk
	ld	(hl), e
;level.c:51: v_syk = l_syk;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_v_syk),a
;level.c:53: p_player_setSprite ();
	call	_p_player_setSprite
;level.c:54: v_movetimer = 0;
	xor	a, a
	ld	(#_v_movetimer),a
;level.c:55: delay (160);
	ld	de, #0x00a0
	call	_delay
;level.c:56: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;level.c:57: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
;level.c:58: v_angriff = TRUE;
	ld	hl, #_v_angriff
	ld	(hl), #0x01
;level.c:59: p_gegner_lvlset ();
	call	_p_gegner_lvlset
;level.c:60: }
	pop	hl
	inc	sp
	jp	(hl)
;level.c:63: void p_level_room1 (void) __nonbanked
;	---------------------------------
; Function p_level_room1
; ---------------------------------
_p_level_room1::
;level.c:65: if (v_smk == 8) { 
	ld	a, (#_v_smk)
	sub	a, #0x08
	jr	NZ, 00102$
;level.c:66: p_engine_loadMap (room2);
	ld	de, #_room2+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:67: p_engine_showMap (room2);
	call	_p_engine_showMap
;level.c:68: p_level_changeRoom (2, v_sxk, 128); 		
	ld	a, #0x80
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x02
	call	_p_level_changeRoom
00102$:
;level.c:70: p_umgebung_schild (46, shield1);
	ld	de, #_shield1
	ld	a, #0x2e
;level.c:71: }
	jp	_p_umgebung_schild
;level.c:74: void p_level_room2 (void) __nonbanked
;	---------------------------------
; Function p_level_room2
; ---------------------------------
_p_level_room2::
;level.c:76: if (v_smk == 242) {
	ld	a, (#_v_smk)
	sub	a, #0xf2
	jr	NZ, 00105$
;level.c:77: p_engine_loadMap (room1);
	ld	de, #_room1+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:78: p_engine_showMap (room1);
	call	_p_engine_showMap
;level.c:79: p_level_changeRoom (1, v_sxk, 24);
	ld	a, #0x18
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x01
	call	_p_level_changeRoom
	jr	00106$
00105$:
;level.c:81: else if ((v_smk == 8) && (v_tuer [0] == TRUE)) {
	ld	a, (#_v_smk)
	sub	a, #0x08
	jr	NZ, 00106$
	ld	a, (#_v_tuer + 0)
	dec	a
	jr	NZ, 00106$
;level.c:82: p_engine_loadMap (room3);
	ld	de, #_room3
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:83: p_engine_showMap (room3);
	call	_p_engine_showMap
;level.c:84: p_level_changeRoom (3, v_sxk, 128);
	ld	a, #0x80
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x03
	call	_p_level_changeRoom
00106$:
;level.c:86: p_umgebung_truheEispflock (52, 1);
	ld	e, #0x01
	ld	a, #0x34
	call	_p_umgebung_truheEispflock
;level.c:88: if (v_tuer [0] == FALSE) { p_umgebung_tuerzu (8, 0); }
	ld	a, (#_v_tuer + 0)
	or	a, a
	ret	NZ
	ld	e, a
	ld	a, #0x08
;level.c:89: }
	jp	_p_umgebung_tuerzu
;level.c:92: void p_level_room3 (void) __nonbanked
;	---------------------------------
; Function p_level_room3
; ---------------------------------
_p_level_room3::
;level.c:94: if (v_smk == 125) {
	ld	a, (#_v_smk)
	sub	a, #0x7d
	jr	NZ, 00104$
;level.c:95: p_engine_loadMap (room4);
	ld	de, #_room4+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:96: p_engine_showMap (room4);
	call	_p_engine_showMap
;level.c:97: p_level_changeRoom (4, 16, v_syk);
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x10
	ld	a, #0x04
	call	_p_level_changeRoom
	ret
00104$:
;level.c:99: else if (v_smk == 242) {
	ld	a, (#_v_smk)
	sub	a, #0xf2
	ret	NZ
;level.c:100: p_engine_loadMap (room2);
	ld	de, #_room2
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:101: p_engine_showMap (room2);
	call	_p_engine_showMap
;level.c:102: p_level_changeRoom (2, v_sxk, 24);
	ld	a, #0x18
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x02
	call	_p_level_changeRoom
;level.c:104: }
	ret
;level.c:107: void p_level_room4 (void) __nonbanked
;	---------------------------------
; Function p_level_room4
; ---------------------------------
_p_level_room4::
;level.c:109: if (v_smk == 108) {
	ld	a, (#_v_smk)
	sub	a, #0x6c
	jr	NZ, 00104$
;level.c:110: p_engine_loadMap (room3);
	ld	de, #_room3+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:111: p_engine_showMap (room3);
	call	_p_engine_showMap
;level.c:112: p_level_changeRoom (3, 152, v_syk);
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x98
	ld	a, #0x03
	call	_p_level_changeRoom
	ret
00104$:
;level.c:114: else if (v_smk == 125) {
	ld	a, (#_v_smk)
	sub	a, #0x7d
	ret	NZ
;level.c:115: p_engine_loadMap (room5);
	ld	de, #_room5
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:116: p_engine_showMap (room5);
	call	_p_engine_showMap
;level.c:117: p_level_changeRoom (5, 16, v_syk);
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x10
	ld	a, #0x05
	call	_p_level_changeRoom
;level.c:119: }
	ret
;level.c:122: void p_level_room5 (void) __nonbanked
;	---------------------------------
; Function p_level_room5
; ---------------------------------
_p_level_room5::
;level.c:124: if (v_smk == 108) {
	ld	a, (#_v_smk)
	sub	a, #0x6c
	jr	NZ, 00104$
;level.c:125: p_engine_loadMap (room4);
	ld	de, #_room4+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:126: p_engine_showMap (room4);
	call	_p_engine_showMap
;level.c:127: p_level_changeRoom (4, 152, v_syk);
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x98
	ld	a, #0x04
	call	_p_level_changeRoom
	jr	00105$
00104$:
;level.c:130: else if (v_smk == 8) {
	ld	a, (#_v_smk)
	sub	a, #0x08
	jr	NZ, 00105$
;level.c:131: p_engine_loadMap (room6);
	ld	de, #_room6
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:132: p_engine_showMap (room6);
	call	_p_engine_showMap
;level.c:133: p_level_changeRoom (6, v_sxk, 128);
	ld	a, #0x80
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x06
	call	_p_level_changeRoom
00105$:
;level.c:135: p_umgebung_truheWeihwasser (231, 2);
	ld	e, #0x02
	ld	a, #0xe7
;level.c:136: }
	jp	_p_umgebung_truheWeihwasser
;level.c:139: void p_level_room6 (void) __nonbanked
;	---------------------------------
; Function p_level_room6
; ---------------------------------
_p_level_room6::
;level.c:141: if (v_smk == 242) {
	ld	a, (#_v_smk)
	sub	a, #0xf2
	jr	NZ, 00107$
;level.c:142: p_engine_loadMap (room5);
	ld	de, #_room5+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:143: p_engine_showMap (room5);
	call	_p_engine_showMap
;level.c:144: p_level_changeRoom (5, v_sxk, 24);
	ld	a, #0x18
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x05
	call	_p_level_changeRoom
	ret
00107$:
;level.c:146: else if (v_smk == 108) {
	ld	a, (#_v_smk)
	sub	a, #0x6c
	jr	NZ, 00104$
;level.c:147: p_engine_loadMap (room7);
	ld	de, #_room7+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:148: p_engine_showMap (room7);
	call	_p_engine_showMap
;level.c:149: p_level_changeRoom (7, 152, v_syk);
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x98
	ld	a, #0x07
	call	_p_level_changeRoom
	ret
00104$:
;level.c:151: else if (v_smk == 89) {
	ld	a, (#_v_smk)
	sub	a, #0x59
	ret	NZ
;level.c:152: p_engine_loadMap (room17);
	ld	de, #_room17
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:153: p_engine_showMap (room17);
	call	_p_engine_showMap
;level.c:154: p_level_changeRoom (17, 72, v_syk);	
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x48
	ld	a, #0x11
	call	_p_level_changeRoom
;level.c:156: }
	ret
;level.c:159: void p_level_room7 (void) __nonbanked
;	---------------------------------
; Function p_level_room7
; ---------------------------------
_p_level_room7::
;level.c:161: if (v_smk == 125) {
	ld	a, (#_v_smk)
	sub	a, #0x7d
	jr	NZ, 00104$
;level.c:162: p_engine_loadMap (room6);
	ld	de, #_room6+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:163: p_engine_showMap (room6);
	call	_p_engine_showMap
;level.c:164: p_level_changeRoom (6, 16, v_syk);
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x10
	ld	a, #0x06
	call	_p_level_changeRoom
	ret
00104$:
;level.c:166: else if (v_smk == 108) {
	ld	a, (#_v_smk)
	sub	a, #0x6c
	ret	NZ
;level.c:167: p_engine_loadMap (room8);
	ld	de, #_room8
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:168: p_engine_showMap (room8);
	call	_p_engine_showMap
;level.c:170: p_level_changeRoom (8, 152, v_syk);
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x98
	ld	a, #0x08
	call	_p_level_changeRoom
;level.c:172: }
	ret
;level.c:175: void p_level_room8 (void) __nonbanked
;	---------------------------------
; Function p_level_room8
; ---------------------------------
_p_level_room8::
;level.c:177: if (v_smk == 125) {
	ld	a, (#_v_smk)
	sub	a, #0x7d
	jr	NZ, 00104$
;level.c:178: p_engine_loadMap (room7);
	ld	de, #_room7+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:179: p_engine_showMap (room7);
	call	_p_engine_showMap
;level.c:180: p_level_changeRoom (7, 16, v_syk);
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x10
	ld	a, #0x07
	call	_p_level_changeRoom
	ret
00104$:
;level.c:182: else if (v_smk == 8) {
	ld	a, (#_v_smk)
	sub	a, #0x08
	ret	NZ
;level.c:183: p_engine_loadMap (room9);
	ld	de, #_room9
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:184: p_engine_showMap (room9);
	call	_p_engine_showMap
;level.c:185: p_level_changeRoom (9, v_sxk, 128);	
	ld	a, #0x80
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x09
	call	_p_level_changeRoom
;level.c:187: }
	ret
;level.c:190: void p_level_room9 (void) __nonbanked
;	---------------------------------
; Function p_level_room9
; ---------------------------------
_p_level_room9::
;level.c:192: if (v_smk == 242)
	ld	a, (#_v_smk)
	sub	a, #0xf2
	jr	NZ, 00104$
;level.c:194: p_engine_loadMap (room8);
	ld	de, #_room8+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:195: p_engine_showMap (room8);
	call	_p_engine_showMap
;level.c:196: p_level_changeRoom (8, v_sxk, 24);	
	ld	a, #0x18
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x08
	call	_p_level_changeRoom
	jr	00105$
00104$:
;level.c:198: else if (v_smk == 5) {
	ld	a, (#_v_smk)
	sub	a, #0x05
	jr	NZ, 00105$
;level.c:199: p_engine_loadMap (room10);
	ld	de, #_room10
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:200: p_engine_showMap (room10);
	call	_p_engine_showMap
;level.c:201: p_level_changeRoom (10, v_sxk, 128);	
	ld	a, #0x80
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x0a
	call	_p_level_changeRoom
00105$:
;level.c:203: p_umgebung_truheHerz (199, 3);
	ld	e, #0x03
	ld	a, #0xc7
;level.c:204: }
	jp	_p_umgebung_truheHerz
;level.c:207: void p_level_room10 (void) __nonbanked
;	---------------------------------
; Function p_level_room10
; ---------------------------------
_p_level_room10::
;level.c:209: if (v_smk == 239)
	ld	a, (#_v_smk)
	sub	a, #0xef
	jr	NZ, 00104$
;level.c:211: p_engine_loadMap (room9);
	ld	de, #_room9+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:212: p_engine_showMap (room9);
	call	_p_engine_showMap
;level.c:213: p_level_changeRoom (9, v_sxk, 24);	
	ld	a, #0x18
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x09
	call	_p_level_changeRoom
	ret
00104$:
;level.c:215: else if (v_smk == 179) {
	ld	a, (#_v_smk)
	sub	a, #0xb3
	ret	NZ
;level.c:216: p_engine_loadMap (room11);
	ld	de, #_room11
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:217: p_engine_showMap (room11);
	call	_p_engine_showMap
;level.c:218: p_level_changeRoom (11, 16, v_syk);	
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x10
	ld	a, #0x0b
	call	_p_level_changeRoom
;level.c:220: }
	ret
;level.c:223: void p_level_room11 (void) __nonbanked
;	---------------------------------
; Function p_level_room11
; ---------------------------------
_p_level_room11::
;level.c:225: if (v_smk == 162) {
	ld	a, (#_v_smk)
	sub	a, #0xa2
	jr	NZ, 00104$
;level.c:226: p_engine_loadMap (room10);
	ld	de, #_room10+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:227: p_engine_showMap (room10);
	call	_p_engine_showMap
;level.c:228: p_level_changeRoom (10, 152, v_syk);	
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x98
	ld	a, #0x0a
	call	_p_level_changeRoom
	ret
00104$:
;level.c:230: else if (v_smk == 179) {
	ld	a, (#_v_smk)
	sub	a, #0xb3
	ret	NZ
;level.c:231: p_engine_loadMap (room12);
	ld	de, #_room12
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:232: p_engine_showMap (room12);
	call	_p_engine_showMap
;level.c:233: p_level_changeRoom (12, 16, v_syk);		
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x10
	ld	a, #0x0c
	call	_p_level_changeRoom
;level.c:235: }
	ret
;level.c:238: void p_level_room12 (void) __nonbanked
;	---------------------------------
; Function p_level_room12
; ---------------------------------
_p_level_room12::
;level.c:240: if (v_smk == 162) {
	ld	a, (#_v_smk)
	sub	a, #0xa2
	jr	NZ, 00104$
;level.c:241: p_engine_loadMap (room11);
	ld	de, #_room11+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:242: p_engine_showMap (room11);
	call	_p_engine_showMap
;level.c:243: p_level_changeRoom (11, 152, v_syk);	
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x98
	ld	a, #0x0b
	call	_p_level_changeRoom
	jr	00105$
00104$:
;level.c:245: else if (v_smk == 245) {
	ld	a, (#_v_smk)
	sub	a, #0xf5
	jr	NZ, 00105$
;level.c:246: p_engine_loadMap (room13);
	ld	de, #_room13
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:247: p_engine_showMap (room13);
	call	_p_engine_showMap
;level.c:248: p_level_changeRoom (13, v_sxk, 24);	
	ld	a, #0x18
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x0d
	call	_p_level_changeRoom
00105$:
;level.c:251: p_umgebung_truheUhr (63, 4);
	ld	e, #0x04
	ld	a, #0x3f
;level.c:253: }
	jp	_p_umgebung_truheUhr
;level.c:256: void p_level_room13 (void) __nonbanked
;	---------------------------------
; Function p_level_room13
; ---------------------------------
_p_level_room13::
;level.c:258: if (v_smk == 11) {
	ld	a, (#_v_smk)
	sub	a, #0x0b
	jr	NZ, 00104$
;level.c:259: p_engine_loadMap (room12);
	ld	de, #_room12+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:260: p_engine_showMap (room12);
	call	_p_engine_showMap
;level.c:261: p_level_changeRoom (12, v_sxk, 128);		
	ld	a, #0x80
	push	af
	inc	sp
	ld	a, (_v_sxk)
	ld	e, a
	ld	a, #0x0c
	call	_p_level_changeRoom
	ret
00104$:
;level.c:263: else if (v_smk == 125) {
	ld	a, (#_v_smk)
	sub	a, #0x7d
	ret	NZ
;level.c:264: p_engine_loadMap (room14);
	ld	de, #_room14
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:265: p_engine_showMap (room14);
	call	_p_engine_showMap
;level.c:266: p_level_changeRoom (14, 16, v_syk);	
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x10
	ld	a, #0x0e
	call	_p_level_changeRoom
;level.c:268: }
	ret
;level.c:271: void p_level_room14 (void) __nonbanked
;	---------------------------------
; Function p_level_room14
; ---------------------------------
_p_level_room14::
;level.c:273: if (v_smk == 162) {
	ld	a, (#_v_smk)
	sub	a, #0xa2
	jr	NZ, 00104$
;level.c:274: p_engine_loadMap (room13);
	ld	de, #_room13+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:275: p_engine_showMap (room13);
	call	_p_engine_showMap
;level.c:276: p_level_changeRoom (13, 152, v_syk);	
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x98
	ld	a, #0x0d
	call	_p_level_changeRoom
	ret
00104$:
;level.c:278: else if (v_smk == 125) {
	ld	a, (#_v_smk)
	sub	a, #0x7d
	ret	NZ
;level.c:279: p_engine_loadMap (room15);
	ld	de, #_room15
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:280: p_engine_showMap (room15);
	call	_p_engine_showMap
;level.c:281: p_level_changeRoom (15, 16, v_syk);	
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x10
	ld	a, #0x0f
	call	_p_level_changeRoom
;level.c:283: }
	ret
;level.c:286: void p_level_room17 (void) __nonbanked
;	---------------------------------
; Function p_level_room17
; ---------------------------------
_p_level_room17::
;level.c:288: if (v_smk == 72) {
	ld	a, (#_v_smk)
	sub	a, #0x48
	jr	NZ, 00102$
;level.c:289: p_engine_loadMap (room6);
	ld	de, #_room6+0
	push	de
	call	_p_engine_loadMap
	pop	de
;level.c:290: p_engine_showMap (room6);
	call	_p_engine_showMap
;level.c:292: p_level_changeRoom (6, 152, v_syk);
	ld	a, (_v_syk)
	push	af
	inc	sp
	ld	e, #0x98
	ld	a, #0x06
	call	_p_level_changeRoom
00102$:
;level.c:294: p_umgebung_schild (142, schild2);
	ld	de, #_schild2
	ld	a, #0x8e
;level.c:295: }
	jp	_p_umgebung_schild
;level.c:299: void p_level_control (void) __nonbanked
;	---------------------------------
; Function p_level_control
; ---------------------------------
_p_level_control::
;level.c:301: if (v_room == 1) p_level_room1 ();
	ld	a, (#_v_room)
	dec	a
	jp	Z, _p_level_room1
;level.c:302: else if (v_room == 2) p_level_room2 ();
	ld	a, (#_v_room)
	sub	a, #0x02
	jp	Z, _p_level_room2
;level.c:303: else if (v_room == 3) p_level_room3 ();
	ld	a, (#_v_room)
	sub	a, #0x03
	jp	Z, _p_level_room3
;level.c:304: else if (v_room == 4) p_level_room4 ();
	ld	a, (#_v_room)
	sub	a, #0x04
	jp	Z, _p_level_room4
;level.c:305: else if (v_room == 5) p_level_room5 ();
	ld	a, (#_v_room)
	sub	a, #0x05
	jp	Z, _p_level_room5
;level.c:306: else if (v_room == 6) p_level_room6 ();
	ld	a, (#_v_room)
	sub	a, #0x06
	jp	Z, _p_level_room6
;level.c:307: else if (v_room == 7) p_level_room7 ();
	ld	a, (#_v_room)
	sub	a, #0x07
	jp	Z, _p_level_room7
;level.c:308: else if (v_room == 8) p_level_room8 ();
	ld	a, (#_v_room)
	sub	a, #0x08
	jp	Z, _p_level_room8
;level.c:309: else if (v_room == 9) p_level_room9 ();
	ld	a, (#_v_room)
	sub	a, #0x09
	jp	Z, _p_level_room9
;level.c:310: else if (v_room == 10) p_level_room10 ();
	ld	a, (#_v_room)
	sub	a, #0x0a
	jp	Z, _p_level_room10
;level.c:311: else if (v_room == 11) p_level_room11 ();
	ld	a, (#_v_room)
	sub	a, #0x0b
	jp	Z, _p_level_room11
;level.c:312: else if (v_room == 12) p_level_room12 ();
	ld	a, (#_v_room)
	sub	a, #0x0c
	jp	Z, _p_level_room12
;level.c:313: else if (v_room == 13) p_level_room13 ();
	ld	a, (#_v_room)
	sub	a, #0x0d
	jp	Z, _p_level_room13
;level.c:314: else if (v_room == 14) p_level_room14 ();
	ld	a, (#_v_room)
	sub	a, #0x0e
	jp	Z, _p_level_room14
;level.c:316: else if (v_room == 17) p_level_room17 ();
	ld	a, (#_v_room)
	sub	a, #0x11
	jp	Z, _p_level_room17
;level.c:317: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
