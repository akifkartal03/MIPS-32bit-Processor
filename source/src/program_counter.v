module program_counter(new_pc,pc_arti1,jump,jal,jr,beq,bne,zero,rs,adress,pc,ext_immed);
		
//by convention, I wrote first outputs then inputs.		
output [13:0] new_pc;
output [31:0] pc_arti1;
				
input jump,jal,jr,beq,bne,zero;
input [25:0] adress;
input [31:0] rs,ext_immed;
input [13:0] pc;
wire [2:0] alu_ctr;
wire [31:0] zer,one,two,three,add_res,pc32,ext_adress,result,res1,res2;
wire c_out,c_in,br,brn,zero_not,select1,select2;

constant_producer cst(zer,one,two,three);
and setCin(c_in,0,0);
//pc+1 
adder_32bit ad1(pc_arti1,c_out, one, pc32, c_in);

//pc+ 1 + immd
adder_32bit ad2(add_res, c_out, pc_arti1, ext_immed, c_in);

and a4(br,zero,beq);
not n1(zero_not,zero);
and a5(brn,zero_not,bne);
or o1(select1,br,brn);
mux_32x1 m1(res1,pc_arti1,add_res,select1);

mux_32x1 m2(res2,ext_adress,rs,jr);
or o2(select2,jump,jal,jr);

mux_32x1 m3(result,res1,res2,select2);


//zero extend pc address in gate level
and a229(pc32[0],pc[0],1);
and a329(pc32[1],pc[1],1);
and a42(pc32[2],pc[2],1);
and a52(pc32[3],pc[3],1);
and a62(pc32[4],pc[4],1);
and a72(pc32[5],pc[5],1);
and a82(pc32[6],pc[6],1);
and a92(pc32[7],pc[7],1);
and a10(pc32[8],pc[8],1);
and a11(pc32[9],pc[9],1);
and a12(pc32[10],pc[10],1);
and a13(pc32[11],pc[11],1);
and a14(pc32[12],pc[12],1);
and a15(pc32[13],pc[13],1);
and a16(pc32[14],0,1);
and a17(pc32[15],0,1);
and a18(pc32[16],0,1);
and a19(pc32[17],0,1);
and a20(pc32[18],0,1);
and a21(pc32[19],0,1);
and a22(pc32[20],0,1);
and a23(pc32[21],0,1);
and a24(pc32[22],0,1);
and a25(pc32[23],0,1);
and a26(pc32[24],0,1);
and a27(pc32[25],0,1);
and a28(pc32[26],0,1);
and a29(pc32[27],0,1);
and a30(pc32[28],0,1);
and a31(pc32[29],0,1);
and a32(pc32[30],0,1);
and a33(pc32[31],0,1);

//extend adress {PC+4[31:28],adress,2'b0} //from green shett
and a222(ext_adress[0],adress[0],1);
and a322(ext_adress[1],adress[1],1);
and a422(ext_adress[2],adress[2],1);
and a522(ext_adress[3],adress[3],1);
and a622(ext_adress[4],adress[4],1);
and a722(ext_adress[5],adress[5],1);
and a822(ext_adress[6],adress[6],1);
and a922(ext_adress[7],adress[7],1);
and a102(ext_adress[8],adress[8],1);
and a112(ext_adress[9],adress[9],1);
and a122(ext_adress[10],adress[10],1);
and a132(ext_adress[11],adress[11],1);
and a142(ext_adress[12],adress[12],1);
and a152(ext_adress[13],adress[13],1);
and a162(ext_adress[14],adress[14],1);
and a172(ext_adress[15],adress[15],1);
and a182(ext_adress[16],adress[16],1);
and a192(ext_adress[17],adress[17],1);
and a203(ext_adress[18],adress[18],1);
and a213(ext_adress[19],adress[19],1);
and a223(ext_adress[20],adress[20],1);
and a235(ext_adress[21],adress[21],1);
and a243(ext_adress[22],adress[22],1);
and a253(ext_adress[23],adress[23],1);
and a263(ext_adress[24],adress[24],1);
and a273(ext_adress[25],adress[25],1);
and a283(ext_adress[26],0,1);
and a293(ext_adress[27],0,1);
and a305(ext_adress[28],0,1);
and a316(ext_adress[29],0,1);
and a328(ext_adress[30],0,1);
and a339(ext_adress[31],0,1);

//setup new pc
and aa(new_pc[0],result[0],1);
and ab(new_pc[1],result[1],1);
and ac(new_pc[2],result[2],1);
and ad(new_pc[3],result[3],1);
and ae(new_pc[4],result[4],1);
and ar(new_pc[5],result[5],1);
and as(new_pc[6],result[6],1);
and ak(new_pc[7],result[7],1);
and at(new_pc[8],result[8],1);
and ap(new_pc[9],result[9],1);
and au(new_pc[10],result[10],1);
and ao(new_pc[11],result[11],1);
and ax(new_pc[12],result[12],1);
and ai(new_pc[13],result[13],1);



endmodule