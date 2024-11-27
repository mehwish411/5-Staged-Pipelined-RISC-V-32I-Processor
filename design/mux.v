`timescale 1ns / 1ps
module mux(m,n,sel,out);
input [31:0]m,n;
input sel;
output [31:0]out;
assign out = sel ? n : m;
endmodule 