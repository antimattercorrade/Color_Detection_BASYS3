`timescale 1ns / 1ps
module Color_Detection(clock,switch_input,count,small_radius,medium_radius,large_radius);
    input clock;
    input [12:0] switch_input;
    
    reg [7:0] val;
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
   
	// store the predefined colors
	reg [7:0] ytemp=8'd252;  //yellow
	reg [7:0] rtemp=8'd224;  //red
	reg [7:0] btemp=8'd3;    //blue
	reg [7:0] gtemp=8'd28;   //green
	reg [7:0] atemp=8'd31;   //aqua
	reg [7:0] ftemp=8'd227;  //fuchsia
	reg [7:0] ltemp=8'd188;  //lime
	reg [7:0] mtemp=8'd128;  //maroon
	reg [7:0] ntemp=8'd2;    //navy
	reg [7:0] otemp=8'd144;  //olive
	reg [7:0] ptemp=8'd130;  //purple
	reg [7:0] stemp=8'd219;  //silver
	reg [7:0] ttemp=8'd18;   //teal
  
	//reg [7:0] white=8'd255;  //background color
	reg [7:0] background;

	reg [16:0] top_most=0,temp=0;
	integer i=0,j=0;
 
	reg read = 0;          //read==0 read mode ... read==1 write mode
	reg [16:0] addr = 0;
	reg [7:0] in = 0;     // inuput to BRAM in write mode
	wire [7:0] out;
	
	blk_mem_gen_0  inst1(
  	.clka(clock), 
  	.wea(read), 
  	.addra(addr), 
  	.ena(1),
  	.dina(in), 
  	.douta(out) 
	);

	reg flag=0;       // it becomes 0 when radius is calculated for a circle 
    
    integer ini=0;
    
    reg [3:0] red=0;
    reg [3:0] blue=0;
    reg [3:0] green=0;
    reg [3:0] aqua=0;
    reg [3:0] yellow=0;
    reg [3:0] maroon=0;
    reg [3:0] silver=0;
    reg [3:0] teal=0;
    reg [3:0] lime=0;
    reg [3:0] olive=0;
    reg [3:0] fuchsia=0;
    reg [3:0] navy=0;
    reg [3:0] purple=0;
    
    output reg [2:0] small_radius;   // 0 to 15 pixels
    output reg [2:0] medium_radius;  // 16 to 30 pixels
    output reg [2:0] large_radius;   // greater than 30 pixels
    output reg [3:0] count;
  
    

	always@(switch_input,yellow,red,blue,green,aqua,maroon,silver,teal,lime,olive,fuchsia,navy,purple,redsmall,redmedium,redlarge,
                greensmall,greenmedium,greenlarge,bluesmall,bluemedium,bluelarge,yellowsmall,yellowmedium,yellowlarge,aquasmall,
                aquamedium,aqualarge,fuchsiasmall,fuchsiamedium,fuchsialarge,maroonsmall,maroonmedium,maroonlarge,limesmall,
                limemedium,limelarge,olivesmall,olivemedium,olivelarge,navysmall,navymedium,navylarge,silversmall,silvermedium,
                silverlarge,tealsmall,tealmedium,teallarge,purplesmall,purplemedium,purplelarge)
	begin
		case(switch_input)
			13'b0000000000001: 	begin
                    			     	count=red;
                    				small_radius=redsmall;
                    				medium_radius=redmedium;
                    				large_radius=redlarge;
                    				end

 			13'b0000000000010: 	begin
                    				count=blue;
                    				small_radius=bluesmall;
                    				medium_radius=bluemedium;
                    				large_radius=bluelarge;
                    				end

			13'b0000000000100: 	begin    
                    				count=green;
                    				small_radius=greensmall;
                    				medium_radius=greenmedium;
                    				large_radius=greenlarge;
                    				end
  
 			13'b0000000001000: 	begin
                    				count=yellow;
                    				small_radius=yellowsmall;
                   	 			medium_radius=yellowmedium;
                    				large_radius=yellowlarge;
                    				end
 
 			13'b0000000010000: 	begin
        				        count=aqua;
                    				small_radius=aquasmall;
                    				medium_radius=aquamedium;
                    				large_radius=aqualarge;
                    				end
 
 			13'b0000000100000: 	begin
                    				count=maroon;
                    				small_radius=maroonsmall;
                    				medium_radius=maroonmedium;
                    				large_radius=maroonlarge;
                    				end
 
 			13'b0000001000000: 	begin
                    				count=silver;
                    				small_radius=silversmall;
                    				medium_radius=silvermedium;
                    				large_radius=silverlarge;
                    				end
 
	 		13'b0000010000000: 	begin
                    				count=teal;
                    				small_radius=tealsmall;
                    				medium_radius=tealmedium;
                    				large_radius=teallarge;
                    				end
 
 			13'b0000100000000: 	begin
                    				count=lime;
                    				small_radius=limesmall;
                    				medium_radius=limemedium;
                    				large_radius=limelarge;
                    				end
 
 			13'b0001000000000: 	begin
                    				count=olive;
                    				small_radius=olivesmall;
                    				medium_radius=olivemedium;
                    				large_radius=olivelarge;
                    				end
 
 			13'b0010000000000: 	begin
                    				count=fuchsia;
                    				small_radius=fuchsiasmall;
                    				medium_radius=fuchsiamedium;
                    				large_radius=fuchsialarge;
                    				end
 
 			13'b0100000000000: 	begin
                    				count=navy;
                    				small_radius=navysmall;
                    				medium_radius=navymedium;
                    				large_radius=navylarge;
                    				end
 
 			13'b1000000000000: 	begin
                    				count=purple;
                    				small_radius=purplesmall;
                    				medium_radius=purplemedium;
                    				large_radius=purplelarge;
                    				end
 

 
 			default: 	begin
 			            count=0; 
 			            small_radius=0;
 			            medium_radius=0;
 			            large_radius=0;
 			            end
	 	endcase
	end
	reg [7:0] temp3;
    	always@(posedge clock)
	begin
		if(ini<=3)
		begin
    			temp3=out;
    			ini=ini+1;
    		end
    
   		else
   			ini=ini+1;
	end

	reg tolerance=5;

	reg [15:0] row,column;
	reg flag2=0;

	reg [7:0]top_most_rgb;
	reg [7:0] current_rgb;
	reg [7:0]radius = 0;
	reg ct=0;
	always @(posedge clock)
	begin	   
	                 
		if(flag==0 & ini>=4)     // check for color in array, store top most address, increase specific color count
	       	begin 
			if(ct==0)
			begin
				background=out;
				ct=1;
			end
            		val=out;
            		curr_pixel=val;
            		if(val!=background)
            		begin
            		case(val)
                		rtemp: 	begin
                            		red=red+1;
                            		flag=1;
                            		radius = 0;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                            		end
                
                		gtemp: 	begin
                             		green=green+1;
                            		radius=0;
                            		flag=1;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                              		end
                
                		ytemp: 	begin
                              		yellow=yellow+1;
                              		radius=0;
                              		flag=1;
                              		read=0;
                              		top_most=addr;
                              		top_most_rgb = val;
                              		row=0;
                              		column=0;
                              		end
                
                		btemp: 	begin
                              		blue=blue+1;
                            		radius=0;
                            		flag=1;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                              		end
                                               
                		atemp: 	begin
                            		aqua=aqua+1;
                            		radius=0;
                            		flag=1;
                           		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                             		end
                                
                		ftemp: 	begin
                            		fuchsia=fuchsia+1;
                            		radius=0;
                            		flag=1;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                             		end
                                
                		ltemp: 	begin
                            		lime=lime+1;
                           	 	radius=0;
                            		flag=1;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                             		end
                                
                		mtemp: 	begin
                            		maroon=maroon+1;
                            		radius=0;
                            		flag=1;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                             		end
                                
                		ntemp: 	begin
                            		navy=navy+1;
                            		radius=0;
                            		flag=1;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                             		end
                                
                		otemp: 	begin
                            		olive=olive+1;
                            		radius=0;
                            		flag=1;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                             		end
                                
                		ptemp: 	begin
                            		purple=purple+1;
                            		radius=0;
                            		flag=1;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                             		end
                                
                		stemp: 	begin
                            		silver=silver+1;
                            		radius=0;
                            		flag=1;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                             		end
                                
               			ttemp: 	begin
                            		teal=teal+1;
                            		radius=0;
                            		flag=1;
                            		read=0;
                            		top_most=addr;
                            		top_most_rgb = val;
                            		row=0;
                            		column=0;
                             		end
                
                		default: ;
            
            	endcase
        	end
		if(addr <85999 & flag==0 & ini>=4)
                	begin
                    		addr = addr + 1;
                 	end
         	else if(flag==0)
                	begin
                    		addr=85999;
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
                        				column=column+1;
                        				in=background;
                    				end
                    			else
                    				begin 
                     				case(top_most_rgb)
               						rtemp: 	begin
                            					if(radius<=15)
                                					redsmall=redsmall+1;
                               					else if(radius<=30)
                                					redmedium=redmedium+1;
                               					else
                                					redlarge=redlarge+1;
                            					end
                
                					gtemp: 	begin
                             					if(radius<=15)
                               						greensmall=greensmall+1;
                               					else if(radius<=30)
                                					greenmedium=greenmedium+1;
                               					else
                                					greenlarge=greenlarge+1;
                              					end
                
                					ytemp: 	begin
                              					if(radius<=15)
                                					yellowsmall=yellowsmall+1;
                               					else if(radius<=30)
                                					yellowmedium=yellowmedium+1;
                               					else
                                					yellowlarge=yellowlarge+1;
                              					end
                
                					btemp: 	begin
                              					if(radius<=15)
                                					bluesmall=bluesmall+1;
                              	 				else if(radius<=30)
                                					bluemedium=bluemedium+1;
                               					else
                                					bluelarge=bluelarge+1;
                              					end
                                               
                					atemp: 	begin
                            					if(radius<=15)
                                					aquasmall=aquasmall+1;
                               					else if(radius<=30)
                                					aquamedium=aquamedium+1;
                               					else
                                					aqualarge=aqualarge+1;
                             					end
                                
                					ftemp: 	begin
                            					if(radius<=15)
                                					fuchsiasmall=fuchsiasmall+1;
                               					else if(radius<=30)
                                					fuchsiamedium=fuchsiamedium+1;
                               					else
                                					fuchsialarge=fuchsialarge+1;
                             					end
                                
                					ltemp: 	begin
                            					if(radius<=15)
                                					limesmall=limesmall+1;
                               					else if(radius<=30)
                                					limemedium=limemedium+1;
                               					else
                                					limelarge=limelarge+1;
                             					end
                                
                					mtemp: 	begin
                            					if(radius<=15)
                                					maroonsmall=maroonsmall+1;
                               					else if(radius<=30)
                                					maroonmedium=maroonmedium+1;
                               					else
                                					maroonlarge=maroonlarge+1;
                             					end
                                
                					ntemp: 	begin
                            					if(radius<=15)
                                					navysmall=navysmall+1;
                               					else if(radius<=30)
                                					navymedium=navymedium+1;
                               					else
                                					navylarge=navylarge+1;
                             					end
                                
                					otemp: 	begin
                            					if(radius<=15)
                                					olivesmall=olivesmall+1;
                               					else if(radius<=30)
                               						olivemedium=olivemedium+1;
                               					else
                                					olivelarge=olivelarge+1;
                             					end
                                
                					ptemp: 	begin
                            					if(radius<=15)
                                					purplesmall=purplesmall+1;
                               					else if(radius<=30)
                               						purplemedium=purplemedium+1;
                               					else
                                					purplelarge=purplelarge+1;
                             					end
                                
                					stemp: 	begin
                            					if(radius<=15)
                                					silversmall=silversmall+1;
                               					else if(radius<=30)
                                					silvermedium=silvermedium+1;
                               					else
                                					silverlarge=silverlarge+1;
                             					end
                                
               						ttemp: 	begin
                            					if(radius<=15)
                                					tealsmall=tealsmall+1;
                               					else if(radius<=30)
                                					tealmedium=tealmedium+1;
                               					else
                                					teallarge=teallarge+1;
                             					end
                          
                     					default:;
                      	 	endcase

                        	radius=0;
                        	flag=0;
                        	flag2 = 0;
                        	addr=top_most+1;
                        	read=0;
                     	end
		end
	end   
end    

endmodule