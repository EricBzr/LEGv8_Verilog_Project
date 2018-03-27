/*
	Unsigned
*/

`include "2to1_12bitMux.v"

module 2to1_12bitMux_tb; 
  reg[11:0] PCinc;
  reg[11:0] PCbr;
  reg Brcond;
  
  wire[11:0] Out;
  
  2to1_12bitMux Mux_1(PCinc, PCbr, Brcond, Out); 

  initial
   begin
    $dumpfile("2to1_12bitMux.vcd");
    $dumpvars;
    PCinc <= 2; PCbr <= 3; Brcond <= 0;
    #5
    PCinc <= 2; PCbr <= 3; Brcond <= 1;
    #5
    PCinc <= 6; PCbr <= 7; Brcond <= 0;
    #5
	PCinc <= 6; PCbr <= 7; Brcond <= 1;
   end
  initial
   begin
      $monitor("time=%4d : R2 = %b : PCbr = %b : Select = %b : Output = %b", $time, PCinc, PCbr, Brcond, Out);
   end
endmodule