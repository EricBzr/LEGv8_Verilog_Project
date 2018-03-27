/*
	Unsigned 
*/

//////////////////////////////////
// Instruction Memory Unit Structure & Logic Modules
//////////////////////////////////

module instructionMemory (readAddr, Inst);
	input[11:0] readAddr;
	output[31:0] Inst;
	
	wire Inst;
	
	reg[7:0] memory_depth[0:4095];
	
	
	
	///////////////////////////////////////////
	// TESTING PURPOSES ONLY - CODE UNECESSARRY ||BEGIN||
	///////////////////////////////////////////
	initial
	begin
		memory_depth[0] = 8'b00000011; 	//Inst 1 Holds #3
		memory_depth[1] = 8'b00000000; 	//
		memory_depth[2] = 8'b00000000; 	//
		memory_depth[3] = 8'b00000000; 	//-
		memory_depth[4] = 8'b00000110; 	//Inst 2 Holds #6
		memory_depth[5] = 8'b00000000; 	//
		memory_depth[6] = 8'b00000000; 	//
		memory_depth[7] = 8'b00000000; 	//-
		memory_depth[8] = 8'b00010000; 	//Inst 3 Holds #16
		memory_depth[9] = 8'b00000000; 	//
		memory_depth[10] = 8'b00000000; //
		memory_depth[11] = 8'b00000000; //-
		memory_depth[12] = 8'b00100000;	//Inst 4 Holds #32
		memory_depth[13] = 8'b00000000;	//
		memory_depth[14] = 8'b00000000;	//
		memory_depth[15] = 8'b00000000;	//-
		memory_depth[16] = 8'b01000000;	//Inst 5 Holds #64
		memory_depth[17] = 8'b00000000;	//
		memory_depth[18] = 8'b00000000;	//
		memory_depth[19] = 8'b00000000;	//-
		
	end
	///////////////////////////////////////////
	// TESTING PURPOSES ONLY - CODE UNECESSARRY ||END||
	///////////////////////////////////////////
	
	
	
	assign Inst = {memory_depth[readAddr + 3], memory_depth[readAddr + 2], memory_depth[readAddr + 1], memory_depth[readAddr]};
	
endmodule
	
