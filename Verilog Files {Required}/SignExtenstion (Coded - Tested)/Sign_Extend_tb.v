/*
	Unsigned
*/

`include "Sign_Extend.v"

module Sign_Extend_tb; 
  reg[31:0] In;
  
  wire[63:0] Out;
  
  Sign_Extend Extender_1(In, Out); 

  initial
   begin
    $dumpfile("Sign_Extend.vcd");
    $dumpvars;
	In <= {6'b000101, 2'b11, 24'b010000000}; //B Addr: #128
	#5
    In <= {11'b00111000010, 9'b000000101, 12'b101010101010}; //LDUR Addr: #5
    #5
    In <= {11'b00111000010, 9'b000001000, 12'b101010101010}; //LDUR Addr: #8
    #5
    In <= {8'b10110101, 14'b0000010000, 10'b0}; //CBNZ Addr: #16
    #5
	In <= {8'b01010100, 14'b0000100000, 10'b0}; //B.cnd Addr: #32
	#5
	In <= {8'b10110100, 14'b0001000000, 10'b0}; //CBZ Addr: #64
	#5
	In <= {10'b1001000100, 1'b0, 11'b11, 10'b0}; //CBZ Addi: ##3 	
   end
  initial
   begin
      $monitor("time=%4d : In = %b : Out = %b", $time, In, Out);
   end
endmodule