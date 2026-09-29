module wrapper (
	input  logic MAX10_CLK1_50,
	input  logic [ 9:0] SW,
	inout  logic [ 1:0] ARDUINO_IO,
	output logic [ 7:0] HEX0,
    output logic [ 7:0] HEX1,
	output logic [ 9:0] LEDR
);


localparam BAUD_RATE = 115200;

logic rst_n;

assign rst_n = SW[0];
assign LEDR = SW;

top  #(
	.CLK_FREQ (50_000_000),
    .BAUD_RATE(BAUD_RATE)
) system_test (
    .i_clk(MAX10_CLK1_50),
    .i_rst_n(rst_n),
    .i_rx_serial(ARDUINO_IO[0]),
    .o_tx_serial(ARDUINO_IO[1]),
	.o_hex_class(HEX0[7:0]),
	.o_hex_state(HEX1[7:0]),
    .o_led()
);

endmodule

module wrapper (
	input  logic MAX10_CLK1_50,
	input  logic [ 9:0] SW,
	inout  logic [ 1:0] ARDUINO_IO,
	output logic [ 9:0] LEDR
);

	localparam CLK_FREQ  = 50_000_000;
	localparam BAUD_RATE = 115200;
	localparam logic [23:0] baud_reg = (CLK_FREQ)/(BAUD_RATE*16) - 1;

	logic rst_n, tx_fifo_not_full, rx_fifo_have_data, st_tx, ld_rx;
	logic [7:0] tx_data, rx_data;

	assign rst_n = SW[0];
	assign LEDR  = SW;

	assign tx_data = rx_data;
	assign st_tx   = rx_fifo_have_data & tx_fifo_not_full;
	assign ld_rx   = rx_fifo_have_data & tx_fifo_not_full;

	uart_top uart_ip (
    //GLOBAL SIGNALS
        .i_clk(MAX10_CLK1_50), // 50MHz clock
        .i_rst_n(rst_n), // Active low reset
    //CONTROL SIGNALS
        .i_rx_en(1'b1),
        .i_tx_en(1'b1),
        .i_width_sel(2'b11),        // 8 bit
        .i_parity_sel(3'b0),        // no parity bit
        .i_stop_sel(1'b0),          // 1 bit stop
        .i_baud_rate_value(baud_reg), // 19200bps
        //.i_baud_rate_value(24'd1),  // 1562500bps
    //FLAG RESPONSE SIGNALS
        .o_tx_data_avail(tx_fifo_not_full),  // can store data in TX FIFO
        .o_rx_data_avail(rx_fifo_have_data), // can load  data in RX FIFO

        .o_e_overrun_flag(),// error overrun flag
        .o_e_parity_flag(), // error parity flag
        .o_e_frame_flag(),  // error frame flag

    //IO SIGNALS
        .i_rx_serial(ARDUINO_IO[0]), // UART RX line in
        .o_tx_serial(ARDUINO_IO[1]), // UART TX line out
        .i_load_uart(ld_rx),       // load signal from RX FIFO
        .i_store_uart(st_tx),      // store signal to TX FIFO
        .i_trans_data(tx_data),    // tx data send
        .o_receive_data(rx_data)   // rx data receive
    );

endmodule