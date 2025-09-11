/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 10-09-2025

Aim: Module Code for adding two 4 bit binary inputs and give a 5 bit binary output

*/

module four_bit_adder(input logic [3:0] in1,
					  input logic [3:0] in2,
					  output logic [4:0] sum); 
					  
   //adds two four bit inputs to give 5 bit output of the sum.
   assign sum = in1 + in2;
   
endmodule