//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Sun Oct 20 00:11:06 2019
//Host        : LAPTOP-SR0LD7J6 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (BRAM_PORTA_0_addr,
    BRAM_PORTA_0_clk,
    BRAM_PORTA_0_din,
    BRAM_PORTA_0_dout,
    BRAM_PORTA_0_en,
    BRAM_PORTA_0_rst,
    BRAM_PORTA_0_we);
  input [31:0]BRAM_PORTA_0_addr;
  input BRAM_PORTA_0_clk;
  input [31:0]BRAM_PORTA_0_din;
  output [31:0]BRAM_PORTA_0_dout;
  input BRAM_PORTA_0_en;
  input BRAM_PORTA_0_rst;
  input [3:0]BRAM_PORTA_0_we;

  wire [31:0]BRAM_PORTA_0_addr;
  wire BRAM_PORTA_0_clk;
  wire [31:0]BRAM_PORTA_0_din;
  wire [31:0]BRAM_PORTA_0_dout;
  wire BRAM_PORTA_0_en;
  wire BRAM_PORTA_0_rst;
  wire [3:0]BRAM_PORTA_0_we;

  design_1 design_1_i
       (.BRAM_PORTA_0_addr(BRAM_PORTA_0_addr),
        .BRAM_PORTA_0_clk(BRAM_PORTA_0_clk),
        .BRAM_PORTA_0_din(BRAM_PORTA_0_din),
        .BRAM_PORTA_0_dout(BRAM_PORTA_0_dout),
        .BRAM_PORTA_0_en(BRAM_PORTA_0_en),
        .BRAM_PORTA_0_rst(BRAM_PORTA_0_rst),
        .BRAM_PORTA_0_we(BRAM_PORTA_0_we));
endmodule
