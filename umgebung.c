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

//   File: umgebung.c

#include "umgebung.h"
#include "player.h"
#include "text.h"
#include "cdesign.h"

#include "gfx/txt/texte.h"

//Schildtext anzeigen bei Map-Koordinate
void p_umgebung_schild (uint8_t l_mk, unsigned char l_txt [81]) __nonbanked
{
	if (l_mk == v_smk) {
		p_text_viewTXT (l_txt);
	}
}

//Truhe mit Eispflock
void p_umgebung_truheEispflock (uint8_t l_mk, uint8_t l_nr) __nonbanked
{
	if ((l_mk == v_smk) && (v_kiste [l_nr] == 0)) {
		p_text_viewTXT (eispflock);
		
		v_kiste [l_nr] = 1; v_pflock = TRUE; v_tuer [0] = TRUE;
	}
	else if ((l_mk == v_smk) && (v_kiste [l_nr] == 1)) {
		p_text_viewTXT (leer);
	}
}

//Truhe mit Weihwasser
void p_umgebung_truheWeihwasser (uint8_t l_mk, uint8_t l_nr) __nonbanked
{
	if ((l_mk == v_smk) && (v_kiste [l_nr] == 0)) {
		p_text_viewTXT (weihwasser);
		
		v_kiste [l_nr] = 1; v_sweih += 1;
		p_cdesign_showWeihwasser ();
	}
	else if ((l_mk == v_smk) && (v_kiste [l_nr] == 1)) {
		p_text_viewTXT (leer);
	}

}

//Tuer zu
void p_umgebung_tuerzu (uint8_t l_mk, uint8_t l_nr) __nonbanked
{
	if ((l_mk == v_smk) && (v_tuer [l_nr] == FALSE)) {
		p_text_viewTXT (tuerzu);
	}
}

//Truhe mit Herz 
void p_umgebung_truheHerz (uint8_t l_mk, uint8_t l_nr) __nonbanked
{
	if ((l_mk == v_smk) && (v_kiste [l_nr] == 0)) { 

		if (v_slp < 3) {
			p_text_viewTXT (herz);
			v_kiste [l_nr] = 1; v_slp += 1;
			p_cdesign_showLP ();
		}
		else if (v_slp > 2) {
			p_text_viewTXT (nichtnuetzlich);	
		}
	}
	else if ((l_mk == v_smk) && (v_kiste [l_nr] == 1)) {
		p_text_viewTXT (leer);
	}
}

//Truhe mit Schlüssel 
/*void p_umgebung_truheSchluessel (uint8_t l_mk, uint8_t l_nr) __nonbanked
{
	if ((l_mk == v_smk) && (v_kiste [l_nr] == 0)) {
		p_text_viewTXT (schluessel);
		
		if (v_skey < 3) {
			v_kiste [l_nr] = 1;  v_skey += 1;
			p_cdesign_showKey ();
		} 
		else if (v_skey > 2) {
			p_text_viewTXT (nichtnuetzlich);
		} 
		
	}
	else if ((l_mk == v_smk) && (v_kiste [l_nr] == 1)) {
		p_text_viewTXT (leer);
	}
}*/

//Truhe mit Uhr 
void p_umgebung_truheUhr (uint8_t l_mk, uint8_t l_nr) __nonbanked
{
	if ((l_mk == v_smk) && (v_kiste [l_nr] == 0)) {

		if (v_time < 245) {
			p_text_viewTXT (uhr);
		
			v_kiste [l_nr] = 1; v_time += 10;
			p_cdesign_showTime ();
		}
		else if (v_time > 244) {
			p_text_viewTXT (nichtnuetzlich); 
		}
	}
	else if ((l_mk == v_smk) && (v_kiste [l_nr] == 1)) {
		p_text_viewTXT (leer);
	}	
}

void p_umgebung_disables (void) __nonbanked
{}
