module duo_port_RAM_single_clk #(
  parameter DATA_WIDTH = 8,
  parameter ADDR_WIDTH = 3
)(
  input  logic i_clk,
  input  logic [DATA_WIDTH - 1:0] i_data_a, i_data_b,
  input  logic [ADDR_WIDTH - 1:0] i_addr_a, i_addr_b,
  input  logic i_wr_a, i_wr_b,
  output logic [DATA_WIDTH - 1:0] o_data_a, o_data_b
);

  reg [DATA_WIDTH - 1:0] ram [2**ADDR_WIDTH - 1:0];

  // initial for(int i = 0; i < 2**ADDR_WIDTH; i++) ram[i] = '0;

  always_ff @(posedge i_clk) begin

    if(i_wr_a) begin
      ram[i_addr_a] <= i_data_a;
      o_data_a      <= i_data_a;

    end else begin
      o_data_a      <= ram[i_addr_a];
   
    end

  end

  always_ff @(posedge i_clk) begin

    if(i_wr_b) begin
      ram[i_addr_b] <= i_data_b;
      o_data_b      <= i_data_b;

    end else begin
      o_data_b      <= ram[i_addr_b];
   
    end 

  end

endmodule