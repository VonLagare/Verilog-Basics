// A gate level example
module gateLevel (a,b,c,d);
    input a,b;
    output c,d;

assign c = a&b;
assign d = a^b;

endmodule

module testModule;
    reg a,b;
    wire c,d;
    gateLevel U1(a,b,c,d);

    initial
    begin
        $monitor($time, " a=%b, b=%b, c=%b, d=%b", a,b,c,d);
        #2 a = 0; b = 0;
        #2 a = 0; b = 1;
        #2 a = 1; b = 0;
        #2 a = 1; b = 1;
        #2 $finish;
    end
    
endmodule