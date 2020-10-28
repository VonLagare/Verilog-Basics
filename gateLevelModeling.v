module HAdder(a,b,sum,ca);
	input a,b;
	output sum,ca;
	xor x1(sum,a,b);
	and a1(ca,a,b);
endmodule

module TestBench;
	reg a,b;
	wire sum,ca;
	initial
	begin
	$display("a[1]a[0] Carry Sum");
		a = 1'b0;
		b = 1'b0;
		#3 $finish;
	end
	
	always#2 a = ~a;
	always#1 b = ~b;
	
	HAdder U1(a,b,sum,ca);
	
	initial
	$monitor("%g	%b	%b	%b	%b", $time,a,b,ca,sum);
	endmodule