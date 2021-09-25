module data_memory_block_testbench();
		
		wire [31:0] read_data;
		reg [31:0] adress; //adress will be 18 bits 
		reg [31:0] write_data;
		reg mem_read,mem_write,clk;
	
	data_memory_block my_memory(read_data,adress[17:0],write_data,mem_write,mem_read,clk);
			
	initial begin
	$readmemb("memory_data.txt", my_memory.memory);
	clk = 1'b1; //initial clock is 1	
	//only mem_read signal is 1
	write_data = 32'b11111_11111_11111_11111_11111_11111_11; 
	adress = 32'b00000000000000000000000000000001; //1st adress
	mem_read = 1'b1;
	mem_write = 1'b0;
	#20;
	clk = ~clk;
	#20;
	clk = ~clk;
	
	//only mem_write signal is 1
	write_data = 32'b11111_11111_11111_11111_11111_11111_11; 
	adress = 32'b00000000000000000000000000000000;//0th adress 
	mem_read = 1'b0;
	mem_write = 1'b1;
	#20;
	clk = ~clk; //negatif edge
	#20;
	clk = ~clk; //pozitif edge
	
	// both write and read signals are 0
	write_data = 32'b00000_11111_11111_11111_11111_11111_11; 
	adress = 32'b00000000000000000000000000000000; //0th adress
	mem_read = 1'b0;
	mem_write = 1'b0;
	#20;
	clk = ~clk;
	#20;
	clk = ~clk;
	$writememb("memory_data_out.txt",my_memory.memory);
	end
	initial begin
	$monitor("time=%2d, write_data=%32b,  adress=%2d,  mem_read=%1b,  mem_write=%1b,  clk=%1b,   read_data=%32b "
	         ,$time,write_data,adress,mem_read,mem_write,clk,read_data);
	end
endmodule