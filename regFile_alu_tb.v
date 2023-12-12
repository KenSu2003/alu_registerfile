module regFile_alu_tb();
	reg clk;
	reg regWrite;
	reg [4:0] rs1, rs2, rd;
	reg [31:0] data;
	wire [31:0] rv1, rv2;
	
   reg [3:0] control;
	reg [1:0] mux;
	wire [31:0] immGen;
   wire [31:0] result;
	wire [1:0]  zero;
	
	
	// Instantiate the modules
	regFile_alu dut(clk, regWrite, rs1, rs2, rd, data, rv1, rv2, control, mux, immGen, result, zero);
	
	initial begin 
		clk = 0;
		forever #10 clk=~clk;
	end
		
	initial begin
	
		/* add */
		$display("add x3, x4, x5");
		// regFile
		rs1 = 3;			// x3 = 0
		rs2 = 4;			// x4 = 0
		rd = 4;
		data = 4323;
		regWrite = 1;	// x4 = data
		#50
		$display("x%h = %h",rs1,rv1);
		$display("x%h = %h",rs2,rv2);
		// ALU
		control = 2;	// add
		mux = 0;
		#50 
		data = result;
		rs1 = 4;
		rs2 = 5;
		rd = 5;
		regWrite = 1;	// x5 = x3+x4
		#50
		$display("x%h = %h",rs2,rv2);
		
		/* sub */
		$display("sub x3, x4, x5");
		// regFile
		rs1 = 3;			// x3 = 0
		rs2 = 4;			// x4 = 0
		rd = 4;
		data = 4323;
		regWrite = 1;	// x4 = data
		#50
		$display("x%h = %h",rs1,rv1);
		$display("x%h = %h",rs2,rv2);
		// ALU
		control = 6;	// sub
		mux = 0;
		#50 
		data = result;
		rs1 = 4;
		rs2 = 5;
		rd = 5;
		regWrite = 1;	// x5 = x3-x4
		#50
		$display("x%h = %h",rs2,rv2);
		
		
	end
	
endmodule
