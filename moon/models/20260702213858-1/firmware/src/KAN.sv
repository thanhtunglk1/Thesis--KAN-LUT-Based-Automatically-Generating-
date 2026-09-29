module KAN #(
    parameter IN_FEATURES  = 2,
    parameter IN_WIDTH     = 6,
    parameter OUT_FEATURES = 1,
    parameter OUT_WIDTH    = 8
)(
    input  logic                                       i_clk   ,
    input  logic                                       i_rst_n ,
    input  logic                                       i_en    ,
    input  logic [IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] i_vector,
    output logic [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] o_vector
);
    // Signal declarations
    // Layer 0: 2 -> 2
    logic  [4:0] acts_0_0_0, acts_0_0_1, acts_0_1_0, acts_0_1_1;
    logic  [4:0] out_0_0_sat, out_0_1_sat;
    logic  [4:0] out_0_0_reg, out_0_1_reg;

// Layer 1: 2 -> 1
    logic  [7:0] acts_1_0_0, acts_1_0_1;

    // Auto layer blocks
        // Layer 0, Node 0
      logic [6:0] sum_0_0;
    logic [6:0] sum_0_0_reg;
  
    lut_rom #(.DATA_WIDTH(5), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_0.mem")) 
    rom_0_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_0_0));

    lut_rom #(.DATA_WIDTH(5), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_1.mem")) 
    rom_0_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_0_1));

  // Stage 1
    assign sum_0_0 = {{2{acts_0_0_0[4]}}, acts_0_0_0} + {{2{acts_0_0_1[4]}}, acts_0_0_1};
    registers #(.ARRAY_WIDTH(7)) r_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_0), .q(sum_0_0_reg));

    saturate_clip #(.IN_WIDTH(7), .OUT_WIDTH(5)) sat_0_0 (.i_data(sum_0_0_reg), .o_data(out_0_0_sat));


    // Layer 0, Node 1
      logic [6:0] sum_0_1;
    logic [6:0] sum_0_1_reg;
  
    lut_rom #(.DATA_WIDTH(5), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_0.mem")) 
    rom_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_1_0));

    lut_rom #(.DATA_WIDTH(5), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_1.mem")) 
    rom_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_1_1));

  // Stage 1
    assign sum_0_1 = {{2{acts_0_1_0[4]}}, acts_0_1_0} + {{2{acts_0_1_1[4]}}, acts_0_1_1};
    registers #(.ARRAY_WIDTH(7)) r_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_1), .q(sum_0_1_reg));

    saturate_clip #(.IN_WIDTH(7), .OUT_WIDTH(5)) sat_0_1 (.i_data(sum_0_1_reg), .o_data(out_0_1_sat));


  registers #(.ARRAY_WIDTH(5)) node_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_0_sat), .q(out_0_0_reg));

    registers #(.ARRAY_WIDTH(5)) node_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_1_sat), .q(out_0_1_reg));


    // Layer 1, Node 0
      logic [9:0] sum_1_0;
    logic [9:0] sum_1_0_reg;
  
    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(5), .HEX_LINK("../mem/lut_1_0_0.mem")) 
    rom_1_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_0_0));

    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(5), .HEX_LINK("../mem/lut_1_0_1.mem")) 
    rom_1_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_0_1));

  // Stage 1
    assign sum_1_0 = {{2{acts_1_0_0[7]}}, acts_1_0_0} + {{2{acts_1_0_1[7]}}, acts_1_0_1};
    registers #(.ARRAY_WIDTH(10)) r_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_0), .q(sum_1_0_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(8)) sat_1_0 (.i_data(sum_1_0_reg), .o_data(o_vector[0]));


endmodule