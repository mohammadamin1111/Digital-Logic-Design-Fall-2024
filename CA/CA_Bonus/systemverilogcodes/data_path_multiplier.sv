module  data_path_multiplier #(parameter N=8)(input logic clock,input logic [N-1:0] A,B,
input logic [1:2] en,input logic[1:3] load,input logic s,output logic b0,z,output logic [2*N-1:0] P);

logic [N-1:0] B_out;
logic [2*N-1:0] A_out,sum,data_in;


shift_register #(N) sr1(clock,1,load[1],en[1],B,B_out);
shift_register #(2*N) sr2(clock,0,load[2],en[2],{{N{1'b0}},A},A_out);

assign b0=B_out[0];
assign z= ~|B_out;
assign sum=A_out + P;
assign data_in=s?sum:{2*N{1'b0}};

register #(2*N) r1(clock,load[3],data_in,P);


endmodule


