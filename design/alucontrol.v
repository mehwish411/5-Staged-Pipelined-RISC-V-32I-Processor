`timescale 1ns / 1ps
module alucontrol(aluop,funct3,funct7,operation);
input [1:0] aluop;
input [2:0] funct3;
input funct7;
output reg [2:0] operation;

  always @(*)
begin 
case(aluop)
2'b00: operation=3'b000;
2'b01: operation=3'b001;
2'b10: begin
       case(funct3)
       3'b000:operation=funct7? 3'b001 : 3'b000;
       3'b111:operation=3'b010;
       3'b110:operation=3'b011;
       3'b010:operation=3'b101;
       default: operation = 3'bxxx;
       endcase
       end
default: operation= 3'bxxx;
endcase
end
endmodule 