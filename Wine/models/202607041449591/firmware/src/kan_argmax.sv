module kan_argmax (

  input logic i_clk,
  input logic i_rst_n,
  input logic i_en,
  input logic signed [2:0][5:0] i_data,
  output logic [1:0] o_max_index,
  output logic signed [5:0] o_max_value
);


  // PIPELINE STAGE 0
  // levels 0 -> 1
  logic cmp_s0_l0_0_sel;
  logic signed [5:0] cmp_s0_l0_0_val;
  logic [1:0] cmp_s0_l0_0_idx;
  logic signed [5:0] pass_s0_l0_1_val;
  logic [1:0] pass_s0_l0_1_idx;
  logic signed [5:0] r_s0_v0;
  logic [1:0] r_s0_i0;
  logic signed [5:0] r_s0_v1;
  logic [1:0] r_s0_i1;

  // PIPELINE STAGE 1
  // levels 1 -> 2
  logic cmp_s1_l1_0_sel;
  logic signed [5:0] cmp_s1_l1_0_val;
  logic [1:0] cmp_s1_l1_0_idx;
  logic signed [5:0] r_s1_v0;
  logic [1:0] r_s1_i0;

  // Stage 0, Level 0, Comparator 0
  //assign cmp_s0_l0_0_sel = ($signed(i_data[0]) >= $signed(i_data[1]));
  gte_comp_sign #(.WIDTH(6)) comp_0_0_0 (.i_a(i_data[0]), .i_b(i_data[1]), .o_gte(cmp_s0_l0_0_sel));

  assign cmp_s0_l0_0_val = cmp_s0_l0_0_sel ? i_data[0] : i_data[1];
  assign cmp_s0_l0_0_idx = cmp_s0_l0_0_sel ? 2'd0 : 2'd1;

  // Stage 0, Level 0, Pass node 1
  assign pass_s0_l0_1_val = i_data[2];
  assign pass_s0_l0_1_idx = 2'd2;

  registers #(.ARRAY_WIDTH(6)) r_s0_v0_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s0_l0_0_val), .q(r_s0_v0));

  registers #(.ARRAY_WIDTH(2)) r_s0_i0_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s0_l0_0_idx), .q(r_s0_i0));

  registers #(.ARRAY_WIDTH(6)) r_s0_v1_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(pass_s0_l0_1_val), .q(r_s0_v1));

  registers #(.ARRAY_WIDTH(2)) r_s0_i1_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(pass_s0_l0_1_idx), .q(r_s0_i1));

  // Stage 1, Level 1, Comparator 0
  //assign cmp_s1_l1_0_sel = ($signed(r_s0_v0) >= $signed(r_s0_v1));
  gte_comp_sign #(.WIDTH(6)) comp_1_1_0 (.i_a(r_s0_v0), .i_b(r_s0_v1), .o_gte(cmp_s1_l1_0_sel));

  assign cmp_s1_l1_0_val = cmp_s1_l1_0_sel ? r_s0_v0 : r_s0_v1;
  assign cmp_s1_l1_0_idx = cmp_s1_l1_0_sel ? r_s0_i0 : r_s0_i1;

  registers #(.ARRAY_WIDTH(6)) r_s1_v0_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s1_l1_0_val), .q(r_s1_v0));

  registers #(.ARRAY_WIDTH(2)) r_s1_i0_u ( .i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s1_l1_0_idx), .q(r_s1_i0));

  // FINAL OUTPUT
  assign o_max_value = r_s1_v0;
  assign o_max_index = r_s1_i0;


endmodule
