`timescale 1ns/1ps
`define SD #0.010
`define HALF_CLOCK_PERIOD #5
`define QSIM_OUT_FN "./qsim.out"

module MAC_TB();

reg clk;
reg reset;

reg [15:0] xVals [0:63];
reg [15:0] currX;
reg [15:0] coeffVals [0:63];
reg [15:0] currCoeff;
reg [5:0]  address;
wire [31:0] y;
wire mac_tick;

MAC uut0 (.x(currX), .coeff(currCoeff), .clk(clk), .rst(reset), .y(y), .tick(mac_tick));


initial
    begin
        currX = 16'b0;
        currCoeff = 16'b0;
	address = 6'b0;
	$readmemb("xVals.txt", xVals);
	$readmemb("coeffVals.txt", coeffVals);
	$dumpfile("./MAC.vcd");
        $dumpvars(0,MAC_TB.uut0);
        reset = 1'b1;
        #16;
        reset = 1'b0;	
    end


always
    begin
	clk = 1'b1;
	#5;
	clk = 1'b0;
	#5;
    end

always @ (negedge clk)
    begin
        if(mac_tick)begin
	    $dumpall;
            $dumpflush;
            $finish;
	end
	if (~reset) begin
	    if ( address < 63 ) begin
		address <= address + 1;
	    end
	end

    end

always @ (address)
    begin
	currX = xVals[address];
	currCoeff = coeffVals[address];
    end


endmodule
