`timescale 1ns/1ps
module clk_gen
  #(
    parameter PERIOD        = 2,
    parameter REST_VALUE    = 1'b0
    )
   (
    output reg clk,
    output reg rstn
    );
   
   initial
     begin
	clk <= 1'b0;
	rstn <= REST_VALUE;
	#(10*PERIOD)
	rstn <= !REST_VALUE;
     end
   
   always #(PERIOD/2) clk <= ~clk;
   
   
   
endmodule