/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 07-09-2025

Aim: Module Code for driving the dual seven segment display, based on the inputs from the dip switches sw6 on board, and a quad dip switch connected externally, to show the two input hexadecimal numbers from 0-F.

*/

module drive_sevenseg( input logic clk,
					   input logic reset,
					   input logic [3:0] sw6,
					   input logic [3:0] extsw,
					   output logic enseg1,
					   output logic enseg2,
					   output logic [6:0] sevenseg);
					   
   logic clk_new;
   logic [23:0] counter; 
   
   // Counter that divides the clock signal by 50000 to get 240 Hz led blinking from 24MHz clock
   always_ff @(posedge clk, negedge reset) begin
     if(reset == 0) begin
		counter <= 0;
		clk_new <= 0;
	 end
	 else if (counter >= 'd50000) begin
		 clk_new <= ~clk_new;
		 counter <= 0;
	 end
     else begin 
		counter <= counter + 1;
	 end
   end
   
// leds work on inverted logic where the corresponding segnment of led turns on when its pulled down to ground, ie active low;

  assign enseg1 = reset?(clk_new?1:0):1; 
  assign enseg2 = reset?(clk_new?0:1):1; 
  
  always_comb begin
	case(clk_new?sw6:extsw)
		4'h0: sevenseg = 7'b1000000; // 0
		4'h1: sevenseg = 7'b1111001; // 1
		4'h2: sevenseg = 7'b0100100; // 2
		4'h3: sevenseg = 7'b0110000; // 3
		4'h4: sevenseg = 7'b0011001; // 4
		4'h5: sevenseg = 7'b0010010; // 5
		4'h6: sevenseg = 7'b0000010; // 6
		4'h7: sevenseg = 7'b1111000; // 7
		4'h8: sevenseg = 7'b0000000; // 8
		4'h9: sevenseg = 7'b0011000; // 9
		4'ha: sevenseg = 7'b0001000; // A
		4'hb: sevenseg = 7'b0000011; // b
		4'hc: sevenseg = 7'b1000110; // C
		4'hd: sevenseg = 7'b0100001; // d
		4'he: sevenseg = 7'b0000110; // E
		4'hf: sevenseg = 7'b0001110; // F
	 default: sevenseg = 7'b1111111; // All off
	endcase
  end
endmodule