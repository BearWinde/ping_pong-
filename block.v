module block(inp_up, inp_left, clk, default_value, outp_down, outp_right);
	input [31:0] inp_up, inp_left,default_value;
	output reg [31:0] out_right, outp_down;
	input clk;

	always @(posedge rst or posedge clk) begin
		out_right = inp_up*default_value+inp_left*default_value
        outp_down = inp_up;
	end

endmodule