/*
	Unsigned 
*/

//////////////////////////////////
// 2:1 64 bit MUX Unit Structure & Logic Modules
//////////////////////////////////

module 2to1_64bitMux (A, B, Select, Out);
	input[63:0] A;
	input[63:0] B;
	input Select;
	output[63:0] Out;
	
	wire Out;
	
	assign Out = (Select) ? B : A;
	
endmodule
	
