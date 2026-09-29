module single_port_ram #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 11,
    parameter logic [DATA_WIDTH-1:0] INIT [0:2**ADDR_WIDTH-1] = '{default:0}
)(
    input  logic i_clk,
    input  logic i_wren,
    input  logic [ADDR_WIDTH-1:0] i_addr,
    input  logic [DATA_WIDTH-1:0] i_st_data,
    output logic [DATA_WIDTH-1:0] o_ld_data
);

    (* ramstyle = "M9K" *)
    //(* ramstyle = "M10K" *)
    logic [DATA_WIDTH-1:0] ram [0:2**ADDR_WIDTH - 1];

    logic [ADDR_WIDTH-1:0] addr_reg;

    initial ram = INIT;

    always_ff @(posedge i_clk) begin
        if (i_wren)
            ram[i_addr] <= i_st_data;

        addr_reg  <= i_addr;

    end

    assign o_ld_data = ram[addr_reg];

endmodule