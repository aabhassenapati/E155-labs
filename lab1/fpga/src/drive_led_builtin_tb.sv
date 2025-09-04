
/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 03-09-2025

Aim: Testbench Code to module drive_led_builtin and check if it correctly drives built-in leds based on switches inputs in simulation. 

*/

`timescale 1ns/1ps

module testbench_drive_led_builtin();
    logic clk, reset;
    logic [3:0] switch;
    logic [2:0] led_builtin;
    
    
    // DUT instantiation
    drive_led_builtin dut(.clk(clk), .reset(reset), .switch(switch), .led_builtin(led_builtin));
    
    initial begin
        // Reset sequence - active LOW reset
        reset = 1'b1; #1;
        reset = 1'b0; #1;
        reset = 1'b1; #10;
        
        // Test cases - checking led_builtin[1:0] only (ignoring led_builtin[2])
        switch = 4'h0; #10;
        if (led_builtin[1:0] !== 2'b00) $display("Error at switch=0");
        else $display("Success at switch=0");
        
        switch = 4'h1; #10;
        if (led_builtin[1:0] !== 2'b01) $display("Error at switch=1");
        else $display("Success at switch=1");
        
        switch = 4'h2; #10;
        if (led_builtin[1:0] !== 2'b01) $display("Error at switch=2");
        else $display("Success at switch=2");
        
        switch = 4'h3; #10;
        if (led_builtin[1:0] !== 2'b00) $display("Error at switch=3");
        else $display("Success at switch=3");
        
        switch = 4'h4; #10;
        if (led_builtin[1:0] !== 2'b00) $display("Error at switch=4");
        else $display("Success at switch=4");
        
        switch = 4'h5; #10;
        if (led_builtin[1:0] !== 2'b01) $display("Error at switch=5");
        else $display("Success at switch=5");
        
        switch = 4'h6; #10;
        if (led_builtin[1:0] !== 2'b01) $display("Error at switch=6");
        else $display("Success at switch=6");
        
        switch = 4'h7; #10;
        if (led_builtin[1:0] !== 2'b00) $display("Error at switch=7");
        else $display("Success at switch=7");
        
        switch = 4'h8; #10;
        if (led_builtin[1:0] !== 2'b00) $display("Error at switch=8");
        else $display("Success at switch=8");
        
        switch = 4'h9; #10;
        if (led_builtin[1:0] !== 2'b01) $display("Error at switch=9");
        else $display("Success at switch=9");
        
        switch = 4'hA; #10;
        if (led_builtin[1:0] !== 2'b01) $display("Error at switch=A");
        else $display("Success at switch=A");
        
        switch = 4'hB; #10;
        if (led_builtin[1:0] !== 2'b00) $display("Error at switch=B");
        else $display("Success at switch=B");
        
        switch = 4'hC; #10;
        if (led_builtin[1:0] !== 2'b10) $display("Error at switch=C");
        else $display("Success at switch=C");
        
        switch = 4'hD; #10;
        if (led_builtin[1:0] !== 2'b11) $display("Error at switch=D");
        else $display("Success at switch=D");
        
        switch = 4'hE; #10;
        if (led_builtin[1:0] !== 2'b11) $display("Error at switch=E");
        else $display("Success at switch=E");
        
        switch = 4'hF; #10;
        if (led_builtin[1:0] !== 2'b10) $display("Error at switch=F");
        else $display("Success at switch=F");
        
        $finish;
    end
endmodule