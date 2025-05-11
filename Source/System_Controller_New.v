`timescale 1ns / 1ps

module System_Controller_New(
    input wire clk,                // Clock chính
    input wire rst_n,              // Reset active low
    input wire start,
    input wire ready_weight,
    input wire ready_input,
    input wire ready_psum,
    input wire next_step,
    input DONE,
    input [4:0] number_kernel,
    //Tin hieu S0
    output reg load_config,
    output reg enable_RAM,   
    output reg enable_counter_3bit,    
    
    //Tin hieu S1   
    output reg load,     // Load d? li?u
    output reg pop_w,
    output reg pop_i,              // ??c d? li?u t? FIFO
    output reg enable_PE,

    output reg [2:0] out_state,

    output reg sign_psum

    
   // Kích ho?t PE
);
    
    reg [2:0] state;
    reg [2:0] next_state;
    reg [1:0] k;
    
    parameter IDLE = 3'b000;
    parameter S0 = 3'b001;
    parameter S1 = 3'b010;
    parameter S2 = 3'b011;
    parameter S3 = 3'b100;
    parameter S4 = 3'b101;
    
    // Next state logic
    always @(*) begin
        case (state)
            IDLE: next_state = (start)? S0: IDLE;
            S0: next_state =  S1;
            S1: next_state = S2;
            S2: next_state = S3;
            S3: next_state = (ready_psum) ? S4 :
                 (DONE && (number_kernel == 0)) ? IDLE :
                 S3;
            S4: next_state =  S3;
            default: next_state = S0;
        endcase
    end
    
    always @(*) begin
        out_state = state;  
    end
    
    // Sequential logic - State transition
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            state <= IDLE;
            end
        else
            state <= next_state;
    end
    
    // Output logic
    always @(*) begin
  
        case (state)
            IDLE: begin
                load_config = 0;
                load = 0;
                pop_w = 0;
                pop_i = 0;
                enable_PE = 0;
                enable_counter_3bit = 0;
                sign_psum =1'b0;
            end
            S0: begin
                load_config = 1;
                enable_RAM = 1;
    
                //Luu y tin hieu doc ghi nay co the dua cho counter
                enable_counter_3bit = 0;
            end
            S1: begin
                load = 1;
                enable_RAM = 1;
                load_config = 1;
                enable_counter_3bit = 0;
                // Luc nay cho ghi nhung dia chi ghi khac dia chi doc
                
            end
            S2: begin
                pop_w = 1;
                pop_i = 1;
                enable_PE = 0;
                enable_RAM = 1;
                enable_counter_3bit = 1;
                load = 0;  // ??t l?i rst_n_register thành 1 khi vào S2
              
            end
            S3: begin
                    // N?u ch?a có ready_psum, gi? behavior bình th??ng c?a S3
                    pop_w = ready_weight ? 1'b1 : 1'b0;
                    pop_i = ready_input ? 1'b1 : 1'b0;
                    enable_PE = 1;
                    enable_counter_3bit = 1;
                    sign_psum = 0;
              end
           S4: begin
                    pop_w = ready_weight ? 1'b1 : 1'b0;
                    pop_i = ready_input ? 1'b1 : 1'b0;
                    enable_PE = 1;
                    enable_counter_3bit = 1'b1;
                    sign_psum = 1'b1;
            end       
                    
       
        endcase
        
        
    end
    
 
  
endmodule
