module HAdder2(a,b,sum,ca);
	input a,b;
	output sum,ca;
	assign sum = a ^ b;
	assign ca = a & b;
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
	
	HAdder2 U1(a,b,sum,ca);
	
	initial
	$monitor("%g	%b	%b	%b	%b", $time,a,b,ca,sum);
	endmodule