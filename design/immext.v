`timescale 1ns / 1ps
module immext(instruction,immsrc,imm_data);
input [31:0] instruction;
input [1:0] immsrc;
output [31:0] imm_data;
reg [31:0] imm_data;
always @(*)
begin
  case(immsrc)
 2'b00: imm_data = {{20{instruction[31]}},instruction[31:20]};                                         //I
 2'b01: imm_data = {{20{instruction[31]}},instruction[31:25],instruction[11:7]};                       //S
 2'b10: imm_data = {{20{instruction[31]}},instruction[7],instruction[30:25],instruction[11:8],1'b0};   //B
 2'b11: imm_data = {{12{instruction[31]}},instruction[19:12],instruction[20],instruction[30:21],1'b0}; //J
 default: imm_data = 32'bx;
 endcase
end
endmodule