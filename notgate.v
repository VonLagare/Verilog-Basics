module notgate(a,x);
input a;
output x;
not a1(x,a);
endmodule

module TestBench;
	reg a ;
	wire x;
	initial
	begin
	$display("time a x"); //print
	a = 0 ;
	
	#1 a=1;		// a = 1
	#1 ;
	end
	
	
	notgate U1(a,x);
	initial
	$monitor("%g a=%b x=%b,$time,a x");
endmodule