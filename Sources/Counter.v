`timescale 1ns / 1ps



module Counter
    (
        input clk , reset , en,
        output reg [31:0] count,
        output reg en_next
    );
//    initial en_next = 0;
    
    always@(posedge clk or negedge clk)
    begin
        if(reset)
        count <= 0;
        else
        begin
        if(count[3:0] == 9 && en)
            begin
            count <= 0;
            end
            else
            begin 
            if (en)
            count <= count + 1;
            end
        if(count[3:0] == 8 )
        en_next <= 1;
        else
        en_next <= 0;
        end
    end
    
    
    
endmodule
