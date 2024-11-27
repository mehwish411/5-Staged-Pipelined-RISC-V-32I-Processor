`timescale 1ns / 1ps
module Risc_v_pipelined (clk,reset);
input clk, reset;
wire [31:0] PCplus4F,PC, PCF,InstrF;
wire [31:0] RD1D,RD2D, InstrD,PCD, PCplus4D,ImmExtD;
wire [31:0] PCTargetE,RD1E, RD2E, PCE, ImmExtE,PCplus4E, SrcAE, SrcBE, Src2BE,ALUResultE;
wire [31:0] PCplus4M,ALUResultM, WriteDataM,ReadDataM;
wire [31:0] ResultW, PCplus4W,ALUResultW,ReadDataW;
wire [4:0] rdW, rdE, rdM,rs1E,rs2E;
wire [2:0] ALUControlE,ALUControlD;
wire [1:0] ResultSrcE,ResultSrcD,ImmSrcD,ResultSrcM,ResultSrcW,ForwardAE,ForwardBE;
wire PCSrcE,BranchE,JumpE,ALUSrcE,RegWriteE,MemWriteE,ZeroE;
wire BranchD,JumpD,ALUSrcD,RegWriteD,MemWriteD;
wire RegWriteM,MemWriteM;
wire RegWriteW;
wire StallD,StallF,FlushE,FlushD;
//sub_blocks:
mux PCSrc (PCplus4F,PCTargetE,PCSrcE,PC);
First_register FR (clk, reset, StallF, PC, PCF);
instmem IM (PCF,InstrF);
adder PCplus4 (PCF,32'b100,PCplus4F);
Second_Register SR (clk, reset, FlushD,StallD,InstrF,PCF,PCplus4F, InstrD, PCD, PCplus4D);
Control_unit CU (InstrD[6:0],InstrD[14:12],InstrD[30],ALUSrcD,ResultSrcD,ImmSrcD,RegWriteD,MemWriteD,ALUControlD,BranchD,JumpD);
registerfile RF (InstrD[19:15],InstrD[24:20],rdW,ResultW,RegWriteW,RD1D,RD2D,clk);
immext Im_Ext (InstrD,ImmSrcD,ImmExtD);
Third_register TR (clk, reset, FlushE,RegWriteD,MemWriteD, JumpD, BranchD, ALUSrcD, ALUControlD,ResultSrcD, ImmSrcD, InstrD[11:7], RD1D, RD2D, PCD, ImmExtD, PCplus4D, RegWriteE,MemWriteE, JumpE, BranchE, ALUSrcE, ALUControlE, ResultSrcE, rdE, RD1E, RD2E, PCE, ImmExtE, PCplus4E,InstrD[19:15],InstrD[24:20],rs1E,rs2E);
mux ALUSrc (SrcBE,ImmExtE,ALUSrcE,Src2BE);
adder PCplusImm	(PCE,ImmExtE,PCTargetE);
alu ALU (SrcAE,Src2BE,ALUControlE,ZeroE,ALUResultE);
assign PCSrcE = JumpE | (BranchE & ZeroE);
Fourth_register FRR (clk, reset, RegWriteM,MemWriteM, ResultSrcM, rdM, PCplus4M, RegWriteE, MemWriteE, ResultSrcE, rdE, PCplus4E, ALUResultE, SrcBE, ALUResultM, WriteDataM);
datamem DM (ALUResultM,WriteDataM,clk,MemWriteM,ReadDataM);
Fifth_register FIFR (clk, reset, RegWriteM, ResultSrcM, rdM, PCplus4M, RegWriteW, ResultSrcW, rdW, PCplus4W, ALUResultW, ReadDataW, ALUResultM, ReadDataM);
mux3to1 resultSrc (ALUResultW,ReadDataW,PCplus4W,ResultSrcW,ResultW);
Hazard_unit HU (InstrD[19:15],InstrD[24:20],rs1E,rs2E,rdM,rdW,RegWriteM,RegWriteW,rdE,ResultSrcE,PCSrcE,ForwardAE,ForwardBE,StallD,StallF,FlushE,FlushD);
mux3to1 SrcA (RD1E,ResultW,ALUResultM,ForwardAE,SrcAE);
mux3to1 SrcB (RD2E,ResultW,ALUResultM,ForwardBE,SrcBE);
endmodule 

