module control_unit_testbench();
	reg [5:0] opcode;
	wire reg_dest,alu_src,mem_to_reg,reg_wrt,mem_read,mem_wrt,branch,jump,jal,jr,bne,enable,ori,lui; 
	wire [1:0] alu_op;			
	control_unit my_control(reg_dest,alu_src,mem_to_reg,reg_wrt,mem_read,mem_wrt,branch,alu_op,jump,
							jal,jr,bne,enable,ori,lui,opcode);
	initial begin
	opcode = 6'b000000; //r-type
	#20;
	opcode = 6'b100011; // lw
	#20;
	opcode = 6'b101011; // sw
	#20;
	opcode = 6'b000100; // beg
	#20;
	opcode = 6'b000101; // bne
	#20; 
	opcode = 6'b000010; // jump
	#20;
	opcode = 6'b000011; // jal
	#20;
	opcode = 6'b001000; // jr
	#20;
	opcode = 6'b001101; // ori
	#20;
	opcode = 6'b001111; // lui
	#20;
	end
	initial begin
	$monitor("time=%2d,opcode=%2d,reg_dest=%1b,alu_src=%1b,mem_to_reg=%1b,reg_wrt=%1b,mem_read=%1b,mem_wrt=%1b,branch=%1b,alu_op=%2b,jump=%1b,jal=%1b,jr=%1b,bne=%1b,enable=%1b,ori=%1b,lui=%1b"
	          ,$time,opcode,reg_dest,alu_src,mem_to_reg,reg_wrt,mem_read,mem_wrt,branch,alu_op,jump,jal,jr,bne,enable,ori,lui);
	end
endmodule