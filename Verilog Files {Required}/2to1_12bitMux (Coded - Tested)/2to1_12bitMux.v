/*
	Unsigned 
*/

//////////////////////////////////
// 2:1 12 bit MUX Unit Structure & Logic Modules
//////////////////////////////////

module 2to1_12bitMux (IncrPC, PCShiftAdder, Select, PC);
	input[11:0] IncrPC;
	input[11:0] PCShiftAdder;
	input Select;
	output[11:0] PC;
	
	wire PC;
	
	assign PC = (Select) ? PCShiftAdder : IncrPC;
	
endmodule
	
