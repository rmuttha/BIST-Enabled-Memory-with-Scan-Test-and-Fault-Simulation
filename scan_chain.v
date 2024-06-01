// Author: Rutuja Muttha

module scan_chain (
    input wire clk,               // Clock input
    input wire scan_en,           // Scan enable
    input wire scan_in,           // Scan data input
    output wire scan_out,         // Scan data output
    output reg [7:0] q            // Parallel data output
);

    reg [7:0] scan_register;

    always @(posedge clk) begin
        if (scan_en) begin
            scan_register <= {scan_register[6:0], scan_in};
        end
        q <= scan_register;
    end

    assign scan_out = scan_register[7];

endmodule
