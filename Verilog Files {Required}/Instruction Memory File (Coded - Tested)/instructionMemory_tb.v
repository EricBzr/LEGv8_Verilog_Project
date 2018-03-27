/*
	Unsigned
*/

`include "instructionMemory.v"

module instructionMemory_tb; 
  reg[11:0] pcAddr;
  
  wire[31:0] Inst;
  
  instructionMemory inst_Memory_1(pcAddr, Inst); 

  initial
   begin
    $dumpfile("instructionMemory.vcd");
    $dumpvars;
    pcAddr <= 0; 
    #5
    pcAddr <= 4;
    #5
    pcAddr <= 8; 
    #5
	pcAddr <= 12; 
   end
  initial
   begin
      $monitor("time=%4d : pcAddr = %b : Inst = %b", $time, pcAddr, Inst);
   end
endmodule