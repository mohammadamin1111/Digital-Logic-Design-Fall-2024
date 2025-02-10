`timescale 1ns/1ns
module shift_register_tb;
   logic Clk=0;
   logic reset=1;
   logic shift_en;
   logic [0:7] Par_out;
   logic [0:7] Par_in=8'b10101011;
   logic ser_in;
   logic ser_out;
   logic Par_load;

shift_register sr8(Clk, ser_in,reset ,Par_load,shift_en,Par_in, Par_out,ser_out);


initial begin
    repeat(40) #10 Clk=~Clk;
end
initial begin
    shift_en=0;
    Par_load=1;
    #12
    shift_en=1;
    Par_load=0;
    #220
    shift_en=0;
    Par_load=1;
    Par_in=8'b11011001;
    #20    //because change with sync clock
    shift_en=1;
    Par_load=0;

end
initial begin
      ser_in=1;
      #101
      reset=0;
      #1
      reset=1;
      #100
      ser_in=0;
end

endmodule

