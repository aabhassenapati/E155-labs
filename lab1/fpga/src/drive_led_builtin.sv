/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 02-09-2025

Aim: Module Code for built-in leds, based on the functionality specified in Lab 1 instructions i.e led_builtin[2] should blink at 2.4 Hz, meanwhile led_builtin[0,1] depend on sw6 dip switch inputs.

*/

module drive_led_builtin(input logic clk,
						 input logic reset, 
						 input logic [3:0] switch, 
						 output logic [2:0] led_builtin);
	// Define Internal nodes
   logic led_state;
   logic [23:0] counter;
  
   // Counter that divides the clock signal by 5000000 to get 2.4Hz led blinking from 24MHz clock
   always_ff @(posedge clk) begin
     if(reset == 0) begin
		counter <= 0;
		led_state <= 0;
	 end
	 else if (counter >= 'd5000000) begin
		 led_state <= ~led_state;
		 counter <= 0;
	 end
     else begin 
		counter <= counter + 1;
	 end
   end
  
   // Assign LED output
   assign led_builtin[2] = led_state;
   
   assign led_builtin[1] = (switch[2] & switch[3]);
   
   assign led_builtin[0] = (switch[1] ^ switch[0]);
  
endmodule