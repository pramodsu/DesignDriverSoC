
module aes_128(clk, state, key, out);
    input          clk;
    input  [127:0] state, key;
    output [127:0] out;

    wire [127:0] out = 128'b0;
endmodule
