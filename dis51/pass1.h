/* pass1.h
 *
 * Functions for pass 1 of the assembler
 *
 * Copyright 2001, 2002 by David Sullins
 *
 * This file is part of Dis51.
 * 
 * Dis51 is free software; you can redistribute it and/or modify it under the
 * terms of the GNU General Public License as published by the Free Software
 * Foundation, version 2 of the License.
 * 
 * Dis51 is distributed in the hope that it will be useful, but WITHOUT ANY
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * Dis51; if not, write to the Free Software Foundation, Inc., 59 Temple
 * Place, Suite 330, Boston, MA 02111-1307 USA
 * 
 * You may contact the author at djs@naspa.net.
 */

#ifndef _PASS1_H_
#define _PASS1_H_

#include <hexfile.h>

/* pass1: Disassemble instructions starting at given entry point (pass 1)
 *
 */
void pass1(struct hexfile *hf, int addr);

#endif /* _PASS1_H_ */
