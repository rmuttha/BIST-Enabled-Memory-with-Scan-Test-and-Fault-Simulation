// Author: Rutuja Muttha

module fault_modeling (
    input wire clk,               // Clock input
    input wire reset,             // Reset input
    input wire [7:0] test_vector, // Test vector input
    output reg fault_detected     // Fault detected output
);

    // Example of a stuck-at fault model
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            fault_detected <= 0;
        end else begin
            if (test_vector[3] == 1'b1) // Assume stuck-at fault at bit 3
                fault_detected <= 1;
            else
                fault_detected <= 0;
        end
    end

endmodule
