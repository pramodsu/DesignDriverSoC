/* hexfile.c
 *
 * Library for reading files in Intel hex format.
 *
 * Copyright 2001 - 2003 by David Sullins
 *
 * This file is part of Libhexfile.
 * 
 * Libhexfile is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation, version 2 of the License.
 * 
 * Libhexfile is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with Libhexfile; if not, write to the Free Software Foundation, Inc., 59
 * Temple Place, Suite 330, Boston, MA 02111-1307 USA
 * 
 * You may contact the author at djs@naspa.net.
 */

#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "hexfile.h"

/* init_hexfile
 *
 * Initializes a struct hexfile.
 *
 * memsize should be the size of the internal memory buffer.  65536 is a
 *   good choice.
 * filename should be a readable hex file OR ifile should be a valid
 *   input stream.  To use filename, set ifile to NULL.
 *
 * Return 0 upon success, -1 otherwise.
 */
int init_hexfile(struct hexfile *hf, int memsize, FILE *ifile, const char
	*filename)
{
	/* open file for reading */
	if (ifile == NULL) {
		hf->ifile = fopen(filename, "r");
		if (hf->ifile == NULL)
			return -1;
	} else
		hf->ifile = ifile;
	hf->memsize = memsize;
	hf->mem = malloc(memsize);
	hf->flag = malloc(memsize);
	hf->hl = malloc(sizeof(struct hexline));
	memset(hf->flag, 0x80, memsize);
	
	return init_hexline(hf->hl);
}

/* destroy_hexfile
 *
 * Undoes what init_hexfile did.  Closes input hexfile.
 */
void destroy_hexfile(struct hexfile *hf)
{
	if (hf->ifile != NULL) {
		fclose(hf->ifile);
		hf->ifile = NULL;
	}
	if (hf->mem != NULL) {
		free(hf->mem);
		hf->mem = NULL;
	}
	if (hf->flag != NULL) {
		free(hf->flag);
		hf->flag = NULL;
	}
	if (hf->hl != NULL) {
		destroy_hexline(hf->hl);
		free(hf->hl);
		hf->hl = NULL;
	}
}

/* init_hexline
 *
 * Initializes a struct hexline.
 * filename should be a readable hex file.
 *
 * Return 0 upon success, -1 otherwise.
 */
int init_hexline(struct hexline *hl)
{
	hl->addr = 0;
	hl->len = 0;
	hl->record = 0;
	hl->linaddr = 0;

	/* HFINPUTSIZE characters less the length, address, record type,
	 * checksum, and colon is twice the number of bytes available on
	 * a line.  Add one just in case.
	 */
	hl->bufsize = (HFINPUTSIZE - 11) / 2 + 1;
	hl->membuf = malloc(hl->bufsize);
	
	return 0;
}

/* destroy_hexline
 *
 * Undoes what init_hexline did.
 */
void destroy_hexline(struct hexline *hl)
{
	if (hl->membuf != NULL) {
		free(hl->membuf);
		hl->membuf = NULL;
	}
}

/* parse_line
 *
 * Parse one line of a hex file.  Will not read a line larger than
 * HFINPUTSIZE characters.  The author once read that 100 characters is the
 * maximum length of a hex-file line (source forgotten), so HFINPUTSIZE is
 * defined as 100.  Redefine and recompile if that length is a problem for
 * you.
 *
 * Exits at first sign of trouble.  Makes no attempt to parse a line
 * with errors.
 * EXCEPT: If the ONLY error is with a checksum, memory is updated
 * normally.
 *
 * Only understands record types 00 (code/data) and 01 (end of file).
 *
 * Returns: -1 on bad checksum
 *          -2 on unknown record type
 *          -3 on unexpected line length
 *          -4 on unexpected character
 *          -5 on buffer full
 *           0 on code/data record
 *           1 on EOF record
 *           4 on linear address record
 *
 * Note: The segment address record type (2) is not supported, so a hex file
 * containing this record type will return -2.
 */
int parse_line(struct hexfile *hf)
{
	char inputbuf[HFINPUTSIZE];
	char *bufPtr;
	unsigned char checksum;
	int i, t;
	struct hexline *hl = hf->hl;
	
	/* read one line, null-terminate just in case */
	fgets(inputbuf, HFINPUTSIZE, hf->ifile);
	bufPtr = strchr(inputbuf, (int)'\n');
	if (bufPtr != 0)
		*bufPtr = 0; 
	bufPtr = strchr(inputbuf, (int)'\r');
	if (bufPtr != 0)
		*bufPtr = 0; 
	
	/* check for leading colon, point to length */
	bufPtr = inputbuf;
	if (':' != *bufPtr++)
		return -4; /* no leading colon */
	
	/* parse length */
	sscanf(bufPtr, "%2x", &(hl->len));
	if (strlen(bufPtr) != 10+hl->len*2)
		return -3; /* bad length */
	checksum = hl->len;
	
	/* parse address */
	sscanf(bufPtr+2, "%4x", &(hl->addr));
	checksum += (hl->addr>>8);
	checksum += hl->addr;
	hl->addr |= ((hl->linaddr)<<16);
	
	/* parse record type */
	sscanf(bufPtr+6, "%2x", &(hl->record));
	if (hl->record == 1) {
		/* EOF line */
		if (hl->len != 0)
			return -3; /* bad length */
		if (strncasecmp(bufPtr+8, "ff", 2))
			return -1; /* bad checksum */
	}
	else if (hl->record == 4)
		hl->linaddr = 0;	/* new linear address */
	else if (hl->record != 0)
		return -2;	/* bad record type */
	checksum += hl->record;
	
	/* parse data */
	bufPtr += 8;
	for (i = 0; i < hl->len; ++i, bufPtr += 2) {
		if (i >= hl->bufsize)
			return -5;	/* buffer full */
		sscanf(bufPtr, "%2x", &t);
		*(hl->membuf+i) = (unsigned char)t;
		checksum += t;
		if (hl->record == 4) {
			hl->linaddr <<= 8;
			hl->linaddr |= (unsigned char)t;
		}
	}
	
	/* parse checksum */
	sscanf(bufPtr, "%2x", &t);
	checksum += t;
	
	if (checksum != 0)
		return -1; /* bad checksum */
	
	return hl->record;
}


/* read_hex
 *
 * Parse a hex file from given input file.
 *
 * Fills mem buffer with appropriate memory contents.
 * Also sets flag buffer to 0 for each address read from file.
 *
 * mem and flag should both be 65536 byte buffers.  You should initialize
 * the contents of flag to something non-zero before calling read_hex if you
 * want to be able to tell which memory addresses are valid.
 *
 * Returns: -1 on error in hex file, 0 otherwise
 */
int read_hex(struct hexfile *hf)
{
	return read_hex_cb(hf, NULL, NULL);
}

/* read_hex_cb
 *
 * Parse a hex file from given input file, invoking a callback for addresses
 * over 65536.
 *
 * Fills mem buffer with appropriate memory contents less than 65536.
 * Also sets flag buffer to 0 for each address read from file.
 *
 * mem and flag should both be 65536 byte buffers.  You should initialize
 * the contents of flag to something non-zero before calling read_hex if you
 * want to be able to tell which memory addresses are valid.
 *
 * cb() can use hl->len bytes of data from hl->membuf, which starts at
 * address hl->addr.
 *
 * Returns: -1 on error in hex file, 0 otherwise
 */
int read_hex_cb(struct hexfile *hf,
               void(*cb)(const struct hexline *, void *), void *arg)
{
	unsigned char *cmem = hf->mem;
	unsigned char *cflag = hf->flag;
	struct hexline *hl;
	int record;
	int retval = 0;
	int line = 0;

	hl = hf->hl;

	while (!feof(hf->ifile))
	{
		record = parse_line(hf);
		
		switch(record)
		{
			case 4:  /* new linear address, do nothing */
				break;
			
			case 1:  /* EOF */
				return retval;

			case 0:  /* code/data */
				if (hl->addr >= hf->memsize) {
					if (cb != NULL)
						cb(hl, arg);
					break;
				}
				memcpy(cmem+hl->addr, hl->membuf, hl->len);
				memset(cflag+hl->addr, 0, hl->len);
				break;

			case -1: /* checksum error */
				fprintf(stderr,
				  "Warning: Bad checksum in hex file ");
				fprintf(stderr, "Line %d\n", line);
				retval = -1;
				record = hl->record;
				continue;
			
			case -2: /* unknown record type */
				fprintf(stderr,
				  "Warning: Unknown record type in hex file ");
				fprintf(stderr, "Line %d\n", line);
				retval = -1;
				break;
				
			case -3: /* bad line length */
				fprintf(stderr, 
				  "Warning: Bad length field in hex file ");
				fprintf(stderr, "Line %d\n", line);
				retval = -1;
				break;
			
			case -4: /* unexpected character */
				fprintf(stderr,
				  "Warning: Bad character in hex file ");
				fprintf(stderr, "Line %d\n", line);
				retval = -1;
				break;

			case -5: /* buffer full */
				fprintf(stderr,
				  "Warning: Buffer full in hex file ");
				fprintf(stderr, "Line %d\n", line);
				retval = -1;
				break;

			default: /* ??? unknown error ??? */
				fprintf(stderr,
				  "Unknown error in hex file Line %d\n", line);
				retval = -1;
		}
		++line;
	}
	
	fprintf(stderr, "Warning: Unexpected end of hex file\n");
	return -1;
}
