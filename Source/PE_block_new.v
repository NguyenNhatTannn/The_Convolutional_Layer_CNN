`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/24/2025 04:25:12 PM
// Design Name: 
// Module Name: PE_block_new
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


module PE_block_new(
    input clk,                // Clock
    input rst_n,              // Reset ch? ??ng m?c th?p    
    input enable,
    input enable_active,       // Kích ho?t n?p giá tr? max
    
    //INPUT DATA
    input [15:0] input_data,
    input [15:0] weight_data,
    
    //INPUT t? PE d??i
    input [15:0] psum_sub,
    //OUTPUT
    //*Check point Controller PE
    input [2:0] counter_1,
    
    //*Check point
    
//    output rw_mode_w,
//    output rw_mode_i,
    output Cout,
    
    //*check point weight và input
    output [15:0] output_data_weight,
    output [15:0] output_data_input,
    output [15:0] out_weight,
    output [15:0] out_input,
    
    
    //*check point psum qua cac dot
    output [15:0] out_sum,
    output overflow,

    output [15:0] out_multi,
    input sign_sel,
    input rw_mode_psum,
    input addr_psum,
    input [2:0] addr_i,
    input rw_mode_w,
    input rw_mode_i,
    
    output [15:0] out_psum,
    output [15:0] out_mux,
    output [15:0] out_sum_tmp

    );
   
    
    
    //MODULE 2
    Register_weight register_w(.clk(clk),.rst_n(rst_n),.enable(enable),.rw_mode(rw_mode_w),.addr(counter_1),.input_data(weight_data),.output_data(output_data_weight));
    register_input register_i(.clk(clk),.rst_n(rst_n),.enable(enable),.rw_mode(rw_mode_i),.addr(addr_i),.input_data(input_data),.output_data(output_data_input));
    
    

    pipeline_register pipe(.clk(clk),.rst_n(rst_n),.enable(enable),.in_weight(output_data_weight),.in_input(output_data_input),.out_weight(out_weight),.out_input(out_input));
    
    
    
    
    //MODULE 3
      multi_block multi(.A(out_weight),.B(out_input),.result(out_multi));
//    dadda_multi_fixedpoint dadda(.opA(out_weight),.opB(out_input),.opC(out_multi),.overflow(overflow));
    
    wire [15:0] out_sum_tmp;
    register_psum psum(.clk(clk),.rst_n(rst_n),.enable(enable),.rw_mode(rw_mode_psum),.addr(addr_psum),.input_data(out_sum_tmp),.output_data(out_psum));
    

    mux_2to1_16bit mux(.in0(out_multi),.in1(psum_sub),.sel(sign_sel),.out(out_mux));

    wire cin = 1'b0;
    adder_block adder_block(.A(out_mux),.B(out_psum),.result(out_sum_tmp));
//    carry_look_ahead_16_bit carry(.A(out_mux),.B(out_psum),.Cin(cin),.Sum(out_sum_tmp),.Cout(Cout));
    
    assign out_sum = (enable_active) ? out_sum_tmp : psum_sub;


    
endmodule

