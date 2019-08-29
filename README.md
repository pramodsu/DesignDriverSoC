# Directory info #
## dis51 ##
Dis51 is a simple 8051 disassembler for Unix-like systems.
## fw ##
contains all the firmwares and test cases to be run on the SOC.
## rom ##
Instruction data of the programs in directory fw which is loaded on ROM in SOC.
## rtl ##
Verilog code of the system.
## scripts ##
scripts to generate different test data for the system, script to run test on the system.
## sim ##
contains Makefile and c code for simulating verilated version of SOC.

# Firmware Programs #
## aes_test.c ##
program uses accelerators provided in rtl to test aes encryption and decryption. what it does is, writes some data in memory, encrylpts it and writes it in memory, decrypts it and compares it with data stored in memory. if the data and decrypted data are same then it results in giving value 1 at port 0 (P0) otherwise 0.

## sha_test.c ##
Stores data at in variable d1 and passes its length and address to sha accelerator. Which then calculates its hash and writes to variable hash. which is printed at port P0 and verified with hash calculated using other methods (python or online).

## rsa_test.c ##
it loads the hex, generated using bootgen.py in scripts directory, in memory at location designeted by boot. it then loads the mod and exp used for rsa signature verification in the rsa accelerator.

This test is done by either verifying the signature of the hex file loaded or by reencrypting the hash of the data.
When verifying the signature of the hex public key is loaded in the hex file. and for reencrypting private key is loaded and signature is calculated, which is verified with the signature of the data. private or public key can be loaded by chnging the bootgen.py.
It tests both encryptition and decryption function of the accelerator.

## secureboot.c ##
it loads the boot file(data of prog.hex) at location boot. typecast the data to image data struct. encryption essentials such as pubkey, register addresses etc..
step 1: verify the signature of the hash (sha1) of data.
step 2: load data of each module.
step 3: verify the hash(sha1) of each module.
if all steps are verified the print 2 at port P0. 1 if it fails any check, 0 if undetermined behaviour.


# Compilation and execution instructions
execute run_sim script which compiles and executes the system.

cd script/

./run_sim

Possible errors:
1. prog.hex file should be there in fw directory.
2. correct data file in rom directory should be passed to sim executable in sim directory. (e.g.  ./sim ../rom/<filename>.dat)

prerequisites : sdcc, verilator, python3, gcc.
