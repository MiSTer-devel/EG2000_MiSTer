`timescale 1ps / 1ps

//-------------------------------------------------------------------------------------------------
module rom
//-------------------------------------------------------------------------------------------------
#
(
	parameter KB = 0,
	parameter DW = 8,
	parameter FN = ""
)
(
	input  wire                      clock,
	input  wire                      ce,
	output reg [             DW-1:0] q,
	input  wire[$clog2(KB*1024)-1:0] a
);
//-------------------------------------------------------------------------------------------------

reg[DW-1:0] rom[(KB*1024)-1:0];
initial $readmemh(FN, rom, 0);

always @(posedge clock) if(ce) q <= rom[a];

//-------------------------------------------------------------------------------------------------
endmodule
//-------------------------------------------------------------------------------------------------
