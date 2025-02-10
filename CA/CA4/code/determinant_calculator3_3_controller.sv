module determinant_calculator3_3_controller(input clock,input reset,input done,output logic start,input Start,input [3:0]flag,
output logic [1:13] en,output logic[1:0] s,output logic [3:0] select,output logic cload,output logic cen,output logic Done );

logic first_time_det1, first_time_det2, first_time_det3;
parameter [2:0] idle=0 ,loading=1,det1=2, det2=3, det3=4 ,last=5;
parameter [2:0] init=0 ,E=1,F=2, H=3, I=4 ,G=5, D=6;
logic [2:0] p_state,n_state, p_state_prim , n_state_prim;
logic [1:0]x;
always @(Start or flag or p_state or done)begin
    case(p_state)
     idle:begin 
        Done=1;
        start=0;
        cload=1;
        cen=0;
        en = '{default: 0};
        x=2'b00;
        first_time_det1=1;
        first_time_det2=1;
        first_time_det3=1;
        n_state=(Start)?loading: idle;
    
     end
      loading:begin
        Done=0;
        cen=1;
        cload=0;
        en = '{default: 0};
        en[flag+1]=1;
        n_state=(flag==9)? det1: loading;
      end  
       det1:begin    
          s=2'b00;
          en = '{default: 0};
          en[10]=1;
          if(first_time_det1)begin
               start=1;
               x=2'b01;
              first_time_det1=0;
              n_state=det1;
          end
          else begin
            start=0;
          n_state=done?det2:det1;

          end
       end

       det2:begin
         
          s=2'b01;
          en = '{default: 0};
          en[11]=1;
          if(first_time_det2)begin
            start=1;
              first_time_det2=0;
              n_state=det2;
               x=2'b10;
          end
          else begin
            start=0;
          n_state=done?det3:det2;

          end
       end
       det3:begin
          
          s=2'b10;
          en = '{default: 0};
          en[12]=1;
          if(first_time_det3)begin
               start=1;
               first_time_det3=0;
               n_state=det3;
               x=2'b11;
          end
          else begin
            start=0;
          n_state=done?last:det3;

          end
         
       end
        last:begin
         en = '{default: 0};
         en[13]=1;
         start=0;

         n_state=idle;  
       end
    endcase
end
always @(x or p_state_prim)begin
    case(p_state_prim)

     init:begin
         n_state_prim=(x==2'b01)?E:
           (x==2'b10 )?D:
           (x==2'b11 )?D:
           init;
     end
      E:begin
            select=4'b0100;
            n_state_prim=(x==2'b01)?F:
           (x==2'b11 )?G:
            init;
     end
      F:begin
         select=4'b0101;
       n_state_prim=(x==2'b01)?H:
           (x==2'b10 )?G:
            init;

     end
      H:begin
          select=4'b0111;
     n_state_prim=(x==2'b01)?I:
           (x==2'b11 )?init:
           init;
     end
       I:begin
          select=4'b1000;
     n_state_prim=(x==2'b10)?init:
           (x==2'b01 )?init:
           init;
     end
     G:begin
       select=4'b0110;
     n_state_prim=(x==2'b10)?I:
           (x==2'b11 )?H:
           init;
     end
      D:begin
          select=4'b0011;
     n_state_prim=(x==2'b10)?F:
           (x==2'b11 )?E:
           init;
     end
    endcase
end
always @( posedge clock or posedge reset)begin
  if(reset)begin
    p_state<=idle;
    p_state_prim<=init;
  end
  else begin
     p_state<=n_state;
     p_state_prim<=n_state_prim;
     x <= (n_state_prim == init) ? 2'b00 : x;
  end
end
endmodule