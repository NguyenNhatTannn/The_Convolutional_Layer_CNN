module tb_RAM_INPUT_BLOCK;
// TEST CASE: BÚN BÒ // FILE FINAL
    reg clk;
    reg rst_n;
    reg start;
    reg [4:0] number_kernel_in;
    reg [4:0] img_size_in;
    reg [2:0] kernel_size_in;
    reg     [1:0]  stride_in;
    wire [4:0] img_size_out;
    wire [2:0] kernel_size_out;
    wire     [1:0]  stride_out;
    wire  [4:0]  m;
    wire  [4:0]  start_line;
    wire [4:0]  addr_read_RAM_input;
    reg [4:0] width_size_in;
    
    reg [12:0] write_enable_input;
    reg [4:0] addr_write_input;
    // D? li?u input cho 3 block (13 RAM m?i block)
    reg [15:0] data_in_0_0_input, data_in_1_0_input, data_in_2_0_input;
    reg [15:0] data_in_3_0_input, data_in_4_0_input, data_in_5_0_input;
    reg [15:0] data_in_6_0_input, data_in_7_0_input, data_in_8_0_input;
    reg [15:0] data_in_9_0_input, data_in_10_0_input, data_in_11_0_input;
    reg [15:0] data_in_12_0_input;

    reg [15:0] data_in_0_1_input, data_in_1_1_input, data_in_2_1_input;
    reg [15:0] data_in_3_1_input, data_in_4_1_input, data_in_5_1_input;
    reg [15:0] data_in_6_1_input, data_in_7_1_input, data_in_8_1_input;
    reg [15:0] data_in_9_1_input, data_in_10_1_input, data_in_11_1_input;
    reg [15:0] data_in_12_1_input;

    reg [15:0] data_in_0_2_input, data_in_1_2_input, data_in_2_2_input;
    reg [15:0] data_in_3_2_input, data_in_4_2_input, data_in_5_2_input;
    reg [15:0] data_in_6_2_input, data_in_7_2_input, data_in_8_2_input;
    reg [15:0] data_in_9_2_input, data_in_10_2_input, data_in_11_2_input;
    reg [15:0] data_in_12_2_input;

    wire [19:0] data_out_0_0_input, data_out_5_0_input, data_out_9_0_input;
    wire [19:0] data_out_1_0_input, data_out_6_0_input, data_out_10_0_input;
    wire [19:0] data_out_2_0_input, data_out_7_0_input, data_out_11_0_input;
    wire [19:0] data_out_3_0_input, data_out_8_0_input, data_out_12_0_input;
    wire [19:0] data_out_4_0_input;

    wire [19:0] data_out_0_1_input, data_out_5_1_input, data_out_9_1_input;
    wire [19:0] data_out_1_1_input, data_out_6_1_input, data_out_10_1_input;
    wire [19:0] data_out_2_1_input, data_out_7_1_input, data_out_11_1_input;
    wire [19:0] data_out_3_1_input, data_out_8_1_input, data_out_12_1_input;
    wire [19:0] data_out_4_1_input;
    
    wire [19:0] data_out_0_2_input, data_out_5_2_input, data_out_9_2_input;
    wire [19:0] data_out_1_2_input, data_out_6_2_input, data_out_10_2_input;
    wire [19:0] data_out_2_2_input, data_out_7_2_input, data_out_11_2_input;
    wire [19:0] data_out_3_2_input, data_out_8_2_input, data_out_12_2_input;
    wire [19:0] data_out_4_2_input;
    
    wire [4:0] pattern_out0_input;
    wire [4:0] pattern_out1_input;
    wire [4:0] pattern_out2_input;
    wire [4:0] pattern_out3_input;
    wire [4:0] pattern_out4_input;
    wire [4:0] pattern_out5_input;
    wire [4:0] pattern_out6_input;
    wire [4:0] pattern_out7_input;
    wire [4:0] pattern_out8_input;
    wire [4:0] pattern_out9_input;
    wire [4:0] pattern_out10_input;
    wire [4:0] pattern_out11_input;
    wire [4:0] pattern_out12_input;
    
    wire index_read_enable_0;
    wire index_read_enable_1;
    wire index_read_enable_2;
    wire index_read_enable_3;
    wire index_read_enable_4;
    wire index_read_enable_5;
    wire index_read_enable_6;
    wire index_read_enable_7;
    wire index_read_enable_8;
    wire index_read_enable_9;
    wire index_read_enable_1;
    wire index_read_enable_1;
    wire index_read_enable_12;
    
  
    
    reg [2:0] addr_write_weight; //ok
    
     // Tín hi?u ghi vào RAM
    reg [15:0] data_in_0_0_weight;   // D? li?u vào RAM 0 (16 bit)
    reg [15:0] data_in_1_0_weight;   // D? li?u vào RAM 1 (16 bit)
    reg [15:0] data_in_2_0_weight;   // D? li?u vào RAM 2 (16 bit)
    reg [15:0] data_in_3_0_weight;   // D? li?u vào RAM 3 (16 bit)
    reg [15:0] data_in_4_0_weight;   // D? li?u vào RAM 4 (16 bit)
   
    reg [15:0] data_in_0_1_weight;   // D? li?u vào RAM 0 (16 bit)
    reg [15:0] data_in_1_1_weight;   // D? li?u vào RAM 1 (16 bit)
    reg [15:0] data_in_2_1_weight;   // D? li?u vào RAM 2 (16 bit)
    reg [15:0] data_in_3_1_weight;   // D? li?u vào RAM 3 (16 bit)
    reg [15:0] data_in_4_1_weight;   // D? li?u vào RAM 4 (16 bit)
    
    reg [15:0] data_in_0_2_weight;   // D? li?u vào RAM 0 (16 bit)
    reg [15:0] data_in_1_2_weight;   // D? li?u vào RAM 1 (16 bit)
    reg [15:0] data_in_2_2_weight;   // D? li?u vào RAM 2 (16 bit)
    reg [15:0] data_in_3_2_weight;   // D? li?u vào RAM 3 (16 bit)
    reg [15:0] data_in_4_2_weight;   // D? li?u vào RAM 4 (16 bit)
    
    
    reg [4:0] write_enable_weight; // Tín hi?u ghi 13 bit (bit 0 ??n bit 12 cho các RAM) // ok
    
    
     wire [15:0] data_out_0_0_weight;  // D? li?u ra t? RAM 0 (16 bit)
     wire [15:0] data_out_1_0_weight;  // D? li?u ra t? RAM 1 (16 bit)
     wire [15:0] data_out_2_0_weight;  // D? li?u ra t? RAM 2 (16 bit)
     wire [15:0] data_out_3_0_weight;  // D? li?u ra t? RAM 3 (16 bit)
     wire [15:0] data_out_4_0_weight;
    
      // D? li?u ra t? RAM 4 (16 bit)
      
      
          
     wire [15:0] data_out_0_1_weight;  // D? li?u ra t? RAM 0 (16 bit)
     wire [15:0] data_out_1_1_weight;  // D? li?u ra t? RAM 1 (16 bit)
     wire [15:0] data_out_2_1_weight;  // D? li?u ra t? RAM 2 (16 bit)
     wire [15:0] data_out_3_1_weight;  // D? li?u ra t? RAM 3 (16 bit)
     wire [15:0] data_out_4_1_weight;
    
        
     wire [15:0] data_out_0_2_weight;  // D? li?u ra t? RAM 0 (16 bit)
     wire [15:0] data_out_1_2_weight;  // D? li?u ra t? RAM 1 (16 bit)
     wire [15:0] data_out_2_2_weight;  // D? li?u ra t? RAM 2 (16 bit)
     wire [15:0] data_out_3_2_weight;  // D? li?u ra t? RAM 3 (16 bit)
     wire [15:0] data_out_4_2_weight;
     
     wire [2:0] addr_read_RAM_weight;
     
     wire [2:0] counter_1;
     wire [4:0] counter_2;
    
     wire [2:0] out_state;
    
     wire [15:0] dout_input_01;
     wire [15:0] dout_input_02;
     wire [15:0] dout_input_03;
     wire [15:0] dout_input_04;
     wire [15:0] dout_input_05;
     wire [15:0] dout_input_06;
     wire [15:0] dout_input_07;
     wire [15:0] dout_input_08;
     wire [15:0] dout_input_09;
     wire [15:0] dout_input_10;
     wire [15:0] dout_input_11;
     wire [15:0] dout_input_12;
     wire [15:0] dout_input_13;
    
//     wire [15:0] dout_input_01_2;
//     wire [15:0] dout_input_02_2;
//     wire [15:0] dout_input_03_2;
//     wire [15:0] dout_input_04_2;
//     wire [15:0] dout_input_05_2;
//     wire [15:0] dout_input_06_2;
//     wire [15:0] dout_input_07_2;
//     wire [15:0] dout_input_08_2;
//     wire [15:0] dout_input_09_2;
//     wire [15:0] dout_input_10_2;
//     wire [15:0] dout_input_11_2;
//     wire [15:0] dout_input_12_2;
//     wire [15:0] dout_input_13_2;
    
//     wire [15:0] dout_input_01_3;
//     wire [15:0] dout_input_02_3;
//     wire [15:0] dout_input_03_3;
//     wire [15:0] dout_input_04_3;
//     wire [15:0] dout_input_05_3;
//     wire [15:0] dout_input_06_3;
//     wire [15:0] dout_input_07_3;
//     wire [15:0] dout_input_08_3;
//     wire [15:0] dout_input_09_3;
//     wire [15:0] dout_input_10_3;
//     wire [15:0] dout_input_11_3;
//     wire [15:0] dout_input_12_3;
//     wire [15:0] dout_input_13_3;
     
    wire [15:0] d_1;
    wire [15:0] d_2;
    wire [15:0] d_3;
    wire [15:0] d_4;
    wire [15:0] d_5;
    wire [15:0] d_6;
    wire [15:0] d_7;
    wire [15:0] d_8;
    wire [15:0] d_9;
    wire [15:0] d_10;
    wire [15:0] d_11;
    wire [15:0] d_12;
    wire [15:0] d_13;
    wire [15:0] d_14;
    wire [15:0] d_15;
    wire [15:0] d_16;
    wire [15:0] d_17;
    wire [15:0] d_18;
    wire [15:0] d_19;
    wire [15:0] d_20;
    wire [15:0] d_21;
    wire [15:0] d_22;
    wire [15:0] d_23;
    wire [15:0] d_24;
    wire [15:0] d_25;
    
//    wire [15:0] d_1_2;
//    wire [15:0] d_2_2;
//    wire [15:0] d_3_2;
//    wire [15:0] d_4_2;
//    wire [15:0] d_5_2;
//    wire [15:0] d_6_2;
//    wire [15:0] d_7_2;
//    wire [15:0] d_8_2;
//    wire [15:0] d_9_2;
//    wire [15:0] d_10_2;
//    wire [15:0] d_11_2;
//    wire [15:0] d_12_2;
//    wire [15:0] d_13_2;
//    wire [15:0] d_10_2;
//    wire [15:0] d_11_2;
//    wire [15:0] d_12_2;
//    wire [15:0] d_13_2;
//    wire [15:0] d_14_2;
//    wire [15:0] d_15_2;
//    wire [15:0] d_16_2;
//    wire [15:0] d_17_2;
//    wire [15:0] d_18_2;
//    wire [15:0] d_19_2;
//    wire [15:0] d_20_2;
//    wire [15:0] d_21_2;
//    wire [15:0] d_22_2;
//    wire [15:0] d_23_2;
//    wire [15:0] d_24_2;
//    wire [15:0] d_25_2;
    
//    wire [15:0] d_1_3;
//    wire [15:0] d_2_3;
//    wire [15:0] d_3_3;
//    wire [15:0] d_4_3;
//    wire [15:0] d_5_3;
//    wire [15:0] d_6_3;
//    wire [15:0] d_7_3;
//    wire [15:0] d_8_3;
//    wire [15:0] d_9_3;
//    wire [15:0] d_10_3;
//    wire [15:0] d_11_3;
//    wire [15:0] d_12_3;
//    wire [15:0] d_13_3;
//    wire [15:0] d_8_3;
//    wire [15:0] d_9_3;
//    wire [15:0] d_10_3;
//    wire [15:0] d_11_3;
//    wire [15:0] d_12_3;
//    wire [15:0] d_13_3;
//    wire [15:0] d_14_3;
//    wire [15:0] d_15_3;
//    wire [15:0] d_16_3;
//    wire [15:0] d_17_3;
//    wire [15:0] d_18_3;
//    wire [15:0] d_19_3;
//    wire [15:0] d_20_3;
//    wire [15:0] d_21_3;
//    wire [15:0] d_22_3;
//    wire [15:0] d_23_3;
//    wire [15:0] d_24_3;
//    wire [15:0] d_25_3;
    
    wire [15:0] out_sum_01;
    wire [15:0] out_sum_02;
    wire [15:0] out_sum_03;
    wire [15:0] out_sum_04;
    wire [15:0] out_sum_05;
    wire [15:0] out_sum_01_2;
    wire [15:0] out_sum_02_2;
    wire [15:0] out_sum_03_2;
    wire [15:0] out_sum_04_2;
    wire [15:0] out_sum_05_2;
    wire [15:0] out_sum_01_3;
    wire [15:0] out_sum_02_3;
    wire [15:0] out_sum_03_3;
    wire [15:0] out_sum_04_3;
    wire [15:0] out_sum_05_3;
    
           wire [15:0] output_data_weight_1;
           wire [15:0] output_data_input_1;
           wire [15:0] out_weight_1;
           wire [15:0] out_input_1;
           
           
           wire [15:0] output_data_weight_2;
           wire [15:0] output_data_input_2;
           wire [15:0] out_weight_2;
           wire [15:0] out_input_2;
           
            wire [15:0] output_data_weight_3;
           wire [15:0] output_data_input_3;
           wire [15:0] out_weight_3;
           wire [15:0] out_input_3;
           
            wire [15:0] output_data_weight_4;
           wire [15:0] output_data_input_4;
           wire [15:0] out_weight_4;
           wire [15:0] out_input_4;
           
            wire [15:0] output_data_weight_5;
           wire [15:0] output_data_input_5;
           wire [15:0] out_weight_5;
           wire [15:0] out_input_5;
           
           
           wire [15:0] out_weight_1_2;
           wire [15:0] out_input_1_2;
           wire [15:0] out_weight_2_2;
           wire [15:0] out_input_2_2;
           wire [15:0] out_weight_3_2;
           wire [15:0] out_input_3_2;
           wire [15:0] out_weight_4_2;
           wire [15:0] out_input_4_2;
           wire [15:0] out_weight_5_2;
           wire [15:0] out_input_5_2;
           
           
           wire [15:0] out_weight_1_3;
           wire [15:0] out_input_1_3;
           wire [15:0] out_weight_2_3;
           wire [15:0] out_input_2_3;
           wire [15:0] out_weight_3_3;
           wire [15:0] out_input_3_3;
           wire [15:0] out_weight_4_3;
           wire [15:0] out_input_4_3;
           wire [15:0] out_weight_5_3;
           wire [15:0] out_input_5_3;
           
    
           wire [15:0] out_multi_01;
           wire [15:0] out_multi_02;
           wire [15:0] out_multi_03;
           wire [15:0] out_multi_04;
           wire [15:0] out_multi_05;
           wire [15:0] out_multi_06;
           wire [15:0] out_multi_07;
           wire [15:0] out_multi_08;
           wire [15:0] out_multi_09;
           wire [15:0] out_multi_10;
           wire [15:0] out_multi_11;
           wire [15:0] out_multi_12;
           wire [15:0] out_multi_13;
           wire [15:0] out_multi_14;
           wire [15:0] out_multi_15;
           wire [15:0] out_multi_16;
           wire [15:0] out_multi_17;
           wire [15:0] out_multi_18;
           wire [15:0] out_multi_19;
           wire [15:0] out_multi_20;
           wire [15:0] out_multi_21;
           wire [15:0] out_multi_22;
           wire [15:0] out_multi_23;
           wire [15:0] out_multi_24;
           wire [15:0] out_multi_25;
           
           
           wire [15:0] out_multi_01_2;
           wire [15:0] out_multi_02_2;
           wire [15:0] out_multi_03_2;
           wire [15:0] out_multi_04_2;
           wire [15:0] out_multi_05_2;
           wire [15:0] out_multi_06_2;
           wire [15:0] out_multi_07_2;
           wire [15:0] out_multi_08_2;
           wire [15:0] out_multi_09_2;
           wire [15:0] out_multi_10_2;
           wire [15:0] out_multi_11_2;
           wire [15:0] out_multi_12_2;
           wire [15:0] out_multi_13_2;
           wire [15:0] out_multi_14_2;
           wire [15:0] out_multi_15_2;
           wire [15:0] out_multi_16_2;
           wire [15:0] out_multi_17_2;
           wire [15:0] out_multi_18_2;
           wire [15:0] out_multi_19_2;
           wire [15:0] out_multi_20_2;
           wire [15:0] out_multi_21_2;
           wire [15:0] out_multi_22_2;
           wire [15:0] out_multi_23_2;
           wire [15:0] out_multi_24_2;
           wire [15:0] out_multi_25_2;
           
           wire [15:0] out_multi_01_3;
           wire [15:0] out_multi_02_3;
           wire [15:0] out_multi_03_3;
           wire [15:0] out_multi_04_3;
           wire [15:0] out_multi_05_3;
           wire [15:0] out_multi_06_3;
           wire [15:0] out_multi_07_3;
           wire [15:0] out_multi_08_3;
           wire [15:0] out_multi_09_3;
           wire [15:0] out_multi_10_3;
           wire [15:0] out_multi_11_3;
           wire [15:0] out_multi_12_3;
           wire [15:0] out_multi_13_3;
           wire [15:0] out_multi_14_3;
           wire [15:0] out_multi_15_3;
           wire [15:0] out_multi_16_3;
           wire [15:0] out_multi_17_3;
           wire [15:0] out_multi_18_3;
           wire [15:0] out_multi_19_3;
           wire [15:0] out_multi_20_3;
           wire [15:0] out_multi_21_3;
           wire [15:0] out_multi_22_3;
           wire [15:0] out_multi_23_3;
           wire [15:0] out_multi_24_3;
           wire [15:0] out_multi_25_3;
           
    wire pop_i;
    wire pop_w;
    wire [4:0]  width_size_out;
    wire [2:0] addr_i;
    wire sign_sel;
    
//    wire [15:0] psum_sub_02;
//    wire [15:0] psum_sub_03;
//    wire [15:0] psum_sub_04;
//    wire [15:0] psum_sub_05;

//    wire [15:0] psum_sub_07;
//    wire [15:0] psum_sub_08;
//    wire [15:0] psum_sub_09;
//    wire [15:0] psum_sub_10;

//    wire [15:0] psum_sub_12;
//    wire [15:0] psum_sub_13;
//    wire [15:0] psum_sub_14;
//    wire [15:0] psum_sub_15;

//    wire [15:0] psum_sub_17;
//    wire [15:0] psum_sub_18;
//    wire [15:0] psum_sub_19;
//    wire [15:0] psum_sub_20;

//    wire [15:0] psum_sub_22;
//    wire [15:0] psum_sub_23;
//    wire [15:0] psum_sub_24;
//    wire [15:0] psum_sub_25;
    
    
     wire sign_psum;
//     wire full_1;
//     wire empty_1;
//     wire [4:0] count_1;
     
     reg pop;
     
     wire [15:0] data_result_1;
     wire [15:0] data_result_2;
     wire [15:0] data_result_3;
     wire [15:0] data_result_4;
     wire [15:0] data_result_5;
     
     wire next_step;
     

     wire DONE;
     wire rw_mode_i;
     wire rw_mode_w;
     wire ready_psum;
     wire [15:0] out_psum_1;
     wire addr_psum;
     wire [15:0] out_mux_1;
     wire [15:0] out_sum_tmp_1;
     wire rw_mode_psum;
     wire [4:0] tmp;
     wire [4:0] cot_working;
     wire [24:0] enable_active;
     wire [4:0] number_kernel_out;
     wire [4:0] number_kernel_working;
   
     
    
    TOP_ARCHITECTURE_BLOCK  uut (
        .out_sum_tmp_1(out_sum_tmp_1),
        .out_mux_1(out_mux_1),
        .out_psum_1(out_psum_1),
        .addr_psum(addr_psum),
        .clk(clk),
        .rst_n(rst_n),
        .start(start),
        .img_size_in(img_size_in),
        .kernel_size_in(kernel_size_in),
        .stride_in(stride_in),
        .addr_write_input(addr_write_input),
        .m(m),
        .start_line(start_line),
        .addr_read_RAM_input(addr_read_RAM_input),

        .data_in_0_0_input(data_in_0_0_input),
        .data_in_1_0_input(data_in_1_0_input),
        .data_in_2_0_input(data_in_2_0_input),
        .data_in_3_0_input(data_in_3_0_input),
        .data_in_4_0_input(data_in_4_0_input),
        .data_in_5_0_input(data_in_5_0_input),
        .data_in_6_0_input(data_in_6_0_input),
        .data_in_7_0_input(data_in_7_0_input),
        .data_in_8_0_input(data_in_8_0_input),
        .data_in_9_0_input(data_in_9_0_input),
        .data_in_10_0_input(data_in_10_0_input),
        .data_in_11_0_input(data_in_11_0_input),
        .data_in_12_0_input(data_in_12_0_input),

        .data_in_0_1_input(data_in_0_1_input),
        .data_in_1_1_input(data_in_1_1_input),
        .data_in_2_1_input(data_in_2_1_input),
        .data_in_3_1_input(data_in_3_1_input),
        .data_in_4_1_input(data_in_4_1_input),
        .data_in_5_1_input(data_in_5_1_input),
        .data_in_6_1_input(data_in_6_1_input),
        .data_in_7_1_input(data_in_7_1_input),
        .data_in_8_1_input(data_in_8_1_input),
        .data_in_9_1_input(data_in_9_1_input),
        .data_in_10_1_input(data_in_10_1_input),
        .data_in_11_1_input(data_in_11_1_input),
        .data_in_12_1_input(data_in_12_1_input),

        .data_in_0_2_input(data_in_0_2_input),
        .data_in_1_2_input(data_in_1_2_input),
        .data_in_2_2_input(data_in_2_2_input),
        .data_in_3_2_input(data_in_3_2_input),
        .data_in_4_2_input(data_in_4_2_input),
        .data_in_5_2_input(data_in_5_2_input),
        .data_in_6_2_input(data_in_6_2_input),
        .data_in_7_2_input(data_in_7_2_input),
        .data_in_8_2_input(data_in_8_2_input),
        .data_in_9_2_input(data_in_9_2_input),
        .data_in_10_2_input(data_in_10_2_input),
        .data_in_11_2_input(data_in_11_2_input),
        .data_in_12_2_input(data_in_12_2_input),

        .data_out_0_0_input(data_out_0_0_input), .data_out_1_0_input(data_out_1_0_input), .data_out_2_0_input(data_out_2_0_input),
        .data_out_3_0_input(data_out_3_0_input), .data_out_4_0_input(data_out_4_0_input), .data_out_5_0_input(data_out_5_0_input),
        .data_out_6_0_input(data_out_6_0_input), .data_out_7_0_input(data_out_7_0_input), .data_out_8_0_input(data_out_8_0_input),
        .data_out_9_0_input(data_out_9_0_input), .data_out_10_0_input(data_out_10_0_input), .data_out_11_0_input(data_out_11_0_input),
        .data_out_12_0_input(data_out_12_0_input),
        
        .data_out_0_1_input(data_out_0_1_input), .data_out_1_1_input(data_out_1_1_input), .data_out_2_1_input(data_out_2_1_input),
        .data_out_3_1_input(data_out_3_1_input), .data_out_4_1_input(data_out_4_1_input), .data_out_5_1_input(data_out_5_1_input),
        .data_out_6_1_input(data_out_6_1_input), .data_out_7_1_input(data_out_7_1_input), .data_out_8_1_input(data_out_8_1_input),
        .data_out_9_1_input(data_out_9_1_input), .data_out_10_1_input(data_out_10_1_input), .data_out_11_1_input(data_out_11_1_input),
        .data_out_12_1_input(data_out_12_1_input),
        
        
         .data_out_0_2_input(data_out_0_2_input), .data_out_1_2_input(data_out_1_2_input), .data_out_2_2_input(data_out_2_2_input),
        .data_out_3_2_input(data_out_3_2_input), .data_out_4_2_input(data_out_4_2_input), .data_out_5_2_input(data_out_5_2_input),
        .data_out_6_2_input(data_out_6_2_input), .data_out_7_2_input(data_out_7_2_input), .data_out_8_2_input(data_out_8_2_input),
        .data_out_9_2_input(data_out_9_2_input), .data_out_10_2_input(data_out_10_2_input), .data_out_11_2_input(data_out_11_2_input),
        .data_out_12_2_input(data_out_12_2_input),
        
        
        .kernel_size_out(kernel_size_out),
        .img_size_out(img_size_out),
        .stride_out(stride_out),
        
        .pattern_out0_input(pattern_out0_input),
        .pattern_out1_input(pattern_out1_input),
        .pattern_out2_input(pattern_out2_input),
         .pattern_out3_input(pattern_out3_input),
         .pattern_out4_input(pattern_out4_input),
         .pattern_out5_input(pattern_out5_input),
         .pattern_out6_input(pattern_out6_input),
         .pattern_out7_input(pattern_out7_input),
         .pattern_out8_input(pattern_out8_input),
          .pattern_out9_input(pattern_out9_input),
           .pattern_out10_input(pattern_out10_input),
           .pattern_out11_input(pattern_out11_input),
            .pattern_out12_input(pattern_out12_input),
            
            
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
     .ram_data_out_12(ram_data_out_12),
     
     .write_enable_input(write_enable_input),
     
     
     .data_in_0_0_weight(data_in_0_0_weight),   // D? li?u vào RAM 0 (16 bit)
     .data_in_1_0_weight(data_in_1_0_weight),  // D? li?u vào RAM 1 (16 bit)
     .data_in_2_0_weight(data_in_2_0_weight),   // D? li?u vào RAM 2 (16 bit)
     .data_in_3_0_weight(data_in_3_0_weight),   // D? li?u vào RAM 3 (16 bit)
     .data_in_4_0_weight(data_in_4_0_weight),  // D? li?u vào RAM 4 (16 bit)
   
   .data_in_0_1_weight( data_in_0_1_weight), // D? li?u vào RAM 0 (16 bit)
   .data_in_1_1_weight(data_in_1_1_weight),  // D? li?u vào RAM 1 (16 bit)
   .data_in_2_1_weight(data_in_2_1_weight),   // D? li?u vào RAM 2 (16 bit)
   .data_in_3_1_weight(data_in_3_1_weight), // D? li?u vào RAM 3 (16 bit)
    .data_in_4_1_weight(data_in_4_1_weight),   // D? li?u vào RAM 4 (16 bit)
    
   .data_in_0_2_weight(data_in_0_2_weight),   // D? li?u vào RAM 0 (16 bit)
    .data_in_1_2_weight(data_in_1_2_weight),   // D? li?u vào RAM 1 (16 bit)
    .data_in_2_2_weight(data_in_2_2_weight),   // D? li?u vào RAM 2 (16 bit)
    .data_in_3_2_weight(data_in_3_2_weight),  // D? li?u vào RAM 3 (16 bit)
   .data_in_4_2_weight(data_in_4_2_weight), // D? li?u vào RAM 4 (16 bit)
   
   .data_out_0_0_weight(data_out_0_0_weight),
   .data_out_1_0_weight(data_out_1_0_weight),
   .data_out_2_0_weight(data_out_2_0_weight),
   .data_out_3_0_weight(data_out_3_0_weight),
   .data_out_4_0_weight(data_out_4_0_weight),
   
   
   .data_out_0_1_weight(data_out_0_1_weight),
   .data_out_1_1_weight(data_out_1_1_weight),
   .data_out_2_1_weight(data_out_2_1_weight),
   .data_out_3_1_weight(data_out_3_1_weight),
   .data_out_4_1_weight(data_out_4_1_weight),

   
    .data_out_0_2_weight(data_out_0_2_weight),
   .data_out_1_2_weight(data_out_1_2_weight),
   .data_out_2_2_weight(data_out_2_2_weight),
   .data_out_3_2_weight(data_out_3_2_weight),
   .data_out_4_2_weight(data_out_4_2_weight),
   .write_enable_weight(write_enable_weight),
   .addr_write_weight(addr_write_weight),
   .addr_read_RAM_weight(addr_read_RAM_weight),
   
   .counter_1(counter_1),
   .counter_2(counter_2),
   .enable_counter_3bit(enable_counter_3bit),
   .out_state(out_state),
   
   
   .dout_input_01(dout_input_01),
   .dout_input_02(dout_input_02),
   .dout_input_03(dout_input_03),
   .dout_input_04(dout_input_04),
   .dout_input_05(dout_input_05),
   .dout_input_06(dout_input_06),
   .dout_input_07(dout_input_07),
   .dout_input_08(dout_input_08),
   .dout_input_09(dout_input_09),
   .dout_input_10(dout_input_10),
   .dout_input_11(dout_input_11),
   .dout_input_12(dout_input_12),
   .dout_input_13(dout_input_13),
//   .dout_input_01_3(dout_input_01_3),
//   .dout_input_02_3(dout_input_02_3),
//   .dout_input_03_3(dout_input_03_3),
//   .dout_input_04_3(dout_input_04_3),
//   .dout_input_05_3(dout_input_05_3),
//   .dout_input_06_3(dout_input_06_3),
//   .dout_input_07_3(dout_input_07_3),
//   .dout_input_08_3(dout_input_08_3),
//   .dout_input_09_3(dout_input_09_3),
//   .dout_input_10_3(dout_input_10_3),
//   .dout_input_11_3(dout_input_11_3),
//   .dout_input_12_3(dout_input_12_3),
//   .dout_input_13_3(dout_input_13_3),
//   .dout_input_01_2(dout_input_01_2),
//   .dout_input_02_2(dout_input_02_2),
//   .dout_input_03_2(dout_input_03_2),
//   .dout_input_04_2(dout_input_04_2),
//   .dout_input_05_2(dout_input_05_2),
//   .dout_input_06_2(dout_input_06_2),
//   .dout_input_07_2(dout_input_07_2),
//   .dout_input_08_2(dout_input_08_2),
//   .dout_input_09_2(dout_input_09_2),
//   .dout_input_10_2(dout_input_10_2),
//   .dout_input_11_2(dout_input_11_2),
//   .dout_input_12_2(dout_input_12_2),
//   .dout_input_13_2(dout_input_13_2),
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
   .d_25(d_25),
//   .d_1_2(d_1_2),
//   .d_2_2(d_2_2),
//   .d_3_2(d_3_2),
//   .d_4_2(d_4_2),
//   .d_5_2(d_5_2),
//   .d_6_2(d_6_2),
//   .d_7_2(d_7_2),
//   .d_8_2(d_8_2),
//   .d_9_2(d_9_2),
//   .d_10_2(d_10_2),
//   .d_11_2(d_11_2),
//   .d_12_2(d_12_2),
//   .d_13_2(d_13_2),
//   .d_14_2(d_14_2),
//   .d_15_2(d_15_2),
//   .d_16_2(d_16_2),
//   .d_17_2(d_17_2),
//   .d_18_2(d_18_2),
//   .d_19_2(d_19_2),
//   .d_20_2(d_20_2),
//   .d_21_2(d_21_2),
//   .d_22_2(d_22_2),
//   .d_23_2(d_23_2),
//   .d_24_2(d_24_2),
//   .d_25_2(d_25_2),
  
//   .d_1_3(d_1_3),
//   .d_2_3(d_2_3),
//   .d_3_3(d_3_3),
//   .d_4_3(d_4_3),
//   .d_5_3(d_5_3),
//   .d_6_3(d_6_3),
//   .d_7_3(d_7_3),
//   .d_8_3(d_8_3),
//   .d_9_3(d_9_3),
//   .d_10_3(d_10_3),
//   .d_11_3(d_11_3),
//   .d_12_3(d_12_3),
//   .d_13_3(d_13_3),
//   .d_14_3(d_14_3),
//   .d_15_3(d_15_3),
//   .d_16_3(d_16_3),
//   .d_17_3(d_17_3),
//   .d_18_3(d_18_3),
//   .d_19_3(d_19_3),
//   .d_20_3(d_20_3),
//   .d_21_3(d_21_3),
//   .d_22_3(d_22_3),
//   .d_23_3(d_23_3),
//   .d_24_3(d_24_3),
//   .d_25_3(d_25_3),
   .out_sum_01(out_sum_01),
   .out_sum_02(out_sum_02),
   .out_sum_03(out_sum_03),
   .out_sum_04(out_sum_04),
   .out_sum_05(out_sum_05),
   .out_sum_01_2(out_sum_01_2),
   .out_sum_02_2(out_sum_02_2),
   .out_sum_03_2(out_sum_03_2),
   .out_sum_04_2(out_sum_04_2),
   .out_sum_05_2(out_sum_05_2),
   .out_sum_01_3(out_sum_01_3),
   .out_sum_02_3(out_sum_02_3),
   .out_sum_03_3(out_sum_03_3),
   .out_sum_04_3(out_sum_04_3),
   .out_sum_05_3(out_sum_05_3),
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
   
   .out_multi_01_2(out_multi_01_2),
   .out_multi_02_2(out_multi_02_2),
   .out_multi_03_2(out_multi_03_2),
   .out_multi_04_2(out_multi_04_2),
   .out_multi_05_2(out_multi_05_2),
   .out_multi_06_2(out_multi_06_2),
   .out_multi_07_2(out_multi_07_2),
   .out_multi_08_2(out_multi_08_2),
   .out_multi_09_2(out_multi_09_2),
   .out_multi_10_2(out_multi_10_2),
   .out_multi_11_2(out_multi_11_2),
   .out_multi_12_2(out_multi_12_2),
   .out_multi_13_2(out_multi_13_2),
   .out_multi_14_2(out_multi_14_2),
   .out_multi_15_2(out_multi_15_2),
   .out_multi_16_2(out_multi_16_2),
   .out_multi_17_2(out_multi_17_2),
   .out_multi_18_2(out_multi_18_2),
   .out_multi_19_2(out_multi_19_2),
   .out_multi_20_2(out_multi_20_2),
   .out_multi_21_2(out_multi_21_2),
   .out_multi_22_2(out_multi_22_2),
   .out_multi_23_2(out_multi_23_2),
   .out_multi_24_2(out_multi_24_2),
   .out_multi_25_2(out_multi_25_2),
   
   .out_multi_01_3(out_multi_01_3),
   .out_multi_02_3(out_multi_02_3),
   .out_multi_03_3(out_multi_03_3),
   .out_multi_04_3(out_multi_04_3),
   .out_multi_05_3(out_multi_05_3),
   .out_multi_06_3(out_multi_06_3),
   .out_multi_07_3(out_multi_07_3),
   .out_multi_08_3(out_multi_08_3),
   .out_multi_09_3(out_multi_09_3),
   .out_multi_10_3(out_multi_10_3),
   .out_multi_11_3(out_multi_11_3),
   .out_multi_12_3(out_multi_12_3),
   .out_multi_13_3(out_multi_13_3),
   .out_multi_14_3(out_multi_14_3),
   .out_multi_15_3(out_multi_15_3),
   .out_multi_16_3(out_multi_16_3),
   .out_multi_17_3(out_multi_17_3),
   .out_multi_18_3(out_multi_18_3),
   .out_multi_19_3(out_multi_19_3),
   .out_multi_20_3(out_multi_20_3),
   .out_multi_21_3(out_multi_21_3),
   .out_multi_22_3(out_multi_22_3),
   .out_multi_23_3(out_multi_23_3),
   .out_multi_24_3(out_multi_24_3),
   .out_multi_25_3(out_multi_25_3),
   
   
   .width_size_in(width_size_in),
   .pop_i(pop_i),
   .pop_w(pop_w),
   .width_size_out(width_size_out),
   .addr_i(addr_i),
  
//    .psum_sub_02(psum_sub_02),
//    .psum_sub_03(psum_sub_03),
//    .psum_sub_04(psum_sub_04),
//    .psum_sub_05(psum_sub_05),

//    .psum_sub_07(psum_sub_07),
//    .psum_sub_08(psum_sub_08),
//    .psum_sub_09(psum_sub_09),
//    .psum_sub_10(psum_sub_10),

//    .psum_sub_12(psum_sub_12),
//    .psum_sub_13(psum_sub_13),
//    .psum_sub_14(psum_sub_14),
//    .psum_sub_15(psum_sub_15),

//    .psum_sub_17(psum_sub_17),
//    .psum_sub_18(psum_sub_18),
//    .psum_sub_19(psum_sub_19),
//    .psum_sub_20(psum_sub_20),

//    .psum_sub_22(psum_sub_22),
//    .psum_sub_23(psum_sub_23),
//    .psum_sub_24(psum_sub_24),
//    .psum_sub_25(psum_sub_25),
    
    .data_result_1(data_result_1),
    .data_result_2(data_result_2),
    .data_result_3(data_result_3),
    .data_result_4(data_result_4),
    .data_result_5(data_result_5),
    
    .pop(pop),
    .sign_psum(sign_psum),
//    .full_1(full_1),
//    .empty_1(empty_1),
//    .count_1(count_1),
    .next_step(next_step),
    .DONE(DONE),
    .rw_mode_i(rw_mode_i),
    .rw_mode_w(rw_mode_w),
    .ready_psum(ready_psum),
    .rw_mode_psum(rw_mode_psum),
    .tmp(tmp),
    .cot_working(cot_working),
    .enable_active(enable_active),
    .number_kernel_in(number_kernel_in),
    .number_kernel_working(number_kernel_working),
    .number_kernel_out(number_kernel_out),
    .sign_sel(sign_sel),
    .out_weight_1_3(out_weight_1_3),
    .out_weight_2_3(out_weight_2_3),
    .out_weight_3_3(out_weight_3_3),
    .out_weight_4_3(out_weight_4_3),
    .out_weight_5_3(out_weight_5_3),
    
    .out_weight_1_2(out_weight_1_2),
    .out_weight_2_2(out_weight_2_2),
    .out_weight_3_2(out_weight_3_2),
    .out_weight_4_2(out_weight_4_2),
    .out_weight_5_2(out_weight_5_2),
    
    .out_input_1_2(out_input_1_2),
    .out_input_2_2(out_input_2_2),
    .out_input_3_2(out_input_3_2),
    .out_input_4_2(out_input_4_2),
    .out_input_5_2(out_input_5_2),
    
    .out_input_1_3(out_input_1_3),
    .out_input_2_3(out_input_2_3),
    .out_input_3_3(out_input_3_3),
    .out_input_4_3(out_input_4_3),
    .out_input_5_3(out_input_5_3)
    
    
    
    );
    integer cnt = 0;
      // T?o clock
    always #5 clk = ~clk;

    initial begin
    // Reset h? th?ng
    clk = 0;
    rst_n = 0;
    start = 0;
    img_size_in = 5'd19; 
    width_size_in = 5'd10;          // Kích th??c ?nh ??u vào
    kernel_size_in = 3'd5;         // Kernel size = 3
    stride_in = 2'd1;   
    number_kernel_in = 5'd0;           // Stride = 1

    write_enable_input = 13'b1111111111111;
    write_enable_weight = 5'b11111;
    addr_write_input = 5'd0;
    addr_write_weight = 3'd0;
    
    
    // DÒNG 1
    // D? li?u m?u kh?i t?o cho block 0
    
    // tuONG UNG 13 THAB GHI 
 	data_in_0_0_input  = -16'd1575;
    	data_in_1_0_input  = -16'd1088;
    	data_in_2_0_input  = -16'd1050;
    	data_in_3_0_input  = -16'd102;
    	data_in_4_0_input  = -16'd395;
    	data_in_5_0_input  = -16'd1205;
    	data_in_6_0_input  = -16'd921;
    	data_in_7_0_input  = -16'd856;
    	data_in_8_0_input  = -16'd190;
    	data_in_9_0_input  =  16'd1902;
    	data_in_10_0_input = -16'd1243;
    	data_in_11_0_input = -16'd1067;
    	data_in_12_0_input = -16'd186;


     // T?ng gia tri du lieu cua block 1
        data_in_0_1_input = 0;
        data_in_1_1_input = 0;
        data_in_2_1_input = 0;
        data_in_3_1_input = 0;
        data_in_4_1_input = 0;
        data_in_5_1_input = 0;
        data_in_6_1_input = 0;
        data_in_7_1_input = 0;
        data_in_8_1_input = 0;
        data_in_9_1_input = 0;
        data_in_10_1_input = 0;
        data_in_11_1_input = 0;
        data_in_12_1_input = 0;

        // T?ng gi  tr? d? li?u c?a block 2
        data_in_0_2_input = 0;
        data_in_1_2_input = 0;
        data_in_2_2_input = 0;
        data_in_3_2_input = 0;
        data_in_4_2_input = 0;
        data_in_5_2_input = 0;
        data_in_6_2_input = 0;
        data_in_7_2_input = 0;
        data_in_8_2_input = 0;
        data_in_9_2_input = 0;
        data_in_10_2_input = 0;
        data_in_11_2_input = 0;
        data_in_12_2_input = 0;
    
        data_in_0_0_weight = -16'd1439;
        data_in_1_0_weight = -16'd782;
        data_in_2_0_weight = -16'd54;
        data_in_3_0_weight = -16'd1170;
        data_in_4_0_weight = -16'd2007;

        data_in_0_1_weight = 16'd0;
        data_in_1_1_weight = 16'd0;
        data_in_2_1_weight = 16'd0;
        data_in_3_1_weight = 16'd0;
        data_in_4_1_weight = 16'd0;

        data_in_0_2_weight = 16'd0;
        data_in_1_2_weight = 16'd0;
        data_in_2_2_weight = 16'd0;
        data_in_3_2_weight = 16'd0;
        data_in_4_2_weight = 16'd0;

        // Ch? 20ns r?i nh? reset
        #20;
        rst_n = 1;
        #5
        start = 1;

        // Ghi d? li?u v o RAM v?i gi  tr? thay ??i theo t?ng l?n ghi
        #10; // DONG 2
        addr_write_input = addr_write_input + 1;
        addr_write_weight = addr_write_weight +1;

        // T?ng gi  tr? d? li?u c?a block 0
        data_in_0_0_input  =  16'd1920;
        data_in_1_0_input  = -16'd1716;
        data_in_2_0_input  =  16'd661;
        data_in_3_0_input  = -16'd653;
        data_in_4_0_input  = -16'd299;
        data_in_5_0_input  = -16'd102;
        data_in_6_0_input  = -16'd1034;
        data_in_7_0_input  = -16'd1327;
        data_in_8_0_input  =  16'd1545;
        data_in_9_0_input  =  16'd2045;
        data_in_10_0_input =  16'd1357;
        data_in_11_0_input = -16'd621;
        data_in_12_0_input = -16'd403;


        // T?ng gi  tr? d? li?u c?a block 1
        data_in_0_1_input = 0;
        data_in_1_1_input = 0;
        data_in_2_1_input = 0;
        data_in_3_1_input = 0;
        data_in_4_1_input = 0;
        data_in_5_1_input = 0;
        data_in_6_1_input = 0;
        data_in_7_1_input = 0;
        data_in_8_1_input = 0;
        data_in_9_1_input = 0;
        data_in_10_1_input = 0;
        data_in_11_1_input = 0;
        data_in_12_1_input = 0;

        // T?ng gi  tr? d? li?u c?a block 2
        data_in_0_2_input = 0;
        data_in_1_2_input = 0;
        data_in_2_2_input = 0;
        data_in_3_2_input = 0;
        data_in_4_2_input = 0;
        data_in_5_2_input = 0;
        data_in_6_2_input = 0;
        data_in_7_2_input = 0;
        data_in_8_2_input = 0;
        data_in_9_2_input = 0;
        data_in_10_2_input = 0;
        data_in_11_2_input = 0;
        data_in_12_2_input = 0;
        
        data_in_0_0_weight =  16'd97;
        data_in_1_0_weight =  16'd1909;
        data_in_2_0_weight =  16'd103;
        data_in_3_0_weight = -16'd1383;
        data_in_4_0_weight = -16'd1013;


        data_in_0_1_weight = 16'd0;
        data_in_1_1_weight = 16'd0;
        data_in_2_1_weight = 16'd0;
        data_in_3_1_weight = 16'd0;
        data_in_4_1_weight = 16'd0;

        data_in_0_2_weight = 16'd0;
        data_in_1_2_weight = 16'd0;
        data_in_2_2_weight = 16'd0;
        data_in_3_2_weight = 16'd0;
        data_in_4_2_weight = 16'd0;
       
        #10; // Dong 3
        addr_write_input = addr_write_input + 1;
        addr_write_weight = addr_write_weight +1;

        // T?ng gi  tr? d? li?u c?a block 0
        data_in_0_0_input  =  16'd99;
        data_in_1_0_input  =  16'd1359;
        data_in_2_0_input  =  16'd1834;
        data_in_3_0_input  = -16'd1027;
        data_in_4_0_input  =  16'd812;
        data_in_5_0_input  =  16'd1787;
        data_in_6_0_input  =  16'd279;
        data_in_7_0_input  =  16'd1776;
        data_in_8_0_input  = -16'd925;
        data_in_9_0_input  =  16'd1841;
        data_in_10_0_input =  16'd1058;
        data_in_11_0_input =  16'd1356;
        data_in_12_0_input =  16'd1189;


        data_in_0_1_input = 0;
        data_in_1_1_input = 0;
        data_in_2_1_input = 0;
        data_in_3_1_input = 0;
        data_in_4_1_input = 0;
        data_in_5_1_input = 0;
        data_in_6_1_input = 0;
        data_in_7_1_input = 0;
        data_in_8_1_input = 0;
        data_in_9_1_input = 0;
        data_in_10_1_input = 0;
        data_in_11_1_input = 0;
        data_in_12_1_input = 0;

        // T?ng gi  tr? d? li?u c?a block 2
        data_in_0_2_input = 0;
        data_in_1_2_input = 0;
        data_in_2_2_input = 0;
        data_in_3_2_input = 0;
        data_in_4_2_input = 0;
        data_in_5_2_input = 0;
        data_in_6_2_input = 0;
        data_in_7_2_input = 0;
        data_in_8_2_input = 0;
        data_in_9_2_input = 0;
        data_in_10_2_input = 0;
        data_in_11_2_input = 0;
        data_in_12_2_input = 0;
        
        data_in_0_0_weight =  16'd755;
        data_in_1_0_weight =  16'd1485;
        data_in_2_0_weight = -16'd922;
        data_in_3_0_weight =  16'd770;
        data_in_4_0_weight = -16'd1988;

        data_in_0_1_weight = 16'd0;
        data_in_1_1_weight = 16'd0;
        data_in_2_1_weight = 16'd0;
        data_in_3_1_weight = 16'd0;
        data_in_4_1_weight = 16'd0;

        data_in_0_2_weight = 16'd0;
        data_in_1_2_weight = 16'd0;
        data_in_2_2_weight = 16'd0;
        data_in_3_2_weight = 16'd0;
        data_in_4_2_weight = 16'd0;
       
        #10; // dong 4
        addr_write_input = addr_write_input + 1;
        addr_write_weight = addr_write_weight +1;

        // T?ng gi  tr? d? li?u c?a block 0
        data_in_0_0_input  =  16'd1207;
        data_in_1_0_input  =  16'd1388;
        data_in_2_0_input  =   16'd910;
        data_in_3_0_input  =   16'd930;
        data_in_4_0_input  =  -16'd264;
        data_in_5_0_input  =  -16'd917;
        data_in_6_0_input  =  -16'd325;
        data_in_7_0_input  =   16'd1329;
        data_in_8_0_input  = -16'd1234;
        data_in_9_0_input  =   16'd533;
        data_in_10_0_input =  -16'd870;
        data_in_11_0_input =  16'd2025;
        data_in_12_0_input =  16'd1538;


        data_in_0_1_input = 0;
        data_in_1_1_input = 0;
        data_in_2_1_input = 0;
        data_in_3_1_input = 0;
        data_in_4_1_input = 0;
        data_in_5_1_input = 0;
        data_in_6_1_input = 0;
        data_in_7_1_input = 0;
        data_in_8_1_input = 0;
        data_in_9_1_input = 0;
        data_in_10_1_input = 0;
        data_in_11_1_input = 0;
        data_in_12_1_input = 0;

        // T?ng gi  tr? d? li?u c?a block 2
        data_in_0_2_input = 0;
        data_in_1_2_input = 0;
        data_in_2_2_input = 0;
        data_in_3_2_input = 0;
        data_in_4_2_input = 0;
        data_in_5_2_input = 0;
        data_in_6_2_input = 0;
        data_in_7_2_input = 0;
        data_in_8_2_input = 0;
        data_in_9_2_input = 0;
        data_in_10_2_input = 0;
        data_in_11_2_input = 0;
        data_in_12_2_input = 0;
        data_in_12_2_input = data_in_12_2_input + 1;
        
        data_in_0_0_weight =  16'd1336;
        data_in_1_0_weight = -16'd1786;
        data_in_2_0_weight = -16'd1447;
        data_in_3_0_weight = -16'd1969;
        data_in_4_0_weight =  -16'd300;

        data_in_0_1_weight = 16'd0;
        data_in_1_1_weight = 16'd0;
        data_in_2_1_weight = 16'd0;
        data_in_3_1_weight = 16'd0;
        data_in_4_1_weight = 16'd0;

        data_in_0_2_weight = 16'd0;
        data_in_1_2_weight = 16'd0;
        data_in_2_2_weight = 16'd0;
        data_in_3_2_weight = 16'd0;
        data_in_4_2_weight = 16'd0;
        
        #10; // Dong 5
        addr_write_input = addr_write_input + 1;
        addr_write_weight = addr_write_weight +1;

        // T?ng gi  tr? d? li?u c?a block 0
        data_in_0_0_input  =  16'd524;
        data_in_1_0_input  = -16'd1013;
        data_in_2_0_input  =  16'd425;
        data_in_3_0_input  =  16'd1518;
        data_in_4_0_input  =  16'd1474;
        data_in_5_0_input  = -16'd580;
        data_in_6_0_input  =  16'd1928;
        data_in_7_0_input  =  16'd26;
        data_in_8_0_input  = -16'd1440;
        data_in_9_0_input  = -16'd600;
        data_in_10_0_input =  16'd1313;
        data_in_11_0_input =  16'd1533;
        data_in_12_0_input = -16'd1817;


        data_in_0_1_input = 0;
        data_in_1_1_input = 0;
        data_in_2_1_input = 0;
        data_in_3_1_input = 0;
        data_in_4_1_input = 0;
        data_in_5_1_input = 0;
        data_in_6_1_input = 0;
        data_in_7_1_input = 0;
        data_in_8_1_input = 0;
        data_in_9_1_input = 0;
        data_in_10_1_input = 0;
        data_in_11_1_input = 0;
        data_in_12_1_input = 0;

        // T?ng gi  tr? d? li?u c?a block 2
        data_in_0_2_input = 0;
        data_in_1_2_input = 0;
        data_in_2_2_input = 0;
        data_in_3_2_input = 0;
        data_in_4_2_input = 0;
        data_in_5_2_input = 0;
        data_in_6_2_input = 0;
        data_in_7_2_input = 0;
        data_in_8_2_input = 0;
        data_in_9_2_input = 0;
        data_in_10_2_input = 0;
        data_in_11_2_input = 0;
        data_in_12_2_input = 0;
        
        data_in_0_0_weight = -16'd593;
        data_in_1_0_weight =  16'd1023;
        data_in_2_0_weight =  16'd1216;
        data_in_3_0_weight =  16'd1850;
        data_in_4_0_weight = -16'd1640;

        data_in_0_1_weight = 16'd0;
        data_in_1_1_weight = 16'd0;
        data_in_2_1_weight = 16'd0;
        data_in_3_1_weight = 16'd0;
        data_in_4_1_weight = 16'd0;

        data_in_0_2_weight = 16'd0;
        data_in_1_2_weight = 16'd0;
        data_in_2_2_weight = 16'd0;
        data_in_3_2_weight = 16'd0;
        data_in_4_2_weight = 16'd0;
            
        pop = 1;
        
        #10; // dong 6
        addr_write_input = addr_write_input + 1;
        addr_write_weight = addr_write_weight +1;

        // T?ng gi  tr? d? li?u c?a block 0
        data_in_0_0_input = 16'd1323;
        data_in_1_0_input = 16'd1315;
        data_in_2_0_input = -16'd840;
        data_in_3_0_input = -16'd2038;
        data_in_4_0_input = -16'd931;
        data_in_5_0_input = 16'd1359;
        data_in_6_0_input = -16'd547;
        data_in_7_0_input = -16'd525;
        data_in_8_0_input = 16'd978;
        data_in_9_0_input = 16'd2015;
        data_in_10_0_input = 16'd170;
        data_in_11_0_input = -16'd1303;
        data_in_12_0_input = -16'd1917;

        data_in_0_1_input = 0;
        data_in_1_1_input = 0;
        data_in_2_1_input = 0;
        data_in_3_1_input = 0;
        data_in_4_1_input = 0;
        data_in_5_1_input = 0;
        data_in_6_1_input = 0;
        data_in_7_1_input = 0;
        data_in_8_1_input = 0;
        data_in_9_1_input = 0;
        data_in_10_1_input = 0;
        data_in_11_1_input = 0;
        data_in_12_1_input = 0;

        // T?ng gi  tr? d? li?u c?a block 2
        data_in_0_2_input = 0;
        data_in_1_2_input = 0;
        data_in_2_2_input = 0;
        data_in_3_2_input = 0;
        data_in_4_2_input = 0;
        data_in_5_2_input = 0;
        data_in_6_2_input = 0;
        data_in_7_2_input = 0;
        data_in_8_2_input = 0;
        data_in_9_2_input = 0;
        data_in_10_2_input = 0;
        data_in_11_2_input = 0;
        data_in_12_2_input = 0;
        
        data_in_0_0_weight = 16'd2048;
        data_in_1_0_weight = -16'd4096;
        data_in_2_0_weight = 16'd0;
        data_in_3_0_weight = -16'd2048;
        data_in_4_0_weight = 16'd4096;
        data_in_0_1_weight = 16'd0;

        data_in_1_1_weight = 16'd0;
        data_in_2_1_weight = 16'd0;
        data_in_3_1_weight = 16'd0;
        data_in_4_1_weight = 16'd0;

        data_in_0_2_weight = 16'd0;
        data_in_1_2_weight = 16'd0;
        data_in_2_2_weight = 16'd0;
        data_in_3_2_weight = 16'd0;
        data_in_4_2_weight = 16'd0;
        
        #10; // dong 7
        addr_write_input = addr_write_input + 1;
        addr_write_weight = addr_write_weight +1;

        // T?ng gi  tr? d? li?u c?a block 0
        data_in_0_0_input = 16'd542;
        data_in_1_0_input = 16'd332;
        data_in_2_0_input = -16'd1767;
        data_in_3_0_input = 16'd1003;
        data_in_4_0_input = -16'd1730;
        data_in_5_0_input = -16'd208;
        data_in_6_0_input = -16'd1174;
        data_in_7_0_input = -16'd179;
        data_in_8_0_input = 16'd1532;
        data_in_9_0_input = -16'd189;
        data_in_10_0_input = 16'd1063;
        data_in_11_0_input = -16'd1900;
        data_in_12_0_input = 16'd1693;


        data_in_0_1_input = 0;
        data_in_1_1_input = 0;
        data_in_2_1_input = 0;
        data_in_3_1_input = 0;
        data_in_4_1_input = 0;
        data_in_5_1_input = 0;
        data_in_6_1_input = 0;
        data_in_7_1_input = 0;
        data_in_8_1_input = 0;
        data_in_9_1_input = 0;
        data_in_10_1_input = 0;
        data_in_11_1_input = 0;
        data_in_12_1_input = 0;

        // T?ng gi  tr? d? li?u c?a block 2
        data_in_0_2_input = 0;
        data_in_1_2_input = 0;
        data_in_2_2_input = 0;
        data_in_3_2_input = 0;
        data_in_4_2_input = 0;
        data_in_5_2_input = 0;
        data_in_6_2_input = 0;
        data_in_7_2_input = 0;
        data_in_8_2_input = 0;
        data_in_9_2_input = 0;
        data_in_10_2_input = 0;
        data_in_11_2_input = 0;
        data_in_12_2_input = 0;
        
         data_in_0_0_weight = 16'd2048;
        data_in_1_0_weight = -16'd4096;
        data_in_2_0_weight = 16'd0;
        data_in_3_0_weight = 16'd4096;
        data_in_4_0_weight = 16'd2048;

        data_in_0_1_weight = 16'd0;
        data_in_1_1_weight = 16'd0;
        data_in_2_1_weight = 16'd0;
        data_in_3_1_weight = 16'd0;
        data_in_4_1_weight = 16'd0;

        data_in_0_2_weight = 16'd0;
        data_in_1_2_weight = 16'd0;
        data_in_2_2_weight = 16'd0;
        data_in_3_2_weight = 16'd0;
        data_in_4_2_weight = 16'd0;
        
        #10; // dong 8
        addr_write_input = addr_write_input + 1;
        addr_write_weight = addr_write_weight +1;

        // T?ng gi  tr? d? li?u c?a block 0
        data_in_0_0_input = 16'd311;
        data_in_1_0_input = 16'd1429;
        data_in_2_0_input = 16'd1590;
        data_in_3_0_input = -16'd1159;
        data_in_4_0_input = 16'd215;
        data_in_5_0_input = 16'd835;
        data_in_6_0_input = 16'd327;
        data_in_7_0_input = 16'd1026;
        data_in_8_0_input = -16'd1132;
        data_in_9_0_input = -16'd306;
        data_in_10_0_input = -16'd76;
        data_in_11_0_input = 16'd1017;
        data_in_12_0_input = -16'd1665;

        data_in_0_1_input = 0;
        data_in_1_1_input = 0;
        data_in_2_1_input = 0;
        data_in_3_1_input = 0;
        data_in_4_1_input = 0;
        data_in_5_1_input = 0;
        data_in_6_1_input = 0;
        data_in_7_1_input = 0;
        data_in_8_1_input = 0;
        data_in_9_1_input = 0;
        data_in_10_1_input = 0;
        data_in_11_1_input = 0;
        data_in_12_1_input = 0;

        // T?ng gi  tr? d? li?u c?a block 2
        data_in_0_2_input = 0;
        data_in_1_2_input = 0;
        data_in_2_2_input = 0;
        data_in_3_2_input = 0;
        data_in_4_2_input = 0;
        data_in_5_2_input = 0;
        data_in_6_2_input = 0;
        data_in_7_2_input = 0;
        data_in_8_2_input = 0;
        data_in_9_2_input = 0;
        data_in_10_2_input = 0;
        data_in_11_2_input = 0;
        data_in_12_2_input = 0;
        
        data_in_0_0_weight = 16'd2048;
        data_in_1_0_weight = -16'd4096;
        data_in_2_0_weight = 16'd0;
        data_in_3_0_weight = 16'd4096;
        data_in_4_0_weight = 16'd2048;

        data_in_0_1_weight = 16'd0;
        data_in_1_1_weight = 16'd0;
        data_in_2_1_weight = 16'd0;
        data_in_3_1_weight = 16'd0;
        data_in_4_1_weight = 16'd0;

        data_in_0_2_weight = 16'd0;
        data_in_1_2_weight = 16'd0;
        data_in_2_2_weight = 16'd0;
        data_in_3_2_weight = 16'd0;
        data_in_4_2_weight = 16'd0;
            
            
        #10; // dong 9
        addr_write_input = addr_write_input + 1;
        addr_write_weight = addr_write_weight +1;

        // T?ng gi  tr? d? li?u c?a block 0
        data_in_0_0_input = 16'd1540;
        data_in_1_0_input = 16'd95;
        data_in_2_0_input = -16'd1158;
        data_in_3_0_input = 16'd499;
        data_in_4_0_input = 16'd1294;
        data_in_5_0_input = -16'd502;
        data_in_6_0_input = -16'd1721;
        data_in_7_0_input = -16'd756;
        data_in_8_0_input = 16'd1547;
        data_in_9_0_input = -16'd1000;
        data_in_10_0_input = 16'd535;
        data_in_11_0_input = 16'd523;
        data_in_12_0_input = 16'd921;

        // T?ng gi  tr? d? li?u c?a block 1
        data_in_0_1_input = 0;
        data_in_1_1_input = 0;
        data_in_2_1_input = 0;
        data_in_3_1_input = 0;
        data_in_4_1_input = 0;
        data_in_5_1_input = 0;
        data_in_6_1_input = 0;
        data_in_7_1_input = 0;
        data_in_8_1_input = 0;
        data_in_9_1_input = 0;
        data_in_10_1_input = 0;
        data_in_11_1_input = 0;
        data_in_12_1_input = 0;

        // T?ng gi  tr? d? li?u c?a block 2
        data_in_0_2_input = 0;
        data_in_1_2_input = 0;
        data_in_2_2_input = 0;
        data_in_3_2_input = 0;
        data_in_4_2_input = 0;
        data_in_5_2_input = 0;
        data_in_6_2_input = 0;
        data_in_7_2_input = 0;
        data_in_8_2_input = 0;
        data_in_9_2_input = 0;
        data_in_10_2_input = 0;
        data_in_11_2_input = 0;
        data_in_12_2_input = 0;
        
        data_in_0_0_weight = 16'd2048;
        data_in_1_0_weight = -16'd4096;
        data_in_2_0_weight = 16'd0;
        data_in_3_0_weight = 16'd4096;
        data_in_4_0_weight = 16'd2048;

        data_in_0_1_weight = 16'd0;
        data_in_1_1_weight = 16'd0;
        data_in_2_1_weight = 16'd0;
        data_in_3_1_weight = 16'd0;
        data_in_4_1_weight = 16'd0;

        data_in_0_2_weight = 16'd0;
        data_in_1_2_weight = 16'd0;
        data_in_2_2_weight = 16'd0;
        data_in_3_2_weight = 16'd0;
        data_in_4_2_weight = 16'd0;

        
        #10; // dong 10
        addr_write_input = addr_write_input + 1;
        addr_write_weight = addr_write_weight +1;

        // T?ng gi  tr? d? li?u c?a block 0
        data_in_0_0_input = -16'd1858;
        data_in_1_0_input = -16'd400;
        data_in_2_0_input = -16'd563;
        data_in_3_0_input = -16'd421;
        data_in_4_0_input = -16'd722;
        data_in_5_0_input = -16'd1623;
        data_in_6_0_input = 16'd1469;
        data_in_7_0_input = -16'd339;
        data_in_8_0_input = 16'd1835;
        data_in_9_0_input = 16'd353;
        data_in_10_0_input = -16'd1347;
        data_in_11_0_input = -16'd600;
        data_in_12_0_input = 16'd854;

        // T?ng gi  tr? d? li?u c?a block 1
        data_in_0_1_input = 0;
        data_in_1_1_input = 0;
        data_in_2_1_input = 0;
        data_in_3_1_input = 0;
        data_in_4_1_input = 0;
        data_in_5_1_input = 0;
        data_in_6_1_input = 0;
        data_in_7_1_input = 0;
        data_in_8_1_input = 0;
        data_in_9_1_input = 0;
        data_in_10_1_input = 0;
        data_in_11_1_input = 0;
        data_in_12_1_input = 0;

        // T?ng gi  tr? d? li?u c?a block 2
        data_in_0_2_input = 0;
        data_in_1_2_input = 0;
        data_in_2_2_input = 0;
        data_in_3_2_input = 0;
        data_in_4_2_input = 0;
        data_in_5_2_input = 0;
        data_in_6_2_input = 0;
        data_in_7_2_input = 0;
        data_in_8_2_input = 0;
        data_in_9_2_input = 0;
        data_in_10_2_input = 0;
        data_in_11_2_input = 0;
        data_in_12_2_input = 0;
        
        data_in_0_0_weight = 16'd2048;
        data_in_1_0_weight = -16'd4096;
        data_in_2_0_weight = 16'd0;
        data_in_3_0_weight = 16'd4096;
        data_in_4_0_weight = 16'd2048;

        data_in_0_1_weight = 16'd0;
        data_in_1_1_weight = 16'd0;
        data_in_2_1_weight = 16'd0;
        data_in_3_1_weight = 16'd0;
        data_in_4_1_weight = 16'd0;
        
        data_in_0_2_weight = 16'd0;
        data_in_1_2_weight = 16'd0;
        data_in_2_2_weight = 16'd0;
        data_in_3_2_weight = 16'd0;
        data_in_4_2_weight = 16'd0;
       
       #10
       write_enable_input = 13'b0000000000000;
       start = 0;
       forever begin    
            @(posedge next_step)
                cnt = cnt + 1;        

                // Kh?i x? l  nh? b?n mong mu?n
                write_enable_input = 13'b0000000011111;
                // dong 1
                addr_write_input = 0;
                // T?ng gi  tr? d? li?u c?a block 0
                data_in_0_0_input = -16'd1879; 
                data_in_1_0_input = 16'd582;
                data_in_2_0_input = 16'd1573;
                data_in_3_0_input = 16'd1331;
                data_in_4_0_input = 16'd808;
                data_in_5_0_input = 16'd0;
                data_in_6_0_input = 16'd0;
                data_in_7_0_input = 16'd0;
                data_in_8_0_input = 16'd0;
                data_in_9_0_input = 16'd0;
                data_in_10_0_input = 16'd0;
                data_in_11_0_input = 16'd0;
                data_in_12_0_input = 16'd0;


                // T?ng gi  tr? d? li?u c?a block 1
                data_in_0_1_input = 0;
                data_in_1_1_input = 0;
                data_in_2_1_input = 0;
                data_in_3_1_input = 0;
                data_in_4_1_input = 0;
                data_in_5_1_input = 0;
                data_in_6_1_input = 0;
                data_in_7_1_input = 0;
                data_in_8_1_input = 0;
                data_in_9_1_input = 0;
                data_in_10_1_input = 0;
                data_in_11_1_input = 0;
                data_in_12_1_input = 0;

                // T?ng gi  tr? d? li?u c?a block 2
                data_in_0_2_input = 0;
                data_in_1_2_input = 0;
                data_in_2_2_input = 0;
                data_in_3_2_input = 0;
                data_in_4_2_input = 0;
                data_in_5_2_input = 0;
                data_in_6_2_input = 0;
                data_in_7_2_input = 0;
                data_in_8_2_input = 0;
                data_in_9_2_input = 0;
                data_in_10_2_input = 0;
                data_in_11_2_input = 0;
                data_in_12_2_input = 0;

                // dong 2
                #10;
                addr_write_input = addr_write_input + 1;
        
                data_in_0_0_input = -16'd1062;
                data_in_1_0_input = -16'd1293;
                data_in_2_0_input = 16'd590;
                data_in_3_0_input = -16'd1971;
                data_in_4_0_input = 16'd1368;
                data_in_5_0_input = 16'd0;
                data_in_6_0_input = 16'd0;
                data_in_7_0_input = 16'd0;
                data_in_8_0_input = 16'd0;
                data_in_9_0_input = 16'd0;
                data_in_10_0_input = 16'd0;
                data_in_11_0_input = 16'd0;
                data_in_12_0_input = 16'd0;


                // T?ng gi  tr? d? li?u c?a block 1
                data_in_0_1_input = 0;
                data_in_1_1_input = 0;
                data_in_2_1_input = 0;
                data_in_3_1_input = 0;
                data_in_4_1_input = 0;
                data_in_5_1_input = 0;
                data_in_6_1_input = 0;
                data_in_7_1_input = 0;
                data_in_8_1_input = 0;
                data_in_9_1_input = 0;
                data_in_10_1_input = 0;
                data_in_11_1_input = 0;
                data_in_12_1_input = 0;

                // T?ng gi  tr? d? li?u c?a block 2
                data_in_0_2_input = 0;
                data_in_1_2_input = 0;
                data_in_2_2_input = 0;
                data_in_3_2_input = 0;
                data_in_4_2_input = 0;
                data_in_5_2_input = 0;
                data_in_6_2_input = 0;
                data_in_7_2_input = 0;
                data_in_8_2_input = 0;
                data_in_9_2_input = 0;
                data_in_10_2_input = 0;
                data_in_11_2_input = 0;
                data_in_12_2_input = 0;
        
                // dong 3
                #10;
                addr_write_input = addr_write_input + 1;
        
                data_in_0_0_input = -16'd872;
                data_in_1_0_input = -16'd57;
                data_in_2_0_input = -16'd654;
                data_in_3_0_input = -16'd1048;
                data_in_4_0_input = -16'd1133;
                data_in_5_0_input = 16'd0;
                data_in_6_0_input = 16'd0;
                data_in_7_0_input = 16'd0;
                data_in_8_0_input = 16'd0;
                data_in_9_0_input = 16'd0;
                data_in_10_0_input = 16'd0;
                data_in_11_0_input = 16'd0;
                data_in_12_0_input = 16'd0;


                // T?ng gi  tr? d? li?u c?a block 1
                data_in_0_1_input = 0;
                data_in_1_1_input = 0;
                data_in_2_1_input = 0;
                data_in_3_1_input = 0;
                data_in_4_1_input = 0;
                data_in_5_1_input = 0;
                data_in_6_1_input = 0;
                data_in_7_1_input = 0;
                data_in_8_1_input = 0;
                data_in_9_1_input = 0;
                data_in_10_1_input = 0;
                data_in_11_1_input = 0;
                data_in_12_1_input = 0;

                // T?ng gi  tr? d? li?u c?a block 2
                data_in_0_2_input = 0;
                data_in_1_2_input = 0;
                data_in_2_2_input = 0;
                data_in_3_2_input = 0;
                data_in_4_2_input = 0;
                data_in_5_2_input = 0;
                data_in_6_2_input = 0;
                data_in_7_2_input = 0;
                data_in_8_2_input = 0;
                data_in_9_2_input = 0;
                data_in_10_2_input = 0;
                data_in_11_2_input = 0;
                data_in_12_2_input = 0;
        
                // dong 4
                #10;
                addr_write_input = addr_write_input + 1;
        
                data_in_0_0_input = 16'd226;
                data_in_1_0_input = -16'd664;
                data_in_2_0_input = 16'd1559;
                data_in_3_0_input = -16'd859;
                data_in_4_0_input = -16'd1894;
                data_in_5_0_input = 16'd0;
                data_in_6_0_input = 16'd0;
                data_in_7_0_input = 16'd0;
                data_in_8_0_input = 16'd0;
                data_in_9_0_input = 16'd0;
                data_in_10_0_input = 16'd0;
                data_in_11_0_input = 16'd0;
                data_in_12_0_input = 16'd0;


                // T?ng gi  tr? d? li?u c?a block 1
                data_in_0_1_input = 0;
                data_in_1_1_input = 0;
                data_in_2_1_input = 0;
                data_in_3_1_input = 0;
                data_in_4_1_input = 0;
                data_in_5_1_input = 0;
                data_in_6_1_input = 0;
                data_in_7_1_input = 0;
                data_in_8_1_input = 0;
                data_in_9_1_input = 0;
                data_in_10_1_input = 0;
                data_in_11_1_input = 0;
                data_in_12_1_input = 0;

                // T?ng gi  tr? d? li?u c?a block 2
                data_in_0_2_input = 0;
                data_in_1_2_input = 0;
                data_in_2_2_input = 0;
                data_in_3_2_input = 0;
                data_in_4_2_input = 0;
                data_in_5_2_input = 0;
                data_in_6_2_input = 0;
                data_in_7_2_input = 0;
                data_in_8_2_input = 0;
                data_in_9_2_input = 0;
                data_in_10_2_input = 0;
                data_in_11_2_input = 0;
                data_in_12_2_input = 0;
                
                // dong 5
                #10;
                addr_write_input = addr_write_input + 1;
        
                data_in_0_0_input = -16'd1814;
                data_in_1_0_input = 16'd596;
                data_in_2_0_input = 16'd1442;
                data_in_3_0_input = -16'd656;
                data_in_4_0_input = -16'd1805;
                data_in_5_0_input = 16'd0;
                data_in_6_0_input = 16'd0;
                data_in_7_0_input = 16'd0;
                data_in_8_0_input = 16'd0;
                data_in_9_0_input = 16'd0;
                data_in_10_0_input = 16'd0;
                data_in_11_0_input = 16'd0;
                data_in_12_0_input = 16'd0;


                // T?ng gi  tr? d? li?u c?a block 1
                data_in_0_1_input = 0;
                data_in_1_1_input = 0;
                data_in_2_1_input = 0;
                data_in_3_1_input = 0;
                data_in_4_1_input = 0;
                data_in_5_1_input = 0;
                data_in_6_1_input = 0;
                data_in_7_1_input = 0;
                data_in_8_1_input = 0;
                data_in_9_1_input = 0;
                data_in_10_1_input = 0;
                data_in_11_1_input = 0;
                data_in_12_1_input = 0;

                // T?ng gi  tr? d? li?u c?a block 2
                data_in_0_2_input = 0;
                data_in_1_2_input = 0;
                data_in_2_2_input = 0;
                data_in_3_2_input = 0;
                data_in_4_2_input = 0;
                data_in_5_2_input = 0;
                data_in_6_2_input = 0;
                data_in_7_2_input = 0;
                data_in_8_2_input = 0;
                data_in_9_2_input = 0;
                data_in_10_2_input = 0;
                data_in_11_2_input = 0;
                data_in_12_2_input = 0;
    
                // dong 6
                #10;
                addr_write_input = addr_write_input + 1;
        
                data_in_0_0_input = -16'd642;
                data_in_1_0_input = 16'd855;
                data_in_2_0_input = -16'd420;
                data_in_3_0_input = -16'd491;
                data_in_4_0_input = -16'd714;
                data_in_5_0_input = 16'd0;
                data_in_6_0_input = 16'd0;
                data_in_7_0_input = 16'd0;
                data_in_8_0_input = 16'd0;
                data_in_9_0_input = 16'd0;
                data_in_10_0_input = 16'd0;
                data_in_11_0_input = 16'd0;
                data_in_12_0_input = 16'd0;



                // T?ng gi  tr? d? li?u c?a block 1
                data_in_0_1_input = 0;
                data_in_1_1_input = 0;
                data_in_2_1_input = 0;
                data_in_3_1_input = 0;
                data_in_4_1_input = 0;
                data_in_5_1_input = 0;
                data_in_6_1_input = 0;
                data_in_7_1_input = 0;
                data_in_8_1_input = 0;
                data_in_9_1_input = 0;
                data_in_10_1_input = 0;
                data_in_11_1_input = 0;
                data_in_12_1_input = 0;

                // T?ng gi  tr? d? li?u c?a block 2
                data_in_0_2_input = 0;
                data_in_1_2_input = 0;
                data_in_2_2_input = 0;
                data_in_3_2_input = 0;
                data_in_4_2_input = 0;
                data_in_5_2_input = 0;
                data_in_6_2_input = 0;
                data_in_7_2_input = 0;
                data_in_8_2_input = 0;
                data_in_9_2_input = 0;
                data_in_10_2_input = 0;
                data_in_11_2_input = 0;
                data_in_12_2_input = 0;

                // dong 7
                #10;
                addr_write_input = addr_write_input + 1;
        
                data_in_0_0_input = -16'd1870;
                data_in_1_0_input = -16'd1921;
                data_in_2_0_input = 16'd628;
                data_in_3_0_input = 16'd215;
                data_in_4_0_input = -16'd1154;
                data_in_5_0_input = 16'd0;
                data_in_6_0_input = 16'd0;
                data_in_7_0_input = 16'd0;
                data_in_8_0_input = 16'd0;
                data_in_9_0_input = 16'd0;
                data_in_10_0_input = 16'd0;
                data_in_11_0_input = 16'd0;
                data_in_12_0_input = 16'd0;


                // T?ng gi  tr? d? li?u c?a block 1
                data_in_0_1_input = 0;
                data_in_1_1_input = 0;
                data_in_2_1_input = 0;
                data_in_3_1_input = 0;
                data_in_4_1_input = 0;
                data_in_5_1_input = 0;
                data_in_6_1_input = 0;
                data_in_7_1_input = 0;
                data_in_8_1_input = 0;
                data_in_9_1_input = 0;
                data_in_10_1_input = 0;
                data_in_11_1_input = 0;
                data_in_12_1_input = 0;

                // T?ng gi  tr? d? li?u c?a block 2
                data_in_0_2_input = 0;
                data_in_1_2_input = 0;
                data_in_2_2_input = 0;
                data_in_3_2_input = 0;
                data_in_4_2_input = 0;
                data_in_5_2_input = 0;
                data_in_6_2_input = 0;
                data_in_7_2_input = 0;
                data_in_8_2_input = 0;
                data_in_9_2_input = 0;
                data_in_10_2_input = 0;
                data_in_11_2_input = 0;
                data_in_12_2_input = 0;

                // dong 8
                #10;
                addr_write_input = addr_write_input + 1;
        
                data_in_0_0_input = -16'd1435;
                data_in_1_0_input = -16'd1427;
                data_in_2_0_input = -16'd730;
                data_in_3_0_input = -16'd1888;
                data_in_4_0_input = 16'd1035;
                data_in_5_0_input = 16'd0;
                data_in_6_0_input = 16'd0;
                data_in_7_0_input = 16'd0;
                data_in_8_0_input = 16'd0;
                data_in_9_0_input = 16'd0;
                data_in_10_0_input = 16'd0;
                data_in_11_0_input = 16'd0;
                data_in_12_0_input = 16'd0;



                // T?ng gi  tr? d? li?u c?a block 1
                data_in_0_1_input = 0;
                data_in_1_1_input = 0;
                data_in_2_1_input = 0;
                data_in_3_1_input = 0;
                data_in_4_1_input = 0;
                data_in_5_1_input = 0;
                data_in_6_1_input = 0;
                data_in_7_1_input = 0;
                data_in_8_1_input = 0;
                data_in_9_1_input = 0;
                data_in_10_1_input = 0;
                data_in_11_1_input = 0;
                data_in_12_1_input = 0;

                // T?ng gi  tr? d? li?u c?a block 2
                data_in_0_2_input = 0;
                data_in_1_2_input = 0;
                data_in_2_2_input = 0;
                data_in_3_2_input = 0;
                data_in_4_2_input = 0;
                data_in_5_2_input = 0;
                data_in_6_2_input = 0;
                data_in_7_2_input = 0;
                data_in_8_2_input = 0;
                data_in_9_2_input = 0;
                data_in_10_2_input = 0;
                data_in_11_2_input = 0;
                data_in_12_2_input = 0;

                // dong 9
                #10;
                addr_write_input = addr_write_input + 1;
        
                data_in_0_0_input = -16'd977;
                data_in_1_0_input = -16'd1312;
                data_in_2_0_input = 16'd73;
                data_in_3_0_input = -16'd745;
                data_in_4_0_input = -16'd530;
                data_in_5_0_input = 16'd0;
                data_in_6_0_input = 16'd0;
                data_in_7_0_input = 16'd0;
                data_in_8_0_input = 16'd0;
                data_in_9_0_input = 16'd0;
                data_in_10_0_input = 16'd0;
                data_in_11_0_input = 16'd0;
                data_in_12_0_input = 16'd0;



                // T?ng gi  tr? d? li?u c?a block 1
                data_in_0_1_input = 0;
                data_in_1_1_input = 0;
                data_in_2_1_input = 0;
                data_in_3_1_input = 0;
                data_in_4_1_input = 0;
                data_in_5_1_input = 0;
                data_in_6_1_input = 0;
                data_in_7_1_input = 0;
                data_in_8_1_input = 0;
                data_in_9_1_input = 0;
                data_in_10_1_input = 0;
                data_in_11_1_input = 0;
                data_in_12_1_input = 0;

                // T?ng gi  tr? d? li?u c?a block 2
                data_in_0_2_input = 0;
                data_in_1_2_input = 0;
                data_in_2_2_input = 0;
                data_in_3_2_input = 0;
                data_in_4_2_input = 0;
                data_in_5_2_input = 0;
                data_in_6_2_input = 0;
                data_in_7_2_input = 0;
                data_in_8_2_input = 0;
                data_in_9_2_input = 0;
                data_in_10_2_input = 0;
                data_in_11_2_input = 0;
                data_in_12_2_input = 0;

                // dong 10
                #10;
                addr_write_input = addr_write_input + 1;
        
                data_in_0_0_input = 16'd26;
                data_in_1_0_input = 16'd589;
                data_in_2_0_input = 16'd1914;
                data_in_3_0_input = 16'd1304;
                data_in_4_0_input = -16'd917;
                data_in_5_0_input = 16'd0;
                data_in_6_0_input = 16'd0;
                data_in_7_0_input = 16'd0;
                data_in_8_0_input = 16'd0;
                data_in_9_0_input = 16'd0;
                data_in_10_0_input = 16'd0;
                data_in_11_0_input = 16'd0;
                data_in_12_0_input = 16'd0;


                // T?ng gi  tr? d? li?u c?a block 1
                data_in_0_1_input = 0;
                data_in_1_1_input = 0;
                data_in_2_1_input = 0;
                data_in_3_1_input = 0;
                data_in_4_1_input = 0;
                data_in_5_1_input = 0;
                data_in_6_1_input = 0;
                data_in_7_1_input = 0;
                data_in_8_1_input = 0;
                data_in_9_1_input = 0;
                data_in_10_1_input = 0;
                data_in_11_1_input = 0;
                data_in_12_1_input = 0;

                // T?ng gi  tr? d? li?u c?a block 2
                data_in_0_2_input = 0;
                data_in_1_2_input = 0;
                data_in_2_2_input = 0;
                data_in_3_2_input = 0;
                data_in_4_2_input = 0;
                data_in_5_2_input = 0;
                data_in_6_2_input = 0;
                data_in_7_2_input = 0;
                data_in_8_2_input = 0;
                data_in_9_2_input = 0;
                data_in_10_2_input = 0;
                data_in_11_2_input = 0;
                data_in_12_2_input = 0;
            #10
             write_enable_input = 13'b0000000000000;

    forever begin
            @(posedge next_step && cnt == 1)
            
        if (cnt == 1) begin
            // Kh?i x? l  nh? b?n mong mu?n
            write_enable_input = 13'b0001111100000;
        
            // dong 1
            addr_write_input = 0;
            // T?ng gi  tr? d? li?u c?a block 0
            data_in_0_0_input = 16'd0; 
            data_in_1_0_input = 16'd0;
            data_in_2_0_input = 16'd0;
            data_in_3_0_input = 16'd0;
            data_in_4_0_input = 16'd0;
            data_in_5_0_input = 16'd936;
            data_in_6_0_input = 16'd0;
            data_in_7_0_input = 16'd0;
            data_in_8_0_input = 16'd0;
            data_in_9_0_input = 16'd0;
            data_in_10_0_input = 16'd0;
            data_in_11_0_input = 16'd0;
            data_in_12_0_input = 16'd0;


            // T?ng gi  tr? d? li?u c?a block 1
            data_in_0_1_input = 0;
            data_in_1_1_input = 0;
            data_in_2_1_input = 0;
            data_in_3_1_input = 0;
            data_in_4_1_input = 0;
            data_in_5_1_input = 0;
            data_in_6_1_input = 0;
            data_in_7_1_input = 0;
            data_in_8_1_input = 0;
            data_in_9_1_input = 0;
            data_in_10_1_input = 0;
            data_in_11_1_input = 0;
            data_in_12_1_input = 0;

            // T?ng gi  tr? d? li?u c?a block 2
            data_in_0_2_input = 0;
            data_in_1_2_input = 0;
            data_in_2_2_input = 0;
            data_in_3_2_input = 0;
            data_in_4_2_input = 0;
            data_in_5_2_input = 0;
            data_in_6_2_input = 0;
            data_in_7_2_input = 0;
            data_in_8_2_input = 0;
            data_in_9_2_input = 0;
            data_in_10_2_input = 0;
            data_in_11_2_input = 0;
            data_in_12_2_input = 0;

            // dong 2
            #10;
            addr_write_input = addr_write_input + 1;
        
            data_in_0_0_input = 16'd0;
            data_in_1_0_input = 16'd0;
            data_in_2_0_input = 16'd0;
            data_in_3_0_input = 16'd0;
            data_in_4_0_input = 16'd0;
            data_in_5_0_input = 16'd592;
            data_in_6_0_input = 16'd0;
            data_in_7_0_input = 16'd0;
            data_in_8_0_input = 16'd0;
            data_in_9_0_input = 16'd0;
            data_in_10_0_input = 16'd0;
            data_in_11_0_input = 16'd0;
            data_in_12_0_input = 16'd0;


            // T?ng gi  tr? d? li?u c?a block 1
            data_in_0_1_input = 0;
            data_in_1_1_input = 0;
            data_in_2_1_input = 0;
            data_in_3_1_input = 0;
            data_in_4_1_input = 0;
            data_in_5_1_input = 0;
            data_in_6_1_input = 0;
            data_in_7_1_input = 0;
            data_in_8_1_input = 0;
            data_in_9_1_input = 0;
            data_in_10_1_input = 0;
            data_in_11_1_input = 0;
            data_in_12_1_input = 0;

            // T?ng gi  tr? d? li?u c?a block 2
            data_in_0_2_input = 0;
            data_in_1_2_input = 0;
            data_in_2_2_input = 0;
            data_in_3_2_input = 0;
            data_in_4_2_input = 0;
            data_in_5_2_input = 0;
            data_in_6_2_input = 0;
            data_in_7_2_input = 0;
            data_in_8_2_input = 0;
            data_in_9_2_input = 0;
            data_in_10_2_input = 0;
            data_in_11_2_input = 0;
            data_in_12_2_input = 0;
        
            // dong 3
            #10;
            addr_write_input = addr_write_input + 1;
        
            data_in_0_0_input = 16'd0;
            data_in_1_0_input = 16'd0;
            data_in_2_0_input = 16'd0;
            data_in_3_0_input = 16'd0;
            data_in_4_0_input = 16'd0;
            data_in_5_0_input = 16'd744;
            data_in_6_0_input = 16'd0;
            data_in_7_0_input = 16'd0;
            data_in_8_0_input = 16'd0;
            data_in_9_0_input = 16'd0;
            data_in_10_0_input = 16'd0;
            data_in_11_0_input = 16'd0;
            data_in_12_0_input = 16'd0;


            // T?ng gi  tr? d? li?u c?a block 1
            data_in_0_1_input = 0;
            data_in_1_1_input = 0;
            data_in_2_1_input = 0;
            data_in_3_1_input = 0;
            data_in_4_1_input = 0;
            data_in_5_1_input = 0;
            data_in_6_1_input = 0;
            data_in_7_1_input = 0;
            data_in_8_1_input = 0;
            data_in_9_1_input = 0;
            data_in_10_1_input = 0;
            data_in_11_1_input = 0;
            data_in_12_1_input = 0;

            // T?ng gi  tr? d? li?u c?a block 2
            data_in_0_2_input = 0;
            data_in_1_2_input = 0;
            data_in_2_2_input = 0;
            data_in_3_2_input = 0;
            data_in_4_2_input = 0;
            data_in_5_2_input = 0;
            data_in_6_2_input = 0;
            data_in_7_2_input = 0;
            data_in_8_2_input = 0;
            data_in_9_2_input = 0;
            data_in_10_2_input = 0;
            data_in_11_2_input = 0;
            data_in_12_2_input = 0;
        
            // dong 4
            #10;
            addr_write_input = addr_write_input + 1;
        
            data_in_0_0_input = 16'd0;
            data_in_1_0_input = 16'd0;
            data_in_2_0_input = 16'd0;
            data_in_3_0_input = 16'd0;
            data_in_4_0_input = 16'd0;
            data_in_5_0_input = 16'd1506;
            data_in_6_0_input = 16'd0;
            data_in_7_0_input = 16'd0;
            data_in_8_0_input = 16'd0;
            data_in_9_0_input = 16'd0;
            data_in_10_0_input = 16'd0;
            data_in_11_0_input = 16'd0;
            data_in_12_0_input = 16'd0;


            // T?ng gi  tr? d? li?u c?a block 1
            data_in_0_1_input = 0;
            data_in_1_1_input = 0;
            data_in_2_1_input = 0;
            data_in_3_1_input = 0;
            data_in_4_1_input = 0;
            data_in_5_1_input = 0;
            data_in_6_1_input = 0;
            data_in_7_1_input = 0;
            data_in_8_1_input = 0;
            data_in_9_1_input = 0;
            data_in_10_1_input = 0;
            data_in_11_1_input = 0;
            data_in_12_1_input = 0;

            // T?ng gi  tr? d? li?u c?a block 2
            data_in_0_2_input = 0;
            data_in_1_2_input = 0;
            data_in_2_2_input = 0;
            data_in_3_2_input = 0;
            data_in_4_2_input = 0;
            data_in_5_2_input = 0;
            data_in_6_2_input = 0;
            data_in_7_2_input = 0;
            data_in_8_2_input = 0;
            data_in_9_2_input = 0;
            data_in_10_2_input = 0;
            data_in_11_2_input = 0;
            data_in_12_2_input = 0;
        
            // dong 5
            #10;
            addr_write_input = addr_write_input + 1;
        
            data_in_0_0_input = 16'd0;
            data_in_1_0_input = 16'd0;
            data_in_2_0_input = 16'd0;
            data_in_3_0_input = 16'd0;
            data_in_4_0_input = 16'd0;
            data_in_5_0_input = 16'd1354;
            data_in_6_0_input = 16'd0;
            data_in_7_0_input = 16'd0;
            data_in_8_0_input = 16'd0;
            data_in_9_0_input = 16'd0;
            data_in_10_0_input = 16'd0;
            data_in_11_0_input = 16'd0;
            data_in_12_0_input = 16'd0;


            // T?ng gi  tr? d? li?u c?a block 1
            data_in_0_1_input = 0;
            data_in_1_1_input = 0;
            data_in_2_1_input = 0;
            data_in_3_1_input = 0;
            data_in_4_1_input = 0;
            data_in_5_1_input = 0;
            data_in_6_1_input = 0;
            data_in_7_1_input = 0;
            data_in_8_1_input = 0;
            data_in_9_1_input = 0;
            data_in_10_1_input = 0;
            data_in_11_1_input = 0;
            data_in_12_1_input = 0;

            // T?ng gi  tr? d? li?u c?a block 2
            data_in_0_2_input = 0;
            data_in_1_2_input = 0;
            data_in_2_2_input = 0;
            data_in_3_2_input = 0;
            data_in_4_2_input = 0;
            data_in_5_2_input = 0;
            data_in_6_2_input = 0;
            data_in_7_2_input = 0;
            data_in_8_2_input = 0;
            data_in_9_2_input = 0;
            data_in_10_2_input = 0;
            data_in_11_2_input = 0;
            data_in_12_2_input = 0;
    
            // dong 6
            #10;
            addr_write_input = addr_write_input + 1;
        
            data_in_0_0_input = 16'd0;
            data_in_1_0_input = 16'd0;
            data_in_2_0_input = 16'd0;
            data_in_3_0_input = 16'd0;
            data_in_4_0_input = 16'd0;
            data_in_5_0_input = 16'd959;
            data_in_6_0_input = 16'd0;
            data_in_7_0_input = 16'd0;
            data_in_8_0_input = 16'd0;
            data_in_9_0_input = 16'd0;
            data_in_10_0_input = 16'd0;
            data_in_11_0_input = 16'd0;
            data_in_12_0_input = 16'd0;



            // T?ng gi  tr? d? li?u c?a block 1
            data_in_0_1_input = 0;
            data_in_1_1_input = 0;
            data_in_2_1_input = 0;
            data_in_3_1_input = 0;
            data_in_4_1_input = 0;
            data_in_5_1_input = 0;
            data_in_6_1_input = 0;
            data_in_7_1_input = 0;
            data_in_8_1_input = 0;
            data_in_9_1_input = 0;
            data_in_10_1_input = 0;
            data_in_11_1_input = 0;
            data_in_12_1_input = 0;

            // T?ng gi  tr? d? li?u c?a block 2
            data_in_0_2_input = 0;
            data_in_1_2_input = 0;
            data_in_2_2_input = 0;
            data_in_3_2_input = 0;
            data_in_4_2_input = 0;
            data_in_5_2_input = 0;
            data_in_6_2_input = 0;
            data_in_7_2_input = 0;
            data_in_8_2_input = 0;
            data_in_9_2_input = 0;
            data_in_10_2_input = 0;
            data_in_11_2_input = 0;
            data_in_12_2_input = 0;

            // dong 7
            #10;
            addr_write_input = addr_write_input + 1;
        
            data_in_0_0_input = 16'd0;
            data_in_1_0_input = 16'd0;
            data_in_2_0_input = 16'd0;
            data_in_3_0_input = 16'd0;
            data_in_4_0_input = 16'd0;
            data_in_5_0_input = 16'd118;
            data_in_6_0_input = 16'd0;
            data_in_7_0_input = 16'd0;
            data_in_8_0_input = 16'd0;
            data_in_9_0_input = 16'd0;
            data_in_10_0_input = 16'd0;
            data_in_11_0_input = 16'd0;
            data_in_12_0_input = 16'd0;


            // T?ng gi  tr? d? li?u c?a block 1
            data_in_0_1_input = 0;
            data_in_1_1_input = 0;
            data_in_2_1_input = 0;
            data_in_3_1_input = 0;
            data_in_4_1_input = 0;
            data_in_5_1_input = 0;
            data_in_6_1_input = 0;
            data_in_7_1_input = 0;
            data_in_8_1_input = 0;
            data_in_9_1_input = 0;
            data_in_10_1_input = 0;
            data_in_11_1_input = 0;
            data_in_12_1_input = 0;

            // T?ng gi  tr? d? li?u c?a block 2
            data_in_0_2_input = 0;
            data_in_1_2_input = 0;
            data_in_2_2_input = 0;
            data_in_3_2_input = 0;
            data_in_4_2_input = 0;
            data_in_5_2_input = 0;
            data_in_6_2_input = 0;
            data_in_7_2_input = 0;
            data_in_8_2_input = 0;
            data_in_9_2_input = 0;
            data_in_10_2_input = 0;
            data_in_11_2_input = 0;
            data_in_12_2_input = 0;

            // dong 8
            #10;
            addr_write_input = addr_write_input + 1;
        
            data_in_0_0_input = 16'd0;
            data_in_1_0_input = 16'd0;
            data_in_2_0_input = 16'd0;
            data_in_3_0_input = 16'd0;
            data_in_4_0_input = 16'd0;
            data_in_5_0_input = 16'd1209;
            data_in_6_0_input = 16'd0;
            data_in_7_0_input = 16'd0;
            data_in_8_0_input = 16'd0;
            data_in_9_0_input = 16'd0;
            data_in_10_0_input = 16'd0;
            data_in_11_0_input = 16'd0;
            data_in_12_0_input = 16'd0;



            // T?ng gi  tr? d? li?u c?a block 1
            data_in_0_1_input = 0;
            data_in_1_1_input = 0;
            data_in_2_1_input = 0;
            data_in_3_1_input = 0;
            data_in_4_1_input = 0;
            data_in_5_1_input = 0;
            data_in_6_1_input = 0;
            data_in_7_1_input = 0;
            data_in_8_1_input = 0;
            data_in_9_1_input = 0;
            data_in_10_1_input = 0;
            data_in_11_1_input = 0;
            data_in_12_1_input = 0;

            // T?ng gi  tr? d? li?u c?a block 2
            data_in_0_2_input = 0;
            data_in_1_2_input = 0;
            data_in_2_2_input = 0;
            data_in_3_2_input = 0;
            data_in_4_2_input = 0;
            data_in_5_2_input = 0;
            data_in_6_2_input = 0;
            data_in_7_2_input = 0;
            data_in_8_2_input = 0;
            data_in_9_2_input = 0;
            data_in_10_2_input = 0;
            data_in_11_2_input = 0;
            data_in_12_2_input = 0;

            // dong 9
            #10;
            addr_write_input = addr_write_input + 1;
        
            data_in_0_0_input = 16'd0;
            data_in_1_0_input = 16'd0;
            data_in_2_0_input = 16'd0;
            data_in_3_0_input = 16'd0;
            data_in_4_0_input = 16'd0;
            data_in_5_0_input = -16'd1446;
            data_in_6_0_input = 16'd0;
            data_in_7_0_input = 16'd0;
            data_in_8_0_input = 16'd0;
            data_in_9_0_input = 16'd0;
            data_in_10_0_input = 16'd0;
            data_in_11_0_input = 16'd0;
            data_in_12_0_input = 16'd0;



            // T?ng gi  tr? d? li?u c?a block 1
            data_in_0_1_input = 0;
            data_in_1_1_input = 0;
            data_in_2_1_input = 0;
            data_in_3_1_input = 0;
            data_in_4_1_input = 0;
            data_in_5_1_input = 0;
            data_in_6_1_input = 0;
            data_in_7_1_input = 0;
            data_in_8_1_input = 0;
            data_in_9_1_input = 0;
            data_in_10_1_input = 0;
            data_in_11_1_input = 0;
            data_in_12_1_input = 0;

            // T?ng gi  tr? d? li?u c?a block 2
            data_in_0_2_input = 0;
            data_in_1_2_input = 0;
            data_in_2_2_input = 0;
            data_in_3_2_input = 0;
            data_in_4_2_input = 0;
            data_in_5_2_input = 0;
            data_in_6_2_input = 0;
            data_in_7_2_input = 0;
            data_in_8_2_input = 0;
            data_in_9_2_input = 0;
            data_in_10_2_input = 0;
            data_in_11_2_input = 0;
            data_in_12_2_input = 0;

            // dong 10
            #10;
            addr_write_input = addr_write_input + 1;
        
            data_in_0_0_input = 16'd0;
            data_in_1_0_input = 16'd0;
            data_in_2_0_input = 16'd0;
            data_in_3_0_input = 16'd0;
            data_in_4_0_input = 16'd0;
            data_in_5_0_input = 16'd1648;
            data_in_6_0_input = 16'd0;
            data_in_7_0_input = 16'd0;
            data_in_8_0_input = 16'd0;
            data_in_9_0_input = 16'd0;
            data_in_10_0_input = 16'd0;
            data_in_11_0_input = 16'd0;
            data_in_12_0_input = 16'd0;


            // T?ng gi  tr? d? li?u c?a block 1
            data_in_0_1_input = 0;
            data_in_1_1_input = 0;
            data_in_2_1_input = 0;
            data_in_3_1_input = 0;
            data_in_4_1_input = 0;
            data_in_5_1_input = 0;
            data_in_6_1_input = 0;
            data_in_7_1_input = 0;
            data_in_8_1_input = 0;
            data_in_9_1_input = 0;
            data_in_10_1_input = 0;
            data_in_11_1_input = 0;
            data_in_12_1_input = 0;

            // T?ng gi  tr? d? li?u c?a block 2
            data_in_0_2_input = 0;
            data_in_1_2_input = 0;
            data_in_2_2_input = 0;
            data_in_3_2_input = 0;
            data_in_4_2_input = 0;
            data_in_5_2_input = 0;
            data_in_6_2_input = 0;
            data_in_7_2_input = 0;
            data_in_8_2_input = 0;
            data_in_9_2_input = 0;
            data_in_10_2_input = 0;
            data_in_11_2_input = 0;
            data_in_12_2_input = 0;
          #10
           write_enable_input = 13'b0000000000000;

        end
        end


    // K ch ho?t next_step sau 100ns
 
    // ??i ?? quan s t k?t qu? ??u ra
    #150000;

    $stop;
end
end

endmodule







