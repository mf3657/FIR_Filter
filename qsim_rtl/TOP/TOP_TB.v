`timescale 1ns/1ps

module TOP_TB;

    // Testbench signals
    reg clk_10khz;
    reg clk_1mhz;
    reg rst;
    reg xload;
    reg cload;
    reg wr_en;
    reg rd_en;
    reg [15:0] xin;
    reg [15:0] cin;
    wire [31:0] y;
    wire valid;

    // Instantiate FIR_Top
    TOP uut0 (
        .clk_10khz(clk_10khz),
        .clk_1mhz(clk_1mhz),
        .rst(rst),
        .xload(xload),
        .cload(cload),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .xin(xin),
        .cin(cin),
        .y(y),
        .valid(valid)
    );

    // Clock generation
    initial begin
        clk_10khz = 0;
        forever #50 clk_10khz = ~clk_10khz; // 10kHz clock
    end

    initial begin
        clk_1mhz = 0;
        forever #0.5 clk_1mhz = ~clk_1mhz; // 1MHz clock
    end

    // Input data
    integer i;
    reg [15:0] coefficients [63:0];
    reg [15:0] data_inputs [127:0];

    initial begin
        // Read coefficients from file
        $readmemb("coeffVals.txt", coefficients);
        // Read data inputs from file
        $readmemb("xVals.txt", data_inputs);
		$dumpvars(0, TOP_TB.uut0);
        // Reset
        rst = 1;
        xload = 0;
        cload = 0;
        wr_en = 0;
        rd_en = 0;
        xin = 16'd0;
        cin = 16'd0;

        #100 rst = 0;

        // Load coefficients into CMEM
        cload = 1;
        for (i = 0; i < 64; i = i + 1) begin
            cin = coefficients[i];
            #100; // Wait for one 10kHz clock cycle
        end
        cload = 0;

        // Load data into FIFO and IMEM
        xload = 1;
        for (i = 0; i < 128; i = i + 1) begin
            xin = data_inputs[i];
            wr_en = 1;
            #100; // Wait for one 10kHz clock cycle
            wr_en = 0;
        end
        xload = 0;

        // Start processing
        rd_en = 1;
        #6400; // Allow enough time for all processing
        rd_en = 0;

        // End simulation
        $finish;
    end

    // Monitor output
    initial begin
        $monitor($time, " Output y: %d, Valid: %b", y, valid);
    end

endmodule
