module uart_rx #(parameter OV_SAMP = 16)(
    //GLOBAL
    input  logic        i_clk,
    input  logic        i_baud,         // Baud rate clock
    input  logic        i_rst_n,
    //RX_INPUT
    input  logic        i_rx,           // RX from serial port
    input  logic        i_fifo_full,    // RX FIFO full signal
    //CONTROL_SIGNAL
    input  logic        i_rx_en,        // Enable RX working
    input  logic [2:0]  i_parity_sel,   // NON/ODD/EVEN/0/1 bit parity
    input  logic        i_stop_sel,     // 1/2 bit stop
    input  logic [1:0]  i_width_sel,    // 5/6/7/8 bit receive
    //RESPONSE_SIGNAL
    //output logic        o_busy,
    output logic        o_rx_fifo_wr_en,// RX_done
    output logic [7:0]  o_data,         // RX data
    //FLAG_RESPONSE
    output logic        o_error_frame,  // Wrong stop bit
    output logic        o_error_parity, // Wrong parity bit
    output logic        o_error_overrun // RX FIFO overrun signal
  );

  //CONSTANTS
  localparam  MID_SAMP   = OV_SAMP/2;


  // localparam [2:0] IDLE  = 3'b000,
  //            START       = 3'b001,
  //            RECEIVER    = 3'b010,
  //            PARITY      = 3'b011,
  //            STOP_I      = 3'b100,
  //            STOP_II     = 3'b101;

  typedef enum logic [2:0] {
    IDLE        = 3'b000,
    START       = 3'b001,
    RECEIVER    = 3'b010,
    PARITY      = 3'b011,
    STOP_I      = 3'b100,
    STOP_II     = 3'b101
  } state;

  logic [2:0] bit_width;

  always_comb
  begin: proc_decode_bit_width
    case(i_width_sel)
      2'b00  : bit_width    = 3'd4; // 5 bit width
      2'b01  : bit_width    = 3'd5; // 6 bit width
      2'b10  : bit_width    = 3'd6; // 7 bit width
      2'b11  : bit_width    = 3'd7; // 8 bit width
    endcase
  end

  //----------------------------------------------------------------------------------------------------
  logic rx_in, start_signal;

  negedge_detect rx_synchronizer_ff (
                   .i_clk(i_clk),
                   .i_rst_n(i_rst_n),
                   .i_rx_serial(i_rx),
                   .i_rx_en(i_rx_en),
                   .o_rx_in(rx_in),
                   .o_start_signal(start_signal)
                 );

  state       p_state, n_state;
  logic [3:0] p_counter, n_counter;
  logic [2:0] p_index, n_index;

  always_ff @(posedge i_clk, negedge i_rst_n)
  begin: proc_update_state

    if(~i_rst_n) begin
      p_state   <= IDLE;
      p_counter <= 4'b0;
      p_index   <= 4'b0;
    end else begin
      p_state   <= n_state;
      p_counter <= n_counter;
      p_index   <= n_index;
    end

  end

  logic  count_16, count_8;
  assign count_16 = (p_counter == OV_SAMP  - 1);  // full   sample count
  assign count_8  = (p_counter == MID_SAMP - 1);  // middle sample count

  logic receive_done;
  assign receive_done = (p_index == bit_width); //recieve full data

  //FLAG_RESPONSE
  logic rx_done, parity_flag;
  assign o_rx_fifo_wr_en = rx_done; // RX FIFO write enable signal
  assign o_error_parity  = parity_flag;
  assign o_error_frame   = ~rx_in;


  always_comb begin
    case(p_state)
      IDLE: begin
        n_state   = (start_signal) ? START : IDLE;   //monitor the negedge of RX signal
        n_counter =   '0;
        n_index   = 3'b0;
        rx_done   = 1'b0;
      end

      START: begin
        if(i_baud) begin //checking the midle of the start bit
          if(count_8) begin
            n_state   = rx_in ? IDLE : RECEIVER; //if start bit is 0, go to receiver state
            n_counter = '0;
          end else begin
            n_state = p_state;                   //if start bit bis 1, consider as an noise and return to IDLE state
            n_counter = p_counter + 4'b1;        //count until the middle of the start bit
          end
        end else begin
          n_state   = p_state;
          n_counter = p_counter;
        end
        n_index   = p_index;  //index is 0 in START state
        rx_done   = 1'b0;
      end

      RECEIVER: begin
        if(i_baud) begin
          if(count_16) begin
            n_state   = receive_done ? (i_parity_sel[2] ? PARITY : STOP_I) : RECEIVER;
            n_counter = '0;
            n_index   = receive_done ? 3'b0 : p_index + 3'b1; // increase index value to take the next serial bit
          end else begin
            n_state   = p_state;
            n_counter = p_counter + 1'b1;  //count to the middle of each data bit
            n_index   = p_index;
          end
        end else begin
          n_state   = p_state;
          n_counter = p_counter;
          n_index   = p_index;
        end
        rx_done = 1'b0;
      end

      PARITY: begin
        if(i_baud)begin
          if(count_16) begin
            n_state   = STOP_I; // go to STOP_I state after parity check
            n_counter = '0;
          end else begin
            n_state   = p_state;
            n_counter = p_counter + 1'b1;
          end
        end else begin
          n_state   = p_state;
          n_counter = p_counter;
        end
        n_index = p_index;
        rx_done = 1'b0;
      end

      STOP_I: begin
        if(i_baud) begin
          if(count_16) begin
            n_state   = i_stop_sel & rx_in ? STOP_II : IDLE; // if stop bit is 1, go to STOP_II state
            n_counter =   '0;
            n_index   = 3'b0;
            rx_done   = ~i_stop_sel | ~rx_in; // RX done signal;
          end else begin
            n_state   = STOP_I;
            n_counter = p_counter + 1'b1;
            n_index   = p_index;
            rx_done   = 1'b0;
          end
        end

        else begin
          n_state   = STOP_I;
          n_counter = p_counter;
          n_index   = p_index;
          rx_done   = 1'b0;
        end
      end

      STOP_II: begin
        if(i_baud) begin
          if(count_16) begin
            n_state   = IDLE;
            n_counter =   '0;
            n_index   = 3'b0;
            rx_done   = 1'b1; // RX done signal
          end else begin
            n_state   = STOP_II;
            n_counter = p_counter + 1'b1;
            n_index   = p_index;
            rx_done   = 1'b0;
          end
        end else begin
          n_state   = STOP_II;
          n_counter = p_counter;
          n_index   = p_index;
          rx_done   = 1'b0;
        end
      end

      default: begin
        n_state   = IDLE;
        n_counter = p_counter;
        n_index   = p_index;
        rx_done   = 1'b0;
      end
    endcase

  end

  //----------------------------------------------------------------------------------------------------

  parity_check parity_check(
    .i_clk(i_clk),
    .i_baud(i_baud),
    .i_rst_n(i_rst_n),
    .i_rx_in(rx_in),
    .i_count_full(count_16),
    .i_parity_sel(i_parity_sel),
    .i_p_state(p_state),
    .o_parity_flag(parity_flag)
  );

  data_collect data_collect(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_rx_serial(rx_in),
    .i_count_full(count_16),
    .i_p_state(p_state),
    .i_index_data(p_index),
    .o_rx_data(o_data)
  );

  overrun_check overrun_check(
    .i_clk(i_clk),
    .i_rst_n(i_rst_n),
    .i_rx_done(rx_done),
    .i_rx_fifo_full(i_fifo_full),
    .o_overrun_flag(o_error_overrun)
  );

endmodule