module zero_comp_32bit(bg,les,eq,number);
output bg,les,eq;
input [31:0] number;
wire [31:0] temp;
wire test,abc;

//check least significant bit of number as sign bit
//less will be 1 if sign bit is 1 
and a1(les,number[31],1);

//check equality of zero with xnor gate
xnor a2(temp[0],number[0],0);
xnor a3(temp[1],number[1],0);
xnor a4(temp[2],number[2],0);
xnor a5(temp[3],number[3],0);
xnor a6(temp[4],number[4],0);
xnor a7(temp[5],number[5],0);
xnor a8(temp[6],number[6],0);
xnor a9(temp[7],number[7],0);
xnor a10(temp[8],number[8],0);
xnor a11(temp[9],number[9],0);
xnor a12(temp[10],number[10],0);
xnor a13(temp[11],number[11],0);
xnor a14(temp[12],number[12],0);
xnor a15(temp[13],number[13],0);
xnor a16(temp[14],number[14],0);
xnor a17(temp[15],number[15],0);
xnor a18(temp[16],number[16],0);
xnor a19(temp[17],number[17],0);
xnor a20(temp[18],number[18],0);
xnor a21(temp[19],number[19],0);
xnor a22(temp[20],number[20],0);
xnor a23(temp[21],number[21],0);
xnor a24(temp[22],number[22],0);
xnor a25(temp[23],number[23],0);
xnor a26(temp[24],number[24],0);
xnor a27(temp[25],number[25],0);
xnor a28(temp[26],number[26],0);
xnor a29(temp[27],number[27],0);
xnor a30(temp[28],number[28],0);
xnor a31(temp[29],number[29],0);
xnor a32(temp[30],number[30],0);
xnor a33(temp[31],number[31],0);

and x1(eq,temp[0],temp[1],temp[2],temp[3],temp[4],temp[5],temp[6],temp[7],temp[8],temp[9],temp[10],temp[11],temp[12],temp[13],temp[14],temp[15],temp[16],temp[17],temp[18],temp[19],
temp[20],temp[21],temp[22],temp[23],temp[24],temp[25],temp[26],temp[27],temp[28],temp[29],temp[30],temp[31]);

//bigger will be not of equality and if less is not 1
not n1(abc,eq);
not n2(test,les);
and a48(bg,abc,test);

endmodule