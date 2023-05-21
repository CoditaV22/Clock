`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2023 06:48:27 PM
// Design Name: 
// Module Name: tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb();

reg clk , reset , en;
wire [31:0] s0 , s1 , m0 , m1;

initial
begin
clk = 0;
forever #1 clk = ~clk;
end

initial
begin
reset <= 1;
en <= 0;
#4
reset <= 0;
en <= 1;

#1000 $stop();
end

top DUT
(
    .clk(clk),
    .en(en),
    .reset(reset),
    .sec0(s0),
    .sec1(s1),
    .min0(m0),
    .min1(m1)
);

endmodule
