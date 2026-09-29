import kan_core_pkg::*;

module top #(
    parameter CLK_FREQ  = 50_000_000,
    parameter BAUD_RATE = 9600
)(
    input  logic       i_clk,
    input  logic       i_rst_n,
    input  logic       i_rx_serial,
    output logic       o_tx_serial,
    output logic [7:0] o_hex_class,
    output logic [7:0] o_hex_state,
    output logic [9:0] o_led
);

    localparam logic [23:0] baud_reg = (CLK_FREQ)/(BAUD_RATE*16) - 1;

    logic [7:0] rx_data, tx_data;
    logic st_tx, ld_rx;
    logic rx_fifo_have_data, tx_fifo_not_full;

    uart_top uart_ip (
    //GLOBAL SIGNALS
        .i_clk(i_clk), // 50MHz clock
        .i_rst_n(i_rst_n), // Active low reset
    //CONTROL SIGNALS
        .i_rx_en(1'b1),
        .i_tx_en(1'b1),
        .i_width_sel(2'b11),        // 8 bit
        .i_parity_sel(3'b0),        // no parity bit
        .i_stop_sel(1'b0),          // 1 bit stop
        .i_baud_rate_value(baud_reg),
        //.i_baud_rate_value(24'd1),  // 1562500bps
    //FLAG RESPONSE SIGNALS
        .o_tx_data_avail(tx_fifo_not_full),  // can store data in TX FIFO
        .o_rx_data_avail(rx_fifo_have_data), // can load  data in RX FIFO

        .o_e_overrun_flag(),// error overrun flag
        .o_e_parity_flag(), // error parity flag
        .o_e_frame_flag(),  // error frame flag

    //IO SIGNALS
        .i_rx_serial(i_rx_serial), // UART RX line in
        .o_tx_serial(o_tx_serial), // UART TX line out
        .i_load_uart(ld_rx),       // load signal from RX FIFO
        .i_store_uart(st_tx),      // store signal to TX FIFO
        .i_trans_data(tx_data),    // tx data send
        .o_receive_data(rx_data)   // rx data receive
    );

    localparam CNT_MAX   = (IN_FEATURES > (OUT_FEATURES + 1)) ? IN_FEATURES - 1 : OUT_FEATURES   ;
    localparam CNT_WIDTH = (CNT_MAX <= 1)                     ?               1 : $clog2(CNT_MAX);

    logic ip_en, ip_start, ip_start_delay, ip_done;

    typedef enum logic[1:0] {
        IDLE    ,
        RX_REC  ,
        WAIT_IP ,
        TX_TRANS
    } fsm_state;
    fsm_state state, n_state;

    logic [CNT_WIDTH - 1:0] cnt, n_cnt;

    always_ff @(posedge i_clk, negedge i_rst_n) begin
        if(~i_rst_n) state <=    IDLE;
        else         state <= n_state;
    end

    always_ff @(posedge i_clk, negedge i_rst_n) begin
        if(~i_rst_n)        cnt <= '0;
        else                cnt <= n_cnt;
    end

    logic rx_done, tx_done, tx_trans;
    assign rx_done  = (cnt == IN_FEATURES - 1) && rx_fifo_have_data;
    assign tx_done  = (cnt == OUT_FEATURES)    && tx_fifo_not_full ;
    assign tx_trans = (cnt != OUT_FEATURES)    && tx_fifo_not_full ;

    always_comb begin
        case(state)
            IDLE    : n_state = rx_fifo_have_data   ? RX_REC   : IDLE    ;
            RX_REC  : n_state = rx_done             ? WAIT_IP  : RX_REC  ;
            WAIT_IP : n_state = ip_done             ? TX_TRANS : WAIT_IP ;
            TX_TRANS: n_state = tx_done             ? IDLE     : TX_TRANS;
            default : n_state = IDLE;
        endcase
    end

    always_comb begin
        case(state)
            IDLE    : begin
                n_cnt    =   '0;
                ip_start = 1'b0;
                ip_en    = 1'b0;
                ld_rx    = 1'b0;
                st_tx    = 1'b0;
            end
            RX_REC  : begin
                n_cnt    = rx_fifo_have_data ? cnt + 1'b1 : cnt;
                ip_start = rx_done;
                ip_en    = 1'b0;
                ld_rx    = rx_fifo_have_data;
                st_tx    = 1'b0;
            end
            WAIT_IP : begin
                n_cnt    =   '0;
                ip_start = 1'b0;
                ip_en    = 1'b1;
                ld_rx    = 1'b0;
                st_tx    = 1'b0;
            end
            TX_TRANS: begin
                n_cnt    = tx_trans ? cnt + 1'b1 : cnt;
                ip_start = 1'b0;
                ip_en    = 1'b0;
                ld_rx    = 1'b0;
                st_tx    = tx_fifo_not_full;
            end
            default : begin
                n_cnt    =   '0;
                ip_start = 1'b0;
                ip_en    = 1'b0;
                ld_rx    = 1'b0;
                st_tx    = 1'b0;
            end
        endcase
    end

    localparam PAD_0_IDX       = 8 - $clog2(OUT_FEATURES);
    localparam PAD_MSB_OUT     = 8 - OUT_WIDTH;
    localparam CLASS_IDX_WIDTH = (OUT_FEATURES <= 1) ? 1 : $clog2(OUT_FEATURES);

    logic [IN_FEATURES     - 1:0][IN_WIDTH  - 1:0] in_features ;
    logic [OUT_FEATURES    - 1:0][OUT_WIDTH - 1:0] out_features;
    logic [OUT_FEATURES       :0][            7:0] data_2_tx   ;
    logic [CLASS_IDX_WIDTH - 1:0]          classification_index;
    
    always_ff @(posedge i_clk, negedge i_rst_n) begin
        if(~i_rst_n) for(int i = 0; i < IN_FEATURES; i++) in_features[i] <= '0;
        else if ((state == RX_REC) & rx_fifo_have_data) in_features[cnt] <= rx_data[IN_WIDTH - 1:0];
    end

    always_comb begin
        for(int i = 0; i < OUT_FEATURES; i++) data_2_tx[i] = {{PAD_MSB_OUT{out_features[i][OUT_WIDTH - 1]}}, out_features[i]};
        data_2_tx[OUT_FEATURES] = {{PAD_0_IDX{1'b0}}, classification_index};
    end

    assign tx_data = data_2_tx[cnt];

    always_ff @(posedge i_clk, negedge i_rst_n) begin
        if(~i_rst_n) ip_start_delay <=       '0;
        else         ip_start_delay <= ip_start;
    end

    kan_top KAN_IP (
        .i_clk      (i_clk),
        .i_rst_n    (i_rst_n),
        .i_en       (ip_en),
        .i_start    (ip_start_delay),
        .i_vector   (in_features),
        .o_done     (ip_done),
        .o_vector   (out_features),
        .o_index    (classification_index)                      
    );

    seven_seg_anode_common led_7_seg_class (
        .bin(data_2_tx[OUT_FEATURES][3:0]),
        .seg(o_hex_class)
    );

    seven_seg_anode_common led_7_seg_state (
        .bin({2'b0,state}),
        .seg(o_hex_state)
    );

    localparam PAD_LED = 10 - CNT_WIDTH;

    assign o_led = {{PAD_LED{1'b0}}, cnt};

endmodule