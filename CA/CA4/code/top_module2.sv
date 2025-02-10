 module top_module2 (input [3:0] start_adress,input [7:0]data_in , input clock , input Start,input reset,
  output logic [15:0] out_put_det3,output logic Done,output logic [3:0] adress);

    logic [1:13] en;
    logic [1:0]s;
    logic [3:0] select,flag;
    logic cload,cen;
    logic start;
    logic [15:0] out_put_det2;
    logic [7:0] k;
    logic done;
    determinant_calculator3_3_datapath dp2(clock,reset,out_put_det2 ,en,data_in,s,select,start_adress,cload,cen,out_put_det3,adress,flag,k);
    determinant_calculator3_3_controller cont2(clock,reset,done,start,Start,flag,en,s,select,cload,cen,Done);
    top_module1_updated dc(k,clock,start,reset,out_put_det2,done);

 endmodule



