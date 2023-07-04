`timescale 1ns / 1ps
module pn_gen(input clk,
                input rst,
                input [31:0] len,
                output  reg out_data,
                output reg last);
         parameter ARRAY_SIZE = 1600;
         
         reg  x [0:ARRAY_SIZE-1];
         reg  y [0:ARRAY_SIZE-1];
         
          integer cint = 100;
          integer i;
          integer n=0;
          reg bit1;
          initial begin
         last=0;
          // Initialize arrays with zeroes
            for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
                          x[i] = 0;
                          y[i] = 0;
                  end
            // Set x[0] to 1
            x[0] = 1;                
            // Update array values iteratively
            for (i = 0; i < 31; i = i + 1) begin
                        y[i] = (cint >> i) & 1;
                      end           
          end
         always@(posedge clk or negedge clk or posedge rst)begin
            if (rst)begin
                out_data<=0; 
            end
             else begin
            while (n<1600+len) begin               
               if (rst)begin
                              n<=0;
                               out_data<=0;
                               for (i = 0; i < ARRAY_SIZE; i = i + 1) begin
                                                x[i] = 0;
                                                y[i] = 0;
                               end
                              // Set x[0] to 1
                               x[0] = 1;                
                             // Update array values iteratively
                               for (i = 0; i < 31; i = i + 1) begin
                                          y[i] = (cint >> i) & 1;
                               end
                           end
                    else begin    
                      //update values according to the given formula
                     x[(n + 31) % ARRAY_SIZE] = x[(n + 3) % ARRAY_SIZE] ^ x[n % ARRAY_SIZE];
                     y[(n + 31) % ARRAY_SIZE] = y[(n + 3) % ARRAY_SIZE] ^ y[(n + 2) % ARRAY_SIZE] ^ y[(n + 1) % ARRAY_SIZE] ^ y[n % ARRAY_SIZE];
                    if (n>= ARRAY_SIZE) begin
                         bit1= x[(n) %  ARRAY_SIZE] ^ y[(n) %  ARRAY_SIZE];
                          out_data<=bit1;
                         if (n-1599==len) begin
                                    //trigger last signal if last value is reached
                                     last<=1;                                                    
                                     #5 last=0;
                                     out_data<=0;
                         end                       
                         $write("%d",bit1);
                         //to observe outptu wave form 
                         repeat(1) @(posedge clk or negedge clk);
                    end 
                    end                                                                
                    n=n+1;    
                    end
                   end                   
               end                
endmodule
