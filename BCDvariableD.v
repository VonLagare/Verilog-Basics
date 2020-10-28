module bcd (W,X,Y,Z,d);
input W,X,Y,Z;
output d;
wire g1, g2, g3, g4;

assign g1 = ~W;
assign g2 = ~X;
assign g3 = ~Y;
assign g4 = ~Z;

assign d = (g1&Y) | (g2&g3&g4) | (g1&X&Z); 
    
endmodule

module testBench;
reg W,X,Y,Z;
wire d;

initial
begin
    $display("W X Y Z d");
    W=1'b0; X=1'b0; Y=1'b0; Z=1'b0;
    #15 $finish;
end

always #8 W=~W;
always #4 X=~X;
always #2 Y=~Y;
always #1 Z=~Z;

bcd U1(W,X,Y,Z,d);
initial
$monitor("%b %b %b %b %b ", W,X,W,Z,d);

endmodule
