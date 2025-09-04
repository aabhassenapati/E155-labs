/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 03-09-2025

Aim: Testbench Code to test top module lab1_as and check if it correctly drives built-in leds, and seven segment display based on switches inputs in simulation. 

*/


`timescale 1ns/1ps

module lab1_as_tb();
    logic clk, reset;
    logic [3:0] switch;
    logic [2:0] led_builtin;
    logic [6:0] seven_seg;
    
    // Clock generation (I  did not generated it like in E85 because led_builtin[2] is not being tested as its too slow at 2.4 Hz)

    // DUT instantiation
    lab1_as dut(.reset(reset), .switch(switch), .led_builtin(led_builtin), .seven_seg(seven_seg));
    
    initial begin
        // Reset sequence - active LOW reset
        reset = 1'b1; #1;
        reset = 1'b0; #1;
        reset = 1'b1; #10;
        
		// Test reset functionality for led_builtin[2]
        reset = 1'b0; #10;
        if (led_builtin[2] !== 1'b0) $display("Error: led_builtin[2] not reset");
        else $display("Success: led_builtin[2] reset correctly");
        reset = 1'b1; #10;
		
        // Test cases - checking seven_seg and led_builtin[1:0] based on switch conditions
        switch = 4'h0; #10;
        if ((led_builtin[1:0] !== 2'b00) || (seven_seg !== 7'b1000000)) $display("Error at switch=0");
        else $display("Success at switch=0");
        
        switch = 4'h1; #10;
        if ((led_builtin[1:0] !== 2'b01) || (seven_seg !== 7'b1111001)) $display("Error at switch=1");
        else $display("Success at switch=1");
        
        switch = 4'h2; #10;
        if ((led_builtin[1:0] !== 2'b01) || (seven_seg !== 7'b0100100)) $display("Error at switch=2");
        else $display("Success at switch=2");
        
        switch = 4'h3; #10;
        if ((led_builtin[1:0] !== 2'b00) || (seven_seg !== 7'b0110000)) $display("Error at switch=3");
        else $display("Success at switch=3");
        
        switch = 4'h4; #10;
        if ((led_builtin[1:0] !== 2'b00) || (seven_seg !== 7'b0011001)) $display("Error at switch=4");
        else $display("Success at switch=4");
        
        switch = 4'h5; #10;
        if ((led_builtin[1:0] !== 2'b01) || (seven_seg !== 7'b0010010)) $display("Error at switch=5");
        else $display("Success at switch=5");
        
        switch = 4'h6; #10;
        if ((led_builtin[1:0] !== 2'b01) || (seven_seg !== 7'b0000010)) $display("Error at switch=6");
        else $display("Success at switch=6");
        
        switch = 4'h7; #10;
        if ((led_builtin[1:0] !== 2'b00) || (seven_seg !== 7'b1111000)) $display("Error at switch=7");
        else $display("Success at switch=7");
        
        switch = 4'h8; #10;
        if ((led_builtin[1:0] !== 2'b00) || (seven_seg !== 7'b0000000)) $display("Error at switch=8");
        else $display("Success at switch=8");
        
        switch = 4'h9; #10;
        if ((led_builtin[1:0] !== 2'b01) || (seven_seg !== 7'b0011000)) $display("Error at switch=9");
        else $display("Success at switch=9");
        
        switch = 4'hA; #10;
        if ((led_builtin[1:0] !== 2'b01) || (seven_seg !== 7'b0001000)) $display("Error at switch=A");
        else $display("Success at switch=A");
        
        switch = 4'hB; #10;
        if ((led_builtin[1:0] !== 2'b00) || (seven_seg !== 7'b0000011)) $display("Error at switch=B");
        else $display("Success at switch=B");
        
        switch = 4'hC; #10;
        if ((led_builtin[1:0] !== 2'b10) || (seven_seg !== 7'b1000110)) $display("Error at switch=C");
        else $display("Success at switch=C");
        
        switch = 4'hD; #10;
        if ((led_builtin[1:0] !== 2'b11) || (seven_seg !== 7'b0100001)) $display("Error at switch=D");
        else $display("Success at switch=D");
        
        switch = 4'hE; #10;
        if ((led_builtin[1:0] !== 2'b11) || (seven_seg !== 7'b0000110)) $display("Error at switch=E");
        else $display("Success at switch=E");
        
        switch = 4'hF; #10;
        if ((led_builtin[1:0] !== 2'b10) || (seven_seg !== 7'b0001110)) $display("Error at switch=F");
        else $display("Success at switch=F");
        
        $finish;
    end
endmodule