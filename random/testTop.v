module Top_Module(
    input wire clk_10kHz,
    input wire clk_1MHz,
    input wire reset,
    output wire [31:0] mac_output
);

    // Internal Signals
    wire [15:0] xCurr, coeffCurr;
    reg [15:0] xin, cin;
    reg [5:0] xaddr, caddr;
    reg xload, cload;

    wire [15:0] fifo_data_out;
    wire fifo_empty;
    reg fifo_read_enable;

    wire mac_tick;
    reg [15:0] mac_x, mac_coeff;

    // Instantiate MEM_top
    MEM_top mem_inst (
        .clk(clk_10kHz),
        .xload(xload),
        .cload(cload),
        .caddr(caddr),
        .xaddr(xaddr),
        .cin(cin),
        .xin(xin),
        .xCurr(xCurr),
        .coeffCurr(coeffCurr)
    );

    // Instantiate FIFO
    FIFO fifo_inst (
        .clk_wr(clk_10kHz),
        .clk_rd(clk_1MHz),
        .wr_en(xload),
        .rd_en(fifo_read_enable),
        .rst(reset),
        .wr_data(xCurr),
        .rd_data(fifo_data_out),
        .full(),
        .empty(fifo_empty)
    );

    // Instantiate MAC
    MAC mac_inst (
        .x(mac_x),
        .coeff(mac_coeff),
        .clk(clk_1MHz),
        .rst(reset),
        .y(mac_output),
        .tick(mac_tick)
    );

    // Control Logic
    always @(posedge clk_10kHz or posedge reset) begin
        if (reset) begin
            xaddr <= 0;
            caddr <= 0;
            xin <= 0;
            cin <= 0;
            xload <= 0;
            cload <= 1;
        end else begin
            if (cload) begin
                cin <= caddr; // Example coefficient data
                caddr <= caddr + 1;
                if (caddr == 63) begin
                    cload <= 0;
                    xload <= 1;
                end
            end else if (xload) begin
                xin <= xaddr; // Example input data
                xaddr <= xaddr + 1;
                if (xaddr == 63) xload <= 0;
            end
        end
    end

    always @(posedge clk_1MHz or posedge reset) begin
        if (reset) begin
            mac_x <= 0;
            mac_coeff <= 0;
            fifo_read_enable <= 0;
        end else begin
            if (!fifo_empty) begin
                fifo_read_enable <= 1;
                mac_x <= fifo_data_out;
                mac_coeff <= coeffCurr;
            end else begin
                fifo_read_enable <= 0;
            end
        end
    end

endmodule
