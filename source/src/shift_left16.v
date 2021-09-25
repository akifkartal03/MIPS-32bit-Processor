module shift_left16(temp,number);
output [31:0] temp;
input [31:0] number;

//this module for lui instr.

//low 16 bit will 0
and a18(temp[0],0,1);
and a19(temp[1],0,1);
and a20(temp[2],0,1);
and a21(temp[3],0,1);
and a22(temp[4],0,1);
and a23(temp[5],0,1);
and a24(temp[6],0,1);
and a25(temp[7],0,1);
and a26(temp[8],0,1);
and a27(temp[9],0,1);
and a28(temp[10],0,1);
and a29(temp[11],0,1);
and a30(temp[12],0,1);
and a31(temp[13],0,1);
and a32(temp[14],0,1);
and a33(temp[15],0,1);

//high 16 bit will be low 16 bit
and a2(temp[16],number[0],1);
and a3(temp[17],number[1],1);
and a4(temp[18],number[2],1);
and a5(temp[19],number[3],1);
and a6(temp[20],number[4],1);
and a7(temp[21],number[5],1);
and a8(temp[22],number[6],1);
and a9(temp[23],number[7],1);
and a10(temp[24],number[8],1);
and a11(temp[25],number[9],1);
and a12(temp[26],number[10],1);
and a13(temp[27],number[11],1);
and a14(temp[28],number[12],1);
and a15(temp[29],number[13],1);
and a16(temp[30],number[14],1);
and a17(temp[31],number[15],1);

endmodule