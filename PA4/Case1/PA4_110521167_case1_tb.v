`timescale 1ns / 1ps

module Comparator_4bits_tb;
reg	[3:0]a, b;
wire	[2:0]result;
Comparator_4bits Comparator_4bits1(a, b, result);
integer sim;
initial
begin
    sim = $fopen("Comparator_4bits_simulation.txt", "w");

    $fsdbDumpfile("Comparator_4bits.fsdb");
    $fsdbDumpvars(0,Comparator_4bits_tb);
    #0  a = 4'h0;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h0;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h1;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h2;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h3;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h4;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h5;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h6;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h7;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h8;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'h9;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'ha;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hb;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hc;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hd;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'he;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'h0;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'h1;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'h2;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'h3;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'h4;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'h5;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'h6;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'h7;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'h8;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'h9;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'ha;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'hb;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'hc;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'hd;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'he;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  a = 4'hf;   b = 4'hf;
    #1      $fwrite(sim, "a=%b b=%b    result=(%b, %b, %b)", a, b, result[2], result[1], result[0]);
    if(result[2] != (a < b) || result[1] != (a > b) || result[0] != (a == b))
        $fwrite(sim, "X\n");
    else
        $fwrite(sim, "\n");
    #5  $finish;

$fclose(sim);
end
endmodule