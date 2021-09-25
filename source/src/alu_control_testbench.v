module alu_control_testbench();
	
	reg [1:0] alu_op;
	reg [5:0] func;
	wire [2:0] alu_ctr;
	alu_control my_ctr(alu_ctr,alu_op,func);
	initial begin
	alu_op = 2'b00; func =6'b110100; // lw - sw
	#20;
	alu_op = 2'b01; func =6'b010101; // beq - bne
	#20;
	alu_op = 2'b11; func =6'b111111; // ori
	#20;
	alu_op = 2'b10; func =6'b100000; // addn
	#20;
	alu_op = 2'b10; func =6'b100010; // subn
	#20;
	alu_op = 2'b10; func =6'b100100; // andn
	#20;
	alu_op = 2'b10; func =6'b100101; // orn
	#20;
	alu_op = 2'b10; func =6'b101010; // xorn
	#20;
	end
	initial begin
	$monitor("time=%2d,alu_op=%2b,function=%6b,alu_ctr=%3b",$time,alu_op,func,alu_ctr);
	end
endmodule

