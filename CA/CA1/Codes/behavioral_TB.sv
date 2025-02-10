`timescale 1ns/1ns
module behavioral_sevensegmentDecoder_TB;
    logic w,x,y,z;
    logic [6:0] out;

    behavioral_sevenSegmentDecoder SSD(w,x,y,z,out);

    initial begin
       for(int number=0 ; number<10 ; number+=1)begin

            {w,x,y,z}=number;
            #18;
       end 
    end
endmodule

