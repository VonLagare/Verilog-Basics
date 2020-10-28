// A gate level example
module behavioralLevel(a,b);
    input a,b;
    reg [1:0]c,d;

    initial
    begin
        c = 'b0;
        d = 'b1;
    end

    always
    begin
        #2 c = a&b;

    end

    always
        begin
        #2 d = a^b;
    end

endmodule

// module testModule;
//     reg a, b;
//     wire c, d;
//     behavioralLevel U1(a,b);

//     initial
//     begin
//         $monitor($time, " a=%b, b=%b, c=%b, d=%b", a,b,c,d);
//         #2 a = 0; b = 0;
//         #2 a = 0; b = 1;
//         #2 a = 1; b = 0;
//         #2 a = 1; b = 1;
//         #2 $finish;
//     end
    
// endmodule