`timescale 1ns / 1ps
module alu(a,b,aluoperation,zero,result);
input [31:0] a,b;
input [2:0]aluoperation;
output reg zero;
output reg [31:0] result;

 always @ (*)
begin
 case(aluoperation)
 3'b000: result=a+b;
 3'b001: result=a-b;
 3'b101: result=a<b;
 3'b011: result=a|b;
 3'b010: result=a&b;
 default: result=32'bx;
 endcase
end
always @ (result)
begin 
 if (result)
 zero = 0;
 else
 zero = 1;
end
endmodule