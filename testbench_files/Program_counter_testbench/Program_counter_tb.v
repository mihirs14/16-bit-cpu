module Program_counter_tb;
    reg clk;
    reg reset;
    reg jump;
    reg [7:0] jump_adr;
    reg branch;
    reg [7:0] branch_adr;
    wire [7:0] address;

    Program_counter uut(
        .clk(clk),
        .reset(reset),
        .jump(jump),
        .jump_adr(jump_adr),
        .branch(branch),
        .branch_adr(branch_adr),
        .address(address)
    );

    initial begin
        clk = 0;      
        reset = 1;    
        jump = 0;
        jump_adr = 8'b00000000; 
        branch = 0;
        branch_adr = 8'b00000000; 
    end


    always #5 clk = ~clk; 

    initial begin

        $monitor("Time=%0t | jump=%b | branch=%b | address=%b",
                  $time, jump, branch, address);

        #10;
        reset = 0;
        #10;#10;#10;#10;#10;#10;
        jump = 1;
        jump_adr = 8'b00000001;
        #10;
        jump = 0;
        #10;#10;#10;#10;
        branch = 1;
        branch_adr = 8'b10000000;
        #10;
        branch = 0;
        #10;#10;#10;#10;
        $finish;     

    end

    initial begin
    	$dumpfile("program_counter.vcd"); 
    	$dumpvars(1, clk, reset, jump, jump_adr, branch, branch_adr, 							address);
      	#200;
	end

endmodule
