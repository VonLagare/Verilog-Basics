module Adder4bit(a3,b3,a2,b2,a1,b1,a0,b0,carryIn4,sum3,sum2,sum1,sum0);
input a3,b3,a2,b2,a1,b1,a0,b0;
output carryIn4,sum3,sum2, sum1, sum0;
wire carryIn1,carryIn2,carryIn3;

assign carryIn1 = a0&b0;
assign carryIn2 = (a1&b1) | (a1&carryIn1) | (b1&carryIn1);
assign carryIn3 = (a2&b2) | (a2&carryIn2) | (b2&carryIn2);
assign sum0 = a0^b0;
assign sum1 = a1^b1^carryIn1;
assign sum2 = a2^b2^carryIn2;
assign sum3 = a3^b3^carryIn3;
assign carryIn4 = (a3&b3) | (a3&carryIn3) | (b3&carryIn3);
endmodule

module Testbench;
reg a3,a2,a1,a0,b3,b2,b1,b0;
wire sum0,sum1,sum2,sum3,carryin4;
initial
begin
$display("time   a3   a2   a1   a0   b3   b2   b1   b0   carryIn4   sum3   sum2   sum1   sum0");
a3=1'b0; a2=1'b0; a1=1'b0; a0=1'b0;b3=1'b0; b2=1'b0; b1=1'b0; b0=1'b0;
#255 $finish;
end

always #128 a3 = ~a3;
always #64 a2 = ~a2;
always #32 a1 = ~a1;
always #16 a0 = ~a0;
always #8 b3 = ~b2;
always #4 b2 = ~b2;
always #2 b1 = ~b1;
always #1 b0 = ~b0;
Adder4bit UI(a3,b3,a2,b2,a1,b1,a0,b0,carryIn4,sum3,sum2,sum1,sum0);
initial
$monitor("%g      %b     %b    %b   %b    %b    %b    %b    %b       %b         %b       %b      %b      %b",$time,a3,b3,a2,b2,a1,b1,a0,b0,carryIn4,sum3,sum2,sum1,sum0);
endmodule