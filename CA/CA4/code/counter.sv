module counter #(parameter N=4)(input clock,input load, input en,input[N-1:0] par_load,output logic[N-1:0] count);

always @(posedge clock) begin
   if(load)begin
        count<=par_load;
   end
   else if(en)begin

         count<=count+1;
   end

end
endmodule