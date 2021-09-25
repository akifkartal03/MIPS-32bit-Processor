module mux_5x1(d,i0,i1,s0);
output [4:0] d;
input [4:0] i0,i1;
input s0;

mux_2x1 m1(d[0],i0[0],i1[0],s0);
mux_2x1 m2(d[1],i0[1],i1[1],s0);
mux_2x1 m3(d[2],i0[2],i1[2],s0);
mux_2x1 m4(d[3],i0[3],i1[3],s0);
mux_2x1 m5(d[4],i0[4],i1[4],s0);

endmodule