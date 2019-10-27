`timescale 1ns / 1ps






module vga_syncIndex(
clock,reset,         
input1,temp1
);

    input clock;
    input reset;
    input [4:0] input1;
    
    reg [7:0] val;
    reg [7:0] curr_pixel;
    
   
   
  // reg [39:0] color={8'd224,8'd0,8'd28,8'd252,8'd3}; // color array for checking the predifined colors
  reg [7:0] ytemp=8'd252;
  reg [7:0] rtemp=8'd224;
  reg [7:0] btemp=8'd3;
  reg [7:0] gtemp=8'd28;
  reg [7:0] bltemp=8'd0;
  
   reg [7:0] white=8'd255;// background color

   reg [16:0] top_most=0,temp=0;
   integer i=0,j=0;
   reg r=0;//radius
   wire rd;
   reg [7:0] out1;// takes output from BRAM in read mode
 
	reg read = 0;// read==0 read mode ... read==1 write mode
	reg [16:0] addr = 0;
	//output reg [16:0] addra;
	reg [7:0] in = 0;// inuput to BRAM in write mode
	wire [7:0] out;
	
blk_mem_gen_0  inst1(
  .clka(clock), 
  .wea(read), 
  .addra(addr), 
  .ena(1),
  .dina(in), 
  .douta(out) 
);
reg flag=0;// it becomes 0 when radius is calculated for a circle and then whitening the circle occurs in always block 






    
    integer ini=0;
   reg [15:0] red;
    reg [15:0] blue=0;
    reg [15:0] green=0;
    reg [15:0] black=0;
    reg [15:0] yellow=0;
    output reg [15:0] temp1;
  
    

always@(input1, yellow,red,blue,black,green)
begin
case(input1)
 5'b00001: begin
            temp1=red;
            end
 5'b00010: begin
       
            temp1=blue;
            end
 5'b00100: begin
            
            temp1=black;
            end  
 5'b01000: begin
            
            temp1=green;
            end 
 5'b10000: begin
            
            temp1=yellow;
            end 
 default: temp1 =0; 
 endcase
end

    

always@(posedge clock)
begin
if(ini<=3)
    ini=ini+1;
end




reg [15:0] row,column;
always @(posedge clock)
	begin	
	   
	                   
	      	
	   if(flag==0 & ini==4)// check for color in array and make r=49, store top most address, increase specific color count
	       begin 
            val={out[7],out[6],out[5],out[4],out[3],out[2],out[1],out[0]};
            curr_pixel=val;
            case(val)
                rtemp: begin
                            red=red+1;
                            r=49;
                            flag=1;
                            read=1;
                            top_most=addr;
                            addr=top_most-49;
                            row=0;
                            column=0;
                            end
                
                bltemp: begin
                            black=black+1;
                            r=49;
                            flag=1;
                            read=1;
                            top_most=addr;
                            addr=top_most-49;
                            row=0;
                            column=0;
                             end
                
                gtemp: begin
                             green=green+1;
                            r=49;
                            flag=1;
                            read=1;
                            top_most=addr;
                            addr=top_most-49;
                            row=0;
                            column=0;
                              end
                
                ytemp: begin
                              yellow=yellow+1;
                              r=49;
                              flag=1;
                              read=1;
                              top_most=addr;
                              //temp=top_most;
                              addr=top_most-49;
                              row=0;
                              column=0;
                              end
                
                btemp: begin
                              blue=blue+1;
                            r=49;
                            flag=1;
                            read=1;
                            top_most=addr;
                            addr=top_most-49;
                            row=0;
                            column=0;
                              end
                default: r=0;
            
            endcase
             if(addr <85999)
                begin
                    addr = addr + 1;
                    end
                else
                    begin
                        addr = 0;
                    end
            
           /* if(r==49)
                begin
                    while(i<=85999 & j==0)
                        begin
                            if(curr_pixel!=val)
                                j=1;
                            addr = addr + (431*r);
                            curr_pixel={out[7],out[6],out[5],out[4],out[3],out[2],out[1],out[0]};
                            r=r+1;
                            i=i+1;
                        end
                     //out1=out;
                     //radius inst2 (.clock1(clk),.curr_pixel(curr_pixel),.val(val),.addr(addr),.out(out1),.r(r),.rd(rd));
                     flag=1;
                    temp=top_most;
                    addr=temp-r-1;
                    read=1;
                  
                  end*/
                     
               end
               else if(flag==1)// whiten the rectangular area around the circle
                    begin
                    if(row<=2*49)
                    begin
                        if(column>2*49)
                        begin
                            row=row+1;
                            column=0;
                        end
                        addr=top_most-49+(column)+(430*row);
                        column=column+1;
                        in=8'd255;
                    end
                    else
                    begin
                        flag=0;
                        addr=top_most+1;
                        read=0;
                     end
                    end
                
               
           
        end    
       
       
    endmodule