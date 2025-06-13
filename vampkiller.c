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

//   File: vampkiller.c

#include "vampkiller.h"
#include "init.h"
#include "player.h"
#include "cdesign.h"
#include "gegner.h"
#include "level.h"

void main (void) __nonbanked
{
	p_init_stage_1 ();
	p_init_stage_2 ();

	v_angriffstimer = 0;

	//Hauptspielschleife
	while (v_gameover == FALSE)
	{
		//Spielerbewegung
		if (v_movetimer == 6) {
			if (joypad () & J_UP) p_player_move (UP);
			else if (joypad () & J_DOWN) p_player_move (DOWN);
			else if (joypad () & J_LEFT) p_player_move (LEFT);
			else if (joypad () & J_RIGHT) p_player_move (RIGHT);

			v_movetimer = 0;
			p_cdesign_showMapKoord ();
			p_cdesign_showXK ();
			p_cdesign_showYK ();
		}

		if ((joypad () & J_A) && (v_angriff == FALSE)) {
        		p_level_control ();
        		
        		p_player_attack ();
        	}

        	//Angriffsprite unsichtabr
		if (v_angriffstimer == 8) {
        		move_sprite (1, 0, 0); v_angriff = FALSE;
      		}

      		if (v_gegnertimer == 8) {
      			p_gegner_move ();
      		}

      		if (v_angriff == TRUE) v_angriffstimer++;

      		if (v_gegnertimer < 255) v_gegnertimer++;

		++v_movetimer;
		++v_timertimer;
		
		if (v_timertimer == 100) {
			--v_time;
			p_cdesign_showTime ();
			v_timertimer = 0;
		}
		wait_vbl_done ();
	}
}
