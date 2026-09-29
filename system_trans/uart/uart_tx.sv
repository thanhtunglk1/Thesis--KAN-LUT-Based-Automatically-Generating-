module uart_tx #(parameter OV_SAMP = 16)(

    input  logic       i_clk,
    input  logic       i_baud,         // Baud rate clock
    input  logic       i_rst_n,

    input  logic       i_tx_en,        // Enable TX working
    input  logic       i_fifo_tx_emty, // TX FIFO empty signal
    input  logic [7:0] i_data,         // TX data
    input  logic [2:0] i_parity_sel,   // NON/ODD/EVEN/0/1 bit parity
    input  logic       i_stop_sel,     // 1/2 bit stop
    input  logic [1:0] i_width_sel,    // 5/6/7/8 bit transmit

    output logic       o_tx_done,      // TX done signal (to TX FIFO)
    output logic       o_tx            // TX to serial port

);

//CONSTANTS
    // localparam [2:0] IDLE        = 3'b000,
    //                  START       = 3'b001,
    //                  TRANSMITTER = 3'b010,
    //                  PARITY      = 3'b011,
    //                  STOP_I      = 3'b100,
    //                  STOP_II     = 3'b101;

    typedef enum logic [2:0] {
        IDLE        = 3'b000,
        START       = 3'b001,
        TRANSMITTER = 3'b010,
        PARITY      = 3'b011,
        STOP_I      = 3'b100,
        STOP_II     = 3'b101
    } state;

    logic [2:0] bit_width;

    always_comb begin: proc_decode_bit_width

        case(i_width_sel)
            2'b00  : bit_width  = 3'd4; // 5 bit width
            2'b01  : bit_width  = 3'd5; // 6 bit width
            2'b10  : bit_width  = 3'd6; // 7 bit width
            2'b11  : bit_width  = 3'd7; // 8 bit width
            default: bit_width  = 3'd7; // 8 bit width
        endcase
        
    end

    localparam CNT_WIDTH = $clog2(OV_SAMP);
    logic [CNT_WIDTH-1:0] p_counter, n_counter;

    state       p_state, n_state;
    logic [2:0] p_index, n_index;

    always_ff @(posedge i_clk or negedge i_rst_n) begin: proc_state_counter
        if(!i_rst_n) begin
            p_state   <= IDLE;
            p_counter <=   '0;
            p_index   <= 3'd0;
        end else begin
            p_state   <= n_state;
            p_counter <= n_counter;
            p_index   <= n_index;
        end
    end

    logic count_full, transmit_done;
    assign count_full    = (p_counter == OV_SAMP - 1);
    assign transmit_done = (p_index   == bit_width  );

    always_comb begin
        case(p_state)
            IDLE: begin
                n_state   = (i_tx_en & ~i_fifo_tx_emty) ? START : IDLE;
                n_counter =   '0;
                n_index   = 3'b0;
                o_tx_done = 1'b0;
            end

            START: begin
                if(i_baud) begin
                    n_state   = count_full ? TRANSMITTER : START;
                    n_counter = count_full ? '0 : p_counter + 1'b1;
                end
            
                else begin
                    n_state   = p_state;
                    n_counter = p_counter;
                end
                n_index   = 3'b0;
                o_tx_done = 1'b0; 
            end

            TRANSMITTER: begin
                if(i_baud) begin
                    if(count_full) begin
                        n_state   = transmit_done ? (i_parity_sel[2] ? PARITY : STOP_I) : TRANSMITTER;
                        n_counter = '0;
                        n_index   = transmit_done ? 3'b0 : p_index + 3'b1;
                    end

                    else begin
                        n_state   = p_state;
                        n_counter = p_counter + 1'b1;
                        n_index   = p_index;
                    end
                end 

                else begin
                    n_state   = p_state;
                    n_counter = p_counter;
                    n_index   = p_index;
                end
                o_tx_done = 1'b0;
            end

            PARITY: begin
                if(i_baud) begin
                    if(count_full) begin
                        n_state   = STOP_I;
                        n_counter = '0;
                    end

                    else begin
                        n_state   = p_state;
                        n_counter = p_counter + 1'b1;
                    end
                end

                else begin
                    n_state   = p_state;
                    n_counter = p_counter;
                end
                n_index   = p_index;
                o_tx_done = 1'b0;
            end

            STOP_I: begin
                if(i_baud) begin
                    if(count_full) begin
                        n_state   = i_stop_sel ? STOP_II : ((i_tx_en & ~i_fifo_tx_emty) ? START : IDLE);
                        n_counter = '0;
                    end

                    else begin
                        n_state   = p_state;
                        n_counter = p_counter + 1'b1;
                    end
                end else begin
                    n_state   = p_state;
                    n_counter = p_counter;
                end
                n_index   = 3'd0;
                o_tx_done = (p_counter == '0) && i_baud;
            end

            STOP_II: begin
                if(i_baud) begin
                    if(count_full) begin
                        n_state   = (i_tx_en & ~i_fifo_tx_emty) ? START : IDLE;
                        n_counter = '0;
                    end else begin
                        n_state   = p_state;
                        n_counter = p_counter + 1'b1;
                    end
                end else begin
                    n_state   = p_state;
                    n_counter = p_counter;
                end
                n_index   = 3'd0;
                o_tx_done = (p_counter == '0) && i_baud;
            end

            default: begin
                n_state   = IDLE;
                n_counter = p_counter;
                n_index   = p_index;
                o_tx_done = 1'b0;
            end
        endcase
    end

//----------------------------------------------------------------------------------------------------

    logic [7:0] data_reg, data_in;
    assign data_in = ((p_state == START)) ? i_data : data_reg;

    always_ff @(posedge i_clk, negedge i_rst_n) begin: proc_latch_data

        if(~i_rst_n) data_reg <= 8'b0;
        else         data_reg <= data_in;

    end

//---------------------------------------------------------------------------------------------------- 

    logic p_xor_data, n_xor_data;

    always_comb begin: proc_parity_xor_data

        case(p_state)
            TRANSMITTER: n_xor_data = (count_full & i_baud) ? (data_reg[p_index] ^ p_xor_data) : p_xor_data;
            STOP_I     : n_xor_data = 1'b0;
            default    : n_xor_data = p_xor_data;
        endcase

    end    

    always_ff @(posedge i_clk, negedge i_rst_n) begin: proc_parity_check

        if(~i_rst_n) p_xor_data <= 1'b0;

        else p_xor_data <= n_xor_data;

    end
//----------------------------------------------------------------------------------------------------

    always_comb begin: proc_tx_out
        case(p_state)
            IDLE       : o_tx = 1'b1; // idle state is HIGH
            START      : o_tx = 1'b0; // start bit is LOW
            TRANSMITTER: o_tx = data_reg[p_index]; // data bits
            PARITY     : o_tx = (~i_parity_sel[1] & p_xor_data) ^ i_parity_sel[0]; // parity bit
            //begin
            //    if(i_parity_sel[1]) o_tx = i_parity_sel[0];              // stick parity
            //    else                o_tx = p_xor_data ^ i_parity_sel[0]; // parity_sel [0] = even/odd
            //end
            STOP_I     : o_tx = 1'b1; // stop bit I
            STOP_II    : o_tx = 1'b1; // stop bit II
            default    : o_tx = 1'b1; // idle state is HIGH
        endcase
    end

endmodule