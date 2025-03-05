`timescale 1ns / 1ps

module RAM_tb;

    reg clk;
    reg read;
    reg [7:0] adr;
    reg [7:0] pc_adr;
    wire [15:0] out;
    wire [15:0] pc_out;

    RAM uut(
        .clk(clk),
        .read(read),
        .adr(adr),
        .pc_adr(pc_adr),
        .out(out),
        .pc_out(pc_out)
    );

    always #5 clk = ~clk; 

    initial begin
        uut.RAM[0] = 16'b1111111111111111;
        uut.RAM[1] = 16'b1111000011111111;
        uut.RAM[2] = 16'b1111000011100011;
        uut.RAM[3] = 16'b0011000011100011;
        clk = 0;
    end


    initial begin
        $monitor("Time=%0t | read=%b | adr=%b | pc_adr=%b | out=%b | pc_out=%b",
                   $time, read, adr, pc_adr, out, pc_out );
        read = 1;
        adr = 8'b00000000;
        pc_adr = 8'b00000010;
        #10;
        read = 0;
        #10;
        read = 1;
        adr = 8'b00000001;
        pc_adr = 8'b00000011;
        #10;
        #200;
        $finish;

    end


endmodule