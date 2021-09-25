module register_block_testbench();
	wire [31:0] read_data1,read_data2;
	reg [31:0] write_data1,write_data2;
	reg [4:0] read_reg1,read_reg2,write_reg1,write_reg2;
	reg enable,reg_write,clk;
	
	register_block my_reg(read_data1,read_data2,read_reg1,read_reg2,write_reg1,
								write_reg2,write_data1,write_data2,enable,reg_write,clk);
								

	initial begin
	//read file
	$readmemb("register_data_in.txt", my_reg.registers);
	clk = 1'b1; //initial clock is 1
	//only regwrite signal is 1
	write_data1 = 32'b11111_11111_11111_11111_11111_11111_11; 
	write_data2 = 32'b00000_00000_00000_00000_00000_00000_00; 
	read_reg1 = 5'b11111;//31
	read_reg2 = 5'b00001;//1
	write_reg1 = 5'b01010;//10
	write_reg2 = 5'b01011;//11 //will not be written(enable is 0)
	enable = 1'b0;
	reg_write = 1'b1;
	#20;
	clk = ~clk; 
	#20;
	clk = ~clk; 
	
	// both write signals are 1
	write_data1 = 32'b00000_00111_00000_00010_00101_00001_01; 
	write_data2 = 32'b11110_00000_00100_00000_01000_00000_00; 
	read_reg1 = 5'b00010; //2
	read_reg2 = 5'b00011; //3
	write_reg1 = 5'b01011; //11
	write_reg2 = 5'b01100; //12
	enable = 1'b1;
	reg_write = 1'b1;
	#20;
	clk = ~clk;
	#20;
	clk = ~clk;
	
	//only enable signal 1
	write_data1 = 32'b00000000000000000000000001100100; 
	write_data2 = 32'b00000000001100110011000000010100; 
	read_reg1 = 5'b00100;//4
	read_reg2 = 5'b00101;//5
	write_reg1 = 5'b01101;//13 //will not be written
	write_reg2 = 5'b01110;//14
	enable = 1'b1;
	reg_write = 1'b0;
	#20;
	clk = ~clk;
	#20;
	clk = ~clk;
	
	// both write signals are 0
	write_data1 = 32'b01010010001000101010000001100100; 
	write_data2 = 32'b00000000000000000000000000010100; 
	read_reg1 = 5'b11111;//31
	read_reg2 = 5'b00111;//7
	write_reg1 = 5'b01111;//15 //will not be written
	write_reg2 = 5'b10000;//16 //will not be written
	enable = 1'b0;
	reg_write = 1'b0;
	#20;
	clk = ~clk;
	#20;
	clk = ~clk;
	$writememb("register_data_out.txt",my_reg.registers);
	end
	initial begin
	$monitor("time=%2d, read_reg1=%2d,  read_reg2=%2d,  write_reg1=%2d,  write_reg2=%2d,  write_data1=%2d,   write_data2=%2d,  enable=%1b,  reg_write=%1b,   read_data1=%2d,   read_data2=%2d ,  clk=%2d "
	         ,$time,read_reg1,read_reg2,write_reg1,write_reg2,write_data1,write_data2,enable,reg_write,read_data1,read_data2,clk);
	end
endmodule