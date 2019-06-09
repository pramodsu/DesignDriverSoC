  wire [7:0] buff [48:0];
  assign buff[0] = 8'h2;
  assign buff[1] = 8'h0;
  assign buff[2] = 8'h25;
  assign buff[3] = 8'h7f;
  assign buff[4] = 8'h2f;
  assign buff[5] = 8'h7e;
  assign buff[6] = 8'hb;
  assign buff[7] = 8'hef;
  assign buff[8] = 8'h6e;
  assign buff[9] = 8'h60;
  assign buff[10] = 8'h15;
  assign buff[11] = 8'hef;
  assign buff[12] = 8'hd3;
  assign buff[13] = 8'h9e;
  assign buff[14] = 8'h40;
  assign buff[15] = 8'h8;
  assign buff[16] = 8'hc3;
  assign buff[17] = 8'hef;
  assign buff[18] = 8'h9e;
  assign buff[19] = 8'hff;
  assign buff[20] = 8'hf5;
  assign buff[21] = 8'h80;
  assign buff[22] = 8'h80;
  assign buff[23] = 8'hef;
  assign buff[24] = 8'hc3;
  assign buff[25] = 8'hee;
  assign buff[26] = 8'h9f;
  assign buff[27] = 8'hfe;
  assign buff[28] = 8'hf5;
  assign buff[29] = 8'h90;
  assign buff[30] = 8'h80;
  assign buff[31] = 8'he7;
  assign buff[32] = 8'h8f;
  assign buff[33] = 8'ha0;
  assign buff[34] = 8'h80;
  assign buff[35] = 8'hfe;
  assign buff[36] = 8'h22;
  assign buff[37] = 8'h78;
  assign buff[38] = 8'h7f;
  assign buff[39] = 8'he4;
  assign buff[40] = 8'hf6;
  assign buff[41] = 8'hd8;
  assign buff[42] = 8'hfd;
  assign buff[43] = 8'h75;
  assign buff[44] = 8'h81;
  assign buff[45] = 8'h7;
  assign buff[46] = 8'h2;
  assign buff[47] = 8'h0;
  assign buff[48] = 8'h3;
  wire [15:0] addr0 = addr;
  wire [15:0] addr1 = addr+1;
  wire [15:0] addr2 = addr+2;
  wire [15:0] addr3 = addr+3;
  wire [7:0] data_o0 = (addr0 < 49) ? buff[addr0] : 8'hx;
  wire [7:0] data_o1 = (addr1 < 49) ? buff[addr1] : 8'hx;
  wire [7:0] data_o2 = (addr2 < 49) ? buff[addr2] : 8'hx;
  wire [7:0] data_o3 = (addr3 < 49) ? buff[addr3] : 8'hx;
  wire [31:0] data_out = {data_o3, data_o2, data_o1, data_o0};