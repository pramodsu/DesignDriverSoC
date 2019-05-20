#ifndef _AES_HARNESS_H_DEFINED_
#define _AES_HARNESS_H_DEFINED_

#include "simulate.h"
#include <verilated.h>
#include "Voc8051_xiommu.h"

/** 
  * List of AES registers.
  *
  * localparam AES_REG_START   = 16'hff00; // 1 byte.
  * localparam AES_REG_STATE   = 16'hff01; // 1 byte.
  * localparam AES_REG_ADDR    = 16'hff02; // 2 bytes
  * localparam AES_REG_LEN     = 16'hff04; // 2 bytes.
  * localparam AES_REG_CTR     = 16'hff10;
  * localparam AES_REG_KEY0    = 16'hff20;
  */

void set_aes_state(int value);
int get_aes_state();

void set_aes_addr(int value);
int get_aes_addr();

void set_aes_len(int value);
int get_aes_len();

void set_aes_ctr(const uint8_t* ctr);
void get_aes_ctr(uint8_t* ctr);

void set_aes_key(const uint8_t* key);
void get_aes_key(uint8_t* key);

void set_aes_num_op_bytes(int value);
int get_aes_num_op_bytes();

void set_aes_block_ctr(int value);
int get_aes_block_ctr();

void set_aes_mem_data_buf(const uint8_t* buf);
void get_aes_mem_data_buf(uint8_t* buf);
void set_aes_enc_data_buf(const uint8_t* buf);
void get_aes_enc_data_buf(uint8_t* buf);

#endif
