`timescale 1ns / 1ps
module Third_register (clk, reset, clr,RegWriteD,MemWriteD, JumpD, BranchD, ALUSrcD, ALUControlD,ResultSrcD, ImmSrcD, rdD, RD1D, RD2D, PCD, ImmExtD, PCplus4D, RegWriteE,MemWriteE, JumpE, BranchE, ALUSrcE, ALUControlE, ResultSrcE, rdE, RD1E, RD2E, PCE, ImmExtE, PCplus4E,rs1D,rs2D,rs1E,rs2E);
input clk, reset, clr, RegWriteD,MemWriteD, JumpD, BranchD, ALUSrcD; 
input [2:0] ALUControlD;  
input [1:0] ResultSrcD, ImmSrcD;
input [4:0] rdD,rs1D,rs2D;
input [31:0] RD1D, RD2D, PCD, ImmExtD, PCplus4D;
output reg RegWriteE,MemWriteE, JumpE, BranchE, ALUSrcE; 
output reg  [2:0] ALUControlE;  
output reg [1:0] ResultSrcE;
output reg [4:0] rdE,rs1E,rs2E;
output reg [31:0] RD1E, RD2E, PCE, ImmExtE, PCplus4E;

always @ (posedge clk)
begin
if (reset | clr)
begin
RD1E       <= 0;
RD2E       <= 0;
PCE        <= 0;
ImmExtE    <= 0;
PCplus4E   <= 0;
rdE        <= 0;
rs1E       <= 0;
rs2E       <= 0;
ResultSrcE <= 0;
ALUControlE<= 0;
RegWriteE  <= 0;
MemWriteE  <= 0;
JumpE      <= 0;
BranchE    <= 0;
ALUSrcE    <= 0;
end

else 
begin
RD1E       <= RD1D;
RD2E       <= RD2D;
PCE        <= PCD;
ImmExtE    <= ImmExtD;
PCplus4E   <= PCplus4D;
rdE        <= rdD;
rs1E       <= rs1D;
rs2E       <= rs2D;
ResultSrcE <= ResultSrcD;
ALUControlE<= ALUControlD;
RegWriteE  <= RegWriteD;
MemWriteE  <= MemWriteD;
JumpE      <= JumpD;
BranchE    <= BranchD;
ALUSrcE    <= ALUSrcD;
end

end

endmodule 