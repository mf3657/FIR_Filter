module FIFO
	(
		input wire clk_wr, clk_rd, wr_en, rd_en, rst,
		input wire [15:0] wr_data,
		output wire full, empty,
		output wire [15:0] rd_data
	);

	reg [15:0] FIFO_MEM[3:0];
	reg [1:0] wr_ptr = 0;
	reg [1:0] rd_ptr = 0;
	reg [2:0] FIFO_COUNT = 0;

always @ (posedge clk_wr or posedge clk_rd or posedge rst) begin
	if (rst) begin
		wr_ptr <= 0;
	end
	else if ( wr_en && ~full ) begin
		FIFO_MEM[wr_ptr] <= wr_data;
		wr_ptr <= (wr_ptr + 1) % 4;
	end
end

always @ ( posedge clk_rd or posedge rst ) begin
	if (rst) begin
		rd_ptr <= 0;
	end
	else if ( rd_en && ~empty ) begin
		rd_ptr <= (rd_ptr + 1) % 4;
	end
end

always @ ( posedge clk_wr or posedge clk_rd or posedge rst ) begin
	if (rst) begin
		FIFO_COUNT <= 1;
	end
	else begin
		case ({wr_en && ~full, rd_en && ~empty})
			2'b01: FIFO_COUNT <= FIFO_COUNT - 1;
			2'b10: FIFO_COUNT <= FIFO_COUNT + 1;
			default: FIFO_COUNT <= FIFO_COUNT;
		endcase
	end
end

	assign full = ( FIFO_COUNT == 4 );
	assign empty = ( FIFO_COUNT == 0 );
	assign rd_data = FIFO_MEM[rd_ptr];

endmodule
