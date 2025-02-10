`timescale 1ns/1ns
module multiplier_tb();
    logic clock,start,ready;
    logic [15:0] P;
    logic[7:0] A,B;
    shift_add_multiplier #(8) dc(clock,start,A,B,P,ready);
    initial begin
        clock=0;
        start=0;
    end
    initial begin
    repeat(200) #5 clock=~clock;
    end
    initial begin
        #2
        start=1;
        A=8'b00110101;
        B=8'b01000110;
        #20
        start=0;
        #100
        start=1;
        A=27;
        B=81;
        #20
        start=0;
        #100
        start=1;
        A=13;
        B=66;
        #20
        start=0;
        #100
        start=1;
        A=20;
        B=112;
        #20
        start=0;
        #100
        start=1;
        A=50;
        B=50;
        #20
        start=0;
         #100
        start=1;
        A=192;
        B=128;
        #20
        start=0;

    end
endmodule