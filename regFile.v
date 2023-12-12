module regFile(
	input clk,				// clk
   input regWrite,		// RegWrite control signal (0,1)
   input [4:0] rs1,		// register source 1
   input [4:0] rs2,		// register source 2
   input [4:0] rd,		// register destination (writerRegister)
   input [31:0] data,	// write data
   output reg [31:0] rv1,	// register values (data) 1
   output reg [31:0] rv2	// register values (data) 2
   );
	
	// 32-bits for each 32-registers
	reg [31:0] registers [0:31];

	// Initialize registers
	integer i;
	initial
		for (i=0;i<32;i=i+1)
			registers[i] = 0;
	
	// On rising clock
	always @(posedge clk) begin 
		// Read and Update Register Output Values
		rv1 <= registers[rs1];
		rv2 <= registers[rs2];
		
		// If Write to Register is true
		if(regWrite && rd != 0) begin
			// rd = r1 operation r2
			registers[rd] <= data;
			
			if(rs1 == rd)
				rv1 <= data;
			if(rs2 == rd)
				rv2 <= data;

		end
	end
	 
endmodule
