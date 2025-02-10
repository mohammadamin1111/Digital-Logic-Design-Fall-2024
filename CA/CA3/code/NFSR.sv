module NFSR (input Clk,reset ,Par_load,shift_en, ser_out_lfsr,input [23:0] SEED,output [23:0] X,output ser_out);
                                                //adding ser_out_lfsr for Grain Structure
logic ser_in;
logic w1,w2,w3,w4,g;
shift_register #(24) sr24(Clk, ser_in,reset ,Par_load,shift_en,SEED,X,ser_out);
xor(g,X[0],X[5],X[6],X[9],X[17],X[22],w1,w2,w3,w4);
and(w1,X[4],X[13]);
and(w2,X[8],X[16]);
and(w3,X[5],X[11],X[14]);
and(w4,X[2],X[5],X[8],X[10]);

xor(ser_in, g, ser_out_lfsr);

endmodule