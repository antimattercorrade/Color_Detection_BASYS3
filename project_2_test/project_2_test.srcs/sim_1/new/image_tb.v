module final_test;
reg clock;
reg reset;
reg [4:0] input1;
wire [15:0] temp1;
wire [15:0] yellow;
wire [15:0] row;
wire [15:0] column;
wire [7:0] val;
wire [7:0] ytemp;
wire [16:0] addra;
vga_syncIndex uut (.clock(clock),.reset(reset),.input1(input1), .temp1(temp1),.yellow(yellow),.val(val),.ytemp(ytemp),.addra(addra),.row(row),.column(column));



initial begin
    clock = 0;
    reset = 0;
    # 20 input1 = 5'b10000;
    //# 20 input1 <= 5'b00010;
    //# 20 input1 <= 5'b00100;
    //# 20 input1 <= 5'b01000;
    //# 20 input1 <= 5'b10000;

end

always #0.25 clock = ~clock;
endmodule
