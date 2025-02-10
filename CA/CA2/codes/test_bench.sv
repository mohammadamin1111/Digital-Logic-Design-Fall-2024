`timescale 1ns/1ns

module Top_Module_tb;

  logic [15:0] inp1_16, inp2_16;
  logic [2:0] opcode;
  wire [15:0] out_put_one_hot;
  wire [3:0] out_put;
  wire overflow;
  wire [7:0]seven_segment;
  Top_Module uut (inp1_16, inp2_16, opcode, out_put_one_hot, overflow , out_put);
   sevenSegmentDecoder ssd(out_put,seven_segment);
  integer i; 

  initial begin
    inp1_16 = 16'b0000010000000000;
    inp2_16 = 16'b0000000000000100;

    for (i = 1; i < 8; i = i + 1) begin
      opcode = i % 8; 
      #10;
    end

      
    inp1_16 = 16'b0000000000000100;
    inp2_16 = 16'b0000000000001000;

    for (i = 1; i < 8; i = i + 1) begin
      opcode = i % 8; 
      #10;
    end

    inp1_16 = 16'b0000000010000000;
    inp2_16 = 16'b0010000000000000;

    for (i = 1; i < 8; i = i + 1) begin
      opcode = i % 8; 
      #10;
    end

    inp1_16 = 16'b0000100000000000;
    inp2_16 = 16'b0000100000000000;

    for (i = 1; i < 8; i = i + 1) begin
      opcode = i % 8; 
      #10;
    end
  end

endmodule
