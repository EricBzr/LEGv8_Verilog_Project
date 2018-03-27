/*
	Unsigned
*/

//////////////////////////////////
// PC+ShiftedAddress Adder Unit Structure & Logic Modules
//////////////////////////////////

module PCShiftAdder (PC, ShiftedAddr, Out);
  input[11:0] PC;
  input[63:0] ShiftedAddr;
  output[11:0] Out;

  reg[11:0] Out;
  
  always @(PC, ShiftedAddr) 
  begin
	Out <= PC + ShiftedAddr[11:0];
  end

endmodule