`timescale 1ns / 1ps
module Control_unit(opcode,funct3,funct7,alusrc,resultsrc,immsrc,regwrite,memwrite,alucontrol,branch, jump);
input [6:0] opcode;
input funct7;
input [2:0] funct3;
output [2:0] alucontrol;
output [1:0] immsrc,resultsrc;
output memwrite,alusrc,regwrite;
output branch,jump;
wire [1:0] aluop;

controlunit u1(opcode,branch,jump,immsrc,resultsrc,aluop,memwrite,alusrc,regwrite);
alucontrol u2(aluop,funct3,funct7,alucontrol);
endmodule