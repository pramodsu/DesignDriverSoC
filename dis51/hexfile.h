/* hexfile.h
 *
 * Library for reading files in Intel hex format.
 *
 * Copyright 2001-2003 by David Sullins
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

#ifndef _HEXLIB_H_
#define _HEXLIB_H_

#include <stdio.h>

/* The author once read that 100 characters is the maximum length of a
 * hex-file line (source forgotten), so HFINPUTSIZE is defined as 100 by
 * default.  Redefine and recompile if that length is a problem.
 */
#ifndef HFINPUTSIZE
#define HFINPUTSIZE 100
#endif

struct hexline;

/* struct hexfile
 *
 * - ifile is the file to take input from.
 * - memsize is the size of internal memory buffers.
 * - mem is a pointer to the contents of memory.
 * - flag is a pointer to a set of flags indicating which memory addresses
 *   are valid.
 * - hl is a pointer to an internally-used structure.
 *
 * Call init_hexfile before using and destroy_hexfile when done.
 */
struct hexfile {
	FILE *ifile;
	int memsize;
	unsigned char *mem;
	unsigned char *flag;
	struct hexline *hl;
};

/* init_hexfile
 *
 * Initializes a struct hexfile.
 *
 * memsize should be the size of the internal memory buffer.  65536 is a
 *   good choice for most hex files.
 * filename should be a readable hex file OR ifile should be a valid
 *   input stream.  To use filename, set ifile to NULL.
 *
 * Return 0 upon success, -1 otherwise.
 */
int init_hexfile(struct hexfile *hf, int memsize, FILE *ifile, const char
	*filename);

/* destroy_hexfile
 *
 * Undoes what init_hexfile did.  Closes input hexfile.
 */
void destroy_hexfile(struct hexfile *hf);

/* read_hex
 *
 * Parse a hex file from given input file, ignoring addresses >= memsize.
 *
 * Fills mem buffer with appropriate memory contents.
 * Also sets flag buffer to 0 for each address read from file (initially
 *   128).
 *
 * Returns: -1 on error in hex file, 0 otherwise
 */
int read_hex(struct hexfile *hf);

/* read_hex_cb
 *
 * Parse a hex file from given input file, invoking a callback for addresses
 * >= memsize.
 *
 * Fills mem buffer with appropriate memory contents less than memsize.
 * Also sets flag buffer to 0 for each address read from file.
 *
 * cb() can use hl->len bytes of data from hl->membuf, which starts at
 * address hl->addr.  arg is passed as the second argument to cb().
 *
 * Returns: -1 on error in hex file, 0 otherwise
 */
int read_hex_cb(struct hexfile *hf, 
	void(*cb)(const struct hexline *, void *), void *arg);

/*
 * STOP! You probably don't need anything below this line.
 *       These routines are available if you want to implement something
 *       like read_hex yourself.
 */

/* struct hexline
 *
 * - membuf points to len bytes from the last read line.
 * - addr is the starting address of the data in membuf.
 * - len is the number of bytes read from the last line.
 * - record is the numeric record type of the last read line.
 * - bufsize is the length of membuf in bytes.
 * - linaddr is the current linear address.  Initialize to 0 before calling
 *   parse_line the first time.  After that, parse_line takes care of the
 *   rest.
 *
 * Call init_hexline before using and destroy_hexline when done.
 */
struct hexline {
	unsigned int addr;
	int len;
	unsigned char *membuf;
	int record;
	int bufsize;
	int linaddr;
};

/* init_hexline
 *
 * Initializes a struct hexline.
 * filename should be a readable hex file.
 *
 * Return 0 upon success, -1 otherwise.
 */
int init_hexline(struct hexline *hl);

/* destroy_hexline
 *
 * Undoes what init_hexline did.
 */
void destroy_hexline(struct hexline *hl);

/* parse_line
 *
 * Parse one line of a hex file.  Will not read a line larger than
 * HFINPUTSIZE characters.  
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
int parse_line(struct hexfile *hf);


#endif /* _HEXLIB_H_ */
