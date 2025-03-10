`timescale 1ns / 1ps

module ALU_tb;

    reg [3:0] alu_code;
    reg [15:0] reg_data1;
    reg [15:0] reg_data2;
    wire [15:0] accum;
    wire pc_branch;

    ALU uut(
        .alu_code(alu_code),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2),
        .accum(accum),
        .pc_branch(pc_branch)
    );

    initial begin
        $monitor("Time=%0t | alu_code=%b | reg1=%b | reg2=%b | accum=%b | pc_branch=%b",
                  $time, alu_code, reg_data1, reg_data2, accum, pc_branch);    
    
        alu_code = 4'b1000;
        reg_data1 = 16'b0000000000000001;
        reg_data2 = 16'b0000000000111111;
        #10;
        alu_code = 4'b0100;
        reg_data1 = 16'b0000000000111111;
        reg_data2 = 16'b0000000000000001;
        #10;
        alu_code = 4'b1100;
        reg_data1 = 16'b0000000000000001;
        reg_data2 = 16'b0000000000000001;
        #10;
        alu_code = 4'b1100;
        reg_data1 = 16'b0000000000000001;
        reg_data2 = 16'b0000000000000011;
        #10;
        alu_code = 4'b1101;
        reg_data1 = 16'b0000000000000001;
        reg_data2 = 16'b0000000000000011;
        #10;
        alu_code = 4'b1101;
        reg_data1 = 16'b0000000000000011;
        reg_data2 = 16'b0000000000000001;
        #10;
        alu_code = 4'b1110;
        reg_data1 = 16'b0000000000000001;
        reg_data2 = 16'b0000000000000011;
        #10;
        alu_code = 4'b1110;
        reg_data1 = 16'b0000000000000011;
        reg_data2 = 16'b0000000000000001;
        #10;
        $finish;

    end

endmodule