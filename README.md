# 16-bit Register-Transfer-Level CPU written in verilog


## Project Overview:

- This project is the implamentation of a CPU designed in verilog that processes 16-bit instructions. The CPU is integrated to handle simple instructions: ADD, SUB, LOAD, JUMP and BRANCH
  and works with a RAM memory system for the data and instruction. It is capaable of performing simple arithmitic, loading/reading data into registers/memory, and jumping/branching
  instrcutions based on conditional requirments. The architecture of the CPU follows a simple fetch-decode-execute style where the results are stored in registers and memory.
- The main goal of this project was to demonstrate and apply my skills in Digital Logic Design, CPU/Computer architecture, Verilog/VDHL, and hardare verificaiton. After completinign this
  project my understanding in these concepts have deepend and it sets a foundation for me to persue further tasks and knowledge into VLSI, CPU architecture, and digital systems design.



## How the CPU works:

As mentioned before the CPU works with 16-bit instructions:
  - The first 4 bits represent the opcode: [(opcode)xxxx]xxxxxxxxxxxx. The opcode corresponds to the type of instrcution (ADD, SUB, LOAD, JUMP, BRANCH) that is decoded by a control unit.
  - The next 4 bits represent the registers: xxxx[(register 1)xx (register 2) xx]xxxxxxxx. These are the adresses of the two registers in the register file that the instrciton needs.
  - The last 8 bits represent a memory adress in the RAM: xxxxxxxx[(RAM_address)xxxxxxxx]. This is the address of a specific instruciton in the RAM that the current instrcution may need.

ADD:
 - When the instruction is a ADD opcode, the cpu simpliy adds the data values of the two registers, (xxxx[(register 1)xx (register 2)xx]xxxxxxxx), and stores the
   result in the first register (register 1)
SUB:
 - When the instruction is a SUB opcode, the cpu simpliy subtracts the data values of the two registers, (xxxx[(register 1)xx (register 2)xx]xxxxxxxx), and stores the
   result in the first register (register 1)
LOAD:
 - When the instruction is a LOAD opcode, the cpu takes the data that is at the RAM address, the last 8 bits in the instrcution xxxxxxxx[(RAM_address)xxxxxxxx], and loads it in the first
   register address that is in the instruction,xxxx[(register 1)xx]xxxxxxxxxxxx.
JUMP:
 - When the instruction is a JUMP opcode, the cpu updates the current instruction that it is on, to the last the last 8 bits in the instrcution xxxxxxxx[(RAM_address)xxxxxxxx]
BRANCH:
 - When the instrcution is a BRANCH opcode, the cpu takes the first register, xxxx[(register 1) xx]xxxxxxxxxxxx, and depending on the opcode being either: equal to, greater than, or less
   than, it compares it to the second register xxxxxx[(register 2) xx]xxxxxxxx. If the condition evalutes to true, then the instruction updates to the last 8 bits in the instrcution
   xxxxxxxx[(RAM_address)xxxxxxxx]. 



## Component Breakdown

Program counter(PC): The program counter module in this CPU is meant to keep track of the current instruction that the CPU is on. the instruction is 8 bits which is also the size of the
                     RAM index's. When a reset signal is sent to the CPU, the current instruction default sets to 8'b00000000. The instruction is then incremented by 1 every clock cycle.
                     If the program counter recieves a jump or branch signal then the current instruction updates to the input RAM address that was in the current instructions

Random Access Memory(RAM): The RAM module is a register of 256 entries of 16 bit binary numbers. The RAM module has two inputs being a program counter address and a regular read address.
                           The RAM has two output channels that are the corresponding instruction stored in the RAM module with the inputs being the index

Register File(RF): The register file module is the section that stores the data of 4 registers that the cpu works with. The register file is 4 entries of 16 bit binary numbers. The reg-
                   ister file has inputs had a read-enable signal and two read input addresses of the register when the CPU needs to read data from a certain register, and the two outputs
                   corresponding to that data. It also has write-enable input signal and input address and data when it needs to store a value at one of the registers.

Control Unit(CU): 

Arithmetic Logic Unit(ALU): The Arithmetic Logic Unit module is used to handle all of the computations and comparisons that the CPU needs to perfrom based on the instruction. The ALU
                            handles the addition and the subtraction of two binary numbers when the instruction is asked to add two registers. It recives the data as inputs and outputs
                            the mathematical result. It also handles the comparison condition with a BRANCH opcode instruction, and compares the two values of the registers and sends the
                            branch signal if the condition is true or not. 

                               

## Project Structure

project/
│
├── README.md
├── docs/          # architecture diagram
├── src/           # Source code for the CPU modules
├── testbenches/   # Testbenches for various modules
├── simulation/    # Simulation results of modules



