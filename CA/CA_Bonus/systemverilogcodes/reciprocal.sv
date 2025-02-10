module reciprocal #(parameter N=8)(input logic clock,req,input logic [N-1:0] x,input logic[3:0] n_iter,
 output logic [2*N-1:0] x_inv,output logic ack);

    logic [1:2] s;
    logic cload,cen,load,start,ready;
    logic [3:0] co;


    data_path_reciprocal #(N) dp2(clock,cload,cen,load,start,s,x,x_inv,ready,co);
    controller_reciprocal cont2(clock,ready,req,co,s,start,cload,cen,load,ack,n_iter);


endmodule
