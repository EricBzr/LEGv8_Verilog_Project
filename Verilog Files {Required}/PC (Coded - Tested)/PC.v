/*
	Unsigned 
*/

//////////////////////////////////
// PC Unit Structure & Logic Modules
//////////////////////////////////

module PC (newInst, inst);
  input[11:0] newInst;
  output[11:0] inst;

  wire inst;

  assign inst = newInst;

endmodule
