/* 
Name: Aabhas Senapati
Email: asenapati@hmc.edu
Date: 03-09-2025

Aim: Testbench Code to test module drive_seven_seg and check if it correctly drives seven segment display based on switches inputs in simulation. 

*/

`timescale 1ns/1ps

module testbench_drive_seven_seg();
    logic [3:0] switch;
    logic [6:0] seven_seg;
    
    // DUT instantiation
    drive_seven_seg dut(.switch(switch), .seven_seg(seven_seg));
    
    initial begin
        // Test all switch combinations
        switch = 4'h0; #10;
        if (seven_seg !== 7'b1000000) $display("Error at switch=0");
        else $display("Success at switch=0");
        
        switch = 4'h1; #10;
        if (seven_seg !== 7'b1111001) $display("Error at switch=1");
        else $display("Success at switch=1");
        
        switch = 4'h2; #10;
        if (seven_seg !== 7'b0100100) $display("Error at switch=2");
        else $display("Success at switch=2");
        
        switch = 4'h3; #10;
        if (seven_seg !== 7'b0110000) $display("Error at switch=3");
        else $display("Success at switch=3");
        
        switch = 4'h4; #10;
        if (seven_seg !== 7'b0011001) $display("Error at switch=4");
        else $display("Success at switch=4");
        
        switch = 4'h5; #10;
        if (seven_seg !== 7'b0010010) $display("Error at switch=5");
        else $display("Success at switch=5");
        
        switch = 4'h6; #10;
        if (seven_seg !== 7'b0000010) $display("Error at switch=6");
        else $display("Success at switch=6");
        
        switch = 4'h7; #10;
        if (seven_seg !== 7'b1111000) $display("Error at switch=7");
        else $display("Success at switch=7");
        
        switch = 4'h8; #10;
        if (seven_seg !== 7'b0000000) $display("Error at switch=8");
        else $display("Success at switch=8");
        
        switch = 4'h9; #10;
        if (seven_seg !== 7'b0011000) $display("Error at switch=9");
        else $display("Success at switch=9");
        
        switch = 4'hA; #10;
        if (seven_seg !== 7'b0001000) $display("Error at switch=A");
        else $display("Success at switch=A");
        
        switch = 4'hB; #10;
        if (seven_seg !== 7'b0000011) $display("Error at switch=B");
        else $display("Success at switch=B");
        
        switch = 4'hC; #10;
        if (seven_seg !== 7'b1000110) $display("Error at switch=C");
        else $display("Success at switch=C");
        
        switch = 4'hD; #10;
        if (seven_seg !== 7'b0100001) $display("Error at switch=D");
        else $display("Success at switch=D");
        
        switch = 4'hE; #10;
        if (seven_seg !== 7'b0000110) $display("Error at switch=E");
        else $display("Success at switch=E");
        
        switch = 4'hF; #10;
        if (seven_seg !== 7'b0001110) $display("Error at switch=F");
        else $display("Success at switch=F");
        
        $finish;
    end
endmodule