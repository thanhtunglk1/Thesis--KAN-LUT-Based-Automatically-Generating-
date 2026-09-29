module kan_argmax (
  input  logic i_clk,
  input  logic i_rst_n,
  input  logic i_en,

  input  logic signed [0:0][7:0] i_data,

  output logic [0:0] o_max_index,
  output logic signed [7:0] o_max_value
);



        // FINAL OUTPUT
  assign o_max_value = i_data[0];
  assign o_max_index = 1'd0;
    
endmodule
