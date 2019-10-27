`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/26/2019 09:32:00 PM
// Design Name: 
// Module Name: LED
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


module LED(
input clk,input [4:0] in,input reset,output [6:0] led,output [3:0] Anode_Activate
    );
    wire [1:0] rcounter;
    wire refreshclk;

    
    
   reg [4:0] red='d31;
    reg [4:0] blue='d12;
    reg [4:0] green='d23;
    reg [4:0] black='d9;
    reg [4:0] yellow='d15;
    reg [4:0] temp1;
    wire [4:0] temp;
    
 
  
  always @(*)
    begin
        case(in)
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
    
clock_divider a(clk,refreshclk);
    refreshcounter b(refreshclk,rcounter);
    anode_control c(rcounter,Anode_Activate);
    BCD_control e(((temp1%1000)%100)%10,((temp1%1000)%100)/10,0,temp1/1000,rcounter,temp);
BCD_to_cathodes f(temp,led);
    
 endmodule
    
    

