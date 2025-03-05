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
        uut.ram.RAM[0] = 16'b0100_00_00_00000010; // ADD R0, R1
        uut.ram.RAM[1] = 16'b0100_01_00_00000010; // JUMP 4
        uut.ram.RAM[2] = 16'b0000_00_00_00000001; // ADD R0, R
        uut.ram.RAM[3] = 16'b0000_00_00_00000001;
        uut.ram.RAM[4] = 16'b0010_00_01_00000001;

        #500 $finish;

    end

    always @(uut.pc_address) begin
        $display("Time=%0t | PC Address=%b | instruction=%b | reg_1=%b | reg_2=%b | accum=%b",  $time, uut.pc_address, uut.current_instruction, uut.RF.reg_file[0], uut.RF.reg_file[1], uut.alu_result);
    end

    // initial begin
    //     $dumpfile("cpu_tb.vcd");
    //     $dumpvars(0, cpu_tb);
    // end

endmodule