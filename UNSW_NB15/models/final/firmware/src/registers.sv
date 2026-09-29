module registers #(
    parameter ARRAY_WIDTH = 8
)(
    input  wire                 i_clk,
    input  wire                 i_rst_n,
    input  wire                 i_en,
    input  wire [ARRAY_WIDTH-1:0] d,
    output reg  [ARRAY_WIDTH-1:0] q
);

always @(posedge i_clk or negedge i_rst_n) begin
    if (!i_rst_n) begin
        q <= {ARRAY_WIDTH{1'b0}};
    end else if (i_en) begin
        q <= d;
    end
end

endmodule