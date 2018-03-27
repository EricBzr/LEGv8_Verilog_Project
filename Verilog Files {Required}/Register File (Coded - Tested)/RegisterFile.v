/*
	Unsigned 
*/

//////////////////////////////////
// Register File Unit Structure & Logic Modules
//////////////////////////////////

module RegisterFile (RegWrite, readRegister1, readRegister2, writeReg, writeData, readData1, readData2);
	input RegWrite;
	input[4:0] readRegister1, readRegister2, writeReg;
 	input[63:0] writeData; 
 	output[63:0] readData1, readData2;
	
	wire[63:0] readData1, readData2;

	reg[63:0] register_depth[0:31];
	
	
	
	///////////////////////////////////////////
	// TESTING PURPOSES ONLY - CODE UNECESSARRY ||BEGIN||
	///////////////////////////////////////////
	initial
	begin
		register_depth[0] = 64'b00000000000000000000000000000011; //3
		register_depth[1] = 64'b00000000000000000000000000000001; //1
		register_depth[2] = 64'b00000000000000000000000000001000; //8
		register_depth[3] = 64'b00000000000000000000000000001010; //10
		register_depth[4] = 64'b00000000000000000000000000000010; //2
		register_depth[5] = 64'b00000000000000000000000000010000; //16
		register_depth[6] = 64'b00000000000000000000000000000000; //0
		register_depth[7] = 64'b00000000000000000000000000000000; //0
		register_depth[8] = 64'b00000000000000000000000000000000; //0
		register_depth[9] = 64'b00000000000000000000000000000000; //0
		register_depth[10] = 64'b00000000000000000000000000000000; //0
		register_depth[11] = 64'b00000000000000000000000000000000; //0
		register_depth[12] = 64'b00000000000000000101101110101011; //23,467
		register_depth[13] = 64'b00000000000000000000000011111010; //250
		register_depth[14] = 64'b00000000000000000000000000001000; //8
		register_depth[15] = 64'b00000000000000000000000000000000; //0
	end
	///////////////////////////////////////////
	// TESTING PURPOSES ONLY - CODE UNECESSARRY ||END||
	///////////////////////////////////////////

	
	
	always @(RegWrite) begin
		if(RegWrite) begin
			register_depth[writeReg] <= writeData;
		end
	end

	assign readData1 = register_depth[readRegister1];

	assign readData2 = register_depth[readRegister2];

endmodule
