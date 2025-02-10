module Top_Module(input [15:0] inp1_16,inp2_16,input [2:0] opcode , output [15:0] out_put_one_hot,output overflow, output [3:0] out_put);

   wire [3:0] inp1_4,inp2_4;
   one_hot_encoder T1(inp1_16,inp1_4);
   one_hot_encoder T2(inp2_16,inp2_4);
   
   ALU alu(inp1_4,inp2_4,opcode, out_put,overflow);
  
   one_hot_decoder T3(out_put, out_put_one_hot);
endmodule