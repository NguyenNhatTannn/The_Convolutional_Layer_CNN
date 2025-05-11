`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/13/2025 08:25:15 PM
// Design Name: 
// Module Name: TOP_ARCHITECTURE_BLOCK
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TOP_ARCHITECTURE_BLOCK(

    //INPUT NHAN TU BUS BEN NGOAI
    input wire wr_en,       // Ghi d? li?u

    // D? li?u ??u vào
    input wire [2:0] kernel_size_in,
    input wire [4:0] img_size_in,
    input wire  [1:0] stride_in,
    input clk,
    input rst_n,
    input start,
    input wire [12:0] write_enable_input,
    input [4:0] addr_write_input,
    input [4:0] width_size_in,
    input pop,
    input [4:0] number_kernel_in,
//    input [4:0] addr_read_input,
    //test
 
    output [2:0] counter_1,
    output [4:0] counter_2,
    output [4:0] width_size_out,
    
    //BLOCK1
    input wire [15:0] data_in_0_0_input,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_0_input,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_0_input,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_0_input,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_0_input,   // D? li?u vào RAM 4 (16 bit)
    input wire [15:0] data_in_5_0_input,   // D? li?u vào RAM 5 (16 bit)
    input wire [15:0] data_in_6_0_input,   // D? li?u vào RAM 6 (16 bit)
    input wire [15:0] data_in_7_0_input,   // D? li?u vào RAM 7 (16 bit)
    input wire [15:0] data_in_8_0_input,   // D? li?u vào RAM 8 (16 bit)
    input wire [15:0] data_in_9_0_input,   // D? li?u vào RAM 9 (16 bit)
    input wire [15:0] data_in_10_0_input,  // D? li?u vào RAM 10 (16 bit)
    input wire [15:0] data_in_11_0_input,  // D? li?u vào RAM 11 (16 bit)
    input wire [15:0] data_in_12_0_input,  
    
    //BLOCK2
    input wire [15:0] data_in_0_1_input,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_1_input,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_1_input,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_1_input,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_1_input,   // D? li?u vào RAM 4 (16 bit)
    input wire [15:0] data_in_5_1_input,   // D? li?u vào RAM 5 (16 bit)
    input wire [15:0] data_in_6_1_input,   // D? li?u vào RAM 6 (16 bit)
    input wire [15:0] data_in_7_1_input,   // D? li?u vào RAM 7 (16 bit)
    input wire [15:0] data_in_8_1_input,   // D? li?u vào RAM 8 (16 bit)
    input wire [15:0] data_in_9_1_input,   // D? li?u vào RAM 9 (16 bit)
    input wire [15:0] data_in_10_1_input,  // D? li?u vào RAM 10 (16 bit)
    input wire [15:0] data_in_11_1_input,  // D? li?u vào RAM 11 (16 bit)
    input wire [15:0] data_in_12_1_input,  
    
    //BLOCK3
    input wire [15:0] data_in_0_2_input,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_2_input,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_2_input,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_2_input,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_2_input,   // D? li?u vào RAM 4 (16 bit)
    input wire [15:0] data_in_5_2_input,   // D? li?u vào RAM 5 (16 bit)
    input wire [15:0] data_in_6_2_input,   // D? li?u vào RAM 6 (16 bit)
    input wire [15:0] data_in_7_2_input,   // D? li?u vào RAM 7 (16 bit)
    input wire [15:0] data_in_8_2_input,   // D? li?u vào RAM 8 (16 bit)
    input wire [15:0] data_in_9_2_input,   // D? li?u vào RAM 9 (16 bit)
    input wire [15:0] data_in_10_2_input,  // D? li?u vào RAM 10 (16 bit)
    input wire [15:0] data_in_11_2_input,  // D? li?u vào RAM 11 (16 bit)
    input wire [15:0] data_in_12_2_input,  
    
    
    //Dung cho ca 3 khoi 
//    
    
    //INPUT TIN HIEU DOC va INDEX
    //Danh cho ca 3 khoi
    output [4:0] pattern_out0_input,
    output [4:0] pattern_out1_input,
    output [4:0] pattern_out2_input,
    output [4:0] pattern_out3_input,
    output [4:0] pattern_out4_input,
    output [4:0] pattern_out5_input,
    output [4:0] pattern_out6_input,
    output [4:0] pattern_out7_input,
    output [4:0] pattern_out8_input,
    output [4:0] pattern_out9_input,
    output [4:0] pattern_out10_input,
    output [4:0] pattern_out11_input,
    output [4:0] pattern_out12_input,
    
    
    //OUTPUT BLOCK 0
    output wire [19:0] data_out_0_0_input,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1_0_input,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2_0_input,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3_0_input,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4_0_input,  // D? li?u ra t? RAM 4 (16 bit)
    output wire [19:0] data_out_5_0_input,  // D? li?u ra t? RAM 5 (16 bit)
    output wire [19:0] data_out_6_0_input,  // D? li?u ra t? RAM 6 (16 bit)
    output wire [19:0] data_out_7_0_input,  // D? li?u ra t? RAM 7 (16 bit)
    output wire [19:0] data_out_8_0_input,  // D? li?u ra t? RAM 8 (16 bit)
    output wire [19:0] data_out_9_0_input,  // D? li?u ra t? RAM 9 (16 bit)
    output wire [19:0] data_out_10_0_input, // D? li?u ra t? RAM 10 (16 bit)
    output wire [19:0] data_out_11_0_input, // D? li?u ra t? RAM 11 (16 bit)
    output wire [19:0] data_out_12_0_input, // D? li?u ra t? RAM 12 (16 bit)
    
    //OUTPUT BLOCK 1
    output wire [19:0] data_out_0_1_input,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1_1_input,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2_1_input,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3_1_input,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4_1_input,  // D? li?u ra t? RAM 4 (16 bit)
    output wire [19:0] data_out_5_1_input,  // D? li?u ra t? RAM 5 (16 bit)
    output wire [19:0] data_out_6_1_input,  // D? li?u ra t? RAM 6 (16 bit)
    output wire [19:0] data_out_7_1_input,  // D? li?u ra t? RAM 7 (16 bit)
    output wire [19:0] data_out_8_1_input,  // D? li?u ra t? RAM 8 (16 bit)
    output wire [19:0] data_out_9_1_input,  // D? li?u ra t? RAM 9 (16 bit)
    output wire [19:0] data_out_10_1_input, // D? li?u ra t? RAM 10 (16 bit)
    output wire [19:0] data_out_11_1_input, // D? li?u ra t? RAM 11 (16 bit)
    output wire [19:0] data_out_12_1_input, // D? li?u ra t? RAM 12 (16 bit)
    
    //OUTPUT BLOCK 2
    output wire [19:0] data_out_0_2_input,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1_2_input,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2_2_input,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3_2_input,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4_2_input,  // D? li?u ra t? RAM 4 (16 bit)
    output wire [19:0] data_out_5_2_input,  // D? li?u ra t? RAM 5 (16 bit)
    output wire [19:0] data_out_6_2_input,  // D? li?u ra t? RAM 6 (16 bit)
    output wire [19:0] data_out_7_2_input,  // D? li?u ra t? RAM 7 (16 bit)
    output wire [19:0] data_out_8_2_input,  // D? li?u ra t? RAM 8 (16 bit)
    output wire [19:0] data_out_9_2_input,  // D? li?u ra t? RAM 9 (16 bit)
    output wire [19:0] data_out_10_2_input, // D? li?u ra t? RAM 10 (16 bit)
    output wire [19:0] data_out_11_2_input, // D? li?u ra t? RAM 11 (16 bit)
    output wire [19:0] data_out_12_2_input, // D? li?u ra t? RAM 12 (16 bit)
    
    input [2:0] addr_write_weight, //ok
    
     // Tín hi?u ghi vào RAM
    input wire [15:0] data_in_0_0_weight,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_0_weight,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_0_weight,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_0_weight,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_0_weight,   // D? li?u vào RAM 4 (16 bit)
    
    input wire [15:0] data_in_0_1_weight,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_1_weight,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_1_weight,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_1_weight,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_1_weight,   // D? li?u vào RAM 4 (16 bit)
    
    input wire [15:0] data_in_0_2_weight,   // D? li?u vào RAM 0 (16 bit)
    input wire [15:0] data_in_1_2_weight,   // D? li?u vào RAM 1 (16 bit)
    input wire [15:0] data_in_2_2_weight,   // D? li?u vào RAM 2 (16 bit)
    input wire [15:0] data_in_3_2_weight,   // D? li?u vào RAM 3 (16 bit)
    input wire [15:0] data_in_4_2_weight,   // D? li?u vào RAM 4 (16 bit)
    
    
    input wire [4:0] write_enable_weight, // Tín hi?u ghi 13 bit (bit 0 ??n bit 12 cho các RAM) // ok
    
    
    output wire [15:0] data_out_0_0_weight,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [15:0] data_out_1_0_weight,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [15:0] data_out_2_0_weight,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [15:0] data_out_3_0_weight,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [15:0] data_out_4_0_weight,
    
      // D? li?u ra t? RAM 4 (16 bit)
      
      
          
    output wire [15:0] data_out_0_1_weight,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [15:0] data_out_1_1_weight,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [15:0] data_out_2_1_weight,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [15:0] data_out_3_1_weight,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [15:0] data_out_4_1_weight,
    
        
    output wire [15:0] data_out_0_2_weight,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [15:0] data_out_1_2_weight,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [15:0] data_out_2_2_weight,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [15:0] data_out_3_2_weight,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [15:0] data_out_4_2_weight,
 
 
    //RAM CONFIG
    


    // D? li?u ??u ra
    output  [2:0] kernel_size_out,
    output  [4:0] img_size_out,
    output    [1:0] stride_out,
    output wire  [4:0]  m,
    output wire  [4:0]  start_line,
    output wire [4:0]  addr_read_RAM_input,
    
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
    output [19:0] ram_data_out_12,
    
    output [2:0] addr_read_RAM_weight,
   
   ///
     output  max_reached2,
    output max_reached1,


    output rw_mode_w,
    output [2:0] addr_i,
    output rw_mode_i,
    output [4:0] cc,
    output ready_weight,
    output ready_input,
    output ready_psum,
    output sign_sel,
    output psum_row,
    output addr_psum,
    output rw_mode_psum,
    output sel_stride,
    output wire [24:0] enable_active,
    output next_step,
    output [2:0] out_state,
    output enable_counter_3bit,
    
    ///
    output  [15:0] dout_input_01,
    output  [15:0] dout_input_02,
    output  [15:0] dout_input_03,
    output  [15:0] dout_input_04,
    output  [15:0] dout_input_05,
    output  [15:0] dout_input_06,
    output  [15:0] dout_input_07,
    output  [15:0] dout_input_08,
    output  [15:0] dout_input_09,
    output  [15:0] dout_input_10,
    output  [15:0] dout_input_11,
    output  [15:0] dout_input_12,
    output  [15:0] dout_input_13,
    
    output  [15:0] dout_input_01_2,
    output  [15:0] dout_input_02_2,
    output  [15:0] dout_input_03_2,
    output  [15:0] dout_input_04_2,
    output  [15:0] dout_input_05_2,
    output  [15:0] dout_input_06_2,
    output  [15:0] dout_input_07_2,
    output  [15:0] dout_input_08_2,
    output  [15:0] dout_input_09_2,
    output  [15:0] dout_input_10_2,
    output  [15:0] dout_input_11_2,
    output  [15:0] dout_input_12_2,
    output  [15:0] dout_input_13_2,
    
    output  [15:0] dout_input_01_3,
    output  [15:0] dout_input_02_3,
    output  [15:0] dout_input_03_3,
    output  [15:0] dout_input_04_3,
    output  [15:0] dout_input_05_3,
    output  [15:0] dout_input_06_3,
    output  [15:0] dout_input_07_3,
    output  [15:0] dout_input_08_3,
    output  [15:0] dout_input_09_3,
    output  [15:0] dout_input_10_3,
    output  [15:0] dout_input_11_3,
    output  [15:0] dout_input_12_3,
    output  [15:0] dout_input_13_3,
    
    output [15:0] d_1,
    output [15:0] d_2,
    output [15:0] d_3,
    output [15:0] d_4,
    output [15:0] d_5,
    output [15:0] d_6,
    output [15:0] d_7,
    output [15:0] d_8,
    output [15:0] d_9,
    output [15:0] d_10,
    output [15:0] d_11,
    output [15:0] d_12,
    output [15:0] d_13,
    output [15:0] d_14,
    output [15:0] d_15,
    output [15:0] d_16,
    output [15:0] d_17,
    output [15:0] d_18,
    output [15:0] d_19,
    output [15:0] d_20,
    output [15:0] d_21,
    output [15:0] d_22,
    output [15:0] d_23,
    output [15:0] d_24,
    output [15:0] d_25,
    
    
    output [15:0] d_1_2,
    output [15:0] d_2_2,
    output [15:0] d_3_2,
    output [15:0] d_4_2,
    output [15:0] d_5_2,
    output [15:0] d_6_2,
    output [15:0] d_7_2,
    output [15:0] d_8_2,
    output [15:0] d_9_2,
    output [15:0] d_10_2,
    output [15:0] d_11_2,
    output [15:0] d_12_2,
    output [15:0] d_13_2,
    output [15:0] d_14_2,
    output [15:0] d_15_2,
    output [15:0] d_16_2,
    output [15:0] d_17_2,
    output [15:0] d_18_2,
    output [15:0] d_19_2,
    output [15:0] d_20_2,
    output [15:0] d_21_2,
    output [15:0] d_22_2,
    output [15:0] d_23_2,
    output [15:0] d_24_2,
    output [15:0] d_25_2,
    
    output [15:0] d_1_3,
    output [15:0] d_2_3,
    output [15:0] d_3_3,
    output [15:0] d_4_3,
    output [15:0] d_5_3,
    output [15:0] d_6_3,
    output [15:0] d_7_3,
    output [15:0] d_8_3,
    output [15:0] d_9_3,
    output [15:0] d_10_3,
    output [15:0] d_11_3,
    output [15:0] d_12_3,
    output [15:0] d_13_3,
    output [15:0] d_14_3,
    output [15:0] d_15_3,
    output [15:0] d_16_3,
    output [15:0] d_17_3,
    output [15:0] d_18_3,
    output [15:0] d_19_3,
    output [15:0] d_20_3,
    output [15:0] d_21_3,
    output [15:0] d_22_3,
    output [15:0] d_23_3,
    output [15:0] d_24_3,
    output [15:0] d_25_3,
  
    
    output [15:0] out_sum_01,
    output [15:0] out_sum_02,
    output [15:0] out_sum_03,
    output [15:0] out_sum_04,
    output [15:0] out_sum_05,
    
    output [15:0] out_sum_01_2,
    output [15:0] out_sum_02_2,
    output [15:0] out_sum_03_2,
    output [15:0] out_sum_04_2,
    output [15:0] out_sum_05_2,
    
    output [15:0] out_sum_01_3,
    output [15:0] out_sum_02_3,
    output [15:0] out_sum_03_3,
    output [15:0] out_sum_04_3,
    output [15:0] out_sum_05_3,
    
           output [15:0] output_data_weight_1,
           output [15:0] output_data_input_1,
           output [15:0] out_weight_1,
           output [15:0] out_input_1,
           
           
           output [15:0] output_data_weight_2,
           output [15:0] output_data_input_2,
           output [15:0] out_weight_2,
           output [15:0] out_input_2,
           
            output [15:0] output_data_weight_3,
           output [15:0] output_data_input_3,
           output [15:0] out_weight_3,
           output [15:0] out_input_3,
           
            output [15:0] output_data_weight_4,
           output [15:0] output_data_input_4,
           output [15:0] out_weight_4,
           output [15:0] out_input_4,
           
            output [15:0] output_data_weight_5,
           output [15:0] output_data_input_5,
           output [15:0] out_weight_5,
           output [15:0] out_input_5,
           
           
           output [15:0] out_weight_1_2,
           output [15:0] out_input_1_2,
           output [15:0] out_weight_2_2,
           output [15:0] out_input_2_2,
           output [15:0] out_weight_3_2,
           output [15:0] out_input_3_2,
           output [15:0] out_weight_4_2,
           output [15:0] out_input_4_2,
           output [15:0] out_weight_5_2,
           output [15:0] out_input_5_2,
           
            output [15:0] out_weight_1_3,
           output [15:0] out_input_1_3,
           output [15:0] out_weight_2_3,
           output [15:0] out_input_2_3,
           output [15:0] out_weight_3_3,
           output [15:0] out_input_3_3,
           output [15:0] out_weight_4_3,
           output [15:0] out_input_4_3,
           output [15:0] out_weight_5_3,
           output [15:0] out_input_5_3,
           
           output [15:0] out_multi_01,
           output [15:0] out_multi_02,
           output [15:0] out_multi_03,
           output [15:0] out_multi_04,
           output [15:0] out_multi_05,
           output [15:0] out_multi_06,
           output [15:0] out_multi_07,
           output [15:0] out_multi_08,
           output [15:0] out_multi_09,
           output [15:0] out_multi_10,
             output [15:0] out_multi_11,
           output [15:0] out_multi_12,
           output [15:0] out_multi_13,
           output [15:0] out_multi_14,
           output [15:0] out_multi_15,
             output [15:0] out_multi_16,
           output [15:0] out_multi_17,
           output [15:0] out_multi_18,
           output [15:0] out_multi_19,
           output [15:0] out_multi_20,  
           output [15:0] out_multi_25,
           output [15:0] out_multi_21,
           output [15:0] out_multi_22,
           output [15:0] out_multi_23,
           output [15:0] out_multi_24,
           
             output [15:0] out_multi_01_2,
           output [15:0] out_multi_02_2,
           output [15:0] out_multi_03_2,
           output [15:0] out_multi_04_2,
           output [15:0] out_multi_05_2,
           output [15:0] out_multi_06_2,
           output [15:0] out_multi_07_2,
           output [15:0] out_multi_08_2,
           output [15:0] out_multi_09_2,
           output [15:0] out_multi_10_2,
             output [15:0] out_multi_11_2,
           output [15:0] out_multi_12_2,
           output [15:0] out_multi_13_2,
           output [15:0] out_multi_14_2,
           output [15:0] out_multi_15_2,
             output [15:0] out_multi_16_2,
           output [15:0] out_multi_17_2,
           output [15:0] out_multi_18_2,
           output [15:0] out_multi_19_2,
           output [15:0] out_multi_20_2,  
           output [15:0] out_multi_25_2,
           output [15:0] out_multi_21_2,
           output [15:0] out_multi_22_2,
           output [15:0] out_multi_23_2,
           output [15:0] out_multi_24_2,
           
            output [15:0] out_multi_01_3,
           output [15:0] out_multi_02_3,
           output [15:0] out_multi_03_3,
           output [15:0] out_multi_04_3,
           output [15:0] out_multi_05_3,
           output [15:0] out_multi_06_3,
           output [15:0] out_multi_07_3,
           output [15:0] out_multi_08_3,
           output [15:0] out_multi_09_3,
           output [15:0] out_multi_10_3,
             output [15:0] out_multi_11_3,
           output [15:0] out_multi_12_3,
           output [15:0] out_multi_13_3,
           output [15:0] out_multi_14_3,
           output [15:0] out_multi_15_3,
             output [15:0] out_multi_16_3,
           output [15:0] out_multi_17_3,
           output [15:0] out_multi_18_3,
           output [15:0] out_multi_19_3,
           output [15:0] out_multi_20_3,  
           output [15:0] out_multi_25_3,
           output [15:0] out_multi_21_3,
           output [15:0] out_multi_22_3,
           output [15:0] out_multi_23_3,
           output [15:0] out_multi_24_3,
           
           
           output pop_i,
           output pop_w,
           
     output [15:0] psum_sub_02,
     output [15:0] psum_sub_03,
     output [15:0] psum_sub_04,
     output [15:0] psum_sub_05,
     output [15:0] psum_sub_07,
     output [15:0] psum_sub_08,
     output [15:0] psum_sub_09,
     output [15:0] psum_sub_10,
     output [15:0] psum_sub_12,
     output [15:0] psum_sub_13,
     output [15:0] psum_sub_14,
     output [15:0] psum_sub_15,
     output [15:0] psum_sub_17,
     output [15:0] psum_sub_18,
     output [15:0] psum_sub_19,
     output [15:0] psum_sub_20,
     output [15:0] psum_sub_22,
     output [15:0] psum_sub_23,
     output [15:0] psum_sub_24,
     output [15:0] psum_sub_25,
     
     output sign_psum,
     output full_1,
     output empty_1,
     output [4:0] count_1,
     
     output [15:0] data_result_1,
     output [15:0] data_result_2,
     output [15:0] data_result_3,
     output [15:0] data_result_4,
     output [15:0] data_result_5,
     
     
     output HOANTHANH_flag,
     output DONE,
     
     output [15:0] out_psum_1,
     output [15:0] out_mux_1,
     output [15:0] out_sum_tmp_1,
     output [4:0] tmp,
     output [4:0] cot_working,
     output [4:0] number_kernel_out,
     output [4:0] number_kernel_working
     
 
 );
    
    
    
    //     //#########################################################################
//     // SYSTEM CONTROLLER NEW + BO GIAI MA RAMREAD-SELECTOR INPUT + BO GIAI MA RAM READ WEIGHT
//      //#########################################################################
   
      System_Controller_New system_controller(
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .ready_weight(ready_weight),
        .ready_input(ready_input),
        .ready_psum(ready_psum),
        //output
        .load_config(load_config),
        .enable_counter_3bit(enable_counter_3bit),
        .load(load),
        .pop_w(pop_w),
        .pop_i(pop_i),
        .enable_PE(enable_PE),
        .out_state(out_state),
        .sign_psum(sign_psum),
        .DONE(DONE),
        .number_kernel(number_kernel_working));
        
        
          Controller_PE_new controller(
    .clk(clk),
    .rst_n(rst_n),
    .load(load),
    .kernel_size(kernel_size_out),
    .width_size(width_size_out),
    .stride(stride_out),
    .counter1(counter_1),
    .counter2(counter_2),
    .rw_mode_w(rw_mode_w),
    .addr_i(addr_i),
    .rw_mode_i(rw_mode_i),
    .ready_weight(ready_weight),
    .ready_input(ready_input),
    .ready_psum(ready_psum),
    .enable_counter_3bit(enable_counter_3bit),
    .psum_row(psum_row),
    .sign_sel(sign_sel),
    .addr_psum(addr_psum),
    .rw_mode_psum(rw_mode_psum),
    .sign_psum(sign_psum),
    .sel_stride(sel_stride),
    .DONE(DONE)
//    .enable_active(enable_active),
 
    );
        
    wire enable_write_RAM_0,enable_write_RAM_1,enable_write_RAM_2,enable_write_RAM_3,enable_write_RAM_4;
    wire enable_write_RAM_5,enable_write_RAM_6,enable_write_RAM_7,enable_write_RAM_8,enable_write_RAM_9;
    wire enable_write_RAM_10,enable_write_RAM_11,enable_write_RAM_12;
       
    
    assign enable_write_RAM_0 = write_enable_input[0];
    assign enable_write_RAM_1 = write_enable_input[1];
    assign enable_write_RAM_2 = write_enable_input[2];
    assign enable_write_RAM_3 = write_enable_input[3];
    assign enable_write_RAM_4 = write_enable_input[4];
    assign enable_write_RAM_5 = write_enable_input[5];
    assign enable_write_RAM_6 = write_enable_input[6];
    assign enable_write_RAM_7 = write_enable_input[7];
    assign enable_write_RAM_8 = write_enable_input[8];
    assign enable_write_RAM_9 = write_enable_input[9];
    assign enable_write_RAM_10 = write_enable_input[10];
    assign enable_write_RAM_11 = write_enable_input[11];
    assign enable_write_RAM_12= write_enable_input[12];
    
    
    FIFO_RESULT result_1(
    .clk(clk),
    .rst_n(rst_n),
    .push(sign_psum),
    .pop(pop),
    .data_in(out_sum_01),
    .data_out(data_result_1),
    .empty(empty_1),
    .full(full_1),
    .count(count_1));

     FIFO_RESULT result_2(
    .clk(clk),
    .rst_n(rst_n),
    .push(sign_psum),
    .pop(pop),
    .data_in(out_sum_02),
    .data_out(data_result_2),
    .empty(empty_2),
    .full(full_2),
    .count(count_2));


     FIFO_RESULT result_3(
    .clk(clk),
    .rst_n(rst_n),
    .push(sign_psum),
    .pop(pop),
    .data_in(out_sum_03),
    .data_out(data_result_3),
    .empty(empty_3),
    .full(full_3),
    .count(count_3));


    FIFO_RESULT result_4(
    .clk(clk),
    .rst_n(rst_n),
    .push(sign_psum),
    .pop(pop),
    .data_in(out_sum_04),
    .data_out(data_result_4),
    .empty(empty),
    .full(full),
    .count(count));


     FIFO_RESULT result_5(
    .clk(clk),
    .rst_n(rst_n),
    .push(sign_psum),
    .pop(pop),
    .data_in(out_sum_05),
    .data_out(data_result_5),
    .empty(empty_5),
    .full(full_5),
    .count(count_5));

    
    
    RAM_INPUT_BLOCK RAMBLOCK(
    .clk(clk),
    .rst_n(rst_n),
    //GHI BEN NGOAI
    .addr_write(addr_write_input),
    
    //TU KHOI RAM READ SELECTOR
    .addr_read(addr_read_RAM_input),
    
    //WRITE_ENABLE
    .write_enable_0(enable_write_RAM_0),
    .write_enable_1(enable_write_RAM_1),
    .write_enable_2(enable_write_RAM_2),
    .write_enable_3(enable_write_RAM_3),
    .write_enable_4(enable_write_RAM_4),
    .write_enable_5(enable_write_RAM_5),
    .write_enable_6(enable_write_RAM_6),
    .write_enable_7(enable_write_RAM_7),
    .write_enable_8(enable_write_RAM_8),
    .write_enable_9(enable_write_RAM_9),
    .write_enable_10(enable_write_RAM_10),
    .write_enable_11(enable_write_RAM_11),
    .write_enable_12(enable_write_RAM_12),
    
    // data_in layer 0
    .data_in_0_0(data_in_0_0_input), .data_in_1_0(data_in_1_0_input), .data_in_2_0(data_in_2_0_input), .data_in_3_0(data_in_3_0_input),
    .data_in_4_0(data_in_4_0_input), .data_in_5_0(data_in_5_0_input), .data_in_6_0(data_in_6_0_input), .data_in_7_0(data_in_7_0_input),
    .data_in_8_0(data_in_8_0_input), .data_in_9_0(data_in_9_0_input), .data_in_10_0(data_in_10_0_input), .data_in_11_0(data_in_11_0_input),
    .data_in_12_0(data_in_12_0_input),

    // data_in layer 1
    .data_in_0_1(data_in_0_1_input), .data_in_1_1(data_in_1_1_input), .data_in_2_1(data_in_2_1_input), .data_in_3_1(data_in_3_1_input),
    .data_in_4_1(data_in_4_1_input), .data_in_5_1(data_in_5_1_input), .data_in_6_1(data_in_6_1_input), .data_in_7_1(data_in_7_1_input),
    .data_in_8_1(data_in_8_1_input), .data_in_9_1(data_in_9_1_input), .data_in_10_1(data_in_10_1_input), .data_in_11_1(data_in_11_1_input),
    .data_in_12_1(data_in_12_1_input),

    // data_in layer 2
    .data_in_0_2(data_in_0_2_input), .data_in_1_2(data_in_1_2_input), .data_in_2_2(data_in_2_2_input), .data_in_3_2(data_in_3_2_input),
    .data_in_4_2(data_in_4_2_input), .data_in_5_2(data_in_5_2_input), .data_in_6_2(data_in_6_2_input), .data_in_7_2(data_in_7_2_input),
    .data_in_8_2(data_in_8_2_input), .data_in_9_2(data_in_9_2_input), .data_in_10_2(data_in_10_2_input), .data_in_11_2(data_in_11_2_input),
    .data_in_12_2(data_in_12_2_input),

    // pattern_out - READ ENDABLE CUA INPUT NE
    .pattern_out0(pattern_out0_input), .pattern_out1(pattern_out1_input), .pattern_out2(pattern_out2_input), .pattern_out3(pattern_out3_input),
    .pattern_out4(pattern_out4_input), .pattern_out5(pattern_out5_input), .pattern_out6(pattern_out6_input), .pattern_out7(pattern_out7_input),
    .pattern_out8(pattern_out8_input), .pattern_out9(pattern_out9_input), .pattern_out10(pattern_out10_input), .pattern_out11(pattern_out11_input),
    .pattern_out12(pattern_out12_input),

    // data_out layer 0
    .data_out_0_0(data_out_0_0_input), .data_out_1_0(data_out_1_0_input), .data_out_2_0(data_out_2_0_input), .data_out_3_0(data_out_3_0_input),
    .data_out_4_0(data_out_4_0_input), .data_out_5_0(data_out_5_0_input), .data_out_6_0(data_out_6_0_input), .data_out_7_0(data_out_7_0_input),
    .data_out_8_0(data_out_8_0_input), .data_out_9_0(data_out_9_0_input), .data_out_10_0(data_out_10_0_input), .data_out_11_0(data_out_11_0_input),
    .data_out_12_0(data_out_12_0_input),

    // data_out layer 1
    .data_out_0_1(data_out_0_1_input), .data_out_1_1(data_out_1_1_input), .data_out_2_1(data_out_2_1_input), .data_out_3_1(data_out_3_1_input),
    .data_out_4_1(data_out_4_1_input), .data_out_5_1(data_out_5_1_input), .data_out_6_1(data_out_6_1_input), .data_out_7_1(data_out_7_1_input),
    .data_out_8_1(data_out_8_1_input), .data_out_9_1(data_out_9_1_input), .data_out_10_1(data_out_10_1_input), .data_out_11_1(data_out_11_1_input),
    .data_out_12_1(data_out_12_1_input),

    // data_out layer 2
    .data_out_0_2(data_out_0_2_input), .data_out_1_2(data_out_1_2_input), .data_out_2_2(data_out_2_2_input), .data_out_3_2(data_out_3_2_input),
    .data_out_4_2(data_out_4_2_input), .data_out_5_2(data_out_5_2_input), .data_out_6_2(data_out_6_2_input), .data_out_7_2(data_out_7_2_input),
    .data_out_8_2(data_out_8_2_input), .data_out_9_2(data_out_9_2_input), .data_out_10_2(data_out_10_2_input), .data_out_11_2(data_out_11_2_input),
    .data_out_12_2(data_out_12_2_input),
    
    
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



    RAM_WEIGHT_BLOCK RAMWEIGHT(
    .clk(clk), 
    .rst_n(rst_n), 
    .addr_write(addr_write_weight), 
    .addr_read(addr_read_RAM_weight),

    // data_in layer 0
    .data_in_0_0(data_in_0_0_weight), .data_in_1_0(data_in_1_0_weight), .data_in_2_0(data_in_2_0_weight), .data_in_3_0(data_in_3_0_weight), .data_in_4_0(data_in_4_0_weight),

    // data_in layer 1
    .data_in_0_1(data_in_0_1_weight), .data_in_1_1(data_in_1_1_weight), .data_in_2_1(data_in_2_1_weight), .data_in_3_1(data_in_3_1_weight), .data_in_4_1(data_in_4_1_weight),

    // data_in layer 2
    .data_in_0_2(data_in_0_2_weight), .data_in_1_2(data_in_1_2_weight), .data_in_2_2(data_in_2_2_weight), .data_in_3_2(data_in_3_2_weight), .data_in_4_2(data_in_4_2_weight),

    .write_enable(write_enable_weight),
    .read_enable(read_RAM_weight),

    // data_out layer 0
    .data_out_0_0(data_out_0_0_weight), .data_out_1_0(data_out_1_0_weight), .data_out_2_0(data_out_2_0_weight), .data_out_3_0(data_out_3_0_weight), .data_out_4_0(data_out_4_0_weight),

    // data_out layer 1
    .data_out_0_1(data_out_0_1_weight), .data_out_1_1(data_out_1_1_weight), .data_out_2_1(data_out_2_1_weight), .data_out_3_1(data_out_3_1_weight), .data_out_4_1(data_out_4_1_weight),

    // data_out layer 2
    .data_out_0_2(data_out_0_2_weight), .data_out_1_2(data_out_1_2_weight), .data_out_2_2(data_out_2_2_weight), .data_out_3_2(data_out_3_2_weight), .data_out_4_2(data_out_4_2_weight)
);


      RAM_CONFIG RAM_CONFIG(
        .clk(clk),
        .rst_n(rst_n),
        .wr_en(load_config),
        .kernel_size_in(kernel_size_in),
        .img_size_in(img_size_in),
        .stride_in(stride_in),
        .kernel_size_out(kernel_size_out),
        .img_size_out(img_size_out),
        .stride_out(stride_out),
        .width_size_in(width_size_in),
        .width_size_out(width_size_out),
        .number_kernel_in(number_kernel_in),
        .number_kernel_out(number_kernel_out)
      );


       
          //##################################
      // RAM READ SELECTOR -> LUA CHON KHOI RAM NAO DUOC PHEP DOC     
        //##################################
        
      RAM_Read_Selector ram_read_selector(
        .clk(clk),
        .rst_n(rst_n),
        .pop_i(pop_i),
        .kernel_size(kernel_size_out),
        .stride(stride_out),
        .img_size(img_size_out),
        //tuc la khi next_state thi k tang len 1
        .width_size(width_size_out),
        //OUTPUT
        .m(m),
        .start_line(start_line),
        .addr_read_RAM_input(addr_read_RAM_input),
        //OUTPUT-USED
        .pattern_out0(pattern_out0_input),
        .pattern_out1(pattern_out1_input),
        .pattern_out2(pattern_out2_input),
        .pattern_out3(pattern_out3_input),
        .pattern_out4(pattern_out4_input),
        .pattern_out5(pattern_out5_input),
        .pattern_out6(pattern_out6_input),
        .pattern_out7(pattern_out7_input),
        .pattern_out8(pattern_out8_input),
        .pattern_out9(pattern_out9_input),
        .pattern_out10(pattern_out10_input),
        .pattern_out11(pattern_out11_input),
        .pattern_out12(pattern_out12_input),
        .next_step(next_step)
        ,.DONE(DONE),
//        .tmp(tmp),
        .cot_working(cot_working),
        .enable_active(enable_active),
        .number_kernel(number_kernel_out),
        .number_kernel_working(number_kernel_working)
        );
        
        
        
         //##################################
      // RAM READ WEIGHT  
        //##################################
        RAM_Read_Weight Ram_read_weight(
            .clk(clk),
            .rst_n(rst_n),
            .pop_w(pop_w),
            .kernel_size(kernel_size_out),
            //OUTPUT
            .addr_RAM_weight(addr_read_RAM_weight),
            .read_RAM_weight(read_RAM_weight));
     
  
          //##################################
        // LUU Y DATAOUT INPUT TOI 20 GIA TRI CO GIA TRI INDEX -> CO 1 BO KIEM TRA O DAY ROI TRUYEN VAO 13 CONG
        //##################################
      DataFlow dataflow0(
        .data_in0(data_out_0_0_input),
        .data_in1(data_out_1_0_input),
        .data_in2(data_out_2_0_input),
        .data_in3(data_out_3_0_input),
        .data_in4(data_out_4_0_input),
        .data_in5(data_out_5_0_input),
        .data_in6(data_out_6_0_input),
        .data_in7(data_out_7_0_input),
        .data_in8(data_out_8_0_input),
        .data_in9(data_out_9_0_input),
        .data_in10(data_out_10_0_input),
        .data_in11(data_out_11_0_input),
        .data_in12(data_out_12_0_input),
        .dout_input0(dout_input_01),
        .dout_input1(dout_input_02),
        .dout_input2(dout_input_03),
        .dout_input3(dout_input_04),
        .dout_input4(dout_input_05),
        .dout_input5(dout_input_06),
        .dout_input6(dout_input_07),
        .dout_input7(dout_input_08),
        .dout_input8(dout_input_09),
        .dout_input9(dout_input_10),
        .dout_input10(dout_input_11),
        .dout_input11(dout_input_12),
        .dout_input12(dout_input_13));
     
          DataFlow dataflow1(
        .data_in0(data_out_0_1_input),
        .data_in1(data_out_1_1_input),
        .data_in2(data_out_2_1_input),
        .data_in3(data_out_3_1_input),
        .data_in4(data_out_4_1_input),
        .data_in5(data_out_5_1_input),
        .data_in6(data_out_6_1_input),
        .data_in7(data_out_7_1_input),
        .data_in8(data_out_8_1_input),
        .data_in9(data_out_9_1_input),
        .data_in10(data_out_10_1_input),
        .data_in11(data_out_11_1_input),
        .data_in12(data_out_12_1_input),
        .dout_input0(dout_input_01_2),
        .dout_input1(dout_input_02_2),
        .dout_input2(dout_input_03_2),
        .dout_input3(dout_input_04_2),
        .dout_input4(dout_input_05_2),
        .dout_input5(dout_input_06_2),
        .dout_input6(dout_input_07_2),
        .dout_input7(dout_input_08_2),
        .dout_input8(dout_input_09_2),
        .dout_input9(dout_input_10_2),
        .dout_input10(dout_input_11_2),
        .dout_input11(dout_input_12_2),
        .dout_input12(dout_input_13_2));
        
        
          DataFlow dataflow2(
        .data_in0(data_out_0_2_input),
        .data_in1(data_out_1_2_input),
        .data_in2(data_out_2_2_input),
        .data_in3(data_out_3_2_input),
        .data_in4(data_out_4_2_input),
        .data_in5(data_out_5_2_input),
        .data_in6(data_out_6_2_input),
        .data_in7(data_out_7_2_input),
        .data_in8(data_out_8_2_input),
        .data_in9(data_out_9_2_input),
        .data_in10(data_out_10_2_input),
        .data_in11(data_out_11_2_input),
        .data_in12(data_out_12_2_input),
        .dout_input0(dout_input_01_3),
        .dout_input1(dout_input_02_3),
        .dout_input2(dout_input_03_3),
        .dout_input3(dout_input_04_3),
        .dout_input4(dout_input_05_3),
        .dout_input5(dout_input_06_3),
        .dout_input6(dout_input_07_3),
        .dout_input7(dout_input_08_3),
        .dout_input8(dout_input_09_3),
        .dout_input9(dout_input_10_3),
        .dout_input10(dout_input_11_3),
        .dout_input11(dout_input_12_3),
        .dout_input12(dout_input_13_3));
        
        
        
        
     //ROWMAPPER 1
      row_mapper mapper_1(
    .sel(sel_stride),
    .dataout_1(dout_input_01),
    .dataout_2(dout_input_02),
     .dataout_3(dout_input_03),
     .dataout_4(dout_input_04),
     .dataout_5(dout_input_05),
     .dataout_6(dout_input_06),
     .dataout_7(dout_input_07),
     .dataout_8(dout_input_08),
     .dataout_9(dout_input_09),
     .dataout_10(dout_input_10),
     .dataout_11(dout_input_11),
     .dataout_12(dout_input_12),
     .dataout_13(dout_input_13),
     .d_1(d_1),
     .d_2(d_2),
     .d_3(d_3),
     .d_4(d_4),
     .d_5(d_5),
     .d_6(d_6),
     .d_7(d_7),
     .d_8(d_8),
     .d_9(d_9),
     .d_10(d_10),
     .d_11(d_11),
     .d_12(d_12),
     .d_13(d_13),
     .d_14(d_14),
     .d_15(d_15),
     .d_16(d_16),
     .d_17(d_17),
     .d_18(d_18),
     .d_19(d_19),
     .d_20(d_20),
     .d_21(d_21),
     .d_22(d_22),
     .d_23(d_23),
     .d_24(d_24),
     .d_25(d_25));
     
    row_mapper mapper_2(
    .sel(sel_stride),
    .dataout_1(dout_input_01_2),
    .dataout_2(dout_input_02_2),
     .dataout_3(dout_input_03_2),
     .dataout_4(dout_input_04_2),
     .dataout_5(dout_input_05_2),
     .dataout_6(dout_input_06_2),
     .dataout_7(dout_input_07_2),
     .dataout_8(dout_input_08_2),
     .dataout_9(dout_input_09_2),
     .dataout_10(dout_input_10_2),
     .dataout_11(dout_input_11_2),
     .dataout_12(dout_input_12_2),
     .dataout_13(dout_input_13_2),
     .d_1(d_1_2),
     .d_2(d_2_2),
     .d_3(d_3_2),
     .d_4(d_4_2),
     .d_5(d_5_2),
     .d_6(d_6_2),
     .d_7(d_7_2),
     .d_8(d_8_2),
     .d_9(d_9_2),
     .d_10(d_10_2),
     .d_11(d_11_2),
     .d_12(d_12_2),
     .d_13(d_13_2),
     .d_14(d_14_2),
     .d_15(d_15_2),
     .d_16(d_16_2),
     .d_17(d_17_2),
     .d_18(d_18_2),
     .d_19(d_19_2),
     .d_20(d_20_2),
     .d_21(d_21_2),
     .d_22(d_22_2),
     .d_23(d_23_2),
     .d_24(d_24_2),
     .d_25(d_25_2));
     
       row_mapper mapper_3(
    .sel(sel_stride),
    .dataout_1(dout_input_01_3),
    .dataout_2(dout_input_02_3),
     .dataout_3(dout_input_03_3),
     .dataout_4(dout_input_04_3),
     .dataout_5(dout_input_05_3),
     .dataout_6(dout_input_06_3),
     .dataout_7(dout_input_07_3),
     .dataout_8(dout_input_08_3),
     .dataout_9(dout_input_09_3),
     .dataout_10(dout_input_10_3),
     .dataout_11(dout_input_11_3),
     .dataout_12(dout_input_12_3),
     .dataout_13(dout_input_13_3),
     .d_1(d_1_3),
     .d_2(d_2_3),
     .d_3(d_3_3),
     .d_4(d_4_3),
     .d_5(d_5_3),
     .d_6(d_6_3),
     .d_7(d_7_3),
     .d_8(d_8_3),
     .d_9(d_9_3),
     .d_10(d_10_3),
     .d_11(d_11_3),
     .d_12(d_12_3),
     .d_13(d_13_3),
     .d_14(d_14_3),
     .d_15(d_15_3),
     .d_16(d_16_3),
     .d_17(d_17_3),
     .d_18(d_18_3),
     .d_19(d_19_3),
     .d_20(d_20_3),
     .d_21(d_21_3),
     .d_22(d_22_3),
     .d_23(d_23_3),
     .d_24(d_24_3),
     .d_25(d_25_3));
     
     
     
      
//       //#########################################################################
//       //LAYER 1 PES
//        //#########################################################################
        layer_1_PEs layer1(
    .clk(clk),
    .enable(enable_PE),
    .enable_active(enable_active),
    .rst_n(rst_n),
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    .counter_1(counter_1),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_i(rw_mode_i),
    .rw_mode_w(rw_mode_w),




    .psum_sub_row_1(out_sum_01_2),
    .psum_sub_row_2(out_sum_02_2),
    .psum_sub_row_3(out_sum_03_2),
    .psum_sub_row_4(out_sum_04_2),
    .psum_sub_row_5(out_sum_05_2),
    .out_sum_01(out_sum_01),
    .out_sum_02(out_sum_02),
    .out_sum_03(out_sum_03),
    .out_sum_04(out_sum_04),
    .out_sum_05(out_sum_05),
    
    //DATA + WEIGHT = INPUT
    .dout_input_01(d_1),
    .dout_input_02(d_2),
    .dout_input_03(d_3),
    .dout_input_04(d_4),
    .dout_input_05(d_5),
    .dout_input_06(d_6),
    .dout_input_07(d_7),
    .dout_input_08(d_8),
    .dout_input_09(d_9),
    .dout_input_10(d_10),
    .dout_input_11(d_11),
    .dout_input_12(d_12),
    .dout_input_13(d_13),
    .dout_input_14(d_14),
    .dout_input_15(d_15),
    .dout_input_16(d_16),
    .dout_input_17(d_17),
    .dout_input_18(d_18),
    .dout_input_19(d_19),
    .dout_input_20(d_20),
    .dout_input_21(d_21),
    .dout_input_22(d_22),
    .dout_input_23(d_23),
    .dout_input_24(d_24),
    .dout_input_25(d_25),
          
    
    .dout_weight_01(data_out_0_0_weight),
    .dout_weight_02(data_out_1_0_weight),
    .dout_weight_03(data_out_2_0_weight),
    .dout_weight_04(data_out_3_0_weight),
    .dout_weight_05(data_out_4_0_weight),
    .output_data_weight_1(output_data_weight_1),
    .output_data_input_1(output_data_input_1),
    .out_weight_1(out_weight_1),
    .out_input_1(out_input_1),
    
    .output_data_weight_2(output_data_weight_2),
    .output_data_input_2(output_data_input_2),
    .out_weight_2(out_weight_2),
    .out_input_2(out_input_2),
    
    .output_data_weight_3(output_data_weight_3),
    .output_data_input_3(output_data_input_3),
    .out_weight_3(out_weight_3),
    .out_input_3(out_input_3),
    
    .output_data_weight_4(output_data_weight_4),
    .output_data_input_4(output_data_input_4),
    .out_weight_4(out_weight_4),
    .out_input_4(out_input_4),
    
    .output_data_weight_5(output_data_weight_5),
    .output_data_input_5(output_data_input_5),
    .out_weight_5(out_weight_5),
    .out_input_5(out_input_5),
    
    .out_multi_01(out_multi_01),
    .out_multi_02(out_multi_02),
    .out_multi_03(out_multi_03),
    .out_multi_04(out_multi_04),
    .out_multi_05(out_multi_05),
    .out_multi_06(out_multi_06),
    .out_multi_07(out_multi_07),
    .out_multi_08(out_multi_08),
    .out_multi_09(out_multi_09),
    .out_multi_10(out_multi_10),
    .out_multi_11(out_multi_11),
    .out_multi_12(out_multi_12),
    .out_multi_13(out_multi_13),
    .out_multi_14(out_multi_14),
    .out_multi_15(out_multi_15),
    .out_multi_16(out_multi_16),
    .out_multi_17(out_multi_17),
    .out_multi_18(out_multi_18),
    .out_multi_19(out_multi_19),
    .out_multi_20(out_multi_20),
    .out_multi_21(out_multi_21),
    .out_multi_22(out_multi_22),
    .out_multi_23(out_multi_23),
    .out_multi_24(out_multi_24),
    .out_multi_25(out_multi_25),

    .psum_sub_02(psum_sub_02),
    .psum_sub_03(psum_sub_03),
    .psum_sub_04(psum_sub_04),
    .psum_sub_05(psum_sub_05),
  
    .psum_sub_07(psum_sub_07),
    .psum_sub_08(psum_sub_08),
    .psum_sub_09(psum_sub_09),
    .psum_sub_10(psum_sub_10),
 
    .psum_sub_12(psum_sub_12),
    .psum_sub_13(psum_sub_13),
    .psum_sub_14(psum_sub_14),
    .psum_sub_15(psum_sub_15),

    .psum_sub_17(psum_sub_17),
    .psum_sub_18(psum_sub_18),
    .psum_sub_19(psum_sub_19),
    .psum_sub_20(psum_sub_20),

    .psum_sub_22(psum_sub_22),
    .psum_sub_23(psum_sub_23),
    .psum_sub_24(psum_sub_24),
    .psum_sub_25(psum_sub_25),
    .out_mux_1(out_mux_1)

    


    );
        
//        //#########################################################################
//       //LAYER 2 PES
//        //#########################################################################
          layer_1_PEs layer2(
    .clk(clk),
    .enable(enable_PE),
    .enable_active(enable_active),
    .rst_n(rst_n),
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    .counter_1(counter_1),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_i(rw_mode_i),
    .rw_mode_w(rw_mode_w),
    .out_psum_1(out_psum_1),
    
    .psum_sub_row_1(out_sum_01_3),
    .psum_sub_row_2(out_sum_02_3),
    .psum_sub_row_3(out_sum_03_3),
    .psum_sub_row_4(out_sum_04_3),
    .psum_sub_row_5(out_sum_05_3),
    
    .out_sum_01(out_sum_01_2),
    .out_sum_02(out_sum_02_2),
    .out_sum_03(out_sum_03_2),
    .out_sum_04(out_sum_04_2),
    .out_sum_05(out_sum_05_2),
    
    //DATA+ WEIGHT = INPUT
    .dout_input_01(d_1_2),
    .dout_input_02(d_2_2),
    .dout_input_03(d_3_2),
    .dout_input_04(d_4_2),
    .dout_input_05(d_5_2),
    .dout_input_06(d_6_2),
    .dout_input_07(d_7_2),
    .dout_input_08(d_8_2),
    .dout_input_09(d_9_2),
    .dout_input_10(d_10_2),
    .dout_input_11(d_11_2),
    .dout_input_12(d_12_2),
    .dout_input_13(d_13_2),
    .dout_input_14(d_14_2),
    .dout_input_15(d_15_2),
    .dout_input_16(d_16_2),
    .dout_input_17(d_17_2),
    .dout_input_18(d_18_2),
    .dout_input_19(d_19_2),
    .dout_input_20(d_20_2),
    .dout_input_21(d_21_2),
    .dout_input_22(d_22_2),
    .dout_input_23(d_23_2),
    .dout_input_24(d_24_2),
    .dout_input_25(d_25_2),
    .dout_weight_01(data_out_0_1_weight),
    .dout_weight_02(data_out_1_1_weight),
    .dout_weight_03(data_out_2_1_weight),
    .dout_weight_04(data_out_3_1_weight),
    .dout_weight_05(data_out_4_1_weight),
    .out_sum_tmp_1(out_sum_tmp_1),
    .out_multi_01(out_multi_01_2),
    .out_multi_02(out_multi_02_2),
    .out_multi_03(out_multi_03_2),
    .out_multi_04(out_multi_04_2),
    .out_multi_05(out_multi_05_2),
    .out_multi_06(out_multi_06_2),
    .out_multi_07(out_multi_07_2),
    .out_multi_08(out_multi_08_2),
    .out_multi_09(out_multi_09_2),
    .out_multi_10(out_multi_10_2),
    .out_multi_11(out_multi_11_2),
    .out_multi_12(out_multi_12_2),
    .out_multi_13(out_multi_13_2),
    .out_multi_14(out_multi_14_2),
    .out_multi_15(out_multi_15_2),
    .out_multi_16(out_multi_16_2),
    .out_multi_17(out_multi_17_2),
    .out_multi_18(out_multi_18_2),
    .out_multi_19(out_multi_19_2),
    .out_multi_20(out_multi_20_2),
    .out_multi_21(out_multi_21_2),
    .out_multi_22(out_multi_22_2),
    .out_multi_23(out_multi_23_2),
    .out_multi_24(out_multi_24_2),
    .out_multi_25(out_multi_25_2),
    .out_weight_1(out_weight_1_2),
    .out_input_1(out_input_1_2),
    .out_weight_2(out_weight_2_2),
    .out_input_2(out_input_2_2),
    .out_weight_3(out_weight_3_2),
    .out_input_3(out_input_3_2),
    .out_weight_4(out_weight_4_2),
    .out_input_4(out_input_4_2),
    .out_weight_5(out_weight_5_2),
    .out_input_5(out_input_5_2)

    
    
    );
//        //#########################################################################
//       //LAYER 3 PES
//        //#########################################################################
         layer_1_PEs layer3(
    .clk(clk),
    .enable(enable_PE),
    .enable_active(enable_active),
    .rst_n(rst_n),
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    .counter_1(counter_1),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_i(rw_mode_i),
    .rw_mode_w(rw_mode_w),
    .psum_sub_row_1(0),
    .psum_sub_row_2(0),
    .psum_sub_row_3(0),
    .psum_sub_row_4(0),
    .psum_sub_row_5(0),
    .out_sum_01(out_sum_01_3),
    .out_sum_02(out_sum_02_3),
    .out_sum_03(out_sum_03_3),
    .out_sum_04(out_sum_04_3),
    .out_sum_05(out_sum_05_3),
    
    //DATA + WEIGHT = INPUT
    .dout_input_01(d_1_3),
    .dout_input_02(d_2_3),
    .dout_input_03(d_3_3),
    .dout_input_04(d_4_3),
    .dout_input_05(d_5_3),
    .dout_input_06(d_6_3),
    .dout_input_07(d_7_3),
    .dout_input_08(d_8_3),
    .dout_input_09(d_9_3),
    .dout_input_10(d_10_3),
    .dout_input_11(d_11_3),
    .dout_input_12(d_12_3),
    .dout_input_13(d_13_3),
    .dout_input_14(d_14_3),
    .dout_input_15(d_15_3),
    .dout_input_16(d_16_3),
    .dout_input_17(d_17_3),
    .dout_input_18(d_18_3),
    .dout_input_19(d_19_3),
    .dout_input_20(d_20_3),
    .dout_input_21(d_21_3),
    .dout_input_22(d_22_3),
    .dout_input_23(d_23_3),
    .dout_input_24(d_24_3),
    .dout_input_25(d_25_3),
    .dout_weight_01(data_out_0_2_weight),
    .dout_weight_02(data_out_1_2_weight),
    .dout_weight_03(data_out_2_2_weight),
    .dout_weight_04(data_out_3_2_weight),
    .dout_weight_05(data_out_4_2_weight),
    .out_multi_01(out_multi_01_3),
    .out_multi_02(out_multi_02_3),
    .out_multi_03(out_multi_03_3),
    .out_multi_04(out_multi_04_3),
    .out_multi_05(out_multi_05_3),
    .out_multi_06(out_multi_06_3),
    .out_multi_07(out_multi_07_3),
    .out_multi_08(out_multi_08_3),
    .out_multi_09(out_multi_09_3),
    .out_multi_10(out_multi_10_3),
    .out_multi_11(out_multi_11_3),
    .out_multi_12(out_multi_12_3),
    .out_multi_13(out_multi_13_3),
    .out_multi_14(out_multi_14_3),
    .out_multi_15(out_multi_15_3),
    .out_multi_16(out_multi_16_3),
    .out_multi_17(out_multi_17_3),
    .out_multi_18(out_multi_18_3),
    .out_multi_19(out_multi_19_3),
    .out_multi_20(out_multi_20_3),
    .out_multi_21(out_multi_21_3),
    .out_multi_22(out_multi_22_3),
    .out_multi_23(out_multi_23_3),
    .out_multi_24(out_multi_24_3),
    .out_multi_25(out_multi_25_3),
    .out_weight_1(out_weight_1_3),
    .out_input_1(out_input_1_3),
    .out_weight_2(out_weight_2_3),
    .out_input_2(out_input_2_3),
    .out_weight_3(out_weight_3_3),
    .out_input_3(out_input_3_3),
    .out_weight_4(out_weight_4_3),
    .out_input_4(out_input_4_3),
    .out_weight_5(out_weight_5_3),
    .out_input_5(out_input_5_3)
    );
        
        
        //#########################################################################
       //CONTROLLER PE NEW
        //#########################################################################



endmodule
