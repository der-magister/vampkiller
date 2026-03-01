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

//   File: cdesign.c

#include "cdesign.h"

#include "gfx/design/gameborder.h"

//wandelt Variablenwert in Tile zur Anzeige um
void p_cdesign_umwandlung (uint8_t l_w, uint8_t l_xk, uint8_t l_yk) __nonbanked
{
	unsigned char l_tile [1];

	uint8_t l_i;

	if (l_w == 0) l_tile [0] = 91;

	for (l_i = 0x01; l_i != 0x0A; ++l_i) {
		if (l_w == l_i) l_tile [0] = 0x65 - l_i;
	}

	set_bkg_tiles (l_xk, l_yk, 1, 1, l_tile);
}

//zeigt Lebenspunkte an
void p_cdesign_showLP (void) __nonbanked
{
	p_cdesign_umwandlung (v_slp, 3, 16);
}

//Zeigt Anzahl der Schlüssel an
/*void p_cdesign_showKey (void) __nonbanked
{
	p_cdesign_umwandlung (v_skey % 10, 12, 16);
}*/

//Zeigt Anzahl Weihwasser an
void p_cdesign_showWeihwasser (void) __nonbanked
{
	p_cdesign_umwandlung (v_sweih % 10, 7, 16);
}

//zeigt die verfügbare Zeit an
void p_cdesign_showTime (void) __nonbanked
{
	p_cdesign_umwandlung (v_time % 10, 18, 16);
	p_cdesign_umwandlung ((v_time / 10 ) % 10, 17, 16);
	p_cdesign_umwandlung (((v_time / 10) / 10 ) % 10, 16, 16);
}

//zeigt Mapkoordinate des Spieler an
void p_cdesign_showMapKoord (void) __nonbanked
{
	p_cdesign_umwandlung (v_smk % 10, 10, 17);
	p_cdesign_umwandlung ((v_smk / 10 ) % 10, 9, 17);
	p_cdesign_umwandlung (((v_smk / 10) / 10 ) % 10, 8, 17);	
}

//zeigt die XK des Spielers an (nur fuer interne Zwecke)
void p_cdesign_showXK (void) __nonbanked
{
	p_cdesign_umwandlung (v_sxk % 10, 3, 15);
	p_cdesign_umwandlung ((v_sxk / 10 )  % 10, 2, 15);
	p_cdesign_umwandlung (((v_sxk / 10) /10 ) % 10, 1, 15);
}

void p_cdesign_showYK (void) __nonbanked
{
	p_cdesign_umwandlung (v_syk % 10, 7, 15);
	p_cdesign_umwandlung ((v_syk / 10 )  % 10, 6, 15);
	p_cdesign_umwandlung (((v_syk / 10) /10 ) % 10, 5, 15);
}	

//zeigt die aktuellen Daten in der Statusleiste an
void p_cdesign_showStatus (void) __nonbanked
{
	p_cdesign_showLP ();
	p_cdesign_showWeihwasser ();
	//p_cdesign_showKey ();
	p_cdesign_showMapKoord ();
	p_cdesign_showTime ();
}

//zeigt Spielrahmen an
void p_cdesign_init (void) __nonbanked
{
	set_bkg_tiles (0, 0, 20, 18, gameborder);
}
