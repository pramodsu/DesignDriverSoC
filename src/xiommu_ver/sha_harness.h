#ifndef _SHA_HARNESS_H_DEFINED_
#define _SHA_HARNESS_H_DEFINED_

#include "simulate.h"
#include <verilated.h>
#include "Voc8051_xiommu.h"

/** 
  * List of SHA registers.
  *
  * localparam SHA_REG_START   = 16'hfe00; // 1 byte.
  * localparam SHA_REG_STATE   = 16'hfe01; // 1 byte.
  * localparam SHA_REG_RD_ADDR = 16'hfe02; // 2 bytes
  * localparam SHA_REG_WR_ADDR = 16'hfe04; // 2 bytes
  * localparam SHA_REG_LEN     = 16'hfe06; // 2 bytes.
  */

void set_sha_state(int value);
int get_sha_state();

void set_sha_rdaddr(int value);
int get_sha_rdaddr();

void set_sha_wraddr(int value);
int get_sha_wraddr();

void set_sha_len(int value);
int get_sha_len();

void set_sha_bytes_read(int value);
int get_sha_bytes_read();

void set_sha_block_ctr(int value);
int get_sha_block_ctr();

#endif

