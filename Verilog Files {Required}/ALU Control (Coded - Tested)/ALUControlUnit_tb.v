/*
	Unsigned
*/

`include "ALUControlUnit.v"

module ALUControlUnit_tb; 
  reg[31:0] FunctCode;
  reg[1:0] ALUOp;
  
  wire[3:0] ALUCtrlLine;
  
  ALUControlUnit ALUCtrl_1(FunctCode, ALUOp, ALUCtrlLine); 

  initial
   begin
    $dumpfile("ALUCtrlLine.vcd");
    $dumpvars;
    FunctCode <= {11'b10001011000, 21'b0}; ALUOp <= 2; 
    #5
	FunctCode <= {11'b11001011000, 21'b0}; ALUOp <= 2; 
    #5
	FunctCode <= {11'b10001010000, 21'b0}; ALUOp <= 2; 
    #5
	FunctCode <= {11'b10101010000, 21'b0}; ALUOp <= 2; 
    #5
	FunctCode <= {8'b10, 24'b0}; ALUOp <= 0; 
    #5
	FunctCode <= {8'b01, 24'b0}; ALUOp <= 1; 
    #5
	FunctCode <= {6'b11, 24'b0}; ALUOp <= 3; 
   end
  initial
   begin
      $monitor("time=%4d : FunctCode = %b : ALUOp = %b : ALUCtrlLine = %b ", $time, FunctCode, ALUOp, ALUCtrlLine);
   end
endmodule