  wire [7:0] buff [51:0];
  assign buff[0] = 8'h04;
  assign buff[1] = 8'h03;
  assign buff[2] = 8'h10;
  assign buff[3] = 8'he7;
  assign buff[4] = 8'h0b;
  assign buff[5] = 8'h0;
  assign buff[6] = 8'h0;
  assign buff[7] = 8'h0;

  assign buff[8] = 8'h0;
  assign buff[9] = 8'h0;
  assign buff[10] = 8'h0;
  assign buff[11] = 8'h0;
  assign buff[12] = 8'h0;
  assign buff[13] = 8'h0;
  assign buff[14] = 8'h0;
  assign buff[15] = 8'h0;

  assign buff[16] = 8'h75;
  assign buff[17] = 8'hb0;
  assign buff[18] = 8'hde;
  assign buff[19] = 8'h75;
  assign buff[20] = 8'ha0;
  assign buff[21] = 8'hde;
  assign buff[22] = 8'h75;
  assign buff[23] = 8'h90;
  assign buff[24] = 8'hde;
  assign buff[25] = 8'h75;
  assign buff[26] = 8'h80;
  assign buff[27] = 8'hde;
  assign buff[28] = 8'h75;
  assign buff[29] = 8'hb0;
  assign buff[30] = 8'had;
  assign buff[31] = 8'h75;
  assign buff[32] = 8'ha0;
  assign buff[33] = 8'had;
  assign buff[34] = 8'h75;
  assign buff[35] = 8'h90;
  assign buff[36] = 8'had;
  assign buff[37] = 8'h75;
  assign buff[38] = 8'h80;
  assign buff[39] = 8'had;
  assign buff[40] = 8'h75;
  assign buff[41] = 8'hb0;
  assign buff[42] = 8'h0;
  assign buff[43] = 8'h75;
  assign buff[44] = 8'ha0;
  assign buff[45] = 8'h0;
  assign buff[46] = 8'h75;
  assign buff[47] = 8'h90;
  assign buff[48] = 8'h0;
  assign buff[49] = 8'h75;
  assign buff[50] = 8'h80;
  assign buff[51] = 8'h0;

  wire [15:0] addr0 = addr;
  wire [15:0] addr1 = addr+1;
  wire [15:0] addr2 = addr+2;
  wire [15:0] addr3 = addr+3;
  wire [7:0] data_o0 = (addr0 < 149) ? buff[addr0] : 8'hx;
  wire [7:0] data_o1 = (addr1 < 149) ? buff[addr1] : 8'hx;
  wire [7:0] data_o2 = (addr2 < 149) ? buff[addr2] : 8'hx;
  wire [7:0] data_o3 = (addr3 < 149) ? buff[addr3] : 8'hx;
  wire [31:0] data_out = {data_o3, data_o2, data_o1, data_o0};

