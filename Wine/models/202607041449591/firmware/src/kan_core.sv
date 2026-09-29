import layer_0_lut_pkg::*;
import layer_1_lut_pkg::*;

module kan_core #(
    parameter IN_FEATURES  = 13,
    parameter IN_WIDTH     = 6,
    parameter OUT_FEATURES = 3,
    parameter OUT_WIDTH    = 6
)(
    input  logic                                       i_clk   ,
    input  logic                                       i_rst_n ,
    input  logic                                       i_en    ,
    input  logic [IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] i_vector,
    output logic [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] o_vector
);
    // Signal declarations
    // Layer 0: 13 -> 10
    logic  [5:0] acts_0_0_0, acts_0_0_1, acts_0_0_2, acts_0_0_4, acts_0_0_6, acts_0_0_7, acts_0_0_8, acts_0_0_9, acts_0_0_10, acts_0_0_11, acts_0_0_12, acts_0_1_0, acts_0_1_1, acts_0_1_2, acts_0_1_3, acts_0_1_4;
    logic  [5:0] acts_0_1_5, acts_0_1_6, acts_0_1_7, acts_0_1_8, acts_0_1_9, acts_0_1_11, acts_0_1_12, acts_0_2_0, acts_0_2_3, acts_0_2_4, acts_0_2_5, acts_0_2_6, acts_0_2_7, acts_0_2_10, acts_0_2_11, acts_0_2_12;
    logic  [5:0] acts_0_3_0, acts_0_3_1, acts_0_3_2, acts_0_3_3, acts_0_3_4, acts_0_3_5, acts_0_3_6, acts_0_3_7, acts_0_3_8, acts_0_3_9, acts_0_3_10, acts_0_3_11, acts_0_3_12, acts_0_4_0, acts_0_4_3, acts_0_4_4;
    logic  [5:0] acts_0_4_5, acts_0_4_6, acts_0_4_7, acts_0_4_8, acts_0_4_9, acts_0_4_10, acts_0_4_11, acts_0_4_12, acts_0_5_0, acts_0_5_1, acts_0_5_2, acts_0_5_3, acts_0_5_5, acts_0_5_6, acts_0_5_7, acts_0_5_8;
    logic  [5:0] acts_0_5_9, acts_0_5_10, acts_0_5_11, acts_0_5_12, acts_0_6_0, acts_0_6_1, acts_0_6_2, acts_0_6_3, acts_0_6_4, acts_0_6_5, acts_0_6_6, acts_0_6_8, acts_0_6_9, acts_0_6_10, acts_0_6_11, acts_0_6_12;
    logic  [5:0] acts_0_7_0, acts_0_7_1, acts_0_7_2, acts_0_7_3, acts_0_7_5, acts_0_7_6, acts_0_7_7, acts_0_7_8, acts_0_7_10, acts_0_7_11, acts_0_7_12, acts_0_8_0, acts_0_8_1, acts_0_8_2, acts_0_8_3, acts_0_8_4;
    logic  [5:0] acts_0_8_5, acts_0_8_6, acts_0_8_7, acts_0_8_8, acts_0_8_9, acts_0_8_10, acts_0_8_11, acts_0_8_12, acts_0_9_0, acts_0_9_2, acts_0_9_3, acts_0_9_4, acts_0_9_6, acts_0_9_7, acts_0_9_8, acts_0_9_9;
    logic  [5:0] acts_0_9_10, acts_0_9_12;
    logic  [5:0] out_0_0_sat, out_0_1_sat, out_0_2_sat, out_0_3_sat, out_0_4_sat, out_0_5_sat, out_0_6_sat, out_0_7_sat, out_0_8_sat, out_0_9_sat;
    logic  [5:0] out_0_0_reg, out_0_1_reg, out_0_2_reg, out_0_3_reg, out_0_4_reg, out_0_5_reg, out_0_6_reg, out_0_7_reg, out_0_8_reg, out_0_9_reg;

// Layer 1: 10 -> 3
    logic  [5:0] acts_1_0_0, acts_1_0_1, acts_1_0_2, acts_1_0_3, acts_1_0_4, acts_1_0_5, acts_1_0_6, acts_1_0_7, acts_1_0_8, acts_1_0_9, acts_1_1_0, acts_1_1_1, acts_1_1_2, acts_1_1_3, acts_1_1_4, acts_1_1_5;
    logic  [5:0] acts_1_1_6, acts_1_1_7, acts_1_1_8, acts_1_1_9, acts_1_2_0, acts_1_2_1, acts_1_2_2, acts_1_2_3, acts_1_2_4, acts_1_2_5, acts_1_2_6, acts_1_2_7, acts_1_2_8;

    // Auto layer blocks
        // Layer 0, Node 0
      logic  [7:0] s_0_0_1_0, s_0_0_1_1, s_0_0_1_2;
    logic  [7:0] s_0_0_1_0_reg, s_0_0_1_1_reg, s_0_0_1_2_reg;
    logic [9:0] sum_0_0;
    logic [9:0] sum_0_0_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_0)) 
    rom_0_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_0_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_1)) 
    rom_0_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_0_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_2)) 
    rom_0_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_0_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_4)) 
    rom_0_0_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_0_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_6)) 
    rom_0_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_0_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_7)) 
    rom_0_0_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_0_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_8)) 
    rom_0_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_0_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_9)) 
    rom_0_0_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_0_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_10)) 
    rom_0_0_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_0_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_11)) 
    rom_0_0_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_0_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_12)) 
    rom_0_0_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_0_12));

  // Stage 1
    assign s_0_0_1_0 = {{2{acts_0_0_0[5]}}, acts_0_0_0} + {{2{acts_0_0_1[5]}}, acts_0_0_1} + {{2{acts_0_0_2[5]}}, acts_0_0_2} + {{2{acts_0_0_4[5]}}, acts_0_0_4};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_0), .q(s_0_0_1_0_reg));

    assign s_0_0_1_1 = {{2{acts_0_0_6[5]}}, acts_0_0_6} + {{2{acts_0_0_7[5]}}, acts_0_0_7} + {{2{acts_0_0_8[5]}}, acts_0_0_8} + {{2{acts_0_0_9[5]}}, acts_0_0_9};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_1), .q(s_0_0_1_1_reg));

    assign s_0_0_1_2 = {{2{acts_0_0_10[5]}}, acts_0_0_10} + {{2{acts_0_0_11[5]}}, acts_0_0_11} + {{2{acts_0_0_12[5]}}, acts_0_0_12};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_2), .q(s_0_0_1_2_reg));

  // Stage 2
    assign sum_0_0 = {{2{s_0_0_1_0_reg[7]}}, s_0_0_1_0_reg} + {{2{s_0_0_1_1_reg[7]}}, s_0_0_1_1_reg} + {{2{s_0_0_1_2_reg[7]}}, s_0_0_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_0), .q(sum_0_0_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_0_0 (.i_data(sum_0_0_reg), .o_data(out_0_0_sat));


    // Layer 0, Node 1
      logic  [7:0] s_0_1_1_0, s_0_1_1_1, s_0_1_1_2;
    logic  [7:0] s_0_1_1_0_reg, s_0_1_1_1_reg, s_0_1_1_2_reg;
    logic [9:0] sum_0_1;
    logic [9:0] sum_0_1_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_0)) 
    rom_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_1_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_1)) 
    rom_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_1_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_2)) 
    rom_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_1_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_3)) 
    rom_0_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_1_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_4)) 
    rom_0_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_1_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_5)) 
    rom_0_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_1_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_6)) 
    rom_0_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_1_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_7)) 
    rom_0_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_1_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_8)) 
    rom_0_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_1_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_9)) 
    rom_0_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_1_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_11)) 
    rom_0_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_1_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_12)) 
    rom_0_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_1_12));

  // Stage 1
    assign s_0_1_1_0 = {{2{acts_0_1_0[5]}}, acts_0_1_0} + {{2{acts_0_1_1[5]}}, acts_0_1_1} + {{2{acts_0_1_2[5]}}, acts_0_1_2} + {{2{acts_0_1_3[5]}}, acts_0_1_3};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_0), .q(s_0_1_1_0_reg));

    assign s_0_1_1_1 = {{2{acts_0_1_4[5]}}, acts_0_1_4} + {{2{acts_0_1_5[5]}}, acts_0_1_5} + {{2{acts_0_1_6[5]}}, acts_0_1_6} + {{2{acts_0_1_7[5]}}, acts_0_1_7};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_1), .q(s_0_1_1_1_reg));

    assign s_0_1_1_2 = {{2{acts_0_1_8[5]}}, acts_0_1_8} + {{2{acts_0_1_9[5]}}, acts_0_1_9} + {{2{acts_0_1_11[5]}}, acts_0_1_11} + {{2{acts_0_1_12[5]}}, acts_0_1_12};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_2), .q(s_0_1_1_2_reg));

  // Stage 2
    assign sum_0_1 = {{2{s_0_1_1_0_reg[7]}}, s_0_1_1_0_reg} + {{2{s_0_1_1_1_reg[7]}}, s_0_1_1_1_reg} + {{2{s_0_1_1_2_reg[7]}}, s_0_1_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_1), .q(sum_0_1_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_0_1 (.i_data(sum_0_1_reg), .o_data(out_0_1_sat));


    // Layer 0, Node 2
      logic  [7:0] s_0_2_1_0, s_0_2_1_1, s_0_2_1_2;
    logic  [7:0] s_0_2_1_0_reg, s_0_2_1_1_reg, s_0_2_1_2_reg;
    logic [9:0] sum_0_2;
    logic [9:0] sum_0_2_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_0)) 
    rom_0_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_2_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_3)) 
    rom_0_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_2_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_4)) 
    rom_0_2_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_2_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_5)) 
    rom_0_2_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_2_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_6)) 
    rom_0_2_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_2_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_7)) 
    rom_0_2_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_2_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_10)) 
    rom_0_2_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_2_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_11)) 
    rom_0_2_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_2_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_12)) 
    rom_0_2_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_2_12));

  // Stage 1
    assign s_0_2_1_0 = {{2{acts_0_2_0[5]}}, acts_0_2_0} + {{2{acts_0_2_3[5]}}, acts_0_2_3} + {{2{acts_0_2_4[5]}}, acts_0_2_4} + {{2{acts_0_2_5[5]}}, acts_0_2_5};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_0), .q(s_0_2_1_0_reg));

    assign s_0_2_1_1 = {{2{acts_0_2_6[5]}}, acts_0_2_6} + {{2{acts_0_2_7[5]}}, acts_0_2_7} + {{2{acts_0_2_10[5]}}, acts_0_2_10} + {{2{acts_0_2_11[5]}}, acts_0_2_11};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_1), .q(s_0_2_1_1_reg));

    assign s_0_2_1_2 = {{2{acts_0_2_12[5]}}, acts_0_2_12};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_2), .q(s_0_2_1_2_reg));

  // Stage 2
    assign sum_0_2 = {{2{s_0_2_1_0_reg[7]}}, s_0_2_1_0_reg} + {{2{s_0_2_1_1_reg[7]}}, s_0_2_1_1_reg} + {{2{s_0_2_1_2_reg[7]}}, s_0_2_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_2), .q(sum_0_2_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_0_2 (.i_data(sum_0_2_reg), .o_data(out_0_2_sat));


    // Layer 0, Node 3
      logic  [7:0] s_0_3_1_0, s_0_3_1_1, s_0_3_1_2, s_0_3_1_3;
    logic  [7:0] s_0_3_1_0_reg, s_0_3_1_1_reg, s_0_3_1_2_reg, s_0_3_1_3_reg;
    logic [9:0] sum_0_3;
    logic [9:0] sum_0_3_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_0)) 
    rom_0_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_3_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_1)) 
    rom_0_3_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_3_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_2)) 
    rom_0_3_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_3_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_3)) 
    rom_0_3_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_3_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_4)) 
    rom_0_3_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_3_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_5)) 
    rom_0_3_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_3_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_6)) 
    rom_0_3_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_3_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_7)) 
    rom_0_3_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_3_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_8)) 
    rom_0_3_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_3_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_9)) 
    rom_0_3_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_3_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_10)) 
    rom_0_3_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_3_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_11)) 
    rom_0_3_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_3_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_12)) 
    rom_0_3_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_3_12));

  // Stage 1
    assign s_0_3_1_0 = {{2{acts_0_3_0[5]}}, acts_0_3_0} + {{2{acts_0_3_1[5]}}, acts_0_3_1} + {{2{acts_0_3_2[5]}}, acts_0_3_2} + {{2{acts_0_3_3[5]}}, acts_0_3_3};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_0), .q(s_0_3_1_0_reg));

    assign s_0_3_1_1 = {{2{acts_0_3_4[5]}}, acts_0_3_4} + {{2{acts_0_3_5[5]}}, acts_0_3_5} + {{2{acts_0_3_6[5]}}, acts_0_3_6} + {{2{acts_0_3_7[5]}}, acts_0_3_7};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_1), .q(s_0_3_1_1_reg));

    assign s_0_3_1_2 = {{2{acts_0_3_8[5]}}, acts_0_3_8} + {{2{acts_0_3_9[5]}}, acts_0_3_9} + {{2{acts_0_3_10[5]}}, acts_0_3_10} + {{2{acts_0_3_11[5]}}, acts_0_3_11};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_2), .q(s_0_3_1_2_reg));

    assign s_0_3_1_3 = {{2{acts_0_3_12[5]}}, acts_0_3_12};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_3), .q(s_0_3_1_3_reg));

  // Stage 2
    assign sum_0_3 = {{2{s_0_3_1_0_reg[7]}}, s_0_3_1_0_reg} + {{2{s_0_3_1_1_reg[7]}}, s_0_3_1_1_reg} + {{2{s_0_3_1_2_reg[7]}}, s_0_3_1_2_reg} + {{2{s_0_3_1_3_reg[7]}}, s_0_3_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_3), .q(sum_0_3_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_0_3 (.i_data(sum_0_3_reg), .o_data(out_0_3_sat));


    // Layer 0, Node 4
      logic  [7:0] s_0_4_1_0, s_0_4_1_1, s_0_4_1_2;
    logic  [7:0] s_0_4_1_0_reg, s_0_4_1_1_reg, s_0_4_1_2_reg;
    logic [9:0] sum_0_4;
    logic [9:0] sum_0_4_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_0)) 
    rom_0_4_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_4_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_3)) 
    rom_0_4_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_4_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_4)) 
    rom_0_4_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_4_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_5)) 
    rom_0_4_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_4_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_6)) 
    rom_0_4_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_4_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_7)) 
    rom_0_4_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_4_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_8)) 
    rom_0_4_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_4_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_9)) 
    rom_0_4_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_4_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_10)) 
    rom_0_4_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_4_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_11)) 
    rom_0_4_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_4_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_12)) 
    rom_0_4_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_4_12));

  // Stage 1
    assign s_0_4_1_0 = {{2{acts_0_4_0[5]}}, acts_0_4_0} + {{2{acts_0_4_3[5]}}, acts_0_4_3} + {{2{acts_0_4_4[5]}}, acts_0_4_4} + {{2{acts_0_4_5[5]}}, acts_0_4_5};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_0), .q(s_0_4_1_0_reg));

    assign s_0_4_1_1 = {{2{acts_0_4_6[5]}}, acts_0_4_6} + {{2{acts_0_4_7[5]}}, acts_0_4_7} + {{2{acts_0_4_8[5]}}, acts_0_4_8} + {{2{acts_0_4_9[5]}}, acts_0_4_9};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_1), .q(s_0_4_1_1_reg));

    assign s_0_4_1_2 = {{2{acts_0_4_10[5]}}, acts_0_4_10} + {{2{acts_0_4_11[5]}}, acts_0_4_11} + {{2{acts_0_4_12[5]}}, acts_0_4_12};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_2), .q(s_0_4_1_2_reg));

  // Stage 2
    assign sum_0_4 = {{2{s_0_4_1_0_reg[7]}}, s_0_4_1_0_reg} + {{2{s_0_4_1_1_reg[7]}}, s_0_4_1_1_reg} + {{2{s_0_4_1_2_reg[7]}}, s_0_4_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_4), .q(sum_0_4_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_0_4 (.i_data(sum_0_4_reg), .o_data(out_0_4_sat));


    // Layer 0, Node 5
      logic  [7:0] s_0_5_1_0, s_0_5_1_1, s_0_5_1_2;
    logic  [7:0] s_0_5_1_0_reg, s_0_5_1_1_reg, s_0_5_1_2_reg;
    logic [9:0] sum_0_5;
    logic [9:0] sum_0_5_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_0)) 
    rom_0_5_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_5_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_1)) 
    rom_0_5_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_5_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_2)) 
    rom_0_5_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_5_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_3)) 
    rom_0_5_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_5_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_5)) 
    rom_0_5_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_5_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_6)) 
    rom_0_5_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_5_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_7)) 
    rom_0_5_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_5_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_8)) 
    rom_0_5_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_5_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_9)) 
    rom_0_5_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_5_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_10)) 
    rom_0_5_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_5_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_11)) 
    rom_0_5_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_5_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_12)) 
    rom_0_5_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_5_12));

  // Stage 1
    assign s_0_5_1_0 = {{2{acts_0_5_0[5]}}, acts_0_5_0} + {{2{acts_0_5_1[5]}}, acts_0_5_1} + {{2{acts_0_5_2[5]}}, acts_0_5_2} + {{2{acts_0_5_3[5]}}, acts_0_5_3};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_0), .q(s_0_5_1_0_reg));

    assign s_0_5_1_1 = {{2{acts_0_5_5[5]}}, acts_0_5_5} + {{2{acts_0_5_6[5]}}, acts_0_5_6} + {{2{acts_0_5_7[5]}}, acts_0_5_7} + {{2{acts_0_5_8[5]}}, acts_0_5_8};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_1), .q(s_0_5_1_1_reg));

    assign s_0_5_1_2 = {{2{acts_0_5_9[5]}}, acts_0_5_9} + {{2{acts_0_5_10[5]}}, acts_0_5_10} + {{2{acts_0_5_11[5]}}, acts_0_5_11} + {{2{acts_0_5_12[5]}}, acts_0_5_12};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_2), .q(s_0_5_1_2_reg));

  // Stage 2
    assign sum_0_5 = {{2{s_0_5_1_0_reg[7]}}, s_0_5_1_0_reg} + {{2{s_0_5_1_1_reg[7]}}, s_0_5_1_1_reg} + {{2{s_0_5_1_2_reg[7]}}, s_0_5_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_5), .q(sum_0_5_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_0_5 (.i_data(sum_0_5_reg), .o_data(out_0_5_sat));


    // Layer 0, Node 6
      logic  [7:0] s_0_6_1_0, s_0_6_1_1, s_0_6_1_2;
    logic  [7:0] s_0_6_1_0_reg, s_0_6_1_1_reg, s_0_6_1_2_reg;
    logic [9:0] sum_0_6;
    logic [9:0] sum_0_6_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_0)) 
    rom_0_6_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_6_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_1)) 
    rom_0_6_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_6_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_2)) 
    rom_0_6_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_6_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_3)) 
    rom_0_6_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_6_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_4)) 
    rom_0_6_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_6_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_5)) 
    rom_0_6_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_6_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_6)) 
    rom_0_6_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_6_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_8)) 
    rom_0_6_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_6_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_9)) 
    rom_0_6_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_6_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_10)) 
    rom_0_6_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_6_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_11)) 
    rom_0_6_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_6_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_12)) 
    rom_0_6_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_6_12));

  // Stage 1
    assign s_0_6_1_0 = {{2{acts_0_6_0[5]}}, acts_0_6_0} + {{2{acts_0_6_1[5]}}, acts_0_6_1} + {{2{acts_0_6_2[5]}}, acts_0_6_2} + {{2{acts_0_6_3[5]}}, acts_0_6_3};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_0), .q(s_0_6_1_0_reg));

    assign s_0_6_1_1 = {{2{acts_0_6_4[5]}}, acts_0_6_4} + {{2{acts_0_6_5[5]}}, acts_0_6_5} + {{2{acts_0_6_6[5]}}, acts_0_6_6} + {{2{acts_0_6_8[5]}}, acts_0_6_8};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_1), .q(s_0_6_1_1_reg));

    assign s_0_6_1_2 = {{2{acts_0_6_9[5]}}, acts_0_6_9} + {{2{acts_0_6_10[5]}}, acts_0_6_10} + {{2{acts_0_6_11[5]}}, acts_0_6_11} + {{2{acts_0_6_12[5]}}, acts_0_6_12};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_2), .q(s_0_6_1_2_reg));

  // Stage 2
    assign sum_0_6 = {{2{s_0_6_1_0_reg[7]}}, s_0_6_1_0_reg} + {{2{s_0_6_1_1_reg[7]}}, s_0_6_1_1_reg} + {{2{s_0_6_1_2_reg[7]}}, s_0_6_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_6), .q(sum_0_6_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_0_6 (.i_data(sum_0_6_reg), .o_data(out_0_6_sat));


    // Layer 0, Node 7
      logic  [7:0] s_0_7_1_0, s_0_7_1_1, s_0_7_1_2;
    logic  [7:0] s_0_7_1_0_reg, s_0_7_1_1_reg, s_0_7_1_2_reg;
    logic [9:0] sum_0_7;
    logic [9:0] sum_0_7_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_0)) 
    rom_0_7_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_7_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_1)) 
    rom_0_7_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_7_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_2)) 
    rom_0_7_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_7_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_3)) 
    rom_0_7_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_7_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_5)) 
    rom_0_7_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_7_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_6)) 
    rom_0_7_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_7_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_7)) 
    rom_0_7_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_7_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_8)) 
    rom_0_7_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_7_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_10)) 
    rom_0_7_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_7_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_11)) 
    rom_0_7_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_7_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_12)) 
    rom_0_7_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_7_12));

  // Stage 1
    assign s_0_7_1_0 = {{2{acts_0_7_0[5]}}, acts_0_7_0} + {{2{acts_0_7_1[5]}}, acts_0_7_1} + {{2{acts_0_7_2[5]}}, acts_0_7_2} + {{2{acts_0_7_3[5]}}, acts_0_7_3};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_0), .q(s_0_7_1_0_reg));

    assign s_0_7_1_1 = {{2{acts_0_7_5[5]}}, acts_0_7_5} + {{2{acts_0_7_6[5]}}, acts_0_7_6} + {{2{acts_0_7_7[5]}}, acts_0_7_7} + {{2{acts_0_7_8[5]}}, acts_0_7_8};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_1), .q(s_0_7_1_1_reg));

    assign s_0_7_1_2 = {{2{acts_0_7_10[5]}}, acts_0_7_10} + {{2{acts_0_7_11[5]}}, acts_0_7_11} + {{2{acts_0_7_12[5]}}, acts_0_7_12};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_2), .q(s_0_7_1_2_reg));

  // Stage 2
    assign sum_0_7 = {{2{s_0_7_1_0_reg[7]}}, s_0_7_1_0_reg} + {{2{s_0_7_1_1_reg[7]}}, s_0_7_1_1_reg} + {{2{s_0_7_1_2_reg[7]}}, s_0_7_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_7), .q(sum_0_7_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_0_7 (.i_data(sum_0_7_reg), .o_data(out_0_7_sat));


    // Layer 0, Node 8
      logic  [7:0] s_0_8_1_0, s_0_8_1_1, s_0_8_1_2, s_0_8_1_3;
    logic  [7:0] s_0_8_1_0_reg, s_0_8_1_1_reg, s_0_8_1_2_reg, s_0_8_1_3_reg;
    logic [9:0] sum_0_8;
    logic [9:0] sum_0_8_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_0)) 
    rom_0_8_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_8_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_1)) 
    rom_0_8_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_8_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_2)) 
    rom_0_8_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_8_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_3)) 
    rom_0_8_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_8_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_4)) 
    rom_0_8_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_8_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_5)) 
    rom_0_8_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_8_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_6)) 
    rom_0_8_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_8_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_7)) 
    rom_0_8_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_8_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_8)) 
    rom_0_8_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_8_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_9)) 
    rom_0_8_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_8_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_10)) 
    rom_0_8_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_8_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_11)) 
    rom_0_8_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_8_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_12)) 
    rom_0_8_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_8_12));

  // Stage 1
    assign s_0_8_1_0 = {{2{acts_0_8_0[5]}}, acts_0_8_0} + {{2{acts_0_8_1[5]}}, acts_0_8_1} + {{2{acts_0_8_2[5]}}, acts_0_8_2} + {{2{acts_0_8_3[5]}}, acts_0_8_3};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_0), .q(s_0_8_1_0_reg));

    assign s_0_8_1_1 = {{2{acts_0_8_4[5]}}, acts_0_8_4} + {{2{acts_0_8_5[5]}}, acts_0_8_5} + {{2{acts_0_8_6[5]}}, acts_0_8_6} + {{2{acts_0_8_7[5]}}, acts_0_8_7};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_1), .q(s_0_8_1_1_reg));

    assign s_0_8_1_2 = {{2{acts_0_8_8[5]}}, acts_0_8_8} + {{2{acts_0_8_9[5]}}, acts_0_8_9} + {{2{acts_0_8_10[5]}}, acts_0_8_10} + {{2{acts_0_8_11[5]}}, acts_0_8_11};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_2), .q(s_0_8_1_2_reg));

    assign s_0_8_1_3 = {{2{acts_0_8_12[5]}}, acts_0_8_12};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_3), .q(s_0_8_1_3_reg));

  // Stage 2
    assign sum_0_8 = {{2{s_0_8_1_0_reg[7]}}, s_0_8_1_0_reg} + {{2{s_0_8_1_1_reg[7]}}, s_0_8_1_1_reg} + {{2{s_0_8_1_2_reg[7]}}, s_0_8_1_2_reg} + {{2{s_0_8_1_3_reg[7]}}, s_0_8_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_8), .q(sum_0_8_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_0_8 (.i_data(sum_0_8_reg), .o_data(out_0_8_sat));


    // Layer 0, Node 9
      logic  [7:0] s_0_9_1_0, s_0_9_1_1, s_0_9_1_2;
    logic  [7:0] s_0_9_1_0_reg, s_0_9_1_1_reg, s_0_9_1_2_reg;
    logic [9:0] sum_0_9;
    logic [9:0] sum_0_9_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_0)) 
    rom_0_9_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_9_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_2)) 
    rom_0_9_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_9_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_3)) 
    rom_0_9_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_9_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_4)) 
    rom_0_9_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_9_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_6)) 
    rom_0_9_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_9_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_7)) 
    rom_0_9_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_9_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_8)) 
    rom_0_9_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_9_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_9)) 
    rom_0_9_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_9_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_10)) 
    rom_0_9_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_9_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_12)) 
    rom_0_9_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_9_12));

  // Stage 1
    assign s_0_9_1_0 = {{2{acts_0_9_0[5]}}, acts_0_9_0} + {{2{acts_0_9_2[5]}}, acts_0_9_2} + {{2{acts_0_9_3[5]}}, acts_0_9_3} + {{2{acts_0_9_4[5]}}, acts_0_9_4};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_0), .q(s_0_9_1_0_reg));

    assign s_0_9_1_1 = {{2{acts_0_9_6[5]}}, acts_0_9_6} + {{2{acts_0_9_7[5]}}, acts_0_9_7} + {{2{acts_0_9_8[5]}}, acts_0_9_8} + {{2{acts_0_9_9[5]}}, acts_0_9_9};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_1), .q(s_0_9_1_1_reg));

    assign s_0_9_1_2 = {{2{acts_0_9_10[5]}}, acts_0_9_10} + {{2{acts_0_9_12[5]}}, acts_0_9_12};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_2), .q(s_0_9_1_2_reg));

  // Stage 2
    assign sum_0_9 = {{2{s_0_9_1_0_reg[7]}}, s_0_9_1_0_reg} + {{2{s_0_9_1_1_reg[7]}}, s_0_9_1_1_reg} + {{2{s_0_9_1_2_reg[7]}}, s_0_9_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_9), .q(sum_0_9_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_0_9 (.i_data(sum_0_9_reg), .o_data(out_0_9_sat));


  registers #(.ARRAY_WIDTH(6)) node_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_0_sat), .q(out_0_0_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_1_sat), .q(out_0_1_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_2_sat), .q(out_0_2_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_3_sat), .q(out_0_3_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_4_sat), .q(out_0_4_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_5_sat), .q(out_0_5_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_6_sat), .q(out_0_6_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_7_sat), .q(out_0_7_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_8_sat), .q(out_0_8_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_9_sat), .q(out_0_9_reg));


    // Layer 1, Node 0
      logic  [7:0] s_1_0_1_0, s_1_0_1_1, s_1_0_1_2;
    logic  [7:0] s_1_0_1_0_reg, s_1_0_1_1_reg, s_1_0_1_2_reg;
    logic [9:0] sum_1_0;
    logic [9:0] sum_1_0_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_0)) 
    rom_1_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_0_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_1)) 
    rom_1_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_0_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_2)) 
    rom_1_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_0_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_3)) 
    rom_1_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_0_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_4)) 
    rom_1_0_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_0_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_5)) 
    rom_1_0_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_0_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_6)) 
    rom_1_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_0_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_7)) 
    rom_1_0_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_0_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_8)) 
    rom_1_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_0_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_9)) 
    rom_1_0_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_0_9));

  // Stage 1
    assign s_1_0_1_0 = {{2{acts_1_0_0[5]}}, acts_1_0_0} + {{2{acts_1_0_1[5]}}, acts_1_0_1} + {{2{acts_1_0_2[5]}}, acts_1_0_2} + {{2{acts_1_0_3[5]}}, acts_1_0_3};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_0), .q(s_1_0_1_0_reg));

    assign s_1_0_1_1 = {{2{acts_1_0_4[5]}}, acts_1_0_4} + {{2{acts_1_0_5[5]}}, acts_1_0_5} + {{2{acts_1_0_6[5]}}, acts_1_0_6} + {{2{acts_1_0_7[5]}}, acts_1_0_7};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_1), .q(s_1_0_1_1_reg));

    assign s_1_0_1_2 = {{2{acts_1_0_8[5]}}, acts_1_0_8} + {{2{acts_1_0_9[5]}}, acts_1_0_9};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_2), .q(s_1_0_1_2_reg));

  // Stage 2
    assign sum_1_0 = {{2{s_1_0_1_0_reg[7]}}, s_1_0_1_0_reg} + {{2{s_1_0_1_1_reg[7]}}, s_1_0_1_1_reg} + {{2{s_1_0_1_2_reg[7]}}, s_1_0_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_0), .q(sum_1_0_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_1_0 (.i_data(sum_1_0_reg), .o_data(o_vector[0]));


    // Layer 1, Node 1
      logic  [7:0] s_1_1_1_0, s_1_1_1_1, s_1_1_1_2;
    logic  [7:0] s_1_1_1_0_reg, s_1_1_1_1_reg, s_1_1_1_2_reg;
    logic [9:0] sum_1_1;
    logic [9:0] sum_1_1_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_0)) 
    rom_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_1_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_1)) 
    rom_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_1_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_2)) 
    rom_1_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_1_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_3)) 
    rom_1_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_1_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_4)) 
    rom_1_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_1_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_5)) 
    rom_1_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_1_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_6)) 
    rom_1_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_1_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_7)) 
    rom_1_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_1_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_8)) 
    rom_1_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_1_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_9)) 
    rom_1_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_1_9));

  // Stage 1
    assign s_1_1_1_0 = {{2{acts_1_1_0[5]}}, acts_1_1_0} + {{2{acts_1_1_1[5]}}, acts_1_1_1} + {{2{acts_1_1_2[5]}}, acts_1_1_2} + {{2{acts_1_1_3[5]}}, acts_1_1_3};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_0), .q(s_1_1_1_0_reg));

    assign s_1_1_1_1 = {{2{acts_1_1_4[5]}}, acts_1_1_4} + {{2{acts_1_1_5[5]}}, acts_1_1_5} + {{2{acts_1_1_6[5]}}, acts_1_1_6} + {{2{acts_1_1_7[5]}}, acts_1_1_7};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_1), .q(s_1_1_1_1_reg));

    assign s_1_1_1_2 = {{2{acts_1_1_8[5]}}, acts_1_1_8} + {{2{acts_1_1_9[5]}}, acts_1_1_9};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_2), .q(s_1_1_1_2_reg));

  // Stage 2
    assign sum_1_1 = {{2{s_1_1_1_0_reg[7]}}, s_1_1_1_0_reg} + {{2{s_1_1_1_1_reg[7]}}, s_1_1_1_1_reg} + {{2{s_1_1_1_2_reg[7]}}, s_1_1_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_1), .q(sum_1_1_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_1_1 (.i_data(sum_1_1_reg), .o_data(o_vector[1]));


    // Layer 1, Node 2
      logic  [7:0] s_1_2_1_0, s_1_2_1_1, s_1_2_1_2;
    logic  [7:0] s_1_2_1_0_reg, s_1_2_1_1_reg, s_1_2_1_2_reg;
    logic [9:0] sum_1_2;
    logic [9:0] sum_1_2_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_0)) 
    rom_1_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_2_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_1)) 
    rom_1_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_2_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_2)) 
    rom_1_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_2_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_3)) 
    rom_1_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_2_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_4)) 
    rom_1_2_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_2_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_5)) 
    rom_1_2_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_2_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_6)) 
    rom_1_2_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_2_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_7)) 
    rom_1_2_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_2_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_8)) 
    rom_1_2_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_2_8));

  // Stage 1
    assign s_1_2_1_0 = {{2{acts_1_2_0[5]}}, acts_1_2_0} + {{2{acts_1_2_1[5]}}, acts_1_2_1} + {{2{acts_1_2_2[5]}}, acts_1_2_2} + {{2{acts_1_2_3[5]}}, acts_1_2_3};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_0), .q(s_1_2_1_0_reg));

    assign s_1_2_1_1 = {{2{acts_1_2_4[5]}}, acts_1_2_4} + {{2{acts_1_2_5[5]}}, acts_1_2_5} + {{2{acts_1_2_6[5]}}, acts_1_2_6} + {{2{acts_1_2_7[5]}}, acts_1_2_7};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_1), .q(s_1_2_1_1_reg));

    assign s_1_2_1_2 = {{2{acts_1_2_8[5]}}, acts_1_2_8};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_2), .q(s_1_2_1_2_reg));

  // Stage 2
    assign sum_1_2 = {{2{s_1_2_1_0_reg[7]}}, s_1_2_1_0_reg} + {{2{s_1_2_1_1_reg[7]}}, s_1_2_1_1_reg} + {{2{s_1_2_1_2_reg[7]}}, s_1_2_1_2_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_2), .q(sum_1_2_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(6)) sat_1_2 (.i_data(sum_1_2_reg), .o_data(o_vector[2]));


endmodule