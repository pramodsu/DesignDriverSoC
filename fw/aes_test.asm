;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.5.0 #9253 (Apr  3 2018) (Linux)
; This file was generated Fri Jun 14 10:39:26 2019
;--------------------------------------------------------
	.module aes_test
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _quit
	.globl _TF2
	.globl _EXF2
	.globl _RCLK
	.globl _TCLK
	.globl _EXEN2
	.globl _TR2
	.globl _C_T2
	.globl _CP_RL2
	.globl _T2CON_7
	.globl _T2CON_6
	.globl _T2CON_5
	.globl _T2CON_4
	.globl _T2CON_3
	.globl _T2CON_2
	.globl _T2CON_1
	.globl _T2CON_0
	.globl _PT2
	.globl _ET2
	.globl _CY
	.globl _AC
	.globl _F0
	.globl _RS1
	.globl _RS0
	.globl _OV
	.globl _F1
	.globl _P
	.globl _PS
	.globl _PT1
	.globl _PX1
	.globl _PT0
	.globl _PX0
	.globl _RD
	.globl _WR
	.globl _T1
	.globl _T0
	.globl _INT1
	.globl _INT0
	.globl _TXD
	.globl _RXD
	.globl _P3_7
	.globl _P3_6
	.globl _P3_5
	.globl _P3_4
	.globl _P3_3
	.globl _P3_2
	.globl _P3_1
	.globl _P3_0
	.globl _EA
	.globl _ES
	.globl _ET1
	.globl _EX1
	.globl _ET0
	.globl _EX0
	.globl _P2_7
	.globl _P2_6
	.globl _P2_5
	.globl _P2_4
	.globl _P2_3
	.globl _P2_2
	.globl _P2_1
	.globl _P2_0
	.globl _SM0
	.globl _SM1
	.globl _SM2
	.globl _REN
	.globl _TB8
	.globl _RB8
	.globl _TI
	.globl _RI
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _TF1
	.globl _TR1
	.globl _TF0
	.globl _TR0
	.globl _IE1
	.globl _IT1
	.globl _IE0
	.globl _IT0
	.globl _P0_7
	.globl _P0_6
	.globl _P0_5
	.globl _P0_4
	.globl _P0_3
	.globl _P0_2
	.globl _P0_1
	.globl _P0_0
	.globl _TH2
	.globl _TL2
	.globl _RCAP2H
	.globl _RCAP2L
	.globl _T2CON
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _IP
	.globl _P3
	.globl _IE
	.globl _P2
	.globl _SBUF
	.globl _SCON
	.globl _P1
	.globl _TH1
	.globl _TH0
	.globl _TL1
	.globl _TL0
	.globl _TMOD
	.globl _TCON
	.globl _PCON
	.globl _DPH
	.globl _DPL
	.globl _SP
	.globl _P0
	.globl _pt_rden
	.globl _pt_wren
	.globl _data
	.globl _aes_reg_key1
	.globl _aes_reg_key0
	.globl _aes_reg_ctr
	.globl _aes_reg_len
	.globl _aes_reg_addr
	.globl _aes_reg_state
	.globl _aes_reg_start
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0	=	0x0080
_SP	=	0x0081
_DPL	=	0x0082
_DPH	=	0x0083
_PCON	=	0x0087
_TCON	=	0x0088
_TMOD	=	0x0089
_TL0	=	0x008a
_TL1	=	0x008b
_TH0	=	0x008c
_TH1	=	0x008d
_P1	=	0x0090
_SCON	=	0x0098
_SBUF	=	0x0099
_P2	=	0x00a0
_IE	=	0x00a8
_P3	=	0x00b0
_IP	=	0x00b8
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
_T2CON	=	0x00c8
_RCAP2L	=	0x00ca
_RCAP2H	=	0x00cb
_TL2	=	0x00cc
_TH2	=	0x00cd
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (ABS,DATA)
	.org 0x0000
_P0_0	=	0x0080
_P0_1	=	0x0081
_P0_2	=	0x0082
_P0_3	=	0x0083
_P0_4	=	0x0084
_P0_5	=	0x0085
_P0_6	=	0x0086
_P0_7	=	0x0087
_IT0	=	0x0088
_IE0	=	0x0089
_IT1	=	0x008a
_IE1	=	0x008b
_TR0	=	0x008c
_TF0	=	0x008d
_TR1	=	0x008e
_TF1	=	0x008f
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_RI	=	0x0098
_TI	=	0x0099
_RB8	=	0x009a
_TB8	=	0x009b
_REN	=	0x009c
_SM2	=	0x009d
_SM1	=	0x009e
_SM0	=	0x009f
_P2_0	=	0x00a0
_P2_1	=	0x00a1
_P2_2	=	0x00a2
_P2_3	=	0x00a3
_P2_4	=	0x00a4
_P2_5	=	0x00a5
_P2_6	=	0x00a6
_P2_7	=	0x00a7
_EX0	=	0x00a8
_ET0	=	0x00a9
_EX1	=	0x00aa
_ET1	=	0x00ab
_ES	=	0x00ac
_EA	=	0x00af
_P3_0	=	0x00b0
_P3_1	=	0x00b1
_P3_2	=	0x00b2
_P3_3	=	0x00b3
_P3_4	=	0x00b4
_P3_5	=	0x00b5
_P3_6	=	0x00b6
_P3_7	=	0x00b7
_RXD	=	0x00b0
_TXD	=	0x00b1
_INT0	=	0x00b2
_INT1	=	0x00b3
_T0	=	0x00b4
_T1	=	0x00b5
_WR	=	0x00b6
_RD	=	0x00b7
_PX0	=	0x00b8
_PT0	=	0x00b9
_PX1	=	0x00ba
_PT1	=	0x00bb
_PS	=	0x00bc
_P	=	0x00d0
_F1	=	0x00d1
_OV	=	0x00d2
_RS0	=	0x00d3
_RS1	=	0x00d4
_F0	=	0x00d5
_AC	=	0x00d6
_CY	=	0x00d7
_ET2	=	0x00ad
_PT2	=	0x00bd
_T2CON_0	=	0x00c8
_T2CON_1	=	0x00c9
_T2CON_2	=	0x00ca
_T2CON_3	=	0x00cb
_T2CON_4	=	0x00cc
_T2CON_5	=	0x00cd
_T2CON_6	=	0x00ce
_T2CON_7	=	0x00cf
_CP_RL2	=	0x00c8
_C_T2	=	0x00c9
_TR2	=	0x00ca
_EXEN2	=	0x00cb
_TCLK	=	0x00cc
_RCLK	=	0x00cd
_EXF2	=	0x00ce
_TF2	=	0x00cf
;--------------------------------------------------------
; overlayable register banks
;--------------------------------------------------------
	.area REG_BANK_0	(REL,OVR,DATA)
	.ds 8
;--------------------------------------------------------
; internal ram data
;--------------------------------------------------------
	.area DSEG    (DATA)
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG
__start__stack:
	.ds	1

;--------------------------------------------------------
; indirectly addressable internal ram data
;--------------------------------------------------------
	.area ISEG    (DATA)
;--------------------------------------------------------
; absolute internal ram data
;--------------------------------------------------------
	.area IABS    (ABS,DATA)
	.area IABS    (ABS,DATA)
;--------------------------------------------------------
; bit data
;--------------------------------------------------------
	.area BSEG    (BIT)
;--------------------------------------------------------
; paged external ram data
;--------------------------------------------------------
	.area PSEG    (PAG,XDATA)
;--------------------------------------------------------
; external ram data
;--------------------------------------------------------
	.area XSEG    (XDATA)
_aes_reg_start	=	0xff00
_aes_reg_state	=	0xff01
_aes_reg_addr	=	0xff02
_aes_reg_len	=	0xff04
_aes_reg_ctr	=	0xff10
_aes_reg_key0	=	0xff20
_aes_reg_key1	=	0xff30
_data	=	0xe000
_pt_wren	=	0xff80
_pt_rden	=	0xffa0
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area XABS    (ABS,XDATA)
;--------------------------------------------------------
; external initialized ram data
;--------------------------------------------------------
	.area XISEG   (XDATA)
	.area HOME    (CODE)
	.area GSINIT0 (CODE)
	.area GSINIT1 (CODE)
	.area GSINIT2 (CODE)
	.area GSINIT3 (CODE)
	.area GSINIT4 (CODE)
	.area GSINIT5 (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area CSEG    (CODE)
;--------------------------------------------------------
; interrupt vector 
;--------------------------------------------------------
	.area HOME    (CODE)
__interrupt_vect:
	ljmp	__sdcc_gsinit_startup
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area HOME    (CODE)
	.area GSINIT  (CODE)
	.area GSFINAL (CODE)
	.area GSINIT  (CODE)
	.globl __sdcc_gsinit_startup
	.globl __sdcc_program_startup
	.globl __start__stack
	.globl __mcs51_genXINIT
	.globl __mcs51_genXRAMCLEAR
	.globl __mcs51_genRAMCLEAR
	.area GSFINAL (CODE)
	ljmp	__sdcc_program_startup
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area HOME    (CODE)
	.area HOME    (CODE)
__sdcc_program_startup:
	ljmp	_main
;	return from main will return to caller
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'quit'
;------------------------------------------------------------
;	aes_test.c:16: void quit() {
;	-----------------------------------------
;	 function quit
;	-----------------------------------------
_quit:
	ar7 = 0x07
	ar6 = 0x06
	ar5 = 0x05
	ar4 = 0x04
	ar3 = 0x03
	ar2 = 0x02
	ar1 = 0x01
	ar0 = 0x00
;	aes_test.c:17: P0 = P1 = P2 = P3 = 0xDE;
	mov	_P3,#0xDE
	mov	_P2,#0xDE
	mov	_P1,#0xDE
	mov	_P0,#0xDE
;	aes_test.c:18: P0 = P1 = P2 = P3 = 0xAD;
	mov	_P3,#0xAD
	mov	_P2,#0xAD
	mov	_P1,#0xAD
	mov	_P0,#0xAD
;	aes_test.c:19: P0 = P1 = P2 = P3 = 0x00;
	mov	_P3,#0x00
	mov	_P2,#0x00
	mov	_P1,#0x00
	mov	_P0,#0x00
;	aes_test.c:20: while(1);
00102$:
	sjmp	00102$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;i                         Allocated to registers r4 r5 
;good                      Allocated to registers r6 r7 
;------------------------------------------------------------
;	aes_test.c:38: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	aes_test.c:41: int good=1;
	mov	r6,#0x01
	mov	r7,#0x00
;	aes_test.c:44: for(i=0; i < 32; i++) {
	mov	r4,#0x00
	mov	r5,#0x00
00115$:
;	aes_test.c:45: pt_wren[i] = 0xff;
	mov	a,r4
	add	a,#_pt_wren
	mov	dpl,a
	mov	a,r5
	addc	a,#(_pt_wren >> 8)
	mov	dph,a
	mov	a,#0xFF
	movx	@dptr,a
;	aes_test.c:46: pt_rden[i] = 0xff;
	mov	a,r4
	add	a,#_pt_rden
	mov	dpl,a
	mov	a,r5
	addc	a,#(_pt_rden >> 8)
	mov	dph,a
	mov	a,#0xFF
	movx	@dptr,a
;	aes_test.c:44: for(i=0; i < 32; i++) {
	inc	r4
	cjne	r4,#0x00,00182$
	inc	r5
00182$:
	clr	c
	mov	a,r4
	subb	a,#0x20
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jc	00115$
;	aes_test.c:50: for(i=0; i < 32; i++) {
	mov	r4,#0x00
	mov	r5,#0x00
00117$:
;	aes_test.c:51: data[i]=i;
	mov	dpl,r4
	mov	a,#(_data >> 8)
	add	a,r5
	mov	dph,a
	mov	ar3,r4
	mov	a,r3
	movx	@dptr,a
;	aes_test.c:50: for(i=0; i < 32; i++) {
	inc	r4
	cjne	r4,#0x00,00184$
	inc	r5
00184$:
	clr	c
	mov	a,r4
	subb	a,#0x20
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jc	00117$
;	aes_test.c:55: aes_reg_addr = 0xE000;
	mov	dptr,#_aes_reg_addr
	clr	a
	movx	@dptr,a
	mov	a,#0xE0
	inc	dptr
	movx	@dptr,a
;	aes_test.c:56: aes_reg_len = 32;
	mov	dptr,#_aes_reg_len
	mov	a,#0x20
	movx	@dptr,a
	clr	a
	inc	dptr
	movx	@dptr,a
;	aes_test.c:57: for(i=0; i < 16; i++) { aes_reg_ctr[i] = i*i*i; }
	mov	r4,#0x00
	mov	r5,#0x00
00119$:
	mov	a,r4
	add	a,#_aes_reg_ctr
	mov	dpl,a
	mov	a,r5
	addc	a,#(_aes_reg_ctr >> 8)
	mov	dph,a
	mov	ar3,r4
	mov	a,r3
	mov	b,a
	mul	ab
	mov	b,r3
	mul	ab
	mov	r3,a
	movx	@dptr,a
	inc	r4
	cjne	r4,#0x00,00186$
	inc	r5
00186$:
	clr	c
	mov	a,r4
	subb	a,#0x10
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jc	00119$
;	aes_test.c:58: for(i=0; i < 16; i++) { aes_reg_key0[i] = i | (i << 4); }
	mov	r4,#0x00
	mov	r5,#0x00
00121$:
	mov	a,r4
	add	a,#_aes_reg_key0
	mov	dpl,a
	mov	a,r5
	addc	a,#(_aes_reg_key0 >> 8)
	mov	dph,a
	mov	ar3,r4
	mov	a,r3
	swap	a
	anl	a,#0xF0
	mov	r3,a
	rlc	a
	subb	a,acc
	mov	r2,a
	mov	a,r4
	orl	ar3,a
	mov	a,r5
	orl	ar2,a
	mov	a,r3
	movx	@dptr,a
	inc	r4
	cjne	r4,#0x00,00188$
	inc	r5
00188$:
	clr	c
	mov	a,r4
	subb	a,#0x10
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jc	00121$
;	aes_test.c:61: aes_reg_start = 1;
	mov	dptr,#_aes_reg_start
	mov	a,#0x01
	movx	@dptr,a
;	aes_test.c:63: while(aes_reg_state != 0);
00105$:
	mov	dptr,#_aes_reg_state
	movx	a,@dptr
	movx	a,@dptr
;	aes_test.c:66: for(i=0; i < 32; i++) {
	jnz	00105$
	mov	r4,a
	mov	r5,a
00123$:
;	aes_test.c:67: P0 = data[i];
	mov	dpl,r4
	mov	a,#(_data >> 8)
	add	a,r5
	mov	dph,a
	movx	a,@dptr
	mov	_P0,a
;	aes_test.c:66: for(i=0; i < 32; i++) {
	inc	r4
	cjne	r4,#0x00,00191$
	inc	r5
00191$:
	clr	c
	mov	a,r4
	subb	a,#0x20
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jc	00123$
;	aes_test.c:71: aes_reg_start = 1;
	mov	dptr,#_aes_reg_start
	mov	a,#0x01
	movx	@dptr,a
;	aes_test.c:72: while(aes_reg_state != 0)  {
00109$:
	mov	dptr,#_aes_reg_state
	movx	a,@dptr
	movx	a,@dptr
	jz	00144$
;	aes_test.c:78: __endasm;
;
	nop;
	nop;
	nop;
	nop;
;	aes_test.c:81: for(i=0; i < 32; i++) {
	sjmp	00109$
00144$:
	mov	r4,#0x00
	mov	r5,#0x00
00125$:
;	aes_test.c:82: if(data[i] != i) { 
	mov	dpl,r4
	mov	a,#(_data >> 8)
	add	a,r5
	mov	dph,a
	movx	a,@dptr
	mov	r3,a
	mov	r2,#0x00
	cjne	a,ar4,00194$
	mov	a,r2
	cjne	a,ar5,00194$
	sjmp	00126$
00194$:
;	aes_test.c:83: good =0;
	mov	r6,#0x00
	mov	r7,#0x00
;	aes_test.c:84: break;
	sjmp	00114$
00126$:
;	aes_test.c:81: for(i=0; i < 32; i++) {
	inc	r4
	cjne	r4,#0x00,00195$
	inc	r5
00195$:
	clr	c
	mov	a,r4
	subb	a,#0x20
	mov	a,r5
	xrl	a,#0x80
	subb	a,#0x80
	jc	00125$
00114$:
;	aes_test.c:87: P0 = good;
	mov	_P0,r6
;	aes_test.c:89: quit();
	ljmp	_quit
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
