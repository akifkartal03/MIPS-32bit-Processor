module mips32_testbench();
	reg clk;
	
	mips32 my_processor(clk);
	
	initial begin
	//fill arrays from files
	$readmemb("register_data_in.txt", my_processor.regs.registers);
	$readmemb("instruction_data.txt", my_processor.im.instr_memory);
	$readmemb("memory_data.txt", my_processor.mes.memory);
	clk = 1'b1; //initial clock is 1
	//change this here according to your number of instruction
	#20;clk = ~clk; #20;clk = ~clk; //1st instruction
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk; 
	#20;clk = ~clk; #20;clk = ~clk;
	#20;clk = ~clk; #20;clk = ~clk;	//18th instruction
	#20;
	//write to files
	$writememb("register_data_out.txt",my_processor.regs.registers);
	$writememb("memory_data_out.txt",my_processor.mes.memory);
	end
	
	
endmodule