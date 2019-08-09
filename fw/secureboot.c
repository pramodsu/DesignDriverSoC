/*
 * Copyright (c) 1999-2001 Tony Givargis.  Permission to copy is granted
 * provided that this header remains intact.  This software is provided
 * with no warranties.
 *
 * Version : 2.9
 */

/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
#include "rsa.h"
#ifdef C
#ifndef CBMC
#include <stdio.h>
#endif
#else
#include <reg51.h>
#endif

#ifdef CBMC
unsigned char* nondet_ptr();
unsigned int nondet_uint();
unsigned char nondet_uchar();
int nondet_int();

unsigned char valid = 1;
#endif

#ifdef C
unsigned char mem[MEM_SIZE];

#define PRG 0
#define BOOT 1
#define SHAI 2
#define SHAO 3
#define RSAO 4
#endif

XDATA_ARR(0x0000, MAX_PRG_SIZE, unsigned char, program);
XDATA_ARR(0x3000, MAX_IM_SIZE, unsigned char, boot);

XDATA_ARR(0xC000, MAX_IM_SIZE+0x40, unsigned char, sha_in);
XDATA_ARR(0xE100, H, unsigned char, sha_out);
XDATA_ARR(0xE200, N, unsigned char, rsa_out);

/*---------------------------------------------------------------------------*/
#ifdef C
#define PACK(var, size)
unsigned char P0 = 0xFF;
#else
#define PACK(var, size) unsigned char var[size]
#endif

struct modules{
    unsigned int addr;
    PACK(p0,2);  // add extra bytes to account for different type sizes
    unsigned int size;
    PACK(p1,2);
    unsigned char hash[H];
};
struct image{
    unsigned char sig[N];  // signature of header
    unsigned char exp[N];
    unsigned char mod[N];  // n in modexp
    unsigned int num;      // total number of blocks
    PACK(p0, 2);
    struct modules module[1];
};

enum status{
    UNDET,
    FAIL,
    PASS
};

//public key hash
CODE unsigned char pkhash[20] = {0x37, 0x34, 0xA6, 0x83, 
				   0x5F, 0xFC, 0xE0, 0x2B, 
				   0xC6, 0xEE, 0xCB, 0x81, 
				   0x6C, 0x92, 0x6C, 0x7C, 
				   0xBA, 0x79, 0xCB, 0x8F};

#ifndef C
void quit() {
    P0 = P1 = P2 = P3 = 0xDE;
    P0 = P1 = P2 = P3 = 0xAD;
    P0 = P1 = P2 = P3 = 0x00;
    while(1);
}
#endif

void fail(unsigned char* failmes) {
#ifdef C
#ifndef CBMC
  printf("%s\n", failmes);
#endif
#else
  (void)failmes;
  P0 = 0;
  quit();
#endif
}

#ifdef CBMC
void meminit(struct image* image)
{
    int i;
    image->sig[nondet_uint()%N] = nondet_uchar();
    image->exp[nondet_uint()%N] = nondet_uchar();
    image->mod[nondet_uint()%N] = nondet_uchar();
    image->num = nondet_uint();
    for(i=0; i<2; i++){
	image->module[0].addr = nondet_uint();
	image->module[0].size = nondet_uint();
	image->module[0].hash[nondet_uint()%H] = nondet_uchar();
    }
}
#endif

void main() {
    unsigned int i, j;
    unsigned int num;   // total number of blocks
    struct image* im;
    struct modules* block; // current block
    unsigned int size;
    unsigned char* moddata;
    unsigned int ldaddr = 0;
    enum status pass = UNDET;
#ifdef C
    int pages[5];
#endif
#ifdef CBMC
//    unsigned char before, after;
    unsigned int compind;
    // is the image valid?
    unsigned char key_val = 1;
    unsigned char sig_val = 1;
    unsigned char addr_val = 1;
#endif

    // STAGE 0: set up
    pt_init();
#ifdef C
    // put new arrays in mem
    boot = mem_add(MAX_IM_SIZE);
    program = mem_add(MAX_PRG_SIZE);
    sha_in = mem_add(MAX_IM_SIZE+0x40);
    sha_out = mem_add(H);
    rsa_out = mem_add(N);
    // put new arrays into pt
    pages[BOOT] = pt_add(boot, MAX_IM_SIZE);
    pages[PRG] = pt_add(program, MAX_PRG_SIZE);
    pages[SHAI] = pt_add(sha_in, MAX_IM_SIZE+0x40);
    pages[SHAO] = pt_add(sha_out, H);
    pages[RSAO] = pt_add(rsa_out, N);
#endif

    // set SHA read and write addresses
    unlock(SHA, (unsigned char*)&sha_regs.rd_addr, (unsigned char*)(&sha_regs.wr_addr+1));
    writeptr(SHA, &sha_regs.rd_addr, sha_in);
    writeptr(SHA, &sha_regs.wr_addr, sha_out);
    lock(SHA, (unsigned char*)&sha_regs.rd_addr, (unsigned char*)(&sha_regs.wr_addr+1));
    // unlock memwr registers
    unlock(MEMWR, (unsigned char*)&memwr_regs.start, (unsigned char*)(&memwr_regs+1));
    // set up RSA
    unlock(RSA, (unsigned char*)&rsa_regs.opaddr, (unsigned char*)(&rsa_regs.opaddr+1));
    writeptr(RSA, &rsa_regs.opaddr, rsa_out);  // set up address to write to
    lock(RSA, (unsigned char*)&rsa_regs.opaddr, (unsigned char*)(&rsa_regs.opaddr+1));

    if(!RSAinit(rsa_out, sha_in, sha_out)){
	pass = FAIL;
	fail("invalid input/output addresses");
	return;
    }

    // STAGE 1: read image into RAM  
    unlock(pages[BOOT], boot, boot+MAX_IM_SIZE);
#ifndef CBMC  // for CBMC just use initialized values
    load(0, MAX_IM_SIZE, boot, 1);
#else
    pt_reset(pages[BOOT]);
    meminit((struct image*)boot);

    compind = nondet_uint() % MAX_IM_SIZE;  // checking image locking
    //before = boot[compind[0]];
    // something might break the image here
/*    if(nondet_uchar())
	writec(nondet_int(), nondet_ptr(), nondet_uchar(), 0);
*/
#endif
    // image is loaded.
    // now we need to lock boot to boot + MAX_IM_SIZE
    lock(pages[BOOT], boot, boot+MAX_IM_SIZE);

#ifdef CBMC
    if(nondet_uchar())
	writec(nondet_int(), nondet_ptr(), nondet_uint(), 0);
#endif

    // STAGE 2: check that key matches hash
    im  = (struct image*) boot;
    // set signature key
    unlock(RSA_KEYS, rsa_regs.exp, rsa_regs.exp+N);
    writecarr(RSA_KEYS, rsa_regs.exp, im->exp, N);
    lock(RSA_KEYS, rsa_regs.exp, rsa_regs.exp+N);
    // set signature modulus
    unlock(RSA_KEYS, rsa_regs.n, rsa_regs.n+N);
    writecarr(RSA_KEYS, rsa_regs.n, im->mod, N);
    lock(RSA_KEYS, rsa_regs.n, rsa_regs.n+N);

    // check the hashes
    sha1(rsa_regs.exp, 2*N);
#ifndef CBMC
    for(i=0; i<H; i++){
	if(sha_out[i] != pkhash[i]){
	    pass = FAIL;  // FAIL: key hash mismatch
	    fail("key hash mismatch");
	    return;
	}
    }
#else
    // key in image was incorrect, or image has been compromised
    if(!valid || !key_val || !pt_valid(pages[BOOT]) ||
       !pt_valid(RSA_KEYS) || // keys copied incorrectly
       !pt_valid(pages[SHAI]) || !pt_valid(pages[SHAO]) || !pt_valid(SHA))
    {
	pass = FAIL;
	fail("key hash mismatch");
	return;
    }
#endif

    // STAGE 3: verify signature in boot
    num = im->num & 0xFFFF;  // number of modules

    // sizeof image struct includes extra signature and first module
    size = sizeof(struct image) - (im->exp -(unsigned char*)im) + sizeof(struct modules) * (num-1);

    if(size > MAX_IM_SIZE)
    {
	pass = FAIL; // FAIL: image too large
	fail("header too large");
	return;
    }

#ifdef CBMC
    if(nondet_uchar())
	writec(nondet_int(), nondet_ptr(), nondet_uint(), 0);
#endif

    if(!verifySignature(im->exp, size, im->sig)
#ifdef CBMC
       || !sig_val)
#else
	)
#endif
    {
	pass = FAIL;  // FAIL: signature mismatch
	fail("signature mismatch");
	return;
    }


    // STAGE 4: load blocks
    if(num == 0){  // no blocks to load, done
	pass = PASS;
	return;
    }

    unlock(pages[PRG], program, program + MAX_PRG_SIZE);  // unlock memory space for program
    block = im->module;  // block data in header
    moddata = (unsigned char*)(block + num); // program data of this module
    size = 0;

    for(i=0; i<num; i++)
    {

#ifdef CBMC
        unsigned int ldaddr2 = ldaddr;  // checking program loading
	unsigned int size2 = size;
#endif

	// check that size and address are valid
	size = block->size & 0xFFFF;     // size of current module
	ldaddr = block->addr;   // address to load this module into

	// the data does not fit inside the image
	if(moddata + size > boot + MAX_IM_SIZE ||
	   moddata + size < moddata)  // overflow
	{
	    //addr_val = 0;
	    pass = FAIL;
	    fail("data does not fit in image");
	    return;
	}
        // the data does not fit in memory range allocated for it
	if(size + ldaddr > MAX_PRG_SIZE ||
	   ldaddr + size < ldaddr)
	{
	    //addr_val = 0;
	    pass = FAIL;
	    fail("program write out of range");
	    return;
	}

#ifdef CBMC
	if(ldaddr < ldaddr2+size2 && ldaddr2 < ldaddr+size)
	    addr_val = 0;
#endif 
	// load data
	if(size != 0){
	    load(moddata, size, program+ldaddr, 0);	
	}
	// update to next module
	moddata += size;
	block++;
    }

#ifdef CBMC
    if(nondet_uchar())
	writec(nondet_int(), nondet_ptr(), nondet_uint(), 0);
#endif

    // lock newly loaded data
    lock(pages[PRG], program, program + MAX_PRG_SIZE);

    block = im->module;  // go back to first module
    moddata = (unsigned char*)(block + num); // program data of this module

    for(i=0; i<num; i++)
    {
        unsigned int ldaddr;
	size = block->size & 0xFFFF;     // size of current module
	ldaddr = block->addr;   // address to load this module into

	// check module hash
	sha1(program+ldaddr, size);
#ifndef CBMC
	for(j=0; j<H; j++){
	    if(sha_out[j] != block->hash[j]){
		pass = FAIL;
		fail("module hash mismatch");
		return;
	    }
	}
#endif
	// update to next module
	moddata += size;
	block++;
    }
#ifdef CBMC
    // fail if modules overlap, or image or program was corrupted
    if(!valid || !addr_val || !pt_valid(pages[BOOT]) || !pt_valid(pages[PRG]))
    {
	pass = FAIL;
	fail("module hash mismatch");
	return;
    }
#endif
#ifndef CBMC
    // check that program loaded correctly, for testing only
    for(i=0; i<moddata-(unsigned char*)block; i++){
	P0 = program[i];
	if(program[i] != *((unsigned char*)block + i)){
	    pass = FAIL;  // FAIL
	    fail("load is wrong");
	    break;
	}
    }
#endif
    // PASS or FAIL
    if(pass != FAIL)
	pass = PASS;
    //unlock_wr(boot, boot+MAX_IM_SIZE);
    //unlock_wr((unsigned char*)&sha_regs.rd_addr, (unsigned char*)(&sha_regs.rd_addr+1));
    //unlock_wr((unsigned char*)&sha_regs.wr_addr, (unsigned char*)(&sha_regs.wr_addr+1));
    //unlock_wr((unsigned char*)&rsa_regs.opaddr, (unsigned char*)(&rsa_regs.opaddr+1));

    P0 = pass;

#ifdef CBMC
    //after = boot[compind];  // checking image locking;
    assert(pt_valid(pages[BOOT]));
    //assert(!pt_lockchange(pages[BOOT]));  // bootlock
#else
#ifdef C
    printf("pass: %d\n", pass);
#else
    quit();
#endif
#endif
}

// bootlock: image does not change once it is loaded
