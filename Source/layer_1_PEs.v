`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2025 12:21:24 PM
// Design Name: 
// Module Name: layer_1_PEs
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


module layer_1_PEs(
    input clk,
    input rst_n,
    input enable,
    input [24:0] enable_active,
    input rw_mode_psum,
    input addr_psum,
    input [2:0] counter_1,
    input sign_sel,
    input [2:0] addr_i,
    input rw_mode_i,
    input rw_mode_w,
    input [15:0] dout_input_01,
    input [15:0] dout_weight_01,
    
    input [15:0] dout_input_02,
    input [15:0] dout_weight_02,
    
    input [15:0] dout_input_03,
    input [15:0] dout_weight_03,
    
    input [15:0] dout_input_04,
    input [15:0] dout_weight_04,
    
    input [15:0] dout_input_05,
    input [15:0] dout_weight_05,
    
    input [15:0] dout_input_06,
    input [15:0] dout_input_07,
    input [15:0] dout_input_08,
    input [15:0] dout_input_09,
    input [15:0] dout_input_10,
    input [15:0] dout_input_11,
    input [15:0] dout_input_12,
    input [15:0] dout_input_13,
    input [15:0] dout_input_14,
    input [15:0] dout_input_15,
    input [15:0] dout_input_16,
    input [15:0] dout_input_17,
    input [15:0] dout_input_18,
    input [15:0] dout_input_19,
    input [15:0] dout_input_20,
    input [15:0] dout_input_21,
    input [15:0] dout_input_22,
    input [15:0] dout_input_23,
    input [15:0] dout_input_24,
    input [15:0] dout_input_25,
      
    
    
    
    input [15:0] psum_sub_row_1,
    input [15:0] psum_sub_row_2,
    input [15:0] psum_sub_row_3,
    input [15:0] psum_sub_row_4,
    input [15:0] psum_sub_row_5,
    
    
    output [15:0] out_sum_01,
    output [15:0] out_sum_02,
    output [15:0] out_sum_03,
    output [15:0] out_sum_04,
    output [15:0] out_sum_05,
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
     output [15:0] out_multi_21,
     output [15:0] out_multi_22,
     output [15:0] out_multi_23,
     output [15:0] out_multi_24,
     output [15:0] out_multi_25,
     
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
                                                             
           output [15:0] out_psum_1,
           output [15:0] out_psum_2,
           output [15:0] out_psum_3,
           output [15:0] out_psum_4,
           output [15:0] out_psum_5,
           output [15:0] out_psum_6,
           output [15:0] out_psum_7,
           output [15:0] out_psum_8,
           output [15:0] out_psum_9,
           output [15:0] out_psum_10,
           output [15:0] out_psum_11,
           output [15:0] out_psum_12,
           output [15:0] out_psum_13,
           output [15:0] out_psum_14,
           output [15:0] out_psum_15,
           output [15:0] out_psum_16,
           output [15:0] out_psum_17,
           output [15:0] out_psum_18,
           output [15:0] out_psum_19,
           output [15:0] out_psum_20,
           output [15:0] out_psum_21,
           output [15:0] out_psum_22,
           output [15:0] out_psum_23,
           output [15:0] out_psum_24,
           output [15:0] out_psum_25,
           
           
           output [15:0] out_mux_15,
           output [15:0] out_sum_tmp_15,
           
           output [15:0] out_mux_17,
           output [15:0] out_sum_tmp_17,
           
           output [15:0] out_mux_25,
           output [15:0] out_sum_tmp_25,
           
           
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
           output [15:0] out_mux_1,
           output [15:0] out_sum_tmp_1
     
   
                           
    );
  

    



     //MODULE PE
    PE_block_new PE1 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[0]),
    .input_data(dout_input_01),
    .weight_data(dout_weight_01),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_02),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
   .output_data_weight(output_data_weight_1),
   .output_data_input(output_data_input_1),
    // Output- k?t qu? cu?i
    .out_sum(out_sum_01),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_1),
    .out_input(out_input_1),
    .out_multi(out_multi_01),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_1),
    .out_psum(out_psum_1),
    .out_sum_tmp(out_sum_tmp_1)
   
    

);


    PE_block_new PE2 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[1]),
    .input_data(dout_input_02),
    .weight_data(dout_weight_02),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_03),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_2),
    .output_data_input(output_data_input_2),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_02),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_2),
    .out_input(out_input_2),
    .out_multi(out_multi_02),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_2),
    .out_psum(out_psum_2)
                                                               
);

    PE_block_new PE3 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[2]),
    .input_data(dout_input_03),
    .weight_data(dout_weight_03),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_04),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_3),
    .output_data_input(output_data_input_3),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_03),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_3),
    .out_input(out_input_3),
    .out_multi(out_multi_03),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_3),
    .out_psum(out_psum_3)
    
);


    PE_block_new PE4 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[3]),
    .input_data(dout_input_04),
    .weight_data(dout_weight_04),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_05),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_4),
    .output_data_input(output_data_input_4),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_04),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_4),
    .out_input(out_input_4),
    .out_multi(out_multi_04),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_4),
    .out_psum(out_psum_4)
    
);


    PE_block_new PE5 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[4]),
    .input_data(dout_input_05),
    .weight_data(dout_weight_05),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_row_1),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_5),
    .output_data_input(output_data_input_5),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_05),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_5),
    .out_input(out_input_5),
    .out_multi(out_multi_05),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_5),
    .out_psum(out_psum_5)
    
);



     //MODULE PE
    PE_block_new PE6 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[5]),
    .input_data(dout_input_06),
    .weight_data(dout_weight_01),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_07),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_6),
    .output_data_input(output_data_input_6),
    // Output- k?t qu? cu?i
    .out_sum(out_sum_02),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_6),
    .out_input(out_input_6),
    .out_multi(out_multi_06),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_6),
    .out_psum(out_psum_6)
    
);


    PE_block_new PE7 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[6]),
    .input_data(dout_input_07),
    .weight_data(dout_weight_02),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_08),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_7),
    .output_data_input(output_data_input_7),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_07),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_7),
    .out_input(out_input_7),
    .out_multi(out_multi_07),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_7),
    .out_psum(out_psum_7)
    
);

    PE_block_new PE8 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[7]),
    .input_data(dout_input_08),
    .weight_data(dout_weight_03),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_09),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_8),
    .output_data_input(output_data_input_8),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_08),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_8),
    .out_input(out_input_8),
    .out_multi(out_multi_08),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_8),
    .out_psum(out_psum_8)
    
);


    PE_block_new PE9 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[8]),
    .input_data(dout_input_09),
    .weight_data(dout_weight_04),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_10),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_9),
    .output_data_input(output_data_input_9),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_09),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_9),
    .out_input(out_input_9),
    .out_multi(out_multi_09),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_9),
    .out_psum(out_psum_9)
    
);


    PE_block_new PE10 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[9]),
    .input_data(dout_input_10),
    .weight_data(dout_weight_05),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_row_2),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_10),
    .output_data_input(output_data_input_10),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_10),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_10),
    .out_input(out_input_10),
    .out_multi(out_multi_10),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_10),
    .out_psum(out_psum_10)
    
);







   //MODULE PE
    PE_block_new PE11 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[10]),
    .input_data(dout_input_11),
    .weight_data(dout_weight_01),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_12),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_11),
    .output_data_input(output_data_input_11),
    // Output- k?t qu? cu?i
    .out_sum(out_sum_03),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_11),
    .out_input(out_input_11),
    .out_multi(out_multi_11),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_11),
    .out_psum(out_psum_11)
    
);


    PE_block_new PE12 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[11]),
    .input_data(dout_input_12),
    .weight_data(dout_weight_02),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_13),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_12),
    .output_data_input(output_data_input_12),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_12),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_12),
    .out_input(out_input_12),
    .out_multi(out_multi_12),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_12),
    .out_psum(out_psum_12)
    
);

    PE_block_new PE13 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[12]),
    .input_data(dout_input_13),
    .weight_data(dout_weight_03),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_14),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_13),
    .output_data_input(output_data_input_13),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_13),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_13),
    .out_input(out_input_13),
    .out_multi(out_multi_13),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_13),
    .out_psum(out_psum_13)
    
);


    PE_block_new PE14 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[13]),
    .input_data(dout_input_14),
    .weight_data(dout_weight_04),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_15),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_14),
    .output_data_input(output_data_input_14),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_14),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_14),
    .out_input(out_input_14),
    .out_multi(out_multi_14),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_14),
    .out_psum(out_psum_14)
    
);


    PE_block_new PE15 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[14]),
    .input_data(dout_input_15),
    .weight_data(dout_weight_05),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_row_3),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_15),
    .output_data_input(output_data_input_15),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_15),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_15),
    .out_input(out_input_15),
    .out_multi(out_multi_15),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_15),
    .out_psum(out_psum_15),
    .out_sum_tmp(out_sum_tmp_15)
);

   //MODULE PE
    PE_block_new PE16 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[15]),
    .input_data(dout_input_16),
    .weight_data(dout_weight_01),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_17),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_16),
    .output_data_input(output_data_input_16),
    // Output- k?t qu? cu?i
    .out_sum(out_sum_04),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_16),
    .out_input(out_input_16),
    .out_multi(out_multi_16),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_16),
    .out_psum(out_psum_16)
    
);


    PE_block_new PE17 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[16]),
    .input_data(dout_input_17),
    .weight_data(dout_weight_02),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_18),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_17),
    .output_data_input(output_data_input_17),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_17),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_17),
    .out_input(out_input_17),
    .out_multi(out_multi_17),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_17),
    .out_psum(out_psum_17),
    .out_sum_tmp(out_sum_tmp_17)
    
);

    PE_block_new PE18 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[17]),
    .input_data(dout_input_18),
    .weight_data(dout_weight_03),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_19),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_18),
    .output_data_input(output_data_input_18),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_18),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_18),
    .out_input(out_input_18),
    .out_multi(out_multi_18),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_18),
    .out_psum(out_psum_18)
    
);


    PE_block_new PE19 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[18]),
    .input_data(dout_input_19),
    .weight_data(dout_weight_04),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_20),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_19),
    .output_data_input(output_data_input_19),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_19),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_19),
    .out_input(out_input_19),
    .out_multi(out_multi_19),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_19),
    .out_psum(out_psum_19)
    
);


    PE_block_new PE20 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[19]),
    .input_data(dout_input_20),
    .weight_data(dout_weight_05),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_row_4),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_20),
    .output_data_input(output_data_input_20),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_20),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_20),
    .out_input(out_input_20),
    .out_multi(out_multi_20),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_20),
    .out_psum(out_psum_20)
    
);

   //MODULE PE
    PE_block_new PE21 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[20]),
    .input_data(dout_input_21),
    .weight_data(dout_weight_01),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_22),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_21),
    .output_data_input(output_data_input_21),
    // Output- k?t qu? cu?i
    .out_sum(out_sum_05),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_21),
    .out_input(out_input_21),
    .out_multi(out_multi_21),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_21),
    .out_psum(out_psum_21)
    
);


    PE_block_new PE22 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[21]),
    .input_data(dout_input_22),
    .weight_data(dout_weight_02),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_23),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_22),
    .output_data_input(output_data_input_22),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_22),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_22),
    .out_input(out_input_22),
    .out_multi(out_multi_22),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_22),
    .out_psum(out_psum_22)
    
);

    PE_block_new PE23 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[22]),
    .input_data(dout_input_23),
    .weight_data(dout_weight_03),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_24),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_23),
    .output_data_input(output_data_input_23),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_23),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_23),
    .out_input(out_input_23),
    .out_multi(out_multi_23),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_23),
    .out_psum(out_psum_23)
    
);


    PE_block_new PE24 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[23]),
    .input_data(dout_input_24),
    .weight_data(dout_weight_04),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_25),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_24),
    .output_data_input(output_data_input_24),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_24),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_24),
    .out_input(out_input_24),
    .out_multi(out_multi_24),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_24),
    .out_psum(out_psum_24)
    
);


    PE_block_new PE25 (
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable),
    .enable_active(enable_active[24]),
    .input_data(dout_input_25),
    .weight_data(dout_weight_05),
    //Input ???c ??a vào t? PEs khác.
    .psum_sub(psum_sub_row_5),
    //Tín hi?u ch?a ki?m soát
    .rw_mode_psum(rw_mode_psum),
    .addr_psum(addr_psum),
    //Output counter_1 và counter_2
    .counter_1(counter_1),
    //Output t? thanh ghi
    .output_data_weight(output_data_weight_25),
    .output_data_input(output_data_input_25),
    // Output- k?t qu? cu?i
    .out_sum(psum_sub_25),
    // Output tín hi?u tr? v? SystemController
    .out_weight(out_weight_25),
    .out_input(out_input_25),
    .out_multi(out_multi_25),
    .sign_sel(sign_sel),
    .addr_i(addr_i),
    .rw_mode_w(rw_mode_w),
    .rw_mode_i(rw_mode_i),
    .out_mux(out_mux_25),
    .out_psum(out_psum_25),
    .out_sum_tmp(out_sum_tmp_25)
    
);

endmodule
