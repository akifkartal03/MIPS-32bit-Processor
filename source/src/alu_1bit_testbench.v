module alu_1bit_testbench();
	reg a,b,c_in;
	reg [2:0] alu_ctr;
	wire r,c_out;
	alu_1bit my_alu(r,c_out,a,b,c_in,alu_ctr);
	initial begin
	a = 1'b0; b =1'b0; c_in = 1'b0; alu_ctr =3'b000; //and
	#20;
	a = 1'b1; b =1'b0; c_in = 1'b0; alu_ctr =3'b001; //or
	#20;
	a = 1'b1; b =1'b1; c_in = 1'b1; alu_ctr =3'b010; //add
	#20;
	a = 1'b1; b =1'b1; c_in = 1'b1; alu_ctr =3'b110; //sub
	#20;
	a = 1'b0; b =1'b1; c_in = 1'b0; alu_ctr =3'b111; //xor
	#20;
	end
	initial begin
	$monitor("time=%2d,a=%1b,b=%1b,alu_ctr=%3b,cin=%1b,r=%1b,cout=%1b"
	          ,$time,a,b,alu_ctr,c_in,r,c_out);
	end
endmodule