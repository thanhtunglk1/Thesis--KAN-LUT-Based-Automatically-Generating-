module baud_gen #(
  parameter BAUD_WIDTH   = 24 // 3 byte
)(
  input  logic i_clk,
  input  logic i_rst_n,
  input  logic [BAUD_WIDTH - 1 : 0] i_brd_value,
  output logic o_baud
); 

  logic tick;
  logic [BAUD_WIDTH - 1:0] p_brd_count, n_brd_count;

  assign n_brd_count = tick ? '0 : (p_brd_count + 1);
  assign tick = (p_brd_count == i_brd_value);

  always_ff @(posedge i_clk, negedge i_rst_n) begin: proc_devider_update
    if(~i_rst_n) p_brd_count  <= '0;
    else         p_brd_count  <= n_brd_count;
  end

  assign o_baud = tick;
  
endmodule