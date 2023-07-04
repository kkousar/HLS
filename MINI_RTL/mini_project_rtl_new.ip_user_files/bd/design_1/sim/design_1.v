//Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2017.4 (win64) Build 2086221 Fri Dec 15 20:55:39 MST 2017
//Date        : Tue Jul  4 13:31:19 2023
//Host        : DESKTOP-C9TS4IO running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=1,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,synth_mode=Global}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk_0,
    last_0,
    len_0,
    out_0,
    rst_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_0 CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_0, ASSOCIATED_RESET rst_0, CLK_DOMAIN design_1_clk_0, FREQ_HZ 100000000, PHASE 0.000" *) input clk_0;
  output last_0;
  input [31:0]len_0;
  output out_0;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RST_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RST_0, POLARITY ACTIVE_LOW" *) input rst_0;

  wire clk_0_1;
  wire [31:0]len_0_1;
  wire pn_gen_0_last;
  wire pn_gen_0_out_data;
  wire rst_0_1;

  assign clk_0_1 = clk_0;
  assign last_0 = pn_gen_0_last;
  assign len_0_1 = len_0[31:0];
  assign out_0 = pn_gen_0_out_data;
  assign rst_0_1 = rst_0;
  design_1_pn_gen_0_1 pn_gen_0
       (.clk(clk_0_1),
        .last(pn_gen_0_last),
        .len(len_0_1),
        .out_data(pn_gen_0_out_data),
        .rst(rst_0_1));
endmodule
