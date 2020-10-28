module demux1to8 (S0, S1, S2, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Din);
    input S0, S1, S2, Din;
    output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

    assign Y0 = ~S0 & ~S1 & ~S2 & Din;
    assign Y1 = ~S0 & ~S1 & S2 & Din;
    assign Y2 = ~S0 & S1 & ~S2 & Din;
    assign Y3 = ~S0 & S1 & S2 & Din;
    assign Y4 = S0 & ~S1 & ~S2 & Din;
    assign Y5 = S0 & ~S1 & S2 & Din;
    assign Y6 = S0 & S1 & ~S2 & Din;
    assign Y7 = S0 & S1 & S2 & Din;
    
endmodule

module testbench;
reg S0, S1, S2, Din;
wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

initial begin
$display("Din S0 S1 S2 | Y0 Y1 Y2 Y3 Y4 Y5 Y6 Y7");
S0 = 1'b0; S1 = 1'b0; S2 = 1'b0; Din = 1'b1;
#7 $finish;
end
    
    always #4 S0 = ~S0;
    always #2 S1 = ~S1;
    always #1 S2 = ~S2;

demux1to8 U1(S0, S1, S2, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7, Din);
initial
$monitor("%b   %b  %b  %b  |  %b  %b  %b  %b  %b  %b  %b  %b", Din, S0, S1, S2, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
endmodule