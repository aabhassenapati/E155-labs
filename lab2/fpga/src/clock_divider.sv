/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 09-09-2025

Aim: Module Code for running the clock divider based on the input clock signal (24 MHz) to 240 Hz.

*/

module clock_divider(input logic clk, 
					 input logic reset, 
					 output logic clk_new);
					 
   logic [23:0] counter; 
   
   // Counter that divides the clock signal by 50000 to get 240Hz clock from 24MHz clock
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
   
 endmodule