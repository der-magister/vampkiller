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

//   File: gegner.h

#ifndef _GEGNER_H_
#define _GEGNER_H_

#include "globals.h"

extern void p_gegner_init (void) __nonbanked;
extern void p_gegner_set (uint8_t l_nr, uint8_t l_sprnr, uint8_t l_xk, uint8_t l_yk, uint8_t l_lp, uint8_t l_ri) __nonbanked;
extern void p_gegner_move (void) __nonbanked;
extern void p_gegner_unset (void) __nonbanked;
extern void p_gegner_lvlset (void) __nonbanked;

#endif
