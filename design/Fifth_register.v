`timescale 1ns / 1ps
module Fifth_register (clk, reset, RegWriteM, ResultSrcM, rdM, PCplus4M, RegWriteW, ResultSrcW, rdW, PCplus4W, ALUResultW, ReadDataW, ALUResultM, ReadDataM);
input clk, reset, RegWriteM; 
input [1:0] ResultSrcM;
input [4:0] rdM;
input [31:0] PCplus4M, ALUResultM, ReadDataM;
output reg RegWriteW;   
output reg [1:0] ResultSrcW;
output reg [4:0] rdW;
output reg [31:0] PCplus4W, ALUResultW, ReadDataW;

always @ (posedge clk)
begin
if (reset)
begin
PCplus4W   <= 0;
rdW        <= 0;
ResultSrcW <= 0;
RegWriteW  <= 0;
ALUResultW <= 0;
ReadDataW  <= 0;
end

else 
begin
PCplus4W   <= PCplus4M;
rdW        <= rdM;
ResultSrcW <= ResultSrcM;
RegWriteW  <= RegWriteM;
ALUResultW <= ALUResultM;
ReadDataW  <= ReadDataM;
end

end

endmodule 