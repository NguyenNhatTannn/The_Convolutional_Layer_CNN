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
// Description: M?t kh?i RAM có kích th??c 19, h? tr? các tín hi?u ??c/ghi, ??a ch? và d? li?u,
//              v?i ??a ch? ghi và ??a ch? ??c khác nhau. D? li?u vào và ra là 16 bit.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RAM_weight (
    input wire clk,               // Tín hi?u ??ng h?
    input wire rst_n,               // Tín hi?u reset
    input wire [2:0] addr_write,  // ??a ch? ghi (0 ??n 18)
    input wire [2:0] addr_read,   // ??a ch? ??c (0 ??n 18)
    input wire [15:0] data_in,    // D? li?u vào khi ghi (16 bit)
    input wire write_enable,      // Tín hi?u cho phép ghi vào RAM
    input wire read_enable,       // Tín hi?u cho phép ??c t? RAM
    output reg [15:0] data_out    // D? li?u ??c ra (16 bit)
);

    // ??nh ngh?a m?ng RAM có 19 v? trí, m?i v? trí ch?a 16 bit
    reg [15:0] RAM [0:4];  // M?ng RAM v?i 19 v? trí, m?i v? trí 16 bit

    // Quá trình ??c và ghi vào RAM
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            // N?u reset, xóa t?t c? d? li?u trong RAM
            RAM[0] <= 16'b0;
            RAM[1] <= 16'b0;
            RAM[2] <= 16'b0;
            RAM[3] <= 16'b0;
            RAM[4] <= 16'b0;
    
        end else begin
            
            if (write_enable) begin
                // N?u tín hi?u ghi ???c b?t, ghi d? li?u vào RAM t?i ??a ch? addr_write
                RAM[addr_write] <= data_in;  // Ghi d? li?u 16 bit vào RAM t?i ??a ch? addr_write
             
            end
            
            if (read_enable) begin
                // N?u tín hi?u ??c ???c b?t, ??c d? li?u t? RAM t?i ??a ch? addr_read
                data_out <= RAM[addr_read];  // ??c d? li?u 16 bit t? RAM t?i ??a ch? addr_read
                //=> addr read khogn rõ ràng

            end
        end
    end
endmodule
