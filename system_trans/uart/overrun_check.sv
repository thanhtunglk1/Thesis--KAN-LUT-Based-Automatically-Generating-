module overrun_check(

    input  logic i_clk,
    input  logic i_rst_n,
    input  logic i_rx_done,
    input  logic i_rx_fifo_full,

    output logic o_overrun_flag    // HIGH = frame error, LOW = no frame error

  );

  localparam NORMAL  = 1'b0;
  localparam OVERRUN = 1'b1;

  logic p_state, n_state;

  always_ff @(posedge i_clk, negedge i_rst_n)
  begin: proc_overrun_check
    if(~i_rst_n)
      p_state <= NORMAL; // Reset state to NORMAL

    else
      p_state <= n_state; // Update state to next state
  end

  always_comb
  begin: proc_next_state
    case(p_state)
      NORMAL :
        n_state = (i_rx_fifo_full & i_rx_done) ? OVERRUN : NORMAL; // RX FIFO is not full, no overrun

      OVERRUN:
        n_state = i_rx_fifo_full ? OVERRUN : NORMAL; // RX FIFO is full, overrun

      default:
        n_state = NORMAL; // Default state
    endcase
  end

  assign o_overrun_flag = p_state;

endmodule
