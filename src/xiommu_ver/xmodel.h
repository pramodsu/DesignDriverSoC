#ifndef _XMODEL_H_DEFINED_
#define _XMODEL_H_DEFINED

#include "aes_harness.h"
#include "sha_harness.h"

struct xm_state_t {
    struct {
        int reg_state;
        int reg_addr;
        int reg_len;
        int reg_num_op_bytes;
        int reg_block_ctr;

        uint8_t reg_ctr[16];
        uint8_t reg_key[16];
    } aes;

    struct {
        int reg_state;
        int reg_rdaddr;
        int reg_wraddr;
        int reg_len;
        int reg_bytes_read;
        int reg_block_ctr;
    } sha;

    xram_val_t xram;
    xm_state_t();
    void read(std::istream& in);
    void write(std::ostream& out);
    bool operator==(const xm_state_t& other) const;
};

enum xm_op_t { XM_NOP, XM_RD, XM_WR };

void xm_init_state(const xm_state_t& state);
void xm_read_state(xm_state_t& state);

void eval_state(
    xm_op_t op,
    int addrin,
    int datain,
    int& dataout,
    const xm_state_t& state_in,
    xm_state_t& state_out
);


void test_harness(void);
void xm_simulate(const char* filein);

#endif
