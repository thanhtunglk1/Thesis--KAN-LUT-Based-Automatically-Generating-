import kan_core_pkg::*;

module tb_kan ();

parameter DELAY_OUTPUT     = {{DELAY_OUTPUT}};
parameter TEST             = {{TEXT}};
parameter SHOW_PASS_DETAIL = 1;

logic                                              i_clk    = 0;
logic                                              i_rst_n  = 0;
logic                                              i_en     = 0;
logic        [IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] i_vector;
logic signed [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] out_dut, test_o, core_out;
logic                   [$clog2(OUT_FEATURES)-1:0] o_index, pred_index;
logic                                              i_start = 0;
logic                                              o_done;

kan_top dut (
    .i_clk    (i_clk),
    .i_rst_n  (i_rst_n),
    .i_en     (i_en),
    .i_start  (i_start),
    .i_vector (i_vector),
    .o_done   (o_done),
    .o_vector (core_out),
    .o_index  (o_index)
);

initial begin
    $shm_open("waves.shm");
    $shm_probe("ASM");
end

int in_file, out_file, pred_file, temp;
int test = 0;
int fail = 0;

always #10 i_clk = ~i_clk;


task automatic report_vec (
    input string prefix,
    input logic signed [OUT_FEATURES-1:0][OUT_WIDTH-1:0] vec
);
    $write("%s[", prefix);

    for (int i = 0; i < OUT_FEATURES; i++) begin
        $write("%0d", $signed(vec[i]));
        if (i != OUT_FEATURES - 1)
            $write(", ");
    end

    $write("]");
endtask


task automatic report_result (
    input int test_idx,
    input logic signed [OUT_FEATURES-1:0][OUT_WIDTH-1:0] exp_vec,
    input logic signed [OUT_FEATURES-1:0][OUT_WIDTH-1:0] dut_vec,
    input logic [$clog2(OUT_FEATURES)-1:0] exp_index,
    input logic [$clog2(OUT_FEATURES)-1:0] dut_index
);
    bit output_error;
    bit index_error;

    output_error = 0;

    for (int i = 0; i < OUT_FEATURES; i++) begin
        if (exp_vec[i] != dut_vec[i])
            output_error = 1;
    end

    index_error = (exp_index != dut_index);

    // PASS
    if (!output_error && !index_error) begin
        $display("[TEST %04d] PASS | output=OK | pred=OK", test_idx + 1);

        if (SHOW_PASS_DETAIL) begin
            $write("              ├─ ");
            report_vec("EXP : ", exp_vec);
            $display("");

            $write("              ├─ ");
            report_vec("DUT : ", dut_vec);
            $display("");

            $display("              └─ PRED: EXP=%0d DUT=%0d",
                     exp_index, dut_index);
        end
    end

    // FAIL
    else begin
        $display("[TEST %04d] FAIL | output=%s | pred=%s", test_idx + 1, output_error ? "FAIL" : "OK", index_error ? "FAIL" : "OK");

        // Full result
        $write("              ├─ ");
        report_vec("EXP : ", exp_vec);
        $display("");

        $write("              ├─ ");
        report_vec("DUT : ", dut_vec);
        $display("");

        $display("              └─ PRED: EXP=%0d DUT=%0d", exp_index, dut_index);

        // Mismatch
        $display("");
        $display("              MISMATCH:");

        if (output_error) begin
            for (int i = 0; i < OUT_FEATURES; i++) begin
                if (exp_vec[i] != dut_vec[i]) $display("              ├─ OUT[%0d] : EXP=%0d DUT=%0d", i, $signed(exp_vec[i]), $signed(dut_vec[i]));

            end
        end

        if (index_error) $display("              └─ PRED    : EXP=%0d DUT=%0d", exp_index, dut_index);
    end
endtask

initial begin: open_block

    in_file   = $fopen("../tb/vectors_in.txt", "r");
    out_file  = $fopen("../tb/vectors_out.txt", "r");
    pred_file = $fopen("../tb/pred_idx.txt", "r");

    if (in_file  == 0) $fatal(1, "Cannot open vectors_in.txt");
    if (out_file == 0) $fatal(1, "Cannot open vectors_out.txt");

    for (int idx_in = 0; idx_in < IN_FEATURES; idx_in++)
        i_vector[idx_in] = '0;

    for (int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) begin
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
            while (test != TEST) begin
                for (int idx_in = 0; idx_in < IN_FEATURES; idx_in++) begin
                    if ($fscanf(in_file, "%d", temp) != 1) begin
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

                for (int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) begin
                    if ($fscanf(out_file, "%d", temp) != 1)
                        $display(1, "Bad out_file format at test %0d", test);

                    test_o[idx_out] = temp;
                end

                if ($fscanf(pred_file, "%d\n", temp) != 1)
                    $display(1, "Bad out_file format at test %0d", test);

                pred_index = temp;

                for (int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) out_dut[idx_out] = core_out[idx_out];

                #1;

                report_result(test, test_o, out_dut, pred_index, o_index);

                for (int idx_out = 0; idx_out < OUT_FEATURES; idx_out++) if (test_o[idx_out] != out_dut[idx_out]) fail++;

                test++;

                #1;
            end

            repeat (DELAY_OUTPUT) @(posedge i_clk);

            $fclose(in_file);
            $fclose(out_file);

            $display("");
            $display("============================================================");
            $display("                       TEST SUMMARY");
            $display("============================================================");
            $display(" Total Tests : %0d", test);
            $display(" Passed      : %0d", test - fail);
            $display(" Failed      : %0d", fail);
            $display("------------------------------------------------------------");
                    
            if (fail == 0)
                $display(" Result      : *** ALL TESTS PASSED ***");
            else
                $display(" Result      : *** TEST FAILED ***");
            
            $display("============================================================");
        end

        begin
            #10000000;
            $fatal(1, "STUCK ERROR");
        end
    join_any

    $finish;
end

endmodule