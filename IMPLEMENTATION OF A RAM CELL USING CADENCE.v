module ram(
    input clk,
    input [5:0] addr,
    input [7:0] data_in,
    input write_en,
    output [7:0] data_out
    );
reg [5:0]read_addr;
reg [7:0]ram[63:0];

always @ (posedge clk)
begin
if (write_en==1)
	ram[addr]=data_in;
read_addr=addr;
end

assign data_out=ram[read_addr];	

endmodule

TEST BENCH FOR RAM:
module ram_test;
	// Inputs
	reg clk;
	reg [5:0] addr;
	reg [7:0] data_in;
	reg write_en;
	// Outputs
	wire [7:0] data_out;
	// Instantiate the Unit Under Test (UUT)
	ram uut (
		.clk(clk), 
		.addr(addr), 
		.data_in(data_in), 
		.write_en(write_en), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		addr = 0;
		data_in = 0;
		write_en = 0;

		// Wait 100 ns for global reset to finish
		#100;
		clk = 1;
        data_in = 101;
		write_en = 1;
		#100;
		clk = 1;
        data_in = 111;
		write_en = 1; 
		// Add stimulus here
	end     
endmodule
