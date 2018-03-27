/*
	Unsigned
*/

`include "cbzBranchANDGate.v"

module cbzBranchANDGate_tb;
  reg Branch;
  reg Zero;
  
  wire Out;
  
  cbzBranchANDGate cbzANDGATE(Branch, Zero, Out); 

  initial
   begin
    $dumpfile("cbzBranchANDGate.vcd");
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