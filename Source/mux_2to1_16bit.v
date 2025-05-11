`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2025 12:02:32 PM
// Design Name: 
// Module Name: mux_2to1_16bit
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


module mux_2to1_16bit (
    input [15:0] in0,
    input [15:0] in1,
    input sel,
    output wire [15:0] out
);
    assign out = sel ? in1 : in0;
endmodule

