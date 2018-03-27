/*
	Unsigned
*/

`include "Control.v"

module Control_tb;

  reg clock;
  reg[31:21] instruction;

  wire NotZeroBranch;
  wire Reg2Loc;
  wire Uncondbranch;
  wire ZeroBranch;
  wire MemRead;
  wire MemtoReg;
  wire[1:0] ALUOp;
  wire MemWrite;
  wire ALUSrc;
  wire RegWrite;
  
  Control Control_1
  (
	clock,
	instruction,
	NotZeroBranch,
	Reg2Loc,
	Uncondbranch,
	ZeroBranch,
	MemRead,
	MemtoReg,
	ALUOp,
	MemWrite,
	ALUSrc,
	RegWrite
  ); 

  initial
   begin
    $dumpfile("Control.vcd");
	$dumpvars;
	clock <= 1; instruction <= 11'b00111000010; //LDUR
	#5
	clock <= 0;
	#5
	clock <= 1; instruction <= 11'b00111000000; //STUR
	#5
	clock <= 0;
	#5
	clock <= 1; instruction <= 11'b10001011000; //ADD
	#5
	clock <= 0;
	#5
	clock <= 1; instruction <= 11'b10010001000; //ADDI 
	#5
	clock <= 0;
	#5
	clock <= 1; instruction <= 11'b11001011000; //SUB
	#5
	clock <= 0;
	#5
	clock <= 1; instruction <= 11'b10001010000; //AND
	#5
	clock <= 0;
	#5
	clock <= 1; instruction <= 11'b10101010000; //ORR
	#5
	clock <= 0;
	#5
	clock <= 1; instruction <= 11'b10110100000; //CBZ
	#5
	clock <= 0;
	#5
	clock <= 1; instruction <= 11'b10110101000; //CBNZ
	#5
	clock <= 0;
	#5
	clock <= 1; instruction <= 11'b00010100000; //B
	#5
	clock <= 0;
   end
  initial
   begin
      $monitor("time=%4d : inst = %b : NZB = %b : R2L = %b : UncondB = %b : ZBranch = %b : MRead = %b : MtR = %b : ALUOp = %b : ALUsrc = %b : RegWrite = %b", $time, instruction, NotZeroBranch, Reg2Loc, Uncondbranch, ZeroBranch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
   end
endmodule