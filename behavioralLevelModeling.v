module HAdder3(a,b,sum,ca);
	input a,b;
	output sum,ca;
	reg sum, ca;
	always @(a or b)
	begin
		sum = a ^ b;
		ca = (a & b);
	end
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
	
	HAdder3 U1(a,b,sum,ca);
	
	initial
	$monitor("%g	%b	%b	%b	%b", $time,a,b,ca,sum);
	endmodule