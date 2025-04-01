//Register File Implementation

module Register_file(
    input clk,
    input reset,
    input write_en,
    input read_en,
    input [1:0] write_adr,
    input [1:0] read_adr1,
    input [1:0] read_adr2,
    input [15:0] write_data,
    output reg [15:0] read_data1,
    output reg [15:0] read_data2
);

reg [15:0] reg_file [0:3];

always @(posedge clk)begin
    if(reset) begin
        reg_file[0] <= 16'b0;
        reg_file[1] <= 16'b0;
        reg_file[2] <= 16'b0;
        reg_file[3] <= 16'b0;
    end
    else if(write_en) begin
        reg_file[write_adr] <= write_data;
        end
    end
always @(*)begin
    if(read_en)begin
        read_data1 <= reg_file[read_adr1];
        read_data2 <= reg_file[read_adr2];
    end 
    else begin
        read_data1 <= 16'bx;
        read_data2 <= 16'bx;
    end
end



endmodule
