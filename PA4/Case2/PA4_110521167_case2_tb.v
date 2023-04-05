`timescale 1ns / 1ps
module Decoder_tb;
reg [3:0]select;
wire [15:0]d;
Decoder Decoder1( select, d );
initial
begin
    $fsdbDumpfile("Decoder.fsdb");
    $fsdbDumpvars(0,Decoder_tb);
    #0  select = 4'h0;
    #5  select = 4'h1;
    #5  select = 4'h2;
    #5  select = 4'h3;
    #5  select = 4'h4;
    #5  select = 4'h5;
    #5  select = 4'h6;
    #5  select = 4'h7;
    #5  select = 4'h8;
    #5  select = 4'h9;
    #5  select = 4'ha;
    #5  select = 4'hb;
    #5  select = 4'hc;
    #5  select = 4'hd;
    #5  select = 4'he;
    #5  select = 4'hf;
    #5  $finish;
end
endmodule