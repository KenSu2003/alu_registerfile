module alu_tb();


	// test_alu
	reg clk;
	reg [31:0] a, b;
   reg [3:0] control;
	reg [1:0] mux;
	wire [31:0] immGen;
   wire [31:0] result;
	wire [1:0]  zero;

	// Instantiate the modules

	alu dut(clk, a, b, control, mux, immGen, result, zero);
	
	
	initial begin 
		clk = 0;
		forever #10 clk=~clk;
	end
	
	initial begin
	
		/* Test 1 */
		$display("******** add ********");
		// Apply some inputs
		a = 32'h0000000F;
		b = 32'h000000F0;
		control = 4'b0010;  // add
		mux = 0;
		// Wait for a clock cycle
		#50;
		// Print the outputs
		$display("a = %h",a);
		$display("b = %h",b);
		$display("control = %h",control);
		$display("result = %h", result);
		
		/* Test 2 */
		$display("******** sub ********");
		// Apply some inputs
		a = 52;
		b = 32;
		control = 4'b0110;  // sub
		mux = 0;
		// Wait for a clock cycle
		#50;
		// Print the outputs
		$display("a = %h",a);
		$display("b = %h",b);
		$display("control = %h",control);
		$display("result = %h", result);
		
		/* Test 3 */
		$display("******** and ********");
		// Apply some inputs
		a = 32'h0000F0F;
		b = 32'h0000F0F0;
		control = 4'b0000;  // and
		mux = 0;
		// Wait for a clock cycle
		#50;
		// Print the outputs
		$display("a = %h",a);
		$display("b = %h",b);
		$display("control = %h",control);
		$display("result = %h", result);
		
		/* Test 4 */
		$display("******** or ********");
		// Apply some inputs
		a = 32'h0000000F;
		b = 32'h000FFFF0;
		control = 4'b0001;  // or
		mux = 0;
		// Wait for a clock cycle
		#50;
		// Print the outputs
		$display("a = %h",a);
		$display("b = %h",b);
		$display("control = %h",control);
		$display("result = %h", result);
		
		/* Test 5 */
		$display("******** beq (sub) ********");
		// Apply some inputs
		a = 32'h0000000F;
		b = 32'h0000000F;
		control = 4'b0110;  // sub
		mux = 0;
		// Wait for a clock cycle
		#50;
		// Print the outputs
		$display("a = %h",a);
		$display("b = %h",b);
		$display("control = %h",control);
		$display("result = %h", result);
		$display("zero = %h", zero);
		
		/* Test 6 */
		$display("******** not beq (sub) ********");
		// Apply some inputs
		a = 32'h0000032F;
		b = 32'h0000000F;
		control = 4'b0010;	// add
		mux = 1;					// read from immGen
		// Wait for a clock cycle
		#50;
		// Print the outputs
		$display("a = %h", a);
		$display("b = %h", b);
		$display("control = %h", control);
		$display("mux = %h", mux);
		$display("immGen = %h", immGen);
		$display("result = %h", result);
		$display("zero = %h", zero);
		
		/* Test 7 */
		$display("******** lw/sw (add) ********");
		// Apply some inputs
		a = 32'h0000000F;
		b = 32'h0000000F;
		control = 4'b0010;	// add
		mux = 1;					// read from immGen
		// Wait for a clock cycle
		#50;
		// Print the outputs
		$display("a = %h", a);
		$display("b = %h", b);
		$display("control = %h", control);
		$display("mux = %h", mux);
		$display("immGen = %h", immGen);
		$display("result = %h", result);
		$display("zero = %h", zero);
		

		
	
	end
endmodule