/*
	Unsigned 
*/

//////////////////////////////////
//  ALU Control Unit Structure & Logic Modules
//////////////////////////////////

module ALUControlUnit(FunctCode, ALUOp, ALUCtrlLine);
	input[31:0] FunctCode; //Taken from the first left-most 8 bits of 32bit inst. outputted from IM
	input[1:0] ALUOp; //Delivered from the Control Unit
	output[3:0] ALUCtrlLine; //Outputted to main ALU
	
	reg[3:0] ALUCtrlLine;

	always @(FunctCode) begin
		if(ALUOp == 0) 
			begin //If ALUOp indicates an LDUR, STUR, or ADDI Inst., ADD
				ALUCtrlLine <= 2; 
			end
		else 
			begin
				if(ALUOp == 1) 
					begin //If ALUOp indicates a CBZ Inst., Pass b
						ALUCtrlLine <= 7; 
					end
				else 
					begin
						if(ALUOp == 2) 
							begin //If ALUOp indicates a R-type Inst. ...
								case(FunctCode[31:21])
									11'b10001011000: ALUCtrlLine <= 2; //ADD
									11'b11001011000: ALUCtrlLine <= 6; //SUB
									11'b10001010000: ALUCtrlLine <= 0; //AND  
									11'b10101010000: ALUCtrlLine <= 1; //OR
								endcase
							end
						else
							begin
								if(ALUOp == 3) //If ALUOp indicates a CBNZ, or a B Inst.
									begin
										ALUCtrlLine <= 8;
									end
							end
					end
			end
	end
endmodule