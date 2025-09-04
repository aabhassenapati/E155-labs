// SystemVerilog LED Blinker for Lattice UP5K FPGA
// Uses internal high-speed oscillator to blink LED at 2 Hz

// Lattice UP5K Internal High-Frequency Oscillator primitive declaration
// This should normally be included from the Lattice library files
(* blackbox *)
module SB_HFOSC #(
    parameter CLKHF_DIV = "0b00"
) (
    input  CLKHFPU,
    input  CLKHFEN, 
    output CLKHF
);
endmodule

// Main LED blinker module
module ai_prototype (
    output logic led
);

    // Internal oscillator clock signal
    logic hf_clk;
    
    // Counter for frequency division (23 bits needed for 48MHz -> 2Hz)
    logic [22:0] counter = '0;
    
    // LED state register
    logic led_state = 1'b0;
    
    // Internal High-Frequency Oscillator instantiation
    // UP5K internal oscillator configuration:
    // CLKHF_DIV = "0b00" -> 48 MHz
    // CLKHF_DIV = "0b01" -> 24 MHz  
    // CLKHF_DIV = "0b10" -> 12 MHz
    // CLKHF_DIV = "0b11" -> 6 MHz
    SB_HFOSC #(
        .CLKHF_DIV("0b00")  // 48 MHz (no division)
    ) u_hfosc (
        .CLKHFPU(1'b1),     // Power up the oscillator
        .CLKHFEN(1'b1),     // Enable the oscillator
        .CLKHF(hf_clk)      // Output clock signal
    );
    
    // Counter and LED toggle logic
    // For 2 Hz blink: 48MHz / (2 * 2Hz) = 12,000,000 cycles per toggle
    always_ff @(posedge hf_clk) begin
        if (counter == 23'd11_999_999) begin
            counter <= '0;
            led_state <= ~led_state;
        end else begin
            counter <= counter + 1'b1;
        end
    end
    
    // Output assignment
    assign led = led_state;

endmodule

// Enhanced parametric version with better SystemVerilog features
module led_blinker_parametric #(
    parameter int CLOCK_FREQ_HZ = 48_000_000,  // Internal oscillator frequency
    parameter int BLINK_FREQ_HZ = 2,           // Desired blink frequency
    parameter string CLKHF_DIV = "0b00"        // Oscillator divider setting
) (
    output logic led
);

    // Calculate counter parameters
    localparam int TOGGLE_FREQ_HZ = 2 * BLINK_FREQ_HZ;
    localparam int COUNTER_MAX = (CLOCK_FREQ_HZ / TOGGLE_FREQ_HZ) - 1;
    localparam int COUNTER_WIDTH = $clog2(COUNTER_MAX + 1);
    
    logic hf_clk;
    logic [COUNTER_WIDTH-1:0] counter = '0;
    logic led_state = 1'b0;
    
    // Internal oscillator with parameterized divider
    SB_HFOSC #(
        .CLKHF_DIV(CLKHF_DIV)
    ) u_hfosc (
        .CLKHFPU(1'b1),
        .CLKHFEN(1'b1), 
        .CLKHF(hf_clk)
    );
    
    // Enhanced counter logic with SystemVerilog syntax
    always_ff @(posedge hf_clk) begin
        unique case (1'b1)
            (counter == COUNTER_MAX): begin
                counter <= '0;
                led_state <= ~led_state;
            end
            default: begin
                counter <= counter + 1'b1;
            end
        endcase
    end
    
    assign led = led_state;

endmodule

// Alternative implementation without using the primitive directly
// This uses a generic approach that works with any synthesizer
module led_blinker_generic (
    input  logic clk,    // External clock input
    input  logic rst_n,  // Active-low reset
    output logic led
);

    localparam int COUNTER_WIDTH = 23;
    localparam int COUNTER_MAX = 23'd11_999_999; // For 48MHz -> 2Hz blink
    
    logic [COUNTER_WIDTH-1:0] counter;
    logic led_reg;
    
    // Reset and counter logic
    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= '0;
            led_reg <= 1'b0;
        end else begin
            if (counter == COUNTER_MAX) begin
                counter <= '0;
                led_reg <= ~led_reg;
            end else begin
                counter <= counter + 1'b1;
            end
        end
    end
    
    assign led = led_reg;

endmodule

// Top-level module ready for synthesis
module top (
    output logic LED
);

    // Use the main LED blinker with internal oscillator
    led_blinker u_led_blinker (
        .led(LED)
    );

endmodule