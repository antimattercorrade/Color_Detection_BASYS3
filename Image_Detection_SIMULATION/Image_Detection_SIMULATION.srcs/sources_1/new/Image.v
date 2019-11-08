`timescale 1ns / 1ps





module vga_syncIndex(
clock,reset,         
input1,temp1,val,addra,radius,current_rgb,red,blue,green,yellow,aqua,fuchsia,lime,maroon,navy,olive,purple,silver,teal,black,smallo,mediumo,largeo
);

    input clock;
    input reset;
    input [13:0] input1;
    
    output reg [7:0] val;
    reg [7:0] curr_pixel;
    
    reg [2:0] redsmall=0;
    reg [2:0] redmedium=0;
    reg [2:0] redlarge=0;
    
     reg [2:0] greensmall=0;
    reg [2:0] greenmedium=0;
    reg [2:0] greenlarge=0;
    
     reg [2:0] bluesmall=0;
    reg [2:0] bluemedium=0;
    reg [2:0] bluelarge=0;
    
     reg [2:0] yellowsmall=0;
    reg [2:0] yellowmedium=0;
    reg [2:0] yellowlarge=0;
    
     reg [2:0] aquasmall=0;
    reg [2:0] aquamedium=0;
    reg [2:0] aqualarge=0;
    
     reg [2:0] fuchsiasmall=0;
    reg [2:0] fuchsiamedium=0;
    reg [2:0] fuchsialarge=0;
    
     reg [2:0] maroonsmall=0;
    reg [2:0] maroonmedium=0;
    reg [2:0] maroonlarge=0;
    
     reg [2:0] limesmall=0;
    reg [2:0] limemedium=0;
    reg [2:0] limelarge=0;
    
     reg [2:0] olivesmall=0;
    reg [2:0] olivemedium=0;
    reg [2:0] olivelarge=0;
    
     reg [2:0] navysmall=0;
    reg [2:0] navymedium=0;
    reg [2:0] navylarge=0;
    
     reg [2:0] silversmall=0;
    reg [2:0] silvermedium=0;
    reg [2:0] silverlarge=0;
    
     reg [2:0] tealsmall=0;
    reg [2:0] tealmedium=0;
    reg [2:0] teallarge=0;
    
     reg [2:0] purplesmall=0;
    reg [2:0] purplemedium=0;
    reg [2:0] purplelarge=0;
    
     reg [2:0] blacksmall=0;
    reg [2:0] blackmedium=0;
    reg [2:0] blacklarge=0;
    
    
   
  // reg [39:0] color={8'd224,8'd0,8'd28,8'd252,8'd3}; // color array for checking the predifined colors
  reg [7:0] ytemp=8'd252; //yellow
  reg [7:0] rtemp=8'd224;  //red
  reg [7:0] btemp=8'd3;      //blue
  reg [7:0] gtemp=8'd28;    //green
  reg [7:0] atemp=8'd31;    //aqua
  reg [7:0] ftemp=8'd227;    //fuchsia
  reg [7:0] ltemp=8'd188;    //lime
  reg [7:0] mtemp=8'd128;    //maroon
  reg [7:0] ntemp=8'd2;      //navy
  reg [7:0] otemp=8'd144;     //olive
  reg [7:0] ptemp=8'd130;     //purple
  reg [7:0] stemp=8'd219;      //silver
  reg [7:0] ttemp=8'd18;     //teal
  
  reg [7:0] bltemp=8'd0;    //black
  
   reg [7:0] white=8'd255;// background color

   reg [16:0] top_most=0,temp=0;
   integer i=0,j=0;
   reg r=0;//radius
   wire rd;
   wire [7:0] out1;// takes output from BRAM in read mode
 
	reg read = 0;// read==0 read mode ... read==1 write mode
	reg [16:0] addr = 0;
	output reg [16:0] addra;
	reg [7:0] in = 0;// inuput to BRAM in write mode
	reg [7:0] in1=0;
	wire [7:0] out;
	
blk_mem_gen_0  inst1(
  .clka(clock), 
  .wea(read), 
  .addra(addr), 
  .ena(1),
  .dina(in), 
  .douta(out) 
);
/*
blk_mem_gen_0  inst2(
  .clka(clock), 
  .wea(0), 
  .addra(addr), 
  .ena(1),
  .dina(in1), 
  .douta(out1) 
);*/
reg flag=0;// it becomes 0 when radius is calculated for a circle and then whitening the circle occurs in always block 






    
    integer ini=0;
    output reg [15:0] red=0;
    output reg [15:0] blue=0;
    output reg [15:0] green=0;
    output reg [15:0] aqua=0;
    output reg [15:0] yellow=0;
    output reg [15:0] maroon=0;
    output reg [15:0] silver=0;
    output reg [15:0] teal=0;
    output reg [15:0] lime=0;
    output reg [15:0] olive=0;
    output reg [15:0] fuchsia=0;
    output reg [15:0] navy=0;
    output reg [15:0] purple=0;
    output reg [15:0] black=0;
    
    
    
    output reg [2:0] smallo;
    output reg [2:0] mediumo;
    output reg [2:0] largeo;
    output reg [15:0] temp1;
  
    

always@(input1, yellow,red,blue,green,aqua,maroon,silver,teal,lime,olive,fuchsia,navy,purple,redsmall,
   redmedium,
    redlarge,
    
     greensmall,
     greenmedium,
    greenlarge,
    
      bluesmall,
    bluemedium,
     bluelarge,
    
     yellowsmall,
    yellowmedium,
    yellowlarge,
    
    aquasmall,
     aquamedium,
   aqualarge,
    
 fuchsiasmall,
  fuchsiamedium,
 fuchsialarge,
    
 maroonsmall,
    maroonmedium,
  maroonlarge,
    
      limesmall,
   limemedium,
  limelarge,
    
   olivesmall,
  olivemedium,
  olivelarge,
 navysmall,
     navymedium,
    navylarge,
    
     silversmall,
     silvermedium,
     silverlarge,
    
     tealsmall,
   tealmedium,
 teallarge,
    
      purplesmall,
   purplemedium,
     purplelarge,
    
     blacksmall,
     blackmedium,
    blacklarge)
begin
case(input1)
 14'b00000000000001: begin
                    temp1=red;
                    smallo=redsmall;
                    mediumo=redmedium;
                    largeo=redlarge;
                    end
 14'b00000000000010: begin
       
                    temp1=blue;
                    smallo=bluesmall;
                    mediumo=bluemedium;
                    largeo=bluelarge;
                    end
 14'b00000000000100: begin
            
                    temp1=green;
                    smallo=greensmall;
                    mediumo=greenmedium;
                    largeo=greenlarge;
                    end  
 14'b00000000001000: begin
            
                    temp1=yellow;
                    smallo=yellowsmall;
                    mediumo=yellowmedium;
                    largeo=yellowlarge;
                    end 
 14'b00000000010000: begin
            
                    temp1=aqua;
                    smallo=aquasmall;
                    mediumo=aquamedium;
                    largeo=aqualarge;
                    end 
 14'b00000000100000: begin
            
                    temp1=maroon;
                    smallo=maroonsmall;
                    mediumo=maroonmedium;
                    largeo=maroonlarge;
                    end 
 14'b00000001000000: begin
            
                    temp1=silver;
                    smallo=silversmall;
                    mediumo=silvermedium;
                    largeo=silverlarge;
                    end 
 14'b00000010000000: begin
            
                    temp1=teal;
                    smallo=tealsmall;
                    mediumo=tealmedium;
                    largeo=teallarge;
                    end 
 14'b00000100000000: begin
            
                    temp1=lime;
                    smallo=limesmall;
                    mediumo=limemedium;
                    largeo=limelarge;
                    end 
 14'b00001000000000: begin
            
                    temp1=olive;
                    smallo=olivesmall;
                    mediumo=olivemedium;
                    largeo=olivelarge;
                    end 
 14'b00010000000000: begin
            
                    temp1=fuchsia;
                    smallo=fuchsiasmall;
                    mediumo=fuchsiamedium;
                    largeo=fuchsialarge;
                    end 
 14'b00100000000000: begin
            
                    temp1=navy;
                    smallo=navysmall;
                    mediumo=navymedium;
                    largeo=navylarge;
                    end 
 14'b01000000000000: begin
            
                    temp1=purple;
                    smallo=purplesmall;
                    mediumo=purplemedium;
                    largeo=purplelarge;
                    end 
 14'b10000000000000: begin
            
                    temp1=black;
                    smallo=blacksmall;
                    mediumo=blackmedium;
                    largeo=blacklarge;
                    end 
 
 default: temp1 =0; 
 endcase
end
reg [7:0] temp3;
    

always@(posedge clock)
begin
if(ini<=3)
begin
    temp3=out1;
    ini=ini+1;
    end
    
   else
   ini=ini+1;
end

reg tolerance=5;


reg [15:0] row,column;
reg flag2=0;
//reg [20:0]count=0;

reg [7:0]top_most_rgb;
output reg [7:0] current_rgb;
output reg [7:0]radius = 0;
always @(posedge clock)
	begin	
	   
	                   
	      	
	   if(flag==0 & ini>=4)// check for color in array and make r=49, store top most address, increase specific color count
	       begin 
            val=out;
            curr_pixel=val;
            case(val)
                rtemp: begin
                            red=red+1;
                            // r=49;
                            flag=1;
                            radius = 0;
                          
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;


                            end
                
                gtemp: begin
                             green=green+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                              end
                
                ytemp: begin
                              yellow=yellow+1;
                              // r=49;
                              radius=0;
                              flag=1;
                              read=0;
                              top_most=addr;
                              top_most_rgb = val;
                              //temp=top_most;
                              // addr=top_most-49;
                              row=0;
                              column=0;
                              end
                
                btemp: begin
                              blue=blue+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                              end
                                               
                atemp: begin
                            aqua=aqua+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                             end
                                
                ftemp: begin
                            fuchsia=fuchsia+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                             end
                                
                ltemp: begin
                            lime=lime+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                             end
                                
                mtemp: begin
                            maroon=maroon+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                             end
                                
                ntemp: begin
                            navy=navy+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                             end
                                
                otemp: begin
                            olive=olive+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                             end
                                
                ptemp: begin
                            purple=purple+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                             end
                                
                stemp: begin
                            silver=silver+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                             end
                                
               ttemp: begin
                            teal=teal+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                             end
                bltemp: begin
                            black=black+1;
                            // r=49;
                            radius=0;
                            flag=1;
                            read=0;
                            top_most=addr;
                            top_most_rgb = val;
                            // addr=top_most-49;
                            row=0;
                            column=0;
                             end
                
                default: ;
            
            endcase
             if(addr <85999 & flag==0 & ini>=4)
                begin
                    addr = addr + 1;
                    addra=addr;
                    end
               else if(flag==0)
                begin
                    addr=85999;
                    addra=addr;
                end
             
                     
               end
               if(flag==1)
                  begin                         
                  if(flag2 == 0)
                    begin
                      current_rgb = out;
    if((top_most_rgb != out))
            begin
              flag2 = 1;                   
     
                                                                    
                          
                          
                          
                          
                          
                          
                          
                          addr = top_most;
                          read = 1;
                        end
                      addr = top_most + 431*radius;
                      addra=addr;
                      radius = radius + 1;
                    end
                  if(flag2 == 1)
                  begin
                     
                    if(row<=2*(radius+tolerance))                       // whiten the rectangular area around the circle
                    begin
                        if(column>2*(radius+tolerance))
                        begin
                            row=row+1;
                            column=0;
                        end
                        addr=top_most-radius-tolerance+(column)+(430*row)-430*tolerance;
                        addra=addr;
                        column=column+1;
                        in=8'd255;
                    end
                    else
                    begin
                    
                     case(top_most_rgb)
               rtemp: begin
              
                            if(radius<=10)
                                redsmall=redsmall+1;
                               else if(radius<=30)
                                redmedium=redmedium+1;
                               else
                                redlarge=redlarge+1;

                            end
                
                gtemp: begin
                             if(radius<=10)
                               greensmall=greensmall+1;
                               else if(radius<=30)
                                greenmedium=greenmedium+1;
                               else
                                greenlarge=greenlarge+1;
                              end
                
                ytemp: begin
                              if(radius<=10)
                                yellowsmall=yellowsmall+1;
                               else if(radius<=30)
                                yellowmedium=yellowmedium+1;
                               else
                                yellowlarge=yellowlarge+1;
                              end
                
                btemp: begin
                              if(radius<=10)
                                bluesmall=bluesmall+1;
                               else if(radius<=30)
                                bluemedium=bluemedium+1;
                               else
                                bluelarge=bluelarge+1;
                              end
                                               
                atemp: begin
                            if(radius<=10)
                                aquasmall=aquasmall+1;
                               else if(radius<=30)
                                aquamedium=aquamedium+1;
                               else
                                aqualarge=aqualarge+1;
                             end
                                
                ftemp: begin
                            if(radius<=10)
                                fuchsiasmall=fuchsiasmall+1;
                               else if(radius<=30)
                                fuchsiamedium=fuchsiamedium+1;
                               else
                                fuchsialarge=fuchsialarge+1;
                             end
                                
                ltemp: begin
                            if(radius<=10)
                                limesmall=limesmall+1;
                               else if(radius<=30)
                                limemedium=limemedium+1;
                               else
                                limelarge=limelarge+1;
                             end
                                
                mtemp: begin
                            if(radius<=10)
                                maroonsmall=maroonsmall+1;
                               else if(radius<=30)
                                maroonmedium=maroonmedium+1;
                               else
                                maroonlarge=maroonlarge+1;
                             end
                                
                ntemp: begin
                            if(radius<=10)
                                navysmall=navysmall+1;
                               else if(radius<=30)
                                navymedium=navymedium+1;
                               else
                                navylarge=navylarge+1;
                             end
                                
                otemp: begin
                            if(radius<=10)
                                olivesmall=olivesmall+1;
                               else if(radius<=30)
                               olivemedium=olivemedium+1;
                               else
                                olivelarge=olivelarge+1;
                             end
                                
                ptemp: begin
                            if(radius<=10)
                                purplesmall=purplesmall+1;
                               else if(radius<=30)
                               purplemedium=purplemedium+1;
                               else
                                purplelarge=purplelarge+1;
                             end
                                
                stemp: begin
                            if(radius<=10)
                                silversmall=silversmall+1;
                               else if(radius<=30)
                                silvermedium=silvermedium+1;
                               else
                                silverlarge=silverlarge+1;
                             end
                                
               ttemp: begin
                            if(radius<=10)
                                tealsmall=tealsmall+1;
                               else if(radius<=30)
                                tealmedium=tealmedium+1;
                               else
                                teallarge=teallarge+1;
                             end
                bltemp: begin
                            if(radius<=10)
                               blacksmall=blacksmall+1;
                               else if(radius<=30)
                               blackmedium=blackmedium+1;
                               else
                                blacklarge=blacklarge+1;
                             end
                          
                     default:;
                     
                       endcase
                    
                    
                        radius=0;
                        flag=0;
                        flag2 = 0;
                        addr=top_most+1;
                       addra=addr;
                        read=0;
                     end
                     end
                    end
                
               
           
        end    
       
       
    endmodule