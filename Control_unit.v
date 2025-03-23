module Control_unit(
    input [15:0] instruction,
    output reg [3:0] alu_code,
    output reg RAM_read,
    output reg Reg_read,
    output reg Reg_write,
    output reg pc_jump,
    output reg [1:0] reg1,
    output reg [1:0] reg2,
    output reg [7:0] RAM_adr
);

wire [3:0] opcode = instruction[15:12];
wire [1:0] rs1 = instruction[11:10];
wire [1:0] rs2 = instruction[9:8];
wire [7:0] adr = instruction[7:0];

always @(*)begin

    alu_code = 4'bx;
    RAM_read = 1;
    Reg_read = 1;
    Reg_write = 0;
    pc_jump = 0;
    reg1 = 2'bx;
    reg2 = 2'bx;
    RAM_adr = 8'bx;

    case(opcode)
        4'b0000: begin  //ADD
            alu_code = 4'b1000; 
            Reg_write = 1; 
            reg1 = rs1; 
            reg2 = rs2; 
        end
        4'b0010: begin //SUB
            alu_code = 4'b0100; 
            Reg_write = 1; 
            reg1 = rs1;
            reg2 = rs2; 
        end
        4'b0100: begin //LOAD
            alu_code = 4'b1001;   
            Reg_write = 1; 
            reg1 = rs1; 
            RAM_adr = adr; 
        end
        4'b1000: begin //JUMP
            pc_jump = 1;
            Reg_read = 0; 
            RAM_adr = adr; 
        end
        4'b1111, 4'b1101, 4'b1110: begin  //BRANCH
            alu_code = opcode; 
            reg1 = rs1; 
            reg2 = rs2;
            RAM_read = 0;
            RAM_adr = adr; 
        end

    endcase

end



endmodule