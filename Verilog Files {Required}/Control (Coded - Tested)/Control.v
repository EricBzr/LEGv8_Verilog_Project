
module Control
(
	input clock,
	input[31:21] instruction,
	
	output NotZeroBranch,
	output Reg2Loc,
	output Uncondbranch,
	output ZeroBranch,
	output MemRead,
	output MemtoReg,
	output[1:0] ALUOp,
	output MemWrite,
	output ALUSrc,
	output RegWrite
);
	
	reg NotZeroBranch;
	reg Reg2Loc;
	reg Uncondbranch;
	reg ZeroBranch;
	reg MemRead;
	reg MemtoReg;
	reg[1:0] ALUOp;
	reg MemWrite;
	reg ALUSrc;
	reg RegWrite;
	
	
	initial begin  //On being initialized, all output values or set to non-boolean value of 'z'
	
		 NotZeroBranch = 1'bz;
		 Reg2Loc = 1'bz;
		 Uncondbranch = 1'bz;
		 ZeroBranch = 1'bz;
		 MemRead = 1'bz;
		 MemtoReg = 1'bz;
		 ALUOp = 1'bz;
		 MemWrite = 1'bz;
		 ALUSrc = 1'bz;
		 RegWrite = 1'bz;
		
	end
	
	always @(posedge clock) 
	begin
		if(instruction[31:26] == 6'b000101) // B Inst
			begin
				NotZeroBranch = 0;
				Reg2Loc = 0;
				Uncondbranch = 1;
				ZeroBranch = 0;
				MemRead = 0;
				MemtoReg = 0;
				ALUOp = 2'b11;
				MemWrite = 0;
				ALUSrc = 0;
				RegWrite = 0;
			end
		else
			begin
				if(instruction[31:22] == 10'b1001000100) // ADDI Inst
					begin
						NotZeroBranch = 0;
						Reg2Loc = 0;
						Uncondbranch = 0;
						ZeroBranch = 0;
						MemRead = 0;
						MemtoReg = 0;
						ALUOp = 2'b00;
						MemWrite = 0;
						ALUSrc = 1;
						RegWrite = 1;
					end
				else
					begin 
						if(!instruction[27])
							begin
								case(instruction[31:24]) // CB-type inst.s
									8'b10110100: // CBZ Inst
										begin
											NotZeroBranch = 0;
											Reg2Loc = 1;
											Uncondbranch = 0;
											ZeroBranch = 1;
											MemRead = 0;
											MemtoReg = 0;
											ALUOp = 2'b01;
											MemWrite = 0;
											ALUSrc = 0;
											RegWrite = 0;
										end
									8'b10110101: // CBNZ Inst
										begin
											NotZeroBranch = 1;
											Reg2Loc = 1;
											Uncondbranch = 0;
											ZeroBranch = 0;
											MemRead = 0;
											MemtoReg = 0;
											ALUOp = 2'b11;
											MemWrite = 0;
											ALUSrc = 0;
											RegWrite = 0;
										end
								endcase
							end
						else
							begin
								case(instruction) // Rest of R-type, and D-type inst.s
									11'b00111000010: // LDUR Inst
										begin 
											NotZeroBranch = 0;
											Reg2Loc = 0;
											Uncondbranch = 0;
											ZeroBranch = 0;
											MemRead = 1;
											MemtoReg = 1;
											ALUOp = 2'b00;
											MemWrite = 0;
											ALUSrc = 1;
											RegWrite = 1;
										end
									11'b00111000000: // STUR Inst
										begin 
											NotZeroBranch = 0;
											Reg2Loc = 1;
											Uncondbranch = 0;
											ZeroBranch = 0;
											MemRead = 0;
											MemtoReg = 0;
											ALUOp = 2'b00;
											MemWrite = 1;
											ALUSrc = 1;
											RegWrite = 0;
										end
									11'b10001011000: // ADD Inst
										begin
											NotZeroBranch = 0;
											Reg2Loc = 0;
											Uncondbranch = 0;
											ZeroBranch = 0;
											MemRead = 0;
											MemtoReg = 0;
											ALUOp = 2'b00;
											MemWrite = 0;
											ALUSrc = 0;
											RegWrite = 1;
										end
									11'b11001011000: // SUB Inst
										begin
											NotZeroBranch = 0;
											Reg2Loc = 0;
											Uncondbranch = 0;
											ZeroBranch = 0;
											MemRead = 0;
											MemtoReg = 0;
											ALUOp = 2'b10;
											MemWrite = 0;
											ALUSrc = 0;
											RegWrite = 1;
										end
									11'b10001010000: // AND Inst
										begin
											NotZeroBranch = 0;
											Reg2Loc = 0;
											Uncondbranch = 0;
											ZeroBranch = 0;
											MemRead = 0;
											MemtoReg = 0;
											ALUOp = 2'b10;
											MemWrite = 0;
											ALUSrc = 0;
											RegWrite = 1;
										end
									11'b10101010000: // ORR Inst
										begin
											NotZeroBranch = 0;
											Reg2Loc = 0;
											Uncondbranch = 0;
											ZeroBranch = 0;
											MemRead = 0;
											MemtoReg = 0;
											ALUOp = 2'b10;
											MemWrite = 0;
											ALUSrc = 0;
											RegWrite = 1;
										end
								endcase
							end
					end
			end
	end	
endmodule	
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
							/*
								NotZeroBranch = 0;
								Reg2Loc = 0;
								Uncondbranch = 0;
								ZeroBranch = 0;
								MemRead = 0;
								MemtoReg = 0;
								ALUOp = 2'b00;
								MemWrite = 0;
								ALUSrc = 0;
								RegWrite = 0;	
							*/
		
		