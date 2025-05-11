`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025
// Design Name: 
// Module Name: RAM_19x1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: M?t kh?i RAM c� k�ch th??c 19, h? tr? c�c t�n hi?u ??c/ghi, ??a ch? v� d? li?u,
//              v?i ??a ch? ghi v� ??a ch? ??c kh�c nhau. D? li?u v�o v� ra l� 16 bit.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RAM_weight (
    input wire clk,               // T�n hi?u ??ng h?
    input wire rst_n,               // T�n hi?u reset
    input wire [2:0] addr_write,  // ??a ch? ghi (0 ??n 18)
    input wire [2:0] addr_read,   // ??a ch? ??c (0 ??n 18)
    input wire [15:0] data_in,    // D? li?u v�o khi ghi (16 bit)
    input wire write_enable,      // T�n hi?u cho ph�p ghi v�o RAM
    input wire read_enable,       // T�n hi?u cho ph�p ??c t? RAM
    output reg [15:0] data_out    // D? li?u ??c ra (16 bit)
);

    // ??nh ngh?a m?ng RAM c� 19 v? tr�, m?i v? tr� ch?a 16 bit
    reg [15:0] RAM [0:4];  // M?ng RAM v?i 19 v? tr�, m?i v? tr� 16 bit

    // Qu� tr�nh ??c v� ghi v�o RAM
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // N?u reset, x�a t?t c? d? li?u trong RAM
            RAM[0] <= 16'b0;
            RAM[1] <= 16'b0;
            RAM[2] <= 16'b0;
            RAM[3] <= 16'b0;
            RAM[4] <= 16'b0;
    
        end else begin
            
            if (write_enable) begin
                // N?u t�n hi?u ghi ???c b?t, ghi d? li?u v�o RAM t?i ??a ch? addr_write
                RAM[addr_write] <= data_in;  // Ghi d? li?u 16 bit v�o RAM t?i ??a ch? addr_write
             
            end
            
            if (read_enable) begin
                // N?u t�n hi?u ??c ???c b?t, ??c d? li?u t? RAM t?i ??a ch? addr_read
                data_out <= RAM[addr_read];  // ??c d? li?u 16 bit t? RAM t?i ??a ch? addr_read
                //=> addr read khogn r� r�ng

            end
        end
    end
endmodule
