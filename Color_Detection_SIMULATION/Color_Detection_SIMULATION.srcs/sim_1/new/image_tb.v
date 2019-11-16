module final_test;
reg clock;
reg [12:0] switch_input;
wire [3:0] count;
wire [3:0] red;
wire [3:0] blue;
wire [3:0] green;
wire [3:0] yellow;
wire [3:0] aqua;
wire [3:0] fuchsia;
wire [3:0] lime;
wire [3:0] olive;
wire [3:0] maroon;
wire [3:0] silver;
wire [3:0] navy;
wire [3:0] purple;
wire [3:0] teal;
wire [2:0] small_radius;
wire [2:0] medium_radius;
wire [2:0] large_radius;

Color_Detection uut (.clock(clock),.switch_input(switch_input), .count(count),
.red(red),.blue(blue),.green(green),.yellow(yellow),.aqua(aqua),.fuchsia(fuchsia),.lime(lime),
.maroon(maroon),.navy(navy),.olive(olive),.purple(purple),.silver(silver),.teal(teal),
.small_radius(small_radius),.medium_radius(medium_radius),.large_radius(large_radius));



initial begin
    clock = 0;
    # 20 switch_input = 13'b0000000001000;
    //# 20 switch_input = 13'b0000000000001;
    //# 20 switch_input = 13'b0000000000010;
    //# 20 switch_input = 13'b1000000000000;
    //# 20 switch_input = 13'b0100000000000;

end

always #0.25 clock = ~clock;
endmodule
