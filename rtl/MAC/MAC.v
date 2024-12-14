module MAC
    (
        input wire [15:0] x,
        input wire [15:0] coeff,
        input wire clk,
        input wire rst,
        output reg [31:0] y,
        output reg tick
    );

reg signed [31:0] accum;
reg [15:0] X;
reg [15:0] COEFF;
reg [5:0] counter;


always @ (posedge clk)
    begin
	if(rst)
	    begin
            	accum = 32'b0;
            	X = 16'b0;
            	COEFF = 16'b0;
            	counter = 6'b0;
		y <= 32'b0;
		tick <= 1'b0;
	    end
	
	else begin
        tick <= 1'b0;
        X = x;
        COEFF = coeff;
        accum = accum + ($signed(X) * $signed(COEFF));
        counter = counter + 1'b1;

        if(counter == 6'b0)
            begin
                counter = 6'b0;
                y <= accum;
                tick <= 1'b1;
		accum = 32'b0;
            end
	end

    end

endmodule
