`timescale 1ns / 1ps

module register_input (
    input clk,
    input rst_n,           // Reset ch? ??ng m?c th?p
    input enable,          // K�ch ho?t thanh ghi
    input rw_mode,         // Ch? ??: 0 = Ghi & ??c l?i, 1 = Ch? ??c
    input [2:0] addr,      // ??a ch? 3-bit (ch? c?n 0-4)
    input [15:0] input_data, // D? li?u ??u v�o
    output reg [15:0] output_data // D? li?u ??u ra
);
    reg [15:0] mem [4:0]; // 5 � nh? 16-bit

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mem[0] <= 16'b0;
            mem[1] <= 16'b0;
            mem[2] <= 16'b0;    
            mem[3] <= 16'b0;
            mem[4] <= 16'b0;
            output_data <= 16'bZ; // Khi reset, output ? tr?ng th�i high-Z
        end
        else if (enable) begin
            if (rw_mode == 0) begin
                mem[addr] <= input_data; // Ghi d? li?u v�o � nh?
                output_data <= input_data; // Xu?t d? li?u ngay l?p t?c
            end
            else begin
                output_data <= mem[addr]; // Ch? ??c d? li?u t? � nh?
            end 
        end
        else begin
            output_data <= 16'bZ; // N?u enable = 0, output v? tr?ng th�i high-Z
        end
    end

endmodule
