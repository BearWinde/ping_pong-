module test;
reg    clk;
reg    rst_n;
reg      in_vaild;
reg    busy;
reg     [7:0] in;
wire     out_vaild;
wire    [7:0] out;
integer i;
integer j;
PP PP(.clk,.rst_n,.in_vaild,.busy,.in,.out_vaild,.out);

initial begin
        j=0;
        for(i=0;i<=1024;i=i+1)begin
               
                if(i ==0)begin
                         rst_n=0;
                         in = j;
                end 
                if(i%2==0)begin
                        clk=0;
                end else if(i%2==1)begin
                        j = j+1;
                        clk=1;
                        rst_n=1;
                        in = j;

                end
                #10;
        end
$finish;
end

initial begin
    $fsdbDumpfile("/home/111-2/VLSI/F109110125/DESIGN/Front-end/PRE_SIM/LAB08/pp_test3.fsdb");
    $fsdbDumpvars(0,test);
end
endmodule


