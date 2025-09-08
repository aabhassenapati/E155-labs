
/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 07-09-2025

Aim: Testbench Code to test top module lab2_as and check if it correctly drives the leds, and seven segment display based on switches inputs in simulation. 

*/

`timescale 1ns/1ps

module lab1_as_tb();

   	logic clk;		   
	logic reset;
	logic [3:0] sw6;
	logic [3:0] extsw;
	logic enseg1;
	logic enseg2;
	logic [6:0] sevenseg;
	logic [4:0] leds)
	
 // generate clock
  always   
    begin
      clk = 1; #5; clk = 0; #5;
    end 
	
   
 // Reset sequence - active LOW reset
  initial begin 
        reset = 1'b1; #1;
        reset = 1'b0; #1;
        reset = 1'b1; #10;
		end
		
 // Test reset functionality for sevenseg
        reset = 1'b0; #10;

		
