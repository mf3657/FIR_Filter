`timescale 1ns / 1ps

module Top_Module_tb;

    // Clock and reset signals
    reg clk_10kHz;
    reg clk_1MHz;
    reg reset;

    // Outputs
    wire [15:0] mac_output;

    // Internal memory arrays for input values
    reg [15:0] cmem_values [0:63];
    reg [15:0] imem_values [0:63];

    // Instantiate the Top Module
    Top_Module uut (
        .clk_10kHz(clk_10kHz),
        .clk_1MHz(clk_1MHz),
        .reset(reset),
        .mac_output(mac_output)
    );

    // Clock generation
    initial begin
        clk_10kHz = 0;
        clk_1MHz = 0;
        forever begin
            #50000 clk_10kHz = ~clk_10kHz; // 10kHz clock
            #500 clk_1MHz = ~clk_1MHz;    // 1MHz clock
        end
    end

    // Reset logic
    initial begin
        reset = 1;
        #100; // Hold reset for 100 ns
        reset = 0;
    end

    // Monitor and display output
    initial begin
        $monitor($time, " MAC Output: %d", mac_output);
    end

    // Test stimulus
    initial begin
        // Wait for reset deassertion
        #200;

        // Wait for cmem filling
        #650000;

        // Allow MAC to start processing and monitor results
        repeat (128) begin
            @(posedge clk_1MHz);
        end

        // End simulation
        $finish;
    end

endmodule
