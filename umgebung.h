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

//   File: umgebung.h

#ifndef _UMGEBUNG_H_
#define _UMGEBUNG_H_

#include "globals.h"

extern void p_umgebung_schild (uint8_t l_mk, unsigned char l_txt [81]) __nonbanked;
extern void p_umgebung_truheEispflock (uint8_t l_mk, uint8_t l_nr) __nonbanked;
extern void p_umgebung_truheWeihwasser (uint8_t l_mk, uint8_t l_nr) __nonbanked;
extern void p_umgebung_disables (void) __nonbanked;

#endif
