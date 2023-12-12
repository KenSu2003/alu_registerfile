module regFile_tb();
	reg clk;
	reg [4:0] rs1, rs2, rd;
	reg [31:0] data;
	reg regWrite;
	wire [31:0] rv1, rv2;
	
	
	// Instantiate the modules
	regFile dut(clk, regWrite, rs1, rs2, rd, data, rv1, rv2);
	
	initial begin 
		clk = 0;
		forever #10 clk=~clk;
	end
		
	initial begin
		
		/* Test 1 */
		$display("********** Write data to x6 **********");
		rs1 = 5;
		rs2 = 6;
		rd = 6;
		data = 56;
		regWrite = 1;
		#30;
		$display("regWrite = %h", regWrite);
		$display("rd = x%h , writeData = %h", rd , data);
		$display("x%h = %h", rs1, rv1);
		$display("x%h = %h", rs2, rv2);
		
		/* Test 2 */
		$display("********** Write data to x5 **********");
		rs1 = 5;
		rs2 = 6;
		rd = 5;
		data = 28;
		regWrite = 1;
		#30;
		$display("regWrite = %h", regWrite);
		$display("rd = x%h , writeData = %h", rd , data);
		$display("x%h = %h", rs1, rv1);
		$display("x%h = %h", rs2, rv2);
		
		/* Test 3 */
		$display("********** Don't write data to x5 **********");
		rs1 = 5;
		rs2 = 6;
		rd = 5;
		data = 34;
		regWrite = 0;
		#30;
		$display("regWrite = %h", regWrite);
		$display("rd = x%h , writeData = %h", rd , data);
		$display("x%h = %h", rs1, rv1);
		$display("x%h = %h", rs2, rv2);
		
		/* Test 4 */
		$display("********** Write to 0, should not change **********");
		rs1 = 0;
		rs2 = 6;
		rd = 0;
		data = 34;
		regWrite = 1;
		#30;
		$display("regWrite = %h", regWrite);
		$display("rd = x%h , writeData = %h", rd , data);
		$display("x%h = %h", rs1, rv1);
		$display("x%h = %h", rs2, rv2);
		
		
	end
endmodule