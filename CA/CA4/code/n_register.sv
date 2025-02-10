
module n_register #(parameter N=8)(input logic clock,input logic reset, input logic enable,input logic [N-1:0] data_in,output logic [N-1:0] data_out );

    always @(posedge clock or posedge reset) begin
        if (reset)
         begin
            data_out <= 0; 
        end 
        else if (enable)
         begin
            data_out <= data_in; 
        end
    end
endmodule
    