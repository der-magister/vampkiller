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

//   File: level.h

#ifndef _LEVEL_H_
#define _LEVEL_H_

#include "globals.h"

extern void p_level_init (void) __nonbanked;
extern void p_level_changeRoom (uint8_t l_lvl, uint8_t l_sxk, uint8_t l_syk) __nonbanked;
extern void p_level_room1 (void) __nonbanked;
extern void p_level_room2 (void) __nonbanked;
extern void p_level_room3 (void) __nonbanked;
extern void p_level_room4 (void) __nonbanked;
extern void p_level_room5 (void) __nonbanked;
extern void p_level_room6 (void) __nonbanked;
extern void p_level_control (void) __nonbanked;

#endif