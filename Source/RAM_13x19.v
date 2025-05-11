`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025
// Design Name: 
// Module Name: RAM_13x19
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: M?t mô-?un ch?a 13 thanh RAM, m?i thanh RAM có kích th??c 19x16 bit,
//              v?i các tín hi?u `data_in` và `data_out` riêng bi?t cho m?i thanh RAM.
//              Các tín hi?u `index_read_enable` và `write_enable` m?i tín hi?u có 13 c?ng 5 bit.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module RAM_13x19 (
    input wire clk,                // Tín hi?u ??ng h?
    input wire rst_n,                // Tín hi?u reset
    input wire [4:0] addr_write,   // ??a ch? ghi (0 ??n 18)
    input wire [4:0] addr_read,    // ??a ch? ??c (0 ??n 18)
    
    // Tín hi?u ghi vào RAM
    input wire [15:0] data_in_0,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4,   // D? li?u vào RAM 4 (16 bit)
    input wire [15:0] data_in_5,   // D? li?u vào RAM 5 (16 bit)
    input wire [15:0] data_in_6,   // D? li?u vào RAM 6 (16 bit)
    input wire [15:0] data_in_7,   // D? li?u vào RAM 7 (16 bit)
    input wire [15:0] data_in_8,   // D? li?u vào RAM 8 (16 bit)
    input wire [15:0] data_in_9,   // D? li?u vào RAM 9 (16 bit)
    input wire [15:0] data_in_10,  // D? li?u vào RAM 10 (16 bit)
    input wire [15:0] data_in_11,  // D? li?u vào RAM 11 (16 bit)
    input wire [15:0] data_in_12,  // D? li?u vào RAM 12 (16 bit)
    
    // D? li?u ra t? các RAM
    output wire [19:0] data_out_0,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4,  // D? li?u ra t? RAM 4 (16 bit)
    output wire [19:0] data_out_5,  // D? li?u ra t? RAM 5 (16 bit)
    output wire [19:0] data_out_6,  // D? li?u ra t? RAM 6 (16 bit)
    output wire [19:0] data_out_7,  // D? li?u ra t? RAM 7 (16 bit)
    output wire [19:0] data_out_8,  // D? li?u ra t? RAM 8 (16 bit)
    output wire [19:0] data_out_9,  // D? li?u ra t? RAM 9 (16 bit)
    output wire [19:0] data_out_10, // D? li?u ra t? RAM 10 (16 bit)
    output wire [19:0] data_out_11, // D? li?u ra t? RAM 11 (16 bit)
    output wire [19:0] data_out_12, // D? li?u ra t? RAM 12 (16 bit)
    
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
    
    
    output [15:0] ram_data_out_0,
    output [15:0] ram_data_out_1,
    output [15:0] ram_data_out_2,
    output [15:0] ram_data_out_3,
    output [15:0] ram_data_out_4,
    output [15:0] ram_data_out_5,
    output [15:0] ram_data_out_6,
    output [15:0] ram_data_out_7,
    output [15:0] ram_data_out_8,
    output [15:0] ram_data_out_9,
    output [15:0] ram_data_out_10,
    output [15:0] ram_data_out_11,
    output [15:0] ram_data_out_12
    

    
);

     //Khai báo 13 thanh RAM, m?i thanh có kích th??c 19x16 bit
//    wire [15:0] ram_data_out_0, ram_data_out_1, ram_data_out_2, ram_data_out_3;
//    wire [15:0] ram_data_out_4, ram_data_out_5, ram_data_out_6, ram_data_out_7;
//    wire [15:0] ram_data_out_8, ram_data_out_9, ram_data_out_10, ram_data_out_11;
//    wire [15:0] ram_data_out_12;
    
//    wire index_read_enable_0;
//    wire index_read_enable_1;
//    wire index_read_enable_2;
//    wire index_read_enable_3;
//    wire index_read_enable_4;
//    wire index_read_enable_5;
//    wire index_read_enable_6;
//    wire index_read_enable_7;
//    wire index_read_enable_8;
//    wire index_read_enable_9;
//    wire index_read_enable_10;
//    wire index_read_enable_11;
//    wire index_read_enable_12;
    
    assign index_read_enable_0 = pattern_out0[0];
    assign index_read_enable_1 = pattern_out1[0];
    assign index_read_enable_2 = pattern_out2[0];
    assign index_read_enable_3 = pattern_out3[0];
    assign index_read_enable_4 = pattern_out4[0];
    assign index_read_enable_5 = pattern_out5[0];
    assign index_read_enable_6 = pattern_out6[0];
    assign index_read_enable_7 = pattern_out7[0];
    assign index_read_enable_8 = pattern_out8[0];
    assign index_read_enable_9 = pattern_out9[0];
    assign index_read_enable_10 = pattern_out10[0];
    assign index_read_enable_11 = pattern_out11[0];
    assign index_read_enable_12 = pattern_out12[0];
    
    // Các mô-?un RAM 19x16
    RAM_input ram_0 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_0),
        .write_enable(write_enable_0),
        .read_enable(index_read_enable_0),
        .data_out(ram_data_out_0)
    );
    
    assign data_out_0 = {pattern_out0[4:1], ram_data_out_0};
    
    
    RAM_input ram_1 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_1),
        .write_enable(write_enable_1),
        .read_enable(index_read_enable_1),
        .data_out(ram_data_out_1)
    );
    assign data_out_1 = {pattern_out1[4:1], ram_data_out_1};

    always @(posedge clk) begin
    $display("=================RAM_DATA_OUT =======================");
    $display("Time = %0t | ram_data_out_0 = %d", $time, ram_data_out_0);
    $display("Time = %0t | ram_data_out_1 = %d", $time, ram_data_out_1);
    $display("Time = %0t | ram_data_out_2 = %d", $time, ram_data_out_2);
    $display("Time = %0t | ram_data_out_3 = %d", $time, ram_data_out_3);
    $display("Time = %0t | ram_data_out_4 = %d", $time, ram_data_out_4);
    $display("Time = %0t | ram_data_out_5 = %d", $time, ram_data_out_5);
    $display("Time = %0t | ram_data_out_6 = %d", $time, ram_data_out_6);
    $display("Time = %0t | ram_data_out_7 = %d", $time, ram_data_out_7);
    $display("Time = %0t | ram_data_out_8 = %d", $time, ram_data_out_8);
    $display("Time = %0t | ram_data_out_9 = %d", $time, ram_data_out_9);
    $display("Time = %0t | ram_data_out_10 = %d", $time, ram_data_out_10);
    $display("Time = %0t | ram_data_out_11 = %d", $time, ram_data_out_11);
    $display("Time = %0t | ram_data_out_12 = %d", $time, ram_data_out_12);

end
   always @(posedge clk) begin
    $display("=================DETAIL =======================");
    $display("Time = %0t | addr_write = %d", $time, addr_write);
    $display("Time = %0t | addr_read = %d", $time, addr_read);
    $display("=================WRITE_ENABLE===================");
    $display("Time = %0t | write_enable_0 = %d", $time, write_enable_0);
    $display("Time = %0t | write_enable_1 = %d", $time, write_enable_1);
    $display("Time = %0t | write_enable_2 = %d", $time, write_enable_2);
    $display("Time = %0t | write_enable_3 = %d", $time, write_enable_3);
    $display("Time = %0t | write_enable_4 = %d", $time, write_enable_4);
    $display("Time = %0t | write_enable_5 = %d", $time, write_enable_5);
    $display("Time = %0t | write_enable_6 = %d", $time, write_enable_6);
    $display("Time = %0t | write_enable_7 = %d", $time, write_enable_7);
    $display("Time = %0t | write_enable_8 = %d", $time, write_enable_8);
    $display("Time = %0t | write_enable_0 = %d", $time, write_enable_9);
    $display("Time = %0t | write_enable_10 = %d", $time, write_enable_10);
    $display("Time = %0t | write_enable_11 = %d", $time, write_enable_11);
    $display("Time = %0t | write_enable_12 = %d", $time, write_enable_12);
    
    $display("======================READ_ENABLE===================");
    $display("Time = %0t | index_read_enable_0 = %d", $time, index_read_enable_0);
    $display("Time = %0t | index_read_enable_1 = %d", $time, index_read_enable_1);
    $display("Time = %0t | index_read_enable_2 = %d", $time, index_read_enable_2);
    $display("Time = %0t | index_read_enable_3 = %d", $time, index_read_enable_3);
    $display("Time = %0t | index_read_enable_4 = %d", $time, index_read_enable_4);
    $display("Time = %0t | index_read_enable_5 = %d", $time, index_read_enable_5);
    $display("Time = %0t | index_read_enable_6 = %d", $time, index_read_enable_6);
    $display("Time = %0t | index_read_enable_7 = %d", $time, index_read_enable_7);
    $display("Time = %0t | index_read_enable_8 = %d", $time, index_read_enable_8);
    $display("Time = %0t | index_read_enable_9 = %d", $time, index_read_enable_9);
    $display("Time = %0t | index_read_enable_10 = %d", $time, index_read_enable_10);
    $display("Time = %0t | index_read_enable_11 = %d", $time, index_read_enable_11);
    $display("Time = %0t | index_read_enable_12 = %d", $time, index_read_enable_12);
            
    


end

    RAM_input ram_2 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_2),
        .write_enable(write_enable_2),
        .read_enable(index_read_enable_2),
        .data_out(ram_data_out_2)
    );
    assign data_out_2 = {pattern_out2[4:1], ram_data_out_2};
    
    RAM_input ram_3 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_3),
        .write_enable(write_enable_3),
        .read_enable(index_read_enable_3),
        .data_out(ram_data_out_3)
    );
    assign data_out_3 = {pattern_out3[4:1], ram_data_out_3};

    RAM_input ram_4 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_4),
        .write_enable(write_enable_4),
        .read_enable(index_read_enable_4),
        .data_out(ram_data_out_4)
    );
    assign data_out_4 = {pattern_out4[4:1], ram_data_out_4};
    
    RAM_input ram_5 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_5),
        .write_enable(write_enable_5),
        .read_enable(index_read_enable_5),
        .data_out(ram_data_out_5)
    );
    assign data_out_5 = {pattern_out5[4:1], ram_data_out_5};
    
    RAM_input ram_6 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_6),
        .write_enable(write_enable_6),
        .read_enable(index_read_enable_6),
        .data_out(ram_data_out_6)
    );
    assign data_out_6 = {pattern_out6[4:1], ram_data_out_6};

    RAM_input ram_7 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_7),
        .write_enable(write_enable_7),
        .read_enable(index_read_enable_7),
        .data_out(ram_data_out_7)
    );
    assign data_out_7 = {pattern_out7[4:1], ram_data_out_7};
    
    RAM_input ram_8 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_8),
        .write_enable(write_enable_8),
        .read_enable(index_read_enable_8),
        .data_out(ram_data_out_8)
    );
    assign data_out_8 = {pattern_out8[4:1], ram_data_out_8};
    
    RAM_input ram_9 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_9),
        .write_enable(write_enable_9),
        .read_enable(index_read_enable_9),
        .data_out(ram_data_out_9)
    );
    assign data_out_9 = {pattern_out9[4:1], ram_data_out_9};
    
    RAM_input ram_10 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_10),
        .write_enable(write_enable_10),
        .read_enable(index_read_enable_10),
        .data_out(ram_data_out_10)
    );
    assign data_out_10 = {pattern_out10[4:1], ram_data_out_10};

    RAM_input ram_11 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_11),
        .write_enable(write_enable_11),
        .read_enable(index_read_enable_11),
        .data_out(ram_data_out_11)
    );
    assign data_out_11 = {pattern_out11[4:1], ram_data_out_11};
    
    RAM_input ram_12 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_12),
        .write_enable(write_enable_12),
        .read_enable(index_read_enable_12),
        .data_out(ram_data_out_12)
    );
    assign data_out_12 = {pattern_out12[4:1], ram_data_out_12};
    
endmodule
