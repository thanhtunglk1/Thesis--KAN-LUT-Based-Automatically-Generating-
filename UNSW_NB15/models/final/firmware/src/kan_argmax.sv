module kan_argmax (
  input logic i_clk,
  input logic i_rst_n,
  input logic i_en,
  input logic signed [9:0][5:0] i_data,
  output logic [3:0] o_max_index,
  output logic signed [5:0] o_max_value
);


  // PIPELINE STAGE 0
  // levels 0 -> 2
  logic cmp_s0_l0_0_sel;
  logic [5:0] cmp_s0_l0_0_val;
  logic [3:0] cmp_s0_l0_0_idx;
  logic cmp_s0_l0_1_sel;
  logic [5:0] cmp_s0_l0_1_val;
  logic [3:0] cmp_s0_l0_1_idx;
  logic cmp_s0_l0_2_sel;
  logic [5:0] cmp_s0_l0_2_val;
  logic [3:0] cmp_s0_l0_2_idx;
  logic cmp_s0_l0_3_sel;
  logic [5:0] cmp_s0_l0_3_val;
  logic [3:0] cmp_s0_l0_3_idx;
  logic cmp_s0_l0_4_sel;
  logic [5:0] cmp_s0_l0_4_val;
  logic [3:0] cmp_s0_l0_4_idx;
  logic cmp_s0_l1_0_sel;
  logic [5:0] cmp_s0_l1_0_val;
  logic [3:0] cmp_s0_l1_0_idx;
  logic cmp_s0_l1_1_sel;
  logic [5:0] cmp_s0_l1_1_val;
  logic [3:0] cmp_s0_l1_1_idx;
  logic [5:0] pass_s0_l1_2_val;
  logic [3:0] pass_s0_l1_2_idx;
  logic signed [5:0] r_s0_v0;
  logic [3:0] r_s0_i0;
  logic signed [5:0] r_s0_v1;
  logic [3:0] r_s0_i1;
  logic signed [5:0] r_s0_v2;
  logic [3:0] r_s0_i2;

  // PIPELINE STAGE 1
  // levels 2 -> 4
  logic cmp_s1_l2_0_sel;
  logic [5:0] cmp_s1_l2_0_val;
  logic [3:0] cmp_s1_l2_0_idx;
  logic [5:0] pass_s1_l2_1_val;
  logic [3:0] pass_s1_l2_1_idx;
  logic cmp_s1_l3_0_sel;
  logic [5:0] cmp_s1_l3_0_val;
  logic [3:0] cmp_s1_l3_0_idx;
  logic signed [5:0] r_s1_v0;
  logic [3:0] r_s1_i0;
  // Stage 0, Level 0, Comparator 0
  gte_comp_sign #(.BEHAVIOR(1), .WIDTH(6)) comp_0_0_0 (.i_a(i_data[0]), .i_b(i_data[1]), .o_gte(cmp_s0_l0_0_sel));
  assign cmp_s0_l0_0_val = cmp_s0_l0_0_sel ? i_data[0] : i_data[1];
  assign cmp_s0_l0_0_idx = cmp_s0_l0_0_sel ? 4'd0 : 4'd1;
  // Stage 0, Level 0, Comparator 1
  gte_comp_sign #(.BEHAVIOR(1), .WIDTH(6)) comp_0_0_1 (.i_a(i_data[2]), .i_b(i_data[3]), .o_gte(cmp_s0_l0_1_sel));
  assign cmp_s0_l0_1_val = cmp_s0_l0_1_sel ? i_data[2] : i_data[3];
  assign cmp_s0_l0_1_idx = cmp_s0_l0_1_sel ? 4'd2 : 4'd3;
  // Stage 0, Level 0, Comparator 2
  gte_comp_sign #(.BEHAVIOR(1), .WIDTH(6)) comp_0_0_2 (.i_a(i_data[4]), .i_b(i_data[5]), .o_gte(cmp_s0_l0_2_sel));
  assign cmp_s0_l0_2_val = cmp_s0_l0_2_sel ? i_data[4] : i_data[5];
  assign cmp_s0_l0_2_idx = cmp_s0_l0_2_sel ? 4'd4 : 4'd5;
  // Stage 0, Level 0, Comparator 3
  gte_comp_sign #(.BEHAVIOR(1), .WIDTH(6)) comp_0_0_3 (.i_a(i_data[6]), .i_b(i_data[7]), .o_gte(cmp_s0_l0_3_sel));
  assign cmp_s0_l0_3_val = cmp_s0_l0_3_sel ? i_data[6] : i_data[7];
  assign cmp_s0_l0_3_idx = cmp_s0_l0_3_sel ? 4'd6 : 4'd7;
  // Stage 0, Level 0, Comparator 4
  gte_comp_sign #(.BEHAVIOR(1), .WIDTH(6)) comp_0_0_4 (.i_a(i_data[8]), .i_b(i_data[9]), .o_gte(cmp_s0_l0_4_sel));
  assign cmp_s0_l0_4_val = cmp_s0_l0_4_sel ? i_data[8] : i_data[9];
  assign cmp_s0_l0_4_idx = cmp_s0_l0_4_sel ? 4'd8 : 4'd9;
  // Stage 0, Level 1, Comparator 0
  gte_comp_sign #(.BEHAVIOR(1), .WIDTH(6)) comp_0_1_0 (.i_a(cmp_s0_l0_0_val), .i_b(cmp_s0_l0_1_val), .o_gte(cmp_s0_l1_0_sel));
  assign cmp_s0_l1_0_val = cmp_s0_l1_0_sel ? cmp_s0_l0_0_val : cmp_s0_l0_1_val;
  assign cmp_s0_l1_0_idx = cmp_s0_l1_0_sel ? cmp_s0_l0_0_idx : cmp_s0_l0_1_idx;
  // Stage 0, Level 1, Comparator 1
  gte_comp_sign #(.BEHAVIOR(1), .WIDTH(6)) comp_0_1_1 (.i_a(cmp_s0_l0_2_val), .i_b(cmp_s0_l0_3_val), .o_gte(cmp_s0_l1_1_sel));
  assign cmp_s0_l1_1_val = cmp_s0_l1_1_sel ? cmp_s0_l0_2_val : cmp_s0_l0_3_val;
  assign cmp_s0_l1_1_idx = cmp_s0_l1_1_sel ? cmp_s0_l0_2_idx : cmp_s0_l0_3_idx;
  // Stage 0, Level 1, Pass node 2
  assign pass_s0_l1_2_val = cmp_s0_l0_4_val;
  assign pass_s0_l1_2_idx = cmp_s0_l0_4_idx;

  registers #(.ARRAY_WIDTH(6)) r_s0_v0_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s0_l1_0_val), .q(r_s0_v0));

  registers #(.ARRAY_WIDTH(4)) r_s0_i0_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s0_l1_0_idx), .q(r_s0_i0));
  registers #(.ARRAY_WIDTH(6)) r_s0_v1_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s0_l1_1_val), .q(r_s0_v1));

  registers #(.ARRAY_WIDTH(4)) r_s0_i1_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s0_l1_1_idx), .q(r_s0_i1));
  registers #(.ARRAY_WIDTH(6)) r_s0_v2_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(pass_s0_l1_2_val), .q(r_s0_v2));

  registers #(.ARRAY_WIDTH(4)) r_s0_i2_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(pass_s0_l1_2_idx), .q(r_s0_i2));
  // Stage 1, Level 2, Comparator 0
  gte_comp_sign #(.BEHAVIOR(1), .WIDTH(6)) comp_1_2_0 (.i_a(r_s0_v0), .i_b(r_s0_v1), .o_gte(cmp_s1_l2_0_sel));
  assign cmp_s1_l2_0_val = cmp_s1_l2_0_sel ? r_s0_v0 : r_s0_v1;
  assign cmp_s1_l2_0_idx = cmp_s1_l2_0_sel ? r_s0_i0 : r_s0_i1;
  // Stage 1, Level 2, Pass node 1
  assign pass_s1_l2_1_val = r_s0_v2;
  assign pass_s1_l2_1_idx = r_s0_i2;

  // Stage 1, Level 3, Comparator 0
  gte_comp_sign #(.BEHAVIOR(1), .WIDTH(6)) comp_1_3_0 (.i_a(cmp_s1_l2_0_val), .i_b(pass_s1_l2_1_val), .o_gte(cmp_s1_l3_0_sel));
  assign cmp_s1_l3_0_val = cmp_s1_l3_0_sel ? cmp_s1_l2_0_val : pass_s1_l2_1_val;
  assign cmp_s1_l3_0_idx = cmp_s1_l3_0_sel ? cmp_s1_l2_0_idx : pass_s1_l2_1_idx;
  registers #(.ARRAY_WIDTH(6)) r_s1_v0_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s1_l3_0_val), .q(r_s1_v0));

  registers #(.ARRAY_WIDTH(4)) r_s1_i0_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s1_l3_0_idx), .q(r_s1_i0));
  // FINAL OUTPUT
  assign o_max_value = r_s1_v0;
  assign o_max_index = r_s1_i0;


endmodule
