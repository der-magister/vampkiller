;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler
; Version 4.5.1 #15267 (Linux)
;--------------------------------------------------------
	.module player
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _p_engine_calcCoord
	.globl _p_player_init
	.globl _p_player_setSprite
	.globl _v_player_kolision
	.globl _p_player_move
	.globl _p_player_attack
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
;player.c:27: void p_player_init (void) __nonbanked
;	---------------------------------
; Function p_player_init
; ---------------------------------
_p_player_init::
;player.c:30: v_slp = 3; v_skey = 0; v_sweih = 0; v_pflock = FALSE; 
	ld	hl, #_v_slp
	ld	(hl), #0x03
	xor	a, a
	ld	(#_v_skey), a
	ld	(#_v_sweih),a
	xor	a, a
	ld	(#_v_pflock),a
;player.c:31: v_sxk = 80; v_syk = 40; v_sri = UP;
	ld	hl, #_v_sxk
	ld	(hl), #0x50
	ld	hl, #_v_syk
	ld	(hl), #0x28
	ld	hl, #_v_sri
	ld	(hl), #0x01
;/opt/gbdk/include/gb/gb.h:1887: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 2)
	ld	(hl), #0x00
	ld	hl, #(_shadow_OAM + 6)
	ld	(hl), #0x03
;player.c:35: p_player_setSprite ();
;player.c:36: }
	jp	_p_player_setSprite
;player.c:39: void p_player_setSprite (void) __nonbanked
;	---------------------------------
; Function p_player_setSprite
; ---------------------------------
_p_player_setSprite::
;player.c:41: move_sprite (0, v_sxk, v_syk);
	ld	a, (_v_syk)
	ld	b, a
	ld	a, (_v_sxk)
	ld	c, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;player.c:42: v_smk = p_engine_calcCoord (v_sxk, v_syk);
	ld	a, (_v_syk)
	ld	e, a
	ld	a, (_v_sxk)
	call	_p_engine_calcCoord
	ld	(#_v_smk),a
;player.c:44: }
	ret
;player.c:47: uint8_t v_player_kolision (unsigned char l_tile) __nonbanked
;	---------------------------------
; Function v_player_kolision
; ---------------------------------
_v_player_kolision::
	ld	c, a
;player.c:51: for (l_i = 0; l_i != sizeof (v_kolidat) + 1; ++l_i) {
	ld	d, #0x00
00104$:
;player.c:52: if (l_tile == v_kolidat [l_i]) return FALSE;
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
;player.c:51: for (l_i = 0; l_i != sizeof (v_kolidat) + 1; ++l_i) {
	inc	d
	ld	a, d
	sub	a, #0x05
	jr	NZ, 00104$
;player.c:55: return TRUE;
	ld	a, #0x01
;player.c:56: }
	ret
;player.c:60: void p_player_move (uint8_t l_ri) __nonbanked
;	---------------------------------
; Function p_player_move
; ---------------------------------
_p_player_move::
	ld	c, a
;player.c:62: uint8_t l_walk = TRUE;
	ld	b, #0x01
;player.c:70: l_walk = v_player_kolision (v_lvldat [v_smk - 18]);
	ld	a, (_v_smk)
	ld	e, a
	ld	d, #0x00
;player.c:65: if (l_ri == UP) {
	ld	a, c
	dec	a
	jr	NZ, 00126$
;player.c:67: v_sri = UP; 
	ld	hl, #_v_sri
	ld	(hl), #0x01
;player.c:69: if (v_syk > 24) {
	ld	a, #0x18
	ld	hl, #_v_syk
	sub	a, (hl)
	jp	NC, 00127$
;player.c:70: l_walk = v_player_kolision (v_lvldat [v_smk - 18]);
	ld	a, e
	add	a, #0xee
	ld	c, a
	ld	a, d
	adc	a, #0xff
	ld	b, a
	ld	hl, #_v_lvldat
	add	hl, bc
	ld	a, (hl)
	call	_v_player_kolision
;player.c:72: if (l_walk == TRUE) v_syk -= 8;
	ld	b, a
	dec	a
	jp	NZ, 00127$
	ld	a, (_v_syk)
	add	a, #0xf8
	ld	(#_v_syk),a
	jr	00127$
00126$:
;player.c:76: else if (l_ri == DOWN) {
	ld	a, c
	sub	a, #0x02
	jr	NZ, 00123$
;player.c:78: v_sri = DOWN;
	ld	hl, #_v_sri
	ld	(hl), #0x02
;player.c:80: if (v_syk < 128) {
	ld	a, (#_v_syk)
	sub	a, #0x80
	jr	NC, 00127$
;player.c:81: l_walk = v_player_kolision (v_lvldat [v_smk + 18]);
	ld	hl, #0x0012
	add	hl, de
	ld	de, #_v_lvldat
	add	hl, de
	ld	a, (hl)
	call	_v_player_kolision
;player.c:83: if (l_walk == TRUE) v_syk += 8;
	ld	b, a
	dec	a
	jr	NZ, 00127$
	ld	a, (_v_syk)
	add	a, #0x08
	ld	(#_v_syk),a
	jr	00127$
00123$:
;player.c:87: else if (l_ri == LEFT) {
	ld	a, c
	sub	a, #0x03
	jr	NZ, 00120$
;player.c:89: v_sri = LEFT;
	ld	hl, #_v_sri
	ld	(hl), #0x03
;player.c:91: if (v_sxk > 16) {
	ld	a, #0x10
	ld	hl, #_v_sxk
	sub	a, (hl)
	jr	NC, 00127$
;player.c:93: l_walk = v_player_kolision (v_lvldat [v_smk - 1]);
	dec	de
	ld	hl, #_v_lvldat
	add	hl, de
	ld	a, (hl)
	call	_v_player_kolision
;player.c:95: if (l_walk == TRUE) v_sxk -= 8;
	ld	b, a
	dec	a
	jr	NZ, 00127$
	ld	a, (_v_sxk)
	add	a, #0xf8
	ld	(#_v_sxk),a
	jr	00127$
00120$:
;player.c:99: else if (l_ri == RIGHT) {
	ld	a, c
	sub	a, #0x04
	jr	NZ, 00127$
;player.c:101: v_sri = RIGHT; 
	ld	hl, #_v_sri
	ld	(hl), #0x04
;player.c:103: if (v_sxk < 152) {
	ld	a, (#_v_sxk)
	sub	a, #0x98
	jr	NC, 00127$
;player.c:104: l_walk = v_player_kolision (v_lvldat [v_smk + 1]);
	inc	de
	ld	hl, #_v_lvldat
	add	hl, de
	ld	a, (hl)
	call	_v_player_kolision
;player.c:106: if (l_walk == TRUE) v_sxk += 8;
	ld	b, a
	dec	a
	jr	NZ, 00127$
	ld	a, (_v_sxk)
	add	a, #0x08
	ld	(#_v_sxk),a
00127$:
;player.c:109: if (l_walk == TRUE) { p_player_setSprite (); }
	dec	b
	jp	Z, _p_player_setSprite
;player.c:111: }
	ret
;player.c:114: void p_player_attack (void) __nonbanked
;	---------------------------------
; Function p_player_attack
; ---------------------------------
_p_player_attack::
;player.c:116: if (v_pflock == TRUE) {
	ld	a, (#_v_pflock)
	dec	a
	ret	NZ
;player.c:118: move_sprite (1, v_sxk, v_syk - 8);
	ld	a, (_v_syk)
	ld	c, a
	ld	a, (_v_sxk)
	ld	e, a
;player.c:117: if (v_sri == UP) {
	ld	a, (#_v_sri)
	dec	a
	jr	NZ, 00110$
;player.c:118: move_sprite (1, v_sxk, v_syk - 8);
	ld	a, c
	add	a, #0xf8
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl+), a
	ld	(hl), e
;player.c:118: move_sprite (1, v_sxk, v_syk - 8);
	jr	00111$
00110$:
;player.c:120: else if (v_sri == DOWN) {
	ld	a, (#_v_sri)
	sub	a, #0x02
	jr	NZ, 00107$
;player.c:121: move_sprite (1, v_sxk, v_syk + 8);
	ld	a, c
	add	a, #0x08
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	hl, #(_shadow_OAM + 4)
	ld	(hl+), a
	ld	(hl), e
;player.c:121: move_sprite (1, v_sxk, v_syk + 8);
	jr	00111$
00107$:
;player.c:124: move_sprite (1, v_sxk - 8, v_syk);
	ld	a, (_v_syk)
	ld	c, a
	ld	a, (_v_sxk)
	ld	e, a
;player.c:123: else if (v_sri == LEFT) {
	ld	a, (#_v_sri)
	sub	a, #0x03
	jr	NZ, 00104$
;player.c:124: move_sprite (1, v_sxk - 8, v_syk);
	ld	a, e
	add	a, #0xf8
	ld	e, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;player.c:124: move_sprite (1, v_sxk - 8, v_syk);
	jr	00111$
00104$:
;player.c:126: else if (v_sri == RIGHT) {
	ld	a, (#_v_sri)
	sub	a, #0x04
	jr	NZ, 00111$
;player.c:127: move_sprite (1, v_sxk + 8, v_syk);
	ld	a, e
	add	a, #0x08
	ld	e, a
;/opt/gbdk/include/gb/gb.h:1973: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #(_shadow_OAM + 4)
;/opt/gbdk/include/gb/gb.h:1974: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), e
;player.c:127: move_sprite (1, v_sxk + 8, v_syk);
00111$:
;player.c:129: v_angriff = TRUE; v_action = FALSE; v_angriffstimer = 0;
	ld	hl, #_v_angriff
	ld	(hl), #0x01
	xor	a, a
	ld	(#_v_action), a
	ld	(#_v_angriffstimer),a
;player.c:131: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
