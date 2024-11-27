`timescale 1ns / 1ps
module datamem(mem_addr,write_data,clk,memwrite,read_data);
input [31:0] mem_addr,write_data;
input clk,memwrite;
output [31:0] read_data;
reg [7:0] ram_dm [109:0];
integer i;
initial 
begin
 for(i=0; i<109; i=i+4) 
 ram_dm[i] = i;
end
initial 
begin
 for(i=0; i<109; i=i+1) 
 ram_dm[i] = 0;
end
assign read_data = {ram_dm[mem_addr+3],ram_dm[mem_addr+2],ram_dm[mem_addr+1],ram_dm[mem_addr]};
always @(posedge clk)
begin
 if (memwrite)
 {ram_dm[mem_addr+3],ram_dm[mem_addr+2],ram_dm[mem_addr+1],ram_dm[mem_addr]} = write_data;
end
endmodule 