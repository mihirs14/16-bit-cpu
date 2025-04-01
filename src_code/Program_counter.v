//Program counter Implementation

module Program_counter(
    input clk,
    input reset,
    input jump,
    input [7:0] jump_adr,
    input branch,
    input [7:0] branch_adr,
    output reg [7:0] address
);

reg [7:0] program; 

always @(posedge clk)
    if(reset) begin
        program <= 8'b00000000;
    end
    else if(jump)begin
        program <= jump_adr; 
    end
    else if(branch)begin 
        program <= branch_adr;
    end
    else begin
        program <= program + 1; 
    end

always @(program) begin
    address = program; 
end

endmodule
