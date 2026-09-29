module tb_kan ();

    parameter IN_FEATURES  = 13;
    parameter IN_WIDTH     = 6;
    parameter OUT_FEATURES = 3;
    parameter OUT_WIDTH    = 6;
    parameter DELAY_OUTPUT = 10;
    parameter TEST         = 54;

    logic                                              i_clk    = 0;
    logic                                              i_rst_n  = 0;
    logic                                              i_en     = 0;
    logic        [IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] i_vector;
    logic signed [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] out_dut, test_o;
    logic                   [$clog2(OUT_FEATURES)-1:0] o_index, pred_index;
    logic                                              i_start = 0;
    logic                                              o_done  ;

    // kan_core #(
    //     .IN_FEATURES (IN_FEATURES), 
    //     .IN_WIDTH    (IN_WIDTH), 
    //     .OUT_FEATURES(OUT_FEATURES), 
    //     .OUT_WIDTH   (OUT_WIDTH)
    // ) dut (
    //     .i_clk   (i_clk),
    //     .i_rst_n (i_rst_n),
    //     .i_en    (i_en),
    //     .i_vector(i_vector),
    //     .o_vector(o_vector)
    // );

    kan_top #(
        .IN_FEATURES (IN_FEATURES), 
        .IN_WIDTH    (IN_WIDTH), 
        .OUT_FEATURES(OUT_FEATURES), 
        .OUT_WIDTH   (OUT_WIDTH),
        .TOTAL_DELAY (DELAY_OUTPUT - 1)
    ) dut (
        .i_clk      (i_clk)     ,
        .i_rst_n    (i_rst_n)   ,
        .i_en       (i_en)      ,
        .i_start    (i_start)   ,
        .i_vector   (i_vector)  ,
        .o_done     (o_done)    ,
        .o_accuracy () ,
        .o_index    (o_index)                     
    );

    initial begin 
        $shm_open("waves.shm")  ;
        $shm_probe("ASM")       ;
    end

    int in_file, out_file, pred_file, temp;
    int test = 0;
    int fail = 0;

    task automatic report_vec (
        input string prefix,
        input int vec_idx,
        input logic signed [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] vec
    );
        $write("%s - vec = %0d: [", prefix, vec_idx);

        for (int i = 0; i < OUT_FEATURES; i++) begin
            $write("%0d", $signed(vec[i]));
            if (i != OUT_FEATURES - 1) $write(", ");
        end
        $write("]\n");
    endtask

    always #10 i_clk = ~i_clk;

    initial begin: open_block
        in_file   = $fopen("../tb/vectors_in.txt" , "r");
        out_file  = $fopen("../tb/vectors_out.txt", "r");
        pred_file = $fopen("../tb/pred_idx.txt"   , "r");

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
                //while (!$feof(in_file)) begin
                while (test != TEST) begin
                    for(int idx_in = 0; idx_in < IN_FEATURES; idx_in++) begin
                        if($fscanf(in_file, "%d", temp) != 1) begin
                            // if(test == TEST) begin
                            //     out_while = 1;
                            //     break;      
                            // end
                            $display(1, "Bad in_file format at test %0d", test);
                        end
                        i_vector[idx_in] = temp;
                    end
                    
                    i_start = 1;
                    @(posedge i_clk);
                    #1;
                    i_start = 0;

                    repeat (DELAY_OUTPUT - 1) @(posedge i_clk);
                    #1;

                    for(int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) begin
                        if($fscanf(out_file, "%d", temp) != 1) $display(1, "Bad out_file format at test %0d", test);
                        test_o[idx_out] = temp;
                    end

                    if($fscanf(pred_file, "%d\n", temp) != 1) $display(1, "Bad out_file format at test %0d", test);
                        pred_index = temp;

                    for(int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) begin
                        out_dut[idx_out] = dut.core_out[idx_out];
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

                    if(pred_index != o_index) $display("[ERROR PREDICT INDEX] Test: %2d - EXP: %0d - DUT %0d ", test, pred_index, o_index);
                    else $display("[PREDICT INDEX] Test: %2d - EXP: %0d - DUT %0d ", test, pred_index, o_index);

                    test++;
                    
                    #1;
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