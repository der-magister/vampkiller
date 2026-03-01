//   Vampkiller
//
//   Copyright (C) 2024-2026 Heiko Wolf
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

//   File: aktionen.c

#include "aktionen.h"
#include "engine.h"
#include "cdesign.h"
#include "init.h"
#include "gegner.h"

#include "gfx/others/others.h"

//Weihwasser an Spielerposition werfen
void p_use_weihwasser (void) __nonbanked
{
	if (v_sweih > 0) {
		//v_tile [1] = 59;
		v_sweih -= 1;

		
		p_cdesign_showWeihwasser ();
	}
}

//Eingangsintro
void p_intro (void) __nonbanked
{
	SHOW_BKG;
	set_bkg_tiles (0, 0, 20, 18, zfx);
	delay (2000);
	set_bkg_tiles (0, 0, 20, 18, title);
	waitpad (J_START);
	v_tmp = 1;
}

//Ablauf bei Gameover
void p_gameover (void) __nonbanked
{
	HIDE_SPRITES;
	set_bkg_tiles (0, 0, 20, 18, gameover);
	waitpad (J_START);
	v_gameover = TRUE;
	p_gegner_unset ();
	v_time = 255; v_gameover = FALSE; v_movetimer = 0; v_gegnertimer = 0; v_timertimer = 0;
	p_init_stage_2 ();
}
