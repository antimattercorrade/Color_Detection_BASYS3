module final_test;
reg clock;
reg reset;
reg [13:0] input1;
wire [15:0] temp1;
wire [15:0] red;
wire [15:0] blue;
wire [15:0] green;
wire [15:0] yellow;
wire [15:0] aqua;
wire [15:0] fuchsia;
wire [15:0] lime;
wire [15:0] olive;
wire [15:0] maroon;
wire [15:0] silver;
wire [15:0] navy;
wire [15:0] purple;
wire [15:0] teal;
wire [15:0] black;
wire [7:0] val;
wire [16:0] addra;
wire [7:0] radius;
wire [7:0] current_rgb;
wire [2:0] smallo;
wire [2:0] mediumo;
wire [2:0] largeo;

vga_syncIndex uut (.clock(clock),.reset(reset),.input1(input1), .temp1(temp1),.val(val),.addra(addra),.radius(radius),.current_rgb(current_rgb),.red(red),.blue(blue),.green(green),.yellow(yellow),.aqua(aqua),.fuchsia(fuchsia),.lime(lime),.maroon(maroon),.navy(navy),.olive(olive),.purple(purple),.silver(silver),.teal(teal),.black(black),.smallo(smallo),.mediumo(mediumo),.largeo(largeo));



initial begin
    clock = 0;
    reset = 0;
    # 20 input1 = 14'b00000000001000;
    //# 20 input1 <= 5'b00010;
    //# 20 input1 <= 5'b00100;
    //# 20 input1 <= 5'b01000;
    //# 20 input1 <= 5'b10000;

end

always #0.25 clock = ~clock;
endmodule
