module mux74151 (A, B, C, I0, I1, I2, I3, I4, I5, I6, I7, Z, notZ);
    input A, B, C, I0, I1, I2, I3, I4, I5, I6, I7;
    output Z, notZ;
    wire wire0, wire1, wire2, wire3, wire4, wire5, wire6, wire7;
    
    assign wire0 = I0&~C&~B&~A;
    assign wire1 = I1&~C&~B&A;
    assign wire2 = I2&~C&B&~A;
    assign wire3 = I3&~C&B&A;
    assign wire4 = I4&C&~B&~A;
    assign wire5 = I5&C&~B&A;
    assign wire6 = I6&C&B&~A;
    assign wire7 = I7&C&B&A;


   assign Z = wire0 | wire1 | wire2 | wire3 | wire4 | wire5 | wire6 | 
                wire7;

    assign notZ = ~Z;

endmodule

module testbench;
reg A, B, C, I0, I1, I2, I3, I4, I5, I6, I7;
wire Z, notZ;

initial begin
$display("C  B  A  I0 I1 I2 I3 I4 I5 I6 I7  | ~Z Z");
A = 1'b0; B = 1'b0; C = 1'b0;
I0 = 1'b0; I1 = 1'b0; I2 = 1'b0; I3 = 1'b0; I4 = 1'b0; I5 = 1'b0; I6 = 1'b0;
I7 = 1'b0;
#15 $finish;
end


    always #8 C = ~C;
    always #4 B = ~B;
    always #2 A = ~A;

    initial #0 I0 = I0;
    initial #1 I0 = ~I0;
    initial #2 I0 = ~I0;

    initial #2 I1 = I1;
    initial #3 I1 = ~I1;
    initial #4 I1 = ~I1;

    initial #4 I2 = I2;
    initial #5 I2 = ~I2;
    initial #6 I2 = ~I2;

    initial #6 I3 = I3;
    initial #7 I3 = ~I3;
    initial #8 I3 = ~I3;

    initial #8 I4 = I4;
    initial #9 I4 = ~I4;
    initial #10 I4 = ~I4;

    initial #10 I5 = I5;
    initial #11 I5 = ~I5;
    initial #12 I5 = ~I5;

    initial #12 I6 = I6;
    initial #13 I6 = ~I6;
    initial #14 I6 = ~I6;

    initial #14 I7 = I7;
    initial #15 I7 = ~I7;

mux74151 U1(A, B, C, I0, I1, I2, I3, I4, I5, I6, I7, Z, notZ);
initial
$monitor("%b  %b  %b   %b  %b  %b  %b  %b  %b  %b  %b  | %b  %b",C, B, A, I0, I1, I2, I3, I4, I5, I6, I7, notZ, Z);
endmodule