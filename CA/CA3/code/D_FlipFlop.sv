module D_FlipFlop(input D,input Clk,input en,input reset, output logic Q , output logic Qb);
  wire Qm,Qmb;
  wire not_Clk;
  not(not_Clk,Clk);
  
  D_lath dl1(D,not_Clk,en,reset,Qm,Qmb);
  D_lath dl2(Qm,Clk,en,reset,Q,Qb);

endmodule