module program_counter_testbench();
	wire [13:0] new_pc;
	wire [31:0] pc_arti1;
				
	reg jump,jal,jr,beq,bne,zero;
	reg [25:0] adress;
	reg [31:0] rs,ext_immed;
	reg [13:0] pc;
	
	program_counter my_pc(new_pc,pc_arti1,jump,jal,jr,beq,bne,zero,rs,adress,pc,ext_immed);
	initial begin
	//normal
	jump=1'b0;
	jal=1'b0;
	jr=1'b0;
	beq=1'b0;
	bne=1'b0;
	zero=1'b0;
	adress=26'b00000000000000000000000101;//5
	rs=32'b00000000000000000000000000001010;//10
	ext_immed=32'b00000000000000000000000000001000;//8
	pc=14'b00000000000000;//0
	
	#20;
	// jump
	jump=1'b1;
	jal=1'b0;
	jr=1'b0;
	beq=1'b0;
	bne=1'b0;
	zero=1'b0;
	adress=26'b00000000000000000000000101;//5
	rs=32'b00000000000000000000000000001010;//10
	ext_immed=32'b00000000000000000000000000001000;//8
	pc=14'b00000000000000;//0
	
	#20;
	// jal
	jump=1'b0;
	jal=1'b1;
	jr=1'b0;
	beq=1'b0;
	bne=1'b0;
	zero=1'b0;
	adress=26'b00000000000000000000000101;//5
	rs=32'b00000000000000000000000000001010;//10
	ext_immed=32'b00000000000000000000000000001000;//8
	pc=14'b00000000000000;//0
	
	#20;
	// jr
	jump=1'b0;
	jal=1'b0;
	jr=1'b1;
	beq=1'b0;
	bne=1'b0;
	zero=1'b0;
	adress=26'b00000000000000000000000101;//5
	rs=32'b00000000000000000000000000001010;//10
	ext_immed=32'b00000000000000000000000000001000;//8
	pc=14'b00000000000000;//0
	
	#20;
	// branch
	jump=1'b0;
	jal=1'b0;
	jr=1'b0;
	beq=1'b1;
	bne=1'b0;
	zero=1'b1;
	adress=26'b00000000000000000000000101;//5
	rs=32'b00000000000000000000000000001010;//10
	ext_immed=32'b00000000000000000000000000001000;//8
	pc=14'b00000000000011;//3
	
	#20; 
	// branch not equal
	jump=1'b0;
	jal=1'b0;
	jr=1'b0;
	beq=1'b0;
	bne=1'b1;
	zero=1'b0;
	adress=26'b00000000000000000000000101;//5
	rs=32'b00000000000000000000000000001010;//10
	ext_immed=32'b00000000000000000000000000001000;//8
	pc=14'b00000000000010;//2
	
	#20;
	
	end
	initial begin
	$monitor("time=%2d,jump=%1b,jal=%1b,jr=%1b,beq=%1b,bne=%1b,zero=%1b,adress=%2d,rs=%2d,ext_immed=%2d,pc=%2d,pc_arti1=%2d,new_pc=%2d "
	          ,$time,jump,jal,jr,beq,bne,zero,adress,rs,ext_immed,pc,pc_arti1,new_pc);
	end

endmodule