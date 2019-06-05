verilator -cc -Mdir xiommu_ver oc8051_xiommu.v  \
aes_128.v                                       \
aes_round.v                                     \
aes_table.v                                     \
reg2byte.v                                      \
reg16byte.v                                     \
aes_top.v                                       \
oc8051_memarbiter.v                             \
sha1_core.v                                     \
sha1_w_mem.v                                    \
sha_top.v
