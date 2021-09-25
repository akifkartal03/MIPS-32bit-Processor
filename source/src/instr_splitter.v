module instr_splitter(opcode,rs,rt,rd,immediate,funct,adress,instruction);
		
//by convention, I wrote first outputs then inputs.		
output [4:0] rs,rt,rd;
output [5:0] funct,opcode;
output [15:0] immediate;
output [25:0] adress;						
input [31:0] instruction; 

//opcode
and a2(opcode[0],instruction[26],1);
and a3(opcode[1],instruction[27],1);
and a4(opcode[2],instruction[28],1);
and a5(opcode[3],instruction[29],1);
and a6(opcode[4],instruction[30],1);
and a7(opcode[5],instruction[31],1);


//rs
and a8(rs[0],instruction[21],1);
and a9(rs[1],instruction[22],1);
and a10(rs[2],instruction[23],1);
and a11(rs[3],instruction[24],1);
and a12(rs[4],instruction[25],1);


//rt
and a13(rt[0],instruction[16],1);
and a14(rt[1],instruction[17],1);
and a15(rt[2],instruction[18],1);
and a16(rt[3],instruction[19],1);
and a17(rt[4],instruction[20],1);

//rd
and a18(rd[0],instruction[11],1);
and a19(rd[1],instruction[12],1);
and a20(rd[2],instruction[13],1);
and a21(rd[3],instruction[14],1);
and a22(rd[4],instruction[15],1);

//immediate
and a34(immediate[0],instruction[0],1);
and a35(immediate[1],instruction[1],1);
and a36(immediate[2],instruction[2],1);
and a37(immediate[3],instruction[3],1);
and a38(immediate[4],instruction[4],1);
and a23(immediate[5],instruction[5],1);
and a24(immediate[6],instruction[6],1);
and a25(immediate[7],instruction[7],1);
and a26(immediate[8],instruction[8],1);
and a27(immediate[9],instruction[9],1);
and a28(immediate[10],instruction[10],1);
and a29(immediate[11],instruction[11],1);
and a30(immediate[12],instruction[12],1);
and a31(immediate[13],instruction[13],1);
and a32(immediate[14],instruction[14],1);
and a33(immediate[15],instruction[15],1);

//funct
and a39(funct[0],instruction[0],1);
and a40(funct[1],instruction[1],1);
and a41(funct[2],instruction[2],1);
and a42(funct[3],instruction[3],1);
and a43(funct[4],instruction[4],1);
and a44(funct[5],instruction[5],1);

//adress
and a100(adress[0],instruction[0],1);
and a111(adress[1],instruction[1],1);
and a122(adress[2],instruction[2],1);
and a133(adress[3],instruction[3],1);
and a144(adress[4],instruction[4],1);
and a155(adress[5],instruction[5],1);
and a166(adress[6],instruction[6],1);
and a177(adress[7],instruction[7],1);
and a188(adress[8],instruction[8],1);
and a199(adress[9],instruction[9],1);
and a200(adress[10],instruction[10],1);
and a211(adress[11],instruction[11],1);
and a222(adress[12],instruction[12],1);
and a238(adress[13],instruction[13],1);
and a249(adress[14],instruction[14],1);
and a250(adress[15],instruction[15],1);
and a261(adress[16],instruction[16],1);
and a272(adress[17],instruction[17],1);
and a283(adress[18],instruction[18],1);
and a292(adress[19],instruction[19],1);
and a304(adress[20],instruction[20],1);
and a315(adress[21],instruction[21],1);
and a326(adress[22],instruction[22],1);
and a337(adress[23],instruction[23],1);
and a80(adress[24],instruction[24],1);
and a90(adress[25],instruction[25],1);

endmodule