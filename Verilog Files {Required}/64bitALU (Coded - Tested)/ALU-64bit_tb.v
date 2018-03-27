/*
	Unsigned 
*/

`include "ALU-64bit.v"

module ALU64bit_tb; 
  reg[3:0] ALUCntrlOperation;	
  reg[63:0] A;
  reg[63:0] B;
  
  wire Zero;
  wire[63:0] ALUResult;
  
  
  ALU64bit ALU64bit_1(ALUCntrlOperation, A, B, Zero, ALUResult); 

  initial
   begin
    //Dump results of the simulation to fadder.vcd
    $dumpfile("ALU64bit.vcd");
    $dumpvars;
    ALUCntrlOperation <= 4'b0010; A <= 50; B <= 25;  //ADD
    #5
	ALUCntrlOperation <= 4'b1000; A <= 50; B <= 25;  //ADD with Nonzero sign
    #5
    ALUCntrlOperation <= 4'b0000; A <= 7; B <= 10;   //AND
    #5
    ALUCntrlOperation <= 4'b0000; A <= 8; B <= 0;    //AND with zero sign
    #5
    ALUCntrlOperation <= 4'b0001; A <= 76; B <= 28;  //OR 
    #5
    ALUCntrlOperation <= 4'b0110; A <= 100; B <= 36; //SUB
    #5
    ALUCntrlOperation <= 4'b0111; A <= 27; B <= 5;   //CBZ
   end
  initial
   begin
      $monitor("time=%4d: ALUCntrlOperation = %b: A = %4d: B = %4d: Zero = %b: ALUResult = %4d", $time, ALUCntrlOperation, A, B, Zero, ALUResult);
   end
endmodule