`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2023 03:07:44 PM
// Design Name: 
// Module Name: tb
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


module tb( );
    reg clk;
    reg rst;
    reg [31:0]len=30;
    wire out;
    wire last;
    pn_gen dut(clk,rst,len,out,last);
    always begin 
        #5 clk=~clk;
        end
     initial begin
     clk=1;
     rst=1;
     #10 rst=0;
     #20 rst=1;
     #5 rst=0;
     
     #1000 $finish;
     end
endmodule
