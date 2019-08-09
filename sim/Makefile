sim: simulation.cpp Voc8051_tb__ALL.a
	g++ -o sim -I/usr/share/verilator/include/ /usr/share/verilator/include/verilated.cpp simulation.cpp Voc8051_tb__ALL.a

Voc8051_tb__ALL.a: Voc8051_tb.mk
	make -f Voc8051_tb.mk

RTL_DIR:=../rtl
Voc8051_tb.mk: ../rtl/*.v
	verilator --cc -Mdir . 	\
	-I${RTL_DIR}			\
	-Wno-UNOPTFLAT -Wno-CASEINCOMPLETE -Wno-CASEX -Wno-WIDTH -Wno-PINMISSING   -Wno-STMTDLY -Wno-IMPLICIT -Wno-LITENDIAN    -Wno-INITIALDLY        \
	${RTL_DIR}/oc8051_tb.v                     \
	${RTL_DIR}/oc8051_top.v                    \
	${RTL_DIR}/oc8051_xram.v                   \
	${RTL_DIR}/oc8051_alu_src_sel.v            \
	${RTL_DIR}/oc8051_alu.v                    \
	${RTL_DIR}/oc8051_decoder.v                \
	${RTL_DIR}/oc8051_divide.v                 \
	${RTL_DIR}/oc8051_multiply.v               \
	${RTL_DIR}/oc8051_memory_interface.v       \
	${RTL_DIR}/oc8051_ram_top.v                \
	${RTL_DIR}/oc8051_acc.v                    \
	${RTL_DIR}/oc8051_comp.v                   \
	${RTL_DIR}/oc8051_sp.v                     \
	${RTL_DIR}/oc8051_dptr.v                   \
	${RTL_DIR}/oc8051_cy_select.v              \
	${RTL_DIR}/oc8051_psw.v                    \
	${RTL_DIR}/oc8051_indi_addr.v              \
	${RTL_DIR}/oc8051_ports.v                  \
	${RTL_DIR}/oc8051_b_register.v             \
	${RTL_DIR}/oc8051_uart.v                   \
	${RTL_DIR}/oc8051_int.v                    \
	${RTL_DIR}/oc8051_tc.v                     \
	${RTL_DIR}/oc8051_tc2.v                    \
	${RTL_DIR}/oc8051_icache.v                 \
	${RTL_DIR}/oc8051_wb_iinterface.v          \
	${RTL_DIR}/oc8051_sfr.v                    \
	${RTL_DIR}/oc8051_cxrom.v                  \
	${RTL_DIR}/oc8051_symbolic_cxrom.v         \
	${RTL_DIR}/oc8051_rom.v                    \
	${RTL_DIR}/oc8051_cache_ram.v              \
	${RTL_DIR}/oc8051_ram_256x8_two_bist.v     \
	${RTL_DIR}/oc8051_ram_64x32_dual_bist.v    \
	${RTL_DIR}/oc8051_etr.v                    \
	${RTL_DIR}/oc8051_priv_lvl.v               \
	${RTL_DIR}/oc8051_page_table.v             \
	${RTL_DIR}/aes_128.v                       \
	${RTL_DIR}/aes_round.v                     \
	${RTL_DIR}/aes_table.v                     \
	${RTL_DIR}/reg2byte.v                      \
	${RTL_DIR}/reg16byte.v                     \
	${RTL_DIR}/reg256byte.v                    \
	${RTL_DIR}/aes_top.v                       \
	${RTL_DIR}/oc8051_procarbiter.v            \
	${RTL_DIR}/oc8051_memarbiter.v             \
	${RTL_DIR}/oc8051_xiommu.v                 \
	${RTL_DIR}/sha1_core.v                     \
	${RTL_DIR}/sha1_w_mem.v                    \
	${RTL_DIR}/sha_top.v                       \
	${RTL_DIR}/modmul.v                        \
	${RTL_DIR}/modexp.v                        \
	${RTL_DIR}/modexp_top.v                    \
	${RTL_DIR}/mem_wr.v   --top-module oc8051_tb

.PHONY: clean

clean:
	rm -f sim Voc8051_*
