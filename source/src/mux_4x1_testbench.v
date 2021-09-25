module mux_4x1_testbench();
	reg i0,i1,i2,i3,s1,s0;
	wire d;
	mux_4x1 my_mux(d,i0,i1,i2,i3,s1,s0);
	initial begin
	i0 = 1'b0; i1 =1'b0; i2 = 1'b0; i3 =1'b1; s0 = 1'b1; s1 =1'b1;
	#20;
	i0 = 1'b1; i1 =1'b0; i2 = 1'b0; i3 =1'b0; s0 = 1'b0; s1 =1'b0;
	#20;
	i0 = 1'b0; i1 =1'b1; i2 = 1'b0; i3 =1'b0; s0 = 1'b0; s1 =1'b1;
	#20;
	i0 = 1'b0; i1 =1'b0; i2 = 1'b1; i3 =1'b0; s0 = 1'b1; s1 =1'b0;
	#20;
	end
	initial begin
	$monitor("time=%2d,i0=%1b,i1=%1b,i2=%1b,i3=%1b,s0=%1b,s1=%1b,result=%1b"
	          ,$time,i0,i1,i2,i3,s0,s1,d);
	end
endmodule