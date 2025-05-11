`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 12:20:29 PM
// Design Name: 
// Module Name: pipeline_register
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


module pipeline_register (
    input clk,
    input rst_n,
    input enable,        // Kích ho?t ghi
    input [15:0] in_weight,
    input [15:0] in_input, // D? li?u t? module tr??c
    output reg [15:0] out_weight,
    output reg [15:0] out_input // D? li?u ??u ra cho module sau
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
        begin
            out_weight <= 16'b0;
            out_input <= 16'b0;
        end
        else if (enable)
        begin
             out_weight <= in_weight;
            out_input <= in_input;
        end
    end
endmodule

