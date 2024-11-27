`timescale 1ns / 1ps
module First_register (clk, reset, enable, PC, PCF);

input clk, reset, enable;
input [31:0] PC;
output reg [31:0] PCF;

always @ (posedge clk)
begin
if (reset)
PCF <= 0;

else if (enable)
PCF <= PCF;

else
PCF <= PC;

end

endmodule
