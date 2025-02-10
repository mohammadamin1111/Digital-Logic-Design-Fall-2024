 module top_module1(input [3:0] start_adress,input [7:0]data_in , input clock , input start,input reset,
  output logic [15:0] out_put,output logic done,output logic [3:0] adress);

    logic [1:7] en;
    logic s1;
    logic [2:0]z;
    logic cload,cen;

    determinant_calculator2_2_datapath dp(clock,reset,en,data_in,s1,start_adress,cload,cen,adress,z,out_put);
    determinant_calculator2_2_controller cont(clock,reset,start,z,en,s1,cload,cen,done);

 endmodule