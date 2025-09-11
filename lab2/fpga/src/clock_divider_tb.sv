/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 10-09-2025

Aim: Testbench Code to test clock_divider module and verify that the clock signal is modified appropriately.

*/

`timescale 1 ns / 1 ps

module clock_divider_tb();
	
	logic clk;
	logic reset;
	logic clk_new;
	
	// Error counter
	int error_count = 0;
	int total_tests = 0;

	// DUT instantiation
	clock_divider dut(clk, reset, clk_new);
	
	// Simple clock generation
	initial begin
		clk = 0;
		forever #1 clk = ~clk;
	end
	
	initial begin 
		$display("Starting clock_divider testbench...");
		
		// Reset sequence - active LOW reset
		reset = 1'b1; #1;
		reset = 1'b0; #1;
		reset = 1'b1; #10;
		
		// Test reset functionality for sevenseg
		total_tests++;
		reset = 1'b0; #10;
		assert(clk_new==0) begin
			$display("PASS: Clock Divider correctly reset");
		end else begin
			$display("ERROR: Clock Divider not properly reset");
			error_count++;
		end
		
		reset = 1'b1; 
			
		// runs the clock (for 50,000 * 2 cycles) before checking the new clock signal + small offset in signal update
		#100010;
		total_tests++;	
		assert(clk_new == 1) begin
			$display("PASS: Clock_new signal correctly toggles to high");
		end else begin
			$display("ERROR: Clock_new signal does not correctly toggle to high");
			error_count++;
		end

		#100010;
		total_tests++;	
		assert(clk_new == 0) begin
			$display("PASS: Clock_new signal correctly toggles to low");
		end else begin
			$display("ERROR: Clock_new signal does not correctly toggle to low");
			error_count++;
		end
	
	// Final error count
		$display("\nclock_divider testbench completed!");
		$display("Total Tests: %0d", total_tests);
		$display("Total Errors: %0d", error_count);
		if(error_count == 0) 
			$display("All tests PASSED!");
		else 
			$display("%0d test(s) FAILED", error_count);
		
		$finish;
	end	
endmodule    