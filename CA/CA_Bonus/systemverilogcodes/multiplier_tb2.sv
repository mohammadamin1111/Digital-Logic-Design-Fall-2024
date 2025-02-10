`timescale 1ns/1ns
module multiplier_tb2();

    logic clock,start,ready;
    logic [31:0] P;
    logic[15:0] A,B;
    shift_add_multiplier #(16) dc(clock,start,A,B,P,ready);
    initial begin
        clock=0;
        start=0;
    end
    initial begin
    repeat(400) #5 clock=~clock;
    end
    initial begin
        #2
        start=1;
        A=1512;
        B=201;
        #20
        start=0;
        #100
        start=1;
        A=207;
        B=810;
        #20
        start=0;
        #100
        start=1;
        A=2000;
        B=660;
        #20
        start=0;
        #100
        start=1;
        A=199;
        B=1120;
        #20
        start=0;
        #100
        start=1;
        A=5000;
        B=500;
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