module syn_fifo #(

  parameter DEPTH = 16,
  parameter WIDTH = 8

)(
//GLOBAL  
  input  logic i_clk,
  input  logic i_rst_n,

//CONTROL SIGNAL
  input  logic i_wr_en,
  input  logic i_rd_en,

//IN_OUT DATA
  input  logic [WIDTH - 1:0] i_data_in,
  output logic [WIDTH - 1:0] o_data_out,

//STATUS
  output logic o_full,
  output logic o_empty

);

  localparam ADDR_WIDTH = $clog2(DEPTH);

//POINTER
  logic [ADDR_WIDTH:0] p_rd_ptr, n_rd_ptr;
  logic [ADDR_WIDTH:0] p_wr_ptr, n_wr_ptr;

//----------------------------------------------------------------------------

  logic update_wr_ptr, update_rd_ptr;
  assign update_wr_ptr = ~o_full  & i_wr_en;
  assign update_rd_ptr = ~o_empty & i_rd_en;

  always_ff @(posedge i_clk, negedge i_rst_n) begin: proc_update_ptr

    if(~i_rst_n) begin
      p_rd_ptr <= '0;
      p_wr_ptr <= '0;
    end
    
    else begin
      p_rd_ptr <= n_rd_ptr;
      p_wr_ptr <= n_wr_ptr;
    end

  end

  assign o_full  = (p_rd_ptr[ADDR_WIDTH] ^ p_wr_ptr[ADDR_WIDTH]) & (p_rd_ptr[ADDR_WIDTH - 1:0] == p_wr_ptr[ADDR_WIDTH - 1:0]);
  assign o_empty = (p_rd_ptr == p_wr_ptr);

  assign n_rd_ptr = update_rd_ptr ? (p_rd_ptr + 1'b1) : p_rd_ptr;
  assign n_wr_ptr = update_wr_ptr ? (p_wr_ptr + 1'b1) : p_wr_ptr;

  // duo_port_RAM_single_clk #(.DATA_WIDTH(WIDTH), .ADDR_WIDTH(ADDR_WIDTH)) RAM (
  //   .i_clk(i_clk),
  //   .i_addr_a(p_wr_ptr[ADDR_WIDTH - 1:0]),
  //   .i_data_a(i_data_in),
  //   .i_addr_b(p_rd_ptr[ADDR_WIDTH - 1:0]),
  //   .i_data_b(i_data_in),
  //   .i_wr_a(update_wr_ptr),
  //   .i_wr_b(1'b0),
  //   .o_data_a(),
  //   .o_data_b(o_data_out)
  // );

  logic [DEPTH - 1:0][WIDTH - 1:0] ram;

  always_ff @(posedge i_clk) begin
    // if(~i_rst_n) for(int i = 0; i < DEPTH; i++) ram[i] <= '0;
    // else 
      if(update_wr_ptr) ram[p_wr_ptr[ADDR_WIDTH - 1:0]] <= i_data_in;
  end

  assign o_data_out = ram[p_rd_ptr[ADDR_WIDTH - 1:0]];

endmodule
