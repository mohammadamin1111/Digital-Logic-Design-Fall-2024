module controller_reciprocal (input logic clock,ready,req,input logic[3:0] co,output logic [1:2]s,output logic start,cload,cen,load,ack,
input logic[3:0] n_iter);
parameter [2:0] idle=0 ,loading=1,fisrt_multiplier=2, second_multiplier=3 ;
logic [2:0] p_state,n_state;
logic first_time_mult1, first_time_mult2;
always @(req or co or p_state or ready)begin
    case(p_state)
     idle:begin 
        if(req)begin
           cload=1;
           cen=0;
           s[1]=0;
           s[2]=1;/////add
           load=1;
           n_state=loading;
        end
        else begin
            n_state=idle;
        end
     end
      loading:begin
        
           start=1;
           ack=0;
           cload=0;
         
           first_time_mult1=1;
           first_time_mult2=1;
           n_state=fisrt_multiplier;
           
      end  

         
        fisrt_multiplier:begin

              if(first_time_mult1)begin
                    first_time_mult1=0;
                      s[1]=1;////////
                       s[2]=1;
                    load=0;
                    cen=0;

              end
              else begin
                     
                        if(ready)begin
                             s[2]=0;
                             first_time_mult2=1;
                             n_state=second_multiplier;

                        end


              end


        end
        second_multiplier:begin

              if(first_time_mult2)begin
                    first_time_mult2=0;
              end
              else begin
                     
                   if(ready==1&&(co==n_iter))begin

                            cen=0;
                            cload=1;
                            ack=1;
                            start=0;

                            n_state=idle;
                    
                   end
                   else if(ready)begin

                    cen=1;
                    load=1;
                    s[2]=1;

                      first_time_mult1=1;
                      n_state=fisrt_multiplier;

                   end


              end


        end
          default: begin
                n_state = idle; 
            end
    endcase
end


always @(posedge clock)begin

     p_state<=n_state;
end
endmodule