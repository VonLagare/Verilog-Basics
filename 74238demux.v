module demux74238 (E1, E2, E3, A0, A1, A2, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
    input E1, E2, E3, A0, A1, A2;
    output Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

    assign Y0 = E3 & ~E2 & ~E1 & ~A2 & ~A1 & ~A0;
    assign Y1 = E3 & ~E2 & ~E1 & ~A2 & ~A1 & A0;
    assign Y2 = E3 & ~E2 & ~E1 & ~A2 & A1 & ~A0;
    assign Y3 = E3 & ~E2 & ~E1 & ~A2 & A1 & A0;
    assign Y4 = E3 & ~E2 & ~E1 & A2 & ~A1 & ~A0;
    assign Y5 = E3 & ~E2 & ~E1 & A2 & ~A1 & A0;
    assign Y6 = E3 & ~E2 & ~E1 & A2 & A1 & ~A0;
    assign Y7 = E3 & ~E2 & ~E1 & A2 & A1 & A0;
    
endmodule

module testbench;
reg E1, E2, E3, A0, A1, A2;
wire Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7;

initial begin
$display("E3 E2 E1 A2 A1 A0 | Y0 Y1 Y2 Y3 Y4 Y5 Y6 Y7");
E3 = 1'b1; E2 = 1'b0; E1 = 1'b0;
A0 = 1'b0; A1 = 1'b0; A2 = 1'b0;
#7 $finish;
end

    always #4 A2 = ~A2;
    always #2 A1 = ~A1;
    always #1 A0 = ~A0;

demux74238 U1(E1, E2, E3, A0, A1, A2, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
initial
$monitor("%b   %b  %b  %b  %b  %b |  %b  %b  %b  %b  %b  %b  %b  %b", E3, E2, E1, A2, A1, A0, Y0, Y1, Y2, Y3, Y4, Y5, Y6, Y7);
endmodule