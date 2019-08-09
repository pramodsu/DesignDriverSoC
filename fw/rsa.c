#ifdef C
#ifndef CBMC
#include <openssl/sha.h>
#include <openssl/bn.h>
#include <string.h>
#endif
#endif
#include "rsa.h"

#ifdef CBMC
unsigned char* nondet_ptr();
unsigned int nondet_uint();
unsigned char nondet_uchar();
int nondet_int();
#endif

#ifdef C
#define BUFF_SIZE 0x2000
#define GPRG 5
int pshai, pshao, prsao; // read and write address pages for SHA, and opaddr of RSA
#endif

XDATA_VAR(0xFE00, struct acc_regs, sha_ptr);
XDATA_VAR(0xF9F0, struct acc_regs, memwr_ptr);
XDATA_VAR(0xFA00, struct RSA_regs, rsa_ptr);
struct RSAmsg *decrypted;
XDATA unsigned char *sha_m;
XDATA unsigned char *hash;


#ifdef CBMC
unsigned char sig_val, addr_val;
#endif

#ifndef C
XDATA_ARR(0xFF80, 32, unsigned char, pt_wren);
XDATA_ARR(0xFFA0, 32, unsigned char, pt_rden);
#endif

// state of PRG for G in OAEP
XDATA_ARR(0xF8E0, H, unsigned char, gprg);

/*
#ifdef CBMC
// uninterpreted function that takes input array, input length
// mode: 0=random output, 1=try to look up matching input, 2=setting new hash
// produces output array of H bytes
void uninterp_sha(unsigned char* input, unsigned int inlen, unsigned char mode, unsigned char* hash)
{
    static char* inputs[3];
    static unsigned int lens[3];
    static char outputs[3][H];
    static int total = 0;
    unsigned char a,b,c;
    int i, j;

    if(mode == 0)
    {
	for(i=0; i<total; i++)
	    hash[i] = outputs[i][i]+1;
	for(;i<H; i++)
	    hash[i]=nondet_uchar();
	return;
    }

    if(mode == 2){
	if(total >= 3)  // no more space
	{
	    for(i=0; i<total; i++)
		hash[i] = outputs[i][i]+1;
	    for(;i<H; i++)
		hash[i]=nondet_uchar();
	    return hash;
	}

	inputs[total] = input;
	lens[total] = inlen;
	for(i=0; i<H; i++)
	    outputs[total][i]=hash[i];
	total++;
	return;
    }

    // try and find a match of input with previously seen inputs
    for(i=0; i<total; i++){
	if(lens[i] != inlen)  
	    continue;   // stop comparing if lengths differ
	for(j=0; j < inlen; j++)
	{
	    a = input[j]; b=inputs[i][j];
	    c = a != b;
	    
	    if(c)  
		break;  // stop comparing on first wrong char
	}
	if(j==inlen)
	    break;  // input match
    }
    if(i < total) // found input match
    {
	for(j=0; j<H; j++)
	    hash[j] = outputs[i][j];
	return;
    }
    // make random hash different from saved outputs
    for(i=0; i<total; i++)
	hash[i] = outputs[i][i]+1;
    for(;i<H; i++)
	hash[i]=nondet_uchar();
    return;
}

unsigned char* uninterp_rsa(unsigned char* input)
{
    static char* inputs[2];
    static char outputs[2][N];
    static int total = 0;
    int i, j;

    // try and find a match of input with previously seen inputs
    for(i=0; i<total; i++){
	for(j=0; j < N; j++)
	    if(input[j] != inputs[i][j])  
		break;  // stop comparing on first wrong char
	break;  // input match
    }
    if(i < total) // found input match
	return outputs[i];

    // no more space for new output
    if(i >= 2)
	return gprg;// + (nondet_uint()%MEM_SIZE);

    // make a new random output to return
    for(i=0; i<N; i++)
    {
	outputs[total][i] = nondet_uchar();
    }
    return outputs[total++];
}
#endif
*/
#ifdef C
#define PAGES 11
#define GPRG  5
struct {
    unsigned char* start[PAGES];
    unsigned char* end[PAGES];
    unsigned char locked[PAGES];
    unsigned char valid[PAGES];
    unsigned char lockchange[PAGES];
} pt;

// add new variables to mem
unsigned char* mem_add(unsigned int size)
{
//#ifdef CBMC
    static unsigned char *mem_end = mem;
    unsigned char *front = mem_end;
    mem_end += size;
    return front;
//#else
//    return (mem+(addr < FRONT ? addr : addr - GAP));
//#endif
}

// return page table index number, -1 if not found
int pt_find(unsigned char* start)
{
    unsigned int i;
    
    for(i=0; i<PAGES; i++)
	if(start >= pt.start[i] && start < pt.end[i])
		return i;
    //printf("page not found %p\n", start);
    return -1;
}

// add new arrays into the page table for locking
int pt_add(unsigned char* start, unsigned int size)
{
    static unsigned int index = 0;
    
    // too many entries
    if(index >= PAGES) return -1;
    
    pt.start[index] = start;
    pt.end[index] = start+size;
    pt.locked[index] = 1;
    pt.valid[index] = 1;
    pt.lockchange[index] = 0;

    return index++;
}


// check whether this page has been unlocked since the last reset
int pt_lockchange(int page)
{
    if(page < 0 || page >= PAGES)
	return 0;
    return pt.lockchange[page];
}

// check whether this page has been corrupted by an untrusted write
int pt_valid(int page)
{
    if(page < 0 || page >= PAGES)
	return 0;
    return pt.valid[page];
}

// reset the page
int pt_reset(int page)
{
    if(page < 0 || page >= PAGES)
	return 0;
    pt.valid[page] = 1;
    pt.lockchange[page] = 0;
    return 1;
}

// write data to addr, indicating trusted=from secureboot, untrusted=attacker
int writec(int page, unsigned char* addr, unsigned char data, unsigned char trusted)
{
    unsigned char old;
    if(page < 0 || page >= PAGES || pt.locked[page] || // invalid page, or page is locked
       addr < pt.start[page] || addr >= pt.end[page]) // addr not on this page
    {
	assert(!trusted);
	return 0;
    }
    old = mem[addr-mem];
    //assert(addr-mem >= 0);
    mem[addr-mem] = data;
    //*addr = data;
    if(!trusted)
	pt.valid[page] = old == data;

    return 1;
}
// write len bytes from data to addr
int writecarr(int page, unsigned char* addr, unsigned char* data, unsigned int len)
{
#ifndef CBMC
    unsigned int i;
    for(i=0; i<len; i++){
	writec(page, addr+i, data[i], 1);
    }
    return page;
#else
    unsigned int offset = nondet_uint()%len;
    int wr_success = writec(page, addr+offset, data[offset], 1);
    //assert(wr_success);
    return wr_success;
    #endif
}

int writei(int page, unsigned int* addr, unsigned int data)
{
    if(page < 0 || page >= PAGES || pt.locked[page] ||
       (unsigned char*)addr < pt.start[page] || (unsigned char*)addr >= pt.end[page]){
	//printf("failed write %d\n", page);
	return -1;
    }

    //*addr = data;
    *(unsigned int*)(&mem[(unsigned char*)addr-mem]) = data;

    return page;
}

int writeptr(int page, unsigned char** addr, unsigned char* data)
{
    if(page < 0 || page >= PAGES || pt.locked[page] ||
       (unsigned char*) addr < pt.start[page] || (unsigned char*)addr >= pt.end[page]){
	//printf("failed write %d\n", page);
	return -1;
    }

    //*addr = data;
    *(unsigned char**)(&mem[(unsigned char*)addr-mem]) = data;
    
    return page;
}

// c abstraction of memwr
// return 1 if succeed, 0 if fail
int c_load(unsigned char skipread)
{
    static unsigned char buff[BUFF_SIZE];
    static unsigned char initial = 1;
    static unsigned int max;
    unsigned int stop;
    unsigned int i = 0;
    int page;
    
    memwr_regs.start = 0;
    memwr_regs.state = 1;

    // make a program image
    if(initial)
    {
#ifndef CBMC
	unsigned int hex;
        // read in image
	while(scanf("%x",&hex)!=EOF && i < BUFF_SIZE)
	{
	    buff[i] = hex;
	    i++;
	}
	max = i;
#else
	    max = MAX_IM_SIZE > BUFF_SIZE ? BUFF_SIZE : MAX_IM_SIZE;
#endif
	initial = 0;
    }
    if(!skipread){
	stop = memwr_regs.len > BUFF_SIZE ? BUFF_SIZE : memwr_regs.len;
	if(stop > max) max = stop;
#ifndef CBMC
	memcpy(buff, memwr_regs.rd_addr, stop);
#endif
	writec(MEMWR, &memwr_regs.state, 2, 1);
	page = pt_find(memwr_regs.wr_addr);
	writecarr(page, memwr_regs.wr_addr, memwr_regs.rd_addr, stop);
    }
    else {
	stop = max > memwr_regs.len ? memwr_regs.len : max;
	writec(MEMWR, &memwr_regs.state, 2, 1);
	page = pt_find(memwr_regs.wr_addr);
	writecarr(page, memwr_regs.wr_addr, buff, stop);
    }
    writec(MEMWR, &memwr_regs.state, 0, 1);    

    if(memwr_regs.len > BUFF_SIZE){
	//assert(0);
	return 0;
    }

    return 1;
}

// generate some H byte output
// save result in buffer if indicated
void c_sha(int len)
{
    unsigned int i;
    unsigned char hash[20];

    sha_regs.start = 0;
    sha_regs.state = 1;
#ifndef CBMC
    SHA1(sha_regs.rd_addr, len, hash);
#endif
//    uninterp_sha(sha_regs.rd_addr, len, 1, hash);

    pt.valid[pshao] = 1;
    writecarr(pshao, sha_regs.wr_addr, hash, H);

    sha_regs.state = 0;
    return;
}

// C implementation of modular exponentiation
// return 1 if succeed, 0 if fail
void c_exp()
{
#ifndef CBMC
    BIGNUM *r = BN_new();
    BIGNUM *a = BN_new();
    BIGNUM *p = BN_new();
    BIGNUM *m = BN_new();
    BN_CTX *ctx = BN_CTX_new(); // temp variables
    if(!ctx)
	return;

    rsa_regs.start = 0;
    rsa_regs.state = 1;

    // initialize values
    a = BN_bin2bn((unsigned char*)&rsa_regs.m, N, a);
    p = BN_bin2bn(rsa_regs.exp, N, p);
    m = BN_bin2bn(rsa_regs.n, N, m);

    // do exponentiation
    BN_mod_exp(r, a, p, m, ctx); //r = a^p mod m
    // write back
    writec(RSA, &rsa_regs.state, 2, 1);
    if(pt.locked[prsao] || BN_bn2bin(r, (unsigned char*)decrypted) != N)
    {
	writec(RSA, &rsa_regs.state, 0, 1);
	return;
    }
    
    // clear and free
    BN_CTX_free(ctx);
    BN_free(r);
    BN_free(a);
    BN_free(p);
    BN_free(m);
#else
    unsigned char output[N];

    rsa_regs.start = 0;
    rsa_regs.state = 1;

    //output = uninterp_rsa((unsigned char*)&rsa_regs.m);
    writecarr(prsao, rsa_regs.opaddr, output, N);
#endif
    rsa_regs.state = 0;
}

int lock(int page, unsigned char* startaddr, unsigned char* endaddr)
{
    // addresses are not in this page
    if(page < 0 || page >= PAGES || 
       startaddr < pt.start[page] || endaddr > pt.end[page])
    {
	//assert(0);
	return 0;
    }

    pt.locked[page] = 1;
    return 1;
}
int unlock(int page, unsigned char* startaddr, unsigned char* endaddr)
{
    // addresses are not in this pagen
    if(page < 0 || page >= PAGES || 
       startaddr < pt.start[page] || endaddr > pt.end[page]){
	//printf("incorrect page %d\n", page);
	//assert(0);
	return 0;
    }

    pt.locked[page] = 0;
    pt.lockchange[page] = 1;
    return 1;
}
#else
#define c_load(skipread)
#define c_sha(len)
#define c_exp()

// for locking and unlocking memory
// lock/unlock the pages spanning [startaddr, endaddr)
// return 1 if succeed, 0 if fail
int lock_wr(unsigned char* startaddr, unsigned char* endaddr)
{
    // index of pt_wren
    unsigned int curr = (unsigned int)startaddr >> 11;
    unsigned int end = (unsigned int)endaddr-1 >> 11;
    // range of pages in pt_wren[i]
    unsigned int lowpage = (unsigned int)startaddr >> 8 & 7;
    unsigned int highpage = (unsigned int)endaddr-1 >> 8 & 7;

    // no memory in range
    if(startaddr > endaddr)
	return 0;

    // all pages are in the same index of pt_wren
    if(curr == end)
	pt_wren[curr] &= (1 << highpage+1) - (1 << lowpage) ^ 0xFF;
    else{
	// don't unlock pages below lowpage
	pt_wren[curr] &= (unsigned char)(0xFF << lowpage & 0xFF);
	for(;curr < end; curr++)
	    pt_wren[curr] = 0x00;
	// don't unlock pages above highpage
	pt_wren[end] &= (1 << highpage+1) - 1 ^ 0xFF;
    }
    return 1;
}

int unlock_wr(unsigned char* startaddr, unsigned char* endaddr)
{
    unsigned int curr = (unsigned int)startaddr >> 11;
    unsigned int end = (unsigned int)endaddr-1 >> 11;
    unsigned int lowpage = (unsigned int)startaddr >> 8 & 7;
    unsigned int highpage = (unsigned int)endaddr-1 >> 8 & 7;

    if(startaddr >= endaddr)
	return 0;

    // similar to lock, except OR replaces AND, and the bits to write are flipped
    if(curr == end)
	pt_wren[curr] |= (1 << highpage+1) - (1 << lowpage);
    else{
	pt_wren[curr] |= (unsigned char)(0xFF << lowpage & 0xFF);
	for(;curr < end; curr++)
	    pt_wren[curr] = 0xFF;
	pt_wren[end] |= (1 << highpage+1) - 1;
    }
    return 1;
}
#endif

// initialize pt with registers and state arrays
void pt_init()
{
#ifndef C
    unsigned int i;
    for(i=0; i<32; i++)
	pt_rden[i] = 0xFF;
#else
    memwr_ptr = (struct acc_regs*)mem_add(sizeof(struct acc_regs));
    rsa_ptr = (struct RSA_regs*)mem_add(sizeof(struct RSA_regs));
    sha_ptr = (struct acc_regs*)mem_add(sizeof(struct acc_regs));
    gprg = mem_add(H);
    
    pt_add((unsigned char*)&memwr_regs, sizeof(struct acc_regs));
    pt_add((unsigned char*)&rsa_regs.m, N);
    pt_add(rsa_regs.exp, 2*N);
    pt_add((unsigned char*)&rsa_regs.start,(unsigned char*)(&rsa_regs+1)-(unsigned char*)&rsa_regs.start);
    pt_add((unsigned char*)&sha_regs, sizeof(struct acc_regs));
    pt_add(gprg, H);
#endif
}

// set input and output addresses of HW accelerators
// these should not be changed for the duration of secureboot
unsigned char RSAinit(unsigned char* rsa_out, unsigned char* sha_in, unsigned char* sha_out)
{
    decrypted = (struct RSAmsg*)rsa_out;
    sha_m = (XDATA unsigned char*)sha_in;
    hash = (XDATA unsigned char*)sha_out;
#ifdef C
    pshai = pt_find(sha_m);
    pshao = pt_find(hash);
    prsao = pt_find(rsa_out);

    if(pshai == -1 || pshao == -1 || prsao == -1 || // pages not found
       pshai <= GPRG || pshao <= GPRG || prsao <= GPRG) // page conflict with HW registers, etc
	return 0;
#endif
    return 1;
}
// set up data transfer
// copy data of length bytes to startaddr
// if skipread, don't read from data, just write values already in memwr buffer to startaddr
void load(unsigned char* data, unsigned int length, unsigned char* startaddr, unsigned char skipread)
{
    writeptr(MEMWR, &memwr_regs.rd_addr,(XDATA unsigned char*)data);
    writeptr(MEMWR, &memwr_regs.wr_addr, (XDATA unsigned char*)startaddr);
    writei(MEMWR, &memwr_regs.len, length);
    writec(MEMWR, &memwr_regs.start, (unsigned char)(skipread << 1 | 1), 1); // load in HW

    c_load(skipread);  // load in SW
#ifndef CBMC
    // wait for load to finish
    while(memwr_regs.state != 0);
#endif
}

// returns length of message
int unpad()
{
  int len;

  for(len = sizeof(rsa_regs.m.m)-1; len>=0; len--)
  {
      if(decrypted->m[len] == 1)
	  break;
      else if(decrypted->m[len] != 0)
	  return -1;
  }
  return len;
}

// set up message and compute SHA
void sha1(unsigned char *m, unsigned int len)
{
    unsigned int i;
    unsigned int mlen;

    // addresses have changed
    if(sha_regs.rd_addr != sha_m || sha_regs.wr_addr != hash)
    {
#ifdef CBMC
	valid = 0;
#endif
	return;
    }

    // setup data
    mlen = ((len+4) & 0xFFC0) + 64; // round len+5 up to multiple of 64
#ifdef CBMC
     pt.valid[pshai]=1; // reset validity of sha input
#endif
    unlock(pshai, sha_m, sha_m+mlen);

    if(m != sha_m && len > 0) // don't copy if already in right address
	writecarr(pshai, sha_m, m, len);

#ifndef CBMC
    // add 100.. padding
    writec(pshai, sha_m+len, 0x80, 1);

    for(i=len+1; i<mlen; i++)
	writec(pshai, sha_m+i, 0, 1);

    // insert length in bits
    writec(pshai, sha_m+mlen-1, (len << 3) & 0xFF, 1);
    writec(pshai, sha_m+mlen-2, (len >> 5) & 0xFF, 1);
    writec(pshai, sha_m+mlen-3, (len >> 13) & 0xFF, 1);
#else
    unsigned char buff[mlen-len];
    writecarr(pshai, sha_m+len, buff, mlen-len);
#endif
    // encrypt with sha1
    lock(pshai, sha_m, sha_m+mlen);
#ifdef CBMC
    pt.valid[SHA]=1;
    pt.valid[pshao]=1; // reset validity of sha output
#endif
    unlock(pshao, hash, hash+H);
    unlock(SHA, &sha_regs.start, (unsigned char*)(&sha_regs.len));
#ifdef CBMC
    if(nondet_uchar())
	writec(nondet_int(), nondet_prt(), nondet_char(), 0);
#endif
    writei(SHA, &sha_regs.len, mlen);
    writec(SHA, &sha_regs.start, 1, 1);  // start HW
    c_sha(len);         // do SW
#ifndef CBMC
    while(sha_regs.state != 0);
#endif
    lock(SHA, &sha_regs.start, (unsigned char*)(&sha_regs.len));
    lock(pshao, hash, hash+H);

#ifdef CBMC
    if(sha_regs.len != mlen || sha_regs.rd_addr != sha_m ||
       sha_regs.wr_addr != hash)
	valid = 0;
#endif
}

// HMAC computed and written to sha_regs.wr_addr
void HMAC(const unsigned char *key, unsigned int klen, const unsigned char *message, unsigned int mlen)
{
    unsigned int i;
#ifdef CBMC
    unsigned char buff[64 + (mlen > H ? mlen : H)];

    // inner hash
    unlock(pshai, sha_m, sha_m+mlen+64);
    writecarr(pshai, sha_m, buff, mlen+64);
    sha1(sha_m, 64+mlen);

    // outer hash
    unlock(pshai, sha_m, sha_m+84);
    writecarr(pshai, sha_m, buff, H + 64);
    sha1(sha_m, 64 + H);
#else
    // inner hash
    unlock(pshai, sha_m, sha_m+mlen+64);
    for(i=0; i<klen; i++)
	writec(pshai, sha_m+i, key[i] ^ 0x36, 1);
    for(i=klen; i<64;i++)
	writec(pshai, sha_m+i, 0x36, 1);
    for(i=0; i<mlen; i++)
	writec(pshai, sha_m+i+64, message[i], 1);

    sha1(sha_m, 64+mlen);

    // outer hash
    unlock(pshai, sha_m, sha_m+84);
    for(i=0; i<klen; i++)
	writec(pshai, sha_m+i, key[i] ^ 0x5c, 1);
    for(i=klen; i<64;i++)
	writec(pshai, sha_m+i, 0x5c, 1);
    for(i=0; i<H; i++)
	writec(pshai, sha_m+i+64, hash[i], 1);

    sha1(sha_m, 64 + H);
#endif
}

// copy seed into the PRG state
void PRGinit(unsigned char *seed, unsigned int slen, unsigned char *state)
{
    unsigned int i;
#ifdef C
    int page = pt_find(state);
#endif
    if(slen > H) slen = H;
    unlock(page, state, state+H);
    writecarr(page, state, seed, slen);
    for(i=slen; i<H; i++)
	writec(page, state+i, 0, 1);
    lock(page, state, state+H);
}

// random zero and one for PRG
const unsigned char zero[] = {0x98, 0xBC, 0x1B, 0x58,
			     0xC2, 0x5B, 0x7B, 0x51,
			     0x48, 0x14, 0x83, 0xA7,
			     0xEA, 0xDB, 0x15, 0x2E,
			     0xCE, 0x7A, 0xE1, 0x0C,
			     0xF7, 0x1D, 0x96, 0xDE,
			     0xDE, 0x16, 0x68, 0x61,
			     0x48, 0x25, 0x99, 0x66};

const unsigned char one[] = {0xA2, 0x66, 0x95, 0x53,
			     0x0E, 0x13, 0x56, 0xA9,
			     0xDF, 0x42, 0x6F, 0x0F,
			     0x74, 0xA4, 0x06, 0xFF,
			     0xA0, 0x6D, 0x07, 0x17,
			     0x30, 0xAE, 0x16, 0xD2,
			     0x87, 0x76, 0x8A, 0x9B,
			     0x92, 0xAE, 0x36, 0xB9};


// generate random number, put in hash
void PRG(unsigned char* state)
{
    unsigned int i;
    unsigned char next[H];
#ifdef C
    int page = pt_find(state);
#endif
    // compute next state
    HMAC(state, H, one, 32);
    for(i=0; i<H; i++)
	next[i] = sha_regs.wr_addr[i];

    // compute next output
    HMAC(state, H, zero, 32);
    unlock(page, state, state+H);
    writecarr(page, state, next, H);
    lock(page, state, state+H);
}

// seed for computing H function in OAEP
const unsigned char Hseed[] = {
    0x66, 0x02, 0x5D, 0xC9,
    0x80, 0x48, 0xA5, 0x9F,
    0x2C, 0xB3, 0xAA, 0x6C,
    0x1A, 0x81, 0xA9, 0xAA,
    0xE8, 0x93, 0x21, 0x0E/*,
    0x24, 0x99, 0x6F, 0x06,
    0xEB, 0xC0, 0x4F, 0x3A,
    0x0D, 0x2F, 0x8F, 0x0A*/
};

// remove OAEP from message at location rsa_regs.opaddr
void removeOAEP()
{
    unsigned int i,j;

    // compute r
    HMAC(Hseed, H, decrypted->m, N-K2-1);
    // copy r to message
    unlock(prsao, rsa_regs.opaddr, rsa_regs.opaddr + N);
    for(i=0; i< K2; i++)
	writec(prsao, decrypted->r+i,decrypted->r[i] ^ sha_regs.wr_addr[i], 1);
    lock(prsao, rsa_regs.opaddr, rsa_regs.opaddr+N);

    // find m
    PRGinit(decrypted->r, K2, gprg);
    PRG(gprg);
    unlock(prsao, rsa_regs.opaddr, rsa_regs.opaddr + N);
    i=0; j=0;
    while(i < N-K2-1)
    {
	if(j == H)
	{
	    lock(prsao, rsa_regs.opaddr, rsa_regs.opaddr+N);
	    PRG(gprg);
	    j = 0;
	    unlock(prsao, rsa_regs.opaddr, rsa_regs.opaddr + N);
	}
	writec(prsao, decrypted->m+i, decrypted->m[i] ^ sha_regs.wr_addr[j], 1);
	i++;
	j++;
    }
    lock(prsao, rsa_regs.opaddr, rsa_regs.opaddr+N);
}

// decrypt msg, puts decrypted text in rsa_regs.opaddr
// returns length of decrypted message
int decrypt(unsigned char* msg){
    unsigned int i;
    
    if(rsa_regs.opaddr != (unsigned char*)decrypted)
	return -1;

    // copy msg into RSA m register
    if(msg != (unsigned char*)&rsa_regs.m)
    {
#ifdef C
	pt.valid[RSA_M] = 1;
#endif
	unlock(RSA_M, (unsigned char*)&rsa_regs.m, (unsigned char*)&rsa_regs.m+N);
	//load(msg, N, (unsigned int)rsa_regs.m, 0);
	writecarr(RSA_M, (unsigned char*)&rsa_regs.m, msg, N);
#ifdef CBMC	
	if(nondet_uchar())
	    writec(nondet_int(), nondet_prt(), nondet_char(), 0);
#endif
	// lock message during exponentiation
	lock(RSA_M, (unsigned char*)&rsa_regs.m, (unsigned char*)&rsa_regs.m + N);
    }

    // decrypt
    unlock(prsao, rsa_regs.opaddr, rsa_regs.opaddr+N);
#ifdef C
    pt.valid[RSA] = 1;
#endif
    unlock(RSA, &rsa_regs.start, (unsigned char*)(&rsa_regs.state+1));
#ifdef CBMC
    if(nondet_uchar())
	writec(nondet_int(), nondet_ptr(), nondet_uchar(), 0);
#endif
    writec(RSA, &rsa_regs.start, 1, 1);
    if(rsa_regs.opaddr != (unsigned char*)decrypted)
	return -1;
    c_exp();  // c abstraction
#ifndef CBMC
    while(rsa_regs.state != 0);
#endif
    lock(RSA, &rsa_regs.start, (unsigned char*)(&rsa_regs.state+1));    
    lock(prsao, rsa_regs.opaddr, rsa_regs.opaddr+N);

#ifndef CBMC
    // check pad byte
    if(decrypted->padbyte != 1)
	return -1;
#endif
    removeOAEP();
#ifndef CBMC
    return unpad();
#else
    return H;
#endif
}

unsigned char verifySignature(unsigned char* msg, unsigned int len, unsigned char* signature){
    unsigned int i;
    int slen;

    // decrypt the signature
    slen = decrypt(signature);

    // compare with hash of msg
    if(slen != H)
	return 0;
    sha1(msg, len);
#ifndef CBMC
    for(i=0; i<H; i++){
	if(sha_regs.wr_addr[i] != decrypted->m[i])
	    return 0;
    }
    return 1;
#else
    return valid && pt.valid[prsao] && pt.valid[RSA_M];
#endif
}


