# -*- Makefile -*-
#*****************************************************************************
#
# DESCRIPTION: Verilator Example: Makefile for inside object directory
#
# This is executed in the object directory, and called by ../Makefile
#
# Copyright 2003-2013 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.
#
#*****************************************************************************

default: simulate
include /usr/share/verilator/include/verilated.mk
include Voc8051_rmw_cutout.mk

#######################################################################
# Compile flags

CPPFLAGS += -DVL_DEBUG=1 --std=c++0x -g -O0
ifeq ($(CFG_WITH_CCWARN),yes)	# Local... Else don't burden users
CPPFLAGS += -DVL_THREADED=1
CPPFLAGS += -W -Werror -Wall
endif

#######################################################################
# Linking final exe -- presumes have a sim_main.cpp

simulate: simulate.o $(VK_GLOBAL_OBJS) $(VM_PREFIX)__ALL.a
	$(LINK) $(LDFLAGS) -g $^ $(LOADLIBES) $(LDLIBS) -o $@ $(LIBS) 2>&1 | c++filt

simulate.o: simulate.cpp simulate.h $(VM_PREFIX).h

clean:
	rm -rf *.o *.a ./simulate
