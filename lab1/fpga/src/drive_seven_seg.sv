/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 02-09-2025

Aim: Module Code for seven segment display, controlled by sw6 dip switch inputs to show hexadecimal numbers from 0-F.

*/

module drive_seven_seg(input logic [3:0] switch, 
						 output logic [6:0] seven_seg);

// leds work on inverted logic where the corresponding segnment of led turns on when its pulled down to ground, ie active low.
  always_comb 
	case(switch)
		4'h0: seven_seg = 7'b1000000; // 0
		4'h1: seven_seg = 7'b1111001; // 1
		4'h2: seven_seg = 7'b0100100; // 2
		4'h3: seven_seg = 7'b0110000; // 3
		4'h4: seven_seg = 7'b0011001; // 4
		4'h5: seven_seg = 7'b0010010; // 5
		4'h6: seven_seg = 7'b0000010; // 6
		4'h7: seven_seg = 7'b1111000; // 7
		4'h8: seven_seg = 7'b0000000; // 8
		4'h9: seven_seg = 7'b0011000; // 9
		4'ha: seven_seg = 7'b0001000; // A
		4'hb: seven_seg = 7'b0000011; // b
		4'hc: seven_seg = 7'b1000110; // C
		4'hd: seven_seg = 7'b0100001; // d
		4'he: seven_seg = 7'b0000110; // E
		4'hf: seven_seg = 7'b0001110; // F
	 default: seven_seg = 7'b1111111; // All off
	endcase
endmodule