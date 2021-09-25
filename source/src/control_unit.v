module control_unit(reg_dest,alu_src,mem_to_reg,reg_wrt,mem_read,mem_wrt,branch,alu_op,jump,
							jal,jr,bne,enable,ori,lui,opcode);
		
//by convention, I wrote first outputs then inputs.		
output reg_dest,alu_src,mem_to_reg,reg_wrt,mem_read,mem_wrt,branch,jump,jal,jr,bne,enable,ori,lui; 
output [1:0] alu_op;						
input [5:0] opcode; 
wire op_not0,op_not1,op_not2,op_not3,op_not4,op_not5,r_type,lw,sw,beg_wire,bne_wire,jump_wire,jal_wire,jr_wire,ori_wire,lui_wire;

//create signals in gate level.

not n0(op_not0,opcode[0]);
not n1(op_not1,opcode[1]);
not n2(op_not2,opcode[2]);
not n3(op_not3,opcode[3]);
not n4(op_not4,opcode[4]);
not n5(op_not5,opcode[5]);

and a0(r_type,op_not5,op_not4,op_not3,op_not2,op_not1,op_not0);
and a1(lw,opcode[5],op_not4,op_not3,op_not2,opcode[1],opcode[0]); 							
and a2(sw,opcode[5],op_not4,opcode[3],op_not2,opcode[1],opcode[0]);
and a3(beg_wire,op_not5,op_not4,op_not3,opcode[2],op_not1,op_not0);
and a4(bne_wire,op_not5,op_not4,op_not3,opcode[2],op_not1,opcode[0]);
and a5(jump_wire,op_not5,op_not4,op_not3,op_not2,opcode[1],op_not0);
and a6(jal_wire,op_not5,op_not4,op_not3,op_not2,opcode[1],opcode[0]);
and a7(jr_wire,op_not5,op_not4,opcode[3],op_not2,op_not1,op_not0);
and a8(ori_wire,op_not5,op_not4,opcode[3],opcode[2],op_not1,opcode[0]);
and a9(lui_wire,op_not5,op_not4,opcode[3],opcode[2],opcode[1],opcode[0]);							

or o0(reg_dest,r_type,0);
or o1(alu_src,lw,sw);
or o2(mem_to_reg,lw,0);
or o3(reg_wrt,r_type,lw,jal_wire,ori_wire,lui_wire);
or o4(mem_read,lw,0);
or o5(mem_wrt,sw,0);
or o6(branch,beg_wire,0);
or o7(alu_op[1],r_type,ori_wire);
or o8(alu_op[0],beg_wire,bne_wire,ori_wire);
or o9(jump,jump_wire,0);
or o10(jal,jal_wire,0);
or o11(jr,jr_wire,0);
or o12(bne,bne_wire,0);
or o13(enable,r_type,0);
or o14(ori,ori_wire,0);
or o15(lui,lui_wire,0);


endmodule