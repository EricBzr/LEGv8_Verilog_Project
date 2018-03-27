/*
	Unsigned 
*/

`include "IncrPC.v"

module IncrPC_tb; 
  reg[11:0] PC;	
  
  wire[11:0] Out;
  
  
  IncrPC IncrPC_1(PC, Out); 

  initial
   begin
    $dumpfile("IncrPC.vcd");
    $dumpvars;
    PC <= 300;  	      
    #5
    PC <= 425; 
    #5
    PC <= 500; 
   end
  initial
   begin
      $monitor("time=%4d: PC = %b: Out = %b", $time, PC, Out);
   end
endmodule