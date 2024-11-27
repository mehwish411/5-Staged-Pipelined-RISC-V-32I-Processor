`timescale 1ns / 1ps
module Second_Register (clk, reset, clr,en,InstrF,PCF,PCplus4F, InstrD, PCD, PCplus4D);
input clk, reset, clr, en;
input [31:0] InstrF, PCF, PCplus4F;
output reg [31:0] InstrD, PCD, PCplus4D;

always @ (posedge clk)
begin
if (reset | clr)
begin
PCD      <= 0;
InstrD   <= 0;
PCplus4D <= 0;
end

else if (en)
begin
PCD      <= PCD;
InstrD   <= InstrD;
PCplus4D <= PCplus4D;
end

else 
begin
PCD      <= PCF;
InstrD   <= InstrF;
PCplus4D <= PCplus4F;
end

end

endmodule 