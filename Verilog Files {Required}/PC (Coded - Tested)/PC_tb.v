/*
	Unsigned
*/

`include "PC.v"

module PC_tb;
  reg[11:0] newInst;

  wire[11:0] inst;
  
  PC PC_1(newInst, inst); 

  initial
   begin
    $dumpfile("PC.vcd");
    $dumpvars;
    newInst <= 100010001000; 
    #5
    newInst <= 001001101000;  
    #5
    newInst <= 111111111000;  
    #5
	newInst <= 000000000000;  
	#5
	newInst <= 000111000000;  
   end
  initial
   begin
      $monitor("time=%4d : newInst = %b : inst = %b", $time, newInst, inst);
   end
endmodule