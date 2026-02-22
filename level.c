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

//   File: level.c

#include "level.h"
#include "player.h"
#include "engine.h"
#include "umgebung.h"
#include "gegner.h"

#include "gfx/lvl/rooms.h"

#include "gfx/txt/texte.h"

//Init
void p_level_init (void) __nonbanked
{
	v_room = 1;
}

/* Raumwechsel
   l_room = Nummer des zu wechselnden Raumes
   l_sxk = neue Spieler XK
   l_syk = neue Spieler YK
*/
void p_level_changeRoom (uint8_t l_room, uint8_t l_sxk, uint8_t l_syk) __nonbanked
{
	HIDE_SPRITES;
	HIDE_BKG;
	v_angriff = FALSE; v_angriffstimer = 0;
	v_room = l_room;				
	v_sxk = l_sxk;
	v_syk = l_syk;

	p_player_setSprite ();
	v_movetimer = 0;
	delay (160);
	SHOW_SPRITES;
	SHOW_BKG;
	v_angriff = TRUE;
	p_gegner_lvlset ();
}

//Raum 1 spezifische Aspekte
void p_level_room1 (void) __nonbanked
{
	if (v_smk == 8) { 
		p_engine_loadMap (room2);
		p_engine_showMap (room2);
		p_level_changeRoom (2, v_sxk, 128); 		
	}
	p_umgebung_schild (46, shield1);
}

//Raum 2 spezifische Aspekte
void p_level_room2 (void) __nonbanked
{
	if (v_smk == 242) {
		p_engine_loadMap (room1);
		p_engine_showMap (room1);
		p_level_changeRoom (1, v_sxk, 24);
	}
	else if (v_smk == 8) {
		p_engine_loadMap (room3);
		p_engine_showMap (room3);
		p_level_changeRoom (3, v_sxk, 128);
	}
	p_umgebung_truheEispflock (52, 1);

	p_umgebung_tuerzu (8, 0);
}

//Raum 3 spezifische Aspekte
void p_level_room3 (void) __nonbanked
{
	if (v_smk == 125) {
		p_engine_loadMap (room4);
		p_engine_showMap (room4);
		p_level_changeRoom (4, 16, v_syk);
	}
	else if (v_smk == 242) {
		p_engine_loadMap (room2);
		p_engine_showMap (room2);
		p_level_changeRoom (2, v_sxk, 24);
	}
}

//Raum 4 spezifische Aspekte
void p_level_room4 (void) __nonbanked
{
	if (v_smk == 108) {
		p_engine_loadMap (room3);
		p_engine_showMap (room3);
		p_level_changeRoom (3, 152, v_syk);
	}
	else if (v_smk == 125) {
		p_engine_loadMap (room5);
		p_engine_showMap (room5);
		p_level_changeRoom (5, 16, v_syk);
	}
}

//Raum 5 spezifische Aspekte
void p_level_room5 (void) __nonbanked
{
	if (v_smk == 108) {
		p_engine_loadMap (room4);
		p_engine_showMap (room4);
		p_level_changeRoom (4, 152, v_syk);
		
	}
	else if (v_smk == 8) {
		p_engine_loadMap (room6);
		p_engine_showMap (room6);
		p_level_changeRoom (6, v_sxk, 128);
	}
	p_umgebung_truheWeihwasser (231, 2);
}

//Raum 6 spezifische Aspekte
void p_level_room6 (void) __nonbanked
{
	if (v_smk == 242) {
		p_engine_loadMap (room5);
		p_engine_showMap (room5);
		p_level_changeRoom (5, v_sxk, 24);
	}
	else if (v_smk == 108) {
		p_engine_loadMap (room7);
		p_engine_showMap (room7);
		p_level_changeRoom (7, 152, v_syk);
	}
}

//Raum 7 spezifische Aspekte
void p_level_room7 (void) __nonbanked
{
	if (v_smk == 125) {
		p_engine_loadMap (room6);
		p_engine_showMap (room6);
		p_level_changeRoom (6, 16, v_syk);
	}
	else if (v_smk == 108) {
		p_engine_loadMap (room8);
		p_engine_showMap (room8);

		p_level_changeRoom (8, 152, v_syk);
	}
}

//Raum 8 spezifische Aspekte
void p_level_room8 (void) __nonbanked
{
	if (v_smk == 125) {
		p_engine_loadMap (room7);
		p_engine_showMap (room7);
		p_level_changeRoom (7, 16, v_syk);
	}
	else if (v_smk == 8) {
		p_engine_loadMap (room9);
		p_engine_showMap (room9);
		p_level_changeRoom (9, v_sxk, 128);	
	}
}

//Raum 9 spezifische Aspekte
void p_level_room9 (void) __nonbanked
{
	if (v_smk == 242)
	{
		p_engine_loadMap (room8);
		p_engine_showMap (room8);
		p_level_changeRoom (8, v_sxk, 24);	
	}
	else if (v_smk == 5) {
		p_engine_loadMap (room10);
		p_engine_showMap (room10);
		p_level_changeRoom (10, v_sxk, 128);	
	}
}

//Raum 10 spezifische Aspekte
void p_level_room10 (void) __nonbanked
{
	if (v_smk == 239)
	{
		p_engine_loadMap (room9);
		p_engine_showMap (room9);
		p_level_changeRoom (9, v_sxk, 24);	
	}
	else if (v_smk == 179) {
		p_engine_loadMap (room11);
		p_engine_showMap (room11);
		p_level_changeRoom (11, 16, v_syk);	
	}
}

//Raum 11 spezifische Aspekte
void p_level_room11 (void) __nonbanked
{
	if (v_smk == 162) {
		p_engine_loadMap (room10);
		p_engine_showMap (room10);
		p_level_changeRoom (10, 152, v_syk);	
	}
	else if (v_smk == 179) {
		p_engine_loadMap (room12);
		p_engine_showMap (room12);
		p_level_changeRoom (12, 16, v_syk);		
	}
}

//Raum 12 spezifische Aspekte
void p_level_room12 (void) __nonbanked
{
	if (v_smk == 162) {
		p_engine_loadMap (room11);
		p_engine_showMap (room11);
		p_level_changeRoom (11, 152, v_syk);	
	}
	else if (v_smk == 245) {
		p_engine_loadMap (room13);
		p_engine_showMap (room13);
		p_level_changeRoom (13, v_sxk, 24);	

	}

}

//Raum 13 spezifische Aspekte
void p_level_room13 (void) __nonbanked
{
	if (v_smk == 11) {
		p_engine_loadMap (room12);
		p_engine_showMap (room12);
		p_level_changeRoom (12, v_sxk, 128);		
	}
}


//Levelkontrolle
void p_level_control (void) __nonbanked
{
	if (v_room == 1) p_level_room1 ();
	else if (v_room == 2) p_level_room2 ();
	else if (v_room == 3) p_level_room3 ();
	else if (v_room == 4) p_level_room4 ();
	else if (v_room == 5) p_level_room5 ();
	else if (v_room == 6) p_level_room6 ();
	else if (v_room == 7) p_level_room7 ();
	else if (v_room == 8) p_level_room8 ();
	else if (v_room == 9) p_level_room9 ();
	else if (v_room == 10) p_level_room10 ();
	else if (v_room == 11) p_level_room11 ();
	else if (v_room == 12) p_level_room12 ();
}
