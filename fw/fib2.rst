                                      1 ;--------------------------------------------------------
                                      2 ; File Created by SDCC : free open source ANSI-C Compiler
                                      3 ; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
                                      4 ; This file was generated Mon Jun 10 15:11:04 2019
                                      5 ;--------------------------------------------------------
                                      6 	.module fib2
                                      7 	.optsdcc -mmcs51 --model-small
                                      8 	
                                      9 ;--------------------------------------------------------
                                     10 ; Public variables in this module
                                     11 ;--------------------------------------------------------
                                     12 	.globl _print_PARM_2
                                     13 	.globl _fib_PARM_2
                                     14 	.globl _main
                                     15 	.globl _quit
                                     16 	.globl _print
                                     17 	.globl _fib
                                     18 	.globl _TF2
                                     19 	.globl _EXF2
                                     20 	.globl _RCLK
                                     21 	.globl _TCLK
                                     22 	.globl _EXEN2
                                     23 	.globl _TR2
                                     24 	.globl _C_T2
                                     25 	.globl _CP_RL2
                                     26 	.globl _T2CON_7
                                     27 	.globl _T2CON_6
                                     28 	.globl _T2CON_5
                                     29 	.globl _T2CON_4
                                     30 	.globl _T2CON_3
                                     31 	.globl _T2CON_2
                                     32 	.globl _T2CON_1
                                     33 	.globl _T2CON_0
                                     34 	.globl _PT2
                                     35 	.globl _ET2
                                     36 	.globl _CY
                                     37 	.globl _AC
                                     38 	.globl _F0
                                     39 	.globl _RS1
                                     40 	.globl _RS0
                                     41 	.globl _OV
                                     42 	.globl _F1
                                     43 	.globl _P
                                     44 	.globl _PS
                                     45 	.globl _PT1
                                     46 	.globl _PX1
                                     47 	.globl _PT0
                                     48 	.globl _PX0
                                     49 	.globl _RD
                                     50 	.globl _WR
                                     51 	.globl _T1
                                     52 	.globl _T0
                                     53 	.globl _INT1
                                     54 	.globl _INT0
                                     55 	.globl _TXD
                                     56 	.globl _RXD
                                     57 	.globl _P3_7
                                     58 	.globl _P3_6
                                     59 	.globl _P3_5
                                     60 	.globl _P3_4
                                     61 	.globl _P3_3
                                     62 	.globl _P3_2
                                     63 	.globl _P3_1
                                     64 	.globl _P3_0
                                     65 	.globl _EA
                                     66 	.globl _ES
                                     67 	.globl _ET1
                                     68 	.globl _EX1
                                     69 	.globl _ET0
                                     70 	.globl _EX0
                                     71 	.globl _P2_7
                                     72 	.globl _P2_6
                                     73 	.globl _P2_5
                                     74 	.globl _P2_4
                                     75 	.globl _P2_3
                                     76 	.globl _P2_2
                                     77 	.globl _P2_1
                                     78 	.globl _P2_0
                                     79 	.globl _SM0
                                     80 	.globl _SM1
                                     81 	.globl _SM2
                                     82 	.globl _REN
                                     83 	.globl _TB8
                                     84 	.globl _RB8
                                     85 	.globl _TI
                                     86 	.globl _RI
                                     87 	.globl _P1_7
                                     88 	.globl _P1_6
                                     89 	.globl _P1_5
                                     90 	.globl _P1_4
                                     91 	.globl _P1_3
                                     92 	.globl _P1_2
                                     93 	.globl _P1_1
                                     94 	.globl _P1_0
                                     95 	.globl _TF1
                                     96 	.globl _TR1
                                     97 	.globl _TF0
                                     98 	.globl _TR0
                                     99 	.globl _IE1
                                    100 	.globl _IT1
                                    101 	.globl _IE0
                                    102 	.globl _IT0
                                    103 	.globl _P0_7
                                    104 	.globl _P0_6
                                    105 	.globl _P0_5
                                    106 	.globl _P0_4
                                    107 	.globl _P0_3
                                    108 	.globl _P0_2
                                    109 	.globl _P0_1
                                    110 	.globl _P0_0
                                    111 	.globl _TH2
                                    112 	.globl _TL2
                                    113 	.globl _RCAP2H
                                    114 	.globl _RCAP2L
                                    115 	.globl _T2CON
                                    116 	.globl _B
                                    117 	.globl _ACC
                                    118 	.globl _PSW
                                    119 	.globl _IP
                                    120 	.globl _P3
                                    121 	.globl _IE
                                    122 	.globl _P2
                                    123 	.globl _SBUF
                                    124 	.globl _SCON
                                    125 	.globl _P1
                                    126 	.globl _TH1
                                    127 	.globl _TH0
                                    128 	.globl _TL1
                                    129 	.globl _TL0
                                    130 	.globl _TMOD
                                    131 	.globl _TCON
                                    132 	.globl _PCON
                                    133 	.globl _DPH
                                    134 	.globl _DPL
                                    135 	.globl _SP
                                    136 	.globl _P0
                                    137 ;--------------------------------------------------------
                                    138 ; special function registers
                                    139 ;--------------------------------------------------------
                                    140 	.area RSEG    (ABS,DATA)
      000000                        141 	.org 0x0000
                           000080   142 _P0	=	0x0080
                           000081   143 _SP	=	0x0081
                           000082   144 _DPL	=	0x0082
                           000083   145 _DPH	=	0x0083
                           000087   146 _PCON	=	0x0087
                           000088   147 _TCON	=	0x0088
                           000089   148 _TMOD	=	0x0089
                           00008A   149 _TL0	=	0x008a
                           00008B   150 _TL1	=	0x008b
                           00008C   151 _TH0	=	0x008c
                           00008D   152 _TH1	=	0x008d
                           000090   153 _P1	=	0x0090
                           000098   154 _SCON	=	0x0098
                           000099   155 _SBUF	=	0x0099
                           0000A0   156 _P2	=	0x00a0
                           0000A8   157 _IE	=	0x00a8
                           0000B0   158 _P3	=	0x00b0
                           0000B8   159 _IP	=	0x00b8
                           0000D0   160 _PSW	=	0x00d0
                           0000E0   161 _ACC	=	0x00e0
                           0000F0   162 _B	=	0x00f0
                           0000C8   163 _T2CON	=	0x00c8
                           0000CA   164 _RCAP2L	=	0x00ca
                           0000CB   165 _RCAP2H	=	0x00cb
                           0000CC   166 _TL2	=	0x00cc
                           0000CD   167 _TH2	=	0x00cd
                                    168 ;--------------------------------------------------------
                                    169 ; special function bits
                                    170 ;--------------------------------------------------------
                                    171 	.area RSEG    (ABS,DATA)
      000000                        172 	.org 0x0000
                           000080   173 _P0_0	=	0x0080
                           000081   174 _P0_1	=	0x0081
                           000082   175 _P0_2	=	0x0082
                           000083   176 _P0_3	=	0x0083
                           000084   177 _P0_4	=	0x0084
                           000085   178 _P0_5	=	0x0085
                           000086   179 _P0_6	=	0x0086
                           000087   180 _P0_7	=	0x0087
                           000088   181 _IT0	=	0x0088
                           000089   182 _IE0	=	0x0089
                           00008A   183 _IT1	=	0x008a
                           00008B   184 _IE1	=	0x008b
                           00008C   185 _TR0	=	0x008c
                           00008D   186 _TF0	=	0x008d
                           00008E   187 _TR1	=	0x008e
                           00008F   188 _TF1	=	0x008f
                           000090   189 _P1_0	=	0x0090
                           000091   190 _P1_1	=	0x0091
                           000092   191 _P1_2	=	0x0092
                           000093   192 _P1_3	=	0x0093
                           000094   193 _P1_4	=	0x0094
                           000095   194 _P1_5	=	0x0095
                           000096   195 _P1_6	=	0x0096
                           000097   196 _P1_7	=	0x0097
                           000098   197 _RI	=	0x0098
                           000099   198 _TI	=	0x0099
                           00009A   199 _RB8	=	0x009a
                           00009B   200 _TB8	=	0x009b
                           00009C   201 _REN	=	0x009c
                           00009D   202 _SM2	=	0x009d
                           00009E   203 _SM1	=	0x009e
                           00009F   204 _SM0	=	0x009f
                           0000A0   205 _P2_0	=	0x00a0
                           0000A1   206 _P2_1	=	0x00a1
                           0000A2   207 _P2_2	=	0x00a2
                           0000A3   208 _P2_3	=	0x00a3
                           0000A4   209 _P2_4	=	0x00a4
                           0000A5   210 _P2_5	=	0x00a5
                           0000A6   211 _P2_6	=	0x00a6
                           0000A7   212 _P2_7	=	0x00a7
                           0000A8   213 _EX0	=	0x00a8
                           0000A9   214 _ET0	=	0x00a9
                           0000AA   215 _EX1	=	0x00aa
                           0000AB   216 _ET1	=	0x00ab
                           0000AC   217 _ES	=	0x00ac
                           0000AF   218 _EA	=	0x00af
                           0000B0   219 _P3_0	=	0x00b0
                           0000B1   220 _P3_1	=	0x00b1
                           0000B2   221 _P3_2	=	0x00b2
                           0000B3   222 _P3_3	=	0x00b3
                           0000B4   223 _P3_4	=	0x00b4
                           0000B5   224 _P3_5	=	0x00b5
                           0000B6   225 _P3_6	=	0x00b6
                           0000B7   226 _P3_7	=	0x00b7
                           0000B0   227 _RXD	=	0x00b0
                           0000B1   228 _TXD	=	0x00b1
                           0000B2   229 _INT0	=	0x00b2
                           0000B3   230 _INT1	=	0x00b3
                           0000B4   231 _T0	=	0x00b4
                           0000B5   232 _T1	=	0x00b5
                           0000B6   233 _WR	=	0x00b6
                           0000B7   234 _RD	=	0x00b7
                           0000B8   235 _PX0	=	0x00b8
                           0000B9   236 _PT0	=	0x00b9
                           0000BA   237 _PX1	=	0x00ba
                           0000BB   238 _PT1	=	0x00bb
                           0000BC   239 _PS	=	0x00bc
                           0000D0   240 _P	=	0x00d0
                           0000D1   241 _F1	=	0x00d1
                           0000D2   242 _OV	=	0x00d2
                           0000D3   243 _RS0	=	0x00d3
                           0000D4   244 _RS1	=	0x00d4
                           0000D5   245 _F0	=	0x00d5
                           0000D6   246 _AC	=	0x00d6
                           0000D7   247 _CY	=	0x00d7
                           0000AD   248 _ET2	=	0x00ad
                           0000BD   249 _PT2	=	0x00bd
                           0000C8   250 _T2CON_0	=	0x00c8
                           0000C9   251 _T2CON_1	=	0x00c9
                           0000CA   252 _T2CON_2	=	0x00ca
                           0000CB   253 _T2CON_3	=	0x00cb
                           0000CC   254 _T2CON_4	=	0x00cc
                           0000CD   255 _T2CON_5	=	0x00cd
                           0000CE   256 _T2CON_6	=	0x00ce
                           0000CF   257 _T2CON_7	=	0x00cf
                           0000C8   258 _CP_RL2	=	0x00c8
                           0000C9   259 _C_T2	=	0x00c9
                           0000CA   260 _TR2	=	0x00ca
                           0000CB   261 _EXEN2	=	0x00cb
                           0000CC   262 _TCLK	=	0x00cc
                           0000CD   263 _RCLK	=	0x00cd
                           0000CE   264 _EXF2	=	0x00ce
                           0000CF   265 _TF2	=	0x00cf
                                    266 ;--------------------------------------------------------
                                    267 ; overlayable register banks
                                    268 ;--------------------------------------------------------
                                    269 	.area REG_BANK_0	(REL,OVR,DATA)
      000000                        270 	.ds 8
                                    271 ;--------------------------------------------------------
                                    272 ; internal ram data
                                    273 ;--------------------------------------------------------
                                    274 	.area DSEG    (DATA)
      000008                        275 _main_buf_1_8:
      000008                        276 	.ds 10
                                    277 ;--------------------------------------------------------
                                    278 ; overlayable items in internal ram 
                                    279 ;--------------------------------------------------------
                                    280 	.area	OSEG    (OVR,DATA)
      000012                        281 _fib_PARM_2:
      000012                        282 	.ds 1
      000013                        283 _fib_buf_1_1:
      000013                        284 	.ds 3
      000016                        285 _fib_i_1_2:
      000016                        286 	.ds 1
                                    287 	.area	OSEG    (OVR,DATA)
      000012                        288 _print_PARM_2:
      000012                        289 	.ds 1
                                    290 ;--------------------------------------------------------
                                    291 ; Stack segment in internal ram 
                                    292 ;--------------------------------------------------------
                                    293 	.area	SSEG
      000017                        294 __start__stack:
      000017                        295 	.ds	1
                                    296 
                                    297 ;--------------------------------------------------------
                                    298 ; indirectly addressable internal ram data
                                    299 ;--------------------------------------------------------
                                    300 	.area ISEG    (DATA)
                                    301 ;--------------------------------------------------------
                                    302 ; absolute internal ram data
                                    303 ;--------------------------------------------------------
                                    304 	.area IABS    (ABS,DATA)
                                    305 	.area IABS    (ABS,DATA)
                                    306 ;--------------------------------------------------------
                                    307 ; bit data
                                    308 ;--------------------------------------------------------
                                    309 	.area BSEG    (BIT)
                                    310 ;--------------------------------------------------------
                                    311 ; paged external ram data
                                    312 ;--------------------------------------------------------
                                    313 	.area PSEG    (PAG,XDATA)
                                    314 ;--------------------------------------------------------
                                    315 ; external ram data
                                    316 ;--------------------------------------------------------
                                    317 	.area XSEG    (XDATA)
                                    318 ;--------------------------------------------------------
                                    319 ; absolute external ram data
                                    320 ;--------------------------------------------------------
                                    321 	.area XABS    (ABS,XDATA)
                                    322 ;--------------------------------------------------------
                                    323 ; external initialized ram data
                                    324 ;--------------------------------------------------------
                                    325 	.area XISEG   (XDATA)
                                    326 	.area HOME    (CODE)
                                    327 	.area GSINIT0 (CODE)
                                    328 	.area GSINIT1 (CODE)
                                    329 	.area GSINIT2 (CODE)
                                    330 	.area GSINIT3 (CODE)
                                    331 	.area GSINIT4 (CODE)
                                    332 	.area GSINIT5 (CODE)
                                    333 	.area GSINIT  (CODE)
                                    334 	.area GSFINAL (CODE)
                                    335 	.area CSEG    (CODE)
                                    336 ;--------------------------------------------------------
                                    337 ; interrupt vector 
                                    338 ;--------------------------------------------------------
                                    339 	.area HOME    (CODE)
      000000                        340 __interrupt_vect:
      000000 02 00 06         [24]  341 	ljmp	__sdcc_gsinit_startup
                                    342 ;--------------------------------------------------------
                                    343 ; global & static initialisations
                                    344 ;--------------------------------------------------------
                                    345 	.area HOME    (CODE)
                                    346 	.area GSINIT  (CODE)
                                    347 	.area GSFINAL (CODE)
                                    348 	.area GSINIT  (CODE)
                                    349 	.globl __sdcc_gsinit_startup
                                    350 	.globl __sdcc_program_startup
                                    351 	.globl __start__stack
                                    352 	.globl __mcs51_genXINIT
                                    353 	.globl __mcs51_genXRAMCLEAR
                                    354 	.globl __mcs51_genRAMCLEAR
                                    355 	.area GSFINAL (CODE)
      00005F 02 00 03         [24]  356 	ljmp	__sdcc_program_startup
                                    357 ;--------------------------------------------------------
                                    358 ; Home
                                    359 ;--------------------------------------------------------
                                    360 	.area HOME    (CODE)
                                    361 	.area HOME    (CODE)
      000003                        362 __sdcc_program_startup:
      000003 02 01 52         [24]  363 	ljmp	_main
                                    364 ;	return from main will return to caller
                                    365 ;--------------------------------------------------------
                                    366 ; code
                                    367 ;--------------------------------------------------------
                                    368 	.area CSEG    (CODE)
                                    369 ;------------------------------------------------------------
                                    370 ;Allocation info for local variables in function 'fib'
                                    371 ;------------------------------------------------------------
                                    372 ;n                         Allocated with name '_fib_PARM_2'
                                    373 ;buf                       Allocated with name '_fib_buf_1_1'
                                    374 ;i                         Allocated with name '_fib_i_1_2'
                                    375 ;------------------------------------------------------------
                                    376 ;	fib2.c:15: void fib(unsigned char* buf, unsigned char n) {
                                    377 ;	-----------------------------------------
                                    378 ;	 function fib
                                    379 ;	-----------------------------------------
      000062                        380 _fib:
                           000007   381 	ar7 = 0x07
                           000006   382 	ar6 = 0x06
                           000005   383 	ar5 = 0x05
                           000004   384 	ar4 = 0x04
                           000003   385 	ar3 = 0x03
                           000002   386 	ar2 = 0x02
                           000001   387 	ar1 = 0x01
                           000000   388 	ar0 = 0x00
                                    389 ;	fib2.c:19: buf[0] = 1;
      000062 85 82 13         [24]  390 	mov	_fib_buf_1_1,dpl
      000065 85 83 14         [24]  391 	mov	(_fib_buf_1_1 + 1),dph
      000068 85 F0 15         [24]  392 	mov	(_fib_buf_1_1 + 2),b
      00006B 74 01            [12]  393 	mov	a,#0x01
      00006D 12 01 6D         [24]  394 	lcall	__gptrput
                                    395 ;	fib2.c:20: buf[1] = 1;
      000070 25 13            [12]  396 	add	a,_fib_buf_1_1
      000072 FA               [12]  397 	mov	r2,a
      000073 E4               [12]  398 	clr	a
      000074 35 14            [12]  399 	addc	a,(_fib_buf_1_1 + 1)
      000076 FB               [12]  400 	mov	r3,a
      000077 AC 15            [24]  401 	mov	r4,(_fib_buf_1_1 + 2)
      000079 8A 82            [24]  402 	mov	dpl,r2
      00007B 8B 83            [24]  403 	mov	dph,r3
      00007D 8C F0            [24]  404 	mov	b,r4
      00007F 74 01            [12]  405 	mov	a,#0x01
      000081 12 01 6D         [24]  406 	lcall	__gptrput
                                    407 ;	fib2.c:21: for(i=2; i<n; i++) {
      000084 75 16 02         [24]  408 	mov	_fib_i_1_2,#0x02
      000087                        409 00103$:
      000087 E5 16            [12]  410 	mov	a,_fib_i_1_2
      000089 FA               [12]  411 	mov	r2,a
      00008A 33               [12]  412 	rlc	a
      00008B 95 E0            [12]  413 	subb	a,acc
      00008D FB               [12]  414 	mov	r3,a
      00008E A8 12            [24]  415 	mov	r0,_fib_PARM_2
      000090 79 00            [12]  416 	mov	r1,#0x00
      000092 C3               [12]  417 	clr	c
      000093 EA               [12]  418 	mov	a,r2
      000094 98               [12]  419 	subb	a,r0
      000095 EB               [12]  420 	mov	a,r3
      000096 64 80            [12]  421 	xrl	a,#0x80
      000098 89 F0            [24]  422 	mov	b,r1
      00009A 63 F0 80         [24]  423 	xrl	b,#0x80
      00009D 95 F0            [12]  424 	subb	a,b
      00009F 50 52            [24]  425 	jnc	00105$
                                    426 ;	fib2.c:23: buf[i] = buf[i-1] + buf[i-2];
      0000A1 E5 16            [12]  427 	mov	a,_fib_i_1_2
      0000A3 25 13            [12]  428 	add	a,_fib_buf_1_1
      0000A5 F8               [12]  429 	mov	r0,a
      0000A6 E4               [12]  430 	clr	a
      0000A7 35 14            [12]  431 	addc	a,(_fib_buf_1_1 + 1)
      0000A9 F9               [12]  432 	mov	r1,a
      0000AA AC 15            [24]  433 	mov	r4,(_fib_buf_1_1 + 2)
      0000AC EA               [12]  434 	mov	a,r2
      0000AD 24 FF            [12]  435 	add	a,#0xFF
      0000AF FE               [12]  436 	mov	r6,a
      0000B0 EB               [12]  437 	mov	a,r3
      0000B1 34 FF            [12]  438 	addc	a,#0xFF
      0000B3 FF               [12]  439 	mov	r7,a
      0000B4 EE               [12]  440 	mov	a,r6
      0000B5 25 13            [12]  441 	add	a,_fib_buf_1_1
      0000B7 FE               [12]  442 	mov	r6,a
      0000B8 EF               [12]  443 	mov	a,r7
      0000B9 35 14            [12]  444 	addc	a,(_fib_buf_1_1 + 1)
      0000BB FF               [12]  445 	mov	r7,a
      0000BC AD 15            [24]  446 	mov	r5,(_fib_buf_1_1 + 2)
      0000BE 8E 82            [24]  447 	mov	dpl,r6
      0000C0 8F 83            [24]  448 	mov	dph,r7
      0000C2 8D F0            [24]  449 	mov	b,r5
      0000C4 12 01 88         [24]  450 	lcall	__gptrget
      0000C7 FE               [12]  451 	mov	r6,a
      0000C8 EA               [12]  452 	mov	a,r2
      0000C9 24 FE            [12]  453 	add	a,#0xFE
      0000CB FA               [12]  454 	mov	r2,a
      0000CC EB               [12]  455 	mov	a,r3
      0000CD 34 FF            [12]  456 	addc	a,#0xFF
      0000CF FB               [12]  457 	mov	r3,a
      0000D0 EA               [12]  458 	mov	a,r2
      0000D1 25 13            [12]  459 	add	a,_fib_buf_1_1
      0000D3 FA               [12]  460 	mov	r2,a
      0000D4 EB               [12]  461 	mov	a,r3
      0000D5 35 14            [12]  462 	addc	a,(_fib_buf_1_1 + 1)
      0000D7 FB               [12]  463 	mov	r3,a
      0000D8 AF 15            [24]  464 	mov	r7,(_fib_buf_1_1 + 2)
      0000DA 8A 82            [24]  465 	mov	dpl,r2
      0000DC 8B 83            [24]  466 	mov	dph,r3
      0000DE 8F F0            [24]  467 	mov	b,r7
      0000E0 12 01 88         [24]  468 	lcall	__gptrget
      0000E3 FA               [12]  469 	mov	r2,a
      0000E4 2E               [12]  470 	add	a,r6
      0000E5 FE               [12]  471 	mov	r6,a
      0000E6 88 82            [24]  472 	mov	dpl,r0
      0000E8 89 83            [24]  473 	mov	dph,r1
      0000EA 8C F0            [24]  474 	mov	b,r4
      0000EC 12 01 6D         [24]  475 	lcall	__gptrput
                                    476 ;	fib2.c:21: for(i=2; i<n; i++) {
      0000EF 05 16            [12]  477 	inc	_fib_i_1_2
      0000F1 80 94            [24]  478 	sjmp	00103$
      0000F3                        479 00105$:
      0000F3 22               [24]  480 	ret
                                    481 ;------------------------------------------------------------
                                    482 ;Allocation info for local variables in function 'print'
                                    483 ;------------------------------------------------------------
                                    484 ;n                         Allocated with name '_print_PARM_2'
                                    485 ;buf                       Allocated to registers r5 r6 r7 
                                    486 ;i                         Allocated to registers r4 
                                    487 ;------------------------------------------------------------
                                    488 ;	fib2.c:29: void print(unsigned char* buf, unsigned char n) {
                                    489 ;	-----------------------------------------
                                    490 ;	 function print
                                    491 ;	-----------------------------------------
      0000F4                        492 _print:
      0000F4 AD 82            [24]  493 	mov	r5,dpl
      0000F6 AE 83            [24]  494 	mov	r6,dph
      0000F8 AF F0            [24]  495 	mov	r7,b
                                    496 ;	fib2.c:33: for(i=0; i<n; i++) {
      0000FA 7C 00            [12]  497 	mov	r4,#0x00
      0000FC                        498 00103$:
      0000FC EC               [12]  499 	mov	a,r4
      0000FD FA               [12]  500 	mov	r2,a
      0000FE 33               [12]  501 	rlc	a
      0000FF 95 E0            [12]  502 	subb	a,acc
      000101 FB               [12]  503 	mov	r3,a
      000102 A8 12            [24]  504 	mov	r0,_print_PARM_2
      000104 79 00            [12]  505 	mov	r1,#0x00
      000106 C3               [12]  506 	clr	c
      000107 EA               [12]  507 	mov	a,r2
      000108 98               [12]  508 	subb	a,r0
      000109 EB               [12]  509 	mov	a,r3
      00010A 64 80            [12]  510 	xrl	a,#0x80
      00010C 89 F0            [24]  511 	mov	b,r1
      00010E 63 F0 80         [24]  512 	xrl	b,#0x80
      000111 95 F0            [12]  513 	subb	a,b
      000113 50 16            [24]  514 	jnc	00105$
                                    515 ;	fib2.c:35: P0 = buf[i];
      000115 EC               [12]  516 	mov	a,r4
      000116 2D               [12]  517 	add	a,r5
      000117 F9               [12]  518 	mov	r1,a
      000118 E4               [12]  519 	clr	a
      000119 3E               [12]  520 	addc	a,r6
      00011A FA               [12]  521 	mov	r2,a
      00011B 8F 03            [24]  522 	mov	ar3,r7
      00011D 89 82            [24]  523 	mov	dpl,r1
      00011F 8A 83            [24]  524 	mov	dph,r2
      000121 8B F0            [24]  525 	mov	b,r3
      000123 12 01 88         [24]  526 	lcall	__gptrget
      000126 F5 80            [12]  527 	mov	_P0,a
                                    528 ;	fib2.c:33: for(i=0; i<n; i++) {
      000128 0C               [12]  529 	inc	r4
      000129 80 D1            [24]  530 	sjmp	00103$
      00012B                        531 00105$:
      00012B 22               [24]  532 	ret
                                    533 ;------------------------------------------------------------
                                    534 ;Allocation info for local variables in function 'quit'
                                    535 ;------------------------------------------------------------
                                    536 ;	fib2.c:39: void quit() {
                                    537 ;	-----------------------------------------
                                    538 ;	 function quit
                                    539 ;	-----------------------------------------
      00012C                        540 _quit:
                                    541 ;	fib2.c:40: P0 = P1 = P2 = P3 = 0xDE;
      00012C 75 B0 DE         [24]  542 	mov	_P3,#0xDE
      00012F 75 A0 DE         [24]  543 	mov	_P2,#0xDE
      000132 75 90 DE         [24]  544 	mov	_P1,#0xDE
      000135 75 80 DE         [24]  545 	mov	_P0,#0xDE
                                    546 ;	fib2.c:41: P0 = P1 = P2 = P3 = 0xAD;
      000138 75 B0 AD         [24]  547 	mov	_P3,#0xAD
      00013B 75 A0 AD         [24]  548 	mov	_P2,#0xAD
      00013E 75 90 AD         [24]  549 	mov	_P1,#0xAD
      000141 75 80 AD         [24]  550 	mov	_P0,#0xAD
                                    551 ;	fib2.c:42: P0 = P1 = P2 = P3 = 0x00;
      000144 75 B0 00         [24]  552 	mov	_P3,#0x00
      000147 75 A0 00         [24]  553 	mov	_P2,#0x00
      00014A 75 90 00         [24]  554 	mov	_P1,#0x00
      00014D 75 80 00         [24]  555 	mov	_P0,#0x00
                                    556 ;	fib2.c:43: while(1);
      000150                        557 00102$:
      000150 80 FE            [24]  558 	sjmp	00102$
                                    559 ;------------------------------------------------------------
                                    560 ;Allocation info for local variables in function 'main'
                                    561 ;------------------------------------------------------------
                                    562 ;buf                       Allocated with name '_main_buf_1_8'
                                    563 ;------------------------------------------------------------
                                    564 ;	fib2.c:48: void main() {
                                    565 ;	-----------------------------------------
                                    566 ;	 function main
                                    567 ;	-----------------------------------------
      000152                        568 _main:
                                    569 ;	fib2.c:52: fib(buf, 10);
      000152 75 12 0A         [24]  570 	mov	_fib_PARM_2,#0x0A
      000155 90 00 08         [24]  571 	mov	dptr,#_main_buf_1_8
      000158 75 F0 40         [24]  572 	mov	b,#0x40
      00015B 12 00 62         [24]  573 	lcall	_fib
                                    574 ;	fib2.c:53: print(buf, 10);
      00015E 75 12 0A         [24]  575 	mov	_print_PARM_2,#0x0A
      000161 90 00 08         [24]  576 	mov	dptr,#_main_buf_1_8
      000164 75 F0 40         [24]  577 	mov	b,#0x40
      000167 12 00 F4         [24]  578 	lcall	_print
                                    579 ;	fib2.c:54: quit();
      00016A 02 01 2C         [24]  580 	ljmp	_quit
                                    581 	.area CSEG    (CODE)
                                    582 	.area CONST   (CODE)
                                    583 	.area XINIT   (CODE)
                                    584 	.area CABS    (ABS,CODE)
