import kan_core_pkg::*;
{{PKG}}

module kan_core (
    input  logic                                       i_clk   ,
    input  logic                                       i_rst_n ,
    input  logic                                       i_en    ,
    input  logic [IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] i_vector,
    output logic [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] o_vector
);
    // Signal declarations
    {{SIGNAL_DECLS}}

    // Auto layer blocks
    {{LAYER_BLOCKS}}

endmodule