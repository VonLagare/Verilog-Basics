module decimalToBinaryEncoder (I9,I8,I7,I6,I5,I4,I3,I2,I1,A,B,C,D);
    input I9,I8,I7,I6,I5,I4,I3,I2,I1;
    output A,B,C,D;

    assign D = I8 | I9;
    assign C = I4 | I5 |I6 | I7;
    assign B = I2 | I3 |I6 | I7;
    assign A = I1 | I3 | I5 | I7 |I9;

    
endmodule

module testbench;
reg I9,I8,I7,I6,I5,I4,I3,I2,I1;
wire A,B,C,D;
initial begin
$display("I9  I8  I7  I6  I5  I4  I3  I2  I1 | D  C  B  A");
I1 = 1'b1; I2 = 1'b0; I3 = 1'b0; I4 = 1'b0; I5 = 1'b0; I6 = 1'b0;
I7 = 1'b0; I8 = 1'b0; I9 = 1'b0;
#8 $finish;
end
        initial #8 I9 = ~I9;
        initial #7 I8 = ~I8;
        initial #8 I8 = ~I8;
        initial #6 I7 = ~I7;
        initial #7 I7 = ~I7;
        initial #5 I6 = ~I6;
        initial #6 I6 = ~I6;
        initial #4 I5 = ~I5;
        initial #5 I5 = ~I5;
        initial #3 I4 = ~I4;
        initial #4 I4 = ~I4;
        initial #2 I3 = ~I3;
        initial #3 I3 = ~I3;
        initial #1 I2 = ~I2;
        initial #2 I2 = ~I2;
        initial #1 I1 = ~I1;

decimalToBinaryEncoder U1(I9,I8,I7,I6,I5,I4,I3,I2,I1,A,B,C,D);
initial
$monitor("%b   %b   %b   %b   %b   %b   %b   %b   %b  |  %b  %b  %b  %b",
 I9,I8,I7,I6,I5,I4,I3,I2,I1,D,C,B,A);
endmodule