// Verilated -*- C++ -*-
#ifndef _Vsim8051_top__Inlines_H_
#define _Vsim8051_top__Inlines_H_

#include "verilated.h"

//======================

#ifndef VL_HAVE_CONST_W_64X
# define VL_HAVE_CONST_W_64X
static inline WDataOutP VL_CONST_W_64X(int obits, WDataOutP o
    	,IData d63,IData d62,IData d61,IData d60,IData d59,IData d58,IData d57,IData d56
    	,IData d55,IData d54,IData d53,IData d52,IData d51,IData d50,IData d49,IData d48
    	,IData d47,IData d46,IData d45,IData d44,IData d43,IData d42,IData d41,IData d40
    	,IData d39,IData d38,IData d37,IData d36,IData d35,IData d34,IData d33,IData d32
    	,IData d31,IData d30,IData d29,IData d28,IData d27,IData d26,IData d25,IData d24
    	,IData d23,IData d22,IData d21,IData d20,IData d19,IData d18,IData d17,IData d16
    	,IData d15,IData d14,IData d13,IData d12,IData d11,IData d10,IData d9,IData d8
    	,IData d7,IData d6,IData d5,IData d4,IData d3,IData d2,IData d1,IData d0) {
        o[63]=d63; o[62]=d62; o[61]=d61; o[60]=d60; o[59]=d59; o[58]=d58; o[57]=d57; o[56]=d56;
        o[55]=d55; o[54]=d54; o[53]=d53; o[52]=d52; o[51]=d51; o[50]=d50; o[49]=d49; o[48]=d48;
        o[47]=d47; o[46]=d46; o[45]=d45; o[44]=d44; o[43]=d43; o[42]=d42; o[41]=d41; o[40]=d40;
        o[39]=d39; o[38]=d38; o[37]=d37; o[36]=d36; o[35]=d35; o[34]=d34; o[33]=d33; o[32]=d32;
        o[31]=d31; o[30]=d30; o[29]=d29; o[28]=d28; o[27]=d27; o[26]=d26; o[25]=d25; o[24]=d24;
        o[23]=d23; o[22]=d22; o[21]=d21; o[20]=d20; o[19]=d19; o[18]=d18; o[17]=d17; o[16]=d16;
        o[15]=d15; o[14]=d14; o[13]=d13; o[12]=d12; o[11]=d11; o[10]=d10; o[9]=d9; o[8]=d8;
        o[7]=d7; o[6]=d6; o[5]=d5; o[4]=d4; o[3]=d3; o[2]=d2; o[1]=d1; o[0]=d0;
        for(int i=64;i<VL_WORDS_I(obits);i++) o[i] = (IData)0x0;
        return o;
}
#endif

//======================

#endif  /*guard*/
