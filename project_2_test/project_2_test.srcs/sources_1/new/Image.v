`timescale 1ns / 1ps







/*
module refreshcounter(
input refresh_clock,
output reg [1:0] refreshcounter = 0
);
always@(posedge refresh_clock) refreshcounter <= refreshcounter +1;
endmodule


module anode_control(
input [1:0] refreshcounter,
output reg [3:0] anode=0
);

always@(refreshcounter)
begin
    case(refreshcounter)
        2'd0: anode=4'b1110;
        2'd1: anode=4'b1101;
        2'd2: anode=4'b1011;
        2'd3: anode=4'b0111;
    endcase
end
endmodule

module BCD_to_cathodes(
input [4:0] LED_BCD,
output reg [6:0] led=0
);

always@(LED_BCD)
begin
    case(LED_BCD)
        5'b00000: led = 7'b0000001; // "0"     
        5'b00001: led = 7'b1001111; // "1" 
        5'b00010: led = 7'b0010010; // "2" 
        5'b00011: led = 7'b0000110; // "3" 
        5'b00100: led = 7'b1001100; // "4" 
        5'b00101: led = 7'b0100100; // "5" 
        5'b00110: led = 7'b0100000; // "6" 
        5'b00111: led = 7'b0001111; // "7" 
        5'b01000: led = 7'b0000000; // "8"     
        5'b01001: led = 7'b0000100; // "9" 
        default: led = 7'b0000001; // "0"
        endcase
end
endmodule

module clock_divider(
input clk,
output reg divided_clk =0  
); 
localparam div_value = 4999;  
integer counter_value = 0;  

always@(posedge clk )
if(counter_value == div_value)
begin
    counter_value <= 0;
    divided_clk=divided_clk+1;
end 
else counter_value <= counter_value+1;

endmodule


module BCD_control(
input [4:0] digit1,
input [4:0] digit2,
input [4:0] digit3,
input [4:0] digit4,
input [1:0] refresh_counter,
output reg [4:0] DIG
);

always@ (refresh_counter)
begin
    case(refresh_counter)
        2'd0: DIG=digit1;
        2'd1: DIG=digit2;
        2'd2: DIG=digit3;
        2'd3: DIG=digit4;
    endcase
end

endmodule
*/

module vga_syncIndex(
clock,reset,         
input1,temp1
);

    input clock;
    input reset;
    input [4:0] input1;
    //output [7:0] temp1;
    reg [7:0] val;
    reg [7:0] curr_pixel;
    
   
   
   reg [39:0] color={8'd224,8'd0,8'd28,8'd252,8'd3}; // color array for checking the predifined colors
  reg [7:0] ytemp=8'd252;
   reg [7:0] white=8'd255;// background color
   //output reg [4:0] count=0;// count[0] for red, count[1] for black and so on... to be changed to five arrays for each color 
   //output [6:0] led;
   //output [3:0] Anode_Activate;
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
reg flag=0,flag_led=0;// it becomes 0 when radius is calculated for a circle and then whitening the circle occurs in always block 






//wire [1:0] rcounter;
//    wire refreshclk;

    
    integer ini=0;
   reg [15:0] red;
    reg [15:0] blue=0;
    reg [15:0] green=0;
    reg [15:0] black=0;
    reg [15:0] yellow=0;
    output reg [15:0] temp1;
    //wire [4:0] temp2;
    
 
  
 /* always @(*)
    begin

 end*/
always@(input1, yellow)
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
                color[7:0]: begin
                            red=red+1;
                            r=49;
                            top_most=addr;
                            end
                
                //color[15:8]: begin
                            // black=black+1;
                             //r=49;
                             //top_most=addr;
                             //end
                
                color[23:16]: begin
                              green=green+1;
                              r=49;
                              top_most=addr;
                              end
                
                ytemp: begin
                              yellow=yellow+1;
                              r=49;
                              flag=1;
                              read=1;
                              top_most=addr;
                              temp=top_most;
                              addr=top_most-49;
                              row=0;
                              column=0;
                              end
                
                color[39:32]: begin
                              blue=blue+1;
                              r=1;
                              top_most=addr;
                              end
                default: r=0;
            
            endcase
             if(addr <85999)
                begin
                //addra=addr;
                    addr = addr + 1;
                    end
                else
                    begin
                        addr = 0;
                        //flag_led=1;
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
                        //addra=addr;
                        column=column+1;
                        in=8'd255;
                    end
                    else
                    begin
                        flag=0;
                        addr=top_most+1;
                        read=0;
                     end
                     /*if(addr<=(top_most + (430*2*r) + r))
                        begin
                        in=8'd255;
                        if(addr>=temp+r)
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
                        end*/
                    end
                
               
           
        end    
       
       
       /*clock_divider a(clk,refreshclk);
    refreshcounter b(refreshclk,rcounter);
    anode_control c(rcounter,Anode_Activate);
    BCD_control e(((temp1%1000)%100)%10,((temp1%1000)%100)/10,0,temp1/1000,rcounter,temp2);
BCD_to_cathodes f(temp2,led);*/
       
       
       
    endmodule