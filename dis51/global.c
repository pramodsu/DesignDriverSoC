/* global.c
 *
 * Data shared by all modules
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
 */

#include "distypes.h" 

int Lst;
short lbl[65536];

const char mnemonic[256][20] = {
/* 0 */
	"NOP",
	"AJMP %s\n",
	"LJMP %s\n",
	"RR A",
	"INC A",
	"INC %s",
	"INC @R0",
	"INC @R1",
	"INC R0",
	"INC R1",
	"INC R2",
	"INC R3",
	"INC R4",
	"INC R5",
	"INC R6",
	"INC R7",
/* 1 */
	"JBC %s, %s",
	"ACALL %s",
	"LCALL %s",
	"RRC A",
	"DEC A",
	"DEC %s",
	"DEC @R0",
	"DEC @R1",
	"DEC R0",
	"DEC R1",
	"DEC R2",
	"DEC R3",
	"DEC R4",
	"DEC R5",
	"DEC R6",
	"DEC R7",
/* 2 */
	"JB %s, %s",
	"AJMP %s\n",
	"RET\n",
	"RL A",
	"ADD A, #%s",
	"ADD A, %s",
	"ADD A, @R0",
	"ADD A, @R1",
	"ADD A, R0",
	"ADD A, R1",
	"ADD A, R2",
	"ADD A, R3",
	"ADD A, R4",
	"ADD A, R5",
	"ADD A, R6",
	"ADD A, R7",
/* 3 */
	"JNB %s, %s",
	"ACALL %s",
	"RETI\n",
	"RLC A",
	"ADDC A, #%s",
	"ADDC A, %s",
	"ADDC A, @R0",
	"ADDC A, @R1",
	"ADDC A, R0",
	"ADDC A, R1",
	"ADDC A, R2",
	"ADDC A, R3",
	"ADDC A, R4",
	"ADDC A, R5",
	"ADDC A, R6",
	"ADDC A, R7",
/* 4 */
	"JC %s",
	"AJMP %s\n",
	"ORL %s, A",
	"ORL %s, #%s",
	"ORL A, #%s",
	"ORL A, %s",
	"ORL A, @R0",
	"ORL A, @R1",
	"ORL A, R0",
	"ORL A, R1",
	"ORL A, R2",
	"ORL A, R3",
	"ORL A, R4",
	"ORL A, R5",
	"ORL A, R6",
	"ORL A, R7",
/* 5 */
	"JNC %s",
	"ACALL %s",
	"ANL %s, A",
	"ANL %s, #%s",
	"ANL A, #%s",
	"ANL A, %s",
	"ANL A, @R0",
	"ANL A, @R1",
	"ANL A, R0",
	"ANL A, R1",
	"ANL A, R2",
	"ANL A, R3",
	"ANL A, R4",
	"ANL A, R5",
	"ANL A, R6",
	"ANL A, R7",
/* 6 */
	"JZ %s",
	"AJMP %s\n",
	"XRL %s, A",
	"XRL %s, #%s",
	"XRL A, #%s",
	"XRL A, %s",
	"XRL A, @R0",
	"XRL A, @R1",
	"XRL A, R0",
	"XRL A, R1",
	"XRL A, R2",
	"XRL A, R3",
	"XRL A, R4",
	"XRL A, R5",
	"XRL A, R6",
	"XRL A, R7",
/* 7 */
	"JNZ %s",
	"ACALL %s",
	"ORL C, %s",
	"JMP @A+DPTR\n",
	"MOV A, #%s",
	"MOV %s, #%s",
	"MOV @R0, #%s",
	"MOV @R1, #%s",
	"MOV R0, #%s",
	"MOV R1, #%s",
	"MOV R2, #%s",
	"MOV R3, #%s",
	"MOV R4, #%s",
	"MOV R5, #%s",
	"MOV R6, #%s",
	"MOV R7, #%s",
/* 8 */
	"SJMP %s\n",
	"AJMP %s\n",
	"ANL C, %s",
	"MOVC A, @A+PC",
	"DIV AB",
	"MOV %s, %s",
	"MOV %s, @R0",
	"MOV %s, @R1",
	"MOV %s, R0",
	"MOV %s, R1",
	"MOV %s, R2",
	"MOV %s, R3",
	"MOV %s, R4",
	"MOV %s, R5",
	"MOV %s, R6",
	"MOV %s, R7",
/* 9 */
	"MOV DPTR, #0%X%02Xh",
	"ACALL %s",
	"MOV %s, C",
	"MOVC A, @A+DPTR",
	"SUBB A, #%s",
	"SUBB A, %s",
	"SUBB A, @R0",
	"SUBB A, @R1",
	"SUBB A, R0",
	"SUBB A, R1",
	"SUBB A, R2",
	"SUBB A, R3",
	"SUBB A, R4",
	"SUBB A, R5",
	"SUBB A, R6",
	"SUBB A, R7",
/* A */
	"ORL C, /%s",
	"AJMP %s\n",
	"MOV C, %s",
	"INC DPTR",
	"MUL AB",
	"ECALL %s",               /* undefined opcode */
	"MOV @R0, %s",
	"MOV @R1, %s",
	"MOV R0, %s",
	"MOV R1, %s",
	"MOV R2, %s",
	"MOV R3, %s",
	"MOV R4, %s",
	"MOV R5, %s",
	"MOV R6, %s",
	"MOV R7, %s",
/* B */
	"ANL C, /%s",
	"ACALL %s",
	"CPL %s",
	"CPL C",
	"CJNE A, #%s, %s",
	"CJNE A, %s, %s",
	"CJNE @R0, #%s, %s",
	"CJNE @R1, #%s, %s",
	"CJNE R0, #%s, %s",
	"CJNE R1, #%s, %s",
	"CJNE R2, #%s, %s",
	"CJNE R3, #%s, %s",
	"CJNE R4, #%s, %s",
	"CJNE R5, #%s, %s",
	"CJNE R6, #%s, %s",
	"CJNE R7, #%s, %s",
/* C */
	"PUSH %s",
	"AJMP %s\n",
	"CLR %s",
	"CLR C",
	"SWAP A",
	"XCH A, %s",
	"XCH A, @R0",
	"XCH A, @R1",
	"XCH A, R0",
	"XCH A, R1",
	"XCH A, R2",
	"XCH A, R3",
	"XCH A, R4",
	"XCH A, R5",
	"XCH A, R6",
	"XCH A, R7",
/* D */
	"POP %s",
	"ACALL %s",
	"SETB %s",
	"SETB C",
	"DA A",
	"DJNZ %s, %s",
	"XCHD A, @R0",
	"XCHD A, @R1",
	"DJNZ R0, %s",
	"DJNZ R1, %s",
	"DJNZ R2, %s",
	"DJNZ R3, %s",
	"DJNZ R4, %s",
	"DJNZ R5, %s",
	"DJNZ R6, %s",
	"DJNZ R7, %s",
/* E */
	"MOVX A, @DPTR",
	"AJMP %s\n",
	"MOVX A, @R0",
	"MOVX A, @R1",
	"CLR A",
	"MOV A, %s",
	"MOV A, @R0",
	"MOV A, @R1",
	"MOV A, R0",
	"MOV A, R1",
	"MOV A, R2",
	"MOV A, R3",
	"MOV A, R4",
	"MOV A, R5",
	"MOV A, R6",
	"MOV A, R7",
/* F */
	"MOVX @DPTR, A",
	"ACALL %s",
	"MOVX @R0, A",
	"MOVX @R1, A",
	"CPL A",
	"MOV %s, A",
	"MOV @R0, A",
	"MOV @R1, A",
	"MOV R0, A",
	"MOV R1, A",
	"MOV R2, A",
	"MOV R3, A",
	"MOV R4, A",
	"MOV R5, A",
	"MOV R6, A",
	"MOV R7, A"
};


/* op_format table
 *
 *  0 = illegal opcode
 *  1 = no operands
 *  2 = one immediate operand
 *  3 = one direct operand
 *  4 = one bit-addressed operand
 *  5 = one relative address operand
 *  6 = one absolute address operand
 *  7 = two-byte immediate operand
 *  8 = two operands: direct, immediate
 *  9 = two operands: direct, direct
 * 10 = two operands: immediate, relative address
 * 11 = two operands: direct, relative address
 * 12 = two operands: bit address, relative address
 * 13 = two-byte long address operand
 */
const char op_format[256] = {
	 1, 6, 13, 1, 1,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, /* 0 */
	12, 6, 13, 1, 1,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, /* 1 */
	12, 6,  1, 1, 2,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, /* 2 */
	12, 6,  1, 1, 2,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, /* 3 */
	 5, 6,  3, 8, 2,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, /* 4 */
	 5, 6,  3, 8, 2,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, /* 5 */
	 5, 6,  3, 8, 2,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, /* 6 */
	 5, 6,  4, 1, 2,  8, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, /* 7 */
	 5, 6,  4, 1, 1,  9, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, /* 8 */
	 7, 6,  4, 1, 2,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, /* 9 */
	 4, 6,  4, 1, 1,  13, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3, /* A */
	 4, 6,  4, 1, 10, 11, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, /* B */
	 3, 6,  4, 1, 1,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, /* C */
	 3, 6,  4, 1, 1, 11, 1, 1, 5, 5, 5, 5, 5, 5, 5, 5, /* D */
	 1, 6,  1, 1, 1,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, /* E */
	 1, 6,  1, 1, 1,  3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1  /* F */
};

const char sfbitname[128][6] = {
/* 80 */
	"P0.0", "P0.1", "P0.2", "P0.3", "P0.4", "P0.5", "P0.6", "P0.7",
/* 88 */
	"IT0", "IE0", "IT1", "IE1", "TR0", "TF0", "TR1", "TF1",
/* 90 */
	"P1.0", "P1.1", "P1.2", "P1.3", "P1.4", "P1.5", "P1.6", "P1.7",
/* 98 */
	"RI", "TI", "RB8", "TB8", "REN", "SM2", "SM1", "SM0",
/* A0 */
	"P2.0", "P2.1", "P2.2", "P2.3", "P2.4", "P2.5", "P2.6", "P2.7",
/* A8 */
	"EX0", "ET0", "EX1", "ET1", "ES", "0ADh", "0AEh", "EA",
/* B0 */
	"P3.0", "P3.1", "P3.2", "P3.3", "P3.4", "P3.5", "P3.6", "P3.7",
/* B8 */
	"PX0", "PT0", "PX1", "PT1", "PS", "0BDh", "0BEh", "0BFh",
/* C0 */
	"0C0h", "0C1h", "0C2h", "0C3h", "0C4h", "0C5h", "0C6h", "0C7h",
/* C8 */
	"0C8h", "0C9h", "0CAh", "0CBh", "0CCh", "0CDh", "0CEh", "0CFh",
/* D0 */
	"P", "0D1h", "OV", "RS0", "RS1", "F0", "AC", "CY",
/* D8 */
	"0D8h", "0D9h", "0DAh", "0DBh", "0DCh", "0DDh", "0DEh", "0DFh",
/* E0 */
	"ACC.0", "ACC.1", "ACC.2", "ACC.3", "ACC.4", "ACC.5", "ACC.6", "ACC.7",
/* E8 */
	"0E8h", "0E9h", "0EAh", "0EBh", "0ECh", "0EDh", "0EEh", "0EFh",
/* F0 */
	"B.0", "B.1", "B.2", "B.3", "B.4", "B.5", "B.6", "B.7",
/* F8 */
	"0F8h", "0F9h", "0FAh", "0FBh", "0FCh", "0FDh", "0FEh", "0FFh"
};

const char sfrname[128][5] = {
/* 80 */
	"P0", "SP", "DPL", "DPH", "84h", "85h", "86h", "PCON",
/* 88 */
	"TCON", "TMOD", "TL0", "TL1", "TH0", "TH1", "8Eh", "8Fh",
/* 90 */
	"P1", "91h", "92h", "93h", "94h", "95h", "96h", "97h",
/* 98 */
	"SCON", "SBUF", "9Ah", "9Bh", "9Ch", "9Dh", "9Eh", "9Fh",
/* A0 */
	"P2", "0A1h", "0A2h", "0A3h", "0A4h", "0A5h", "0A6h", "0A7h",
/* A8 */
	"IE", "0A9h", "0AAh", "0ABh", "0ACh", "0ADh", "0AEh", "0AFh",
/* B0 */
	"P3", "0B1h", "0B2h", "0B3h", "0B4h", "0B5h", "0B6h", "0B7h",
/* B8 */
	"IP", "0B9h", "0BAh", "0BBh", "0BCh", "0BDh", "0BEh", "0BFh",
/* C0 */
	"0C0h", "0C1h", "0C2h", "0C3h", "0C4h", "0C5h", "0C6h", "0C7h",
/* C8 */
	"0C8h", "0C9h", "0CAh", "0CBh", "0CCh", "0CDh", "0CEh", "0CFh",
/* D0 */
	"PSW", "0D1h", "0D2h", "0D3h", "0D4h", "0D5h", "0D6h", "0D7h",
/* D8 */
	"0D8h", "0D9h", "0DAh", "0DBh", "0DCh", "0DDh", "0DEh", "0DFh",
/* E0 */
	"ACC", "0E1h", "0E2h", "0E3h", "0E4h", "0E5h", "0E6h", "0E7h",
/* E8 */
	"0E8h", "0E9h", "0EAh", "0EBh", "0ECh", "0EDh", "0EEh", "0EFh",
/* F0 */
	"B", "0F1h", "0F2h", "0F3h", "0F4h", "0F5h", "0F6h", "0F7h",
/* F8 */
	"0F8h", "0F9h", "0FAh", "0FBh", "0FCh", "0FDh", "0FEh", "0FFh"
};
