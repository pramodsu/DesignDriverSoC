;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 2.9.0 #5416 (Feb  3 2010) (UNIX)
; This file was generated Mon Feb 16 18:38:48 2015
;--------------------------------------------------------
	.module testall
	.optsdcc -mmcs51 --model-small
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _quit
	.globl _T2CON_7
	.globl _T2CON_6
	.globl _T2CON_5
	.globl _T2CON_4
	.globl _T2CON_3
	.globl _T2CON_2
	.globl _T2CON_1
	.globl _T2CON_0
	.globl _RI
	.globl _TI
	.globl _RB8
	.globl _TB8
	.globl _REN
	.globl _SM2
	.globl _SM1
	.globl _SM0
	.globl _P1_7
	.globl _P1_6
	.globl _P1_5
	.globl _P1_4
	.globl _P1_3
	.globl _P1_2
	.globl _P1_1
	.globl _P1_0
	.globl _RXD
	.globl _TXD
	.globl _INT0
	.globl _INT1
	.globl _T0
	.globl _T1
	.globl _WR
	.globl _RD
	.globl _PX0
	.globl _PT0
	.globl _PX1
	.globl _PT1
	.globl _PS
	.globl _EX0
	.globl _ET0
	.globl _EX1
	.globl _ET1
	.globl _ES
	.globl _EA
	.globl _IT0
	.globl _IE0
	.globl _IT1
	.globl _IE1
	.globl _TR0
	.globl _TF0
	.globl _TR1
	.globl _TF1
	.globl _P
	.globl _OV
	.globl _RS0
	.globl _RS1
	.globl _F0
	.globl _AC
	.globl _CY
	.globl _RCAP2L
	.globl _RCAP2H
	.globl _T2CON
	.globl _SBUF
	.globl _SCON
	.globl _IP
	.globl _IE
	.globl _AUXR
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
	.globl _B
	.globl _ACC
	.globl _PSW
	.globl _P3
	.globl _P2
	.globl _P1
	.globl _P0
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
	.area RSEG    (DATA)
_P0	=	0x0080
_P1	=	0x0090
_P2	=	0x00a0
_P3	=	0x00b0
_PSW	=	0x00d0
_ACC	=	0x00e0
_B	=	0x00f0
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
_AUXR	=	0x008e
_IE	=	0x00a8
_IP	=	0x00b8
_SCON	=	0x0098
_SBUF	=	0x0099
_T2CON	=	0x00c8
_RCAP2H	=	0x00cb
_RCAP2L	=	0x00ca
;--------------------------------------------------------
; special function bits
;--------------------------------------------------------
	.area RSEG    (DATA)
_CY	=	0x00d7
_AC	=	0x00d6
_F0	=	0x00d5
_RS1	=	0x00d4
_RS0	=	0x00d3
_OV	=	0x00d2
_P	=	0x00d0
_TF1	=	0x008f
_TR1	=	0x008e
_TF0	=	0x008d
_TR0	=	0x008c
_IE1	=	0x008b
_IT1	=	0x008a
_IE0	=	0x0089
_IT0	=	0x0088
_EA	=	0x00af
_ES	=	0x00ac
_ET1	=	0x00ab
_EX1	=	0x00aa
_ET0	=	0x00a9
_EX0	=	0x00a8
_PS	=	0x00bc
_PT1	=	0x00bb
_PX1	=	0x00ba
_PT0	=	0x00b9
_PX0	=	0x00b8
_RD	=	0x00b7
_WR	=	0x00b6
_T1	=	0x00b5
_T0	=	0x00b4
_INT1	=	0x00b3
_INT0	=	0x00b2
_TXD	=	0x00b1
_RXD	=	0x00b0
_P1_0	=	0x0090
_P1_1	=	0x0091
_P1_2	=	0x0092
_P1_3	=	0x0093
_P1_4	=	0x0094
_P1_5	=	0x0095
_P1_6	=	0x0096
_P1_7	=	0x0097
_SM0	=	0x009f
_SM1	=	0x009e
_SM2	=	0x009d
_REN	=	0x009c
_TB8	=	0x009b
_RB8	=	0x009a
_TI	=	0x0099
_RI	=	0x0098
_T2CON_0	=	0x00c8
_T2CON_1	=	0x00c9
_T2CON_2	=	0x00ca
_T2CON_3	=	0x00cb
_T2CON_4	=	0x00cc
_T2CON_5	=	0x00cd
_T2CON_6	=	0x00ce
_T2CON_7	=	0x00cf
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
	.area OSEG    (OVR,DATA)
;--------------------------------------------------------
; Stack segment in internal ram 
;--------------------------------------------------------
	.area	SSEG	(DATA)
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
	lcall	_main
;	return from main will lock up
	sjmp .
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area CSEG    (CODE)
;------------------------------------------------------------
;Allocation info for local variables in function 'quit'
;------------------------------------------------------------
;------------------------------------------------------------
;	./testall.c:7: void quit() {
;	-----------------------------------------
;	 function quit
;	-----------------------------------------
_quit:
	ar2 = 0x02
	ar3 = 0x03
	ar4 = 0x04
	ar5 = 0x05
	ar6 = 0x06
	ar7 = 0x07
	ar0 = 0x00
	ar1 = 0x01
;	./testall.c:8: P0 = P1 = P2 = P3 = 0xDE;
	mov	_P3,#0xDE
	mov	_P2,#0xDE
	mov	_P1,#0xDE
	mov	_P0,#0xDE
;	./testall.c:9: P0 = P1 = P2 = P3 = 0xAD;
	mov	_P3,#0xAD
	mov	_P2,#0xAD
	mov	_P1,#0xAD
	mov	_P0,#0xAD
;	./testall.c:10: P0 = P1 = P2 = P3 = 0x00;
	mov	_P3,#0x00
	mov	_P2,#0x00
	mov	_P1,#0x00
	mov	_P0,#0x00
;	./testall.c:11: while(1);
00102$:
	sjmp	00102$
;------------------------------------------------------------
;Allocation info for local variables in function 'main'
;------------------------------------------------------------
;------------------------------------------------------------
;	./testall.c:14: void main() {
;	-----------------------------------------
;	 function main
;	-----------------------------------------
_main:
;	./testall.c:2211: MOV  A,R0
;
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_2:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_2
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV R0,#10
	  ADD A,R0
	  SUBB A,#20
	  JZ DONE_2
	  MOV P1,#2
	  LJMP FAILED
	 DONE_2:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_3:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_3
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV 100,#10
	  ADD A,100
	  SUBB A,#20
	  JZ DONE_3
	  MOV P1,#3
	  LJMP FAILED
	 DONE_3:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_4:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_4
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV R0,#100
	  MOV 100,#10
	  ADD A,@R0
	  SUBB A,#20
	  JZ DONE_4
	  MOV P1,#4
	  LJMP FAILED
	 DONE_4:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_5:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_5
	  MOV PSW,#0
	
	
	  MOV A,#10
	  ADD A,#5
	  SUBB A,#15
	  JZ DONE_5
	  MOV P1,#5
	  LJMP FAILED
	 DONE_5:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_6:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_6
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV R0,#10
	  CPL C
	  ADDC A,R0
	  SUBB A,#21
	  JZ DONE_6
	  MOV P1,#6
	  LJMP FAILED
	 DONE_6:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_7:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_7
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV 100,#10
	  CPL C
	  ADDC A,100
	  SUBB A,#21
	  JZ DONE_7
	  MOV P1,#7
	  LJMP FAILED
	 DONE_7:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_8:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_8
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV R0,#100
	  MOV 100,#10
	  CPL C
	  ADDC A,@R0
	  SUBB A,#21
	  JZ DONE_8
	  MOV P1,#8
	  LJMP FAILED
	 DONE_8:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_9:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_9
	  MOV PSW,#0
	
	
	  MOV A,#10
	  CPL C
	  ADDC A,#5
	  SUBB A,#16
	  JZ DONE_9
	  MOV P1,#9
	  LJMP FAILED
	 DONE_9:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_10:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_10
	  MOV PSW,#0
	
	
	  AJMP DONE_10
	  MOV P1,#10
	  LJMP FAILED
	 DONE_10:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_11:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_11
	  MOV PSW,#0
	
	
	  MOV R0,#255
	  MOV A,#170
	  ANL A,R0
	  SUBB A,#170
	  JZ DONE_11
	  MOV P1,#11
	  LJMP FAILED
	 DONE_11:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_12:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_12
	  MOV PSW,#0
	
	
	  MOV 127,#0
	  MOV A,#255
	  ANL A,127
	  JZ DONE_12
	  MOV P1,#12
	  LJMP FAILED
	 DONE_12:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_13:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_13
	  MOV PSW,#0
	
	
	  MOV R0,#127
	  MOV 127,#1
	  MOV A,#254
	  ANL A,@R0
	  JZ DONE_13
	  MOV P1,#13
	  LJMP FAILED
	 DONE_13:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_14:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_14
	  MOV PSW,#0
	
	
	  MOV A,#255
	  ANL A,#255
	  SUBB A,#255
	  JZ DONE_14
	  MOV P1,#14
	  LJMP FAILED
	 DONE_14:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_15:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_15
	  MOV PSW,#0
	
	
	  MOV 50,#255
	  MOV A,#0
	  ANL 50,A
	  MOV A,50
	  JZ DONE_15
	  MOV P1,#15
	  LJMP FAILED
	 DONE_15:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_16:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_16
	  MOV PSW,#0
	
	
	  MOV 25,#128
	  ANL 25,#255
	  MOV A,25
	  SUBB A,#128
	  JZ DONE_16
	  MOV P1,#16
	  LJMP FAILED
	 DONE_16:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_17:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_17
	  MOV PSW,#0
	
	
	  MOV A,#128
	  CPL C
	  ANL C,ACC.7
	  SUBB A,#127
	  JZ DONE_17
	  MOV P1,#17
	  LJMP FAILED
	 DONE_17:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_18:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_18
	  MOV PSW,#0
	
	
	  MOV A,#128
	  CPL C
	  ANL C,/ACC.7
	  SUBB A,#128
	  JZ DONE_18
	  MOV P1,#18
	  LJMP FAILED
	 DONE_18:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_19:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_19
	  MOV PSW,#0
	
	
	  MOV A,#128
	  MOV 100,#128
	  CJNE A,100,ERROR_19
	  MOV A,#127
	  CJNE A,100,CHECK_C_19
	 ERROR_19:
	  MOV P1,#19
	  LJMP FAILED
	 CHECK_C_19:
;Checks that carry was set
	  JC DONE_19
	  MOV P1,#19
	  LJMP FAILED
	 DONE_19:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_20:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_20
	  MOV PSW,#0
	
	
	  MOV A,#128
	  CJNE A,#128,ERROR_20
	  MOV A,#127
	  CJNE A,#128,CHECK_C_20
	 ERROR_20:
	  MOV P1,#20
	  LJMP FAILED
	 CHECK_C_20:
;Checks that carry was set
	  JC DONE_20
	  MOV P1,#20
	  LJMP FAILED
	 DONE_20:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_21:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_21
	  MOV PSW,#0
	
	
	  MOV R1,#128
	  CJNE R1,#128,ERROR_21
	  MOV R1,#127
	  CJNE R1,#128,CHECK_C_21
	 ERROR_21:
	  MOV P1,#21
	  LJMP FAILED
	 CHECK_C_21:
;Checks that carry was set
	  JC DONE_21
	  MOV P1,#21
	  LJMP FAILED
	 DONE_21:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_22:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_22
	  MOV PSW,#0
	
	
	  MOV R1,#100
	  MOV 100,#128
	  CJNE @R1,#128,ERROR_22
	  MOV 100,#127
	  CJNE @R1,#128,CHECK_C_22
	 ERROR_22:
	  MOV P1,#22
	  LJMP FAILED
	 CHECK_C_22:
;Checks that carry was set
	  JC DONE_22
	  MOV P1,#22
	  LJMP FAILED
	 DONE_22:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_23:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_23
	  MOV PSW,#0
	
	
	  MOV A,#128
	  CLR A
	  JZ DONE_23
	  MOV P1,#23
	  LJMP FAILED
	 DONE_23:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_24:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_24
	  MOV PSW,#0
	
	
	  CPL C
	  CLR C
	  JNC DONE_24
	  MOV P1,#24
	  LJMP FAILED
	 DONE_24:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_25:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_25
	  MOV PSW,#0
	
	
	  MOV A,#64
	  CLR ACC.6
	  JZ DONE_25
	  MOV P1,#25
	  LJMP FAILED
	 DONE_25:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_26:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_26
	  MOV PSW,#0
	
	
	  MOV A,#255
	  CPL A
	  JZ DONE_26
	  MOV P1,#26
	  LJMP FAILED
	 DONE_26:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_27:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_27
	  MOV PSW,#0
	
	
	  CPL C
	  JC DONE_27
	  MOV P1,#27
	  LJMP FAILED
	 DONE_27:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_28:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_28
	  MOV PSW,#0
	
	
	  MOV A,#32
	  CPL ACC.5
	  JZ DONE_28
	  MOV P1,#28
	  LJMP FAILED
	 DONE_28:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_29:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_29
	  MOV PSW,#0
	
	
	  MOV A,#0x80
	  ADD A,#0x99
	  DA A
	  SUBB A,#0x78 ;Will clr ACC if C set
	  JZ DONE_29
	  MOV P1,#29
	  LJMP FAILED
	 DONE_29:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_30:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_30
	  MOV PSW,#0
	
	
	  MOV A,#10
	  DEC A
	  SUBB A,#9
	  JZ DONE_30
	  MOV P1,#30
	  LJMP FAILED
	 DONE_30:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_31:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_31
	  MOV PSW,#0
	
	
	  MOV R0,#10
	  DEC R0
	  MOV A,R0
	  SUBB A,#9
	  JZ DONE_31
	  MOV P1,#31
	  LJMP FAILED
	 DONE_31:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_32:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_32
	  MOV PSW,#0
	
	
	  MOV 127,#10
	  DEC 127
	  MOV A,127
	  SUBB A,#9
	  JZ DONE_32
	  MOV P1,#32
	  LJMP FAILED
	 DONE_32:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_33:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_33
	  MOV PSW,#0
	
	
	  MOV R0,#127
	  MOV 127,#10
	  DEC @R0
	  MOV A,@R0
	  SUBB A,#9
	  JZ DONE_33
	  MOV P1,#33
	  LJMP FAILED
	 DONE_33:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_34:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_34
	  MOV PSW,#0
	
	
	  MOV A,#251
	  MOV B,#18
	  DIV AB
	  SUBB A,#13
	  JZ CHECK_B_34
	  MOV P1,#34
	 CHECK_B_34:
	  MOV A,B
	  SUBB A,#17
	  JZ DONE_34
	  MOV P1,#34
	  LJMP FAILED
	 DONE_34:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_35:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_35
	  MOV PSW,#0
	
	
	  MOV R0,#10
	  DJNZ R0,JUMP_35 ;Should jump
	  MOV P1,#35
	  LJMP FAILED
	 JUMP_35:
	  MOV R0,#1
	  DJNZ R0,NOT_JUMP_35 ;Should not jump
	  AJMP DONE_35
	 NOT_JUMP_35:
	  MOV P1,#35
	  LJMP FAILED
	 DONE_35:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_36:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_36
	  MOV PSW,#0
	
	
	  MOV 127,#10
	  DJNZ 127,JUMP_36 ;Should jump
	  MOV P1,#36
	  LJMP FAILED
	 JUMP_36:
	  MOV 127,#1
	  DJNZ 127,NOT_JUMP_36 ;Should not jump
	  AJMP DONE_36
	 NOT_JUMP_36:
	  MOV P1,#36
	  LJMP FAILED
	 DONE_36:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_37:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_37
	  MOV PSW,#0
	
	
	  MOV A,#10
	  INC A
	  SUBB A,#11
	  JZ DONE_37
	  MOV P1,#37
	  LJMP FAILED
	 DONE_37:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_38:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_38
	  MOV PSW,#0
	
	
	  MOV R0,#10
	  INC R0
	  MOV A,R0
	  SUBB A,#11
	  JZ DONE_38
	  MOV P1,#38
	  LJMP FAILED
	 DONE_38:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_39:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_39
	  MOV PSW,#0
	
	
	  MOV 127,#10
	  INC 127
	  MOV A,127
	  SUBB A,#11
	  JZ DONE_39
	  MOV P1,#39
	  LJMP FAILED
	 DONE_39:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_40:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_40
	  MOV PSW,#0
	
	
	  MOV 127,#10
	  MOV R0,#127
	  INC @R0
	  MOV A,@R0
	  SUBB A,#11
	  JZ DONE_40
	  MOV P1,#40
	  LJMP FAILED
	 DONE_40:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_41:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_41
	  MOV PSW,#0
	
	
	  MOV DPTR,#0x12FF
	  INC DPTR
	  MOV A,DPH
	  SUBB A,#0x13
	  JZ DPH_OK_41
	  MOV P1,#41
	  LJMP FAILED
	 DPH_OK_41:
	  MOV A,DPL
	  JZ DONE_41
	  MOV P1,#41
	  LJMP FAILED
	 DONE_41:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_42:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_42
	  MOV PSW,#0
	
	
	  MOV A,#16
	  JB ACC.4,DONE_42_1
	  MOV P1,#42
	        MOV P2,#1
	  LJMP FAILED
	 DONE_42_1:
	        MOV P2,#2
	        JB ACC.5,TEST_42_FAIL
	        SJMP DONE_42_2
	    TEST_42_FAIL:
	        LJMP FAILED
	    DONE_42_2:
	
	
	  MOV R0,#128
	 RAM_CLR_43:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_43
	  MOV PSW,#0
	
	
	  MOV A,#8
	  JBC ACC.3,CHECK_BIT_43
	  MOV P1,#43
	  LJMP FAILED
	 CHECK_BIT_43:
	  JZ DONE_43
	  MOV P1,#43
	  LJMP FAILED
	 DONE_43:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_44:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_44
	  MOV PSW,#0
	
	
	  JC ERROR_44
	  CPL C
	  JC DONE_44
	 ERROR_44:
	  MOV P1,#44
	  LJMP FAILED
	 DONE_44:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_45:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_45
	  MOV PSW,#0
	
	
	  MOV A,#4
	  MOV DPTR,#JMP_TBL
	  JMP @A+DPTR
	 JMP_TBL:
	  AJMP JUMP_0
	  AJMP JUMP_2
	  AJMP JUMP_4
	  AJMP JUMP_6
	 JUMP_0:
	 JUMP_2:
	 JUMP_6:
	  MOV P1,#43
	  LJMP FAILED
	 JUMP_4:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_46:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_46
	  MOV PSW,#0
	
	
	  MOV A,#4
	  JNB ACC.2,ERROR_46
	  JNB ACC.1,DONE_46
	 ERROR_46:
	  MOV P1,#46
	  LJMP FAILED
	 DONE_46:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_47:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_47
	  MOV PSW,#0
	
	
	  CPL C
	  JNC ERROR_47
	  CPL C
	  JNC DONE_47
	 ERROR_47:
	  MOV P1,#47
	  LJMP FAILED
	 DONE_47:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_48:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_48
	  MOV PSW,#0
	
	
	  JNZ ERROR_48
	  MOV A,#1
	  JNZ DONE_48
	 ERROR_48:
	  MOV P1,#48
	  LJMP FAILED
	 DONE_48:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_49:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_49
	  MOV PSW,#0
	
	
	  MOV A,#2
	  JZ ERROR_49
	  MOV A,#0
	  JZ DONE_49
	 ERROR_49:
	  MOV P1,#49
	  LJMP FAILED
	 DONE_49:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_51:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_51
	  MOV PSW,#0
	
	
	       LJMP DONE_51
	  MOV P1,#51
	  LJMP FAILED
	 DONE_51:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_52:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_52
	  MOV PSW,#0
	
	
	  MOV R0,#10
	  MOV A,R0
	  SUBB A,#10
	  JZ DONE_52
	  MOV P1,#52
	  LJMP FAILED
	 DONE_52:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_53:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_53
	  MOV PSW,#0
	
	
	  MOV 127,#10
	  MOV A,127
	  SUBB A,#10
	  JZ DONE_53
	  MOV P1,#53
	  LJMP FAILED
	 DONE_53:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_54:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_54
	  MOV PSW,#0
	
	
	  MOV R0,#127
	  MOV 127,#10
	  MOV A,@R0
	  SUBB A,#10
	  JZ DONE_54
	  MOV P1,#54
	  LJMP FAILED
	 DONE_54:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_55:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_55
	  MOV PSW,#0
	
	
	  MOV A,#10
	  SUBB A,#10
	  JZ DONE_55
	  MOV P1,#55
	  LJMP FAILED
	 DONE_55:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_56:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_56
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV R0,A
	  CLR A
	  MOV A,R0
	  SUBB A,#10
	  JZ DONE_56
	  MOV P1,#56
	  LJMP FAILED
	 DONE_56:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_57:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_57
	  MOV PSW,#0
	
	
	  MOV 127,#10
	  MOV R0,127
	  MOV A,R0
	  SUBB A,#10
	  JZ DONE_57
	  MOV P1,#57
	  LJMP FAILED
	 DONE_57:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_58:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_58
	  MOV PSW,#0
	
	
	  MOV R0,#10
	  MOV A,R0
	  SUBB A,#10
	  JZ DONE_58
	  MOV P1,#58
	  LJMP FAILED
	 DONE_58:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_59:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_59
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV 127,A
	  CLR A
	  MOV A,127
	  SUBB A,#10
	  JZ DONE_59
	  MOV P1,#59
	  LJMP FAILED
	 DONE_59:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_60:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_60
	  MOV PSW,#0
	
	
	  MOV R0,#10
	  MOV 127,R0
	  MOV A,127
	  SUBB A,#10
	  JZ DONE_60
	  MOV P1,#60
	  LJMP FAILED
	 DONE_60:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_61:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_61
	  MOV PSW,#0
	
	
	  MOV 127,#10
	  MOV 126,127
	  MOV A,126
	  SUBB A,#10
	  JZ DONE_61
	  MOV P1,#61
	  LJMP FAILED
	 DONE_61:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_62:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_62
	  MOV PSW,#0
	
	
	  MOV 127,#10
	  MOV R0,#127
	  MOV 126,@R0
	  MOV A,126
	  SUBB A,#10
	  JZ DONE_62
	  MOV P1,#62
	  LJMP FAILED
	 DONE_62:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_63:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_63
	  MOV PSW,#0
	
	
	  MOV 127,#10
	  MOV A,127
	  SUBB A,#10
	  JZ DONE_63
	  MOV P1,#63
	  LJMP FAILED
	 DONE_63:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_64:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_64
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV R0,#127
	  MOV @R0,A
	  CLR A
	  MOV A,127
	  SUBB A,#10
	  JZ DONE_64
	  MOV P1,#64
	  LJMP FAILED
	 DONE_64:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_65:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_65
	  MOV PSW,#0
	
	
	  MOV 127,#10
	  MOV R0,#126
	  MOV @R0,127
	  MOV A,126
	  SUBB A,#10
	  JZ DONE_65
	  MOV P1,#65
	  LJMP FAILED
	 DONE_65:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_66:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_66
	  MOV PSW,#0
	
	
	  MOV R0,#127
	  MOV @R0,#10
	  MOV A,127
	  SUBB A,#10
	  JZ DONE_66
	  MOV P1,#66
	  LJMP FAILED
	 DONE_66:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_67:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_67
	  MOV PSW,#0
	
	
	  MOV A,#1
	  MOV C,ACC.0
	  JC DONE_67
	  MOV P1,#67
	  LJMP FAILED
	 DONE_67:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_68:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_68
	  MOV PSW,#0
	
	
	  CPL C
	  MOV ACC.0,C
	  CPL C
	  SUBB A,#1
	  JZ DONE_68
	  MOV P1,#68
	  LJMP FAILED
	 DONE_68:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_69:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_69
	  MOV PSW,#0
	
	
	  MOV DPTR,#0x1234
	  MOV A,DPH
	  SUBB A,#0x12
	  JNZ ERROR_69
	  MOV A,DPL
	  SUBB A,#0x34
	  JZ DONE_69
	 ERROR_69:
	  MOV P1,#69
	  LJMP FAILED
	 DONE_69:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_70:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_70
	  MOV PSW,#0
;	# 1504 "./testall.c"
	  MOV R0,#128
	 RAM_CLR_71:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_71
	  MOV PSW,#0
;	# 1535 "./testall.c"
	  MOV R0,#128
	 RAM_CLR_76:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_76
	  MOV PSW,#0
	
	
	  MOV A,#80
	  MOV B,#160
	  MUL AB ; = 0x3200
	  JNZ ERROR_76
	  MOV A,B
	  SUBB A,#0x32
	  JZ DONE_76
	 ERROR_76:
	  MOV P1,#76
	  LJMP FAILED
	 DONE_76:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_78:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_78
	  MOV PSW,#0
	
	
	  MOV A,#0x90
	  MOV R0,#0x9
	  ORL A,R0
	  SUBB A,#0x99
	  JZ DONE_78
	  MOV P1,#78
	  LJMP FAILED
	 DONE_78:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_79:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_79
	  MOV PSW,#0
	
	
	  MOV A,#0x9
	  MOV 127,#0x90
	  ORL A,127
	  SUBB A,#0x99
	  JZ DONE_79
	  MOV P1,#79
	  LJMP FAILED
	 DONE_79:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_80:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_80
	  MOV PSW,#0
	
	
	  MOV A,#0x90
	  MOV R0,#127
	  MOV 127,#0x06
	  ORL A,@R0
	  SUBB A,#0x96
	  JZ DONE_80
	  MOV P1,#80
	  LJMP FAILED
	 DONE_80:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_81:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_81
	  MOV PSW,#0
	
	
	  MOV A,#0x11
	  ORL A,#0x22
	  SUBB A,#0x33
	  JZ DONE_81
	  MOV P1,#81
	  LJMP FAILED
	 DONE_81:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_82:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_82
	  MOV PSW,#0
	
	
	  MOV A,#0x90
	  MOV 127,#0x9
	  ORL 127,A
	  CLR A
	  MOV A,127
	  SUBB A,#0x99
	  JZ DONE_82
	  MOV P1,#82
	  LJMP FAILED
	 DONE_82:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_83:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_83
	  MOV PSW,#0
	
	
	  MOV 127,#0x90
	  ORL 127,#0x9
	  MOV A,127
	  SUBB A,#0x99
	  JZ DONE_83
	  MOV P1,#83
	  LJMP FAILED
	 DONE_83:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_84:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_84
	  MOV PSW,#0
	
	
	  ORL C,ACC.0
	  JC ERROR_84
	  MOV A,#1
	  ORL C,ACC.0
	  JNC ERROR_84
	  ORL C,ACC.1
	  JC DONE_84
	 ERROR_84:
	  MOV P1,#84
	  LJMP FAILED
	 DONE_84:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_85:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_85
	  MOV PSW,#0
	
	
	  MOV A,#1
	  ORL C,/ACC.0
	  JC ERROR_85
	  ORL C,/ACC.1
	  JNC ERROR_85
	  ORL C,/ACC.0
	  JC DONE_85
	 ERROR_85:
	  MOV P1,#85
	  LJMP FAILED
	 DONE_85:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_87:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_87
	  MOV PSW,#0
	
	
	  MOV DPTR,#0x0123
	  MOV 127,#8
	  PUSH DPL
	  PUSH DPH
	  PUSH 127
	  MOV A,8
	  SUBB A,#0x23
	  JNZ ERROR_87
	  MOV A,9
	  SUBB A,#1
	  JNZ ERROR_87
	  MOV A,10
	  SUBB A,#8
	  JZ DONE_87
	 ERROR_87:
	  MOV P1,#87
	  LJMP FAILED
	 DONE_87:
	
	
	  POP SP
	  POP 100
	  MOV A,100
	  SUBB A,#0x23
	  JZ DONE_86
	  MOV P1,#86
	  LJMP FAILED
	 DONE_86:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_90:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_90
	  MOV PSW,#0
	
	
	  MOV A,#129
	  RL A
	  SUBB A,#3
	  JZ DONE_90
	  MOV P1,#90
	  LJMP FAILED
	 DONE_90:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_91:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_91
	  MOV PSW,#0
	
	
	  MOV A,#129
	  RLC A
	  SUBB A,#1 ;A(2)-C(1)-1
	  JZ DONE_91
	  MOV P1,#91
	  LJMP FAILED
	 DONE_91:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_92:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_92
	  MOV PSW,#0
	
	
	  MOV A,#129
	  RR A
	  SUBB A,#192
	  JZ DONE_92
	  MOV P1,#92
	  LJMP FAILED
	 DONE_92:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_93:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_93
	  MOV PSW,#0
	
	
	  MOV A,#3
	  RRC A
	  SUBB A,#0 ;A(1)-C(1)-0
	  JZ DONE_93
	  MOV P1,#93
	  LJMP FAILED
	 DONE_93:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_94:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_94
	  MOV PSW,#0
	
	
	  SETB C
	  MOV A,#1
	  SUBB A,#0 ;A(1)-C(1)-0
	  JZ DONE_94
	  MOV P1,#94
	  LJMP FAILED
	 DONE_94:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_95:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_95
	  MOV PSW,#0
	
	
	  SETB ACC.7
	  SUBB A,#128
	  JZ DONE_95
	  MOV P1,#95
	  LJMP FAILED
	 DONE_95:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_96:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_96
	  MOV PSW,#0
	
	
	  SJMP DONE_96
	  MOV P1,#96
	  LJMP FAILED
	 DONE_96:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_97:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_97
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV R0,#10
	  SUBB A,R0
	  JZ DONE_97
	  MOV P1,#97
	  LJMP FAILED
	 DONE_97:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_98:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_98
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV 127,#10
	  SUBB A,127
	  JZ DONE_98
	  MOV P1,#98
	  LJMP FAILED
	 DONE_98:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_99:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_99
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV R0,#127
	  MOV 127,#10
	  SUBB A,@R0
	  JZ DONE_99
	  MOV P1,#99
	  LJMP FAILED
	 DONE_99:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_100:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_100
	  MOV PSW,#0
	
	
	  MOV A,#10
	  SUBB A,#10
	  JZ DONE_100
	  MOV P1,#100
	  LJMP FAILED
	 DONE_100:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_101:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_101
	  MOV PSW,#0
	
	
	  MOV A,#0x23
	  SWAP A
	  SUBB A,#0x32
	  JZ DONE_101
	  MOV P1,#101
	  LJMP FAILED
	 DONE_101:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_102:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_102
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV R0,#99
	  XCH A,R0
	  SUBB A,#99
	  JNZ ERROR_102
	  MOV A,R0
	  SUBB A,#10
	  JZ DONE_102
	 ERROR_102:
	  MOV P1,#102
	  LJMP FAILED
	 DONE_102:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_103:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_103
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV 127,#99
	  XCH A,127
	  SUBB A,#99
	  JNZ ERROR_103
	  MOV A,127
	  SUBB A,#10
	  JZ DONE_103
	 ERROR_103:
	  MOV P1,#103
	  LJMP FAILED
	 DONE_103:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_104:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_104
	  MOV PSW,#0
	
	
	  MOV A,#10
	  MOV R0,#127
	  MOV 127,#99
	  XCH A,@R0
	  SUBB A,#99
	  JNZ ERROR_104
	  MOV A,127
	  SUBB A,#10
	  JZ DONE_104
	 ERROR_104:
	  MOV P1,#104
	  LJMP FAILED
	 DONE_104:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_105:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_105
	  MOV PSW,#0
	
	
	  MOV A,#0x44
	  MOV R0,#127
	  MOV 127,#0x55
	  XCHD A,@R0
	  SUBB A,#0x45
	  JNZ ERROR_105
	  MOV A,127
	  SUBB A,#0x54
	  JZ DONE_105
	 ERROR_105:
	  MOV P1,#105
	  LJMP FAILED
	 DONE_105:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_106:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_106
	  MOV PSW,#0
	
	
	  MOV A,#0x35
	  MOV R0,#0x53
	  XRL A,R0
	  SUBB A,#0x66
	  JZ DONE_106
	  MOV P1,#106
	  LJMP FAILED
	 DONE_106:
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_107:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_107
	  MOV PSW,#0
	
	
	  MOV A,#0x53
	  MOV 127,#0x35
	  XRL A,127
	  SUBB A,#0x66
	  JZ DONE_107
	  MOV P1,#107
	  LJMP FAILED
	 DONE_107:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_108:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_108
	  MOV PSW,#0
	
	
	  MOV A,#0x35
	  MOV R0,#127
	  MOV 127,#0x53
	  XRL A,@R0
	  SUBB A,#0x66
	  JZ DONE_108
	  MOV P1,#108
	  LJMP FAILED
	 DONE_108:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_109:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_109
	  MOV PSW,#0
	
	
	  MOV A,#0x35
	  XRL A,#0x53
	  SUBB A,#0x66
	  JZ DONE_109
	  MOV P1,#109
	  LJMP FAILED
	 DONE_109:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_110:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_110
	  MOV PSW,#0
	
	
	  MOV A,#0x35
	  MOV 127,#0x53
	  XRL 127,A
	  CLR A
	  MOV A,127
	  SUBB A,#0x66
	  JZ DONE_110
	  MOV P1,#110
	  LJMP FAILED
	 DONE_110:
	
	
	
	
	
	  MOV R0,#128
	 RAM_CLR_111:
	  DEC R0
	  MOV @R0,#0
	  MOV A,R0
	  JNZ RAM_CLR_111
	  MOV PSW,#0
	
	
	  MOV 127,#0x35
	  XRL 127,#0x53
	  MOV A,127
	  SUBB A,#0x66
	  JZ DONE_111
	  MOV P1,#111
	  LJMP FAILED
	 DONE_111:
	
	
	
	
	  MOV P1,#127 ; All instructions passed
	
	
	 FAILED:
	
	 
;	./testall.c:2213: MOV  PSW,#0
	ljmp	_quit
	.area CSEG    (CODE)
	.area CONST   (CODE)
	.area XINIT   (CODE)
	.area CABS    (ABS,CODE)
