/*
	Unsigned
*/

`include "RegisterFile.v"

module RegisterFile_tb;
  reg RegWrite;
  reg[4:0] readRegister1, readRegister2, writeReg;
  reg[63:0] writeData;
  
  wire[63:0] readData1, readData2;
  
  RegisterFile RegisterFile_1(RegWrite, readRegister1, readRegister2, writeReg, writeData, readData1, readData2); 

  initial
   begin
    $dumpfile("RegisterFile.vcd");
	$dumpvars;
	RegWrite <= 0; readRegister1 <= 12; readRegister2 <= 13; writeReg <= 0; writeData <= 0; //RegWr = 0, RdReg1 = 12, RdReg2 = 13, WrReg = 0, WrData = 0 || Reg12 = 23,467 Reg13 = 250
	#5
	writeReg <= 12; writeData <= 64; 														//RegWr = 0, RdReg1 = 12, RdReg2 = 13, WrReg = 12, WrData = 64 || Reg12 = 23,467 Reg13 = 250
	#5
	RegWrite <= 1;																		    //RegWr = 1, RdReg1 = 12, RdReg2 = 13, WrReg = 12, WrData = 64 || Reg12 = 64 Reg13 = 250
	#5
	RegWrite <= 0; writeReg <= 13; writeData <= 69; 										//RegWr = 0, RdReg1 = 12, RdReg2 = 13, WrReg = 13, WrData = 69 || Reg12 = 64 Reg13 = 250
	#5
	RegWrite <= 1; 																			//RegWr = 1, RdReg1 = 12, RdReg2 = 13, WrReg = 13, WrData = 69 || Reg12 = 64 Reg13 = 69
	#5
	readRegister1 <= 0; readRegister2 <= 1; writeReg <= 4; writeData <= 25; 				//RegWr = 1, RdReg1 = 0, RdReg2 = 1, WrReg = 4, WrData = 25 || Reg12 = 64 Reg13 = 69 Reg4 = ?
	#5
	RegWrite <= 0; readRegister1 <= 4; writeReg <= 0; writeData <= 0; 						//RegWr = 0, RdReg1 = 4, RdReg2 = 1, WrReg = 0, WrData = 0 || Reg12 = 64 Reg13 = 69 Reg4 = ?
   end
  initial
   begin
      $monitor("time=%4d : RegWrite = %b : readRegister1 = %b : readRegister2 = %b : writeReg = %b : writeData = %b : readData1 = %b : readData2 = %b", $time, RegWrite, readRegister1, readRegister2, writeReg, writeData, readData1, readData2);
   end
endmodule