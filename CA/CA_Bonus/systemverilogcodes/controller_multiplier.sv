module controller_multiplier (input logic clock,start,z,b0,output logic[1:2] en,output logic [1:3] load ,output logic ready,s);
parameter  idle=0,active=1;
logic p_state,n_state;
always @(start or z or p_state or b0)begin
    case(p_state)
     idle:begin 
        en ='{default:0};
        load ='{default:0};
        if(start)begin
           load ='{default:1};
           s=0;
           ready=0;
           n_state=active;
        end
        else begin
            n_state=idle;
        end
     end
      active:begin
           if(z)begin
               ready=1;
                en ='{default: 0};
                load='{default: 0};
               n_state=idle;

           end
           else if ((z==0)&&(b0==0))begin
            en ='{default:1};
            load ='{default:0};

            n_state=active;

           end
           else begin
            s=1;
            load ='{default:0};
            load[3]=1;
            en ='{default:1};
            n_state=active;
           end
      end  
          default: begin
                
                en ='{default: 0};
                load='{default: 0};
                ready=0;
                s=0;
                n_state = idle; 
            end
    endcase
end

always @(posedge clock)begin

     p_state<=n_state;
end
endmodule