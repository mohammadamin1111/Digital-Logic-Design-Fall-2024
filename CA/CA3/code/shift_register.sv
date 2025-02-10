
module shift_register #(parameter N=8)(input Clk, ser_in,reset ,Par_load,shift_en,input [0:N-1] Par_in,output [0:N-1] Par_out,output ser_out);

wire D[0:N-1];
genvar i;
generate
    
    for(i=0;i<N;i=i+1)begin
       if(i==0)begin
        assign D[i]=(ser_in& shift_en) | (Par_load & Par_in[i]);

       end

       else begin
           assign D[i]=( Par_out[i-1]& shift_en) | (Par_load & Par_in[i]);

       end

       D_FlipFlop dff(D[i],Clk,1,reset,Par_out[i]);

    end

 assign ser_out = Par_out[N-1];
endgenerate

endmodule    