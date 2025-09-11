/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 07-09-2025

Aim: Top Module Code for Lab 2 to perform the addition and run the module to drive the dual seven segment, based on the inputs from the dip switches sw6 on board, and a quad dip switch connected externally. 

*/

module lab2_as(input logic reset,
			   input logic [3:0] sw6,
			   input logic [3:0] extsw,
			   output logic enseg1,
			   output logic enseg2,
			   output logic [6:0] sevenseg,
			   output logic [4:0] leds);
				
				logic int_osc, clk_new;
				
				// Internal high-speed oscillator
				HSOSC #(.CLKHF_DIV(2'b01)) // This divides the 48 MHz internal clock into 24 MHz, as it divides the clock by 2^1
				hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
				
				four_bit_adder fba(sw6, extsw, leds);
				
				clock_divider cd(int_osc, reset, clk_new);
				
				drive_dual_sevenseg ddss(clk_new, reset, sw6, extsw, enseg1, enseg2, sevenseg);
				
endmodule

