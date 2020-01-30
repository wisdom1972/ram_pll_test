/////////////////////////////////////////////////////////////////////////////
//
// Copyright (C) 2013-2018 Efinix Inc. All rights reserved.
//
// Dual Clock FIFO
//
//********************************
// Revisions:
// 0.0 Initial rev
//********************************

module top
(
  input clk,
  input locked,
  output [7:0] led_o
);


parameter HALF_SEC   = 37500000;
parameter ROM_DWIDTH = 8;
parameter ROM_AWIDTH = 3;

reg [30:0]     count;
reg [ROM_AWIDTH-1:0]     rom_addr;
always@(posedge clk)
  if(!locked) begin
     rom_addr <= 0;
	 count    <= 0;
  end else begin
     count    <= count +1;
	 if(count == HALF_SEC)begin
       count    <= 0;
       rom_addr <= rom_addr + 1;
     end 
  end
  
wire [ROM_DWIDTH-1:0] rom_data;  
single_port_rom 
#(
	.DATA_WIDTH    (ROM_DWIDTH   ),
	.ADDR_WIDTH    (ROM_AWIDTH   ),
	.OUTPUT_REG    ("FALSE"      ),
	.RAM_INIT_FILE ("rom_init.mem")
)single_port_rom
(
	.addr (rom_addr),
	.clk  (clk     ),
	.data (rom_data)
);

//========== shift 
wire [ROM_DWIDTH-1:0] shift_data;  
shift_reg
#(
	.D_WIDTH	(ROM_DWIDTH),
	.TAPE	    (1300       )
)shift_reg
(
	.i_arst(!locked   ),
	.i_clk (clk       ),	
	.i_d   (rom_data  ),
	.o_q   (shift_data)
);
//========= fifo
wire empty;
wire [ROM_DWIDTH-1:0] fifo_rdata;
dual_clock_fifo_wrapper
#(
	.DATA_WIDTH		(ROM_DWIDTH),
	.ADDR_WIDTH		(9         ),
	.LATENCY	    (1         ),
	.FIFO_MODE		("STD_FIFO"),
	/////////////////////////////////////////////////////////////////////////////////////
	// compatibility	output_reg			check_full_overflow		check_empty_underflow
	/////////////////////////////////////////////////////////////////////////////////////
	// E				user configurable	user configurable		user configurable
	// X				user configurable	always on				always on
	// A				always off			user configurable		user configurable
	.COMPATIBILITY	("E"   ),
	.OUTPUT_REG		("TRUE"),
	.CHECK_FULL		("TRUE"),
	.CHECK_EMPTY    ("TRUE")
)dual_clock_fifo_wrapper
(
	.i_arst (!locked   ),
	
	.i_wclk (clk       ),
	.i_we   (1'b1      ),
	.i_wdata(shift_data),
	
	.i_rclk(clk   ),
	.i_re  (~empty),
	
	.o_full (          ),
	.o_empty(empty     ),
	.o_rdata(fifo_rdata)
);
//============ dram
localparam RAM_AWIDTH = 16;
reg [RAM_AWIDTH-1:0] ram_raddr;
reg [RAM_AWIDTH-1:0] ram_waddr,ram_waddr_d0,ram_waddr_d1;
wire [ROM_DWIDTH-1:0] ram_rdata;
always@(posedge clk)
  if(!locked)    ram_waddr <= 0;
  else           ram_waddr <= ram_waddr + 1;
always@(posedge clk)
  {ram_raddr,ram_waddr_d1,ram_waddr_d0} <= {ram_waddr_d1,ram_waddr_d0,ram_waddr};
  
  
true_dual_port_ram
#(
	.DATA_WIDTH	    (ROM_DWIDTH  ),
	.ADDR_WIDTH	    (RAM_AWIDTH  ),
	.WRITE_MODE_1	("WRITE_FIRST"),	// WRITE_FIRST, READ_FIRST, NO_CHANGE
	.WRITE_MODE_2	("WRITE_FIRST"),
	.OUTPUT_REG_1	("FALSE"     ),
	.OUTPUT_REG_2	("FALSE"     ),
	.RAM_INIT_FILE	(""          )
)true_dual_port_ram
(
	.clka (clk ), 
	.we1  (1'b1), 
	.din1 (fifo_rdata), 
	.addr1(ram_waddr),
	.dout1(), 
	
	.clkb (clk ),
	.we2  (1'b0), 
	.din2 (),
	.addr2(ram_raddr),
	.dout2(ram_rdata)
);

assign led_o = ram_rdata; 
endmodule
