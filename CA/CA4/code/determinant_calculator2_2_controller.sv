module determinant_calculator2_2_controller(input clock,input reset,input start,input [2:0]z,
output logic [1:7] en,output logic s1, output logic cload,output logic cen,output logic done );
parameter [2:0] idle=0 ,loading=1,first_multiplier=2,second_multiplier=3,subtraction=4;
logic [2:0] p_state,n_state;
always @(start or z or p_state)begin
    case(p_state)
     idle:begin 
        done=1;
        cload=1;
        cen=0;
        en = '{default: 0};
        s1=0;
        n_state=(start)?loading: idle;
     end
      loading:begin
        done=0;
        cen=1;
        cload=0;
        en = '{default: 0};
        en[z+1]=1;
        n_state=(z==4)?first_multiplier: loading;
      end  
       first_multiplier:begin
          en = '{default: 0};
          s1=0;
          en[5]=1;

          n_state=second_multiplier;
       end
       second_multiplier:begin
         en = '{default: 0};
         s1=1;
         en[6]=1;
         n_state=subtraction;
       end
       subtraction:begin
         en = '{default: 0};
         en[7]=1;
         n_state=idle;
       end
    endcase
end
always @( posedge clock or posedge reset)begin
  if(reset)begin
    p_state<=idle;
  end
  else begin

     p_state<=n_state;
  end
end
endmodule