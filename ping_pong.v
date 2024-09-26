module PP(
        clk,
        rst_n,
        in_vaild,
        busy,
        in,
        out_vaild,
        out
);

input clk,rst_n,in_vaild,busy;
input  [7:0] in;
output reg  out_vaild;
output reg [7:0] out;
reg [7:0] count_A,count_B;
reg [7:0] memory_A[63:0];
reg [7:0] memory_B[63:0];

always@(posedge clk or negedge rst_n)begin

        if(!rst_n)begin
                count_A =0;
                count_B =0;
                memory_A[count_A] = in; 
                count_A = count_A+1;
        end
        else if(rst_n)begin
                if(count_A <64 )begin
                        memory_A[count_A] = in;
                        count_A = count_A+1;
                end
                if(count_A == 64 && count_B < 65)begin
                        memory_B[count_B] = in; 
                        count_B = count_B+1;
                        
                end
                if(count_A == 64 && count_B == 64)begin
                        count_A =0;
                        count_B =0;
                        memory_A[count_A] = in; 
                        count_A = count_A+1;
                end
        end

end
 always @(posedge clk) begin
    if (count_A < 64) begin
      out <= memory_B[count_A];
    end
    else if (count_B < 65) begin
      out <= memory_A[count_B];
    end
  end

endmodule

