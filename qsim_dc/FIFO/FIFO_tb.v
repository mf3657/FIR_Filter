`timescale 1ns/1ps
module FIFO_tb;

    reg clk_wr = 0;
    reg clk_rd = 0;
    reg rst = 0;

    reg [15:0] wr_data;
    reg wr_en;
    wire full;
    wire [15:0] rd_data;
    reg rd_en;
    wire empty;

    FIFO uut0 (
        .clk_wr(clk_wr),
        .clk_rd(clk_rd),
        .rst(rst),
        .wr_data(wr_data),
        .wr_en(wr_en),
        .full(full),
        .rd_data(rd_data),
        .rd_en(rd_en),
        .empty(empty)
    );

    always #50000 clk_wr = ~clk_wr; // 10 kHz

    always #500 clk_rd = ~clk_rd;  // 1 MHz

    initial begin
        wr_data = 0;
        wr_en = 0;
        rd_en = 0;
		$dumpfile("./FIFO.vcd");
		$dumpvars(0,FIFO_tb.uut0);
        rst = 1;
        #200;
        rst = 0;

        repeat (5) begin
            @(posedge clk_wr);
            if (!full) begin
                wr_data = wr_data + 1;
                wr_en = 1;
            end else begin
                wr_en = 0;
            end

            @(posedge clk_rd);
            if (!empty) begin
                rd_en = 1;
            end else begin
                rd_en = 0;
            end
        end

        @(posedge clk_wr);
        wr_en = 0;
        @(posedge clk_rd);
        rd_en = 0;

        #2000;
		$dumpall;
		$dumpflush;
        $finish;
    end

    initial begin
        $monitor("Time = %0t | wr_data = %0d | wr_en = %0b | rd_data = %0d | rd_en = %0b | full = %0b | empty = %0b",
                 $time, wr_data, wr_en, rd_data, rd_en, full, empty);
    end

endmodule

