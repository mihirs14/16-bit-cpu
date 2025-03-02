`timescale 1ns / 1ps

module ALU_tb;

    reg [3:0] alu_code;
    reg [15:0] reg_data1;
    reg [15:0] reg_data2;
    wire [15:0] accum;
    wire branch_check;

    ALU uut(
        .alu_code(alu_code),
        .reg_data1(reg_data1),
        .reg_data2(reg_data2),
        .accum(accum),
        .branch_check(branch_check)
    );

    initial begin
        $monitor("Time=%0t | alu_code=%b | reg1=%b | reg2=%b | accum=%b | branch_check=%b",
                  $time, alu_code, reg_data1, reg_data2, accum, branch_check);    
    
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

        $finish;

    end

endmodule