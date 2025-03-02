module Control_unit(
    input [15:0] instruction,
    input branch_check,
    output reg [3:0] alu_code,
    output reg RAM_read,
    output reg Reg_read,
    output reg Reg_write,
    output reg pc_jump,
    output reg pc_branch,
    output reg [1:0] reg1,
    output reg [1:0] reg2,
    output reg [7:0] RAM_adr
);

wire [3:0] opcode = instruction[15:12];
wire [1:0] rs1 = instruction[11:10];
wire [1:0] rs2 = instruction[9:8];
wire [7:0] adr = instruction[7:0];

always @(*)begin

    alu_code = 4'b0000;
    RAM_read = 1;
    Reg_read = 0;
    Reg_write = 0;
    pc_jump = 0;
    pc_branch = 0;
    reg1 = 2'b00;
    reg2 = 2'b00;
    RAM_adr = instruction[7:0];

    case(opcode)
        4'b0000: begin  //ADD
            alu_code = 4'b1000; //The alu code for the ALU
            Reg_read = 1; // This enables the registers to read the two registers that are needed to addition
            Reg_write = 1; //The result of the addition will be stored in the first register value
            reg1 = rs1; // register adress 1
            reg2 = rs2; // register adress 2
        end
        4'b0100: begin //SUB
            alu_code = 4'b0010; //The alu code for the ALU
            Reg_read = 1; // This enables the registers to read the two registers that are needed to subtraction
            Reg_write = 1; //The result of the addition will be stored in the first register value
            reg1 = rs1; //register adress 1
            reg2 = rs2; //register adress 2
        end
        4'b0100: begin //LOAD
            RAM_read = 1; // enables the ram to read the data to load
            Reg_write = 1; // enables to register to get ready to store the value 
            reg1 = rs1; // register at which its being stored
            RAM_adr = adr; //adress at the ram that is being read
        end
        4'b1000: begin //JUMP
            pc_jump = 1; //signal to PC
            RAM_adr = adr; //adress to jump to
        end
        4'b1111, 4'b1101, 4'b1110: begin  //BRANCH
            alu_code = opcode; // sends the branch opcode to the ALU and 
            reg1 = rs1; //reg 1
            reg2 = rs2; //reg 2
            if(branch_check)begin  //the ALU checks if the two registers are equal/greater/less and then sends the pc_branch back
                pc_branch = 1; //signal to PC
                RAM_adr = adr; // adress to skip to
            end
            

        end

    endcase

end



endmodule