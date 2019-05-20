#include <iostream>
#include <iomanip>
#include <fstream>
#include <stdint.h>

#include <verilated.h>

#include "simulate.h"
#include "sha_harness.h"

void set_sha_state(int value)
{
    top->v__DOT__sha_top_i__DOT__sha_reg_state = value;
}

int get_sha_state()
{
    return top->v__DOT__sha_top_i__DOT__sha_reg_state;
}

void set_sha_rdaddr(int value)
{
    top->v__DOT__sha_top_i__DOT__sha_reg_rd_addr = value;
}

int get_sha_rdaddr()
{
    return top->v__DOT__sha_top_i__DOT__sha_reg_rd_addr;
}

void set_sha_wraddr(int value)
{
    top->v__DOT__sha_top_i__DOT__sha_reg_wr_addr = value;
}

int get_sha_wraddr()
{
    return top->v__DOT__sha_top_i__DOT__sha_reg_wr_addr;
}

void set_sha_len(int value)
{
    top->v__DOT__sha_top_i__DOT__sha_reg_len = value;
}

int get_sha_len()
{
    return top->v__DOT__sha_top_i__DOT__sha_reg_len;
}

void set_sha_block_ctr(int value)
{
    top->v__DOT__sha_top_i__DOT__block_counter = value;
}

int get_sha_block_ctr()
{
    return top->v__DOT__sha_top_i__DOT__block_counter;
}

void set_sha_bytes_read(int value)
{
    top->v__DOT__sha_top_i__DOT__reg_bytes_read = value;
}

int get_sha_bytes_read()
{
    return top->v__DOT__sha_top_i__DOT__reg_bytes_read;
}

