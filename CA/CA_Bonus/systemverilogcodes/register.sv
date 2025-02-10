module register #(parameter N=8)(input logic clock,input logic load,input logic [N-1:0] data_in,output logic [N-1:0] data_out );

    always @(posedge clock ) begin
   
        if(load)begin
             data_out<= data_in;

        end

    end
endmodule
    