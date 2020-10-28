module decoder3x8 (A0,A1,A2,D0,D1,D2,D3,D4,D5,D6,D7);
    input  A0,A1,A2;
    output D0,D1,D2,D3,D4,D5,D6,D7;

    assign D0 = ~A2 & ~A1 & ~A0;
    assign D1 = ~A2 & ~A1 & A0;
    assign D2 = ~A2 & A1 & ~A0;
    assign D3 = ~A2 & A1 & A0;
    assign D4 = A2 & ~A1 & ~A0;
    assign D5 = A2 & ~A1 & A0;
    assign D6 = A2 & A1 & ~A0;
    assign D7 = A2 & A1 & A0;

endmodule

module testbench;
reg A0,A1,A2;
wire D0,D1,D2,D3,D4,D5,D6,D7;
initial begin
$display("A2 A1 A0 | D7 D6 D5 D4 D3 D2 D1 D0");
A0 = 1'b0; A1 = 1'b0; A2 = 1'b0;
#7 $finish;
end

    always #4 A2 = ~A2;
    always #2 A1 = ~A1;
    always #1 A0 = ~A0;

decoder3x8 U1(A0,A1,A2,D0,D1,D2,D3,D4,D5,D6,D7);
initial
$monitor("%b  %b  %b  |  %b  %b  %b  %b  %b  %b  %b  %b",A2,A1,A0,D7,D6,D5,D4,D3,D2,D1,D0);
endmodule