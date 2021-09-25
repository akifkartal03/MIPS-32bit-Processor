module adder_32bit(d, carry_out, i0, i1, carry_in);
output [31:0] d;
output carry_out;
input [31:0] i0,i1;
input carry_in;
wire [30:0] c; //intermediate carries

full_adder m1(d[0],c[0],i0[0],i1[0],carry_in);
full_adder m2(d[1],c[1],i0[1],i1[1],c[0]);
full_adder m3(d[2],c[2],i0[2],i1[2],c[1]);
full_adder m4(d[3],c[3],i0[3],i1[3],c[2]);
full_adder m5(d[4],c[4],i0[4],i1[4],c[3]);
full_adder m6(d[5],c[5],i0[5],i1[5],c[4]);
full_adder m7(d[6],c[6],i0[6],i1[6],c[5]);
full_adder m8(d[7],c[7],i0[7],i1[7],c[6]);
full_adder m9(d[8],c[8],i0[8],i1[8],c[7]);
full_adder m10(d[9],c[9],i0[9],i1[9],c[8]);
full_adder m11(d[10],c[10],i0[10],i1[10],c[9]);
full_adder m12(d[11],c[11],i0[11],i1[11],c[10]);
full_adder m13(d[12],c[12],i0[12],i1[12],c[11]);
full_adder m14(d[13],c[13],i0[13],i1[13],c[12]);
full_adder m15(d[14],c[14],i0[14],i1[14],c[13]);
full_adder m16(d[15],c[15],i0[15],i1[15],c[14]);
full_adder m17(d[16],c[16],i0[16],i1[16],c[15]);
full_adder m18(d[17],c[17],i0[17],i1[17],c[16]);
full_adder m19(d[18],c[18],i0[18],i1[18],c[17]);
full_adder m20(d[19],c[19],i0[19],i1[19],c[18]);
full_adder m21(d[20],c[20],i0[20],i1[20],c[19]);
full_adder m22(d[21],c[21],i0[21],i1[21],c[20]);
full_adder m23(d[22],c[22],i0[22],i1[22],c[21]);
full_adder m24(d[23],c[23],i0[23],i1[23],c[22]);
full_adder m25(d[24],c[24],i0[24],i1[24],c[23]);
full_adder m26(d[25],c[25],i0[25],i1[25],c[24]);
full_adder m27(d[26],c[26],i0[26],i1[26],c[25]);
full_adder m28(d[27],c[27],i0[27],i1[27],c[26]);
full_adder m29(d[28],c[28],i0[28],i1[28],c[27]);
full_adder m30(d[29],c[29],i0[29],i1[29],c[28]);
full_adder m31(d[30],c[30],i0[30],i1[30],c[29]);
full_adder m32(d[31],carry_out,i0[31],i1[31],c[30]);


endmodule