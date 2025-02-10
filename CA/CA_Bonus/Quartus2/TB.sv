`timescale 1ps/1ps
module reciprocal_tbb();
    logic clock,req,ack;
    logic [15:0] P;
    logic[7:0] A;
    logic [3:0] n_iter=8;
    reciprocal rep(clock,req,A,n_iter,P,ack);
    initial begin
        clock=0;
        req=0;
        #30000
        A=8'b11100001;
        req=1;
        // #200
        // req=0;
        // #2000
        // A=8'b11110111;
        // req=1;
        // #200
        // req=0;
        // #2000
        // A=8'b10010100;
        // req=1;
        // #200
        // req=0;
        // #2000
        // A=8'b10100000;
        // req=1;
        //   #200
        // req=0;
        // #2000
        // A=8'b11000000;
        // req=1;
        //   #200
        // req=0;


    end
    initial begin
    repeat(50000000) #5000 clock=~clock;
    end
endmodule

