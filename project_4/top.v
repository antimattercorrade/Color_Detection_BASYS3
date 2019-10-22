`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/05/2015 12:39:26 AM
// Design Name: 
// Module Name: top
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

module top(
input [7:0]sw,
input btn0,
input btn1,
input clk,
output TxD,
output TxD_debug,
output transmit_debug,
output button_debug, 
output clk_debug
); 

wire transmit;
assign TxD_debug = TxD;
assign transmit_debug = transmit;
assign button_debug = btn1;
assign clk_debug = clk;


transmit_debouncing D2 (.clk(clk), .btn1(btn1), .transmit(transmit));
transmitter T1 (.clk(clk), .reset(btn0),.transmit(transmit),.TxD(TxD),.data(sw));


endmodule
