`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 10:45:47 AM
// Design Name: 
// Module Name: RAM_INPUT_BLOCK
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


module RAM_INPUT_BLOCK(
    input clk,
    input rst_n,
    //GHI TU BEN NGOAI HE THONG
    input [4:0] addr_write,
    
    
    input [4:0] addr_read,
    
    //BLOCK1
    input wire [15:0] data_in_0_0,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_0,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_0,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_0,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_0,   // D? li?u vào RAM 4 (16 bit)
    input wire [15:0] data_in_5_0,   // D? li?u vào RAM 5 (16 bit)
    input wire [15:0] data_in_6_0,   // D? li?u vào RAM 6 (16 bit)
    input wire [15:0] data_in_7_0,   // D? li?u vào RAM 7 (16 bit)
    input wire [15:0] data_in_8_0,   // D? li?u vào RAM 8 (16 bit)
    input wire [15:0] data_in_9_0,   // D? li?u vào RAM 9 (16 bit)
    input wire [15:0] data_in_10_0,  // D? li?u vào RAM 10 (16 bit)
    input wire [15:0] data_in_11_0,  // D? li?u vào RAM 11 (16 bit)
    input wire [15:0] data_in_12_0,  
    
    //BLOCK2
    input wire [15:0] data_in_0_1,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_1,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_1,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_1,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_1,   // D? li?u vào RAM 4 (16 bit)
    input wire [15:0] data_in_5_1,   // D? li?u vào RAM 5 (16 bit)
    input wire [15:0] data_in_6_1,   // D? li?u vào RAM 6 (16 bit)
    input wire [15:0] data_in_7_1,   // D? li?u vào RAM 7 (16 bit)
    input wire [15:0] data_in_8_1,   // D? li?u vào RAM 8 (16 bit)
    input wire [15:0] data_in_9_1,   // D? li?u vào RAM 9 (16 bit)
    input wire [15:0] data_in_10_1,  // D? li?u vào RAM 10 (16 bit)
    input wire [15:0] data_in_11_1,  // D? li?u vào RAM 11 (16 bit)
    input wire [15:0] data_in_12_1,  
    
    //BLOCK3
    input wire [15:0] data_in_0_2,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_2,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_2,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_2,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_2,   // D? li?u vào RAM 4 (16 bit)
    input wire [15:0] data_in_5_2,   // D? li?u vào RAM 5 (16 bit)
    input wire [15:0] data_in_6_2,   // D? li?u vào RAM 6 (16 bit)
    input wire [15:0] data_in_7_2,   // D? li?u vào RAM 7 (16 bit)
    input wire [15:0] data_in_8_2,   // D? li?u vào RAM 8 (16 bit)
    input wire [15:0] data_in_9_2,   // D? li?u vào RAM 9 (16 bit)
    input wire [15:0] data_in_10_2,  // D? li?u vào RAM 10 (16 bit)
    input wire [15:0] data_in_11_2,  // D? li?u vào RAM 11 (16 bit)
    input wire [15:0] data_in_12_2,  
    
    
    
    //INPUT TIN HIEU DOC va INDEX
    //Danh cho ca 3 khoi
    input [4:0] pattern_out0,
    input [4:0] pattern_out1,
    input [4:0] pattern_out2,
    input [4:0] pattern_out3,
    input [4:0] pattern_out4,
    input [4:0] pattern_out5,
    input [4:0] pattern_out6,
    input [4:0] pattern_out7,
    input [4:0] pattern_out8,
    input [4:0] pattern_out9,
    input [4:0] pattern_out10,
    input [4:0] pattern_out11,
    input [4:0] pattern_out12,
    
    //INPUT WRITE_ENBALE
    input wire write_enable_0,
    input wire write_enable_1,
    input wire write_enable_2,
    input wire write_enable_3,
    input wire write_enable_4,
    input wire write_enable_5,
    input wire write_enable_6,
    input wire write_enable_7,
    input wire write_enable_8,
    input wire write_enable_9,
    input wire write_enable_10,
    input wire write_enable_11,
    input wire write_enable_12,
    
    //OUTPUT BLOCK 0
    output wire [19:0] data_out_0_0,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1_0,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2_0,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3_0,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4_0,  // D? li?u ra t? RAM 4 (16 bit)
    output wire [19:0] data_out_5_0,  // D? li?u ra t? RAM 5 (16 bit)
    output wire [19:0] data_out_6_0,  // D? li?u ra t? RAM 6 (16 bit)
    output wire [19:0] data_out_7_0,  // D? li?u ra t? RAM 7 (16 bit)
    output wire [19:0] data_out_8_0,  // D? li?u ra t? RAM 8 (16 bit)
    output wire [19:0] data_out_9_0,  // D? li?u ra t? RAM 9 (16 bit)
    output wire [19:0] data_out_10_0, // D? li?u ra t? RAM 10 (16 bit)
    output wire [19:0] data_out_11_0, // D? li?u ra t? RAM 11 (16 bit)
    output wire [19:0] data_out_12_0, // D? li?u ra t? RAM 12 (16 bit)
    
    //OUTPUT BLOCK 1
    output wire [19:0] data_out_0_1,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1_1,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2_1,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3_1,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4_1,  // D? li?u ra t? RAM 4 (16 bit)
    output wire [19:0] data_out_5_1,  // D? li?u ra t? RAM 5 (16 bit)
    output wire [19:0] data_out_6_1,  // D? li?u ra t? RAM 6 (16 bit)
    output wire [19:0] data_out_7_1,  // D? li?u ra t? RAM 7 (16 bit)
    output wire [19:0] data_out_8_1,  // D? li?u ra t? RAM 8 (16 bit)
    output wire [19:0] data_out_9_1,  // D? li?u ra t? RAM 9 (16 bit)
    output wire [19:0] data_out_10_1, // D? li?u ra t? RAM 10 (16 bit)
    output wire [19:0] data_out_11_1, // D? li?u ra t? RAM 11 (16 bit)
    output wire [19:0] data_out_12_1, // D? li?u ra t? RAM 12 (16 bit)
    
    //OUTPUT BLOCK 2
    output wire [19:0] data_out_0_2,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1_2,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2_2,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3_2,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4_2,  // D? li?u ra t? RAM 4 (16 bit)
    output wire [19:0] data_out_5_2,  // D? li?u ra t? RAM 5 (16 bit)
    output wire [19:0] data_out_6_2,  // D? li?u ra t? RAM 6 (16 bit)
    output wire [19:0] data_out_7_2,  // D? li?u ra t? RAM 7 (16 bit)
    output wire [19:0] data_out_8_2,  // D? li?u ra t? RAM 8 (16 bit)
    output wire [19:0] data_out_9_2,  // D? li?u ra t? RAM 9 (16 bit)
    output wire [19:0] data_out_10_2, // D? li?u ra t? RAM 10 (16 bit)
    output wire [19:0] data_out_11_2, // D? li?u ra t? RAM 11 (16 bit)
    output wire [19:0] data_out_12_2, // D? li?u ra t? RAM 12 (16 bit),
    
    
    output index_read_enable_0,
    output index_read_enable_1,
    output index_read_enable_2,
    output index_read_enable_3,
    output index_read_enable_4,
    output index_read_enable_5,
    output index_read_enable_6,
    output index_read_enable_7,
    output index_read_enable_8,
    output index_read_enable_9,
    output index_read_enable_10,
    output index_read_enable_11,
    output index_read_enable_12,

    output [19:0] ram_data_out_0,
    output [19:0] ram_data_out_1,
    output [19:0] ram_data_out_2,
    output [19:0] ram_data_out_3,
    output [19:0] ram_data_out_4,
    output [19:0] ram_data_out_5,
    output [19:0] ram_data_out_6,
    output [19:0] ram_data_out_7,
    output [19:0] ram_data_out_8,
    output [19:0] ram_data_out_9,
    output [19:0] ram_data_out_10,
    output [19:0] ram_data_out_11,
    output [19:0] ram_data_out_12
    
    
    );
    
    RAM_13x19 BLOCK0(
    .clk(clk),
    .rst_n(rst_n),
    .addr_write(addr_write),
    .addr_read(addr_read),
    .data_in_0(data_in_0_0),
    .data_in_1(data_in_1_0),
    .data_in_2(data_in_2_0),
    .data_in_3(data_in_3_0),
    .data_in_4(data_in_4_0),
    .data_in_5(data_in_5_0),
    .data_in_6(data_in_6_0),
    .data_in_7(data_in_7_0),
    .data_in_8(data_in_8_0),
    .data_in_9(data_in_9_0),
    .data_in_10(data_in_10_0),
    .data_in_11(data_in_11_0),
    .data_in_12(data_in_12_0),
    .data_out_0(data_out_0_0),
    .data_out_1(data_out_1_0),
    .data_out_2(data_out_2_0),
    .data_out_3(data_out_3_0),
    .data_out_4(data_out_4_0),
    .data_out_5(data_out_5_0),
    .data_out_6(data_out_6_0),
    .data_out_7(data_out_7_0),
    .data_out_8(data_out_8_0),
    .data_out_9(data_out_9_0),
    .data_out_10(data_out_10_0),
    .data_out_11(data_out_11_0),
    .data_out_12(data_out_12_0),
    //Lay tin hi?u ??c và th? t? index
    .pattern_out0(pattern_out0),
    .pattern_out1(pattern_out1),
    .pattern_out2(pattern_out2),
    .pattern_out3(pattern_out3),
    .pattern_out4(pattern_out4),
    .pattern_out5(pattern_out5),
    .pattern_out6(pattern_out6),
    .pattern_out7(pattern_out7),
    .pattern_out8(pattern_out8),
    .pattern_out9(pattern_out9),
    .pattern_out10(pattern_out10),
    .pattern_out11(pattern_out11),
    .pattern_out12(pattern_out12),
    //Tín hi?u ghi
    .write_enable_0(write_enable_0),
    .write_enable_1(write_enable_1),
    .write_enable_2(write_enable_2),
    .write_enable_3(write_enable_3),
    .write_enable_4(write_enable_4),
    .write_enable_5(write_enable_5),
    .write_enable_6(write_enable_6),
    .write_enable_7(write_enable_7),
    .write_enable_8(write_enable_8),
    .write_enable_9(write_enable_9),
    .write_enable_10(write_enable_10),
    .write_enable_11(write_enable_11),
    .write_enable_12(write_enable_12)
    
    );
    
     RAM_13x19 BLOCK1(
    .clk(clk),
    .rst_n(rst_n),
    .addr_write(addr_write),
    .addr_read(addr_read),
    .data_in_0(data_in_0_1),
    .data_in_1(data_in_1_1),
    .data_in_2(data_in_2_1),
    .data_in_3(data_in_3_1),
    .data_in_4(data_in_4_1),
    .data_in_5(data_in_5_1),
    .data_in_6(data_in_6_1),
    .data_in_7(data_in_7_1),
    .data_in_8(data_in_8_1),
    .data_in_9(data_in_9_1),
    .data_in_10(data_in_10_1),
    .data_in_11(data_in_11_1),
    .data_in_12(data_in_12_1),
    .data_out_0(data_out_0_1),
    .data_out_1(data_out_1_1),
    .data_out_2(data_out_2_1),
    .data_out_3(data_out_3_1),
    .data_out_4(data_out_4_1),
    .data_out_5(data_out_5_1),
    .data_out_6(data_out_6_1),
    .data_out_7(data_out_7_1),
    .data_out_8(data_out_8_1),
    .data_out_9(data_out_9_1),
    .data_out_10(data_out_10_1),
    .data_out_11(data_out_11_1),
    .data_out_12(data_out_12_1),
    .pattern_out0(pattern_out0),
    .pattern_out1(pattern_out1),
    .pattern_out2(pattern_out2),
    .pattern_out3(pattern_out3),
    .pattern_out4(pattern_out4),
    .pattern_out5(pattern_out5),
    .pattern_out6(pattern_out6),
    .pattern_out7(pattern_out7),
    .pattern_out8(pattern_out8),
    .pattern_out9(pattern_out9),
    .pattern_out10(pattern_out10),
    .pattern_out11(pattern_out11),
    .pattern_out12(pattern_out12),
    .write_enable_0(write_enable_0),
    .write_enable_1(write_enable_1),
    .write_enable_2(write_enable_2),
    .write_enable_3(write_enable_3),
    .write_enable_4(write_enable_4),
    .write_enable_5(write_enable_5),
    .write_enable_6(write_enable_6),
    .write_enable_7(write_enable_7),
    .write_enable_8(write_enable_8),
    .write_enable_9(write_enable_9),
    .write_enable_10(write_enable_10),
    .write_enable_11(write_enable_11),
    .write_enable_12(write_enable_12),
    
    .index_read_enable_0(index_read_enable_0),
    .index_read_enable_1(index_read_enable_1),
    .index_read_enable_2(index_read_enable_2),
    .index_read_enable_3(index_read_enable_3),
    .index_read_enable_4(index_read_enable_4),
    .index_read_enable_5(index_read_enable_5),
    .index_read_enable_6(index_read_enable_6),
    .index_read_enable_7(index_read_enable_7),
    .index_read_enable_8(index_read_enable_8),
   .index_read_enable_9(index_read_enable_9),
    .index_read_enable_10(index_read_enable_10),
    .index_read_enable_11(index_read_enable_11),
   .index_read_enable_12(index_read_enable_12),
    
    
     .ram_data_out_0(ram_data_out_0),
     .ram_data_out_1(ram_data_out_1),
     .ram_data_out_2(ram_data_out_2),
     .ram_data_out_3(ram_data_out_3),
     .ram_data_out_4(ram_data_out_4),
     .ram_data_out_5(ram_data_out_5),
     .ram_data_out_6(ram_data_out_6),
     .ram_data_out_7(ram_data_out_7),
     .ram_data_out_8(ram_data_out_8),
     .ram_data_out_9(ram_data_out_9),
     .ram_data_out_10(ram_data_out_10),
     .ram_data_out_11(ram_data_out_11),
     .ram_data_out_12(ram_data_out_12)
    );
    
    
     RAM_13x19 BLOCK2(
    .clk(clk),
    .rst_n(rst_n),
    .addr_write(addr_write),
    .addr_read(addr_read),
    .data_in_0(data_in_0_2),
    .data_in_1(data_in_1_2),
    .data_in_2(data_in_2_2),
    .data_in_3(data_in_3_2),
    .data_in_4(data_in_4_2),
    .data_in_5(data_in_5_2),
    .data_in_6(data_in_6_2),
    .data_in_7(data_in_7_2),
    .data_in_8(data_in_8_2),
    .data_in_9(data_in_9_2),
    .data_in_10(data_in_10_2),
    .data_in_11(data_in_11_2),
    .data_in_12(data_in_12_2),
    .data_out_0(data_out_0_2),
    .data_out_1(data_out_1_2),
    .data_out_2(data_out_2_2),
    .data_out_3(data_out_3_2),
    .data_out_4(data_out_4_2),
    .data_out_5(data_out_5_2),
    .data_out_6(data_out_6_2),
    .data_out_7(data_out_7_2),
    .data_out_8(data_out_8_2),
    .data_out_9(data_out_9_2),
    .data_out_10(data_out_10_2),
    .data_out_11(data_out_11_2),
    .data_out_12(data_out_12_2),
    .pattern_out0(pattern_out0),
    .pattern_out1(pattern_out1),
    .pattern_out2(pattern_out2),
    .pattern_out3(pattern_out3),
    .pattern_out4(pattern_out4),
    .pattern_out5(pattern_out5),
    .pattern_out6(pattern_out6),
    .pattern_out7(pattern_out7),
    .pattern_out8(pattern_out8),
    .pattern_out9(pattern_out9),
    .pattern_out10(pattern_out10),
    .pattern_out11(pattern_out11),
    .pattern_out12(pattern_out12),
    .write_enable_0(write_enable_0),
    .write_enable_1(write_enable_1),
    .write_enable_2(write_enable_2),
    .write_enable_3(write_enable_3),
    .write_enable_4(write_enable_4),
    .write_enable_5(write_enable_5),
    .write_enable_6(write_enable_6),
    .write_enable_7(write_enable_7),
    .write_enable_8(write_enable_8),
    .write_enable_9(write_enable_9),
    .write_enable_10(write_enable_10),
    .write_enable_11(write_enable_11),
    .write_enable_12(write_enable_12)
    );
   
    
    
endmodule
