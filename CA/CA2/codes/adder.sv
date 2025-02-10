module ADD(input [3:0] x,y, input cin,output [3:0] s,output overflow);
    
   wire [4:0] carry;
   wire [3:0] g;
   wire [3:0] p;
   wire[9:0] wires;
   assign carry[0]=cin;
   
   xor (s[0],x[0],y[0],carry[0]);
   xor (s[1],x[1],y[1],carry[1]);
   xor (s[2],x[2],y[2],carry[2]);
   xor (s[3],x[3],y[3],carry[3]);

   and(g[0],x[0],y[0]); 
   and(g[1],x[1],y[1]); 
   and(g[2],x[2],y[2]); 
   and(g[3],x[3],y[3]); 


   or(p[0],x[0],y[0]); 
   or(p[1],x[1],y[1]); 
   or(p[2],x[2],y[2]); 
   or(p[3],x[3],y[3]); 

   and(wires[0],p[0],carry[0]);
   or(carry[1],g[0],wires[0]);


   and(wires[1],p[0],p[1],carry[0]);
   and(wires[2],p[1],g[0]);
   or(carry[2],g[1],wires[1],wires[2]);
   
   and(wires[3],p[0],p[1],p[2],carry[0]);
   and(wires[4],p[1],p[2],g[0]);
   and(wires[5],p[2],g[1]);
   or(carry[3],g[2],wires[3],wires[4],wires[5]);

   and(wires[6],p[0],p[1],p[2],p[3],carry[0]);
   and(wires[7],p[1],p[2],p[3],g[0]);
   and(wires[8],p[2],p[3],g[1]);
   and(wires[9],p[3],g[2]);
   or(carry[4],g[3],wires[6],wires[7],wires[8],wires[9]);

   xor(overflow, carry[3], carry[4]);

endmodule