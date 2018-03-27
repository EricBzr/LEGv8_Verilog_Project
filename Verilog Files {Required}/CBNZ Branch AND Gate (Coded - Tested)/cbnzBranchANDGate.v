/*
	Unsigned 
*/

//////////////////////////////////
//  CBNZ Branch OR Gate Structure & Logic Modules
//////////////////////////////////

module cbnzBranchANDGate (Branch, Zero, Out);
	input Branch;
	input Zero;
	output Out;
	
	wire Out;
	
	assign Out = Branch & ~Zero;
	
endmodule