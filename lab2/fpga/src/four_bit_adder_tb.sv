/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 10-09-2025

Aim: Testbench Code to test four_bit_adder module and verify that the adder works properly.

*/
`timescale 1 ns / 1 ps

module four_bit_adder_tb();
	
	logic [3:0] in1, in2;
	logic [4:0] out;
	
	// Error counter
	int error_count = 0;
	int total_tests = 0;
	
	// DUT instantiation
	four_bit_adder dut(in1, in2, out);
	initial begin
		// Test all combinations of in1 and in2 (16 x 16 = 256 test cases)
		for(int i = 0; i < 16; i++) begin
			for(int j = 0; j < 16; j++) begin
				in1 = i[3:0];
				in2 = j[3:0];
				#10;
				// Check sum
				total_tests++;
				assert(out == (in1 + in2)) begin
					$display("PASS: in1=%h, in2=%h, out=%h", in1, in2, out);
				end else begin
					$display("ERROR: in1=%h, in2=%h, out=%h (expected %h)", 
						in1, in2, out, in1+in2);
						error_count++;
				end
			end
		end
		// Final error count
		$display("\nfour_bit_adder testbench completed!");
		$display("Total Tests: %0d", total_tests);
		$display("Total Errors: %0d", error_count);
		if(error_count == 0) 
			$display("All tests PASSED!");
		else 
			$display("%0d test(s) FAILED", error_count);
		
		$finish;
		
	end
	
endmodule