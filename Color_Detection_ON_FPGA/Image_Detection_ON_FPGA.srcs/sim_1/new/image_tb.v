module final_test;
reg clock;
reg reset;
reg [4:0] input1;
wire [15:0] temp1;
wire [15:0] black;
wire [15:0] row;
wire [15:0] column;
wire [7:0] val;
wire [7:0] bltemp;
wire [16:0] addra;
wire [7:0] radius;
wire [7:0] current_rgb;
vga_syncIndex uut (.clock(clock),.reset(reset),.input1(input1), .temp1(temp1),.black(black),.val(val),.bltemp(bltemp),.addra(addra),.row(row),.column(column),.radius(radius),.current_rgb(current_rgb));



initial begin
    clock = 0;
    reset = 0;
    # 20 input1 = 5'b000100;
    //# 20 input1 <= 5'b00010;
    //# 20 input1 <= 5'b00100;
    //# 20 input1 <= 5'b01000;
    //# 20 input1 <= 5'b10000;

end

always #0.25 clock = ~clock;
endmodule
