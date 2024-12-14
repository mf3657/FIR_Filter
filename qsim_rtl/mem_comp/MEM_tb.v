`timescale 1ns/1ps

module MEM_tb();

reg max_tick;
reg readOut;

reg clk, clk2, xload, cload;
reg [15:0] coeffVals [63:0];
reg [15:0] currX, currCoeff;
reg [5:0] address;

wire [15:0] xOut, coeffOut;

MEM_top uut0 (.clk(clk), .xload(xload), .cload(cload), .caddr(address), .xaddr(address), .cin(currCoeff), .xin(currX), .xCurr(xOut), .coeffCurr(coeffOut));


initial begin
    currX = 16'b0;
    currCoeff = 16'b0;
    address = 6'b0;
	cload = 1'b0;
	xload = 1'b0;
	max_tick = 1'b0;
	readOut = 1'b0;
	clk = 1'b0;
	clk2 = 1'b0;
    $readmemb("coeffVals.txt", coeffVals);
    $dumpfile("./MEM_top.vcd");
    $dumpvars(0,MEM_tb.uut0);
	#1000;
	cload = 1'b1;   
end 


always
    begin
	clk2 = 1'b0;
	#250;
	clk = 1'b1;
	#250;
	clk2 = 1'b1;
	#250;
	clk = 1'b0;
	#250;
    end 

always @ (posedge clk2) begin
    
	if(max_tick)begin
        $dumpall;
        $dumpflush;
        $finish;
    end 
    if (cload | xload | readOut) begin
        if ( address < 63 ) begin
    	    address <= address + 1;
        end
		else begin
			address <= 6'b0;
			if (cload) begin
				cload <= 1'b0;
				xload <= 1'b1;
			end
			else if (xload) begin
				xload <= 1'b0;
				readOut <=1'b1;
			end
			else if (readOut) begin
				max_tick <= 1'b1;
			end	
		end
    end 
end


always @ (address) begin
	if(cload) begin
    	currCoeff <= coeffVals[address];
	end
	if(xload) begin
		currX <= address;
	end
end 


endmodule
