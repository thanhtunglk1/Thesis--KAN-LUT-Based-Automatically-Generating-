module negedge_detect (

    input  logic i_clk,
    input  logic i_rst_n,

    input  logic i_rx_serial,
    input  logic i_rx_en,

    output logic o_rx_in,
    output logic o_start_signal

  );

  logic rx_buffer_1, rx_buffer_2, rx_in;

  always_ff @(posedge i_clk, negedge i_rst_n)
  begin: proc_CDC_rx_buffer

    if(~i_rst_n)
    begin
      rx_buffer_1 <= 1'b1;
      rx_buffer_2 <= 1'b1;
      rx_in       <= 1'b1;
    end

    else
    begin

      if(i_rx_en)
      begin
        rx_buffer_1 <= i_rx_serial;
        rx_buffer_2 <= rx_buffer_1;
        rx_in       <= rx_buffer_2;
      end

      else
      begin
        rx_buffer_1 <= 1'b1;
        rx_buffer_2 <= 1'b1;
        rx_in       <= 1'b1;
      end

    end
  end

  assign o_start_signal = ~rx_buffer_2 & rx_in;
  assign o_rx_in        = rx_in;

endmodule
