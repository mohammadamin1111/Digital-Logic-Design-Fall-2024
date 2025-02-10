`timescale 1ns/1ns
module sevenSegmentDecoder(input logic w,x,y,z , output logic [6:0] out);

    wire not_w , not_x , not_y, not_z;

    not #(1) N1 (not_w, w);
    not #(1) N2 (not_x, x);
    not #(1) N3 (not_y, y);
    not #(1) N4 (not_z, z);


    wire [1:9] terms;

    and #(2) (terms[1],x,z);  //xz
    and #(2) (terms[2],not_z,not_x);  //~x.~z
    and #(2) (terms[3],y,z);  //yz
    and #(2) (terms[4],not_y,not_z);  //~y.~z
    and #(2) (terms[5],not_x,y);  //~x.y
    and #(2) (terms[6],y,not_z);   //y.~z
    and #(2) (terms[7],x,not_y,z);  //x.~y.z
    and #(2) (terms[8],x,not_z);  //x.~z
    and #(2) (terms[9],x,not_y); //x.~y

    or #(3) (out[0],w,y,terms[1],terms[2]); //a
    or #(3) (out[1],not_x,terms[3],terms[4]);  //b
    or #(3) (out[2],not_y,z,x); //c
    or #(3) (out[3],w,terms[5],terms[2],terms[6],terms[7]); //d
    or #(3) (out[4],terms[6],terms[2]);  //e
    or #(3) (out[5],w,terms[4],terms[8],terms[9]); //f
    or #(3) (out[6],w,terms[9],terms[6],terms[5]); //g


    
endmodule
