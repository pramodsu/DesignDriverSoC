module oc8051_gm_cxrom(
    clk,
    rst,
    word_in,

    // ports connected to the 8051 implementation.
    cxrom_addr,
    cxrom_data_out,

    // ports connected to golden model.
    rd_addr_0,
    rd_addr_1,
    rd_addr_2,

    rd_data_0,
    rd_data_1,
    rd_data_2,
);
    input clk, rst;
    input [127:0] word_in;

    input [15:0] cxrom_addr;
    output [31:0] cxrom_data_out;

    input [15:0] rd_addr_0, rd_addr_1, rd_addr_2;
    output [7:0] rd_data_0, rd_data_1, rd_data_2;

    wire [7:0] data_out [15:0];
    symbolic_cxrom_cell cell0  (.clk(clk), .rst(rst), .word(word_in[7:0]),      .data_out(data_out[0]) );
    symbolic_cxrom_cell cell1  (.clk(clk), .rst(rst), .word(word_in[15:8]),     .data_out(data_out[1]) );
    symbolic_cxrom_cell cell2  (.clk(clk), .rst(rst), .word(word_in[23:16]),    .data_out(data_out[2]) );
    symbolic_cxrom_cell cell3  (.clk(clk), .rst(rst), .word(word_in[31:24]),    .data_out(data_out[3]) );
    symbolic_cxrom_cell cell4  (.clk(clk), .rst(rst), .word(word_in[39:32]),    .data_out(data_out[4]) );
    symbolic_cxrom_cell cell5  (.clk(clk), .rst(rst), .word(word_in[47:40]),    .data_out(data_out[5]) );
    symbolic_cxrom_cell cell6  (.clk(clk), .rst(rst), .word(word_in[55:48]),    .data_out(data_out[6]) );
    symbolic_cxrom_cell cell7  (.clk(clk), .rst(rst), .word(word_in[63:56]),    .data_out(data_out[7]) );
    symbolic_cxrom_cell cell8  (.clk(clk), .rst(rst), .word(word_in[71:64]),    .data_out(data_out[8]) );
    symbolic_cxrom_cell cell9  (.clk(clk), .rst(rst), .word(word_in[79:72]),    .data_out(data_out[9]) );
    symbolic_cxrom_cell cell10 (.clk(clk), .rst(rst), .word(word_in[87:80]),    .data_out(data_out[10]));
    symbolic_cxrom_cell cell11 (.clk(clk), .rst(rst), .word(word_in[95:88]),    .data_out(data_out[11]));
    symbolic_cxrom_cell cell12 (.clk(clk), .rst(rst), .word(word_in[103:96]),   .data_out(data_out[12]));
    symbolic_cxrom_cell cell13 (.clk(clk), .rst(rst), .word(word_in[111:104]),  .data_out(data_out[13]));
    symbolic_cxrom_cell cell14 (.clk(clk), .rst(rst), .word(word_in[119:112]),  .data_out(data_out[14]));
    symbolic_cxrom_cell cell15 (.clk(clk), .rst(rst), .word(word_in[127:120]),  .data_out(data_out[15]));

    wire [3:0] cxrom_addr0 = cxrom_addr[3:0];
    wire [3:0] cxrom_addr1 = cxrom_addr[3:0] + 1;
    wire [3:0] cxrom_addr2 = cxrom_addr[3:0] + 2;
    wire [3:0] cxrom_addr3 = cxrom_addr[3:0] + 3;

    assign cxrom_data_out[7:0]   = data_out[cxrom_addr0];
    assign cxrom_data_out[15:8]  = data_out[cxrom_addr1];
    assign cxrom_data_out[23:16] = data_out[cxrom_addr2];
    assign cxrom_data_out[31:24] = data_out[cxrom_addr3];

    assign rd_data_0 = data_out[rd_addr_0[3:0]];
    assign rd_data_1 = data_out[rd_addr_1[3:0]];
    assign rd_data_2 = data_out[rd_addr_2[3:0]];

endmodule

module symbolic_cxrom_cell(
    clk, rst,
    data_out,
    word,
);
    input clk, rst;
    input [7:0] word;
    output [7:0] data_out;

    reg valid;
    reg [7:0] data;
    always @(posedge clk) begin
        if (rst) begin
            valid <= 0;
        end
        else begin
            if (!valid) begin
                data <= word;
                valid <= 1;
            end
        end
    end

    wire [7:0] data_out;
    assign data_out = valid ? data : word;
endmodule

