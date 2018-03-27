/*
	Unsigned
*/

`include "2to1_64bitMux.v"

module 2to1_64bitMux_tb; 
  reg[63:0] R2;
  reg[63:0] Sext;
  reg ALUsrc;
  
  wire[63:0] Out;
  
  2to1_64bitMux ALU_Mux_1(R2, Sext, ALUsrc, Out); 

  initial
   begin
    $dumpfile("2to1_64bitMux.vcd");
    $dumpvars;
    R2 <= 2; Sext <= 3; ALUsrc <= 0;
    #5
    R2 <= 2; Sext <= 3; ALUsrc <= 1;
    #5
    R2 <= 6; Sext <= 7; ALUsrc <= 0;
    #5
	R2 <= 6; Sext <= 7; ALUsrc <= 1;
   end
  initial
   begin
      $monitor("time=%4d : R2 = %b : Sext = %b : Select = %b : Output = %b", $time, R2, Sext, ALUsrc, Out);
   end
endmodule