`timescale 1ns/1ns
module Grain_bonus_tb;
   logic Clk=0;
   logic reset=1;
   logic shift_en;
   logic [23:0] X_n;
   logic [23:0] SEED_n=24'h9a172d;
   logic [79:0] X_l;
   logic [79:0] SEED_l=80'h123456789ABCDEF12345;
   logic main_output;
   logic Par_load;
   integer file1;
   integer file2;
   integer flag=0;
   integer count_0=0; 
   integer count_1=0; 
   integer count_00=0; 
   integer count_01=0; 
   integer count_10=0; 
   integer count_11=0;
   logic state;
Grain grain(Clk,reset ,Par_load,shift_en, SEED_l , SEED_n , X_l , X_n, main_output);

initial begin
    repeat(2000) #10 Clk=~Clk;
end
initial begin
    shift_en=0;
    Par_load=1;
    file1 = $fopen("main_output.txt", "w");
    file2 = $fopen("count.txt", "w");
    #12
    shift_en=1;
    Par_load=0;
end

initial begin
#20000
$fwrite(file2,"count0 = %d\n",count_0);
$fwrite(file2,"count1 = %d\n",count_1);
$fwrite(file2,"count00 = %d\n",count_00);
$fwrite(file2,"count01 = %d\n",count_01);
$fwrite(file2,"count10 = %d\n",count_10);
$fwrite(file2,"count11 = %d\n",count_11);
end     
       
always @(posedge Clk) begin

    $fwrite(file1,"%b\n",main_output); 
end

always @(posedge Clk) begin
    if(flag==0)begin
       state=main_output;
       flag=1;
    end
if(main_output==1)begin
    count_1=count_1+1;
    if(state==0)begin
        count_01=count_01+1;

    end
    else begin
     count_11=count_11+1;

    end
state=1;
end
else if(main_output==0)begin

  count_0=count_0+1;
      if(state==0)begin
        count_00=count_00+1;

    end
    else begin
     count_10=count_10+1;

    end
state=0;
end
  
end
endmodule

