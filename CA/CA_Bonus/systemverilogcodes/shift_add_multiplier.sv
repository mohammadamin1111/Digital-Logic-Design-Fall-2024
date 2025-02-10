module shift_add_multiplier #(parameter N=8)(input logic clock, start,input logic [N-1:0] A,B, output logic [2*N-1:0] P,output logic ready);

    logic [1:2] en;
    logic [1:3]load;
    logic z,b0,s;

    data_path_multiplier #(N) dp(clock,A,B,en,load,s,b0,z,P);
    controller_multiplier cont(clock,start,z,b0,en,load,ready,s);

endmodule