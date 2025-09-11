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
				
				// leds work on inverted logic where the corresponding segnment of led turns on when its pulled down to ground, ie active low;
				// Enables segment 2 on the when clock is high, and segment 1 when clock is low
				assign enseg1 = reset?(clk_new?1:0):1; 
				assign enseg2 = reset?(clk_new?0:1):1; 
				
				drive_dual_sevenseg ddss(clk_new, sw6, extsw, sevenseg);
				
endmodule

