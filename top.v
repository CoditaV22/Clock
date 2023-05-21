`timescale 1ns / 1ps



module top(
        input clk,
        input reset,
        input en,
        output [31:0] sec0 ,sec1 , min0 , min1
    );
    
    
    wire en0 , en1 , en2;
    
    Counter count0
    (
        .clk(clk),
        .reset(reset),
        .en(en),
        .en_next(en0),
        .count(sec0)
    );
    
    Alt_Counter count1
    (
        .clk(clk),
        .prev_count(sec0),
        .reset(reset),
        .en(en0),
        .en_next(en1),
        .count(sec1)
    );
    
    Alt_Alt_Counter count2
    (
        .clk(clk),
        .prev_count0(sec1),
        .prev_count1(sec0),
        .reset(reset),
        .en(en1),
        .en_next(en2),
        .count(min0)
    );
    
    
    Alt_Alt_Alt_Counter count3
    (
        .clk(clk),
        .reset(reset),
        .en(en2),
        .count(min1)
    );
    
    
    
endmodule
