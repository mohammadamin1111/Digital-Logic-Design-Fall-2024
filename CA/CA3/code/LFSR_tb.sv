`timescale 1ns/1ns
module LFSR_tb;
   logic Clk=0;
   logic reset=1;
   logic shift_en;

   logic [79:0] X;
   logic [79:0] SEED=80'h123456789ABCDEF12345;
   logic ser_out;
   logic Par_load;

LFSR lfsr80(Clk,reset ,Par_load,shift_en,SEED,X,ser_out);


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
    SEED=80'h114313ecba9118200465;
    #12
    shift_en=1;
    Par_load=0;

end

endmodule

