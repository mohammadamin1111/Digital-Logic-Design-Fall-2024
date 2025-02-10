`timescale 1ns/1ns
module determinant_calculator2_2_tb();

logic clock,start,done,reset;
logic[3:0] start_adress;
logic [15:0] out_put;
logic [3:0] adress;
logic[7:0] data_in;

top_module1 dc(start_adress,data_in,clock,start,reset,out_put,done,adress);
ROM  #(8,16) MMRY(adress,data_in);

initial begin
    clock=0;
    start=0;
    reset=1;
end
initial begin
  repeat(60) #5 clock=~clock;
end
initial begin
#2
start_adress=1;
start=1;
reset=0;
#10
start=0;
#99
reset=1;
#1
reset=0;
start=1;
start_adress=8;
end
endmodule