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

//   File: globals.c

#include "globals.h"

const unsigned char v_kolidat [4] = { 56, 58, 60, 61 };

uint8_t v_gameover;				//Statusvariable, ob Hauptspielschleife noch aktiv ist
uint8_t v_angriff;				//Statusvariable, ob gerade Kampfaktivität
uint8_t v_action;				//Statusvariable, ob eine Aktion stattfindet

//verschiedene Timer
uint8_t v_movetimer;				//Bewegungstimer für Spieler
uint8_t v_angriffstimer;			//Timer für Attackgrafik Spieler
uint8_t v_gegnertimer;				//Bewegungstimer für Gegner
uint8_t v_timertimer;				//Untertimer für Zeit

//Leveldaten
uint8_t v_room;					//aktueller Raum
uint8_t v_time;					//aktuelle Spielzeit (Startwert 255)

unsigned char v_lvldat [252];			//Grafikdaten des aktuellen Raums
unsigned char v_lvldatmod [252];		//modifizierten Grafikdaten des aktuellen  Raums

//Spielerdaten
uint8_t v_slp;					//aktuelle Lebensenergie Spieler (max. 3)
uint8_t v_skey;					//aktuelle Anzahl Schlüssel (max. 3)
uint8_t v_sweih;				//aktuelle Anzahl Weihwasserphiole (max. 3)

uint8_t v_pflock;				//Eispflock in Besitz

uint8_t v_sxk;					//X-Koordinate Spieler auf Screen
uint8_t v_syk;					//Y-Koordinate Spieler auf Screen
uint8_t v_smk;					//Array Map Koordinate Spieler
uint8_t v_sri;					//Blickrichtung Spieler

//Gegnerdaten (max. 3 Gegner pro Raum)
uint8_t v_glp [5];				//Lebenspunkte Gegner
uint8_t v_gxk [5];				//X-Koordinate Gegner
uint8_t v_gyk [5];				//Y_Koordinate Gegner
uint8_t v_gmk [5];				//Map-Koordinate Gegner
uint8_t v_gri [5];                              //Richtungsanzeige

//Umgebung
uint8_t v_kiste [5];				//Kisten offen true / false
uint8_t v_tuer [3];				// Tuer offen true / false			