`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2025 12:02:45 PM
// Design Name: 
// Module Name: mux2_1
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


module mux2_1 #(
    parameter DATA_WIDTH = 16  // ?? r?ng d? li?u là 16 bit
)(
    input [DATA_WIDTH-1:0] in0,  // ??u vào th? nh?t
    input [DATA_WIDTH-1:0] in1,  // ??u vào th? hai
    input sel,                  // Tín hi?u ?i?u khi?n l?a ch?n (0 ho?c 1)
    output reg [DATA_WIDTH-1:0] out  // ??u ra
);

    always @(*) begin
        if (sel == 0) 
            out = in0;  // N?u sel = 0, ch?n in0
        else 
            out = in1;  // N?u sel = 1, ch?n in1
    end

endmodule
