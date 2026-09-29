module tb_kan ();

    parameter IN_FEATURES  = 2;
    parameter IN_WIDTH     = 6;
    parameter OUT_FEATURES = 1;
    parameter OUT_WIDTH    = 8;
    parameter DELAY_OUTPUT = 5;
    parameter TEST         = 10;

    logic                                       i_clk    = 0;
    logic                                       i_rst_n  = 0;
    logic                                       i_en     = 0;
    logic [IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] i_vector;
    logic [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] o_vector, out_dut;

    KAN #(
        .IN_FEATURES (IN_FEATURES), 
        .IN_WIDTH    (IN_WIDTH), 
        .OUT_FEATURES(OUT_FEATURES), 
        .OUT_WIDTH   (OUT_WIDTH)
    ) dut (
        .i_clk   (i_clk),
        .i_rst_n (i_rst_n),
        .i_en    (i_en),
        .i_vector(i_vector),
        .o_vector(o_vector)
    );

    initial begin 
        $shm_open("waves.shm")  ;
        $shm_probe("ASM")       ;
    end

    int in_file, out_file, temp;
    int test = 0;
    int fail = 0;
    logic out_while = 0;  

    // logic [TEST - 1:0][IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] test_i;
    // logic [TEST - 1:0][OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] test_o;

    // logic [IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] test_i;
    logic [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] test_o;

    task automatic report_vec (
        input string prefix,
        input int vec_idx,
        input logic signed [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] vec
    );
        $write("%s - vec = %0d: [", prefix, vec_idx);

        for (int i = 0; i < OUT_FEATURES; i++) begin
            $write("%0d", vec[i]);
            if (i != OUT_FEATURES - 1) $write(", ");
        end
        $write("]\n");
    endtask

    always #10 i_clk = ~i_clk;

    initial begin: open_block
        in_file  = $fopen("../tb/vectors_in.txt" , "r");
        out_file = $fopen("../tb/vectors_out.txt", "r");

        if (in_file  == 0) $fatal(1, "Cannot open vectors_in.txt" );
        if (out_file == 0) $fatal(1, "Cannot open vectors_out.txt");

        // for(int idx_test = 0; idx_test < TEST; idx_test++) begin
        //     for(int idx_in = 0; idx_in < IN_FEATURES; idx_in++) begin
        //         status = $fscanf(in_file, "%d", temp);
        //         test_i[idx_test][idx_in] = temp;
        //     end

        //     for(int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) begin
        //         status = $fscanf(out_file, "%d", temp);
        //         test_o[idx_test][idx_out] = temp;
        //     end
        // end

        for(int idx_in = 0; idx_in < IN_FEATURES; idx_in++) begin
            i_vector[idx_in] = '0;
        end

        for(int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) begin
            out_dut[idx_out] = '0;
            test_o[idx_out]  = '0; 
        end

        #20;
        i_rst_n = 1;
        #10;
        i_en = 1;
        #1;

        fork
            begin
                while (!$feof(in_file)) begin
                    for(int idx_in = 0; idx_in < IN_FEATURES; idx_in++) begin
                        if($fscanf(in_file, "%d", temp) != 1) begin
                            if(test == TEST) begin
                                out_while = 1;
                                break;      
                            end
                            $display(1, "Bad in_file format at test %0d", test);
                        end
                        i_vector[idx_in] = temp;
                    end

                    if (out_while == 1) break;

                    repeat (DELAY_OUTPUT) @(posedge i_clk);
                    #1;

                    for(int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) begin
                        if($fscanf(out_file, "%d", temp) != 1) $display(1, "Bad out_file format at test %0d", test);;
                        test_o[idx_out] = temp;
                    end

                    for(int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) begin
                        out_dut[idx_out] = o_vector[idx_out];
                    end
                    #1;

                    report_vec("EXP:", test, test_o );
                    report_vec("DUT:", test, out_dut);

                    for(int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) begin
                        if(test_o[idx_out] != out_dut[idx_out]) begin
                            fail++;
                            $display("[ERROR] Test: %2d - Output: %2d - EXP: %0d - DUT: %0d", test, idx_out, test_o[idx_out], out_dut[idx_out]); 
                        end
                    end

                    test++;
                end

                repeat (DELAY_OUTPUT) @(posedge i_clk);

                $fclose(in_file) ;
                $fclose(out_file);

                if (fail == 0) $display("ALL TESTS PASSED (%0d tests)", test);

                else $display("TEST FAILED: %0d/%0d mismatches out of %0d tests", fail, (test + 1) * OUT_FEATURES, test);
            end

            begin
                #100000; // TIME OUT
                $fatal(1, "STUCK ERROR");
            end
        join_any
        $finish;
    end

endmodule