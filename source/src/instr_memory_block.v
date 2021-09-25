module instr_memory_block(instruction,read_adress,clk);

//by convention, I wrote first outputs then inputs.
output reg [31:0] instruction;
input [13:0] read_adress; //adress will be 14 bits(16KB)
input clk;

//  there will be 28 instr. for testing
//  but we have jump,beq instr. therefore number of inst. will be more.
reg [31:0] instr_memory [99:0]; 

//No file operation here, it will be in testbench.
//get instruction by extending adress(zero extend)
always @(posedge clk) 
begin
	instruction <= instr_memory[{18'b0,read_adress}];
end

endmodule