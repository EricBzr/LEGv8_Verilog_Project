/*
	Unsigned 
*/

//////////////////////////////////
//  Branch OR Gate Structure & Logic Modules
//////////////////////////////////

module branchORGate (cbzAND, cbnzAND, UncondBr, Out);
	input cbzAND;
	input cbnzAND;
	input UncondBr;
	output Out;
	
	wire Out;
	
	assign Out = cbzAND || cbnzAND || UncondBr;
	
endmodule