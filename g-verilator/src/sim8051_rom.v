/*
 * Non-specified ROM module that interfaces with the oc8051.
 * Used for simulator to feed in arbitrary value.
 */

module sim8051_rom(clk, rst, wr, wr_addr, wr_data, simrom_addr, simrom_data_out);
	input clk, rst;
    input wr;
	input  [15:0] simrom_addr, wr_addr;
    input  [31:0] wr_data;
	output [31:0] simrom_data_out;

	wire [15:0] addr = (wr) ? wr_addr : simrom_addr;
	wire [31:0] data_in  = wr_data; 
	wire [31:0] data_out;

	// Make the rom as register, so that we can set the value we want.
    reg [7:0] buff [65535:0];

	wire [15:0] addr0 = addr;
	wire [15:0] addr1 = addr+1;
	wire [15:0] addr2 = addr+2;
	wire [15:0] addr3 = addr+3;

	wire [7:0] data_o0 = (addr0 <= 65535) ? buff[addr0] : 8'hxx;
	wire [7:0] data_o1 = (addr1 <= 65535) ? buff[addr1] : 8'hxx;
	wire [7:0] data_o2 = (addr2 <= 65535) ? buff[addr2] : 8'hxx;
	wire [7:0] data_o3 = (addr3 <= 65535) ? buff[addr3] : 8'hxx;

    wire [7:0] data_i0 = data_in[7:0];
    wire [7:0] data_i1 = data_in[15:8];
    wire [7:0] data_i2 = data_in[23:16];
    wire [7:0] data_i3 = data_in[31:24];

    assign data_out = {data_o3, data_o2, data_o1, data_o0};
    assign simrom_data_out = (wr) ? 0 : data_out;

    integer idx;
    always @(posedge clk)
    begin
        if (rst) begin 
            for (idx = 0; idx<=65535; idx = idx+1)
                buff[idx] = 0;
        end
        else begin
            for (idx = 0; idx<=65535; idx = idx+1)
                buff[idx] = buff[idx];
            if (wr) begin
                buff[addr0] <= data_i0;
                buff[addr1] <= data_i1;
                buff[addr2] <= data_i2;
                buff[addr3] <= data_i3;
            end 
        end
    end

endmodule

