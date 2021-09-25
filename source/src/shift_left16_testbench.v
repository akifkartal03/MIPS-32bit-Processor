module shift_left16_testbench();
	reg signed [31:0] number;
	wire signed [31:0] result;
	shift_left16 shiflef(result,number);
	initial begin
	number = 32'b00000_00000_00000_00000_00000_00000_00; //zero
	#20;
	number = 32'b01100_00000_00010_01010_00100_11111_11; //positive
	#20;
	number = 32'b1111_00011_001100_00111_11100_00000_10; //negative
	#20;
	end
	initial begin
	$monitor("time=%2d,number=%32b,result=%32b",$time,number,result);
	end
endmodule