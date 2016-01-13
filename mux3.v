`timescale 1ps/1ps
module mux3(mux3_data0, 
	          mux3_data1,
	          mux3_data2,
	          mux3_sel, 
	          mux3_result);

parameter d_width = 12;
parameter sel_width = 2; //sel_width/2

	input  [d_width-1:0]  	mux3_data0, mux3_data1, mux3_data2;
	input  [sel_width-1:0]	mux3_sel;
	output	[d_width-1:0]	 	mux3_result;

	wire    [d_width-1:0]   mux3_result;

function [d_width-1:0] mux3_out;
	input  [d_width-1:0]  	mux3_data0, mux3_data1, mux3_data2;
	input  [sel_width-1:0]	mux3_sel;

	case(mux3_sel)

		2'b00 : mux3_out = mux3_data0;
		2'b01 : mux3_out = mux3_data1;
      2'b10 : mux3_out = mux3_data2;

	default mux3_out = 12'b000000000000;
	endcase
	
endfunction
	
assign mux3_result = mux3_out(mux3_data0, mux3_data1, mux3_data2, mux3_sel);
	
//always@(mux3_data0, mux3_data1, mux3_data2, mux3_sel)
//	begin
//		case(mux3_sel)
//
//		2'b00 : mux3_result = mux3_data0;
//		2'b01 : mux3_result = mux3_data1;
//      2'b10 : mux3_result = mux3_data2;
//
//		default mux3_result = 12'b000000000000;
//		endcase
//	end

endmodule

