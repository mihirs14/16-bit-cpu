`timescale 1ns / 1ps

module cpu_tb;
    reg clk;
    reg reset;

    cpu uut(
        .clk(clk),
        .reset(reset)
    );

    always #5 clk = ~clk;

    initial begin
        reset = 1;
        clk = 0;
        #10; 
      	reset = 0;
      	uut.ram.RAM[0] = 16'b0100_00_00_00000001; 
      	uut.ram.RAM[1] = 16'b0100_01_00_00000001; 
        uut.ram.RAM[2] = 16'b1000_00_00_00000011; 
      	uut.ram.RAM[3] = 16'b1111_00_01_00000101;
        uut.ram.RAM[4] = 16'b0000_00_00_00000000;
        uut.ram.RAM[5] = 16'b0000_00_00_00000000;
      	uut.ram.RAM[6] = 16'b1110_00_01_00001000;
     	uut.ram.RAM[7] = 16'b0000_00_00_00000000;
      	uut.ram.RAM[8] = 16'b0010_00_00_00000000;
      	uut.ram.RAM[9] = 16'b1101_01_00_00000000;
      	uut.ram.RAM[10] = 16'b000_00_00_00000000;

        #100; 
        $finish;

    end

    always @(uut.pc_address) begin
      $display("Time=%0t | PC Address=%b | instruction=%b | reg_1=%b | reg_2=%b | pc_branch=%b | pc_jump=%b ",  $time, uut.pc_address, uut.current_instruction, uut.RF.reg_file[0], uut.RF.reg_file[1], uut.pc_branch, uut.pc_jump);
    end
  
  	initial begin
      $dumpfile("cpu.vcd"); 
      $dumpvars(1, clk, uut.pc_address, uut.current_instruction, 			uut.RF.reg_file[0], uut.RF.reg_file[1], uut.pc_branch, uut.pc_jump);
      	#200;
	end
   

endmodule