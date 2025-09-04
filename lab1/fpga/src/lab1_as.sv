/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 02-09-2025

Aim: Top Module Code for Lab 1 to run the built-in leds, and drive seven segment display using the dip switches sw6 on board. 

*/

module lab1_as (input logic reset,
				input logic [3:0] switch,
				output logic [2:0] led_builtin,
				output logic [6:0] seven_seg);
	logic int_osc;
				
	// Internal high-speed oscillator
		 HSOSC #(.CLKHF_DIV(2'b01)) // This divides the 48 MHz internal clock into 24 MHz, as it divides the clock by 2^1
         hf_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(int_osc));
		 
		 
	// Driving the led _builtin module
	drive_led_builtin leds(int_osc, reset, switch, led_builtin);	
	drive_seven_seg seven_seg_leds(switch, seven_seg);

endmodule 