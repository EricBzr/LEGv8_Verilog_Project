/*
	Unsigned
*/

`include "branchORGate.v"

module branchORGate_tb;
  reg cbzAND;
  reg cbnzAND;
  reg UncondBr;
  
  wire Out;
  
  branchORGate branchORGate_1(cbzAND, cbnzAND, UncondBr, Out); 

  initial
   begin
    $dumpfile("branchORGate.vcd");
    $dumpvars;
    cbzAND <= 1; cbnzAND <= 0; UncondBr <= 0; 
    #5
    cbzAND <= 0; cbnzAND <= 1; UncondBr <= 0; 
    #5
    cbzAND <= 0; cbnzAND <= 0; UncondBr <= 1; 
    #5
	cbzAND <= 1; cbnzAND <= 1; UncondBr <= 0; 
	#5
	cbzAND <= 1; cbnzAND <= 1; UncondBr <= 1; 
   end
  initial
   begin
      $monitor("time=%4d : cbzAND = %b : cbnzAND = %b : UncondBr = %b : Out = %b", $time, cbzAND, cbnzAND, UncondBr, Out);
   end
endmodule