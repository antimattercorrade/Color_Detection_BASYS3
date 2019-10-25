`timescale 1ns / 1ps

module vga_syncIndex(
clock,reset,         
count                    
);

    input clock;
    input reset;
    //output [7:0] temp1;
    reg [7:0] val,curr_pixel;
    
   reg clk;
   initial begin
   clk =0;
   end
   always@(posedge clock)
   begin
    clk<=~clk;
   end
   
   reg [39:0] color={8'd224,8'd0,8'd28,8'd252,8'd3}; // color array for checking the predifined colors
   reg [7:0] white=8'd255;// background color
   output reg [4:0] count=0;// count[0] for red, count[1] for black and so on... to be changed to five arrays for each color 
   reg [16:0] top_most=0,temp=0;
   integer i=0,j=0;
   reg r=0;//radius
   wire rd;
   reg [7:0] out1;// takes output from BRAM in read mode
 
	reg read = 0;// read==0 read mode ... read==1 write mode
	reg [16:0] addr = 0;
	reg [7:0] in = 0;// inuput to BRAM in write mode
	wire [7:0] out;
	
blk_mem_gen_0  inst1(
  .clka(clk), 
  .wea(read), 
  .addra(addr), 
  .ena(1),
  .dina(in), 
  .douta(out) 
);
reg flag=0;// it becomes 0 when radius is calculated for a circle and then whitening the circle occurs in always block 

always @(posedge clk)
	begin		
	   if(flag==0)// check for color in array and make r=49, store top most address, increase specific color count
	       begin 
            val={out[7],out[6],out[5],out[4],out[3],out[2],out[1],out[0]};
            curr_pixel=val;
            case(val)
                color[7:0]: begin
                            count[0]=count[0]+1;
                            r=49;
                            top_most=addr;
                            end
                
                color[15:8]: begin
                             count[1]=count[1]+1;
                             r=49;
                             top_most=addr;
                             end
                
                color[23:16]: begin
                              count[2]=count[2]+1;
                              r=49;
                              top_most=addr;
                              end
                
                color[31:24]: begin
                              count[3]=count[3]+1;
                              r=49;
                              top_most=addr;
                              end
                
                color[39:32]: begin
                              count[4]=count[4]+1;
                              r=1;
                              top_most=addr;
                              end
                default: r=0;
            
            endcase
            if(r==49)
                begin
                    /*while(i<=85999 & j==0)
                        begin
                            if(curr_pixel!=val)
                                j=1;
                            addr = addr + (431*r);
                            curr_pixel={out[7],out[6],out[5],out[4],out[3],out[2],out[1],out[0]};
                            r=r+1;
                            i=i+1;
                        end*/
                     //out1=out;
                     //radius inst2 (.clock1(clk),.curr_pixel(curr_pixel),.val(val),.addr(addr),.out(out1),.r(r),.rd(rd));
                     flag=1;
                    temp=top_most;
                    addr=temp-r-1;
                    read=1;
                  
                  end
                     
               end
               else // whiten the rectangular area around the circle
                    begin
                     if(addr<=(top_most + (430*2*r) + r))
                        begin
                        in=8'd255;
                        if(addr==temp+r)
                            begin
                                temp=temp+430;
                                addr = temp-r -1;
                            end
                        //addr = addr + 1;
                        end
                      else
                        begin
                            flag=0;
                            addr=top_most;
                            read=0;
                        end
                    end
                
                if(addr <85999)
                    addr = addr + 1;
                else
                    addr = 0;
            
           
        end    
       
    endmodule


