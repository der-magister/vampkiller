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

//   File: gegner.c

#include "gegner.h"
#include "engine.h"

void p_gegner_init (void) __nonbanked
{
		
}

/*
	l_nr = Gegner 2...4
	l_sprnr = Spritenummer
	l_xk = XK des Gegner
	l_yk = YK des Gegner
	l_lp =	Lebenspunkte des Gegner
	l_ri = anfängliche Bewegungsrichtung
*/
void p_gegner_set (uint8_t l_nr, uint8_t l_sprnr, uint8_t l_xk, uint8_t l_yk, uint8_t l_lp, uint8_t l_ri) __nonbanked
{
	set_sprite_tile (l_nr, l_sprnr);
	v_gxk [l_nr] = l_xk; v_gyk [l_nr] = l_yk; v_glp [l_nr] = l_lp; v_gri [l_nr] = l_ri;
	move_sprite (l_nr, v_gxk [l_nr], v_gyk [l_nr]);
	v_gegnertimer = 0;
}

//Kolissionsabfrage
uint8_t v_gegner_kolision (unsigned char l_tile) __nonbanked
{
	uint8_t l_i;

	for (l_i = 0; l_i != sizeof (v_kolidat) + 1; l_i++) {
		if (l_tile == v_kolidat [l_i]) return FALSE;

	}
	return TRUE;
}

///Gegner die sich bewegen
void p_gegner_move (void) __nonbanked
{
	uint8_t l_i;
	uint8_t l_walk = TRUE;

	v_gegnertimer = 0;
	
	for (l_i = 2; l_i <= 4; l_i++) {
		v_gmk [l_i] = p_engine_calcCoord (v_gxk [l_i], v_gyk [l_i]);

		if (v_gri [l_i] == RIGHT) {
			l_walk = v_gegner_kolision (v_lvldat [v_gmk [l_i] + 1]);
		}
		else if (v_gri [l_i] == LEFT) {
			l_walk = v_gegner_kolision (v_lvldat [v_gmk [l_i] - 1]);	
		}
		else if (v_gri [l_i] == UP) {
			l_walk = v_gegner_kolision (v_lvldat [v_gmk [l_i] - 18]);
		}
		else if (v_gri [l_i] == DOWN) {
			l_walk = v_gegner_kolision (v_lvldat [v_gmk [l_i] + 18]);
		}
		if (l_walk == TRUE) {
			if (v_gri [l_i] == RIGHT) v_gxk [l_i] += 8;
			else if (v_gri [l_i] == LEFT) v_gxk [l_i] -= 8;
			else if (v_gri [l_i] == UP) v_gyk [l_i] -= 8;
			else if (v_gri [l_i] == DOWN) v_gyk [l_i] += 8;

			move_sprite (l_i, v_gxk [l_i], v_gyk [l_i]);
		}
		else if (l_walk == FALSE) {
			if (v_gri [l_i] == RIGHT) v_gri [l_i] = LEFT;
			else if (v_gri [l_i] == LEFT) v_gri [l_i] = RIGHT;
			else if (v_gri [l_i] == UP) v_gri [l_i] = DOWN;
			else if (v_gri [l_i] == DOWN) v_gri [l_i] = UP;
		}
	}	
} 

//Gegner deaktivieren
void p_gegner_unset (void) __nonbanked
{
	v_gegnertimer = 255;

	p_gegner_set (2, 0, 0, 0, 0, QUIT);
	p_gegner_set (3, 0, 0, 0, 0, QUIT);
	p_gegner_set (4, 0, 0, 0, 0, QUIT);
}

//Positionierung der Gegner in den Räumen
void p_gegner_lvlset (void) __nonbanked
{
	p_gegner_unset ();

	if (v_room == 3) {
		p_gegner_set (2, 1, 144, 80, 1, LEFT);
		p_gegner_set (3, 1, 24, 40, 1, RIGHT);
	}
	else if (v_room == 4) {
		p_gegner_set (2, 1, 48, 32, 1, UP);
		p_gegner_set (3, 1, 88, 72, 1, DOWN);
		p_gegner_set (4, 1, 144, 64, 1, LEFT);	
	}
	else if (v_room == 5) {
		p_gegner_set (2, 1, 136, 32, 1, DOWN);
		p_gegner_set (3, 1, 40, 112, 1, UP);
	}
	else if (v_room == 6) {
		p_gegner_set (2, 1, 40, 112, 1, DOWN);
	}
	else if (v_room == 7) {
		p_gegner_set (2, 1, 64, 32, 1, DOWN);
		p_gegner_set (3, 1, 112, 120, 1, UP);
	}
	else if (v_room == 8) {
		p_gegner_set (2, 2, 112, 120, 1, UP);
		p_gegner_set (3, 2, 40, 56, 1, DOWN);
	}
	else if (v_room == 9)  {
		p_gegner_set (2, 2, 80, 56, 1, LEFT);
		p_gegner_set (3, 2, 136, 112, 2, RIGHT);	
	}
	else if (v_room == 10) {
		p_gegner_set (2, 2, 32, 80, 1, RIGHT);
		p_gegner_set (3, 1, 144, 80, 1, LEFT);
		p_gegner_set (4, 1, 80, 120, 1, UP);	
	}
	else if (v_room == 11) {
		p_gegner_set (2, 2, 48, 120, 1, UP);
		p_gegner_set (3, 1, 96, 32, 1, RIGHT);
		p_gegner_set (4, 2, 88, 40, 1, DOWN);	
	}
	else if (v_room == 12) {
		p_gegner_set (2, 1, 88, 80, 1, DOWN);
		p_gegner_set (3, 2, 144, 72, 1, LEFT);
		p_gegner_set (4, 1, 48, 120, 1, UP);
	}
	else if (v_room == 13) {
		p_gegner_set (2, 2, 64, 80, 1, RIGHT);
		p_gegner_set (3, 2, 144, 48, 1, LEFT);
		p_gegner_set (4, 2, 24, 112, 1, RIGHT);	
	}
}
