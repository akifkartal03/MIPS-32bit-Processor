module register_block(read_data1,read_data2,read_reg1,read_reg2,write_reg1,
								write_reg2,write_data1,write_data2,enable,reg_write,clk);

//by convention, I wrote first outputs then inputs.
output reg [31:0] read_data1,read_data2;
input [31:0] write_data1,write_data2;
input [4:0] read_reg1,read_reg2,write_reg1,write_reg2;
input enable,reg_write,clk;

reg [31:0] registers [31:0];//from draft(register array)

//No file operation here, it will be in testbench.
//first get data from read registers while cyle is done

//read always from register not just posedge or negedge clock.
always @(*) 
begin
	read_data1 <= registers[read_reg1];
	read_data2 <= registers[read_reg2];
end

//write to register only end of cyle(negedge) as convention.
always @(negedge clk) 
begin
	//second check reg write signal and write
	if (reg_write)
		begin
		registers[write_reg1] <= write_data1;
		end
	//third check enable signal and write
	if (enable)
		begin
		registers[write_reg2] <= write_data2;
		end
	
end
endmodule