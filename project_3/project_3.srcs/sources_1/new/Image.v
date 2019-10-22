`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2018 04:26:40 PM
// Design Name: 
// Module Name: check
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01  - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module vga_syncIndex(
clock,reset,         //inputs - sel_module(select required function), reset(to switch on and off), val(give a value to adjust brightness and filters)                        // hsync and vsync for the working of monitor
red, green, blue,temp                    // red, green and blue output pixels
);

    input clock;
    input reset;
    output [7:0] temp;
    
   reg clk;
   initial begin
   clk =0;
   end
   always@(posedge clock)
   begin
    clk<=~clk;
   end
   
   
//lst = ["gray", "left", "right", "up", "down", "leftup", "leftdown", "rightup", "rightdown"] 

 
	output [3:0] red,green;
	output [3:0] blue;

 
	reg read = 0;
	reg [13:0] addra = 0;
	reg [7:0] in1 = 0;
	wire [7:0] out2;
	
	
blk_mem_gen_0  inst1(
  .clka(clk), // input clka
  .wea(read), // input [0 : 0] wea
  .addra(addra), // input [14 : 0] addra
  .ena(1),
  .dina(in1), // input [95 : 0] dina
  .douta(out2) // output [95 : 0] douta
);

 
   
 

assign red=0;
assign blue=0;
assign green=0;
assign temp= {out2[7], out2[6], out2[5], out2[4], out2[3], out2[2], out2[1], out2[0]};

/*always @(posedge clk)
	begin		
           
               //tempblue =  {out2[23], out2[22], out2[21], out2[20], out2[19], out2[18], out2[17], out2[16]};
                //tempgreen = {out2[15], out2[14], out2[13], out2[12], out2[11], out2[10], out2[9], out2[8]};
                temp= {out2[7], out2[6], out2[5], out2[4], out2[3], out2[2], out2[1], out2[0]};
                if(addra <18399)
                    addra = addra + 1;
                else
                    addra = 0;
            
           
        end    */
       
    endmodule

