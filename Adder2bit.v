module Adder2bit(a1,b1,a0,b0, carryIn2, sum1, sum0);
input a1,b1,a0,b0;
output carryIn2, sum1, sum0;
wire carryIn1;

assign carryIn1 = a0&b0;
assign sum0 = a0^b0;
assign sum1 = a1^b1^carryIn1;
assign carryIn2 = (a1&b1) | (a1&carryIn1) | (b1&carryIn1);
endmodule

module Testbench;
reg a1,b1,a0,b0;
wire carryIn2, sum1, sum0;
initial
begin
$display("time b[0] a[0] b[1] a[1] sum0 sum1 carryIn2");
a1=1'b0; b1=1'b0; a0=1'b0; b0=1'b0;
#15 $finish;
end

always #8 b0 = ~b0;
always #4 a0 = ~a0;
always #2 b1 = ~b1;
always #1 a1 = ~a1;
Adder2bit UI(a1,b1,a0,b0,carryIn2,sum1,sum0);
initial
$monitor("%g    %b    %b   %b   %b   %b   %b   %b",$time,	b0,	a0,	b1,	a1,	sum0, sum1, carryIn2);
endmodule