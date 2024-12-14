`timescale 1ns/1ps
module MEM_top
	(
		input wire clk, xload, cload,
		input wire [5:0] caddr, // Memory address for coefficients
		input wire [5:0] xaddr,
		input wire [15:0] cin, //coefficient loading
		input wire [15:0] xin,
		output wire [15:0] xCurr, coeffCurr
	);

reg imem_cen, cmem_cen;
reg imem_wen, cmem_wen;


IMEM IMEM (.CLK(clk), .WEN(imem_wen), .CEN(imem_cen), .A(xaddr), .D(xin), .Q(xCurr));
CMEM CMEM (.CLK(clk), .WEN(cmem_wen), .CEN(cmem_cen), .A(caddr), .D(cin), .Q(coeffCurr));


always @ (clk) begin
	if ( ~cload ) begin
		imem_cen <= 1'b0;
		cmem_cen <= 1'b0;
		imem_wen <= 1'b1;
		cmem_wen <= 1'b1;
	end
	//if ( ~cload & ~clk ) begin
	//	imem_cen <= 1'b1;
	//	cmem_cen <= 1'b1;	
	//end



	if ( xload ) begin
		imem_wen <= 1'b0;
		imem_cen <= 1'b0;
		cmem_wen <= 1'b1;
	end
	//if ( xload & ~clk) begin
	//	imem_wen <= 1'b1;
	//	imem_cen <= 1'b1;
	//end



	if ( cload ) begin
		imem_cen <= 1'b0;
		cmem_cen <= 1'b0;
		imem_wen <= 1'b0;
		cmem_wen <= 1'b0;
	end
	//if ( cload & ~clk) begin
	//	imem_cen <= 1'b1;
	//	cmem_cen <= 1'b1;
	//	imem_wen <= 1'b1;
	//	cmem_wen <= 1'b1;
	//end
end


endmodule
