
`include "block.v"
module systolic_array(inp_up_0, inp_up_1, inp_up_2, 
                    oupt_right_0,oupt_right_1,oupt_right_2,
		            clk, rst);
	
	input [31:0] inp_up_0, inp_up_1, inp_up_2;
	output reg [31:0 ]oupt_right_0,oupt_right_1,oupt_right_2;
	input clk, rst;
    reg [31:0] w1[2:0],w2[2:0],w3[2:0];

	wire [31:0] outp_down_0, outp_down_1, outp_down_2;
	wire [31:0] outp_right_p0, outp_right_p1, outp_right_p2, outp_right_p3,outp_right_p4,outp_right_p5,outp_right_p6,outp_right_p7;
	
	always @(posedge clk or posedge rst) begin
		if(rst) begin
			w1[0]=1;
            w1[1]=2;
            w1[2]=3;
            w2[0]=1;
            w2[1]=2;
            w2[2]=3;
            w3[0]=1;
            w3[1]=2;
            w3[2]=3;
		end
	end 
    //row1
    block P0 ( inp_up_0, 0, clk, w1[0], outp_down_0, outp_right_p0);
    block P1 ( inp_up_1, outp_right_p0, clk, w2[0], outp_down_1, outp_right_p1);
    block P2 ( inp_up_2, outp_right_p1, clk, w3[0], outp_down_2, oupt_right_0);

    //row2
    block P3 ( outp_down_0, 0, clk, w1[1], outp_down_1, outp_right_p3);
    block P4 ( outp_down_1, outp_right_p3, clk, w2[1], outp_down, outp_right_p4);
    block P5 ( outp_down_2, outp_right_p4, clk, w3[1], outp_down, oupt_right_1);

    //row3
    block P6 ( outp_down_0, 0, clk, w1[2], outp_down_2, outp_right_p6);
    block P7 ( outp_down_1, outp_right_p6, clk, w2[2], outp_down, outp_right_p7);
    block P8 ( outp_down_2, outp_right_p7, clk, w3[2], outp_down, oupt_right_2);
    
endmodule
		    