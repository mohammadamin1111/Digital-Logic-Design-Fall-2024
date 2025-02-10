`timescale 1ns/1ns
module determinant_calculator3_3_tb();

logic clock,Start,Done,reset;
logic[3:0] start_adress;
logic [15:0] out_put_det3;
logic [3:0] adress;
logic[7:0] data_in;

top_module2 dc(start_adress,data_in,clock,Start,reset,out_put_det3,Done,adress);
ROM  #(8,16) MMRY(adress,data_in);

initial begin
    clock=0;
    Start=0;
    reset=1;
end
initial begin
  repeat(200) #5 clock=~clock;
end

initial begin
#2
start_adress=1;
Start=1;
reset=0;
#10
Start=0;
#500
reset=1;
#1
reset=0;
start_adress=0;
Start=1;

end

endmodule