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
      $monitor("Time=%0t | Instr=%b | ALU=%b | Reg_Read=%b | Reg_Write=%b | Jmp=%b | Reg1=%b | Reg2=%b | RAM_Adr=%b | RAM_read=%b", 
                  $time, instruction, alu_code, Reg_read, Reg_write, pc_jump, reg1, reg2, RAM_adr, RAM_read);
        
        instruction = 16'b0100100000000000; 
        #10;

        instruction = 16'b0000110100000000; 
        #10;

        instruction = 16'b0010011100000000; 
        #10;

        instruction = 16'b1000000000000100; 
        #10;

        instruction = 16'b1111110100000000; 
        #10;
      
      	instruction = 16'b1101100000000000; 
        #10;
      
      	instruction = 16'b1110110000000000; 
        #10;
        
        $finish;
    end
  
  	initial begin
      $dumpfile("Control_Unit.vcd");
      $dumpvars(1,instruction, alu_code, Reg_read, Reg_write, pc_jump, reg1, 					reg2, RAM_adr, RAM_read);
      #200;
    end

endmodule