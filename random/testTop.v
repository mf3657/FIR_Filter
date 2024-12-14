module Top_Module(
    input wire clk_10kHz,
    input wire clk_1MHz,
    input wire reset,
    output wire [15:0] mac_output
);

    // Internal Signals
    reg [5:0] cmem_write_addr = 0;
    reg cmem_write_enable = 1;
    reg [15:0] cmem_data;
    reg [15:0] cmem_values [0:63]; // Array to hold cmem values loaded from file

    wire [15:0] imem_data_out;
    reg [5:0] imem_write_addr = 0;
    reg imem_write_enable = 0;
    reg [15:0] imem_data_in;
    reg [15:0] imem_values [0:63]; // Array to hold imem values loaded from file

    wire [15:0] fifo_data_out;
    wire fifo_empty;

    reg [5:0] mac_iterations = 0;
    reg mac_enable = 0;

    integer i;

    // File I/O for loading cmem and imem values
    initial begin
        $readmemb("coeffVals.txt", cmem_values); // Load cmem values from text file
        $readmemb("xVals.txt", imem_values); // Load imem values from text file
    end

    // Instance of MEM_top
    MEM_top mem (
        .clk(clk_10kHz),
        .reset(reset),
        .write_enable(cmem_write_enable),
        .write_addr(cmem_write_addr),
        .write_data(cmem_data),
        .imem_write_enable(imem_write_enable),
        .imem_write_addr(imem_write_addr),
        .imem_write_data(imem_data_in),
        .imem_read_data(imem_data_out)
    );

    // Instance of FIFO
    FIFO fifo (
        .clk(clk_10kHz),
        .reset(reset),
        .data_in(imem_data_out),
        .data_out(fifo_data_out),
        .empty(fifo_empty),
        .write_enable(imem_write_enable),
        .read_enable(mac_enable)
    );

    // Instance of MAC
    MAC mac (
        .clk(clk_1MHz),
        .reset(reset),
        .data_in(fifo_data_out),
        .output_ready(mac_enable),
        .result(mac_output)
    );

    // Control Logic
    always @(posedge clk_10kHz or posedge reset) begin
        if (reset) begin
            cmem_write_addr <= 0;
            cmem_write_enable <= 1;
            imem_write_addr <= 0;
            imem_write_enable <= 0;
            mac_iterations <= 0;
        end else begin
            if (cmem_write_enable) begin
                cmem_data <= cmem_values[cmem_write_addr]; // Use loaded cmem values
                cmem_write_addr <= cmem_write_addr + 1;
                if (cmem_write_addr == 63) cmem_write_enable <= 0;
            end else begin
                imem_write_enable <= 1;
                imem_data_in <= imem_values[imem_write_addr]; // Use loaded imem values
                imem_write_addr <= imem_write_addr + 1;
                if (imem_write_addr == 63) begin
                    imem_write_enable <= 0;
                    mac_enable <= 1;
                end
            end
        end
    end

    always @(posedge clk_1MHz or posedge reset) begin
        if (reset) begin
            mac_iterations <= 0;
            mac_enable <= 0;
        end else if (mac_enable) begin
            mac_iterations <= mac_iterations + 1;
            if (mac_iterations == 63) mac_enable <= 0;
        end
    end

endmodule