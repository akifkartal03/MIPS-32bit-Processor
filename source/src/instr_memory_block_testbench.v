module instr_memory_block_testbench();
		
		wire [31:0] instruction;
		reg [13:0] read_adress;
		reg clk;
	
	instr_memory_block instr_memory(instruction,read_adress,clk);
								

	initial begin
	//read file
	$readmemb("instruction_data.txt", instr_memory.instr_memory);
	clk = 1'b1; //initial clock is 1
	
	read_adress = 14'b00000_00000_0001; //1st adress
	#20;
	clk = ~clk;
	#20;
	clk = ~clk;
	
	read_adress = 14'b00000_00000_0101; //5th adress
	#20;
	clk = ~clk; //negatif edge
	#20;
	clk = ~clk; //pozitif edge
	
	read_adress = 14'b00000_00000_1001; //9th adress
	#20;
	clk = ~clk;
	end
	initial begin
	$monitor("time=%2d, read_adress=%2d,  clk=%1b,  instruction=%32b "
	         ,$time,read_adress,clk,instruction);
	end
endmodule