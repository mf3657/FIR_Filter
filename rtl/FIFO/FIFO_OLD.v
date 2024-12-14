module FIFO
	(	input wire clk_wr, clk_rd, wr_en, rd_en, rst,
		input wire [15:0] wr_data,
		output wire full, empty,
		output wire [15:0] rd_data
	);

	reg [15:0] FIFO_MEM;
	reg FIFO_COUNT;
	
always @ ( posedge clk_wr or posedge clk_rd) begin
	if (rst) begin
		FIFO_COUNT <= 0;
		FIFO_MEM <= 0;
	end
//	else begin
//		case ({wr_en && ~full, rd_en && ~empty})
//			2'b01: FIFO_COUNT <= FIFO_COUNT - 1;
//			2'b10: begin
//					FIFO_COUNT <= FIFO_COUNT + 1;
//					FIFO_MEM <= wr_data;
//				   end
//			default: FIFO_COUNT <= FIFO_COUNT;
//		endcase
//	end

	if ( wr_en ) begin
		if ( ~full ) begin
			FIFO_COUNT <= FIFO_COUNT + 1;
			FIFO_MEM <= wr_data;
		end
	end
	if ( rd_en ) begin
		if ( ~empty ) begin
			FIFO_COUNT <= FIFO_COUNT - 1;
		end
	end
end

	assign full = ( FIFO_COUNT );
	assign empty = ( ~FIFO_COUNT );
	assign rd_data = FIFO_MEM;

endmodule
