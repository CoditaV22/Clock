`timescale 1ns / 1ps



module Alt_Alt_Counter
    (
        input clk , reset , en,
        input [31:0] prev_count0 , prev_count1,
        output reg en_next,
        output reg [31:0] count 
    );
    
    initial en_next = 0;
    
    always@(posedge clk or negedge clk)
    begin
        if(reset)
        count <= 0;
        else
        begin
        if(count[3:0] == 9 && prev_count0[3:0] == 5 && prev_count1[3:0] == 9)
           begin
            count <= 0;
           end
            else 
            begin
             if (en)
             count <= count + 1;
            end 
        end
        if(count[3:0] == 9 && prev_count0[3:0] == 5 && prev_count1[3:0] == 8)
         en_next <= 1;
         else
         en_next <= 0;
        
    end
    
    
    
endmodule
