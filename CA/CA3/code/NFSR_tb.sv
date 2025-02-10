`timescale 1ns/1ns
module NFSR_tb;
   logic Clk=0;
   logic reset=1;
   logic shift_en;

   logic [23:0] X;
   logic [23:0] SEED=24'h9a172d;
   logic ser_out;
   logic Par_load;

NFSR nfsr24 (Clk,reset ,Par_load,shift_en,0,SEED,X,ser_out);


initial begin
    repeat(50) #10 Clk=~Clk;
end
initial begin
    shift_en=0;
    Par_load=1;
    #12
    shift_en=1;
    Par_load=0;
    #250
    shift_en=0;
    Par_load=1;
    SEED=80'he6720b;
    #12
    shift_en=1;
    Par_load=0;

end


endmodule

