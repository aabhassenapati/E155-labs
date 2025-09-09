/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 07-09-2025

Aim: Testbench Code to test drive_sevenseg module and verify seven segment display patterns and enable signals.

*/

`timescale 1ns/1ps

module drive_sevenseg_tb();

	logic clk;
	logic reset;
	logic [3:0] sw6;
	logic [3:0] extsw;
	logic enseg1;
	logic enseg2;
	logic [6:0] sevenseg;
	
	// Error counter
	int error_count = 0;
	int total_tests = 0;
	
	// Expected seven segment patterns for hex digits 0-F
	logic [6:0] expected_sevenseg [16] = '{
		7'b1000000, // 0
		7'b1111001, // 1
		7'b0100100, // 2
		7'b0110000, // 3
		7'b0011001, // 4
		7'b0010010, // 5
		7'b0000010, // 6
		7'b1111000, // 7
		7'b0000000, // 8
		7'b0011000, // 9
		7'b0001000, // A
		7'b0000011, // b
		7'b1000110, // C
		7'b0100001, // d
		7'b0000110, // E
		7'b0001110  // F
	};

// DUT instantiation
drive_sevenseg dut(clk, reset, sw6, extsw, enseg1, enseg2, sevenseg);

// Simple clock generation
initial begin
	clk = 0;
	forever #1 clk = ~clk;
end

initial begin 
	$display("Starting drive_sevenseg testbench...");
	
	// Reset sequence - active LOW reset
	reset = 1'b1; #1;
	reset = 1'b0; #1;
	reset = 1'b1; #10;

	// Test reset functionality
	reset = 1'b0; #10;
	total_tests++;
	if(enseg1 == 1 && enseg2 == 1) begin
		$display("PASS: Seven segment displays disabled during reset");
	end else begin
		$display("ERROR: Seven segment displays not properly disabled during reset");
		error_count++;
	end
	reset = 1'b1; #10;

	// Test all combinations of sw6 and extsw (16 x 16 = 256 test cases)
	for(int i = 0; i < 16; i++) begin
		for(int j = 0; j < 16; j++) begin
			sw6 = i[3:0];
			extsw = j[3:0];
			
			#1000; // Wait for multiple clock cycles
			
			// Sample seven segment display during both phases
			// Wait for enseg1 to be active (displaying extsw)
			wait(enseg1 == 0 && enseg2 == 1);
			#1000; // Small delay to ensure stable output
			total_tests++;
			if(sevenseg == expected_sevenseg[extsw]) begin
				$display("PASS: extsw=%h displayed correctly on seg1", extsw);
			end else begin
				$display("ERROR: extsw=%h on seg1, got pattern=%b, expected=%b", 
					extsw, sevenseg, expected_sevenseg[extsw]);
				error_count++;
			end
			
			// Wait for enseg2 to be active (displaying sw6)
			wait(enseg1 == 1 && enseg2 == 0);
			#1000; // Small delay to ensure stable output
			total_tests++;
			if(sevenseg == expected_sevenseg[sw6]) begin
				$display("PASS: sw6=%h displayed correctly on seg2", sw6);
			end else begin
				$display("ERROR: sw6=%h on seg2, got pattern=%b, expected=%b", 
					sw6, sevenseg, expected_sevenseg[sw6]);
				error_count++;
			end
		end
	end
	
	// Final error count
	$display("\nDrive_sevenseg testbench completed!");
	$display("Total Tests: %0d", total_tests);
	$display("Total Errors: %0d", error_count);
	if(error_count == 0) 
		$display("All tests PASSED!");
	else 
		$display("%0d test(s) FAILED", error_count);
	
	$finish;
end

endmodule