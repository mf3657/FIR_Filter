`timescale 1ns/1ps

module TOP (
    input wire clk_10khz,    // Slow clock for high-level operations
    input wire clk_1mhz,     // Fast clock for FIR filtering
    input wire rst,          // System reset
    input wire xload,        // Load input data to memory
    input wire cload,        // Load coefficients to memory
    input wire wr_en,        // FIFO write enable
    input wire rd_en,        // FIFO read enable
    input wire [15:0] xin,   // Input data
    input wire [15:0] cin,   // Coefficient data
    output wire [31:0] y,    // Filtered output
    output wire valid        // Output valid signal
);

    // Intermediate signals
    wire [15:0] xCurr, coeffCurr;
    wire [15:0] fifo_out;
    wire fifo_empty, fifo_full;
    wire mac_tick;
    reg [5:0] imem_write_addr_counter; // Counter for IMEM writes
    reg [5:0] imem_read_addr_counter;  // Counter for IMEM reads (processing)
    reg [5:0] cmem_addr_counter;       // Counter for CMEM writes/reads
    reg imem_wr_en, imem_cen;
    reg cmem_wr_en, cmem_cen;
    reg processing; // Indicates whether filtering is in progress

    // FIFO instantiation
    FIFO fifo (
        .clk_wr(clk_10khz),
        .clk_rd(clk_10khz),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .rst(rst),
        .wr_data(xin),
        .full(fifo_full),
        .empty(fifo_empty),
        .rd_data(fifo_out)
    );

    // Memory module instantiation
    MEM_top mem (
        .clk(clk_1mhz),
        .xload(xload),
        .cload(cload),
        .caddr(cmem_addr_counter),
        .xaddr(processing ? imem_read_addr_counter : imem_write_addr_counter),
        .cin(cin),
        .xin(fifo_out),
        .xCurr(xCurr),
        .coeffCurr(coeffCurr)
    );

    // MAC instantiation
    MAC mac (
        .x(xCurr),
        .coeff(coeffCurr),
        .clk(clk_1mhz),
        .rst(rst),
        .y(y),
        .tick(mac_tick)
    );

    // Output valid signal is generated when processing completes
    assign valid = processing && mac_tick;

    // IMEM write control logic (clk_10khz)
    always @(posedge clk_10khz or posedge rst) begin
        if (rst) begin
            imem_write_addr_counter <= 6'b0;
            imem_wr_en <= 1'b1;  // Disable writes (active low)
            imem_cen <= 1'b1;   // Disable chip (active low)
        end else if (xload && !fifo_empty) begin
            imem_wr_en <= 1'b0;  // Enable writes (active low)
            imem_cen <= 1'b0;   // Enable chip (active low)
            imem_write_addr_counter <= (imem_write_addr_counter == 6'd63) ? 6'b0 : imem_write_addr_counter + 1; // Circular addressing
        end else begin
            imem_wr_en <= 1'b1;  // Disable writes
            imem_cen <= 1'b1;   // Disable chip
        end
    end

    // CMEM control logic (clk_10khz for writing, clk_1mhz for reading during processing)
    always @(posedge clk_10khz or posedge clk_1mhz or posedge rst) begin
        if (rst) begin
            cmem_addr_counter <= 6'b0;
            cmem_wr_en <= 1'b1;  // Disable writes (active low)
            cmem_cen <= 1'b1;   // Disable chip (active low)
        end else if (cload) begin
            cmem_wr_en <= 1'b0;  // Enable writes (active low)
            cmem_cen <= 1'b0;   // Enable chip (active low)
            cmem_addr_counter <= (cmem_addr_counter == 6'd63) ? 6'b0 : cmem_addr_counter + 1;
        end else if (processing) begin
            cmem_wr_en <= 1'b1;  // Disable writes
            cmem_cen <= 1'b0;   // Enable chip for reads
            cmem_addr_counter <= cmem_addr_counter + 1; // Increment during processing
        end else begin
            cmem_wr_en <= 1'b1;
            cmem_cen <= 1'b1;   // Disable chip
        end
    end

    // FIR filtering logic (clk_1mhz for processing)
    always @(posedge clk_1mhz or posedge rst) begin
        if (rst) begin
            processing <= 1'b0;
            imem_read_addr_counter <= imem_write_addr_counter; // Start from the last written address
        end else if (!xload && !cload && !processing) begin
            processing <= 1'b1; // Start processing when both memories are ready
        end else if (processing && mac_tick) begin
            imem_read_addr_counter <= (imem_read_addr_counter == 6'd63) ? 6'b0 : imem_read_addr_counter + 1; // Circular increment for IMEM
            if (cmem_addr_counter == 6'd63) begin
                processing <= 1'b0;         // Stop processing after completing one filtering operation
            end
        end
    end

endmodule

