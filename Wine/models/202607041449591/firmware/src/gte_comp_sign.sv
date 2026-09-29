module gte_comp_sign #(
    parameter WIDTH = 8
)(
    input  logic [WIDTH - 1:0] i_a ,
    input  logic [WIDTH - 1:0] i_b ,
    output logic               o_gte
);

    logic [WIDTH - 1:0] s;
    logic lt;

    // adder_flex_no_carry #(
    //     .WIDTH(WIDTH)
    // ) compare_max ( 
    //     .i_a   (i_a),
    //     .i_b   (~i_b),
    //     .i_cin (1'b1),
    //     .o_s   (s)
    // );

    assign s = i_a - i_b;
    assign lt = (i_a[WIDTH-1] ^ i_b[WIDTH-1]) ? i_a[WIDTH-1] : s[WIDTH-1];
    assign o_gte = ~lt;

endmodule