/*
	Unsigned
*/

`include "Shift_Left2.v"

module Shift_Left2_tb; 
  reg[63:0] In;
  
  wire[63:0] Out;
  
  Shift_Left2 Shifter_1(In, Out); 

  initial
   begin
    $dumpfile("Shift_Left2.vcd");
    $dumpvars;
    In <= 2; 
    #5
    In <= 4; 
    #5
    In <= 8; 
    #5
	In <= 16; 
   end
  initial
   begin
      $monitor("time=%4d : In = %b : Out = %b", $time, In, Out);
   end
endmodule