#include <reg51.h>

/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/

void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}

__xdata __at(0xFE40) unsigned char memwr_reg_start;
__xdata __at(0xFE41) unsigned char memwr_reg_state;
__xdata __at(0xFE42) unsigned int memwr_reg_rd_addr;
__xdata __at(0xFE44) unsigned int memwr_reg_wr_addr;
__xdata __at(0xFE46) unsigned int memwr_reg_len;
__xdata __at(0xE000) unsigned char datasrc[66];
__xdata __at(0xE100) unsigned char datadst[66];

/*---------------------------------------------------------------------------*/

void main() {
    
    int i;
    int good=1;

    // test writing to XRAM.
    for(i=0; i < 65; i++) {
        datasrc[i]=i;
    }
    datasrc[65] = 0;
    datadst[65] = 65;

    // setup address, length, counter and key.
    memwr_reg_rd_addr = (unsigned int)&datasrc;
    memwr_reg_wr_addr = (unsigned int)&datadst;
    memwr_reg_len = 65;

    // start copying
    memwr_reg_start = 1;
    // now wait for copying to complete.
    while(memwr_reg_state != 0);

    // check
    for(i=0; i < 66; i++) {
	P0 = datadst[i];
        if(datadst[i] != i) { 
            good = 0;
            break;
        }
    }
    P0 = good;
    // finish.
    quit();
}
