module lab2BehavioralLevel (y ,w, x);
    input w, x;
    output y;
    reg t1, t2, t3, t4, t5, t6;
    reg y;
    always @(w, x)
    begin
         t1 = x & w;
         t2 = ~w;
         t3 = x & t2;
         t4 = ~x;
         t5 = t4 & w;
         t6 = t1 | t3;
         y = t6 | t5;
    end

endmodule

module testBench;
    reg w, x;
    wire y;
    lab2BehavioralLevel U1(y, w, x);

    initial
 
    begin
        $monitor($time, " w=%d, x=%d, y=%d", w, x, y);

        #5 w=1'b0; x=1'b0;
        #5 w=1'b0; x=1'b1;
        #5 w=1'b1; x=1'b0;
        #5 w=1'b1; x=1'b1;
        #5 $finish;
    end
    
endmodule