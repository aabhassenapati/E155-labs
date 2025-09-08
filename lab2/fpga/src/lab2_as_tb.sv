
/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 07-09-2025

Aim: Testbench Code to test top module lab2_as and check if it correctly drives the leds, and seven segment display based on switches inputs in simulation. 

*/

`timescale 1ns/1ps

module lab1_as_tb();

   	logic clk_test;		   
	logic reset;
	logic [3:0] sw6;
	logic [3:0] extsw;
	logic enseg1;
	logic enseg2;
	logic [6:0] sevenseg;
	logic [4:0] leds;

// DUT instantiation
lab2_as dut(reset,sw6,extsw,enseg1,enseg2,sevenseg,leds);

assign clk_test = dut.int_osc;
  initial begin 
 // Reset sequence - active LOW reset
        reset = 1'b1; #1;
        reset = 1'b0; #1;
        reset = 1'b1; #10;
	
 // Test reset functionality for sevenseg
        reset = 1'b0; #10;
		assert(enseg1==0&&enseg2==0) $display("Error: leds not reset");
		reset = 1'b1; #10;
 
 // Test switch conditions
sw6 = 0; extsw =0; #10000
  if(enseg1 ==0) begin
	  assert(leds==0&& sevenseg==0);
		end
		$finish;
    end
endmodule
		

		
