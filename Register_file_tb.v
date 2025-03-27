`timescale 1ns / 1ps

module Register_file_tb;

    reg clk;
    reg reset;
    reg write_en;
    reg read_en;
    reg [1:0] write_adr;
    reg [1:0] read_adr1;
    reg [1:0] read_adr2;
    reg [15:0] write_data;
    wire [15:0] read_data1;
    wire [15:0] read_data2;


    Register_file uut(
        .clk(clk),
        .reset(reset),
        .write_en(write_en),
        .read_en(read_en),
        .write_adr(write_adr),
        .read_adr1(read_adr1),
        .read_adr2(read_adr2),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    always #5 clk = ~clk; 

    initial begin
        uut.reg_file[0] = 16'b1100110011001100;
        uut.reg_file[1] = 16'b1010101010101010;
        uut.reg_file[2] = 16'b1111000011110000;
        uut.reg_file[3] = 16'b1000111000111000;
        clk = 0;
    end

    initial begin
      $monitor("Time=%0t | read_en=%b | write_en=%b | read_data1 =%b | read_data2 = %b | write_data = %b",
                $time, read_en, write_en, read_data1, read_data2, write_data);
		
      	
      	read_en = 1;
      	write_en = 0;
        read_adr1 = 2'b00;
        read_adr2 = 2'b01;
        #10;
        reset = 1;
        read_en = 0;
        #10;
        reset = 0;
        write_en = 1;
        write_adr = 2'b10;
        write_data = 16'b1111111111111111;
        #10;
      	write_en = 0;
        read_en = 1;
        read_adr1 = 2'b10;
        #10;
        #200;
        $finish;

    end
  	
  	initial begin
      $dumpfile("Register_file.vcd"); 
      $dumpvars(1, clk, reset, write_en, read_en, write_adr, read_adr1, read_adr2, write_data, read_data1, read_data2);
      	#200;
	end

endmodule