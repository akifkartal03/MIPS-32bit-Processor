module alu_32bit(r,c_out,z,a,b,alu_ctr);

//by convention, I wrote first outputs then inputs.
output c_out,z;
output [31:0] r;
input [31:0] a,b;
input [2:0] alu_ctr;

wire [30:0] c_o;
wire [15:0] or0;
wire [7:0] or1;
wire [3:0] or2;
wire [1:0] or3;
wire or4;

not result(z, or4); //zero bit will be or result

alu_1bit a0(r[0],c_o[0],a[0],b[0],alu_ctr[2],alu_ctr);
alu_1bit a1(r[1],c_o[1],a[1],b[1],c_o[0],alu_ctr);
alu_1bit a2(r[2],c_o[2],a[2],b[2],c_o[1],alu_ctr);
alu_1bit a3(r[3],c_o[3],a[3],b[3],c_o[2],alu_ctr);
alu_1bit a4(r[4],c_o[4],a[4],b[4],c_o[3],alu_ctr);
alu_1bit a5(r[5],c_o[5],a[5],b[5],c_o[4],alu_ctr);
alu_1bit a6(r[6],c_o[6],a[6],b[6],c_o[5],alu_ctr);
alu_1bit a7(r[7],c_o[7],a[7],b[7],c_o[6],alu_ctr);
alu_1bit a8(r[8],c_o[8],a[8],b[8],c_o[7],alu_ctr);
alu_1bit a9(r[9],c_o[9],a[9],b[9],c_o[8],alu_ctr);
alu_1bit a10(r[10],c_o[10],a[10],b[10],c_o[9],alu_ctr);
alu_1bit a11(r[11],c_o[11],a[11],b[11],c_o[10],alu_ctr);
alu_1bit a12(r[12],c_o[12],a[12],b[12],c_o[11],alu_ctr);
alu_1bit a13(r[13],c_o[13],a[13],b[13],c_o[12],alu_ctr);
alu_1bit a14(r[14],c_o[14],a[14],b[14],c_o[13],alu_ctr);
alu_1bit a15(r[15],c_o[15],a[15],b[15],c_o[14],alu_ctr);
alu_1bit a16(r[16],c_o[16],a[16],b[16],c_o[15],alu_ctr);
alu_1bit a17(r[17],c_o[17],a[17],b[17],c_o[16],alu_ctr);
alu_1bit a18(r[18],c_o[18],a[18],b[18],c_o[17],alu_ctr);
alu_1bit a19(r[19],c_o[19],a[19],b[19],c_o[18],alu_ctr);
alu_1bit a20(r[20],c_o[20],a[20],b[20],c_o[19],alu_ctr);
alu_1bit a21(r[21],c_o[21],a[21],b[21],c_o[20],alu_ctr);
alu_1bit a22(r[22],c_o[22],a[22],b[22],c_o[21],alu_ctr);
alu_1bit a23(r[23],c_o[23],a[23],b[23],c_o[22],alu_ctr);
alu_1bit a24(r[24],c_o[24],a[24],b[24],c_o[23],alu_ctr);
alu_1bit a25(r[25],c_o[25],a[25],b[25],c_o[24],alu_ctr);
alu_1bit a26(r[26],c_o[26],a[26],b[26],c_o[25],alu_ctr);
alu_1bit a27(r[27],c_o[27],a[27],b[27],c_o[26],alu_ctr);
alu_1bit a28(r[28],c_o[28],a[28],b[28],c_o[27],alu_ctr);
alu_1bit a29(r[29],c_o[29],a[29],b[29],c_o[28],alu_ctr);
alu_1bit a30(r[30],c_o[30],a[30],b[30],c_o[29],alu_ctr);
alu_1bit a31(r[31],c_out,a[31],b[31],c_o[30],alu_ctr);

or or0_0(or0[0], r[0], r[1]);
or or0_1(or0[1], r[2], r[3]);
or or0_2(or0[2], r[4], r[5]);
or or0_3(or0[3], r[6], r[7]);
or or0_4(or0[4], r[8], r[9]);
or or0_5(or0[5], r[10], r[11]);
or or0_6(or0[6], r[12], r[13]);
or or_7(or0[7], r[14], r[15]);
or or0_8(or0[8], r[16], r[17]);
or or0_9(or0[9], r[18], r[19]);
or or0_10(or0[10], r[20], r[21]);
or or0_11(or0[11], r[22], r[23]);
or or0_12(or0[12], r[24], r[25]);
or or0_13(or0[13], r[26], r[27]);
or or0_14(or0[14], r[28], r[29]);
or or0_15(or0[15], r[30], r[31]);
or or1_16(or1[0], or0[0], or0[1]);
or or1_17(or1[1], or0[2], or0[3]);
or or1_18(or1[2], or0[4], or0[5]);
or or1_19(or1[3], or0[6], or0[7]);
or or1_20(or1[4], or0[8], or0[9]);
or or1_21(or1[5], or0[10], or0[11]);
or or1_22(or1[6], or0[12], or0[13]);
or or1_23(or1[7], or0[14], or0[15]);
or or2_24(or2[0], or1[0], or1[1]);
or or2_25(or2[1], or1[2], or1[3]);
or or2_26(or2[2], or1[4], or1[5]);
or or2_27(or2[3], or1[6], or1[7]);
or or3_28(or3[0], or2[0], or2[1]);
or or3_29(or3[1], or2[2], or2[3]);
or or4_30(or4, or3[0], or3[1]);

endmodule