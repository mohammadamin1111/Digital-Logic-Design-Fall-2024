module determinant_calculator3_3_datapath(input clock,input reset,input [15:0] out_put_det2,input [1:13] en,input[7:0] data_in,
input[1:0] s,input[3:0] select,input [3:0] start_adress,input cload,input cen,output logic [15:0] out_put_det3,output logic[3:0] adress,
output logic [3:0]flag,output logic[7:0] k);
logic [7:0] a,b,c,d,e,f,g,h,i;
logic[15:0] multiplier_result,term1,term2,term3,sub_result,final_result;
logic [7:0] A;
counter #(4) countadresses2 (clock,cload,cen,start_adress,adress);
counter #(4) countf(clock,cload,cen,4'b0000,flag);
n_register #(8) ra(clock,reset,en[1],data_in,a);
n_register #(8) rb(clock,reset,en[2],data_in,b);
n_register #(8) rc(clock,reset,en[3],data_in,c);
n_register #(8) rd(clock,reset,en[4],data_in,d);
n_register #(8) re(clock,reset,en[5],data_in,e);
n_register #(8) rf(clock,reset,en[6],data_in,f);
n_register #(8) rg(clock,reset,en[7],data_in,g);
n_register #(8) rh(clock,reset,en[8],data_in,h);
n_register #(8) ri(clock,reset,en[9],data_in,i);
assign A= (s== 2'b00) ? a:  
        (s== 2'b01) ?b:  
        (s== 2'b10) ?c:  
        1'b0;                    

multiplier2 mult2(out_put_det2,A,multiplier_result);
n_register #(16) t1(clock,reset,en[10],multiplier_result,term1);
n_register #(16) t2(clock,reset,en[11],multiplier_result,term2);
n_register #(16) t3(clock,reset,en[12],multiplier_result,term3);
n_register #(16) t4(clock,reset,en[13],final_result,out_put_det3);
subtractor sub2(term1,term2,sub_result);
adder add(sub_result,term3,final_result);

always @(*) begin
        case (select)
            0: k =a; 
            1: k =b; 
            2: k =c; 
            3: k =d; 
            4: k =e; 
            5: k =f; 
            6: k =g; 
            7: k =h; 
            8: k =i; 
            default: k = 8'b00000000; 
        endcase
    end
endmodule