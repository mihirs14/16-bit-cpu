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
        #10 reset = 0;
        uut.ram.RAM[0] = 16'b0100_00_00_00000001; // ADD R0, R1
        uut.ram.RAM[1] = 16'b0100_01_00_00000000; 
        uut.ram.RAM[2] = 16'b1000_00_00_00000011;                                            // JUMP 4
        uut.ram.RAM[3] = 16'b1110_00_01_00000101;
        uut.ram.RAM[4] = 16'b0000_00_00_00000000;
        uut.ram.RAM[5] = 16'b0000_00_00_00000000;

        #500 $finish;

    end

    always @(uut.pc_address) begin
        $display("Time=%0t | PC Address=%b | instruction=%b | reg_1=%b | pc_branch=%b | pc_jump=%b | RAM_adress",  $time, uut.pc_address, uut.current_instruction, uut.RF.reg_file[0], uut.pc_branch, uut.pc_jump, uut.RAM_adress);
    end

    // initial begin
    //     $dumpfile("cpu_tb.vcd");
    //     $dumpvars(0, cpu_tb);
    // end

endmodule