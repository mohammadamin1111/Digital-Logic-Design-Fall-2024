`timescale 1ns/1ns
module Grain_tb;
   logic Clk=0;
   logic reset=1;
   logic shift_en;
   logic [23:0] X_n;
   logic [23:0] SEED_n=24'h9a172d;
   logic [79:0] X_l;
   logic [79:0] SEED_l=80'h123456789ABCDEF12345;
   logic main_output;
   logic Par_load;

Grain grain(Clk,reset ,Par_load,shift_en, SEED_l , SEED_n , X_l , X_n, main_output);

initial begin
    repeat(140) #10 Clk=~Clk;
end
initial begin
    shift_en=0;
    Par_load=1;
    #12
    shift_en=1;
    Par_load=0;
end

initial begin

    #700
    shift_en=0;
    Par_load=1;
    SEED_n=24'h313ec8;
    SEED_l=80'h114313ecba9118200465;
    #12
    shift_en=1;
    Par_load=0;
end
endmodule
