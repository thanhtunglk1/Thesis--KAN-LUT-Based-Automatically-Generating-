module uart_top(
//GLOBAL SIGNALS
    input  logic i_clk, // 50MHz clock
    input  logic i_rst_n, // Active low reset
//CONTROL SIGNALS
    input  logic        i_rx_en,
    input  logic        i_tx_en,
    input  logic [ 1:0] i_width_sel,
    input  logic [ 2:0] i_parity_sel, 
    input  logic        i_stop_sel,   
    input  logic [23:0] i_baud_rate_value, 
//FLAG RESPONSE SIGNALS
    output logic o_tx_data_avail, // can store data in TX FIFO
    output logic o_rx_data_avail, // can load  data in RX FIFO

    output logic o_e_overrun_flag,// error overrun flag
    output logic o_e_parity_flag, // error parity flag
    output logic o_e_frame_flag,  // error frame flag

//IO SIGNALS
    input  logic i_load_uart,  // load signal to RX FIFO
    input  logic i_store_uart, // store signal to TX FIFO

    input  logic i_rx_serial, // UART RX line in
    output logic o_tx_serial, // UART TX line out

    input  logic [7:0] i_trans_data,
    output logic [7:0] o_receive_data
);

    logic baud_tick;

    baud_gen #(.BAUD_WIDTH(24)) baud_gen (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_brd_value(i_baud_rate_value),
        .o_baud(baud_tick)
    );

    logic rx_fifo_full;
    logic rx_SIPO_done;
    logic rx_fifo_emty;
    logic fifo_e_frame, fifo_e_parity;

    assign o_rx_data_avail = ~rx_fifo_emty;

    logic [7:0] rx_data_in;
    logic [9:0] rx_fifo_data_in, rx_fifo_data_out;
    assign rx_fifo_data_in = {fifo_e_frame, fifo_e_parity, rx_data_in};

    assign o_e_frame_flag  = rx_fifo_data_out[9];
    assign o_e_parity_flag = rx_fifo_data_out[8];
    assign o_receive_data  = rx_fifo_data_out[7:0];

    syn_fifo #(.DEPTH(16), .WIDTH(10)) rx_fifo (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_wr_en(rx_SIPO_done),
        .i_rd_en(i_load_uart),
        .i_data_in(rx_fifo_data_in),
        .o_data_out(rx_fifo_data_out),
        .o_full(rx_fifo_full),
        .o_empty(rx_fifo_emty)
    );

    uart_rx #(.OV_SAMP(16)) uart_rx (
        .i_clk(i_clk),
        .i_baud(baud_tick),
        .i_rst_n(i_rst_n),
        .i_rx(i_rx_serial),
        .i_fifo_full(rx_fifo_full),
        .i_rx_en(i_rx_en),
        .i_parity_sel(i_parity_sel),
        .i_stop_sel(i_stop_sel),
        .i_width_sel(i_width_sel),
        .o_rx_fifo_wr_en(rx_SIPO_done),
        .o_data(rx_data_in),
        .o_error_frame(fifo_e_frame),
        .o_error_parity(fifo_e_parity),
        .o_error_overrun(o_e_overrun_flag)
    );

    logic tx_fifo_empty, tx_fifo_full;
    assign o_tx_data_avail = ~tx_fifo_full;

    logic tx_done, out_tx;
    logic [7:0] fifo_2_tx_data;

    syn_fifo #(.DEPTH(16), .WIDTH(8)) tx_fifo (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_wr_en(i_store_uart),
        .i_rd_en(tx_done),
        .i_data_in(i_trans_data),
        .o_data_out(fifo_2_tx_data),
        .o_full(tx_fifo_full),
        .o_empty(tx_fifo_empty)
    );
        
    uart_tx #(.OV_SAMP(16)) uart_tx (
        .i_clk(i_clk),
        .i_baud(baud_tick),         
        .i_rst_n(i_rst_n),
        .i_tx_en(i_tx_en),        
        .i_fifo_tx_emty(tx_fifo_empty), 
        .i_data(fifo_2_tx_data),         
        .i_parity_sel(i_parity_sel),   
        .i_stop_sel(i_stop_sel),    
        .i_width_sel(i_width_sel),    
        .o_tx_done(tx_done),      
        .o_tx(out_tx)           
    );
    
    always_ff @(posedge i_clk, negedge i_rst_n) begin
        if(~i_rst_n) o_tx_serial <=   1'b1;
        else         o_tx_serial <= out_tx;
    end


endmodule