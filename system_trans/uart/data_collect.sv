module data_collect (

    input  logic i_clk,
    input  logic i_rst_n,

    input  logic i_rx_serial,

    input  logic        i_count_full,
    input  logic [2:0]  i_p_state,
    input  logic [2:0]  i_index_data,

    output logic [7:0]  o_rx_data

);

    logic [7:0] temp_reg;

    localparam [2:0] IDLE        = 3'b000,
                     START       = 3'b001,
                     RECEIVER    = 3'b010,
                     PARITY      = 3'b011,
                     STOP_I      = 3'b100,
                     STOP_II     = 3'b101;

    logic [7:0] in_data, wr_en;

    always_ff @(posedge i_clk, negedge i_rst_n) begin: proc_rx_data
    
        if(~i_rst_n) temp_reg <= 8'b0;
        
        else temp_reg <= in_data;

    end

    always_comb begin: proc_decode_en
        case(i_index_data)
            3'b000 : wr_en = 8'b0000_0001; // 1st bit
            3'b001 : wr_en = 8'b0000_0010; // 2nd bit
            3'b010 : wr_en = 8'b0000_0100; // 3rd bit
            3'b011 : wr_en = 8'b0000_1000; // 4th bit
            3'b100 : wr_en = 8'b0001_0000; // 5th bit
            3'b101 : wr_en = 8'b0010_0000; // 6th bit
            3'b110 : wr_en = 8'b0100_0000; // 7th bit
            3'b111 : wr_en = 8'b1000_0000; // 8th bit
            default: wr_en = 8'b0000_0000;
        endcase
    end

    logic rec_state, start_state;
    assign rec_state   = (i_p_state == RECEIVER); //wr_enable
    assign start_state = (i_p_state == START);

    always_comb begin: proc_mux_in_data
        for(int i = 0; i < 8; i++) begin      
            if(start_state) in_data[i] = 1'b0;

            else if(rec_state) in_data[i] = (wr_en[i] & i_count_full) ? i_rx_serial : temp_reg[i];

            else in_data[i] = temp_reg[i]; // default state
        end
    end

    assign o_rx_data = temp_reg;

endmodule