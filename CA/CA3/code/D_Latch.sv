module D_lath (input D,input Clk,input en,input reset, output logic Q , output logic Qb);
wire P1,P2,R,w;
    and(w,Clk,en);
    nand(P1,D,w,reset);
    not(R,D);
    nand(P2,R,w);
    nand(Q,P1,Qb);
    nand(Qb,P2,Q,reset);

endmodule
