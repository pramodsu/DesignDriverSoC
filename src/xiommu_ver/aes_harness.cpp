#include <iostream>
#include <iomanip>
#include <fstream>
#include <stdint.h>

#include <verilated.h>

#include "simulate.h"
#include "aes_harness.h"

void set_aes_state(int value)
{
    top->v__DOT__aes_top_i__DOT__aes_reg_state = value;
}

int get_aes_state()
{
    return top->v__DOT__aes_top_i__DOT__aes_reg_state;
}

void set_aes_addr(int value)
{
    top->v__DOT__aes_top_i__DOT__aes_reg_opaddr = value;
}

int get_aes_addr()
{
    return top->v__DOT__aes_top_i__DOT__aes_reg_opaddr;
}

void set_aes_len(int value)
{
    top->v__DOT__aes_top_i__DOT__aes_reg_oplen = value;
}

int get_aes_len()
{
    return top->v__DOT__aes_top_i__DOT__aes_reg_oplen;
}

void set_aes_block_ctr(int value)
{
    top->v__DOT__aes_top_i__DOT__block_counter = value;
}

int get_aes_block_ctr()
{
    return top->v__DOT__aes_top_i__DOT__block_counter;
}

void set_aes_ctr(const uint8_t* ctr)
{
    setWData(top->v__DOT__aes_top_i__DOT__aes_reg_ctr, ctr, 16);
}

void get_aes_ctr(uint8_t* ctr)
{
    getWData(top->v__DOT__aes_top_i__DOT__aes_reg_ctr, ctr, 16);
}

void set_aes_key(const uint8_t* key)
{
    setWData(top->v__DOT__aes_top_i__DOT__aes_reg_key0, key, 16);
}

void get_aes_key(uint8_t* key)
{
    getWData(top->v__DOT__aes_top_i__DOT__aes_reg_key0, key, 16);
}

void set_aes_mem_data_buf(const uint8_t* buf)
{
    setWData(top->v__DOT__aes_top_i__DOT__mem_data_buf, buf, 16);
}

void get_aes_mem_data_buf(uint8_t* buf)
{
    getWData(top->v__DOT__aes_top_i__DOT__mem_data_buf, buf, 16);
}

void set_aes_enc_data_buf(const uint8_t* buf)
{
    setWData(top->v__DOT__aes_top_i__DOT__encrypted_data_buf, buf, 16);
}

void get_aes_enc_data_buf(uint8_t* buf)
{
    getWData(top->v__DOT__aes_top_i__DOT__encrypted_data_buf, buf, 16);
}

void set_aes_num_op_bytes(int value)
{
    top->v__DOT__aes_top_i__DOT__operated_bytes_count = value;
}

int get_aes_num_op_bytes()
{
    return top->v__DOT__aes_top_i__DOT__operated_bytes_count;
}

