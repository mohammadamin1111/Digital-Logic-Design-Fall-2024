`timescale 1ns/1ns
module D_Latch_tb;
    

    logic D=0;
    logic Clk=0;
    logic en=1;
    logic reset=1; 
    wire Q;
    wire Qb;
    D_lath d_latch(D,Clk,en,reset,Q,Qb);
    initial begin
        repeat(20) #10 Clk=~Clk;
    end

    initial begin
          repeat(20) #7 D=~D;

    end    

    initial begin

       #51
       reset=0;
       #1
       reset=1;
       #10
       reset=0;
       #1
       reset=1;

    end
endmodule
