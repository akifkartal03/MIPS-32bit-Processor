module instr_splitter_testbench();
	wire [4:0] rs,rt,rd;
	wire [5:0] funct,opcode;
	wire [15:0] immediate;
	wire [25:0] adress;						
	reg [31:0] instruction; 
	
	instr_splitter my_splitter(opcode,rs,rt,rd,immediate,funct,adress,instruction);
	initial begin
	instruction = 32'b01100_01010_01100_01000_01000_00100_10; 
	#20;
	instruction = 32'b10100_00100_00010_00010_00100_00000_11; 
	#20;
	instruction = 32'b1111_00000_001100_00100_00100_00100_10; 
	#20;
	end
	initial begin
	$monitor("time=%2d, instruction=%32b,  opcode=%6b,  rs=%5b,  rt=%5b,  rd=%5b,  function=%6b,  immediate=%16b,  adress=%26b "
	         ,$time,instruction,opcode,rs,rt,rd,funct,immediate,adress);
	end
endmodule