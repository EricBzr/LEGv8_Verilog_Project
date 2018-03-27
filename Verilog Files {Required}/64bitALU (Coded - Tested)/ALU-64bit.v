/*
	Unsigned 
*/

//////////////////////////////////
//  64bit ALU Unit Structure & Logic Modules
//////////////////////////////////

module ALU64bit (ALUCntrlOperation, A, B, Zero, ALUResult);
	input[3:0] ALUCntrlOperation;
	input[63:0] A, B;
	output[63:0] ALUResult;
	output Zero;
	
	reg[63:0] ALUResult;

	assign Zero = ( ALUResult == 0);

	always @(ALUCntrlOperation, A, B)
	begin
		case(ALUCntrlOperation)
			0: ALUResult <= A & B;
			1: ALUResult <= A | B;
			2: ALUResult <= A + B;
			6: ALUResult <= A - B;
			7: ALUResult <= (B) ? 1 : 0; 
			8: ALUResult <= (B) ? 0 : 1;	       
			default: ALUResult <= 0;
		endcase
	end
endmodule

