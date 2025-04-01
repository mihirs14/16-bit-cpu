// ALU Implamentation

module ALU (
    input [3:0] alu_code,
    input [15:0] reg_data1,
    input [15:0] reg_data2,
    output reg [15:0] accum,
    output reg pc_branch
);

always @(*) begin

accum = 16'b000000000000000;
pc_branch = 0;

    case(alu_code)
        4'b1000: accum = reg_data1 + reg_data2;
        4'b0100: accum = reg_data1 - reg_data2;
        4'b1111: begin
            if(reg_data1 == reg_data2) begin
                pc_branch = 1;
            end
        end
        4'b1101: begin
            if(reg_data1 < reg_data2) begin
                pc_branch = 1;
            end
        end
        4'b1110: begin
            if(reg_data1 > reg_data2) begin
                pc_branch = 1;
            end
        end
    endcase

end


endmodule

