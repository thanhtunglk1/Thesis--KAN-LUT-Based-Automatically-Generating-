module KAN #(
    parameter IN_FEATURES  = 13,
    parameter IN_WIDTH     = 6,
    parameter OUT_FEATURES = 3,
    parameter OUT_WIDTH    = 8
)(
    input  logic                                       i_clk   ,
    input  logic                                       i_rst_n ,
    input  logic                                       i_en    ,
    input  logic [IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] i_vector,
    output logic [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] o_vector
);
    // Signal declarations
    // Layer 0: 13 -> 4
    logic  [6:0] acts_0_0_0, acts_0_0_1, acts_0_0_2, acts_0_0_3, acts_0_0_4, acts_0_0_5, acts_0_0_6, acts_0_0_7, acts_0_0_8, acts_0_0_9, acts_0_0_10, acts_0_0_11, acts_0_0_12, acts_0_1_0, acts_0_1_1, acts_0_1_2;
    logic  [6:0] acts_0_1_3, acts_0_1_4, acts_0_1_5, acts_0_1_6, acts_0_1_7, acts_0_1_8, acts_0_1_9, acts_0_1_10, acts_0_1_11, acts_0_1_12, acts_0_2_0, acts_0_2_1, acts_0_2_2, acts_0_2_3, acts_0_2_4, acts_0_2_5;
    logic  [6:0] acts_0_2_6, acts_0_2_7, acts_0_2_8, acts_0_2_9, acts_0_2_10, acts_0_2_11, acts_0_2_12, acts_0_3_0, acts_0_3_1, acts_0_3_2, acts_0_3_3, acts_0_3_4, acts_0_3_5, acts_0_3_6, acts_0_3_7, acts_0_3_8;
    logic  [6:0] acts_0_3_9, acts_0_3_10, acts_0_3_11, acts_0_3_12;
    logic  [6:0] out_0_0_sat, out_0_1_sat, out_0_2_sat, out_0_3_sat;
    logic  [6:0] out_0_0_reg, out_0_1_reg, out_0_2_reg, out_0_3_reg;

// Layer 1: 4 -> 3
    logic  [7:0] acts_1_0_0, acts_1_0_1, acts_1_0_2, acts_1_0_3, acts_1_1_0, acts_1_1_1, acts_1_1_2, acts_1_1_3, acts_1_2_0, acts_1_2_1, acts_1_2_2, acts_1_2_3;

    // Auto layer blocks
        // Layer 0, Node 0
      logic  [8:0] s_0_0_1_0, s_0_0_1_1, s_0_0_1_2, s_0_0_1_3;
    logic  [8:0] s_0_0_1_0_reg, s_0_0_1_1_reg, s_0_0_1_2_reg, s_0_0_1_3_reg;
    logic [10:0] sum_0_0;
    logic [10:0] sum_0_0_reg;
  
    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_0.mem")) 
    rom_0_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_0_0));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_1.mem")) 
    rom_0_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_0_1));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_2.mem")) 
    rom_0_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_0_2));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_3.mem")) 
    rom_0_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_0_3));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_4.mem")) 
    rom_0_0_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_0_4));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_5.mem")) 
    rom_0_0_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_0_5));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_6.mem")) 
    rom_0_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_0_6));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_7.mem")) 
    rom_0_0_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_0_7));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_8.mem")) 
    rom_0_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_0_8));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_9.mem")) 
    rom_0_0_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_0_9));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_10.mem")) 
    rom_0_0_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_0_10));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_11.mem")) 
    rom_0_0_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_0_11));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_0_12.mem")) 
    rom_0_0_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_0_12));

  // Stage 1
    assign s_0_0_1_0 = {{2{acts_0_0_0[6]}}, acts_0_0_0} + {{2{acts_0_0_1[6]}}, acts_0_0_1} + {{2{acts_0_0_2[6]}}, acts_0_0_2} + {{2{acts_0_0_3[6]}}, acts_0_0_3};
    registers #(.ARRAY_WIDTH(9)) r_0_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_0), .q(s_0_0_1_0_reg));

    assign s_0_0_1_1 = {{2{acts_0_0_4[6]}}, acts_0_0_4} + {{2{acts_0_0_5[6]}}, acts_0_0_5} + {{2{acts_0_0_6[6]}}, acts_0_0_6} + {{2{acts_0_0_7[6]}}, acts_0_0_7};
    registers #(.ARRAY_WIDTH(9)) r_0_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_1), .q(s_0_0_1_1_reg));

    assign s_0_0_1_2 = {{2{acts_0_0_8[6]}}, acts_0_0_8} + {{2{acts_0_0_9[6]}}, acts_0_0_9} + {{2{acts_0_0_10[6]}}, acts_0_0_10} + {{2{acts_0_0_11[6]}}, acts_0_0_11};
    registers #(.ARRAY_WIDTH(9)) r_0_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_2), .q(s_0_0_1_2_reg));

    assign s_0_0_1_3 = {{2{acts_0_0_12[6]}}, acts_0_0_12};
    registers #(.ARRAY_WIDTH(9)) r_0_0_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_3), .q(s_0_0_1_3_reg));

  // Stage 2
    assign sum_0_0 = {{2{s_0_0_1_0_reg[6]}}, s_0_0_1_0_reg} + {{2{s_0_0_1_1_reg[6]}}, s_0_0_1_1_reg} + {{2{s_0_0_1_2_reg[6]}}, s_0_0_1_2_reg} + {{2{s_0_0_1_3_reg[6]}}, s_0_0_1_3_reg};
    registers #(.ARRAY_WIDTH(11)) r_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_0), .q(sum_0_0_reg));

    saturate_clip #(.IN_WIDTH(11), .OUT_WIDTH(7)) sat_0_0 (.i_data(sum_0_0_reg), .o_data(out_0_0_sat));


    // Layer 0, Node 1
      logic  [8:0] s_0_1_1_0, s_0_1_1_1, s_0_1_1_2, s_0_1_1_3;
    logic  [8:0] s_0_1_1_0_reg, s_0_1_1_1_reg, s_0_1_1_2_reg, s_0_1_1_3_reg;
    logic [10:0] sum_0_1;
    logic [10:0] sum_0_1_reg;
  
    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_0.mem")) 
    rom_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_1_0));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_1.mem")) 
    rom_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_1_1));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_2.mem")) 
    rom_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_1_2));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_3.mem")) 
    rom_0_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_1_3));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_4.mem")) 
    rom_0_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_1_4));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_5.mem")) 
    rom_0_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_1_5));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_6.mem")) 
    rom_0_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_1_6));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_7.mem")) 
    rom_0_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_1_7));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_8.mem")) 
    rom_0_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_1_8));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_9.mem")) 
    rom_0_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_1_9));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_10.mem")) 
    rom_0_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_1_10));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_11.mem")) 
    rom_0_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_1_11));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_1_12.mem")) 
    rom_0_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_1_12));

  // Stage 1
    assign s_0_1_1_0 = {{2{acts_0_1_0[6]}}, acts_0_1_0} + {{2{acts_0_1_1[6]}}, acts_0_1_1} + {{2{acts_0_1_2[6]}}, acts_0_1_2} + {{2{acts_0_1_3[6]}}, acts_0_1_3};
    registers #(.ARRAY_WIDTH(9)) r_0_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_0), .q(s_0_1_1_0_reg));

    assign s_0_1_1_1 = {{2{acts_0_1_4[6]}}, acts_0_1_4} + {{2{acts_0_1_5[6]}}, acts_0_1_5} + {{2{acts_0_1_6[6]}}, acts_0_1_6} + {{2{acts_0_1_7[6]}}, acts_0_1_7};
    registers #(.ARRAY_WIDTH(9)) r_0_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_1), .q(s_0_1_1_1_reg));

    assign s_0_1_1_2 = {{2{acts_0_1_8[6]}}, acts_0_1_8} + {{2{acts_0_1_9[6]}}, acts_0_1_9} + {{2{acts_0_1_10[6]}}, acts_0_1_10} + {{2{acts_0_1_11[6]}}, acts_0_1_11};
    registers #(.ARRAY_WIDTH(9)) r_0_1_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_2), .q(s_0_1_1_2_reg));

    assign s_0_1_1_3 = {{2{acts_0_1_12[6]}}, acts_0_1_12};
    registers #(.ARRAY_WIDTH(9)) r_0_1_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_3), .q(s_0_1_1_3_reg));

  // Stage 2
    assign sum_0_1 = {{2{s_0_1_1_0_reg[6]}}, s_0_1_1_0_reg} + {{2{s_0_1_1_1_reg[6]}}, s_0_1_1_1_reg} + {{2{s_0_1_1_2_reg[6]}}, s_0_1_1_2_reg} + {{2{s_0_1_1_3_reg[6]}}, s_0_1_1_3_reg};
    registers #(.ARRAY_WIDTH(11)) r_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_1), .q(sum_0_1_reg));

    saturate_clip #(.IN_WIDTH(11), .OUT_WIDTH(7)) sat_0_1 (.i_data(sum_0_1_reg), .o_data(out_0_1_sat));


    // Layer 0, Node 2
      logic  [8:0] s_0_2_1_0, s_0_2_1_1, s_0_2_1_2, s_0_2_1_3;
    logic  [8:0] s_0_2_1_0_reg, s_0_2_1_1_reg, s_0_2_1_2_reg, s_0_2_1_3_reg;
    logic [10:0] sum_0_2;
    logic [10:0] sum_0_2_reg;
  
    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_0.mem")) 
    rom_0_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_2_0));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_1.mem")) 
    rom_0_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_2_1));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_2.mem")) 
    rom_0_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_2_2));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_3.mem")) 
    rom_0_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_2_3));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_4.mem")) 
    rom_0_2_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_2_4));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_5.mem")) 
    rom_0_2_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_2_5));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_6.mem")) 
    rom_0_2_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_2_6));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_7.mem")) 
    rom_0_2_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_2_7));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_8.mem")) 
    rom_0_2_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_2_8));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_9.mem")) 
    rom_0_2_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_2_9));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_10.mem")) 
    rom_0_2_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_2_10));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_11.mem")) 
    rom_0_2_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_2_11));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_2_12.mem")) 
    rom_0_2_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_2_12));

  // Stage 1
    assign s_0_2_1_0 = {{2{acts_0_2_0[6]}}, acts_0_2_0} + {{2{acts_0_2_1[6]}}, acts_0_2_1} + {{2{acts_0_2_2[6]}}, acts_0_2_2} + {{2{acts_0_2_3[6]}}, acts_0_2_3};
    registers #(.ARRAY_WIDTH(9)) r_0_2_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_0), .q(s_0_2_1_0_reg));

    assign s_0_2_1_1 = {{2{acts_0_2_4[6]}}, acts_0_2_4} + {{2{acts_0_2_5[6]}}, acts_0_2_5} + {{2{acts_0_2_6[6]}}, acts_0_2_6} + {{2{acts_0_2_7[6]}}, acts_0_2_7};
    registers #(.ARRAY_WIDTH(9)) r_0_2_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_1), .q(s_0_2_1_1_reg));

    assign s_0_2_1_2 = {{2{acts_0_2_8[6]}}, acts_0_2_8} + {{2{acts_0_2_9[6]}}, acts_0_2_9} + {{2{acts_0_2_10[6]}}, acts_0_2_10} + {{2{acts_0_2_11[6]}}, acts_0_2_11};
    registers #(.ARRAY_WIDTH(9)) r_0_2_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_2), .q(s_0_2_1_2_reg));

    assign s_0_2_1_3 = {{2{acts_0_2_12[6]}}, acts_0_2_12};
    registers #(.ARRAY_WIDTH(9)) r_0_2_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_3), .q(s_0_2_1_3_reg));

  // Stage 2
    assign sum_0_2 = {{2{s_0_2_1_0_reg[6]}}, s_0_2_1_0_reg} + {{2{s_0_2_1_1_reg[6]}}, s_0_2_1_1_reg} + {{2{s_0_2_1_2_reg[6]}}, s_0_2_1_2_reg} + {{2{s_0_2_1_3_reg[6]}}, s_0_2_1_3_reg};
    registers #(.ARRAY_WIDTH(11)) r_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_2), .q(sum_0_2_reg));

    saturate_clip #(.IN_WIDTH(11), .OUT_WIDTH(7)) sat_0_2 (.i_data(sum_0_2_reg), .o_data(out_0_2_sat));


    // Layer 0, Node 3
      logic  [8:0] s_0_3_1_0, s_0_3_1_1, s_0_3_1_2, s_0_3_1_3;
    logic  [8:0] s_0_3_1_0_reg, s_0_3_1_1_reg, s_0_3_1_2_reg, s_0_3_1_3_reg;
    logic [10:0] sum_0_3;
    logic [10:0] sum_0_3_reg;
  
    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_0.mem")) 
    rom_0_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_3_0));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_1.mem")) 
    rom_0_3_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_3_1));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_2.mem")) 
    rom_0_3_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_3_2));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_3.mem")) 
    rom_0_3_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_3_3));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_4.mem")) 
    rom_0_3_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_3_4));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_5.mem")) 
    rom_0_3_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_3_5));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_6.mem")) 
    rom_0_3_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_3_6));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_7.mem")) 
    rom_0_3_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_3_7));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_8.mem")) 
    rom_0_3_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_3_8));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_9.mem")) 
    rom_0_3_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_3_9));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_10.mem")) 
    rom_0_3_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_3_10));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_11.mem")) 
    rom_0_3_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_3_11));

    lut_rom #(.DATA_WIDTH(7), .ADDR_WIDTH(6), .HEX_LINK("../mem/lut_0_3_12.mem")) 
    rom_0_3_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_3_12));

  // Stage 1
    assign s_0_3_1_0 = {{2{acts_0_3_0[6]}}, acts_0_3_0} + {{2{acts_0_3_1[6]}}, acts_0_3_1} + {{2{acts_0_3_2[6]}}, acts_0_3_2} + {{2{acts_0_3_3[6]}}, acts_0_3_3};
    registers #(.ARRAY_WIDTH(9)) r_0_3_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_0), .q(s_0_3_1_0_reg));

    assign s_0_3_1_1 = {{2{acts_0_3_4[6]}}, acts_0_3_4} + {{2{acts_0_3_5[6]}}, acts_0_3_5} + {{2{acts_0_3_6[6]}}, acts_0_3_6} + {{2{acts_0_3_7[6]}}, acts_0_3_7};
    registers #(.ARRAY_WIDTH(9)) r_0_3_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_1), .q(s_0_3_1_1_reg));

    assign s_0_3_1_2 = {{2{acts_0_3_8[6]}}, acts_0_3_8} + {{2{acts_0_3_9[6]}}, acts_0_3_9} + {{2{acts_0_3_10[6]}}, acts_0_3_10} + {{2{acts_0_3_11[6]}}, acts_0_3_11};
    registers #(.ARRAY_WIDTH(9)) r_0_3_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_2), .q(s_0_3_1_2_reg));

    assign s_0_3_1_3 = {{2{acts_0_3_12[6]}}, acts_0_3_12};
    registers #(.ARRAY_WIDTH(9)) r_0_3_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_3), .q(s_0_3_1_3_reg));

  // Stage 2
    assign sum_0_3 = {{2{s_0_3_1_0_reg[6]}}, s_0_3_1_0_reg} + {{2{s_0_3_1_1_reg[6]}}, s_0_3_1_1_reg} + {{2{s_0_3_1_2_reg[6]}}, s_0_3_1_2_reg} + {{2{s_0_3_1_3_reg[6]}}, s_0_3_1_3_reg};
    registers #(.ARRAY_WIDTH(11)) r_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_3), .q(sum_0_3_reg));

    saturate_clip #(.IN_WIDTH(11), .OUT_WIDTH(7)) sat_0_3 (.i_data(sum_0_3_reg), .o_data(out_0_3_sat));


  registers #(.ARRAY_WIDTH(7)) node_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_0_sat), .q(out_0_0_reg));

    registers #(.ARRAY_WIDTH(7)) node_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_1_sat), .q(out_0_1_reg));

    registers #(.ARRAY_WIDTH(7)) node_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_2_sat), .q(out_0_2_reg));

    registers #(.ARRAY_WIDTH(7)) node_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_3_sat), .q(out_0_3_reg));


    // Layer 1, Node 0
      logic [9:0] sum_1_0;
    logic [9:0] sum_1_0_reg;
  
    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_0_0.mem")) 
    rom_1_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_0_0));

    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_0_1.mem")) 
    rom_1_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_0_1));

    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_0_2.mem")) 
    rom_1_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_0_2));

    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_0_3.mem")) 
    rom_1_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_0_3));

  // Stage 1
    assign sum_1_0 = {{2{acts_1_0_0[7]}}, acts_1_0_0} + {{2{acts_1_0_1[7]}}, acts_1_0_1} + {{2{acts_1_0_2[7]}}, acts_1_0_2} + {{2{acts_1_0_3[7]}}, acts_1_0_3};
    registers #(.ARRAY_WIDTH(10)) r_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_0), .q(sum_1_0_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(8)) sat_1_0 (.i_data(sum_1_0_reg), .o_data(o_vector[0]));


    // Layer 1, Node 1
      logic [9:0] sum_1_1;
    logic [9:0] sum_1_1_reg;
  
    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_1_0.mem")) 
    rom_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_1_0));

    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_1_1.mem")) 
    rom_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_1_1));

    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_1_2.mem")) 
    rom_1_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_1_2));

    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_1_3.mem")) 
    rom_1_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_1_3));

  // Stage 1
    assign sum_1_1 = {{2{acts_1_1_0[7]}}, acts_1_1_0} + {{2{acts_1_1_1[7]}}, acts_1_1_1} + {{2{acts_1_1_2[7]}}, acts_1_1_2} + {{2{acts_1_1_3[7]}}, acts_1_1_3};
    registers #(.ARRAY_WIDTH(10)) r_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_1), .q(sum_1_1_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(8)) sat_1_1 (.i_data(sum_1_1_reg), .o_data(o_vector[1]));


    // Layer 1, Node 2
      logic [9:0] sum_1_2;
    logic [9:0] sum_1_2_reg;
  
    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_2_0.mem")) 
    rom_1_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_2_0));

    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_2_1.mem")) 
    rom_1_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_2_1));

    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_2_2.mem")) 
    rom_1_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_2_2));

    lut_rom #(.DATA_WIDTH(8), .ADDR_WIDTH(7), .HEX_LINK("../mem/lut_1_2_3.mem")) 
    rom_1_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_2_3));

  // Stage 1
    assign sum_1_2 = {{2{acts_1_2_0[7]}}, acts_1_2_0} + {{2{acts_1_2_1[7]}}, acts_1_2_1} + {{2{acts_1_2_2[7]}}, acts_1_2_2} + {{2{acts_1_2_3[7]}}, acts_1_2_3};
    registers #(.ARRAY_WIDTH(10)) r_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_2), .q(sum_1_2_reg));

    saturate_clip #(.IN_WIDTH(10), .OUT_WIDTH(8)) sat_1_2 (.i_data(sum_1_2_reg), .o_data(o_vector[2]));


endmodule