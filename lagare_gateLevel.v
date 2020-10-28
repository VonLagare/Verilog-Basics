// A gate level example
module gateLevel (a,b,c,d);
    input a,b;
    output c,d;

    and (c, a, b);
    xor (d, a, b);

endmodule
