# DesignDriverSoC #

This repository contains a simple SoC design consisting of a microcontroller
and several cryptographic accelerators for AES, SHA-1 and modular
exponentiation.

## Dependencies ##

1. [SDCC](http://sdcc.sourceforge.net/)
2. [Verilator](https://www.veripool.org/wiki/verilator)
3. Python 2.7 and 3
4. OPTIONAL: [iverilog](http://iverilog.icarus.com/) may be useful in case you need to debug the RTL.


## Directory Structure ##

* dis51: Dis51 is a simple 8051 disassembler for Unix-like systems.
* fw: contains the firmware tests.
* rom: compiler firmware images.
* rtl: verilog implementation of the SoC.
* scripts: various helper scripts.
* sim: verilator based simulation framework for SoC.

## Firmware Programs ##

* aes_test.c: small program to test the encryption and decryption using the AES accelerator.
* sha_test.c: small program to test the SHA-1 accelerator.
* rsa_test.c: small program to test RSA signature verification.
* secureboot.c:  implementation of an authenticated loader that uses RSA-based signature verification in combination with message authentication using the SHA-1 algorithm.

# Compilation and Execution Instructions

First, compile the RTL into the Verilator-generated C++ simulator.

    $ cd sim
    $ make
    $ cd ..

Next compile a firmware program using sdcc. For example:

    $ cd fw/
    $ sdcc aes_test.c
    $ cd ..
    
The above will produce a hex file (aes_test.ihx). To convert this into
a format accepted by our simulator, use scripts/gen_text.py

    $ python3 scripts/gen_text.py fw/aes_test.ihx rom/aes_test.dat

The above command will read in fw/aes_test.ihx and output the rom image rom/aes_test.dat.

To simulate the SoC using this ROM image, run ./sim/sim. For example:

    $ ./sim/sim rom/aes_test.dat

The program sim takes one required and one optional command line argument.
The first is the image that must be loaded into the ROM (rom/aes_test.dat) in the above example. The second argument is the image that must be loaded into the flash.

### Running Secureboot ###

Running secure boot involves generating a signed boot image and then
loading this into the flash. We have provided a utility script that does
all of these operations.

To run this script, do the following

    $ cd script/
    $ ./run_secureboot

# Acknowledgements #

The 8051 core in the SoC was originally taken from OpenCores.org. Several bugfixes to the core weremade by Pramod Subramanyan. Features including privilege separation and a system call instruction were add to the core by Samuel Miller with contributions from Pramod Subramanyan. The AES core was also taken from OpenCores.org, while the SHA-1 core is from the GitHub repository maintained by Joachim Strömbergson.  The RSA modular exponentiation code was developed by Elaine Chou with contributions from Pramod Subramanyan. The flash-like input device was developed by Elaine Chou.  The MMU was developed by Samuel Miller.  Glue logic connecting the various accelerator cores to the 8051 was developed by Pramod Subramanyan.  The initial SecureBoot firmware was developed by Elaine Chou.  Bugfixes to various parts of the SoC, the SecureBoot firmware and the development of the Verilator-based simulation infrastructure for the SoC were done by Gourav Takhar.
