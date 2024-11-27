`timescale 1ns / 1ps
module Fourth_register (clk, reset, RegWriteM,MemWriteM, ResultSrcM, rdM, PCplus4M, RegWriteE, MemWriteE, ResultSrcE, rdE, PCplus4E, ALUResultE, WriteDataE, ALUResultM, WriteDataM);
input clk, reset, RegWriteE,MemWriteE; 
input [1:0] ResultSrcE;
input [4:0] rdE;
input [31:0] PCplus4E, ALUResultE, WriteDataE;
output reg RegWriteM,MemWriteM;   
output reg [1:0] ResultSrcM;
output reg [4:0] rdM;
output reg [31:0] PCplus4M, ALUResultM, WriteDataM;

always @ (posedge clk)
begin
if (reset)
begin
PCplus4M   <= 0;
rdM        <= 0;
ResultSrcM <= 0;
RegWriteM  <= 0;
MemWriteM  <= 0;
ALUResultM <= 0;
WriteDataM <= 0;
end

else
begin 
PCplus4M   <= PCplus4E;
rdM        <= rdE;
ResultSrcM <= ResultSrcE;
RegWriteM  <= RegWriteE;
MemWriteM  <= MemWriteE;
ALUResultM <= ALUResultE;
WriteDataM <= WriteDataE;
end

end

endmodule 