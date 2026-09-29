import kan_core_pkg::*;

module kan_top (
    input  logic                                        i_clk      ,
    input  logic                                        i_rst_n    ,
    input  logic                                        i_en       ,
    input  logic                                        i_start    ,
    input  logic [IN_FEATURES   - 1:0][IN_WIDTH  - 1:0] i_vector   ,
    output logic                                        o_done     ,
    output logic [OUT_FEATURES  - 1:0][OUT_WIDTH - 1:0] o_vector   ,
    output logic            [$clog2(OUT_FEATURES)-1:0]  o_index                          
);

    localparam  TOTAL_DELAY  = 16 ;

    logic [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] core_out, core_out_pipeline;
    logic [TOTAL_DELAY:0] delay;

    kan_core core (
        .i_clk   (i_clk),
        .i_rst_n (i_rst_n),
        .i_en    (i_en),
        .i_vector(i_vector),
        .o_vector(core_out)
    );

    assign o_vector = core_out_pipeline;

    generate
        genvar i;
        for(i = 0; i < OUT_FEATURES; i++) begin : block_pipeline
            registers #(
                .ARRAY_WIDTH(OUT_WIDTH)
            ) delay (
                .i_clk  (i_clk),
                .i_rst_n(i_rst_n),
                .i_en   (i_en),
                .d      (core_out[i]),
                .q      (core_out_pipeline[i])
            );
        end
    endgenerate

    kan_argmax argmax (
        .i_clk      (i_clk),
        .i_rst_n    (i_rst_n),
        .i_en       (i_en),
        .i_data     (core_out_pipeline),
        .o_max_index(o_index),
        .o_max_value()
    );
    
    always_ff @(posedge i_clk, negedge i_rst_n) begin 
        if(~i_rst_n)   delay <= '0;
        else if (i_en) delay <= {delay[TOTAL_DELAY - 1:0], i_start};
    end

    assign o_done = delay[TOTAL_DELAY];

endmodule