//   Vampkiller
//
//   Copyright (C) 2024-2025 Heiko Wolf
//
//   This program is free software; you can redistribute it and/or modify
//   it under the terms of the GNU General Public License As published by
//   the Free Software Foundation; either version 2 of the License, or
//   (at your option) any later version.
//
//   This program is distributed in the hope that it will be useful,
//   but WITHOUT ANY WARRANTY; without even the implied warranty of
//   MERCHANTABILITY Or FITNESS For A PARTICULAR PURPOSE.  See the
//   GNU General Public License For more details.
//
//   You should have received a copy of the GNU General Public License along
//   With this program; if not, write to the Free Software Foundation, Inc.,
//   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//
//   Kontakt: heiko.wolf.mail@gmail.com

//   File: player.c

#include "engine.h"
#include "player.h"

//Init Spielerdaten
void p_player_init (void) __nonbanked
{
	//Spielerwerte setzen
	v_slp = 3; v_skey = 0; v_sweih = 0; v_pflock = FALSE; 
	v_sxk = 80; v_syk = 40; v_sri = UP;

	set_sprite_tile (0, 0);	//Spielersprite
	set_sprite_tile (1, 3); //Attacksprite Spieler
	p_player_setSprite ();
}

//setz Spielersprite auf Screen an den definierten Koordinaten
void p_player_setSprite (void) __nonbanked
{
	move_sprite (0, v_sxk, v_syk);
	v_smk = p_engine_calcCoord (v_sxk, v_syk);

}

//Kolissionsabfrage
uint8_t v_player_kolision (unsigned char l_tile) __nonbanked
{
	uint8_t l_i;

	for (l_i = 0; l_i != sizeof (v_kolidat) + 1; ++l_i) {
		if (l_tile == v_kolidat [l_i]) return FALSE;

	}
	return TRUE;
}


//Bewegung des Spielersprites
void p_player_move (uint8_t l_ri) __nonbanked
{
	uint8_t l_walk = TRUE;

	//nach Norden
	if (l_ri == UP) {

		v_sri = UP; 

		if (v_syk > 24) {
			l_walk = v_player_kolision (v_lvldat [v_smk - 18]);

			if (l_walk == TRUE) v_syk -= 8;
		}
	}
	//nach Süden
	else if (l_ri == DOWN) {

		v_sri = DOWN;

		if (v_syk < 128) {
			l_walk = v_player_kolision (v_lvldat [v_smk + 18]);

			if (l_walk == TRUE) v_syk += 8;
		}
	}
	//nach Westen
	else if (l_ri == LEFT) {

		v_sri = LEFT;

		if (v_sxk > 16) {

			l_walk = v_player_kolision (v_lvldat [v_smk - 1]);

			if (l_walk == TRUE) v_sxk -= 8;
		}
	}
	//nach Süden
	else if (l_ri == RIGHT) {

		v_sri = RIGHT; 

		if (v_sxk < 152) {
			l_walk = v_player_kolision (v_lvldat [v_smk + 1]);

			if (l_walk == TRUE) v_sxk += 8;
		}
	}
	if (l_walk == TRUE) { p_player_setSprite (); }

}

//Angriff Spieler
void p_player_attack (void) __nonbanked
{
	if (v_pflock == TRUE) {
		if (v_sri == UP) {
			move_sprite (1, v_sxk, v_syk - 8);
		}
		else if (v_sri == DOWN) {
			move_sprite (1, v_sxk, v_syk + 8);
		}
		else if (v_sri == LEFT) {
			move_sprite (1, v_sxk - 8, v_syk);
		}
		else if (v_sri == RIGHT) {
			move_sprite (1, v_sxk + 8, v_syk);
		}
		v_angriff = TRUE; v_action = FALSE; v_angriffstimer = 0;
	}
}
