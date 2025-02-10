module determinant_calculator2_2_datapath(input clock,input reset,input [1:7] en,input[7:0] data_in,input s1,
input [3:0] start_adress,input cload,input cen ,output logic[3:0] adress,output logic [2:0]z, output logic[15:0] out_put );
logic [7:0] a;
logic [7:0] b;
logic [7:0] c;
logic [7:0] d;

logic [15:0] ad;
logic [15:0] bc;
logic [15:0] ad_bc;
logic [7:0] x;
logic [7:0] y;
logic [15:0] multiplier_result;

counter #(4) countadresses (clock,cload,cen,start_adress,adress);
counter #(3) count0to3(clock,cload,cen,3'b000,z);

n_register #(8) ra(clock,reset,en[1],data_in,a);
n_register #(8) rb(clock,reset,en[2],data_in,b);
n_register #(8) rc(clock,reset,en[3],data_in,c);
n_register #(8) rd(clock,reset,en[4],data_in,d);


n_register #(16) rad(clock,reset,en[5],multiplier_result,ad);
n_register #(16) rbc(clock,reset,en[6],multiplier_result,bc);
n_register #(16) rad_bc(clock,reset,en[7],ad_bc,out_put);

assign x= s1? b:a;
assign y= s1? c:d;


multiplier mult(x,y,multiplier_result);
subtractor subt(ad,bc,ad_bc);

endmodule