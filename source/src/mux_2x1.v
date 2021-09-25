module mux_2x1(d,i0,i1,s0);
output d;
input i0,i1,s0;
wire s0_not,and1,and2;

not n2(s0_not,s0);
and a1(and1,i0,s0_not);
and a2(and2,i1,s0);
or o1(d,and1,and2);


endmodule