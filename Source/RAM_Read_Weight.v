`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 08:09:41 PM
// Design Name: 
// Module Name: RAM_Read_Weight
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: Module RAM_Read_Weight
//              T?ng counter t? 0 ??n kernel_size, quay l?i khi ??t kernel_size v� c� t�n hi?u pop_w.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RAM_Read_Weight(
    input wire clk,
    input wire rst_n,             // Reset t�n hi?u
    input wire pop_w, 
    input wire width_size,          // T�n hi?u pop_w
    input wire [2:0] kernel_size, // K�ch th??c kernel (5 bit)
    
    output reg [2:0] addr_RAM_weight, // ??a ch? ??c t? RAM
    output wire read_RAM_weight       // T�n hi?u ?? ??c t? RAM
);

    reg [2:0] counter;  // ??m t? 0 ??n kernel_size - 1
    
    // M?i khi reset ho?c nh?n t�n hi?u pop_w, counter s? t?ng
    reg flag_first_pop;
    always @(negedge rst_n or posedge pop_w or posedge clk) begin
    if (!rst_n) begin
        addr_RAM_weight  <= 0;
        flag_first_pop  <= 1'b1;
    end
    else if (pop_w) begin

        if (flag_first_pop) begin
            addr_RAM_weight <= 0;
            flag_first_pop <= 1'b0; // ?� qua l?n ??u
        end
        else begin
            addr_RAM_weight <= (addr_RAM_weight == (kernel_size - 1)) ? 0 : (addr_RAM_weight + 1);
       
        end
    end
end
 // ??a ch? RAM ???c c?p cho module
    assign read_RAM_weight = pop_w;   // T�n hi?u pop_w s? ?i?u khi?n ??c t? RAM

endmodule
