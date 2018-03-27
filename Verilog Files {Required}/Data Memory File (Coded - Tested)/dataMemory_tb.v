/*
	Unsigned
*/

`include "dataMemory.v"

module dataMemory_tb; 
  reg[9:0] Addr;
  reg[63:0] writeData;
  reg memWrite;
  reg memRead;
  
  wire[63:0] readData;
  
  dataMemory data_Memory_1(Addr, writeData, memWrite, memRead, readData); 

  initial
   begin
    $dumpfile("dataMemory.vcd");
    $dumpvars;
    Addr <= 0; writeData <= 0; memWrite <= 0; memRead <= 0; //Addr = 0, wrD = 0, memWr = 0, memR = 0, readD = 64'b0 NULL 
	#5
	memRead <= 1; 											//Addr = 0, wrD = 0, memWr = 0, memR = 1, readD = 3 
	#5
	Addr <= 3;												//Addr = 3, wrD = 0, memWr = 0, memR = 1, readD = 3
	#5
	writeData <= 25; memWrite <= 1; memRead <= 0;			//Addr = 3, wrD = 25, memWr = 1, memR = 0, readD = 3 * 25 is written to Addr 3 *
	#5
	memWrite <= 0; memRead <= 1;							//Addr = 3, wrD = 25, memWr = 0, memR = 1, readD = 25 
	#5
	memWrite <= 0; memRead <= 0;							//Addr = 3, wrD = 25, memWr = 0, memR = 0, readD = 64'b0 NULL
	#5
	Addr <= 2; memWrite <= 0; memRead <= 1;                 //Addr = 2, wrD = 25, memWr = 0, memR = 1, readD = 8
   end
  initial
   begin
      $monitor("time=%4d : Addr = %b : writeData = %b : memWrite = %b : memRead = %b : readData = %b", $time, Addr, writeData, memWrite, memRead, readData);
   end
endmodule