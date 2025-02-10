module COMPARETOR(input [3:0] x,y ,output xgty);
    

   wire[3:0] wires;
   wire [3:1] i;
   wire not_x3 , not_y2 , not_y1 , not_y0;
   xnor (i[1],x[1],y[1]);
   xnor (i[2],x[2],y[2]);
   xnor (i[3],x[3],y[3]);

   not(not_x3,x[3]);
   not(not_y2,y[2]);
   not(not_y1,y[1]);
   not(not_y0,y[0]);

   and(wires[0],x[0],not_y0,i[3], i[2],i[1]); 
   and(wires[1],x[1],not_y1,i[3],i[2]); 
   and(wires[2],x[2],not_y2,i[3]); 
   and(wires[3],not_x3,y[3]); 

   or(xgty,wires[0],wires[1],wires[2],wires[3]);
   

endmodule