/*
	Unsigned 
*/

//////////////////////////////////
//  CBZ Branch AND Gate Structure & Logic Modules
//////////////////////////////////

module cbzBranchANDGate (Branch, Zero, Out);
	input Branch;
	input Zero;
	output Out;
	
	wire Out;
	
	assign Out = Branch & Zero;
	
endmodule