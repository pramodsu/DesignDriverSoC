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

__xdata __at(0xFE00) unsigned char sha_reg_start;
__xdata __at(0xFE01) unsigned char sha_reg_state;
__xdata __at(0xFE02) unsigned int sha_reg_rd_addr;
__xdata __at(0xFE04) unsigned int sha_reg_wr_addr;
__xdata __at(0xFE06) unsigned int sha_reg_len;
__xdata __at(0xE000) unsigned char d1[256];
__xdata __at(0xE200) unsigned char hash[20];

/*---------------------------------------------------------------------------*/

void main() {

    unsigned int i;
    unsigned int mlen,len =64;
    int good=1;

    // test writing to XRAM.
    for(i=0; i < len; i++) {
        d1[i]=0x41;
    }
    // setup address, length, counter and key.
    sha_reg_rd_addr = (unsigned int) &d1;
    sha_reg_wr_addr = (unsigned int) &hash;
    len = 64;
    mlen = ((len+4+4) & 0xFFC0) + 64;
    d1[len] = 0x80;
    for (i = len+1; i < mlen-3; i++) {
          d1[i] = 0;
    }
    d1[mlen-1] = (len << 3) & 0xFF;
    d1[mlen-2] = (len >> 5) & 0xFF;
    d1[mlen-3] = (len >> 13) & 0xFF;
    sha_reg_len = mlen;

    // now start encryption.
    sha_reg_start = 1;
    // now wait for encryption to complete.
    while(sha_reg_state != 0);

    // read encrypted data and dump it to P0.
    for(i=0; i < 20; i++) {
        //P1 = 1;
        P0 = hash[i];
    }


    // finish.
    quit();
}
