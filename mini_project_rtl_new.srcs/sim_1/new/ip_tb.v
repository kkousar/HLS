`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/04/2023 12:52:23 PM
// Design Name: 
// Module Name: ip_tb
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


module ip_tb();
     reg clk;
     reg rst;
     wire out_0;
     wire last_0;
   design_1 design_1_i
            (.clk_0(clk),
             .last_0(last_0),
             .out_0(out_0),
             .rst_0(rst));
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
