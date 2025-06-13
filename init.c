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

//   File: ínit.c

#include "init.h"
#include "engine.h"
#include "cdesign.h"
#include "player.h"
#include "level.h"


#include "gfx/tilesets/fonttiles-127-58.h"
#include "gfx/spriteset/tsprites-1-3.h"

#include "gfx/lvl/rooms.h"

void p_init_stage_1 (void) __nonbanked
{
	SPRITES_8x8;
	HIDE_SPRITES;
	HIDE_BKG;

	//laden der Tilesets
	p_engine_loadTileset (56, 127, fonttiles);
	p_engine_loadSpriteset (0, 3, sprites);

	v_time = 255; v_gameover = FALSE; v_movetimer = 0; v_gegnertimer = 0; v_timertimer = 0;
}

void p_init_stage_2 (void) __nonbanked
{
	SHOW_BKG;
	SHOW_SPRITES;

	p_engine_loadMap (room1);

	p_cdesign_init ();
	p_engine_showMap (v_lvldat);
	//set_bkg_tiles (1, 1, 18, 14, v_lvldat);
	p_player_init ();
	p_cdesign_showStatus ();
	p_level_init ();	
}
