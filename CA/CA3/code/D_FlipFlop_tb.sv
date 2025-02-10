`timescale 1ns/1ns
module D_FlipFlop_tb;
    logic D=0;
    logic Clk=0;
    logic en=1;
    logic reset=1;
    wire Q;
    wire Qb;

    D_FlipFlop DFF(D,Clk,en,reset,Q,Qb);
    initial begin
        repeat(20) #10 Clk=~Clk;
    end

    initial begin
          repeat(20) #7 D=~D;

    end   
    initial begin

     #62 reset=0;
     #2 reset=1;
     //129 -> 149
     #25 en=0;
     #20 en=1;
     

     #27
     reset=0;  //at 196 ns
     #1 reset=1;
    // #16
    // reset=0;
    // #1 reset=1;
    end     
endmodule
