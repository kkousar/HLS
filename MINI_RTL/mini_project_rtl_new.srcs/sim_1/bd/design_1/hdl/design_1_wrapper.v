//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Jul  4 13:31:19 2023
//Host        : DESKTOP-C9TS4IO running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (clk_0,
    last_0,
    len_0,
    out_0,
    rst_0);
  input clk_0;
  output last_0;
  input [31:0]len_0;
  output out_0;
  input rst_0;

  wire clk_0;
  wire last_0;
  wire [31:0]len_0;
  wire out_0;
  wire rst_0;

  design_1 design_1_i
       (.clk_0(clk_0),
        .last_0(last_0),
        .len_0(len_0),
        .out_0(out_0),
        .rst_0(rst_0));
endmodule
