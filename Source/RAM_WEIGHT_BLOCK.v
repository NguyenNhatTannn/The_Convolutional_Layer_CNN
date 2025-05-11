`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/14/2025 11:29:18 AM
// Design Name: 
// Module Name: RAM_WEIGHT_BLOCK
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


module RAM_WEIGHT_BLOCK(
    input clk,
    input rst_n,
    input [2:0] addr_write,
    input [2:0] addr_read,
    
     // Tín hi?u ghi vào RAM
    input wire [15:0] data_in_0_0,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_0,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_0,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_0,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_0,   // D? li?u vào RAM 4 (16 bit)
    
    input wire [15:0] data_in_0_1,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_1,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_1,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_1,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_1,   // D? li?u vào RAM 4 (16 bit)
    
    input wire [15:0] data_in_0_2,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_2,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_2,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_2,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_2,   // D? li?u vào RAM 4 (16 bit)
    
    
    input wire [4:0] write_enable, // Tín hi?u ghi 13 bit (bit 0 ??n bit 12 cho các RAM)
    
    input wire  read_enable,
    
    output wire [19:0] data_out_0_0,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1_0,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2_0,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3_0,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4_0,
    
      // D? li?u ra t? RAM 4 (16 bit)
      
      
          
    output wire [19:0] data_out_0_1,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1_1,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2_1,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3_1,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4_1,
    
        
    output wire [19:0] data_out_0_2,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1_2,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2_2,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3_2,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4_2
 
    

    );
    
    RAM_5x5 ram0(
    .clk(clk),
    .rst_n(rst_n),
    .addr_write(addr_write),
    .addr_read(addr_read),
    .data_in_0(data_in_0_0),
    .data_in_1(data_in_1_0),
    .data_in_2(data_in_2_0),
    .data_in_3(data_in_3_0),
    .data_in_4(data_in_4_0),
    .write_enable(write_enable),
    .read_enable(read_enable),
    .data_out_0(data_out_0_0),
    .data_out_1(data_out_1_0),
    .data_out_2(data_out_2_0),
    .data_out_3(data_out_3_0),
    .data_out_4(data_out_4_0)
    );
    
      RAM_5x5 ram1(
    .clk(clk),
    .rst_n(rst_n),
    .addr_write(addr_write),
    .addr_read(addr_read),
    .data_in_0(data_in_0_1),
    .data_in_1(data_in_1_1),
    .data_in_2(data_in_2_1),
    .data_in_3(data_in_3_1),
    .data_in_4(data_in_4_1),
    .write_enable(write_enable),
    .read_enable(read_enable),
    .data_out_0(data_out_0_1),
    .data_out_1(data_out_1_1),
    .data_out_2(data_out_2_1),
    .data_out_3(data_out_3_1),
    .data_out_4(data_out_4_1)
    );
    
        RAM_5x5 ram2(
    .clk(clk),
    .rst_n(rst_n),
    .addr_write(addr_write),
    .addr_read(addr_read),
    .data_in_0(data_in_0_2),
    .data_in_1(data_in_1_2),
    .data_in_2(data_in_2_2),
    .data_in_3(data_in_3_2),
    .data_in_4(data_in_4_2),
    .write_enable(write_enable),
    .read_enable(read_enable),
    .data_out_0(data_out_0_2),
    .data_out_1(data_out_1_2),
    .data_out_2(data_out_2_2),
    .data_out_3(data_out_3_2),
    .data_out_4(data_out_4_2)
    );
    
    
endmodule
