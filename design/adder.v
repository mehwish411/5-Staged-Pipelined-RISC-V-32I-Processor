`timescale 1ns / 1ps
module adder(s,t,u);
input [31:0] s,t;
output [31:0] u;
assign u = s+t;
endmodule