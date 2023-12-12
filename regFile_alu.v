module regFile_alu(
	input clk,				// clk
	
	// regFile
   input regWrite,		// RegWrite control signal (0,1)
   input [4:0] rs1,		// register source 1
   input [4:0] rs2,		// register source 2
   input [4:0] rd,		// register destination (writerRegister)
   input [31:0] data,	// write data
   output reg [31:0] rv1,	// register values (data) 1
   output reg [31:0] rv2,	// register values (data) 2
	
	// ALU
	input [3:0]  control,
	input [1:0] mux,				// to determine b or immGen
	output reg [31:0] immGen,
	output reg [31:0] result,
	output reg [1:0]  zero
   );
	
	
	/**************** regFile ****************/
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
	
	/**************** ALU ****************/
	
	always @(posedge clk) begin
		
		// for R-type instructions
		case(control)
			4'b0000: result <= rv1 & rv2;
			4'b0001: result <= rv1 | rv2;
			4'b0010: result <= rv1 + rv2;
			4'b0110: result <= rv1 - rv2;
			default: result <= 0;
		endcase
		
		// for branch instructions
		if(result == 0)
			zero <= 1;					// branch
		else
			zero <= 0;					// no branch
			
		// for lw and sw
		immGen = 543254;				// random abstract value
		if(mux == 1)
			result  <= rv1 + immGen;	// memory address
		
	end
	 
endmodule
