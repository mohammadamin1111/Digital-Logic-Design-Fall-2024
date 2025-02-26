`timescale 1ns/1ns
module reciprocal_tb();

    logic clock,req,ack;
    logic [15:0] P;
    logic[7:0] A=8'b11100001;
    logic [3:0] n_iter=8;
    reciprocal #(8) rep(clock,req,A,n_iter,P,ack);
    initial begin
        clock=0;
        req=0;
        #30
        req=1;
        #200
        req=0;
        #2000
        A=8'b11110111;
        req=1;
        #200
        req=0;
        #2000
        A=8'b10010100;
        req=1;
        #200
        req=0;
        #2000
        A=8'b10100000;
        req=1;
          #200
        req=0;
        #2000
        A=8'b11000000;
        req=1;
          #200
        req=0;


    end
    initial begin
    repeat(5000) #5 clock=~clock;
    end
endmodule