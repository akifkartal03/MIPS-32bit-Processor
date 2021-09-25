module mux_4x1(d,i0,i1,i2,i3,s1,s0);
output d;
input i0,i1,i2,i3,s1,s0;
wire s1_not,s0_not,and1,and2,and3,and4;

not n1(s1_not,s1);
not n2(s0_not,s0);

and a1(and1,i0,s1_not,s0_not);
and a2(and2,i1,s1_not,s0);
and a3(and3,i2,s1,s0_not);
and a4(and4,i3,s1,s0);
or o1(d,and1,and2,and3,and4);

endmodule