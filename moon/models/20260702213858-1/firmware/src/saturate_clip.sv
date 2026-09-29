module saturate_clip #(
    parameter IN_WIDTH  = 16,
    parameter OUT_WIDTH = 8
)(
    input  logic signed [IN_WIDTH  - 1:0] i_data,
    output logic signed [OUT_WIDTH - 1:0] o_data
);

    localparam DIFF_1 = IN_WIDTH  - OUT_WIDTH;
    localparam DIFF_2 = OUT_WIDTH - IN_WIDTH ;

    localparam logic signed [OUT_WIDTH - 1:0] MAX_POS = {1'b0, {(OUT_WIDTH - 1){1'b1}}};
    localparam logic signed [OUT_WIDTH - 1:0] MIN_NEG = {1'b1, {(OUT_WIDTH - 1){1'b0}}};

    logic sign_bit;      // dùng để phát hiện overflow (giữ nguyên)
    logic true_sign;     // dùng để chọn hướng bão hòa
    logic overflow;
    logic [IN_WIDTH-OUT_WIDTH-1:0] upper_bits;

    assign sign_bit   = i_data[OUT_WIDTH-1];
    assign true_sign  = i_data[IN_WIDTH-1];      // <-- thêm dòng này
    assign upper_bits = i_data[IN_WIDTH-1:OUT_WIDTH];
    assign overflow   = |(upper_bits ^ {(IN_WIDTH-OUT_WIDTH){sign_bit}});

    assign o_data = overflow ? (true_sign ? MIN_NEG : MAX_POS) : i_data[OUT_WIDTH-1:0];
    
endmodule