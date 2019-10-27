`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2019 05:06:59 PM
// Design Name: 
// Module Name: radius
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


module radius(input clock, output reg [15:0] temp , reg [7:0] val,output reg[7:0] r,output reg [16:0] addr

    );
    reg flag=1;
    //output reg [7:0] r;
    reg read = 0;
   // wire [16:0] tempaddr=addr;
    reg [16:0] addra=1033;
	wire [7:0] in1 = 0;
	wire [7:0] out2;
	blk_mem_gen_0  inst1(
    .clka(clock), 
    .wea(read), 
    .addra(addra), 
    .ena(1),
    .dina(in1), 
    .douta(out2) 
     );
    reg [7:0] temp3;
    
     integer ini=0;
     always@(posedge clock)
     begin
    if(ini<=2)
    begin
        temp3= {out2[7], out2[6], out2[5], out2[4], out2[3], out2[2], out2[1], out2[0]};
     ini=ini+1;
     end
     
     else if(ini==3)
     begin
        val= {out2[7], out2[6], out2[5], out2[4], out2[3], out2[2], out2[1], out2[0]};
        ini=ini+1;
     end
     else
        ini=ini+1;
     end
     
     
   
    reg [15:0] temp1=1;
    
    always @(posedge clock)
        begin	
           
              if(flag==1 & ini>=4)
               begin
               addr=addra;
                r= {out2[7], out2[6], out2[5], out2[4], out2[3], out2[2], out2[1], out2[0]};
                if(r!=val)
                    begin
                    flag=0;
                    end
                addra = 1033 + 430*temp1 +temp1;
                temp1=temp1+1;
                  
               end
              else
               temp=temp1;       
            
            
   
            
            
            
            
            
            
        end
endmodule