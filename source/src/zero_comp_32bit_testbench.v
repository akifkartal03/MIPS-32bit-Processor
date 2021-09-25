module zero_comp_32bit_testbench();
	reg signed [31:0] number;
	wire bg,les,eq;
	zero_comp_32bit my_comp(bg,les,eq,number);
	initial begin
	number = 32'b00000_00000_00000_00000_00000_00000_00; //equal
	#20;
	number = 32'b00000_00000_00010_00010_00100_00000_11; //bigger
	#20;
	number = 32'b1111_00000_001100_00100_00100_00100_10; //less
	#20;
	end
	initial begin
	$monitor("time=%2d,number=%2d,equal=%1b,bigger=%1b,less=%1b",$time,number,eq,bg,les);
	end
endmodule