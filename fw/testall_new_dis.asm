CSEG AT 0000h
  0000 020008		LJMP L0001

L0004:
  0003 12008A		LCALL L0005
L0006:
  0006 80FE  		SJMP L0006

L0001:
  0008 758107		MOV SP, #7h
  000B 120B5A		LCALL L0002
  000E E582  		MOV A, DPL
  0010 6003  		JZ L0003
  0012 020003		LJMP L0004

L0003:
  0015 7900  		MOV R1, #0h
  0017 E9    		MOV A, R1
  0018 4400  		ORL A, #0h
  001A 601B  		JZ L0115
  001C 7A00  		MOV R2, #0h
  001E 900B5E		MOV DPTR, #0B5Eh
  0021 7800  		MOV R0, #0h
  0023 75A000		MOV P2, #0h
L0117:
  0026 E4    		CLR A
  0027 93    		MOVC A, @A+DPTR
  0028 F2    		MOVX @R0, A
  0029 A3    		INC DPTR
  002A 08    		INC R0
  002B B80002		CJNE R0, #0h, L0116
  002E 05A0  		INC P2
L0116:
  0030 D9F4  		DJNZ R1, L0117
  0032 DAF2  		DJNZ R2, L0117
  0034 75A0FF		MOV P2, #0FFh
L0115:
  0037 E4    		CLR A
  0038 78FF  		MOV R0, #0FFh
L0118:
  003A F6    		MOV @R0, A
  003B D8FD  		DJNZ R0, L0118
  003D 7800  		MOV R0, #0h
  003F E8    		MOV A, R0
  0040 4400  		ORL A, #0h
  0042 600A  		JZ L0119
  0044 7900  		MOV R1, #0h
  0046 75A000		MOV P2, #0h
  0049 E4    		CLR A
L0120:
  004A F3    		MOVX @R1, A
  004B 09    		INC R1
  004C D8FC  		DJNZ R0, L0120
L0119:
  004E 7800  		MOV R0, #0h
  0050 E8    		MOV A, R0
  0051 4400  		ORL A, #0h
  0053 600C  		JZ L0121
  0055 7900  		MOV R1, #0h
  0057 900000		MOV DPTR, #0000h
  005A E4    		CLR A
L0122:
  005B F0    		MOVX @DPTR, A
  005C A3    		INC DPTR
  005D D8FC  		DJNZ R0, L0122
  005F D9FA  		DJNZ R1, L0122
L0121:
  0061 020003		LJMP L0004

L0010:
  0064 75B0DE		MOV P3, #0DEh
  0067 75A0DE		MOV P2, #0DEh
  006A 7590DE		MOV P1, #0DEh
  006D 7580DE		MOV P0, #0DEh
  0070 75B0AD		MOV P3, #0ADh
  0073 75A0AD		MOV P2, #0ADh
  0076 7590AD		MOV P1, #0ADh
  0079 7580AD		MOV P0, #0ADh
  007C 75B000		MOV P3, #0h
  007F 75A000		MOV P2, #0h
  0082 759000		MOV P1, #0h
  0085 758000		MOV P0, #0h
L0011:
  0088 80FE  		SJMP L0011

L0005:
  008A 7880  		MOV R0, #80h
L0007:
  008C 18    		DEC R0
  008D 7600  		MOV @R0, #0h
  008F E8    		MOV A, R0
  0090 70FA  		JNZ L0007
  0092 75D000		MOV PSW, #0h
  0095 740A  		MOV A, #0Ah
  0097 780A  		MOV R0, #0Ah
  0099 28    		ADD A, R0
  009A 9414  		SUBB A, #14h
  009C 6006  		JZ L0008
  009E 759002		MOV P1, #2h
  00A1 020B57		LJMP L0009

L0008:
  00A4 7880  		MOV R0, #80h
L0012:
  00A6 18    		DEC R0
  00A7 7600  		MOV @R0, #0h
  00A9 E8    		MOV A, R0
  00AA 70FA  		JNZ L0012
  00AC 75D000		MOV PSW, #0h
  00AF 740A  		MOV A, #0Ah
  00B1 75640A		MOV 64h, #0Ah
  00B4 2564  		ADD A, 64h
  00B6 9414  		SUBB A, #14h
  00B8 6006  		JZ L0013
  00BA 759003		MOV P1, #3h
  00BD 020B57		LJMP L0009

L0013:
  00C0 7880  		MOV R0, #80h
L0014:
  00C2 18    		DEC R0
  00C3 7600  		MOV @R0, #0h
  00C5 E8    		MOV A, R0
  00C6 70FA  		JNZ L0014
  00C8 75D000		MOV PSW, #0h
  00CB 740A  		MOV A, #0Ah
  00CD 7864  		MOV R0, #64h
  00CF 75640A		MOV 64h, #0Ah
  00D2 26    		ADD A, @R0
  00D3 9414  		SUBB A, #14h
  00D5 6006  		JZ L0015
  00D7 759004		MOV P1, #4h
  00DA 020B57		LJMP L0009

L0015:
  00DD 7880  		MOV R0, #80h
L0016:
  00DF 18    		DEC R0
  00E0 7600  		MOV @R0, #0h
  00E2 E8    		MOV A, R0
  00E3 70FA  		JNZ L0016
  00E5 75D000		MOV PSW, #0h
  00E8 740A  		MOV A, #0Ah
  00EA 2405  		ADD A, #5h
  00EC 940F  		SUBB A, #0Fh
  00EE 6006  		JZ L0017
  00F0 759005		MOV P1, #5h
  00F3 020B57		LJMP L0009

L0017:
  00F6 7880  		MOV R0, #80h
L0018:
  00F8 18    		DEC R0
  00F9 7600  		MOV @R0, #0h
  00FB E8    		MOV A, R0
  00FC 70FA  		JNZ L0018
  00FE 75D000		MOV PSW, #0h
  0101 740A  		MOV A, #0Ah
  0103 780A  		MOV R0, #0Ah
  0105 B3    		CPL C
  0106 38    		ADDC A, R0
  0107 9415  		SUBB A, #15h
  0109 6006  		JZ L0019
  010B 759006		MOV P1, #6h
  010E 020B57		LJMP L0009

L0019:
  0111 7880  		MOV R0, #80h
L0020:
  0113 18    		DEC R0
  0114 7600  		MOV @R0, #0h
  0116 E8    		MOV A, R0
  0117 70FA  		JNZ L0020
  0119 75D000		MOV PSW, #0h
  011C 740A  		MOV A, #0Ah
  011E 75640A		MOV 64h, #0Ah
  0121 B3    		CPL C
  0122 3564  		ADDC A, 64h
  0124 9415  		SUBB A, #15h
  0126 6006  		JZ L0021
  0128 759007		MOV P1, #7h
  012B 020B57		LJMP L0009

L0021:
  012E 7880  		MOV R0, #80h
L0022:
  0130 18    		DEC R0
  0131 7600  		MOV @R0, #0h
  0133 E8    		MOV A, R0
  0134 70FA  		JNZ L0022
  0136 75D000		MOV PSW, #0h
  0139 740A  		MOV A, #0Ah
  013B 7864  		MOV R0, #64h
  013D 75640A		MOV 64h, #0Ah
  0140 B3    		CPL C
  0141 36    		ADDC A, @R0
  0142 9415  		SUBB A, #15h
  0144 6006  		JZ L0023
  0146 759008		MOV P1, #8h
  0149 020B57		LJMP L0009

L0023:
  014C 7880  		MOV R0, #80h
L0024:
  014E 18    		DEC R0
  014F 7600  		MOV @R0, #0h
  0151 E8    		MOV A, R0
  0152 70FA  		JNZ L0024
  0154 75D000		MOV PSW, #0h
  0157 740A  		MOV A, #0Ah
  0159 B3    		CPL C
  015A 3405  		ADDC A, #5h
  015C 9410  		SUBB A, #10h
  015E 6006  		JZ L0025
  0160 759009		MOV P1, #9h
  0163 020B57		LJMP L0009

L0025:
  0166 7880  		MOV R0, #80h
L0026:
  0168 18    		DEC R0
  0169 7600  		MOV @R0, #0h
  016B E8    		MOV A, R0
  016C 70FA  		JNZ L0026
  016E 75D000		MOV PSW, #0h
  0171 2179  		AJMP L0027

  0173 75    		DB 075h ; 'u'
  0174 90    		DB 090h 
  0175 0A    		DB 00Ah 
  0176 02    		DB 002h 
  0177 0B    		DB 00Bh 
  0178 57    		DB 057h ; 'W'
L0027:
  0179 7880  		MOV R0, #80h
L0028:
  017B 18    		DEC R0
  017C 7600  		MOV @R0, #0h
  017E E8    		MOV A, R0
  017F 70FA  		JNZ L0028
  0181 75D000		MOV PSW, #0h
  0184 78FF  		MOV R0, #0FFh
  0186 74AA  		MOV A, #0AAh
  0188 58    		ANL A, R0
  0189 94AA  		SUBB A, #0AAh
  018B 6006  		JZ L0029
  018D 75900B		MOV P1, #0Bh
  0190 020B57		LJMP L0009

L0029:
  0193 7880  		MOV R0, #80h
L0030:
  0195 18    		DEC R0
  0196 7600  		MOV @R0, #0h
  0198 E8    		MOV A, R0
  0199 70FA  		JNZ L0030
  019B 75D000		MOV PSW, #0h
  019E 757F00		MOV 7Fh, #0h
  01A1 74FF  		MOV A, #0FFh
  01A3 557F  		ANL A, 7Fh
  01A5 6006  		JZ L0031
  01A7 75900C		MOV P1, #0Ch
  01AA 020B57		LJMP L0009

L0031:
  01AD 7880  		MOV R0, #80h
L0032:
  01AF 18    		DEC R0
  01B0 7600  		MOV @R0, #0h
  01B2 E8    		MOV A, R0
  01B3 70FA  		JNZ L0032
  01B5 75D000		MOV PSW, #0h
  01B8 787F  		MOV R0, #7Fh
  01BA 757F01		MOV 7Fh, #1h
  01BD 74FE  		MOV A, #0FEh
  01BF 56    		ANL A, @R0
  01C0 6006  		JZ L0033
  01C2 75900D		MOV P1, #0Dh
  01C5 020B57		LJMP L0009

L0033:
  01C8 7880  		MOV R0, #80h
L0034:
  01CA 18    		DEC R0
  01CB 7600  		MOV @R0, #0h
  01CD E8    		MOV A, R0
  01CE 70FA  		JNZ L0034
  01D0 75D000		MOV PSW, #0h
  01D3 74FF  		MOV A, #0FFh
  01D5 54FF  		ANL A, #0FFh
  01D7 94FF  		SUBB A, #0FFh
  01D9 6006  		JZ L0035
  01DB 75900E		MOV P1, #0Eh
  01DE 020B57		LJMP L0009

L0035:
  01E1 7880  		MOV R0, #80h
L0036:
  01E3 18    		DEC R0
  01E4 7600  		MOV @R0, #0h
  01E6 E8    		MOV A, R0
  01E7 70FA  		JNZ L0036
  01E9 75D000		MOV PSW, #0h
  01EC 7532FF		MOV 32h, #0FFh
  01EF 7400  		MOV A, #0h
  01F1 5232  		ANL 32h, A
  01F3 E532  		MOV A, 32h
  01F5 6006  		JZ L0037
  01F7 75900F		MOV P1, #0Fh
  01FA 020B57		LJMP L0009

L0037:
  01FD 7880  		MOV R0, #80h
L0038:
  01FF 18    		DEC R0
  0200 7600  		MOV @R0, #0h
  0202 E8    		MOV A, R0
  0203 70FA  		JNZ L0038
  0205 75D000		MOV PSW, #0h
  0208 751980		MOV 19h, #80h
  020B 5319FF		ANL 19h, #0FFh
  020E E519  		MOV A, 19h
  0210 9480  		SUBB A, #80h
  0212 6006  		JZ L0039
  0214 759010		MOV P1, #10h
  0217 020B57		LJMP L0009

L0039:
  021A 7880  		MOV R0, #80h
L0040:
  021C 18    		DEC R0
  021D 7600  		MOV @R0, #0h
  021F E8    		MOV A, R0
  0220 70FA  		JNZ L0040
  0222 75D000		MOV PSW, #0h
  0225 7480  		MOV A, #80h
  0227 B3    		CPL C
  0228 82E7  		ANL C, ACC.7
  022A 947F  		SUBB A, #7Fh
  022C 6006  		JZ L0041
  022E 759011		MOV P1, #11h
  0231 020B57		LJMP L0009

L0041:
  0234 7880  		MOV R0, #80h
L0042:
  0236 18    		DEC R0
  0237 7600  		MOV @R0, #0h
  0239 E8    		MOV A, R0
  023A 70FA  		JNZ L0042
  023C 75D000		MOV PSW, #0h
  023F 7480  		MOV A, #80h
  0241 B3    		CPL C
  0242 B0E7  		ANL C, /ACC.7
  0244 9480  		SUBB A, #80h
  0246 6006  		JZ L0043
  0248 759012		MOV P1, #12h
  024B 020B57		LJMP L0009

L0043:
  024E 7880  		MOV R0, #80h
L0044:
  0250 18    		DEC R0
  0251 7600  		MOV @R0, #0h
  0253 E8    		MOV A, R0
  0254 70FA  		JNZ L0044
  0256 75D000		MOV PSW, #0h
  0259 7480  		MOV A, #80h
  025B 756480		MOV 64h, #80h
  025E B56405		CJNE A, 64h, L0045
  0261 747F  		MOV A, #7Fh
  0263 B56406		CJNE A, 64h, L0046
L0045:
  0266 759013		MOV P1, #13h
  0269 020B57		LJMP L0009

L0046:
  026C 4006  		JC L0047
  026E 759013		MOV P1, #13h
  0271 020B57		LJMP L0009

L0047:
  0274 7880  		MOV R0, #80h
L0048:
  0276 18    		DEC R0
  0277 7600  		MOV @R0, #0h
  0279 E8    		MOV A, R0
  027A 70FA  		JNZ L0048
  027C 75D000		MOV PSW, #0h
  027F 7480  		MOV A, #80h
  0281 B48005		CJNE A, #80h, L0049
  0284 747F  		MOV A, #7Fh
  0286 B48006		CJNE A, #80h, L0050
L0049:
  0289 759014		MOV P1, #14h
  028C 020B57		LJMP L0009

L0050:
  028F 4006  		JC L0051
  0291 759014		MOV P1, #14h
  0294 020B57		LJMP L0009

L0051:
  0297 7880  		MOV R0, #80h
L0052:
  0299 18    		DEC R0
  029A 7600  		MOV @R0, #0h
  029C E8    		MOV A, R0
  029D 70FA  		JNZ L0052
  029F 75D000		MOV PSW, #0h
  02A2 7980  		MOV R1, #80h
  02A4 B98005		CJNE R1, #80h, L0053
  02A7 797F  		MOV R1, #7Fh
  02A9 B98006		CJNE R1, #80h, L0054
L0053:
  02AC 759015		MOV P1, #15h
  02AF 020B57		LJMP L0009

L0054:
  02B2 4006  		JC L0055
  02B4 759015		MOV P1, #15h
  02B7 020B57		LJMP L0009

L0055:
  02BA 7880  		MOV R0, #80h
L0056:
  02BC 18    		DEC R0
  02BD 7600  		MOV @R0, #0h
  02BF E8    		MOV A, R0
  02C0 70FA  		JNZ L0056
  02C2 75D000		MOV PSW, #0h
  02C5 7964  		MOV R1, #64h
  02C7 756480		MOV 64h, #80h
  02CA B78006		CJNE @R1, #80h, L0057
  02CD 75647F		MOV 64h, #7Fh
  02D0 B78006		CJNE @R1, #80h, L0058
L0057:
  02D3 759016		MOV P1, #16h
  02D6 020B57		LJMP L0009

L0058:
  02D9 4006  		JC L0059
  02DB 759016		MOV P1, #16h
  02DE 020B57		LJMP L0009

L0059:
  02E1 7880  		MOV R0, #80h
L0060:
  02E3 18    		DEC R0
  02E4 7600  		MOV @R0, #0h
  02E6 E8    		MOV A, R0
  02E7 70FA  		JNZ L0060
  02E9 75D000		MOV PSW, #0h
  02EC 7480  		MOV A, #80h
  02EE E4    		CLR A
  02EF 6006  		JZ L0061
  02F1 759017		MOV P1, #17h
  02F4 020B57		LJMP L0009

L0061:
  02F7 7880  		MOV R0, #80h
L0062:
  02F9 18    		DEC R0
  02FA 7600  		MOV @R0, #0h
  02FC E8    		MOV A, R0
  02FD 70FA  		JNZ L0062
  02FF 75D000		MOV PSW, #0h
  0302 B3    		CPL C
  0303 C3    		CLR C
  0304 5006  		JNC L0063
  0306 759018		MOV P1, #18h
  0309 020B57		LJMP L0009

L0063:
  030C 7880  		MOV R0, #80h
L0064:
  030E 18    		DEC R0
  030F 7600  		MOV @R0, #0h
  0311 E8    		MOV A, R0
  0312 70FA  		JNZ L0064
  0314 75D000		MOV PSW, #0h
  0317 7440  		MOV A, #40h
  0319 C2E6  		CLR ACC.6
  031B 6006  		JZ L0065
  031D 759019		MOV P1, #19h
  0320 020B57		LJMP L0009

L0065:
  0323 7880  		MOV R0, #80h
L0066:
  0325 18    		DEC R0
  0326 7600  		MOV @R0, #0h
  0328 E8    		MOV A, R0
  0329 70FA  		JNZ L0066
  032B 75D000		MOV PSW, #0h
  032E 74FF  		MOV A, #0FFh
  0330 F4    		CPL A
  0331 6006  		JZ L0067
  0333 75901A		MOV P1, #1Ah
  0336 020B57		LJMP L0009

L0067:
  0339 7880  		MOV R0, #80h
L0068:
  033B 18    		DEC R0
  033C 7600  		MOV @R0, #0h
  033E E8    		MOV A, R0
  033F 70FA  		JNZ L0068
  0341 75D000		MOV PSW, #0h
  0344 B3    		CPL C
  0345 4006  		JC L0069
  0347 75901B		MOV P1, #1Bh
  034A 020B57		LJMP L0009

L0069:
  034D 7880  		MOV R0, #80h
L0070:
  034F 18    		DEC R0
  0350 7600  		MOV @R0, #0h
  0352 E8    		MOV A, R0
  0353 70FA  		JNZ L0070
  0355 75D000		MOV PSW, #0h
  0358 7420  		MOV A, #20h
  035A B2E5  		CPL ACC.5
  035C 6006  		JZ L0071
  035E 75901C		MOV P1, #1Ch
  0361 020B57		LJMP L0009

L0071:
  0364 7880  		MOV R0, #80h
L0072:
  0366 18    		DEC R0
  0367 7600  		MOV @R0, #0h
  0369 E8    		MOV A, R0
  036A 70FA  		JNZ L0072
  036C 75D000		MOV PSW, #0h
  036F 7480  		MOV A, #80h
  0371 2499  		ADD A, #99h
  0373 D4    		DA A
  0374 9478  		SUBB A, #78h
  0376 6006  		JZ L0073
  0378 75901D		MOV P1, #1Dh
  037B 020B57		LJMP L0009

L0073:
  037E 7880  		MOV R0, #80h
L0074:
  0380 18    		DEC R0
  0381 7600  		MOV @R0, #0h
  0383 E8    		MOV A, R0
  0384 70FA  		JNZ L0074
  0386 75D000		MOV PSW, #0h
  0389 740A  		MOV A, #0Ah
  038B 14    		DEC A
  038C 9409  		SUBB A, #9h
  038E 6006  		JZ L0075
  0390 75901E		MOV P1, #1Eh
  0393 020B57		LJMP L0009

L0075:
  0396 7880  		MOV R0, #80h
L0076:
  0398 18    		DEC R0
  0399 7600  		MOV @R0, #0h
  039B E8    		MOV A, R0
  039C 70FA  		JNZ L0076
  039E 75D000		MOV PSW, #0h
  03A1 780A  		MOV R0, #0Ah
  03A3 18    		DEC R0
  03A4 E8    		MOV A, R0
  03A5 9409  		SUBB A, #9h
  03A7 6006  		JZ L0077
  03A9 75901F		MOV P1, #1Fh
  03AC 020B57		LJMP L0009

L0077:
  03AF 7880  		MOV R0, #80h
L0078:
  03B1 18    		DEC R0
  03B2 7600  		MOV @R0, #0h
  03B4 E8    		MOV A, R0
  03B5 70FA  		JNZ L0078
  03B7 75D000		MOV PSW, #0h
  03BA 757F0A		MOV 7Fh, #0Ah
  03BD 157F  		DEC 7Fh
  03BF E57F  		MOV A, 7Fh
  03C1 9409  		SUBB A, #9h
  03C3 6006  		JZ L0079
  03C5 759020		MOV P1, #20h
  03C8 020B57		LJMP L0009

L0079:
  03CB 7880  		MOV R0, #80h
L0080:
  03CD 18    		DEC R0
  03CE 7600  		MOV @R0, #0h
  03D0 E8    		MOV A, R0
  03D1 70FA  		JNZ L0080
  03D3 75D000		MOV PSW, #0h
  03D6 787F  		MOV R0, #7Fh
  03D8 757F0A		MOV 7Fh, #0Ah
  03DB 16    		DEC @R0
  03DC E6    		MOV A, @R0
  03DD 9409  		SUBB A, #9h
  03DF 6006  		JZ L0081
  03E1 759021		MOV P1, #21h
  03E4 020B57		LJMP L0009

L0081:
  03E7 7880  		MOV R0, #80h
L0082:
  03E9 18    		DEC R0
  03EA 7600  		MOV @R0, #0h
  03EC E8    		MOV A, R0
  03ED 70FA  		JNZ L0082
  03EF 75D000		MOV PSW, #0h
  03F2 74FB  		MOV A, #0FBh
  03F4 75F012		MOV B, #12h
  03F7 84    		DIV AB
  03F8 940D  		SUBB A, #0Dh
  03FA 6003  		JZ L0083
  03FC 759022		MOV P1, #22h
L0083:
  03FF E5F0  		MOV A, B
  0401 9411  		SUBB A, #11h
  0403 6006  		JZ L0084
  0405 759022		MOV P1, #22h
  0408 020B57		LJMP L0009

L0084:
  040B 7880  		MOV R0, #80h
L0085:
  040D 18    		DEC R0
  040E 7600  		MOV @R0, #0h
  0410 E8    		MOV A, R0
  0411 70FA  		JNZ L0085
  0413 75D000		MOV PSW, #0h
  0416 780A  		MOV R0, #0Ah
  0418 D806  		DJNZ R0, L0086
  041A 759023		MOV P1, #23h
  041D 020B57		LJMP L0009

L0086:
  0420 7801  		MOV R0, #1h
  0422 D802  		DJNZ R0, L0087
  0424 812C  		AJMP L0088

L0087:
  0426 759023		MOV P1, #23h
  0429 020B57		LJMP L0009

L0088:
  042C 7880  		MOV R0, #80h
L0089:
  042E 18    		DEC R0
  042F 7600  		MOV @R0, #0h
  0431 E8    		MOV A, R0
  0432 70FA  		JNZ L0089
  0434 75D000		MOV PSW, #0h
  0437 757F0A		MOV 7Fh, #0Ah
  043A D57F06		DJNZ 7Fh, L0090
  043D 759024		MOV P1, #24h
  0440 020B57		LJMP L0009

L0090:
  0443 757F01		MOV 7Fh, #1h
  0446 D57F02		DJNZ 7Fh, L0091
  0449 8151  		AJMP L0092

L0091:
  044B 759024		MOV P1, #24h
  044E 020B57		LJMP L0009

L0092:
  0451 7880  		MOV R0, #80h
L0093:
  0453 18    		DEC R0
  0454 7600  		MOV @R0, #0h
  0456 E8    		MOV A, R0
  0457 70FA  		JNZ L0093
  0459 75D000		MOV PSW, #0h
  045C 740A  		MOV A, #0Ah
  045E 04    		INC A
  045F 940B  		SUBB A, #0Bh
  0461 6006  		JZ L0094
  0463 759025		MOV P1, #25h
  0466 020B57		LJMP L0009

L0094:
  0469 7880  		MOV R0, #80h
L0095:
  046B 18    		DEC R0
  046C 7600  		MOV @R0, #0h
  046E E8    		MOV A, R0
  046F 70FA  		JNZ L0095
  0471 75D000		MOV PSW, #0h
  0474 780A  		MOV R0, #0Ah
  0476 08    		INC R0
  0477 E8    		MOV A, R0
  0478 940B  		SUBB A, #0Bh
  047A 6006  		JZ L0096
  047C 759026		MOV P1, #26h
  047F 020B57		LJMP L0009

L0096:
  0482 7880  		MOV R0, #80h
L0097:
  0484 18    		DEC R0
  0485 7600  		MOV @R0, #0h
  0487 E8    		MOV A, R0
  0488 70FA  		JNZ L0097
  048A 75D000		MOV PSW, #0h
  048D 757F0A		MOV 7Fh, #0Ah
  0490 057F  		INC 7Fh
  0492 E57F  		MOV A, 7Fh
  0494 940B  		SUBB A, #0Bh
  0496 6006  		JZ L0098
  0498 759027		MOV P1, #27h
  049B 020B57		LJMP L0009

L0098:
  049E 7880  		MOV R0, #80h
L0099:
  04A0 18    		DEC R0
  04A1 7600  		MOV @R0, #0h
  04A3 E8    		MOV A, R0
  04A4 70FA  		JNZ L0099
  04A6 75D000		MOV PSW, #0h
  04A9 757F0A		MOV 7Fh, #0Ah
  04AC 787F  		MOV R0, #7Fh
  04AE 06    		INC @R0
  04AF E6    		MOV A, @R0
  04B0 940B  		SUBB A, #0Bh
  04B2 6006  		JZ L0100
  04B4 759028		MOV P1, #28h
  04B7 020B57		LJMP L0009

L0100:
  04BA 7880  		MOV R0, #80h
L0101:
  04BC 18    		DEC R0
  04BD 7600  		MOV @R0, #0h
  04BF E8    		MOV A, R0
  04C0 70FA  		JNZ L0101
  04C2 75D000		MOV PSW, #0h
  04C5 9012FF		MOV DPTR, #012FFh
  04C8 A3    		INC DPTR
  04C9 E583  		MOV A, DPH
  04CB 9413  		SUBB A, #13h
  04CD 6006  		JZ L0102
  04CF 759029		MOV P1, #29h
  04D2 020B57		LJMP L0009

L0102:
  04D5 E582  		MOV A, DPL
  04D7 6006  		JZ L0103
  04D9 759029		MOV P1, #29h
  04DC 020B57		LJMP L0009

L0103:
  04DF 7880  		MOV R0, #80h
L0104:
  04E1 18    		DEC R0
  04E2 7600  		MOV @R0, #0h
  04E4 E8    		MOV A, R0
  04E5 70FA  		JNZ L0104
  04E7 75D000		MOV PSW, #0h
  04EA 7410  		MOV A, #10h
  04EC 20E409		JB ACC.4, L0105
  04EF 75902A		MOV P1, #2Ah
  04F2 75A001		MOV P2, #1h
  04F5 020B57		LJMP L0009

L0105:
  04F8 75A002		MOV P2, #2h
  04FB 20E502		JB ACC.5, L0106
  04FE 8003  		SJMP L0107

L0106:
  0500 020B57		LJMP L0009

L0107:
  0503 7880  		MOV R0, #80h
L0108:
  0505 18    		DEC R0
  0506 7600  		MOV @R0, #0h
  0508 E8    		MOV A, R0
  0509 70FA  		JNZ L0108
  050B 75D000		MOV PSW, #0h
  050E 7408  		MOV A, #8h
  0510 10E306		JBC ACC.3, L0109
  0513 75902B		MOV P1, #2Bh
  0516 020B57		LJMP L0009

L0109:
  0519 6006  		JZ L0110
  051B 75902B		MOV P1, #2Bh
  051E 020B57		LJMP L0009

L0110:
  0521 7880  		MOV R0, #80h
L0111:
  0523 18    		DEC R0
  0524 7600  		MOV @R0, #0h
  0526 E8    		MOV A, R0
  0527 70FA  		JNZ L0111
  0529 75D000		MOV PSW, #0h
  052C 4003  		JC L0112
  052E B3    		CPL C
  052F 4006  		JC L0113
L0112:
  0531 75902C		MOV P1, #2Ch
  0534 020B57		LJMP L0009

L0113:
  0537 7880  		MOV R0, #80h
L0114:
  0539 18    		DEC R0
  053A 7600  		MOV @R0, #0h
  053C E8    		MOV A, R0
  053D 70FA  		JNZ L0114
  053F 75D000		MOV PSW, #0h
  0542 7404  		MOV A, #4h
  0544 900548		MOV DPTR, #0548h
  0547 73    		JMP @A+DPTR

  0548 A1    		DB 0A1h 
  0549 50    		DB 050h ; 'P'
  054A A1    		DB 0A1h 
  054B 50    		DB 050h ; 'P'
  054C A1    		DB 0A1h 
  054D 56    		DB 056h ; 'V'
  054E A1    		DB 0A1h 
  054F 50    		DB 050h ; 'P'
  0550 75    		DB 075h ; 'u'
  0551 90    		DB 090h 
  0552 2B    		DB 02Bh ; '+'
  0553 02    		DB 002h 
  0554 0B    		DB 00Bh 
  0555 57    		DB 057h ; 'W'
  0556 78    		DB 078h ; 'x'
  0557 80    		DB 080h 
  0558 18    		DB 018h 
  0559 76    		DB 076h ; 'v'
  055A 00    		DB 000h 
  055B E8    		DB 0E8h 
  055C 70    		DB 070h ; 'p'
  055D FA    		DB 0FAh 
  055E 75    		DB 075h ; 'u'
  055F D0    		DB 0D0h 
  0560 00    		DB 000h 
  0561 74    		DB 074h ; 't'
  0562 04    		DB 004h 
  0563 30    		DB 030h ; '0'
  0564 E2    		DB 0E2h 
  0565 03    		DB 003h 
  0566 30    		DB 030h ; '0'
  0567 E1    		DB 0E1h 
  0568 06    		DB 006h 
  0569 75    		DB 075h ; 'u'
  056A 90    		DB 090h 
  056B 2E    		DB 02Eh ; '.'
  056C 02    		DB 002h 
  056D 0B    		DB 00Bh 
  056E 57    		DB 057h ; 'W'
  056F 78    		DB 078h ; 'x'
  0570 80    		DB 080h 
  0571 18    		DB 018h 
  0572 76    		DB 076h ; 'v'
  0573 00    		DB 000h 
  0574 E8    		DB 0E8h 
  0575 70    		DB 070h ; 'p'
  0576 FA    		DB 0FAh 
  0577 75    		DB 075h ; 'u'
  0578 D0    		DB 0D0h 
  0579 00    		DB 000h 
  057A B3    		DB 0B3h 
  057B 50    		DB 050h ; 'P'
  057C 03    		DB 003h 
  057D B3    		DB 0B3h 
  057E 50    		DB 050h ; 'P'
  057F 06    		DB 006h 
  0580 75    		DB 075h ; 'u'
  0581 90    		DB 090h 
  0582 2F    		DB 02Fh ; '/'
  0583 02    		DB 002h 
  0584 0B    		DB 00Bh 
  0585 57    		DB 057h ; 'W'
  0586 78    		DB 078h ; 'x'
  0587 80    		DB 080h 
  0588 18    		DB 018h 
  0589 76    		DB 076h ; 'v'
  058A 00    		DB 000h 
  058B E8    		DB 0E8h 
  058C 70    		DB 070h ; 'p'
  058D FA    		DB 0FAh 
  058E 75    		DB 075h ; 'u'
  058F D0    		DB 0D0h 
  0590 00    		DB 000h 
  0591 70    		DB 070h ; 'p'
  0592 04    		DB 004h 
  0593 74    		DB 074h ; 't'
  0594 01    		DB 001h 
  0595 70    		DB 070h ; 'p'
  0596 06    		DB 006h 
  0597 75    		DB 075h ; 'u'
  0598 90    		DB 090h 
  0599 30    		DB 030h ; '0'
  059A 02    		DB 002h 
  059B 0B    		DB 00Bh 
  059C 57    		DB 057h ; 'W'
  059D 78    		DB 078h ; 'x'
  059E 80    		DB 080h 
  059F 18    		DB 018h 
  05A0 76    		DB 076h ; 'v'
  05A1 00    		DB 000h 
  05A2 E8    		DB 0E8h 
  05A3 70    		DB 070h ; 'p'
  05A4 FA    		DB 0FAh 
  05A5 75    		DB 075h ; 'u'
  05A6 D0    		DB 0D0h 
  05A7 00    		DB 000h 
  05A8 74    		DB 074h ; 't'
  05A9 02    		DB 002h 
  05AA 60    		DB 060h ; '`'
  05AB 04    		DB 004h 
  05AC 74    		DB 074h ; 't'
  05AD 00    		DB 000h 
  05AE 60    		DB 060h ; '`'
  05AF 06    		DB 006h 
  05B0 75    		DB 075h ; 'u'
  05B1 90    		DB 090h 
  05B2 31    		DB 031h ; '1'
  05B3 02    		DB 002h 
  05B4 0B    		DB 00Bh 
  05B5 57    		DB 057h ; 'W'
  05B6 78    		DB 078h ; 'x'
  05B7 80    		DB 080h 
  05B8 18    		DB 018h 
  05B9 76    		DB 076h ; 'v'
  05BA 00    		DB 000h 
  05BB E8    		DB 0E8h 
  05BC 70    		DB 070h ; 'p'
  05BD FA    		DB 0FAh 
  05BE 75    		DB 075h ; 'u'
  05BF D0    		DB 0D0h 
  05C0 00    		DB 000h 
  05C1 02    		DB 002h 
  05C2 05    		DB 005h 
  05C3 CA    		DB 0CAh 
  05C4 75    		DB 075h ; 'u'
  05C5 90    		DB 090h 
  05C6 33    		DB 033h ; '3'
  05C7 02    		DB 002h 
  05C8 0B    		DB 00Bh 
  05C9 57    		DB 057h ; 'W'
  05CA 78    		DB 078h ; 'x'
  05CB 80    		DB 080h 
  05CC 18    		DB 018h 
  05CD 76    		DB 076h ; 'v'
  05CE 00    		DB 000h 
  05CF E8    		DB 0E8h 
  05D0 70    		DB 070h ; 'p'
  05D1 FA    		DB 0FAh 
  05D2 75    		DB 075h ; 'u'
  05D3 D0    		DB 0D0h 
  05D4 00    		DB 000h 
  05D5 78    		DB 078h ; 'x'
  05D6 0A    		DB 00Ah 
  05D7 E8    		DB 0E8h 
  05D8 94    		DB 094h 
  05D9 0A    		DB 00Ah 
  05DA 60    		DB 060h ; '`'
  05DB 06    		DB 006h 
  05DC 75    		DB 075h ; 'u'
  05DD 90    		DB 090h 
  05DE 34    		DB 034h ; '4'
  05DF 02    		DB 002h 
  05E0 0B    		DB 00Bh 
  05E1 57    		DB 057h ; 'W'
  05E2 78    		DB 078h ; 'x'
  05E3 80    		DB 080h 
  05E4 18    		DB 018h 
  05E5 76    		DB 076h ; 'v'
  05E6 00    		DB 000h 
  05E7 E8    		DB 0E8h 
  05E8 70    		DB 070h ; 'p'
  05E9 FA    		DB 0FAh 
  05EA 75    		DB 075h ; 'u'
  05EB D0    		DB 0D0h 
  05EC 00    		DB 000h 
  05ED 75    		DB 075h ; 'u'
  05EE 7F    		DB 07Fh 
  05EF 0A    		DB 00Ah 
  05F0 E5    		DB 0E5h 
  05F1 7F    		DB 07Fh 
  05F2 94    		DB 094h 
  05F3 0A    		DB 00Ah 
  05F4 60    		DB 060h ; '`'
  05F5 06    		DB 006h 
  05F6 75    		DB 075h ; 'u'
  05F7 90    		DB 090h 
  05F8 35    		DB 035h ; '5'
  05F9 02    		DB 002h 
  05FA 0B    		DB 00Bh 
  05FB 57    		DB 057h ; 'W'
  05FC 78    		DB 078h ; 'x'
  05FD 80    		DB 080h 
  05FE 18    		DB 018h 
  05FF 76    		DB 076h ; 'v'
  0600 00    		DB 000h 
  0601 E8    		DB 0E8h 
  0602 70    		DB 070h ; 'p'
  0603 FA    		DB 0FAh 
  0604 75    		DB 075h ; 'u'
  0605 D0    		DB 0D0h 
  0606 00    		DB 000h 
  0607 78    		DB 078h ; 'x'
  0608 7F    		DB 07Fh 
  0609 75    		DB 075h ; 'u'
  060A 7F    		DB 07Fh 
  060B 0A    		DB 00Ah 
  060C E6    		DB 0E6h 
  060D 94    		DB 094h 
  060E 0A    		DB 00Ah 
  060F 60    		DB 060h ; '`'
  0610 06    		DB 006h 
  0611 75    		DB 075h ; 'u'
  0612 90    		DB 090h 
  0613 36    		DB 036h ; '6'
  0614 02    		DB 002h 
  0615 0B    		DB 00Bh 
  0616 57    		DB 057h ; 'W'
  0617 78    		DB 078h ; 'x'
  0618 80    		DB 080h 
  0619 18    		DB 018h 
  061A 76    		DB 076h ; 'v'
  061B 00    		DB 000h 
  061C E8    		DB 0E8h 
  061D 70    		DB 070h ; 'p'
  061E FA    		DB 0FAh 
  061F 75    		DB 075h ; 'u'
  0620 D0    		DB 0D0h 
  0621 00    		DB 000h 
  0622 74    		DB 074h ; 't'
  0623 0A    		DB 00Ah 
  0624 94    		DB 094h 
  0625 0A    		DB 00Ah 
  0626 60    		DB 060h ; '`'
  0627 06    		DB 006h 
  0628 75    		DB 075h ; 'u'
  0629 90    		DB 090h 
  062A 37    		DB 037h ; '7'
  062B 02    		DB 002h 
  062C 0B    		DB 00Bh 
  062D 57    		DB 057h ; 'W'
  062E 78    		DB 078h ; 'x'
  062F 80    		DB 080h 
  0630 18    		DB 018h 
  0631 76    		DB 076h ; 'v'
  0632 00    		DB 000h 
  0633 E8    		DB 0E8h 
  0634 70    		DB 070h ; 'p'
  0635 FA    		DB 0FAh 
  0636 75    		DB 075h ; 'u'
  0637 D0    		DB 0D0h 
  0638 00    		DB 000h 
  0639 74    		DB 074h ; 't'
  063A 0A    		DB 00Ah 
  063B F8    		DB 0F8h 
  063C E4    		DB 0E4h 
  063D E8    		DB 0E8h 
  063E 94    		DB 094h 
  063F 0A    		DB 00Ah 
  0640 60    		DB 060h ; '`'
  0641 06    		DB 006h 
  0642 75    		DB 075h ; 'u'
  0643 90    		DB 090h 
  0644 38    		DB 038h ; '8'
  0645 02    		DB 002h 
  0646 0B    		DB 00Bh 
  0647 57    		DB 057h ; 'W'
  0648 78    		DB 078h ; 'x'
  0649 80    		DB 080h 
  064A 18    		DB 018h 
  064B 76    		DB 076h ; 'v'
  064C 00    		DB 000h 
  064D E8    		DB 0E8h 
  064E 70    		DB 070h ; 'p'
  064F FA    		DB 0FAh 
  0650 75    		DB 075h ; 'u'
  0651 D0    		DB 0D0h 
  0652 00    		DB 000h 
  0653 75    		DB 075h ; 'u'
  0654 7F    		DB 07Fh 
  0655 0A    		DB 00Ah 
  0656 A8    		DB 0A8h 
  0657 7F    		DB 07Fh 
  0658 E8    		DB 0E8h 
  0659 94    		DB 094h 
  065A 0A    		DB 00Ah 
  065B 60    		DB 060h ; '`'
  065C 06    		DB 006h 
  065D 75    		DB 075h ; 'u'
  065E 90    		DB 090h 
  065F 39    		DB 039h ; '9'
  0660 02    		DB 002h 
  0661 0B    		DB 00Bh 
  0662 57    		DB 057h ; 'W'
  0663 78    		DB 078h ; 'x'
  0664 80    		DB 080h 
  0665 18    		DB 018h 
  0666 76    		DB 076h ; 'v'
  0667 00    		DB 000h 
  0668 E8    		DB 0E8h 
  0669 70    		DB 070h ; 'p'
  066A FA    		DB 0FAh 
  066B 75    		DB 075h ; 'u'
  066C D0    		DB 0D0h 
  066D 00    		DB 000h 
  066E 78    		DB 078h ; 'x'
  066F 0A    		DB 00Ah 
  0670 E8    		DB 0E8h 
  0671 94    		DB 094h 
  0672 0A    		DB 00Ah 
  0673 60    		DB 060h ; '`'
  0674 06    		DB 006h 
  0675 75    		DB 075h ; 'u'
  0676 90    		DB 090h 
  0677 3A    		DB 03Ah ; ':'
  0678 02    		DB 002h 
  0679 0B    		DB 00Bh 
  067A 57    		DB 057h ; 'W'
  067B 78    		DB 078h ; 'x'
  067C 80    		DB 080h 
  067D 18    		DB 018h 
  067E 76    		DB 076h ; 'v'
  067F 00    		DB 000h 
  0680 E8    		DB 0E8h 
  0681 70    		DB 070h ; 'p'
  0682 FA    		DB 0FAh 
  0683 75    		DB 075h ; 'u'
  0684 D0    		DB 0D0h 
  0685 00    		DB 000h 
  0686 74    		DB 074h ; 't'
  0687 0A    		DB 00Ah 
  0688 F5    		DB 0F5h 
  0689 7F    		DB 07Fh 
  068A E4    		DB 0E4h 
  068B E5    		DB 0E5h 
  068C 7F    		DB 07Fh 
  068D 94    		DB 094h 
  068E 0A    		DB 00Ah 
  068F 60    		DB 060h ; '`'
  0690 06    		DB 006h 
  0691 75    		DB 075h ; 'u'
  0692 90    		DB 090h 
  0693 3B    		DB 03Bh ; ';'
  0694 02    		DB 002h 
  0695 0B    		DB 00Bh 
  0696 57    		DB 057h ; 'W'
  0697 78    		DB 078h ; 'x'
  0698 80    		DB 080h 
  0699 18    		DB 018h 
  069A 76    		DB 076h ; 'v'
  069B 00    		DB 000h 
  069C E8    		DB 0E8h 
  069D 70    		DB 070h ; 'p'
  069E FA    		DB 0FAh 
  069F 75    		DB 075h ; 'u'
  06A0 D0    		DB 0D0h 
  06A1 00    		DB 000h 
  06A2 78    		DB 078h ; 'x'
  06A3 0A    		DB 00Ah 
  06A4 88    		DB 088h 
  06A5 7F    		DB 07Fh 
  06A6 E5    		DB 0E5h 
  06A7 7F    		DB 07Fh 
  06A8 94    		DB 094h 
  06A9 0A    		DB 00Ah 
  06AA 60    		DB 060h ; '`'
  06AB 06    		DB 006h 
  06AC 75    		DB 075h ; 'u'
  06AD 90    		DB 090h 
  06AE 3C    		DB 03Ch ; '<'
  06AF 02    		DB 002h 
  06B0 0B    		DB 00Bh 
  06B1 57    		DB 057h ; 'W'
  06B2 78    		DB 078h ; 'x'
  06B3 80    		DB 080h 
  06B4 18    		DB 018h 
  06B5 76    		DB 076h ; 'v'
  06B6 00    		DB 000h 
  06B7 E8    		DB 0E8h 
  06B8 70    		DB 070h ; 'p'
  06B9 FA    		DB 0FAh 
  06BA 75    		DB 075h ; 'u'
  06BB D0    		DB 0D0h 
  06BC 00    		DB 000h 
  06BD 75    		DB 075h ; 'u'
  06BE 7F    		DB 07Fh 
  06BF 0A    		DB 00Ah 
  06C0 85    		DB 085h 
  06C1 7F    		DB 07Fh 
  06C2 7E    		DB 07Eh ; '~'
  06C3 E5    		DB 0E5h 
  06C4 7E    		DB 07Eh ; '~'
  06C5 94    		DB 094h 
  06C6 0A    		DB 00Ah 
  06C7 60    		DB 060h ; '`'
  06C8 06    		DB 006h 
  06C9 75    		DB 075h ; 'u'
  06CA 90    		DB 090h 
  06CB 3D    		DB 03Dh ; '='
  06CC 02    		DB 002h 
  06CD 0B    		DB 00Bh 
  06CE 57    		DB 057h ; 'W'
  06CF 78    		DB 078h ; 'x'
  06D0 80    		DB 080h 
  06D1 18    		DB 018h 
  06D2 76    		DB 076h ; 'v'
  06D3 00    		DB 000h 
  06D4 E8    		DB 0E8h 
  06D5 70    		DB 070h ; 'p'
  06D6 FA    		DB 0FAh 
  06D7 75    		DB 075h ; 'u'
  06D8 D0    		DB 0D0h 
  06D9 00    		DB 000h 
  06DA 75    		DB 075h ; 'u'
  06DB 7F    		DB 07Fh 
  06DC 0A    		DB 00Ah 
  06DD 78    		DB 078h ; 'x'
  06DE 7F    		DB 07Fh 
  06DF 86    		DB 086h 
  06E0 7E    		DB 07Eh ; '~'
  06E1 E5    		DB 0E5h 
  06E2 7E    		DB 07Eh ; '~'
  06E3 94    		DB 094h 
  06E4 0A    		DB 00Ah 
  06E5 60    		DB 060h ; '`'
  06E6 06    		DB 006h 
  06E7 75    		DB 075h ; 'u'
  06E8 90    		DB 090h 
  06E9 3E    		DB 03Eh ; '>'
  06EA 02    		DB 002h 
  06EB 0B    		DB 00Bh 
  06EC 57    		DB 057h ; 'W'
  06ED 78    		DB 078h ; 'x'
  06EE 80    		DB 080h 
  06EF 18    		DB 018h 
  06F0 76    		DB 076h ; 'v'
  06F1 00    		DB 000h 
  06F2 E8    		DB 0E8h 
  06F3 70    		DB 070h ; 'p'
  06F4 FA    		DB 0FAh 
  06F5 75    		DB 075h ; 'u'
  06F6 D0    		DB 0D0h 
  06F7 00    		DB 000h 
  06F8 75    		DB 075h ; 'u'
  06F9 7F    		DB 07Fh 
  06FA 0A    		DB 00Ah 
  06FB E5    		DB 0E5h 
  06FC 7F    		DB 07Fh 
  06FD 94    		DB 094h 
  06FE 0A    		DB 00Ah 
  06FF 60    		DB 060h ; '`'
  0700 06    		DB 006h 
  0701 75    		DB 075h ; 'u'
  0702 90    		DB 090h 
  0703 3F    		DB 03Fh ; '?'
  0704 02    		DB 002h 
  0705 0B    		DB 00Bh 
  0706 57    		DB 057h ; 'W'
  0707 78    		DB 078h ; 'x'
  0708 80    		DB 080h 
  0709 18    		DB 018h 
  070A 76    		DB 076h ; 'v'
  070B 00    		DB 000h 
  070C E8    		DB 0E8h 
  070D 70    		DB 070h ; 'p'
  070E FA    		DB 0FAh 
  070F 75    		DB 075h ; 'u'
  0710 D0    		DB 0D0h 
  0711 00    		DB 000h 
  0712 74    		DB 074h ; 't'
  0713 0A    		DB 00Ah 
  0714 78    		DB 078h ; 'x'
  0715 7F    		DB 07Fh 
  0716 F6    		DB 0F6h 
  0717 E4    		DB 0E4h 
  0718 E5    		DB 0E5h 
  0719 7F    		DB 07Fh 
  071A 94    		DB 094h 
  071B 0A    		DB 00Ah 
  071C 60    		DB 060h ; '`'
  071D 06    		DB 006h 
  071E 75    		DB 075h ; 'u'
  071F 90    		DB 090h 
  0720 40    		DB 040h ; '@'
  0721 02    		DB 002h 
  0722 0B    		DB 00Bh 
  0723 57    		DB 057h ; 'W'
  0724 78    		DB 078h ; 'x'
  0725 80    		DB 080h 
  0726 18    		DB 018h 
  0727 76    		DB 076h ; 'v'
  0728 00    		DB 000h 
  0729 E8    		DB 0E8h 
  072A 70    		DB 070h ; 'p'
  072B FA    		DB 0FAh 
  072C 75    		DB 075h ; 'u'
  072D D0    		DB 0D0h 
  072E 00    		DB 000h 
  072F 75    		DB 075h ; 'u'
  0730 7F    		DB 07Fh 
  0731 0A    		DB 00Ah 
  0732 78    		DB 078h ; 'x'
  0733 7E    		DB 07Eh ; '~'
  0734 A6    		DB 0A6h 
  0735 7F    		DB 07Fh 
  0736 E5    		DB 0E5h 
  0737 7E    		DB 07Eh ; '~'
  0738 94    		DB 094h 
  0739 0A    		DB 00Ah 
  073A 60    		DB 060h ; '`'
  073B 06    		DB 006h 
  073C 75    		DB 075h ; 'u'
  073D 90    		DB 090h 
  073E 41    		DB 041h ; 'A'
  073F 02    		DB 002h 
  0740 0B    		DB 00Bh 
  0741 57    		DB 057h ; 'W'
  0742 78    		DB 078h ; 'x'
  0743 80    		DB 080h 
  0744 18    		DB 018h 
  0745 76    		DB 076h ; 'v'
  0746 00    		DB 000h 
  0747 E8    		DB 0E8h 
  0748 70    		DB 070h ; 'p'
  0749 FA    		DB 0FAh 
  074A 75    		DB 075h ; 'u'
  074B D0    		DB 0D0h 
  074C 00    		DB 000h 
  074D 78    		DB 078h ; 'x'
  074E 7F    		DB 07Fh 
  074F 76    		DB 076h ; 'v'
  0750 0A    		DB 00Ah 
  0751 E5    		DB 0E5h 
  0752 7F    		DB 07Fh 
  0753 94    		DB 094h 
  0754 0A    		DB 00Ah 
  0755 60    		DB 060h ; '`'
  0756 06    		DB 006h 
  0757 75    		DB 075h ; 'u'
  0758 90    		DB 090h 
  0759 42    		DB 042h ; 'B'
  075A 02    		DB 002h 
  075B 0B    		DB 00Bh 
  075C 57    		DB 057h ; 'W'
  075D 78    		DB 078h ; 'x'
  075E 80    		DB 080h 
  075F 18    		DB 018h 
  0760 76    		DB 076h ; 'v'
  0761 00    		DB 000h 
  0762 E8    		DB 0E8h 
  0763 70    		DB 070h ; 'p'
  0764 FA    		DB 0FAh 
  0765 75    		DB 075h ; 'u'
  0766 D0    		DB 0D0h 
  0767 00    		DB 000h 
  0768 74    		DB 074h ; 't'
  0769 01    		DB 001h 
  076A A2    		DB 0A2h 
  076B E0    		DB 0E0h 
  076C 40    		DB 040h ; '@'
  076D 06    		DB 006h 
  076E 75    		DB 075h ; 'u'
  076F 90    		DB 090h 
  0770 43    		DB 043h ; 'C'
  0771 02    		DB 002h 
  0772 0B    		DB 00Bh 
  0773 57    		DB 057h ; 'W'
  0774 78    		DB 078h ; 'x'
  0775 80    		DB 080h 
  0776 18    		DB 018h 
  0777 76    		DB 076h ; 'v'
  0778 00    		DB 000h 
  0779 E8    		DB 0E8h 
  077A 70    		DB 070h ; 'p'
  077B FA    		DB 0FAh 
  077C 75    		DB 075h ; 'u'
  077D D0    		DB 0D0h 
  077E 00    		DB 000h 
  077F B3    		DB 0B3h 
  0780 92    		DB 092h 
  0781 E0    		DB 0E0h 
  0782 B3    		DB 0B3h 
  0783 94    		DB 094h 
  0784 01    		DB 001h 
  0785 60    		DB 060h ; '`'
  0786 06    		DB 006h 
  0787 75    		DB 075h ; 'u'
  0788 90    		DB 090h 
  0789 44    		DB 044h ; 'D'
  078A 02    		DB 002h 
  078B 0B    		DB 00Bh 
  078C 57    		DB 057h ; 'W'
  078D 78    		DB 078h ; 'x'
  078E 80    		DB 080h 
  078F 18    		DB 018h 
  0790 76    		DB 076h ; 'v'
  0791 00    		DB 000h 
  0792 E8    		DB 0E8h 
  0793 70    		DB 070h ; 'p'
  0794 FA    		DB 0FAh 
  0795 75    		DB 075h ; 'u'
  0796 D0    		DB 0D0h 
  0797 00    		DB 000h 
  0798 90    		DB 090h 
  0799 12    		DB 012h 
  079A 34    		DB 034h ; '4'
  079B E5    		DB 0E5h 
  079C 83    		DB 083h 
  079D 94    		DB 094h 
  079E 12    		DB 012h 
  079F 70    		DB 070h ; 'p'
  07A0 06    		DB 006h 
  07A1 E5    		DB 0E5h 
  07A2 82    		DB 082h 
  07A3 94    		DB 094h 
  07A4 34    		DB 034h ; '4'
  07A5 60    		DB 060h ; '`'
  07A6 06    		DB 006h 
  07A7 75    		DB 075h ; 'u'
  07A8 90    		DB 090h 
  07A9 45    		DB 045h ; 'E'
  07AA 02    		DB 002h 
  07AB 0B    		DB 00Bh 
  07AC 57    		DB 057h ; 'W'
  07AD 78    		DB 078h ; 'x'
  07AE 80    		DB 080h 
  07AF 18    		DB 018h 
  07B0 76    		DB 076h ; 'v'
  07B1 00    		DB 000h 
  07B2 E8    		DB 0E8h 
  07B3 70    		DB 070h ; 'p'
  07B4 FA    		DB 0FAh 
  07B5 75    		DB 075h ; 'u'
  07B6 D0    		DB 0D0h 
  07B7 00    		DB 000h 
  07B8 78    		DB 078h ; 'x'
  07B9 80    		DB 080h 
  07BA 18    		DB 018h 
  07BB 76    		DB 076h ; 'v'
  07BC 00    		DB 000h 
  07BD E8    		DB 0E8h 
  07BE 70    		DB 070h ; 'p'
  07BF FA    		DB 0FAh 
  07C0 75    		DB 075h ; 'u'
  07C1 D0    		DB 0D0h 
  07C2 00    		DB 000h 
  07C3 78    		DB 078h ; 'x'
  07C4 80    		DB 080h 
  07C5 18    		DB 018h 
  07C6 76    		DB 076h ; 'v'
  07C7 00    		DB 000h 
  07C8 E8    		DB 0E8h 
  07C9 70    		DB 070h ; 'p'
  07CA FA    		DB 0FAh 
  07CB 75    		DB 075h ; 'u'
  07CC D0    		DB 0D0h 
  07CD 00    		DB 000h 
  07CE 74    		DB 074h ; 't'
  07CF 50    		DB 050h ; 'P'
  07D0 75    		DB 075h ; 'u'
  07D1 F0    		DB 0F0h 
  07D2 A0    		DB 0A0h 
  07D3 A4    		DB 0A4h 
  07D4 70    		DB 070h ; 'p'
  07D5 06    		DB 006h 
  07D6 E5    		DB 0E5h 
  07D7 F0    		DB 0F0h 
  07D8 94    		DB 094h 
  07D9 32    		DB 032h ; '2'
  07DA 60    		DB 060h ; '`'
  07DB 06    		DB 006h 
  07DC 75    		DB 075h ; 'u'
  07DD 90    		DB 090h 
  07DE 4C    		DB 04Ch ; 'L'
  07DF 02    		DB 002h 
  07E0 0B    		DB 00Bh 
  07E1 57    		DB 057h ; 'W'
  07E2 78    		DB 078h ; 'x'
  07E3 80    		DB 080h 
  07E4 18    		DB 018h 
  07E5 76    		DB 076h ; 'v'
  07E6 00    		DB 000h 
  07E7 E8    		DB 0E8h 
  07E8 70    		DB 070h ; 'p'
  07E9 FA    		DB 0FAh 
  07EA 75    		DB 075h ; 'u'
  07EB D0    		DB 0D0h 
  07EC 00    		DB 000h 
  07ED 74    		DB 074h ; 't'
  07EE 90    		DB 090h 
  07EF 78    		DB 078h ; 'x'
  07F0 09    		DB 009h 
  07F1 48    		DB 048h ; 'H'
  07F2 94    		DB 094h 
  07F3 99    		DB 099h 
  07F4 60    		DB 060h ; '`'
  07F5 06    		DB 006h 
  07F6 75    		DB 075h ; 'u'
  07F7 90    		DB 090h 
  07F8 4E    		DB 04Eh ; 'N'
  07F9 02    		DB 002h 
  07FA 0B    		DB 00Bh 
  07FB 57    		DB 057h ; 'W'
  07FC 78    		DB 078h ; 'x'
  07FD 80    		DB 080h 
  07FE 18    		DB 018h 
  07FF 76    		DB 076h ; 'v'
  0800 00    		DB 000h 
  0801 E8    		DB 0E8h 
  0802 70    		DB 070h ; 'p'
  0803 FA    		DB 0FAh 
  0804 75    		DB 075h ; 'u'
  0805 D0    		DB 0D0h 
  0806 00    		DB 000h 
  0807 74    		DB 074h ; 't'
  0808 09    		DB 009h 
  0809 75    		DB 075h ; 'u'
  080A 7F    		DB 07Fh 
  080B 90    		DB 090h 
  080C 45    		DB 045h ; 'E'
  080D 7F    		DB 07Fh 
  080E 94    		DB 094h 
  080F 99    		DB 099h 
  0810 60    		DB 060h ; '`'
  0811 06    		DB 006h 
  0812 75    		DB 075h ; 'u'
  0813 90    		DB 090h 
  0814 4F    		DB 04Fh ; 'O'
  0815 02    		DB 002h 
  0816 0B    		DB 00Bh 
  0817 57    		DB 057h ; 'W'
  0818 78    		DB 078h ; 'x'
  0819 80    		DB 080h 
  081A 18    		DB 018h 
  081B 76    		DB 076h ; 'v'
  081C 00    		DB 000h 
  081D E8    		DB 0E8h 
  081E 70    		DB 070h ; 'p'
  081F FA    		DB 0FAh 
  0820 75    		DB 075h ; 'u'
  0821 D0    		DB 0D0h 
  0822 00    		DB 000h 
  0823 74    		DB 074h ; 't'
  0824 90    		DB 090h 
  0825 78    		DB 078h ; 'x'
  0826 7F    		DB 07Fh 
  0827 75    		DB 075h ; 'u'
  0828 7F    		DB 07Fh 
  0829 06    		DB 006h 
  082A 46    		DB 046h ; 'F'
  082B 94    		DB 094h 
  082C 96    		DB 096h 
  082D 60    		DB 060h ; '`'
  082E 06    		DB 006h 
  082F 75    		DB 075h ; 'u'
  0830 90    		DB 090h 
  0831 50    		DB 050h ; 'P'
  0832 02    		DB 002h 
  0833 0B    		DB 00Bh 
  0834 57    		DB 057h ; 'W'
  0835 78    		DB 078h ; 'x'
  0836 80    		DB 080h 
  0837 18    		DB 018h 
  0838 76    		DB 076h ; 'v'
  0839 00    		DB 000h 
  083A E8    		DB 0E8h 
  083B 70    		DB 070h ; 'p'
  083C FA    		DB 0FAh 
  083D 75    		DB 075h ; 'u'
  083E D0    		DB 0D0h 
  083F 00    		DB 000h 
  0840 74    		DB 074h ; 't'
  0841 11    		DB 011h 
  0842 44    		DB 044h ; 'D'
  0843 22    		DB 022h ; '"'
  0844 94    		DB 094h 
  0845 33    		DB 033h ; '3'
  0846 60    		DB 060h ; '`'
  0847 06    		DB 006h 
  0848 75    		DB 075h ; 'u'
  0849 90    		DB 090h 
  084A 51    		DB 051h ; 'Q'
  084B 02    		DB 002h 
  084C 0B    		DB 00Bh 
  084D 57    		DB 057h ; 'W'
  084E 78    		DB 078h ; 'x'
  084F 80    		DB 080h 
  0850 18    		DB 018h 
  0851 76    		DB 076h ; 'v'
  0852 00    		DB 000h 
  0853 E8    		DB 0E8h 
  0854 70    		DB 070h ; 'p'
  0855 FA    		DB 0FAh 
  0856 75    		DB 075h ; 'u'
  0857 D0    		DB 0D0h 
  0858 00    		DB 000h 
  0859 74    		DB 074h ; 't'
  085A 90    		DB 090h 
  085B 75    		DB 075h ; 'u'
  085C 7F    		DB 07Fh 
  085D 09    		DB 009h 
  085E 42    		DB 042h ; 'B'
  085F 7F    		DB 07Fh 
  0860 E4    		DB 0E4h 
  0861 E5    		DB 0E5h 
  0862 7F    		DB 07Fh 
  0863 94    		DB 094h 
  0864 99    		DB 099h 
  0865 60    		DB 060h ; '`'
  0866 06    		DB 006h 
  0867 75    		DB 075h ; 'u'
  0868 90    		DB 090h 
  0869 52    		DB 052h ; 'R'
  086A 02    		DB 002h 
  086B 0B    		DB 00Bh 
  086C 57    		DB 057h ; 'W'
  086D 78    		DB 078h ; 'x'
  086E 80    		DB 080h 
  086F 18    		DB 018h 
  0870 76    		DB 076h ; 'v'
  0871 00    		DB 000h 
  0872 E8    		DB 0E8h 
  0873 70    		DB 070h ; 'p'
  0874 FA    		DB 0FAh 
  0875 75    		DB 075h ; 'u'
  0876 D0    		DB 0D0h 
  0877 00    		DB 000h 
  0878 75    		DB 075h ; 'u'
  0879 7F    		DB 07Fh 
  087A 90    		DB 090h 
  087B 43    		DB 043h ; 'C'
  087C 7F    		DB 07Fh 
  087D 09    		DB 009h 
  087E E5    		DB 0E5h 
  087F 7F    		DB 07Fh 
  0880 94    		DB 094h 
  0881 99    		DB 099h 
  0882 60    		DB 060h ; '`'
  0883 06    		DB 006h 
  0884 75    		DB 075h ; 'u'
  0885 90    		DB 090h 
  0886 53    		DB 053h ; 'S'
  0887 02    		DB 002h 
  0888 0B    		DB 00Bh 
  0889 57    		DB 057h ; 'W'
  088A 78    		DB 078h ; 'x'
  088B 80    		DB 080h 
  088C 18    		DB 018h 
  088D 76    		DB 076h ; 'v'
  088E 00    		DB 000h 
  088F E8    		DB 0E8h 
  0890 70    		DB 070h ; 'p'
  0891 FA    		DB 0FAh 
  0892 75    		DB 075h ; 'u'
  0893 D0    		DB 0D0h 
  0894 00    		DB 000h 
  0895 72    		DB 072h ; 'r'
  0896 E0    		DB 0E0h 
  0897 40    		DB 040h ; '@'
  0898 0A    		DB 00Ah 
  0899 74    		DB 074h ; 't'
  089A 01    		DB 001h 
  089B 72    		DB 072h ; 'r'
  089C E0    		DB 0E0h 
  089D 50    		DB 050h ; 'P'
  089E 04    		DB 004h 
  089F 72    		DB 072h ; 'r'
  08A0 E1    		DB 0E1h 
  08A1 40    		DB 040h ; '@'
  08A2 06    		DB 006h 
  08A3 75    		DB 075h ; 'u'
  08A4 90    		DB 090h 
  08A5 54    		DB 054h ; 'T'
  08A6 02    		DB 002h 
  08A7 0B    		DB 00Bh 
  08A8 57    		DB 057h ; 'W'
  08A9 78    		DB 078h ; 'x'
  08AA 80    		DB 080h 
  08AB 18    		DB 018h 
  08AC 76    		DB 076h ; 'v'
  08AD 00    		DB 000h 
  08AE E8    		DB 0E8h 
  08AF 70    		DB 070h ; 'p'
  08B0 FA    		DB 0FAh 
  08B1 75    		DB 075h ; 'u'
  08B2 D0    		DB 0D0h 
  08B3 00    		DB 000h 
  08B4 74    		DB 074h ; 't'
  08B5 01    		DB 001h 
  08B6 A0    		DB 0A0h 
  08B7 E0    		DB 0E0h 
  08B8 40    		DB 040h ; '@'
  08B9 08    		DB 008h 
  08BA A0    		DB 0A0h 
  08BB E1    		DB 0E1h 
  08BC 50    		DB 050h ; 'P'
  08BD 04    		DB 004h 
  08BE A0    		DB 0A0h 
  08BF E0    		DB 0E0h 
  08C0 40    		DB 040h ; '@'
  08C1 06    		DB 006h 
  08C2 75    		DB 075h ; 'u'
  08C3 90    		DB 090h 
  08C4 55    		DB 055h ; 'U'
  08C5 02    		DB 002h 
  08C6 0B    		DB 00Bh 
  08C7 57    		DB 057h ; 'W'
  08C8 78    		DB 078h ; 'x'
  08C9 80    		DB 080h 
  08CA 18    		DB 018h 
  08CB 76    		DB 076h ; 'v'
  08CC 00    		DB 000h 
  08CD E8    		DB 0E8h 
  08CE 70    		DB 070h ; 'p'
  08CF FA    		DB 0FAh 
  08D0 75    		DB 075h ; 'u'
  08D1 D0    		DB 0D0h 
  08D2 00    		DB 000h 
  08D3 90    		DB 090h 
  08D4 01    		DB 001h 
  08D5 23    		DB 023h ; '#'
  08D6 75    		DB 075h ; 'u'
  08D7 7F    		DB 07Fh 
  08D8 08    		DB 008h 
  08D9 C0    		DB 0C0h 
  08DA 82    		DB 082h 
  08DB C0    		DB 0C0h 
  08DC 83    		DB 083h 
  08DD C0    		DB 0C0h 
  08DE 7F    		DB 07Fh 
  08DF E5    		DB 0E5h 
  08E0 08    		DB 008h 
  08E1 94    		DB 094h 
  08E2 23    		DB 023h ; '#'
  08E3 70    		DB 070h ; 'p'
  08E4 0C    		DB 00Ch 
  08E5 E5    		DB 0E5h 
  08E6 09    		DB 009h 
  08E7 94    		DB 094h 
  08E8 01    		DB 001h 
  08E9 70    		DB 070h ; 'p'
  08EA 06    		DB 006h 
  08EB E5    		DB 0E5h 
  08EC 0A    		DB 00Ah 
  08ED 94    		DB 094h 
  08EE 08    		DB 008h 
  08EF 60    		DB 060h ; '`'
  08F0 06    		DB 006h 
  08F1 75    		DB 075h ; 'u'
  08F2 90    		DB 090h 
  08F3 57    		DB 057h ; 'W'
  08F4 02    		DB 002h 
  08F5 0B    		DB 00Bh 
  08F6 57    		DB 057h ; 'W'
  08F7 D0    		DB 0D0h 
  08F8 81    		DB 081h 
  08F9 D0    		DB 0D0h 
  08FA 64    		DB 064h ; 'd'
  08FB E5    		DB 0E5h 
  08FC 64    		DB 064h ; 'd'
  08FD 94    		DB 094h 
  08FE 23    		DB 023h ; '#'
  08FF 60    		DB 060h ; '`'
  0900 06    		DB 006h 
  0901 75    		DB 075h ; 'u'
  0902 90    		DB 090h 
  0903 56    		DB 056h ; 'V'
  0904 02    		DB 002h 
  0905 0B    		DB 00Bh 
  0906 57    		DB 057h ; 'W'
  0907 78    		DB 078h ; 'x'
  0908 80    		DB 080h 
  0909 18    		DB 018h 
  090A 76    		DB 076h ; 'v'
  090B 00    		DB 000h 
  090C E8    		DB 0E8h 
  090D 70    		DB 070h ; 'p'
  090E FA    		DB 0FAh 
  090F 75    		DB 075h ; 'u'
  0910 D0    		DB 0D0h 
  0911 00    		DB 000h 
  0912 74    		DB 074h ; 't'
  0913 81    		DB 081h 
  0914 23    		DB 023h ; '#'
  0915 94    		DB 094h 
  0916 03    		DB 003h 
  0917 60    		DB 060h ; '`'
  0918 06    		DB 006h 
  0919 75    		DB 075h ; 'u'
  091A 90    		DB 090h 
  091B 5A    		DB 05Ah ; 'Z'
  091C 02    		DB 002h 
  091D 0B    		DB 00Bh 
  091E 57    		DB 057h ; 'W'
  091F 78    		DB 078h ; 'x'
  0920 80    		DB 080h 
  0921 18    		DB 018h 
  0922 76    		DB 076h ; 'v'
  0923 00    		DB 000h 
  0924 E8    		DB 0E8h 
  0925 70    		DB 070h ; 'p'
  0926 FA    		DB 0FAh 
  0927 75    		DB 075h ; 'u'
  0928 D0    		DB 0D0h 
  0929 00    		DB 000h 
  092A 74    		DB 074h ; 't'
  092B 81    		DB 081h 
  092C 33    		DB 033h ; '3'
  092D 94    		DB 094h 
  092E 01    		DB 001h 
  092F 60    		DB 060h ; '`'
  0930 06    		DB 006h 
  0931 75    		DB 075h ; 'u'
  0932 90    		DB 090h 
  0933 5B    		DB 05Bh ; '['
  0934 02    		DB 002h 
  0935 0B    		DB 00Bh 
  0936 57    		DB 057h ; 'W'
  0937 78    		DB 078h ; 'x'
  0938 80    		DB 080h 
  0939 18    		DB 018h 
  093A 76    		DB 076h ; 'v'
  093B 00    		DB 000h 
  093C E8    		DB 0E8h 
  093D 70    		DB 070h ; 'p'
  093E FA    		DB 0FAh 
  093F 75    		DB 075h ; 'u'
  0940 D0    		DB 0D0h 
  0941 00    		DB 000h 
  0942 74    		DB 074h ; 't'
  0943 81    		DB 081h 
  0944 03    		DB 003h 
  0945 94    		DB 094h 
  0946 C0    		DB 0C0h 
  0947 60    		DB 060h ; '`'
  0948 06    		DB 006h 
  0949 75    		DB 075h ; 'u'
  094A 90    		DB 090h 
  094B 5C    		DB 05Ch ; '\'
  094C 02    		DB 002h 
  094D 0B    		DB 00Bh 
  094E 57    		DB 057h ; 'W'
  094F 78    		DB 078h ; 'x'
  0950 80    		DB 080h 
  0951 18    		DB 018h 
  0952 76    		DB 076h ; 'v'
  0953 00    		DB 000h 
  0954 E8    		DB 0E8h 
  0955 70    		DB 070h ; 'p'
  0956 FA    		DB 0FAh 
  0957 75    		DB 075h ; 'u'
  0958 D0    		DB 0D0h 
  0959 00    		DB 000h 
  095A 74    		DB 074h ; 't'
  095B 03    		DB 003h 
  095C 13    		DB 013h 
  095D 94    		DB 094h 
  095E 00    		DB 000h 
  095F 60    		DB 060h ; '`'
  0960 06    		DB 006h 
  0961 75    		DB 075h ; 'u'
  0962 90    		DB 090h 
  0963 5D    		DB 05Dh ; ']'
  0964 02    		DB 002h 
  0965 0B    		DB 00Bh 
  0966 57    		DB 057h ; 'W'
  0967 78    		DB 078h ; 'x'
  0968 80    		DB 080h 
  0969 18    		DB 018h 
  096A 76    		DB 076h ; 'v'
  096B 00    		DB 000h 
  096C E8    		DB 0E8h 
  096D 70    		DB 070h ; 'p'
  096E FA    		DB 0FAh 
  096F 75    		DB 075h ; 'u'
  0970 D0    		DB 0D0h 
  0971 00    		DB 000h 
  0972 D3    		DB 0D3h 
  0973 74    		DB 074h ; 't'
  0974 01    		DB 001h 
  0975 94    		DB 094h 
  0976 00    		DB 000h 
  0977 60    		DB 060h ; '`'
  0978 06    		DB 006h 
  0979 75    		DB 075h ; 'u'
  097A 90    		DB 090h 
  097B 5E    		DB 05Eh ; '^'
  097C 02    		DB 002h 
  097D 0B    		DB 00Bh 
  097E 57    		DB 057h ; 'W'
  097F 78    		DB 078h ; 'x'
  0980 80    		DB 080h 
  0981 18    		DB 018h 
  0982 76    		DB 076h ; 'v'
  0983 00    		DB 000h 
  0984 E8    		DB 0E8h 
  0985 70    		DB 070h ; 'p'
  0986 FA    		DB 0FAh 
  0987 75    		DB 075h ; 'u'
  0988 D0    		DB 0D0h 
  0989 00    		DB 000h 
  098A D2    		DB 0D2h 
  098B E7    		DB 0E7h 
  098C 94    		DB 094h 
  098D 80    		DB 080h 
  098E 60    		DB 060h ; '`'
  098F 06    		DB 006h 
  0990 75    		DB 075h ; 'u'
  0991 90    		DB 090h 
  0992 5F    		DB 05Fh ; '_'
  0993 02    		DB 002h 
  0994 0B    		DB 00Bh 
  0995 57    		DB 057h ; 'W'
  0996 78    		DB 078h ; 'x'
  0997 80    		DB 080h 
  0998 18    		DB 018h 
  0999 76    		DB 076h ; 'v'
  099A 00    		DB 000h 
  099B E8    		DB 0E8h 
  099C 70    		DB 070h ; 'p'
  099D FA    		DB 0FAh 
  099E 75    		DB 075h ; 'u'
  099F D0    		DB 0D0h 
  09A0 00    		DB 000h 
  09A1 80    		DB 080h 
  09A2 06    		DB 006h 
  09A3 75    		DB 075h ; 'u'
  09A4 90    		DB 090h 
  09A5 60    		DB 060h ; '`'
  09A6 02    		DB 002h 
  09A7 0B    		DB 00Bh 
  09A8 57    		DB 057h ; 'W'
  09A9 78    		DB 078h ; 'x'
  09AA 80    		DB 080h 
  09AB 18    		DB 018h 
  09AC 76    		DB 076h ; 'v'
  09AD 00    		DB 000h 
  09AE E8    		DB 0E8h 
  09AF 70    		DB 070h ; 'p'
  09B0 FA    		DB 0FAh 
  09B1 75    		DB 075h ; 'u'
  09B2 D0    		DB 0D0h 
  09B3 00    		DB 000h 
  09B4 74    		DB 074h ; 't'
  09B5 0A    		DB 00Ah 
  09B6 78    		DB 078h ; 'x'
  09B7 0A    		DB 00Ah 
  09B8 98    		DB 098h 
  09B9 60    		DB 060h ; '`'
  09BA 06    		DB 006h 
  09BB 75    		DB 075h ; 'u'
  09BC 90    		DB 090h 
  09BD 61    		DB 061h ; 'a'
  09BE 02    		DB 002h 
  09BF 0B    		DB 00Bh 
  09C0 57    		DB 057h ; 'W'
  09C1 78    		DB 078h ; 'x'
  09C2 80    		DB 080h 
  09C3 18    		DB 018h 
  09C4 76    		DB 076h ; 'v'
  09C5 00    		DB 000h 
  09C6 E8    		DB 0E8h 
  09C7 70    		DB 070h ; 'p'
  09C8 FA    		DB 0FAh 
  09C9 75    		DB 075h ; 'u'
  09CA D0    		DB 0D0h 
  09CB 00    		DB 000h 
  09CC 74    		DB 074h ; 't'
  09CD 0A    		DB 00Ah 
  09CE 75    		DB 075h ; 'u'
  09CF 7F    		DB 07Fh 
  09D0 0A    		DB 00Ah 
  09D1 95    		DB 095h 
  09D2 7F    		DB 07Fh 
  09D3 60    		DB 060h ; '`'
  09D4 06    		DB 006h 
  09D5 75    		DB 075h ; 'u'
  09D6 90    		DB 090h 
  09D7 62    		DB 062h ; 'b'
  09D8 02    		DB 002h 
  09D9 0B    		DB 00Bh 
  09DA 57    		DB 057h ; 'W'
  09DB 78    		DB 078h ; 'x'
  09DC 80    		DB 080h 
  09DD 18    		DB 018h 
  09DE 76    		DB 076h ; 'v'
  09DF 00    		DB 000h 
  09E0 E8    		DB 0E8h 
  09E1 70    		DB 070h ; 'p'
  09E2 FA    		DB 0FAh 
  09E3 75    		DB 075h ; 'u'
  09E4 D0    		DB 0D0h 
  09E5 00    		DB 000h 
  09E6 74    		DB 074h ; 't'
  09E7 0A    		DB 00Ah 
  09E8 78    		DB 078h ; 'x'
  09E9 7F    		DB 07Fh 
  09EA 75    		DB 075h ; 'u'
  09EB 7F    		DB 07Fh 
  09EC 0A    		DB 00Ah 
  09ED 96    		DB 096h 
  09EE 60    		DB 060h ; '`'
  09EF 06    		DB 006h 
  09F0 75    		DB 075h ; 'u'
  09F1 90    		DB 090h 
  09F2 63    		DB 063h ; 'c'
  09F3 02    		DB 002h 
  09F4 0B    		DB 00Bh 
  09F5 57    		DB 057h ; 'W'
  09F6 78    		DB 078h ; 'x'
  09F7 80    		DB 080h 
  09F8 18    		DB 018h 
  09F9 76    		DB 076h ; 'v'
  09FA 00    		DB 000h 
  09FB E8    		DB 0E8h 
  09FC 70    		DB 070h ; 'p'
  09FD FA    		DB 0FAh 
  09FE 75    		DB 075h ; 'u'
  09FF D0    		DB 0D0h 
  0A00 00    		DB 000h 
  0A01 74    		DB 074h ; 't'
  0A02 0A    		DB 00Ah 
  0A03 94    		DB 094h 
  0A04 0A    		DB 00Ah 
  0A05 60    		DB 060h ; '`'
  0A06 06    		DB 006h 
  0A07 75    		DB 075h ; 'u'
  0A08 90    		DB 090h 
  0A09 64    		DB 064h ; 'd'
  0A0A 02    		DB 002h 
  0A0B 0B    		DB 00Bh 
  0A0C 57    		DB 057h ; 'W'
  0A0D 78    		DB 078h ; 'x'
  0A0E 80    		DB 080h 
  0A0F 18    		DB 018h 
  0A10 76    		DB 076h ; 'v'
  0A11 00    		DB 000h 
  0A12 E8    		DB 0E8h 
  0A13 70    		DB 070h ; 'p'
  0A14 FA    		DB 0FAh 
  0A15 75    		DB 075h ; 'u'
  0A16 D0    		DB 0D0h 
  0A17 00    		DB 000h 
  0A18 74    		DB 074h ; 't'
  0A19 23    		DB 023h ; '#'
  0A1A C4    		DB 0C4h 
  0A1B 94    		DB 094h 
  0A1C 32    		DB 032h ; '2'
  0A1D 60    		DB 060h ; '`'
  0A1E 06    		DB 006h 
  0A1F 75    		DB 075h ; 'u'
  0A20 90    		DB 090h 
  0A21 65    		DB 065h ; 'e'
  0A22 02    		DB 002h 
  0A23 0B    		DB 00Bh 
  0A24 57    		DB 057h ; 'W'
  0A25 78    		DB 078h ; 'x'
  0A26 80    		DB 080h 
  0A27 18    		DB 018h 
  0A28 76    		DB 076h ; 'v'
  0A29 00    		DB 000h 
  0A2A E8    		DB 0E8h 
  0A2B 70    		DB 070h ; 'p'
  0A2C FA    		DB 0FAh 
  0A2D 75    		DB 075h ; 'u'
  0A2E D0    		DB 0D0h 
  0A2F 00    		DB 000h 
  0A30 74    		DB 074h ; 't'
  0A31 0A    		DB 00Ah 
  0A32 78    		DB 078h ; 'x'
  0A33 63    		DB 063h ; 'c'
  0A34 C8    		DB 0C8h 
  0A35 94    		DB 094h 
  0A36 63    		DB 063h ; 'c'
  0A37 70    		DB 070h ; 'p'
  0A38 05    		DB 005h 
  0A39 E8    		DB 0E8h 
  0A3A 94    		DB 094h 
  0A3B 0A    		DB 00Ah 
  0A3C 60    		DB 060h ; '`'
  0A3D 06    		DB 006h 
  0A3E 75    		DB 075h ; 'u'
  0A3F 90    		DB 090h 
  0A40 66    		DB 066h ; 'f'
  0A41 02    		DB 002h 
  0A42 0B    		DB 00Bh 
  0A43 57    		DB 057h ; 'W'
  0A44 78    		DB 078h ; 'x'
  0A45 80    		DB 080h 
  0A46 18    		DB 018h 
  0A47 76    		DB 076h ; 'v'
  0A48 00    		DB 000h 
  0A49 E8    		DB 0E8h 
  0A4A 70    		DB 070h ; 'p'
  0A4B FA    		DB 0FAh 
  0A4C 75    		DB 075h ; 'u'
  0A4D D0    		DB 0D0h 
  0A4E 00    		DB 000h 
  0A4F 74    		DB 074h ; 't'
  0A50 0A    		DB 00Ah 
  0A51 75    		DB 075h ; 'u'
  0A52 7F    		DB 07Fh 
  0A53 63    		DB 063h ; 'c'
  0A54 C5    		DB 0C5h 
  0A55 7F    		DB 07Fh 
  0A56 94    		DB 094h 
  0A57 63    		DB 063h ; 'c'
  0A58 70    		DB 070h ; 'p'
  0A59 06    		DB 006h 
  0A5A E5    		DB 0E5h 
  0A5B 7F    		DB 07Fh 
  0A5C 94    		DB 094h 
  0A5D 0A    		DB 00Ah 
  0A5E 60    		DB 060h ; '`'
  0A5F 06    		DB 006h 
  0A60 75    		DB 075h ; 'u'
  0A61 90    		DB 090h 
  0A62 67    		DB 067h ; 'g'
  0A63 02    		DB 002h 
  0A64 0B    		DB 00Bh 
  0A65 57    		DB 057h ; 'W'
  0A66 78    		DB 078h ; 'x'
  0A67 80    		DB 080h 
  0A68 18    		DB 018h 
  0A69 76    		DB 076h ; 'v'
  0A6A 00    		DB 000h 
  0A6B E8    		DB 0E8h 
  0A6C 70    		DB 070h ; 'p'
  0A6D FA    		DB 0FAh 
  0A6E 75    		DB 075h ; 'u'
  0A6F D0    		DB 0D0h 
  0A70 00    		DB 000h 
  0A71 74    		DB 074h ; 't'
  0A72 0A    		DB 00Ah 
  0A73 78    		DB 078h ; 'x'
  0A74 7F    		DB 07Fh 
  0A75 75    		DB 075h ; 'u'
  0A76 7F    		DB 07Fh 
  0A77 63    		DB 063h ; 'c'
  0A78 C6    		DB 0C6h 
  0A79 94    		DB 094h 
  0A7A 63    		DB 063h ; 'c'
  0A7B 70    		DB 070h ; 'p'
  0A7C 06    		DB 006h 
  0A7D E5    		DB 0E5h 
  0A7E 7F    		DB 07Fh 
  0A7F 94    		DB 094h 
  0A80 0A    		DB 00Ah 
  0A81 60    		DB 060h ; '`'
  0A82 06    		DB 006h 
  0A83 75    		DB 075h ; 'u'
  0A84 90    		DB 090h 
  0A85 68    		DB 068h ; 'h'
  0A86 02    		DB 002h 
  0A87 0B    		DB 00Bh 
  0A88 57    		DB 057h ; 'W'
  0A89 78    		DB 078h ; 'x'
  0A8A 80    		DB 080h 
  0A8B 18    		DB 018h 
  0A8C 76    		DB 076h ; 'v'
  0A8D 00    		DB 000h 
  0A8E E8    		DB 0E8h 
  0A8F 70    		DB 070h ; 'p'
  0A90 FA    		DB 0FAh 
  0A91 75    		DB 075h ; 'u'
  0A92 D0    		DB 0D0h 
  0A93 00    		DB 000h 
  0A94 74    		DB 074h ; 't'
  0A95 44    		DB 044h ; 'D'
  0A96 78    		DB 078h ; 'x'
  0A97 7F    		DB 07Fh 
  0A98 75    		DB 075h ; 'u'
  0A99 7F    		DB 07Fh 
  0A9A 55    		DB 055h ; 'U'
  0A9B D6    		DB 0D6h 
  0A9C 94    		DB 094h 
  0A9D 45    		DB 045h ; 'E'
  0A9E 70    		DB 070h ; 'p'
  0A9F 06    		DB 006h 
  0AA0 E5    		DB 0E5h 
  0AA1 7F    		DB 07Fh 
  0AA2 94    		DB 094h 
  0AA3 54    		DB 054h ; 'T'
  0AA4 60    		DB 060h ; '`'
  0AA5 06    		DB 006h 
  0AA6 75    		DB 075h ; 'u'
  0AA7 90    		DB 090h 
  0AA8 69    		DB 069h ; 'i'
  0AA9 02    		DB 002h 
  0AAA 0B    		DB 00Bh 
  0AAB 57    		DB 057h ; 'W'
  0AAC 78    		DB 078h ; 'x'
  0AAD 80    		DB 080h 
  0AAE 18    		DB 018h 
  0AAF 76    		DB 076h ; 'v'
  0AB0 00    		DB 000h 
  0AB1 E8    		DB 0E8h 
  0AB2 70    		DB 070h ; 'p'
  0AB3 FA    		DB 0FAh 
  0AB4 75    		DB 075h ; 'u'
  0AB5 D0    		DB 0D0h 
  0AB6 00    		DB 000h 
  0AB7 74    		DB 074h ; 't'
  0AB8 35    		DB 035h ; '5'
  0AB9 78    		DB 078h ; 'x'
  0ABA 53    		DB 053h ; 'S'
  0ABB 68    		DB 068h ; 'h'
  0ABC 94    		DB 094h 
  0ABD 66    		DB 066h ; 'f'
  0ABE 60    		DB 060h ; '`'
  0ABF 06    		DB 006h 
  0AC0 75    		DB 075h ; 'u'
  0AC1 90    		DB 090h 
  0AC2 6A    		DB 06Ah ; 'j'
  0AC3 02    		DB 002h 
  0AC4 0B    		DB 00Bh 
  0AC5 57    		DB 057h ; 'W'
  0AC6 78    		DB 078h ; 'x'
  0AC7 80    		DB 080h 
  0AC8 18    		DB 018h 
  0AC9 76    		DB 076h ; 'v'
  0ACA 00    		DB 000h 
  0ACB E8    		DB 0E8h 
  0ACC 70    		DB 070h ; 'p'
  0ACD FA    		DB 0FAh 
  0ACE 75    		DB 075h ; 'u'
  0ACF D0    		DB 0D0h 
  0AD0 00    		DB 000h 
  0AD1 74    		DB 074h ; 't'
  0AD2 53    		DB 053h ; 'S'
  0AD3 75    		DB 075h ; 'u'
  0AD4 7F    		DB 07Fh 
  0AD5 35    		DB 035h ; '5'
  0AD6 65    		DB 065h ; 'e'
  0AD7 7F    		DB 07Fh 
  0AD8 94    		DB 094h 
  0AD9 66    		DB 066h ; 'f'
  0ADA 60    		DB 060h ; '`'
  0ADB 06    		DB 006h 
  0ADC 75    		DB 075h ; 'u'
  0ADD 90    		DB 090h 
  0ADE 6B    		DB 06Bh ; 'k'
  0ADF 02    		DB 002h 
  0AE0 0B    		DB 00Bh 
  0AE1 57    		DB 057h ; 'W'
  0AE2 78    		DB 078h ; 'x'
  0AE3 80    		DB 080h 
  0AE4 18    		DB 018h 
  0AE5 76    		DB 076h ; 'v'
  0AE6 00    		DB 000h 
  0AE7 E8    		DB 0E8h 
  0AE8 70    		DB 070h ; 'p'
  0AE9 FA    		DB 0FAh 
  0AEA 75    		DB 075h ; 'u'
  0AEB D0    		DB 0D0h 
  0AEC 00    		DB 000h 
  0AED 74    		DB 074h ; 't'
  0AEE 35    		DB 035h ; '5'
  0AEF 78    		DB 078h ; 'x'
  0AF0 7F    		DB 07Fh 
  0AF1 75    		DB 075h ; 'u'
  0AF2 7F    		DB 07Fh 
  0AF3 53    		DB 053h ; 'S'
  0AF4 66    		DB 066h ; 'f'
  0AF5 94    		DB 094h 
  0AF6 66    		DB 066h ; 'f'
  0AF7 60    		DB 060h ; '`'
  0AF8 06    		DB 006h 
  0AF9 75    		DB 075h ; 'u'
  0AFA 90    		DB 090h 
  0AFB 6C    		DB 06Ch ; 'l'
  0AFC 02    		DB 002h 
  0AFD 0B    		DB 00Bh 
  0AFE 57    		DB 057h ; 'W'
  0AFF 78    		DB 078h ; 'x'
  0B00 80    		DB 080h 
  0B01 18    		DB 018h 
  0B02 76    		DB 076h ; 'v'
  0B03 00    		DB 000h 
  0B04 E8    		DB 0E8h 
  0B05 70    		DB 070h ; 'p'
  0B06 FA    		DB 0FAh 
  0B07 75    		DB 075h ; 'u'
  0B08 D0    		DB 0D0h 
  0B09 00    		DB 000h 
  0B0A 74    		DB 074h ; 't'
  0B0B 35    		DB 035h ; '5'
  0B0C 64    		DB 064h ; 'd'
  0B0D 53    		DB 053h ; 'S'
  0B0E 94    		DB 094h 
  0B0F 66    		DB 066h ; 'f'
  0B10 60    		DB 060h ; '`'
  0B11 06    		DB 006h 
  0B12 75    		DB 075h ; 'u'
  0B13 90    		DB 090h 
  0B14 6D    		DB 06Dh ; 'm'
  0B15 02    		DB 002h 
  0B16 0B    		DB 00Bh 
  0B17 57    		DB 057h ; 'W'
  0B18 78    		DB 078h ; 'x'
  0B19 80    		DB 080h 
  0B1A 18    		DB 018h 
  0B1B 76    		DB 076h ; 'v'
  0B1C 00    		DB 000h 
  0B1D E8    		DB 0E8h 
  0B1E 70    		DB 070h ; 'p'
  0B1F FA    		DB 0FAh 
  0B20 75    		DB 075h ; 'u'
  0B21 D0    		DB 0D0h 
  0B22 00    		DB 000h 
  0B23 74    		DB 074h ; 't'
  0B24 35    		DB 035h ; '5'
  0B25 75    		DB 075h ; 'u'
  0B26 7F    		DB 07Fh 
  0B27 53    		DB 053h ; 'S'
  0B28 62    		DB 062h ; 'b'
  0B29 7F    		DB 07Fh 
  0B2A E4    		DB 0E4h 
  0B2B E5    		DB 0E5h 
  0B2C 7F    		DB 07Fh 
  0B2D 94    		DB 094h 
  0B2E 66    		DB 066h ; 'f'
  0B2F 60    		DB 060h ; '`'
  0B30 06    		DB 006h 
  0B31 75    		DB 075h ; 'u'
  0B32 90    		DB 090h 
  0B33 6E    		DB 06Eh ; 'n'
  0B34 02    		DB 002h 
  0B35 0B    		DB 00Bh 
  0B36 57    		DB 057h ; 'W'
  0B37 78    		DB 078h ; 'x'
  0B38 80    		DB 080h 
  0B39 18    		DB 018h 
  0B3A 76    		DB 076h ; 'v'
  0B3B 00    		DB 000h 
  0B3C E8    		DB 0E8h 
  0B3D 70    		DB 070h ; 'p'
  0B3E FA    		DB 0FAh 
  0B3F 75    		DB 075h ; 'u'
  0B40 D0    		DB 0D0h 
  0B41 00    		DB 000h 
  0B42 75    		DB 075h ; 'u'
  0B43 7F    		DB 07Fh 
  0B44 35    		DB 035h ; '5'
  0B45 63    		DB 063h ; 'c'
  0B46 7F    		DB 07Fh 
  0B47 53    		DB 053h ; 'S'
  0B48 E5    		DB 0E5h 
  0B49 7F    		DB 07Fh 
  0B4A 94    		DB 094h 
  0B4B 66    		DB 066h ; 'f'
  0B4C 60    		DB 060h ; '`'
  0B4D 06    		DB 006h 
  0B4E 75    		DB 075h ; 'u'
  0B4F 90    		DB 090h 
  0B50 6F    		DB 06Fh ; 'o'
  0B51 02    		DB 002h 
  0B52 0B    		DB 00Bh 
  0B53 57    		DB 057h ; 'W'
  0B54 75    		DB 075h ; 'u'
  0B55 90    		DB 090h 
  0B56 7F    		DB 07Fh 
L0009:
  0B57 020064		LJMP L0010

L0002:
  0B5A 758200		MOV DPL, #0h
  0B5D 22    		RET

END
