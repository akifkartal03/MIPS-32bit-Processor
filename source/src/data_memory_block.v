module data_memory_block(read_data,adress,write_data,mem_write,mem_read,clk);

//by convention, I wrote first outputs then inputs.
output reg [31:0] read_data;
input [17:0] adress; //adress will be 18 bits(256KB) 
input [31:0] write_data;
input mem_read,mem_write,clk;

reg [31:0] memory [255:0]; // memory array.(each data will be 32 bits)

//No file operation here, it will be in testbench.

//Since there was a problem in loadword, I read and write memory each clock cyle by checking signals.
always @(*) 
begin
	//write to memory by extending adress(zero extend)
	if (mem_write)
		begin
		memory[{14'b0,adress}] <= write_data;
		end
	//read from memory by extending adress(zero extend)
	if (mem_read)
		begin
		read_data <= memory[{14'b0,adress}];
		end
end


endmodule