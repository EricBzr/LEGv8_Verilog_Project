/*
	Unsigned
*/

`include "cbnzbranchANDGate.v"

module cbnzbranchANDGate_tb;
  reg Branch;
  reg Zero;
  
  wire Out;
  
  cbnzbranchANDGate cbnzANDGate_1(Branch, Zero, Out); 

  initial
   begin
    $dumpfile("cbnzbranchANDGate.vcd");
    $dumpvars;
    Branch <= 1; Zero <= 1; 
    #5
    Branch <= 0; Zero <= 1; 
    #5
    Branch <= 0; Zero <= 0; 
    #5
	Branch <= 1; Zero <= 0; 
	#5
	Branch <= 1; Zero <= 1; 
   end
  initial
   begin
      $monitor("time=%4d : Branch = %b : Zero = %b : Out = %b", $time, Branch, Zero, Out);
   end
endmodule