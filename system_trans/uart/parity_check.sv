//localparam  = NON_PARITY  = 3'b000;
//localparam  = EVEN_PARITY = 3'b100;
//localparam  = ODD_PARITY  = 3'b101;
//localparam  = ZERO_STICK  = 3'b110;
//localparam  = ONE_STICK   = 3'b111;

module parity_check (

    input  logic i_clk,
    input  logic i_baud,
    input  logic i_rst_n,
    input  logic i_rx_in,

    input  logic i_count_full,

    input  logic [2:0] i_parity_sel,
    input  logic [2:0] i_p_state,

    output logic o_parity_flag    // HIGH = parity error, LOW = no parity error
);

    localparam [2:0] IDLE        = 3'b000,
                     START       = 3'b001,
                     RECEIVER    = 3'b010,
                     PARITY      = 3'b011,
                     STOP_I      = 3'b100,
                     STOP_II     = 3'b101;

    logic p_xor_data, n_xor_data;

    always_comb begin: proc_parity_xor_data

        case(i_p_state)
            RECEIVER : n_xor_data = (i_count_full & i_baud)? (i_rx_in ^ p_xor_data) : p_xor_data;
            START    : n_xor_data = 1'b0;
            default  : n_xor_data = p_xor_data;
        endcase

    end    

    always_ff @(posedge i_clk, negedge i_rst_n) begin: proc_parity_check

        if(~i_rst_n) p_xor_data <= 1'b0;

        else p_xor_data <= n_xor_data;

    end
//----------------------------------------------------------------------------------------------------

    logic parity_calc, parity_equal, parity_reg;

    assign parity_calc = (~i_parity_sel[1] & p_xor_data) ^ i_parity_sel[0]; // parity_sel [0] = even/odd

    /*always_comb begin: proc_sel_parity_calc_mode

        if(i_parity_sel[1]) parity_calc = i_parity_sel[0]; // stick parity

        else parity_calc = p_xor_data ^ i_parity_sel[0]; // parity_sel [0] = even/odd

    end*/


    assign parity_equal  = i_parity_sel[2] & (parity_calc ^ i_rx_in); // parity_sel [0] = even/odd

    always_comb begin: proc_setup_flag
        if(i_p_state == PARITY) parity_reg = parity_equal;
        else if(i_p_state == IDLE) parity_reg = 1'b0;
        else parity_reg = o_parity_flag;
    end

    always_ff @(posedge i_clk, negedge i_rst_n) begin: proc_parity_flag

        if(~i_rst_n) o_parity_flag <= 1'b0;

        else o_parity_flag <= parity_reg;

    end

endmodule