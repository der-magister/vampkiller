;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module gegner
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _v_gegner_kolision
	.globl _p_engine_calcCoord
	.globl _p_gegner_init
	.globl _p_gegner_set
	.globl _p_gegner_move
	.globl _p_gegner_unset
	.globl _p_gegner_lvlset
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
;gegner.c:26: void p_gegner_init (void) __nonbanked
;	---------------------------------
; Function p_gegner_init
; ---------------------------------
_p_gegner_init::
;gegner.c:29: }
	ret
;gegner.c:39: void p_gegner_set (uint8_t l_nr, uint8_t l_sprnr, uint8_t l_xk, uint8_t l_yk, uint8_t l_lp, uint8_t l_ri) __nonbanked
;	---------------------------------
; Function p_gegner_set
; ---------------------------------
_p_gegner_set::
	add	sp, #-4
	ld	c, a
	ld	b, e
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	e, c
	ld	d, #0x00
	sla	e
	rl	d
	sla	e
	rl	d
	inc	sp
	inc	sp
	ld	l, e
	ld	h, d
	ld	de, #_shadow_OAM
	push	hl
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ld	a, b
	ld	(de), a
;gegner.c:42: v_gxk [l_nr] = l_xk; v_gyk [l_nr] = l_yk; v_glp [l_nr] = l_lp; v_gri [l_nr] = l_ri;
	ld	de, #_v_gxk
	ld	l, c
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	(de), a
	ld	a, #<(_v_gyk)
	add	a, c
	ld	e, a
	ld	a, #>(_v_gyk)
	adc	a, #0x00
	ld	d, a
	ld	a, (hl)
	ld	(de), a
	ld	hl, #_v_glp
	ld	b, #0x00
	add	hl, bc
	push	hl
	ldhl	sp,	#10
	ld	a, (hl)
	pop	hl
	ld	(hl), a
	ld	hl, #_v_gri
	ld	b, #0x00
	add	hl, bc
	push	hl
	ldhl	sp,	#11
	ld	a, (hl)
	pop	hl
	ld	(hl), a
;gegner.c:43: move_sprite (l_nr, v_gxk [l_nr], v_gyk [l_nr]);
	ld	a, (de)
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
	pop	hl
	push	hl
	add	hl, de
	ld	e, l
	ld	d, h
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;gegner.c:44: v_gegnertimer = 0;
	xor	a, a
	ld	(#_v_gegnertimer),a
;gegner.c:45: }
	add	sp, #4
	pop	hl
	add	sp, #4
	jp	(hl)
;gegner.c:48: uint8_t v_gegner_kolision (unsigned char l_tile) __nonbanked
;	---------------------------------
; Function v_gegner_kolision
; ---------------------------------
_v_gegner_kolision::
	ld	c, a
;gegner.c:52: for (l_i = 0; l_i != sizeof (v_kolidat) + 1; l_i++) {
	ld	d, #0x00
00104$:
;gegner.c:53: if (l_tile == v_kolidat [l_i]) return FALSE;
	ld	a, #<(_v_kolidat)
	add	a, d
	ld	l, a
	ld	a, #>(_v_kolidat)
	adc	a, #0x00
	ld	h, a
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00105$
	xor	a, a
	ret
00105$:
;gegner.c:52: for (l_i = 0; l_i != sizeof (v_kolidat) + 1; l_i++) {
	inc	d
	ld	a, d
	sub	a, #0x05
	jr	NZ, 00104$
;gegner.c:56: return TRUE;
	ld	a, #0x01
;gegner.c:57: }
	ret
;gegner.c:60: void p_gegner_move (void) __nonbanked
;	---------------------------------
; Function p_gegner_move
; ---------------------------------
_p_gegner_move::
	add	sp, #-7
;gegner.c:63: uint8_t l_walk = TRUE;
	ldhl	sp,	#0
	ld	(hl), #0x01
;gegner.c:65: v_gegnertimer = 0;
	xor	a, a
	ld	(#_v_gegnertimer),a
;gegner.c:67: for (l_i = 2; l_i <= 4; l_i++) {
	ldhl	sp,	#6
	ld	(hl), #0x02
00141$:
;gegner.c:68: v_gmk [l_i] = p_engine_calcCoord (v_gxk [l_i], v_gyk [l_i]);
	ld	de, #_v_gmk
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	c, l
	ld	b, h
	ld	de, #_v_gyk
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#3
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#2
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl+), a
	ld	de, #_v_gxk
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#5
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	push	bc
	ld	e, (hl)
	call	_p_engine_calcCoord
	pop	bc
	ld	(bc), a
;gegner.c:70: if (v_gri [l_i] == RIGHT) {
	ld	de, #_v_gri
	ldhl	sp,	#6
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#5
	ld	(hl), a
	ld	a, (hl)
	sub	a, #0x04
	jr	NZ, 00110$
;gegner.c:71: l_walk = v_gegner_kolision (v_lvldat [v_gmk [l_i] + 1]);
	ld	a, (bc)
	ld	b, #0x00
	ld	c, a
	inc	bc
	ld	hl, #_v_lvldat
	add	hl, bc
	ld	a, (hl)
	push	de
	call	_v_gegner_kolision
	ldhl	sp,	#2
	ld	(hl), a
	pop	de
	jr	00111$
00110$:
;gegner.c:73: else if (v_gri [l_i] == LEFT) {
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x03
	jr	NZ, 00107$
;gegner.c:74: l_walk = v_gegner_kolision (v_lvldat [v_gmk [l_i] - 1]);	
	ld	a, (bc)
	ld	b, #0x00
	ld	c, a
	dec	bc
	ld	hl, #_v_lvldat
	add	hl, bc
	ld	a, (hl)
	push	de
	call	_v_gegner_kolision
	ldhl	sp,	#2
	ld	(hl), a
	pop	de
	jr	00111$
00107$:
;gegner.c:76: else if (v_gri [l_i] == UP) {
	ldhl	sp,	#5
	ld	a, (hl)
	dec	a
	jr	NZ, 00104$
;gegner.c:77: l_walk = v_gegner_kolision (v_lvldat [v_gmk [l_i] - 18]);
	ld	a, (bc)
	ld	c, #0x00
	add	a, #0xee
	ld	l, a
	ld	a, c
	adc	a, #0xff
	ld	h, a
	ld	bc, #_v_lvldat
	add	hl, bc
	ld	a, (hl)
	push	de
	call	_v_gegner_kolision
	ldhl	sp,	#2
	ld	(hl), a
	pop	de
	jr	00111$
00104$:
;gegner.c:79: else if (v_gri [l_i] == DOWN) {
	ldhl	sp,	#5
	ld	a, (hl)
	sub	a, #0x02
	jr	NZ, 00111$
;gegner.c:80: l_walk = v_gegner_kolision (v_lvldat [v_gmk [l_i] + 18]);
	ld	a, (bc)
	ld	h, #0x00
	ld	l, a
	ld	bc, #0x0012
	add	hl, bc
	ld	bc, #_v_lvldat
	add	hl, bc
	ld	a, (hl)
	push	de
	call	_v_gegner_kolision
	ldhl	sp,	#2
	ld	(hl), a
	pop	de
00111$:
;gegner.c:82: if (l_walk == TRUE) {
	ldhl	sp,	#0
	ld	a, (hl)
	dec	a
	jr	NZ, 00137$
;gegner.c:83: if (v_gri [l_i] == RIGHT) v_gxk [l_i] += 8;
	ld	a, (de)
	cp	a, #0x04
	jr	NZ, 00121$
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	add	a, #0x08
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00122$
00121$:
;gegner.c:84: else if (v_gri [l_i] == LEFT) v_gxk [l_i] -= 8;
	cp	a, #0x03
	jr	NZ, 00118$
	ldhl	sp,#3
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	ld	a, (de)
	add	a, #0xf8
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00122$
00118$:
;gegner.c:68: v_gmk [l_i] = p_engine_calcCoord (v_gxk [l_i], v_gyk [l_i]);
	ldhl	sp,#1
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	af
	ld	a, (de)
	ld	c, a
	pop	af
;gegner.c:85: else if (v_gri [l_i] == UP) v_gyk [l_i] -= 8;
	cp	a, #0x01
	jr	NZ, 00115$
	dec	hl
	ld	a, c
	add	a, #0xf8
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
	jr	00122$
00115$:
;gegner.c:86: else if (v_gri [l_i] == DOWN) v_gyk [l_i] += 8;
	sub	a, #0x02
	jr	NZ, 00122$
	ld	a, c
	add	a, #0x08
	ldhl	sp,	#1
	ld	e, (hl)
	inc	hl
	ld	h, (hl)
	ld	l, e
	ld	(hl), a
00122$:
;gegner.c:88: move_sprite (l_i, v_gxk [l_i], v_gyk [l_i]);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, (de)
	ld	c, a
	ld	e, (hl)
	ld	d, #0x00
	ld	l, e
	ld	h, d
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;gegner.c:88: move_sprite (l_i, v_gxk [l_i], v_gyk [l_i]);
	jr	00142$
00137$:
;gegner.c:90: else if (l_walk == FALSE) {
	ldhl	sp,	#0
	ld	a, (hl)
	or	a, a
	jr	NZ, 00142$
;gegner.c:91: if (v_gri [l_i] == RIGHT) v_gri [l_i] = LEFT;
	ld	a, (de)
	cp	a, #0x04
	jr	NZ, 00132$
	ld	a, #0x03
	ld	(de), a
	jr	00142$
00132$:
;gegner.c:92: else if (v_gri [l_i] == LEFT) v_gri [l_i] = RIGHT;
	cp	a, #0x03
	jr	NZ, 00129$
	ld	a, #0x04
	ld	(de), a
	jr	00142$
00129$:
;gegner.c:93: else if (v_gri [l_i] == UP) v_gri [l_i] = DOWN;
	cp	a, #0x01
	jr	NZ, 00126$
	ld	a, #0x02
	ld	(de), a
	jr	00142$
00126$:
;gegner.c:94: else if (v_gri [l_i] == DOWN) v_gri [l_i] = UP;
	sub	a, #0x02
	jr	NZ, 00142$
	ld	a, #0x01
	ld	(de), a
00142$:
;gegner.c:67: for (l_i = 2; l_i <= 4; l_i++) {
	ldhl	sp,	#6
	inc	(hl)
	ld	a, #0x04
	sub	a, (hl)
	jp	NC, 00141$
;gegner.c:97: } 
	add	sp, #7
	ret
;gegner.c:100: void p_gegner_unset (void) __nonbanked
;	---------------------------------
; Function p_gegner_unset
; ---------------------------------
_p_gegner_unset::
;gegner.c:102: v_gegnertimer = 255;
	ld	hl, #_v_gegnertimer
	ld	(hl), #0xff
;gegner.c:104: p_gegner_set (2, 0, 0, 0, 0, QUIT);
	xor	a, a
	rrca
	push	af
	xor	a, a
	rrca
	push	af
	ld	e, #0x00
	ld	a, #0x02
	call	_p_gegner_set
;gegner.c:105: p_gegner_set (3, 0, 0, 0, 0, QUIT);
	xor	a, a
	rrca
	push	af
	xor	a, a
	rrca
	push	af
	ld	e, #0x00
	ld	a, #0x03
	call	_p_gegner_set
;gegner.c:106: p_gegner_set (4, 0, 0, 0, 0, QUIT);
	xor	a, a
	rrca
	push	af
	xor	a, a
	rrca
	push	af
	ld	e, #0x00
	ld	a, #0x04
	call	_p_gegner_set
;gegner.c:107: }
	ret
;gegner.c:110: void p_gegner_lvlset (void) __nonbanked
;	---------------------------------
; Function p_gegner_lvlset
; ---------------------------------
_p_gegner_lvlset::
;gegner.c:112: p_gegner_unset ();
	call	_p_gegner_unset
;gegner.c:114: if (v_room == 3) {
	ld	a, (#_v_room)
	sub	a, #0x03
	jr	NZ, 00131$
;gegner.c:115: p_gegner_set (2, 1, 144, 80, 1, LEFT);
	ld	hl, #0x301
	push	hl
	ld	hl, #0x5090
	push	hl
	ld	e, #0x01
	ld	a, #0x02
	call	_p_gegner_set
;gegner.c:116: p_gegner_set (3, 1, 24, 40, 1, RIGHT);
	ld	hl, #0x401
	push	hl
	ld	hl, #0x2818
	push	hl
	ld	e, #0x01
	ld	a, #0x03
	call	_p_gegner_set
	ret
00131$:
;gegner.c:118: else if (v_room == 4) {
	ld	a, (#_v_room)
	sub	a, #0x04
	jr	NZ, 00128$
;gegner.c:119: p_gegner_set (2, 1, 48, 32, 1, UP);
	ld	hl, #0x101
	push	hl
	ld	hl, #0x2030
	push	hl
	ld	e, #0x01
	ld	a, #0x02
	call	_p_gegner_set
;gegner.c:120: p_gegner_set (3, 1, 88, 72, 1, DOWN);
	ld	hl, #0x201
	push	hl
	ld	hl, #0x4858
	push	hl
	ld	e, #0x01
	ld	a, #0x03
	call	_p_gegner_set
;gegner.c:121: p_gegner_set (4, 1, 144, 64, 1, LEFT);	
	ld	hl, #0x301
	push	hl
	ld	hl, #0x4090
	push	hl
	ld	e, #0x01
	ld	a, #0x04
	call	_p_gegner_set
	ret
00128$:
;gegner.c:123: else if (v_room == 5) {
	ld	a, (#_v_room)
	sub	a, #0x05
	jr	NZ, 00125$
;gegner.c:124: p_gegner_set (2, 1, 136, 32, 1, DOWN);
	ld	hl, #0x201
	push	hl
	ld	hl, #0x2088
	push	hl
	ld	e, #0x01
	ld	a, #0x02
	call	_p_gegner_set
;gegner.c:125: p_gegner_set (3, 1, 40, 112, 1, UP);
	ld	hl, #0x101
	push	hl
	ld	hl, #0x7028
	push	hl
	ld	e, #0x01
	ld	a, #0x03
	call	_p_gegner_set
	ret
00125$:
;gegner.c:127: else if (v_room == 6) {
	ld	a, (#_v_room)
	sub	a, #0x06
	jr	NZ, 00122$
;gegner.c:128: p_gegner_set (2, 1, 40, 112, 1, DOWN);
	ld	hl, #0x201
	push	hl
	ld	hl, #0x7028
	push	hl
	ld	e, #0x01
	ld	a, #0x02
	call	_p_gegner_set
	ret
00122$:
;gegner.c:130: else if (v_room == 7) {
	ld	a, (#_v_room)
	sub	a, #0x07
	jr	NZ, 00119$
;gegner.c:131: p_gegner_set (2, 1, 64, 32, 1, DOWN);
	ld	hl, #0x201
	push	hl
	ld	hl, #0x2040
	push	hl
	ld	e, #0x01
	ld	a, #0x02
	call	_p_gegner_set
;gegner.c:132: p_gegner_set (3, 1, 112, 120, 1, UP);
	ld	hl, #0x101
	push	hl
	ld	hl, #0x7870
	push	hl
	ld	e, #0x01
	ld	a, #0x03
	call	_p_gegner_set
	ret
00119$:
;gegner.c:134: else if (v_room == 8) {
	ld	a, (#_v_room)
	sub	a, #0x08
	jr	NZ, 00116$
;gegner.c:135: p_gegner_set (2, 2, 112, 120, 1, UP);
	ld	hl, #0x101
	push	hl
	ld	hl, #0x7870
	push	hl
	ld	a,#0x02
	ld	e,a
	call	_p_gegner_set
;gegner.c:136: p_gegner_set (3, 2, 40, 56, 1, DOWN);
	ld	hl, #0x201
	push	hl
	ld	hl, #0x3828
	push	hl
	ld	e, #0x02
	ld	a, #0x03
	call	_p_gegner_set
	ret
00116$:
;gegner.c:138: else if (v_room == 9)  {
	ld	a, (#_v_room)
	sub	a, #0x09
	jr	NZ, 00113$
;gegner.c:139: p_gegner_set (2, 2, 80, 56, 1, LEFT);
	ld	hl, #0x301
	push	hl
	ld	hl, #0x3850
	push	hl
	ld	a,#0x02
	ld	e,a
	call	_p_gegner_set
;gegner.c:140: p_gegner_set (3, 2, 136, 112, 2, RIGHT);	
	ld	hl, #0x402
	push	hl
	ld	hl, #0x7088
	push	hl
	ld	e, #0x02
	ld	a, #0x03
	call	_p_gegner_set
	ret
00113$:
;gegner.c:142: else if (v_room == 10) {
	ld	a, (#_v_room)
	sub	a, #0x0a
	jr	NZ, 00110$
;gegner.c:143: p_gegner_set (2, 2, 32, 80, 1, RIGHT);
	ld	hl, #0x401
	push	hl
	ld	hl, #0x5020
	push	hl
	ld	a,#0x02
	ld	e,a
	call	_p_gegner_set
;gegner.c:144: p_gegner_set (3, 1, 144, 80, 1, LEFT);
	ld	hl, #0x301
	push	hl
	ld	hl, #0x5090
	push	hl
	ld	e, #0x01
	ld	a, #0x03
	call	_p_gegner_set
;gegner.c:145: p_gegner_set (4, 1, 80, 120, 1, UP);	
	ld	hl, #0x101
	push	hl
	ld	hl, #0x7850
	push	hl
	ld	e, #0x01
	ld	a, #0x04
	call	_p_gegner_set
	ret
00110$:
;gegner.c:147: else if (v_room == 11) {
	ld	a, (#_v_room)
	sub	a, #0x0b
	jr	NZ, 00107$
;gegner.c:148: p_gegner_set (2, 2, 48, 120, 1, UP);
	ld	hl, #0x101
	push	hl
	ld	hl, #0x7830
	push	hl
	ld	a,#0x02
	ld	e,a
	call	_p_gegner_set
;gegner.c:149: p_gegner_set (3, 1, 96, 32, 1, RIGHT);
	ld	hl, #0x401
	push	hl
	ld	hl, #0x2060
	push	hl
	ld	e, #0x01
	ld	a, #0x03
	call	_p_gegner_set
;gegner.c:150: p_gegner_set (4, 2, 88, 40, 1, DOWN);	
	ld	hl, #0x201
	push	hl
	ld	hl, #0x2858
	push	hl
	ld	e, #0x02
	ld	a, #0x04
	call	_p_gegner_set
	ret
00107$:
;gegner.c:152: else if (v_room == 12) {
	ld	a, (#_v_room)
	sub	a, #0x0c
	jr	NZ, 00104$
;gegner.c:153: p_gegner_set (2, 1, 88, 80, 1, DOWN);
	ld	hl, #0x201
	push	hl
	ld	hl, #0x5058
	push	hl
	ld	e, #0x01
	ld	a, #0x02
	call	_p_gegner_set
;gegner.c:154: p_gegner_set (3, 2, 144, 72, 1, LEFT);
	ld	hl, #0x301
	push	hl
	ld	hl, #0x4890
	push	hl
	ld	e, #0x02
	ld	a, #0x03
	call	_p_gegner_set
;gegner.c:155: p_gegner_set (4, 1, 48, 120, 1, UP);
	ld	hl, #0x101
	push	hl
	ld	hl, #0x7830
	push	hl
	ld	e, #0x01
	ld	a, #0x04
	call	_p_gegner_set
	ret
00104$:
;gegner.c:157: else if (v_room == 13) {
	ld	a, (#_v_room)
	sub	a, #0x0d
	ret	NZ
;gegner.c:158: p_gegner_set (2, 2, 64, 80, 1, RIGHT);
	ld	hl, #0x401
	push	hl
	ld	hl, #0x5040
	push	hl
	ld	a,#0x02
	ld	e,a
	call	_p_gegner_set
;gegner.c:159: p_gegner_set (3, 2, 144, 48, 1, LEFT);
	ld	hl, #0x301
	push	hl
	ld	hl, #0x3090
	push	hl
	ld	e, #0x02
	ld	a, #0x03
	call	_p_gegner_set
;gegner.c:160: p_gegner_set (4, 2, 24, 112, 1, RIGHT);	
	ld	hl, #0x401
	push	hl
	ld	hl, #0x7018
	push	hl
	ld	e, #0x02
	ld	a, #0x04
	call	_p_gegner_set
;gegner.c:162: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
