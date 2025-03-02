`timescale 1ns / 1ps

module RAM_tb;

    reg clk;
    reg read;
    reg [7:0] adr;
    wire [15:0] out;

    RAM uut(
        .clk(clk),
        .read(read),
        .adr(adr),
        .out(out)
    );

    always #5 clk = ~clk; 

    initial begin
        uut.RAM[0] = 16'hABCD;
        uut.RAM[1] = 16'h1234;
        uut.RAM[2] = 16'h2A3B;
        uut.RAM[3] = 16'hBEEF;
        read = 0;
        clk = 0;
    end


    initial begin
        $monitor("Time=%0t | read=%b | adr=%b | output=%b",
                   $time, read, adr, out );

        #10;
        read = 1;
        #10;
        adr = 8'b00000000;
        #10;
        adr = 8'b00000010;
        #10;
        read = 0;
        #10;
        adr = 8'b00000001;
        #10;
        read = 1;
        #10;
        adr = 8'b00000011;
        #10;
        $finish;

    end


endmodule