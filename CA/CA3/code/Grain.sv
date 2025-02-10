module Grain(input Clk,reset ,Par_load,shift_en,input [79:0] SEED_l,input [23:0]SEED_n,output [79:0] X_l,output [23:0] X_n,output main_output);

    wire ser_out_lfsr,ser_out_nfsr;
    wire h,w1,w2,w3,w4;

    LFSR lfsr80(Clk,reset ,Par_load,shift_en,SEED_l,X_l,ser_out_lfsr);
    NFSR nfsr24 (Clk,reset ,Par_load,shift_en,ser_out_lfsr,SEED_n,X_n,ser_out_nfsr);
  


    xor(h,X_l[0],X_l[3],X_n[0],X_n[2],w1,w2,w3,w4);
    and(w1,X_l[1],X_l[2]);
    and(w2,X_n[1],X_l[5]);
    and(w3,X_n[3],X_l[7]);
    and(w4,X_l[8],X_l[13],X_n[5]);

    xor(main_output,h,ser_out_nfsr);



endmodule