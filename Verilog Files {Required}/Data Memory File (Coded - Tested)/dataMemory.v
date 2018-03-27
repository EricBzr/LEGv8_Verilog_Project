/*
	Unsigned 
*/

//////////////////////////////////
// Data Memory Unit Structure & Logic Modules
//////////////////////////////////

module dataMemory (Addr, writeData, memWrite, memRead, readData);
	input[9:0] Addr;
	input[63:0] writeData;
	input memWrite;
	input memRead;
	output[63:0] readData; 
	
	reg[63:0] readData;
	
	reg[63:0] memory_depth[0:1023];
	
	
	
	///////////////////////////////////////////
	// TESTING PURPOSES ONLY - CODE UNECESSARRY ||BEGIN||
	///////////////////////////////////////////
	initial
	begin
		memory_depth[0] = 64'b00000000000000000000000000000011; //3
		memory_depth[1] = 64'b00000000000000000000000000000001; //1
		memory_depth[2] = 64'b00000000000000000000000000001000; //8
		memory_depth[3] = 64'b00000000000000000000000000001010; //10
		memory_depth[4] = 64'b00000000000000000000000000000010; //2
		memory_depth[5] = 64'b00000000000000000000000000010000; //16
		memory_depth[6] = 64'b00000000000000000000000000000000; //0
		memory_depth[7] = 64'b00000000000000000000000000000000; //0
		memory_depth[8] = 64'b00000000000000000000000000000000; //0
		memory_depth[9] = 64'b00000000000000000000000000000000; //0
		memory_depth[10] = 64'b00000000000000000000000000000000; //0
		memory_depth[11] = 64'b00000000000000000000000000000000; //0
		memory_depth[12] = 64'b00000000000000000000000000000000; //0
		memory_depth[13] = 64'b00000000000000000000000000000000; //0
		memory_depth[14] = 64'b00000000000000000000000000000000; //0
		memory_depth[15] = 64'b00000000000000000000000000000000; //0
	end
	///////////////////////////////////////////
	// TESTING PURPOSES ONLY - CODE UNECESSARRY ||END||
	///////////////////////////////////////////
	
	
	
	always @ (posedge memWrite or posedge memRead) begin 
		if(memRead) begin
			readData <= memory_depth[Addr]; 
		end
		else begin
			readData <= 64'b0; 
			if(memWrite) begin
				memory_depth[Addr] <= writeData;
			end
		end
	end
endmodule