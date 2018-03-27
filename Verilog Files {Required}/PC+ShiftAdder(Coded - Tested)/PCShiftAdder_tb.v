/*
	Unsigned 
*/

`include "PCShiftAdder.v"

module PCShiftAdder_tb; 
  reg[11:0] PC;	
  reg[63:0] ShiftedAddr;
  
  wire[11:0] Out;
  
  
  PCShiftAdder PCShiftAdder_1(PC, ShiftedAddr, Out); 

  initial
   begin
    $dumpfile("PCShiftAdder.vcd");
    $dumpvars;
    PC <= 300; ShiftedAddr <= 8;   	      
    #5
    PC <= 300; ShiftedAddr <= 50; 
    #5
    PC <= 300; ShiftedAddr <= 7; 
    #5
    PC <= 300; ShiftedAddr <= 9;
    #5
    PC <= 300; ShiftedAddr <= 76; 
    #5
    PC <= 300; ShiftedAddr <= 100; 
    #5
    PC <= 300; ShiftedAddr <= 27;
   end
  initial
   begin
      $monitor("time=%4d: PC = %b: ShiftedAddr = %b: Out = %b", $time, PC, ShiftedAddr, Out);
   end
endmodule