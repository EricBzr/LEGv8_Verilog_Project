/*
	Unsigned 
*/

//////////////////////////////////
// 2:1 5 bit MUX Unit Structure & Logic Modules
//////////////////////////////////

module 2to1_5bitMux (InstructionBitSection20to16, InstructionBitSection4to0, Reg2Loc, ReadReg2);
	input[4:0] InstructionBitSection20to16;
	input[4:0] InstructionBitSection4to0;
	input Reg2Loc;
	output[4:0] ReadReg2;
	
	wire ReadReg2;
	
	assign ReadReg2 = (Reg2Loc) ? InstructionBitSection4to0 : InstructionBitSection20to16;
	
endmodule
	
