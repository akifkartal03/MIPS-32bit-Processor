module alu_1bit(r,c_out,a,b,c_in,alu_ctr);

//by convention, I wrote first outputs then inputs.
output r,c_out;
input a,b,c_in;
input [2:0] alu_ctr;
wire xor1,xor2,and1,and2,and3,and4,or1,or2,or3,not1,not2;

xor x1(xor1,b,alu_ctr[2]);
xor x2(xor2,a,b);

and a1(and1,a,xor1);
and a2(and2,or1,not1);
and a3(and3,c_in,and2);
and a4(and4,not2,or2);

or o1(or1,a,xor1);
or o2(or2,c_in,and2);
or o3(c_out,and3,and1);

not n1(not1,and1);
not n2(not2,and3);

mux_4x1 m1(r,and1,or1,and4,xor2,alu_ctr[1],alu_ctr[0]);

endmodule