// Author: Rutuja Muttha

module memory_bist (
    input wire clk,              // Clock input
    input wire reset,            // Reset input
    input wire bist_en,          // BIST enable
    output wire bist_done,       // BIST done signal
    output wire bist_pass,       // BIST pass/fail signal
    output reg [7:0] mem_out     // Memory data output
);

    reg [7:0] memory_array [255:0]; // 256 x 8-bit memory
    reg [7:0] address;
    reg [7:0] data_in;
    reg we;                        // Write enable
    reg [7:0] bist_pattern [7:0];  // BIST test patterns
    reg [2:0] pattern_index;       // Index for test patterns
    reg bist_fail;
    
    initial begin
        // Initialize BIST patterns
        bist_pattern[0] = 8'hAA;
        bist_pattern[1] = 8'h55;
        bist_pattern[2] = 8'hFF;
        bist_pattern[3] = 8'h00;
        bist_pattern[4] = 8'h33;
        bist_pattern[5] = 8'hCC;
        bist_pattern[6] = 8'h0F;
        bist_pattern[7] = 8'hF0;
    end

    // Memory write and read
    always @(posedge clk) begin
        if (we)
            memory_array[address] <= data_in;
        mem_out <= memory_array[address];
    end

    // BIST process
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            pattern_index <= 0;
            address <= 0;
            we <= 0;
            bist_fail <= 0;
        end else if (bist_en) begin
            if (pattern_index < 8) begin
                we <= 1;
                data_in <= bist_pattern[pattern_index];
                address <= pattern_index;
                pattern_index <= pattern_index + 1;
            end else begin
                we <= 0;
                if (mem_out != bist_pattern[address]) begin
                    bist_fail <= 1;
                end
                address <= address + 1;
                if (address == 7)
                    pattern_index <= 0;
            end
        end
    end

    assign bist_done = (pattern_index == 0) && (address == 7);
    assign bist_pass = ~bist_fail;

endmodule
