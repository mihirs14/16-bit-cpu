//RAM Implementation

module RAM (
    input read,
    input [7:0] adr,
    input [7:0] pc_adr,
    output reg [15:0] out,
    output reg [15:0] pc_out
);

reg [15:0] RAM [0:255];

always @(*)begin
    pc_out <= RAM[pc_adr];
    if (read) begin
        out <= RAM[adr];
    end
end

endmodule
