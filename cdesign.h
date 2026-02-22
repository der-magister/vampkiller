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

//   File: cdesign.h

#ifndef _CDESIGN_H_
#define _CDESIGN_H_

#include "globals.h"

extern void p_cdesign_umwandlung (uint8_t l_w, uint8_t l_xk, uint8_t l_yk) __nonbanked;
extern void p_cdesign_showLP (void) __nonbanked;
extern void p_cdesign_showKey (void) __nonbanked;
extern void p_cdesign_showWeihwasser (void) __nonbanked;
extern void p_cdesign_showTime (void) __nonbanked;
extern void p_cdesign_showMapKoord (void) __nonbanked;
extern void p_cdesign_showXK (void) __nonbanked;
extern void p_cdesign_showYK (void) __nonbanked;
extern void p_cdesign_showStatus (void) __nonbanked;
extern void p_cdesign_init (void) __nonbanked;

#endif