module gte_comp_sign #(
    parameter BEHAVIOR = 0,
    parameter WIDTH = 8
)(
    input  logic [WIDTH - 1:0] i_a ,
    input  logic [WIDTH - 1:0] i_b ,
    output logic               o_gte
);

    logic [WIDTH - 1:0] s;
    logic lt;

    generate
        if(BEHAVIOR) begin
            assign o_gte = ($signed(i_a) >= $signed(i_b));
        end

        else begin
            assign s = i_a - i_b;
            assign lt = (i_a[WIDTH-1] ^ i_b[WIDTH-1]) ? i_a[WIDTH-1] : s[WIDTH-1];
            assign o_gte = ~lt;
        end
    endgenerate

endmodule