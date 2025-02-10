`timescale 1ns/1ns
module new_sevensegmentDecoder_TB;
    logic w=0,x=0,y=0,z=0;
    logic [6:0] out;

    sevenSegmentDecoder SSD(w,x,y,z,out);

    initial begin
          #8;
          {w,x,y,z}=6;
          #8;
          {w,x,y,z}=4;
          #8;
       end 
    
endmodule
