`timescale 1ns/1ns

module FSM_1_tb;

reg   	clk, reset, in;
wire	out;

FSM_1  fsm1( clk , reset , in , out );

always#5
begin
   clk=~clk;
end

initial
begin
   
   $fsdbDumpfile("FSM_1.fsdb");
   $fsdbDumpvars(0,FSM_1_tb);
   #0	reset=1'b0; clk=1'b0; in=1'b0;
   #1	reset=1'b1;
   #1	reset=1'b0;
   #8	in=1'b1;
   #5	in=1'b0;
   #10	in=1'b1;
   #5	in=1'b0;
   #5	in=1'b1;
   #15	in=1'b0;
   #5	in=1'b1;
   #100 $finish;
   
end

endmodule