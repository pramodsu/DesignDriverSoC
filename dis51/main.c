/* main.c
 *
 * Main function for Dis51.
 *
 * Copyright 2001 - 2003 by David Sullins
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
 *
 * HISTORY:
 * 0.4, 3 Nov 2003: Only documentation changes.
 * 0.3, 14 Feb 2003: Updated for newer libhexfile.
 * 0.2: first numbered version, updated for new libhexfile.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <hexfile.h>
#include "global.h"
#include "pass1.h"
#include "pass2.h"

int main(int argc, char **argv)
{
	struct hexfile hf;
	int i;
	int entry = 0;
	char *p, *q;
	unsigned long ul; 
	
	Lst = 0;
	
	/* clear memory */
	memset(lbl, 0, 65536*2);
	
	/* read hex file from stdin */
	if (init_hexfile(&hf, 65536, stdin, NULL)) {
		fprintf(stderr, "Error opening hex file.\n");
		exit(1);
	}
	if (read_hex(&hf)) {
		fprintf(stderr, "Error reading hex file.\n");
		exit(1);
	}
	
	if (argc > 1) {
		i = 1;
		/* Set listing mode */
		if(!strcmp(argv[i],"-l")) {
			Lst=1;
			++i;
			/* use entry point 0 if none given on command line */
			if (argc == i)
				pass1(&hf, 0);
		}

		/* use entry points from command line */
		for (; i < argc; ++i) {
			if(!Lst)
				sscanf(argv[i], "%d", &entry);
			else {
				p = q = argv[i];
				if(*p == '\0') {
					fprintf(stderr, "Warning: NULL argument on command line.\n");
					continue;
				}
				ul = strtoul(p, &q, 0);
				if(*q != 0) {
					fprintf(stderr, "Error: Bad address '%s'. Abort\n", argv[i]);
					exit(1);
				}
				entry = (int)ul;
			}
			pass1(&hf, entry);
		}
	}
	else
		/* use entry point 0 if none given on command line */
		pass1(&hf, 0);
	
	/* disassemble to stdout */
	pass2(stdout, &hf);

	return 0;
}
