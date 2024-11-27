`timescale 1ns / 1ps
module controlunit(opcode,branch, jump,immsrc,resultsrc,aluop,memwrite,alusrc,regwrite);
input [6:0] opcode;
output [1:0] immsrc,resultsrc,aluop;
output branch, jump,memwrite,alusrc,regwrite;
wire [10:0] controls;
assign {alusrc, resultsrc, immsrc, regwrite, memwrite, branch,jump, aluop} = controls;

assign controls = 
        (opcode == 7'b0110011) ? 11'b0_00_xx_1_0_0_0_10: // r type
		  (opcode == 7'b0000011) ? 11'b1_01_00_1_0_0_0_00: // lw type
		  (opcode == 7'b0100011) ? 11'b1_xx_01_0_1_0_0_00: // sw type (sw)
		  (opcode == 7'b1100011) ? 11'b0_xx_10_0_0_1_0_01: // sb  type(beq)
		  (opcode == 7'b0010011) ? 11'b1_00_00_1_0_0_0_00: // addi type (addi)
		  (opcode == 7'b1101111) ? 11'bx_10_11_1_0_0_1_xx: // j type (jal)  
		                           11'b0_00_00_0_0_0_0_00;
endmodule
