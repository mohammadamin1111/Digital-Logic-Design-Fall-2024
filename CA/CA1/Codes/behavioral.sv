
`timescale 1ns/1ns
module behavioral_sevenSegmentDecoder(input logic w,x,y,z , output logic [6:0] out);
    assign out[0]= w|y|(x&z)|(~x&~z); //a
    assign out[1]=~x|(y&z)|(~y&~z);  //b
    assign out[2]=~y|z|x; //c
    assign out[3]=w|(~x&y)|(~x&~z)|(y&~z)|(x&~y&z); //d
    assign out[4]=(y&~z)|(~x&~z);  //e
    assign out[5]=w|(~y&~z)|(x&~z)|(x&~y); //f
    assign out[6]=w|(x&~y)|(y&~z)|(~x&y); //g

endmodule