`timescale 1ps/1ps
module interrupt_pc(clk, reset, int_current_pc, int_en, int_req, int_cc_c, int_cc_z ,
                    int_return_pc, int_z, int_c, int_ack, reti_signal);

parameter d_width = 12;

input                clk;
input                reset;
input  [d_width-1:0] int_current_pc;
input                int_en;
input                int_req;
input                int_cc_z;
input                int_cc_c;
input                reti_signal;

output [d_width-1:0] int_return_pc;
output               int_c;
output               int_z;
output               int_ack;


reg    [d_width-1:0] int_return_pc;
reg                  int_c;
reg                  int_z;
reg                  int_ack;

always@(posedge clk or negedge reset)
  begin
    if(reset != 1'b1)
    begin
      int_return_pc <= 1'b0;
      int_c         <= 1'b0;
      int_z         <= 1'b0;
      int_ack       <= 1'b0;
    end
    
    else if(int_req == 1'b1 && int_en == 1'b1)//save pc c z
    begin
      int_return_pc  <= int_current_pc;
      int_z          <= int_cc_z;
      int_c          <= int_cc_c;
      int_ack        <= 1'b1; //infrom state outside pp
    end
    
    else
	 begin
//      int_return_pc  <= int_current_pc;
//      int_z          <= int_cc_z;
//      int_c          <= int_cc_c;
      int_ack    		<= 1'b0; //infrom state outside pp
	 end
  end
endmodule
