import kan_core_pkg::*;

module tb();

    localparam      CLK_PERIOD      = 20; // 50 MHz clock (20 ns period)
    localparam      BAUD_RATE       = 14400; // Baud rate for simulation
    //localparam      BAUD_RATE       = 1562500; // Baud rate for simulation
    localparam      OV_SAMP         = 16; // Oversampling factor
    localparam real BAUD_PERIOD     = (10**9)/ BAUD_RATE; // Baud period in ns (8680.56 ns)
    localparam real SAMPLE_PERIOD   = BAUD_PERIOD / OV_SAMP; // Sample period in ns (542.53 ns)
    localparam      LINE            = 100;

    logic i_clk   = 0;
    logic i_rst_n = 0;
    logic i_rx    = 1;

    logic [7:0] byte_send = 8'h0;

    // logic [7:0] in_features [0:IN_FEATURES - 1]= '{
    //     8'h07, 8'h04, 8'hFB, 8'hFE, 8'hFD, 8'hFD, 8'h07, 8'hF8, 
    //     8'hF8, 8'hF8, 8'h05, 8'h07, 8'h06, 8'h07, 8'hFD, 8'h07, 
    //     8'h04, 8'hFF, 8'hFF, 8'h02, 8'hFF, 8'hFC, 8'hF8, 8'hFD, 
    //     8'hFA, 8'hFA, 8'h05, 8'h05, 8'hFE, 8'h01, 8'h07, 8'h00, 
    //     8'hF8, 8'hF8, 8'h07, 8'hFC, 8'hFC, 8'hFB, 8'h03, 8'hF8, 
    //     8'h07, 8'h07
    // };

    int in_file, temp;

    logic [IN_FEATURES - 1:0][7:0] in_features;

    top #(
        .CLK_FREQ (50_000_000),
        .BAUD_RATE(BAUD_RATE)
    ) dut (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_rx_serial(i_rx),
        .o_tx_serial(),
        .o_hex_class(),
        .o_hex_state(),
        .o_led()
    );

    initial begin 
        $shm_open("waves.shm")  ;
        $shm_probe("ASM")       ;
    end

    initial begin
        in_file   = $fopen("../../MNIST/models/final/firmware/tb/vectors_in.txt", "r");
        if (in_file  == 0) $fatal(1, "Cannot open vectors_in.txt");

        for(int line = 0; line <= LINE; line++) begin
            for (int idx_in = 0; idx_in < IN_FEATURES; idx_in++) begin
                if ($fscanf(in_file, "%d", temp) != 1) begin
                    $display(1, "Bad in_file format at line %0d", line);
                end
                if(line == LINE) in_features[idx_in] = temp;
            end
        end
    end

    always #(CLK_PERIOD/2) i_clk = ~i_clk; // 10 ns toggle -> 50 MHz

    int k, j;

    initial begin
        #40
        i_rst_n = 1'b1;
        #1000

        for(k = 0; k < IN_FEATURES; k++) begin
            send_byte(in_features[k]);
            byte_send = in_features[k];
        end
        #30000
        for(j = 0; j <= OUT_FEATURES; j++) begin
            #(BAUD_PERIOD * 11);
        end
        $finish;
    end

    task send_byte(input [7:0] data);
        integer i;
        begin
            // Start bit (0)
            i_rx = 0;
            #(BAUD_PERIOD);

            // Data bits (LSB first)
            for (i = 0; i < 8; i++) begin
                i_rx = data[i];
                #(BAUD_PERIOD);
            end

            // Stop bit (1)
            i_rx = 1;
            #(BAUD_PERIOD);
        end
    endtask

endmodule