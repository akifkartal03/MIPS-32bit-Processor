module zero_extender_testbench();
	reg signed [15:0] number;
	wire signed [31:0] result;
	zero_extender zer(result,number);
	initial begin
	number = 16'b00000_00000_00000_0; //zero
	#20;
	number = 16'b00000_10010_00010_1; //positive
	#20;
	number = 16'b1111_00100_001100_1; //negative
	#20;
	end
	initial begin
	$monitor("time=%2d,number=%16b,result=%32b",$time,number,result);
	end
endmodule