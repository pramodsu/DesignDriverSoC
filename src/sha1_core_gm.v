module sha1_core(
                 input wire            clk,
                 input wire            reset_n,

                 input wire            init,
                 input wire            next,

                 input wire [511 : 0]  block,

                 output wire           ready,

                 output wire [159 : 0] digest,
                 output wire           digest_valid
                );


    assign ready = 1;
    assign digest_valid = 1;
    assign digest = 160'b0;
endmodule
