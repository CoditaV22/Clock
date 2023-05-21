`timescale 1ns / 1ps



module Alt_Alt_Alt_Counter
    (
        input clk , reset , en,
        input [31:0] prev_count0 , prev_count1,
        output reg [31:0] count 
    );
    
    always@(posedge clk or negedge clk)
    begin
        if(reset)
        count <= 0;
        else
        begin
            if(count[3:0] == 5 && en)
            count <= 0;
            else
            if(en)
            count <= count + 1;
        end
    end
    
    
    
endmodule
