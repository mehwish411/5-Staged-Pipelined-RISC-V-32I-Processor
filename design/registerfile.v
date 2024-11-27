`timescale 1ns / 1ps
module registerfile(rs1,rs2,rd,writedata,regwrite,rd1,rd2,clk);
input [4:0] rs1,rs2,rd;
input [31:0] writedata;
input regwrite,clk;
output [31:0] rd1,rd2;
reg [31:0] rf [31:0];
assign rd1 = rf[rs1];
assign rd2 = rf[rs2];
integer i;
always @(negedge clk)
if (regwrite)
 begin
 rf[rd] = writedata;
 end
initial 
begin
  for(i=0; i<32; i=i+1)
 begin
 rf[i] = 0;
 end
end
endmodule
