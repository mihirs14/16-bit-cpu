module ALU (
    input [3:0] alu_code;
    input [15:0] reg_data1;
    input [15:0] reg_data2;
    output reg [15:0] accum;
    output reg branch_check;
    
);

always @(*) begin

branch_check = 0;
accum = 16'b0

case(alu_code):
    4'b1000: accum = reg_data1 + reg_data2;
    4'b0100: accum = reg_data1 - reg_data2;
    4'b1100: begin
        if(reg_data1 == reg_data2) begin
            branch_check = 1;
        end
    end
    4'b1101: begin
        if(reg_data1 < reg_data2) begin
            branch_check = 1;
        end
    end
    4'b1110: begin
        if(reg_data1 > reg_data2) begin
            branch_check = 1;
        end
    end
    default: accum = 16'b0
endcase

end

endmodule