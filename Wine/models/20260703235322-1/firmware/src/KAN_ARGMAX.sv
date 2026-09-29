module kan_argmax (
  input  logic i_clk,
  input  logic i_rst_n,
  input  logic i_en,

  input  logic signed [2:0][7:0] i_data,

  output logic [1:0] o_max_index,
  output logic signed [7:0] o_max_value
);


  // PIPELINE STAGE 0
  // levels 0 -> 2
  logic cmp_s0_l0_0_sel;
  logic signed [7:0] cmp_s0_l0_0_val;
  logic [1:0] cmp_s0_l0_0_idx;
  logic cmp_s0_l1_0_sel;
  logic signed [7:0] cmp_s0_l1_0_val;
  logic [1:0] cmp_s0_l1_0_idx;
  logic signed [7:0] r_s0_v0;
  logic [1:0] r_s0_i0;

  // Stage 0, Level 0, Comparator 0
  assign cmp_s0_l0_0_sel = i_data[0] >= i_data[1];
  assign cmp_s0_l0_0_val = cmp_s0_l0_0_sel ? i_data[0] : i_data[1];
  assign cmp_s0_l0_0_idx = cmp_s0_l0_0_sel ? 2'd0 : 2'd1;
                

  // Stage 0, Level 1, Comparator 0
  assign cmp_s0_l1_0_sel = cmp_s0_l0_0_val >= i_data[2];
  assign cmp_s0_l1_0_val = cmp_s0_l1_0_sel ? cmp_s0_l0_0_val : i_data[2];
  assign cmp_s0_l1_0_idx = cmp_s0_l1_0_sel ? cmp_s0_l0_0_idx : 2'd2;
                

  registers #(.ARRAY_WIDTH(8)) r_s0_v0_u (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s0_l1_0_val), .q(r_s0_v0));

  registers #(.ARRAY_WIDTH(2)) r_s0_i0_u (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(cmp_s0_l1_0_idx), .q(r_s0_i0));

        // FINAL OUTPUT
  assign o_max_value = r_s0_v0;
  assign o_max_index = r_s0_i0;
    
endmodule
