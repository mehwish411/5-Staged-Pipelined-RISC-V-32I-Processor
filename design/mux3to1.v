`timescale 1ns / 1ps
module mux3to1(m,n,o,sel,out);
input [31:0]m,n,o;
input [1:0] sel;
output [31:0]out;
assign out = (sel==2'b00) ? m : 
				 (sel==2'b01) ? n :
				 (sel==2'b10) ? o : 32'bx;
endmodule 