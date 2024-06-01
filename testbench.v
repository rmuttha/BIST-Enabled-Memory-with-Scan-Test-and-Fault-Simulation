// Author: Rutuja Muttha

module testbench;

    reg clk, reset, bist_en, scan_en, scan_in;
    wire bist_done, bist_pass, scan_out, fault_detected;
    wire [7:0] mem_out;
    reg [7:0] test_vector;

    // Instantiate memory with BIST module
    memory_bist mem_bist (
        .clk(clk),
        .reset(reset),
        .bist_en(bist_en),
        .bist_done(bist_done),
        .bist_pass(bist_pass),
        .mem_out(mem_out)
    );

    // Instantiate scan chain module
    scan_chain scan (
        .clk(clk),
        .scan_en(scan_en),
        .scan_in(scan_in),
        .scan_out(scan_out),
        .q()
    );

    // Instantiate fault modeling module
    fault_modeling fault (
        .clk(clk),
        .reset(reset),
        .test_vector(test_vector),
        .fault_detected(fault_detected)
    );

    // Initialize inputs
    initial begin
        clk = 0;
        reset = 1;
        bist_en = 0;
        scan_en = 0;
        scan_in = 0;
        test_vector = 8'b0;
        #10 reset = 0;
        #10 bist_en = 1;
        #100 bist_en = 0;
        #10 scan_en = 1;
        #10 scan_in = 1;
        #20 scan_in = 0;
        #10 test_vector = 8'h08; // Test vector to trigger fault detection
        #20 $finish;
    end

    // Clock generation
    always #5 clk = ~clk;

endmodule
