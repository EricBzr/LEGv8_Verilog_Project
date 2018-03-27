/*
	Unsigned
*/

`include "2to1_5bitMux.v"

module 2to1_5bitMux_tb; 
  reg[4:0] Inst1;
  reg[4:0] Inst2;
  reg Reg2loc;
  
  wire[4:0] Out;
  
  2to1_5bitMux Mux_1(Inst1, Inst2, Reg2loc, Out); 

  initial
   begin
    $dumpfile("2to1_5bitMux.vcd");
    $dumpvars;
    Inst1 <= 2; Inst2 <= 3; Reg2loc <= 0;
    #5
    Inst1 <= 2; Inst2 <= 3; Reg2loc <= 1;
    #5
    Inst1 <= 6; Inst2 <= 7; Reg2loc <= 0;
    #5
	Inst1 <= 6; Inst2 <= 7; Reg2loc <= 1;
   end
  initial
   begin
      $monitor("time=%4d : Inst1 = %b : Inst2 = %b : Select = %b : Output = %b", $time, Inst1, Inst2, Reg2loc, Out);
   end
endmodule