`timescale 1ns / 1ps

module cpu(
    input clk,
    input reset
);

    wire [7:0] pc_address;
    wire [15:0] current_instruction;
    wire [3:0] alu_code;
    wire [15:0] alu_result; 
    wire [1:0] reg_1_adr, reg_2_adr;
    wire [7:0] RAM_adress;
    wire [15:0] reg_1_data, reg_2_data;
    wire RAM_read, reg_read, reg_write, pc_jump, pc_branch, branch_check;

    Program_counter PC(
        .clk(clk),
        .reset(reset),
        .jump(pc_jump),
        .jump_adr(RAM_adress),
        .branch(pc_branch),
        .branch_adr(RAM_adress),
        .address(pc_address)
    );

    RAM ram(
        .clk(clk),
        .read(RAM_read),
        .adr(pc_address),
        .out(current_instruction)
    );

    Register_file RF(
        .clk(clk),
        .reset(reset),
        .write_en(reg_write),
        .read_en(reg_read),
        .write_adr(reg_1_adr),
        .read_adr1(reg_1_adr),
        .read_adr2(reg_2_adr),
        .write_data(alu_result),
        .read_data1(reg_1_data),
        .read_data2(reg_2_data)
    );

    Control_unit CU(
        .instruction(current_instruction),
        .branch_check(branch_check),
        .alu_code(alu_code),
        .RAM_read(RAM_read),
        .Reg_read(Reg_read),
        .Reg_write(Reg_write),
        .pc_jump(pc_jump),
        .pc_branch(pc_branch),
        .reg1(reg_1_adr),
        .reg2(reg_2_adr),
        .RAM_adr(RAM_adress)
    );

    ALU alu(
        .alu_code(alu_code),
        .reg_data1(reg_1_data),
        .reg_data2(reg_2_data),
        .accum(alu_result),
        .branch_check(branch_check)
    );

endmodule