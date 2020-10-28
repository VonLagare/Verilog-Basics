module bcd (W,X,Y,Z,g);
input W,X,Y,Z;
output g;
wire g1, g2, g3, g4;

assign g1 = ~W;
assign g2 = ~X;
assign g3 = ~Y;
assign g4 = ~Z;

assign g = (g1&Y) | (g1&X) | (W&g2&g3);
    
endmodule

module testBench;
reg W,X,Y,Z;
wire g;

initial
begin
    $display("W X Y Z g");
    W=1'b0; X=1'b0; Y=1'b0; Z=1'b0;
    #15 $finish;
end

always #8 W=~W;
always #4 X=~X;
always #2 Y=~Y;
always #1 Z=~Z;

bcd U1(W,X,Y,Z,g);
initial
$monitor("%b %b %b %b %b ", W,X,W,Z,g);

endmodule

