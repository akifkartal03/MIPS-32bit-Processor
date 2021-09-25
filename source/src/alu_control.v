module alu_control(alu_ctr,alu_op,func);

//by convention, I wrote first outputs then inputs.
output [2:0] alu_ctr;
input [1:0] alu_op;
input [5:0] func;
wire alu_op_not1,func_not2,res_or0,res_and2,res1,res2,res3,res4,res5;
//alu_ctr[0]
or o0(res_or0,func[3],func[0]);
and a0(res1,alu_op[1],res_or0);
and a3(res2,alu_op[0],alu_op[1]);
or o4(alu_ctr[0],res1,res2);
//alu_ctr[1]
not n0(alu_op_not1,alu_op[1]);
not n1(func_not2,func[2]);
or o1(res3,alu_op_not1,func_not2);
not n2(res4,res2);
and a4(alu_ctr[1],res4,res3);
//alu_ctr[2]
and a1(res_and2,alu_op[1],func[1]);
or o2(res5,alu_op[0],res_and2);
and a5(alu_ctr[2],res5,res4);
endmodule
