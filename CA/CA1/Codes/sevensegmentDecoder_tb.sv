`timescale 1ns/1ns
module sevensegmentDecoder_TB;
    logic w,x,y,z;
    logic [6:0] out;

    sevenSegmentDecoder SSD(w,x,y,z,out);

    initial begin
       for(int number=0 ; number<10 ; number++)begin

            {w,x,y,z}=number;
            #8;

       end

        
    end


endmodule

