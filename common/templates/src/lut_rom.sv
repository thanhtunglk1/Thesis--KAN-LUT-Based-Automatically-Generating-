module lut_rom #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 11,
    parameter logic [DATA_WIDTH-1:0] INIT [0:2**ADDR_WIDTH-1] = '{default:0}
)(
    input  logic                  i_clk     ,
    input  logic                  i_rst_n   ,
    input  logic                  i_en      ,
    input  logic [ADDR_WIDTH-1:0] i_addr    ,
    output logic [DATA_WIDTH-1:0] o_ld_data
);

    (* ramstyle = "logic" *)
    logic [DATA_WIDTH-1:0] ram [0:2**ADDR_WIDTH - 1];
    assign ram = INIT;

    logic [DATA_WIDTH - 1:0] lut_data;
    assign lut_data = ram[i_addr];

    always_ff @(posedge i_clk, negedge i_rst_n) begin
        if(~i_rst_n)     o_ld_data <= '0      ;
        else if(i_en)    o_ld_data <= lut_data;
    end

endmodule
