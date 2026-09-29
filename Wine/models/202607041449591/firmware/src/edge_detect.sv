module edge_detect #(
    parameter EGDE = 0 // rising 1, falling 0
)(
    input  logic i_clk   ,
    input  logic i_rst_n ,
    input  logic i_en    ,
    input  logic i_signal,
    output logic o_egde
);

    logic delay;

    always_ff @(posedge i_clk, negedge i_rst_n) begin
        if(i_rst_n)   delay <=     1'b0;
        else if(i_en) delay <= i_signal;
    end

    generate
        if(EGDE == 0) assign o_egde = ~i_signal &  delay; // falling
        else          assign o_egde =  i_signal & ~delay; // rising
    endgenerate
    
endmodule

