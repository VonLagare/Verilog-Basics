module lab2Bbehavioral(a, b, c, d, x);
    input a,b,c,d;
    output x;
    reg g1, g2, g3;
    reg x;


    always@(a, b, c, d)
        begin
            g1 = a & b;
            g2 = c ~| g1;
            x = g1^d;
        end


endmodule

module testBench;
    reg a, b,c,d;
    wire x;
    initial
    begin
    $display ("a  b  c  d  x ");
            a= 1'b0;
            b= 1'b0;
            c= 1'b0;
            d= 1'b0;
            #15 $finish;
    end
    always #8 a= ~a;
    always #4 b= ~b;
    always #2 c= ~c;
    always #1 d= ~d;

    lab2Bbehavioral U1 (a,b,c,d,x);
    initial
    $monitor("%d  %d  %d %d  %d", a , b, c, d, x);

endmodule