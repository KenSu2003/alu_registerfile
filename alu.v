module alu(
	input clk,
	input [31:0] a,
	input [31:0] b,
	input [3:0]  control,
	input [1:0] mux,				// to determine b or immGen
	output reg [31:0] immGen,
	output reg [31:0] result,
	output reg [1:0]  zero
	);
	 
	always @(posedge clk) begin
		
		// for R-type instructions
		case(control)
			4'b0000: result <= a & b;
			4'b0001: result <= a | b;
			4'b0010: result <= a + b;
			4'b0110: result <= a - b;
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
			result  <= a + immGen;	// memory address
		
	end

endmodule