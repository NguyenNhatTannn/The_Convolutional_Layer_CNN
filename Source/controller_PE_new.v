`timescale 1ns/1ps
module Controller_PE_new(
    input clk,                // Clock
    input rst_n,              // Reset ch? ??ng m?c th?p
    input load,
    input enable_counter_3bit,
                 // Kích ho?t n?p giá tr? max
    input [2:0] kernel_size, 
    input [4:0] width_size,
    input stride,
    input sign_psum,
    input DONE,

     // Giá tr? t?i ?a (0 ??n 7)   // Giá tr? b? ??m (3-bit)
    output  max_reached2,
    output max_reached1,

    output [2:0] counter1,
    output [4:0] counter2,

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
//    output reg [24:0] enable_active,
    output next_step

 
    
    );

    
    counter_3bit_new counter3bit(
    .clk(clk),
    .rst_n(rst_n),
    .enable(enable_counter_3bit),
    .load(load),
    .kernel(kernel_size),
    .count(counter1),
    .max_reach(max_reached1),
    .ready_psum(ready_psum),
    .width_size(width_size));
  
    assign sel_stride = stride - 1;
    
//    always @(*) begin
//    if (kernel_size == 5) begin  
//        enable_active = 25'b11111_11111_11111_11111_11111;
//    end else begin
//        enable_active = 25'b00111_00111_00111_00111_00111;
//    end

//end


   
    counter_FSM_new fsmnew (.clk(clk),.rst_n(rst_n),.enable_count(max_reached1),.load(load),.image_size(width_size),.kernel_size(kernel_size),.count_bien(counter1),
    .count(counter2),.max_reached(max_reached2),.rw_mode_w(rw_mode_w),.addr_i(addr_i),
    .rw_mode_i(rw_mode_i),.cc(cc),.ready_weight(ready_weight),
    .ready_input(ready_input),.sign_sel(sign_sel),.psum_row(psum_row),
    .rw_mode_psum(rw_mode_psum),.addr_psum(addr_psum),.sign_psum(sign_psum),.ready_psum(ready_psum),.next_step(next_step),.stride(sel_stride),.DONE(DONE)
    );
endmodule
