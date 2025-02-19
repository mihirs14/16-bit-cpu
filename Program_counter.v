module Program_counter(
    input clk,
    input reset,
    input jump,
    input [7:0] jump_adr,
    input branch,
    input [7:0] branch_adr,
    output reg [7:0] address
);

reg [7:0] program; //register where the current RAM adress is loaded after each clock cycle

always @(posedge clk)
    if(reset) begin
        program <= 8'b00000000;
    end
    else if(jump)begin //Handles the case if the current instrcution is jump and skips to input adress
        program <= jump_adr;
    end
    else if(branch)begin //Handles the case if the current instrcution is branch and skips to input adress
        program <= branch_adr;
    end
    else begin
        program <= program + 1; //Normal 1 incrementer
    end

always @(program) begin
    address <= program; //output is the program adress register
end

endmodule