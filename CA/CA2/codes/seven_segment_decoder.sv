module sevenSegmentDecoder(input logic [3:0] inp_s, output logic [7:0] out);

    wire [3:0] inp;
    assign inp = inp_s[3] ? (~inp_s + 1) : inp_s;
    assign out[7] = inp_s[3]; 
 
    wire not_inp3, not_inp2, not_inp1, not_inp0;
    not  N1 (not_inp3, inp[3]);
    not  N2 (not_inp2, inp[2]);
    not  N3 (not_inp1, inp[1]);
    not  N4 (not_inp0, inp[0]);

    wire [8:0] terms;
    and  (terms[0], inp[2], inp[0]); 
    and  (terms[1], not_inp0, not_inp2);               
    and  (terms[2], inp[1], inp[0]); 
    and  (terms[3], not_inp1, not_inp0);             
    and  (terms[4], not_inp2, inp[1]);      
    and  (terms[5], inp[1], not_inp0);        
    and  (terms[6], inp[2], not_inp1, inp[0]); 
    and  (terms[7], inp[2], not_inp0);        
    and  (terms[8], inp[2], not_inp1);        

    or  (out[0], inp[3], inp[1], terms[0], terms[1]); // a
    or  (out[1], not_inp2, terms[2], terms[3]);                      // b
    or  (out[2], not_inp1, inp[0], inp[2]);              // c
    or  (out[3], inp[3], terms[4], terms[1], terms[5], terms[6]) ; // d
    or  (out[4], terms[5], terms[1]) ;                             // e
    or  (out[5], inp[3], terms[3], terms[7], terms[8]);     // f
    or  (out[6], inp[3], terms[8], terms[5], terms[4]);     // g

endmodule
