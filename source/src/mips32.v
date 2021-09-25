module mips32(clk);

//only clock input no other output,input etc.
input clk;

wire [31:0] instr,read_data1,read_data2,m3,m4,extended,zero_extend,alu_result,data,m5,m6,m7,m8,
				zero,one,two,three,m9,m10,m11,m12,pc_arti,shifted,comp,pc_arti1;
wire [4:0] rs,rt,rd,m1,m2,constant;
wire [5:0] funct,opcode;
wire [15:0] immediate;
wire [25:0] adress;	
wire reg_dest,alu_src,mem_to_reg,reg_wrt,mem_read,mem_wrt,branch,jump,jal,jr,bne,enable,ori,lui,
		c_out,z,bg,les,eq;
wire [1:0] alu_op;
wire [2:0] alu_ctr;
wire [13:0] new_pc;

reg [13:0] pc = 14'b0; //14 bits program counter

//in jal instr. I assume PC+8 means PC+1 here.

	
//instruction memory
instr_memory_block im(instr,pc,clk);

//split instruction
instr_splitter split(opcode,rs,rt,rd,immediate,funct,adress,instr);

//control unit
control_unit ctr(reg_dest,alu_src,mem_to_reg,reg_wrt,mem_read,mem_wrt,branch,alu_op,jump,
							jal,jr,bne,enable,ori,lui,opcode);
							

//constant 5'b11111(for jal instr.)
and a1(constant[0],1,1);
and a2(constant[1],1,1);
and a3(constant[2],1,1);
and a4(constant[3],1,1);
and a5(constant[4],1,1);
mux_5x1 mux1(m1,rt,rd,reg_dest);
mux_5x1 mux2(m2,m1,constant,jal);

//register block
register_block regs(read_data1,read_data2,rs,rt,m2,
								rs,m8,alu_result,enable,reg_wrt,clk);
								

//setup ALU inputs from muxes
sign_extender ext(extended,immediate);
zero_extender zext(zero_extend,immediate);								
mux_32x1 mux3(m3,read_data2,extended,alu_src);
mux_32x1 mux4(m4,m3,zero_extend,ori);

//setup ALU Control
alu_control aluctr(alu_ctr,alu_op,funct);

//ALU block
alu_32bit alu1(alu_result,c_out,z,read_data1,m4,alu_ctr);

//Memory Block
data_memory_block mes(data,alu_result[17:0],read_data2,mem_wrt,mem_read,clk);

mux_32x1 mux5(m5,m6,data,mem_to_reg);
mux_32x1 mux6(m6,comp,alu_result,ori);

zero_comp_32bit comparator(bg,les,eq,alu_result);
constant_producer cst(zero,one,two,three);

//comparator result will be in comp.
//Setup write_data1 input from muxes.
mux_32x1 mux7(m9,zero,two,les);
mux_32x1 mux8(m10,m9,one,eq);
mux_32x1 mux9(comp,m10,three,bg);

mux_32x1 mux10(m7,m5,pc_arti1,jal);
mux_32x1 mux11(m8,m7,shifted,lui);
shift_left16 sft(shifted,extended);

//update program counter according to situation
program_counter my_pc(new_pc,pc_arti1,jump,jal,jr,branch,bne,z,read_data1,adress,pc,extended);

//we need to change pc here therefore there is always here.
always @(negedge clk) 
	begin
	pc <= new_pc;
	end
	
//also print variable to the screen here.	
initial begin
	$monitor("clk=%2d,  pc=%2d, rs=%2d, opcode=%2d, rt=%2d, alu_res=%2d,  write_data1=%2d, write_data2=%2d, instr=%32b, reg_dest=%1b, alu_src=%1b, mem_to_reg=%1b, reg_wrt=%1b, mem_read=%1b, mem_wrt=%1b, branch=%1b, alu_op=%2b, jump=%1b, jal=%1b,jr=%1b, bne=%1b, enable=%1b, ori=%1b, lui=%1b"
	         ,clk,pc,opcode,rs,rt,alu_result,m8,alu_result,instr,reg_dest,alu_src,mem_to_reg,reg_wrt,mem_read,mem_wrt,branch,alu_op,jump,jal,jr,bne,enable,ori,lui);
			  
	
	//$monitor("time=%2d,opcode=%2d, branch=%1b, jump=%1b, jal=%1b, jr=%1b, bne=%1b, ori=%1b, pc=%2d, clk=%2d ,alu_result=%2d, rs=%2d, pc_arti=%2d, m8=%2d, read_data=%2d"
				//,$time,opcode,branch,jump,jal,jr,bne,ori,pc,clk,alu_result,rs,pc_arti1,m8,data);
	
	end

endmodule