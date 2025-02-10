module shift_register #(parameter N=8)(input logic clock,input logic right_shift,input logic load,en,input logic [N-1:0] data_in
,output logic [N-1:0] data_out);

    always @(posedge clock) begin
        if (load) begin
            data_out <= data_in;
        end else begin
            if(en)begin
                if (right_shift) begin
                    data_out <= {1'b0, data_out[N-1:1]};
                end else begin
                    data_out <= {data_out[N-2:0],1'b0};
                end
            end    
        end
    end
endmodule
