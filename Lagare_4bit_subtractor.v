module Subtract4bit(a3,b3,a2,b2,a1,b1,a0,b0, borrowed4,diff3,diff2, diff1, diff0);
input a3,b3,a2,b2,a1,b1,a0,b0;
output borrowed4,diff3,diff2, diff1, diff0;
wire borrowed1,borrowed2,borrowed3,g1,g2,g3,g4;

assign g1 = ~a0;
assign g2 = ~a1;
assign g3 = ~a2;
assign g4 = ~a3;

assign borrowed1 = g1&b0;
assign borrowed2 = (g2&b1) | (g2&borrowed1) | (b1&borrowed1);
assign borrowed3 = (g3&b2) | (g3&borrowed2) | (b2&borrowed2);
assign diff0 = a0^b0;
assign diff1 = a1^b1^borrowed1;
assign diff2 = a2^b2^borrowed2;
assign diff3 = a3^b3^borrowed3;
assign borrowed4 = (g4&b3) | (g2&borrowed3) | (b1&borrowed3);
endmodule

module Testbench;
reg a3,a2,a1,a0,b3,b2,b1,b0;
wire diff0,diff1,diff2,diff3,borrowed4;
initial
begin
$display("time   a3   a2   a1   a0   b3   b2   b1   b0   borrowed4   diff3   diff2   diff1   diff0");
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
Subtract4bit U1(a3,b3,a2,b2,a1,b1,a0,b0, borrowed4,diff3,diff2, diff1, diff0);
initial
$monitor("%g      %b     %b    %b   %b    %b    %b    %b    %b       %b         %b       %b      %b      %b",$time,a3,b3,a2,b2,a1,b1,a0,b0, borrowed4,diff3,diff2, diff1, diff0);
endmodule