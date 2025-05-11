`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 11:53:05 AM
// Design Name: 
// Module Name: register_psum
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_psum (
    input clk,
    input rst_n,           // Reset ch? ??ng m?c th?p
    input enable,          // Kích ho?t thanh ghi
    input rw_mode,         // Ch? ??: 0 = Ghi & ??c l?i, 1 = Ch? ??c
    input addr,            // ??a ch? 1-bit (ch? c?n 0-1)
    input [15:0] input_data, // D? li?u ??u vào
    output reg [15:0] output_data // D? li?u ??u ra
);
    reg [15:0] mem [1:0]; // 2 ô nh? 16-bit

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            mem[0] <= 16'b0;
            mem[1] <= 16'b0;
            output_data <= 16'bZ; // Khi reset, output ? tr?ng thái high-Z
        end
        else if (enable) begin
            if (rw_mode == 0) begin
                mem[addr] <= input_data; // Ghi d? li?u vào ô nh?
                output_data <= input_data; // Xu?t d? li?u ngay l?p t?c
            end
            else begin
                output_data <= mem[addr]; // Ch? ??c d? li?u t? ô nh?
            end 
        end
        else begin
            output_data <= 16'bZ; // N?u enable = 0, output v? tr?ng thái high-Z
        end
    end

endmodule