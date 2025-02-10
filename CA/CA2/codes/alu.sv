module ALU(input [3:0] inp1, inp2, input [2:0] opcode, output logic [3:0] out_put,wire overflow);
   
   wire [3:0] f;
   wire cin;
   wire [3:0] s;
   assign f=(opcode[0] & ~opcode[1]) ? inp2 : ~inp2;
   assign cin=~(opcode[0] & ~opcode[1]);
   wire xgty;
   ADD adder(inp1,f,cin,s,overflow);
   COMPARETOR comparetor(inp1,inp2,xgty);
   wire [3:0] min_by_add,max_by_add,min_by_comp,max_by_comp;

   assign min_by_add=s[3]?inp1 : inp2;
   assign max_by_add=s[3]?inp2 : inp1;


   assign min_by_comp= xgty?inp2 : inp1;
   assign max_by_comp= xgty?inp1 : inp2;


   always @(*)
   begin
      case(opcode)

        3'b001 : out_put=s;
        3'b010 : out_put=s;
        3'b011 : out_put=min_by_add;
        3'b100 : out_put=max_by_add;
        3'b101 : out_put=min_by_comp;
        3'b110 : out_put=max_by_comp;
        3'b111 : out_put=inp2;

      endcase
   end   

endmodule   
   



































// module alu(
//     input [31:0] a, 
//     input [31:0] b, 
//     input [2:0] opcode, // کد عملیات (3 بیت)
//     output reg [31:0] result
// );

//   // خروجی‌های ماژول‌های فرعی
//   wire [31:0] add_result, sub_result, mul_result, and_result;

//   // نمونه‌سازی ماژول‌های فرعی
//   adder u1 (.a(a), .b(b), .result(add_result));
//   subtractor u2 (.a(a), .b(b), .result(sub_result));
//   multiplier u3 (.a(a), .b(b), .result(mul_result));
//   and_operation u4 (.a(a), .b(b), .result(and_result));

//   // انتخاب عملیات بر اساس opcode
//   always @(*) begin
//     case (opcode)
//       3'b000: result = add_result;     // جمع
//       3'b001: result = sub_result;     // تفریق
//       3'b010: result = mul_result;     // ضرب
//       3'b011: result = and_result;     // AND
//       default: result = 32'b0;         // مقدار پیش‌فرض
//     endcase
//   end

// endmodule
