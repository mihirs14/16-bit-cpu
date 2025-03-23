`timescale 1ns / 1ps

module control_unit_tb;

    reg [15:0] instruction;
    wire [3:0] alu_code;
    wire RAM_read;
    wire Reg_read;
    wire Reg_write;
    wire pc_jump;
    wire [1:0] reg1;
    wire [1:0] reg2;
    wire [7:0] RAM_adr;

    Control_unit uut (
        .instruction(instruction),
        .alu_code(alu_code),
        .RAM_read(RAM_read),
        .Reg_read(Reg_read),
        .Reg_write(Reg_write),
        .pc_jump(pc_jump),
        .reg1(reg1),
        .reg2(reg2),
        .RAM_adr(RAM_adr)
    );

    initial begin
        // Monitor values
        $monitor("Time=%0t | Instr=%b | ALU=%b | R_Read=%b | R_Write=%b | Jmp=%b | Reg1=%b | Reg2=%b | RAM_Adr=%b | RAM_read=%b", 
                  $time, instruction, alu_code, Reg_read, Reg_write, pc_jump, reg1, reg2, RAM_adr, RAM_read);
        
        instruction = 16'b0100110100000000; 
        #10;

        instruction = 16'b0100110100000000; 
        #10;

        instruction = 16'b0100110100000000; 
        #10;

        instruction = 16'b0100110100000000; 
        #10;

        instruction = 16'b0100110100000000; 
        #10;
        
        $finish;
    end

endmodule
