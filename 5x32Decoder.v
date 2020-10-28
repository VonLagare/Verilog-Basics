module decoder5x32(a,b,c,d,e,d0,d1,d2,d3,d4,d5,d6,d7,
d8,d9,d10,d11,d12,d13,d14,d15,
d16,d17,d18,d19,d20,d21,d22,d23,
d24,d25,d26,d27,d28,d29,d30,d31);

input a,b,c,d,e;
output d0,d1,d2,d3,d4,d5,d6,d7,
d8,d9,d10,d11,d12,d13,d14,d15,
d16,d17,d18,d19,d20,d21,d22,d23,
d24,d25,d26,d27,d28,d29,d30,d31;

assign d0= ~a&~b&~c&~d&~e;
assign d1= ~a&~b&~c&~d&e;
assign d2= ~a&~b&~c&d&~e;
assign d3= ~a&~b&~c&d&e;
assign d4= ~a&~b&c&~d&~e;
assign d5= ~a&~b&c&~d&e;
assign d6= ~a&~b&c&d&~e;
assign d7= ~a&~b&c&d&e;
assign d8= ~a&b&~c&~d&~e;
assign d9= ~a&b&~c&~d&e;
assign d10= ~a&b&~c&d&~e;
assign d11= ~a&b&~c&d&e;
assign d12= ~a&b&c&~d&~e;
assign d13= ~a&b&c&~d&e;
assign d14= ~a&b&c&d&~e;
assign d15= ~a&b&c&d&e;
assign d16= a&~b&~c&~d&~e;
assign d17= a&~b&~c&~d&e;
assign d18= a&~b&~c&d&~e;
assign d19= a&~b&~c&d&e;
assign d20= a&~b&c&~d&~e;
assign d21= a&~b&c&~d&e;
assign d22= a&~b&c&d&~e;
assign d23= a&~b&c&d&e;
assign d24= a&b&~c&~d&~e;
assign d25= a&b&~c&~d&e;
assign d26= a&b&~c&d&~e;
assign d27= a&b&~c&d&e;
assign d28= a&b&c&~d&~e;
assign d29= a&b&c&~d&e;
assign d30= a&b&c&d&~e;
assign d31= a&b&c&d&e;

endmodule

module testbench;
reg x,y,a,b,c,d,e;
wire d0,d1,d2,d3,d4,d5,d6,d7;
initial begin
$display("x y a b c d e | d0 d1 d2 d3 d4 d5 d6 d7 d8 d9 d10 d11 d12 d13 d14 d15",
        " d16 d17 d18 d19 d20 d21 d22 d23 d24 d25 d26 d27 d28 d29 d30 d31");
x = 1'b0; y = 1'b0;
a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0;
#31 $finish;
end
always #16 x = ~x;
always #8 y = ~y;
always #16 a = ~a;
always #8 b = ~b;
always #4 c = ~c;
always #2 d = ~d;
always #1 e = ~e;

decoder5x32 U1(a,b,c,d,e,d0,d1,d2,d3,d4,d5,d6,d7
,d8,d9,d10,d11,d12,d13,d14,d15,
d16,d17,d18,d19,d20,d21,d22,d23,
d24,d25,d26,d27,d28,d29,d30,d31);
initial
$monitor("%b %b %b %b %b %b %b | %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b %b",
 x,y,a,b,c,d,e,d0,d1,d2,d3,d4
,d5,d6,d7, d8,d9,d10,d11,d12,d13,d14,d15,
d16,d17,d18,d19,d20,d21,d22,d23,
d24,d25,d26,d27,d28,d29,d30,d31);
endmodule