module FIFO (
    input wire clk_wr, clk_rd, wr_en, rd_en, rst,
    input wire [15:0] wr_data,
    output wire full, empty,
    output wire [15:0] rd_data
);

    reg [15:0] FIFO_MEM [3:0];
    reg [1:0] wr_ptr, rd_ptr; // pointers
    reg [2:0] count; // num elements 

    // Write logic
    always @ (posedge clk_wr or posedge rst) begin
        if (rst) begin
            wr_ptr <= 0;
            count <= 0;
			FIFO_MEM[0] <= 0;
			FIFO_MEM[1] <= 0;
			FIFO_MEM[2] <= 0;
			FIFO_MEM[3] <= 0;
        end else if (wr_en && ~full) begin
            FIFO_MEM[wr_ptr] <= wr_data;
            wr_ptr <= wr_ptr + 1;
            count <= count + 1; 
        end
    end

    // Read logic
    always @ (posedge clk_rd or posedge rst) begin
        if (rst) begin
            rd_ptr <= 0;
        end else if (rd_en && ~empty) begin
            rd_ptr <= rd_ptr + 1; // Increment read pointer
        end
    end

    // Full and Empty Flags
    assign full = (count == 4); 
    assign empty = (count == 0);
    assign rd_data = FIFO_MEM[rd_ptr];

endmodule

