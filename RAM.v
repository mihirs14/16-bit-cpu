module RAM (
    input clk,
    input read,
    input [7:0] adr,
    output reg [15:0] out
);

reg [15:0] RAM [0:255];

always @(posedge clk)begin
    if (read) begin
        out <= RAM[adr];
    end
    else begin
        out <= 16'b1;
    end
end

endmodule