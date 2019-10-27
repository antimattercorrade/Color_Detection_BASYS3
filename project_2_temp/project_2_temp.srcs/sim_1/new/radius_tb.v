module radius_test;
reg clock;
wire [15:0] temp;
wire [7:0] val;
wire [7:0] r;
wire [16:0] addr;
initial begin
    clock = 0;
    
end

radius uut(.clock(clock),.temp(temp),.val(val),.r(r),.addr(addr));


always #5 clock = ~clock;
endmodule