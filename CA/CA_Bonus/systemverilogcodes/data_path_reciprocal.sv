module  data_path_reciprocal #(parameter N=8)(input logic clock,cload,cen,load,start,input logic [1:2]s
,input logic [N-1:0] x,output logic[2*N-1:0] x_inv,output logic ready,output logic [3:0] co);

    logic [N-1:0] r_out,data_in,w1,w2,w3;
    logic [2*N-1:0] mult_result;


    assign data_in=s[1]?mult_result[2*N-2:N-1]:{1'b1,{(N-1){1'b0}}};
    assign w1=s[2]?r_out:w3;
    assign w2=s[2]?x:r_out;
    assign w3=~mult_result[2*N-2:N-1]+1;
    assign x_inv=mult_result;
    register #(N) r(clock,load,data_in,r_out);
    shift_add_multiplier sam(clock,start,w1,w2,mult_result,ready);
    counter#(4) count(clock,cload,cen,4'b0000,co);
endmodule

