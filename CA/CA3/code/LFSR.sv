module LFSR (input Clk,reset ,Par_load,shift_en,input [79:0] SEED,output [79:0] X,output ser_out);

logic ser_in;
shift_register #(80) sr80(Clk, ser_in,reset ,Par_load,shift_en,SEED,X,ser_out);
xor(ser_in,X[62],X[51],X[38],X[23],X[13],X[0]);


endmodule