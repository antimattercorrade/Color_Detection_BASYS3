`timescale 1ns / 1ps


module vga_syncIndex(
clock,reset,         
red, green, blue,temp                    
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
  .clka(clk), 
  .wea(read), 
  .addra(addra), 
  .ena(1),
  .dina(in1), 
  .douta(out2) 
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

