//`timescale 1ns/1ps

//module counter_3bit_new (
//    input clk,
//    input rst_n,
//    input enable,
//    input load,
//    input [2:0] kernel,
//    output reg [2:0] count,
//    output reg max_reached,
//    output reg ready_psum
//);

//    reg [2:0] kernel_reg;
//    reg [1:0] delay_counter;
//    reg reached_flag;
//    reg prev_enable;
//    reg hold_zero;

//    always @(posedge clk or negedge rst_n) begin
//        if (!rst_n) begin
//            count         <= 3'b000;
//            kernel_reg    <= 3'b000;
//            max_reached   <= 1'b0;
//            ready_psum    <= 1'b0;
//            delay_counter <= 2'b00;
//            reached_flag  <= 1'b0;
//            prev_enable   <= 1'b0;
//            hold_zero     <= 1'b0;
//        end 
//        else if (load) begin
//            kernel_reg    <= kernel;
//            count         <= 3'b000;
//            max_reached   <= 1'b0;
//            ready_psum    <= 1'b0;
//            delay_counter <= 2'b00;
//            reached_flag  <= 1'b0;
//            hold_zero     <= 1'b0;
//            $display("BLOCK 3 BIT - DA VAO LOAD");
//        end 
//        else if (!enable) begin
//            count         <= 3'b000;
//            max_reached   <= 1'b0;
//            ready_psum    <= 1'b0;
//            delay_counter <= 2'b00;
//            reached_flag  <= 1'b0;
//            hold_zero     <= 1'b0;
//             $display("BLOCK 3 BIT - DA VAO ENABLE !");
//        end
//        else begin
//            if (!prev_enable && enable) begin
//                // Rising edge of enable
//                count         <= 3'b000;
//                max_reached   <= 1'b0;
//                delay_counter <= 2'b00;
//                reached_flag  <= 1'b0;
//                hold_zero     <= 1'b0;
//                 $display("BLOCK 3 BIT - DA VAO ENABLE = 1");
//            end
//            else if (count == kernel_reg - 1) begin
//                count         <= 3'b000;
//                max_reached   <= 1'b1;
//                delay_counter <= 2'b01;
//                reached_flag  <= 1'b1;
//                hold_zero     <= 1'b1;
//                $display("HOLD = %d",hold_zero);
//            end 
//            else if (hold_zero) begin
//                count      <= 3'b000;
//                hold_zero  <= 1'b0;
//                $display("VAO DAY VAO DAY VAO DAY");
//            end 
//            else begin
//                count       <= count + 1;
//                max_reached <= 1'b0;
//                $display("COUNT = %d",count);
//            end
//        end

//        // Delay for ready_psum
//        if (reached_flag) begin
//            if (delay_counter != 2'b00) begin
//                if (delay_counter == 2'b01) begin
//                    ready_psum    <= 1'b1;
//                    delay_counter <= 2'b00;
//                    reached_flag  <= 1'b0;
//                end 
//                else begin
//                    delay_counter <= delay_counter + 1;
//                    ready_psum    <= 1'b0;
//                end
//            end 
//            else begin
//                ready_psum <= 1'b0;
//            end
//        end 
//        else begin
//            ready_psum <= 1'b0;
//        end

//        prev_enable <= enable;  // C?p nh?t tr?ng thái enable tr??c ?ó
//    end

  
//endmodule




//module counter_3bit_new (
//    input clk,
//    input rst_n,
//    input enable,
//    input load,
//    input width_size, // không dùng
//    input [2:0] kernel, // ví d?: 5 s? ??m 0-1-2-3-4
//    output reg [2:0] count,
//    output reg ready_psum,
//    output reg max_reach
//);

//    reg [2:0] kernel_reg;
//    reg zero_hold; // Ch? c?n gi? 1 chu k?

//    always @(posedge clk or negedge rst_n) begin
//        if (!rst_n) begin
//            count       <= 0;
//            kernel_reg  <= 0;
//            ready_psum  <= 0;
//            max_reach   <= 0;
//            zero_hold   <= 0;
//        end 
//        else if (load) begin
//            kernel_reg  <= kernel;
//            count       <= 0;
//            ready_psum  <= 0;
//            max_reach   <= 0;
//            zero_hold   <= 0;
//        end 
//        else if (enable) begin
//            ready_psum <= 0;
//            max_reach  <= 0;

//            if (zero_hold) begin
//                count <= 0;
//                zero_hold <= 0;
//            end 
//            else if (count == kernel_reg - 1) begin
//                count <= 0;
//                ready_psum <= 1;
//                max_reach  <= 1;
//                zero_hold <= 1; // Luôn gi? 1 chu k? 0 sau m?i l?n hoàn t?t
//            end 
//            else begin
//                count <= count + 1;
//            end
//        end 
//        else begin
//            ready_psum <= 0;
//            max_reach  <= 0;
//        end
//    end
//endmodule


//module counter_3bit_new (
//    input clk,
//    input rst_n,
//    input enable,
//    input load,
//    input width_size, // không dùng
//    input [2:0] kernel, // ví d?: 3 s? ??m 0-0-1-2...
//    output reg [2:0] count,
//    output reg ready_psum,
//    output reg max_reach
//);

//    reg [2:0] kernel_reg;
//    reg hold_zero;

//    always @(posedge clk or negedge rst_n) begin
//        if (!rst_n) begin
//            count       <= 0;
//            kernel_reg  <= 0;
//            ready_psum  <= 0;
//            max_reach   <= 0;
//            hold_zero   <= 1;  // B?t ??u gi? 0
//        end 
//        else if (load) begin
//            kernel_reg  <= kernel;
//            count       <= 0;
//            ready_psum  <= 0;
//            max_reach   <= 0;
//            hold_zero   <= 1;
//        end 
//        else if (enable) begin
//            ready_psum <= 0;
//            max_reach  <= 0;

//            if (hold_zero) begin
//                count <= 0;
//                hold_zero <= 0;
//            end
//            //thay thu
//            else if (count == kernel_reg - 1) begin
//                ready_psum <= 1;
//                max_reach  <= 1;
//                count <= 0;
//                hold_zero <= 1;  // Gi? 0 thêm m?t chu k?
//            end 
//            else begin
//                count <= count + 1;
//            end
//        end
//    end
//endmodule

module counter_3bit_new (
    input clk,
    input rst_n,
    input enable,
    input load,
    input width_size, // không dùng
    input [2:0] kernel, // ví d?: 3 s? ??m 0-0-1-2...
    output reg [2:0] count,
    output reg ready_psum,
    output reg max_reach
);

    reg [2:0] kernel_reg;
    reg hold_zero;
    reg delay_active;  // C? delay ?? sinh tín hi?u ready_psum sau 1 chu k? max_reach

    // ----------- Kh?i ??m và ?i?u khi?n chính ----------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            count         <= 0;
            kernel_reg    <= 0;
            max_reach     <= 0;
            hold_zero     <= 1;
            delay_active  <= 0;
        end 
        else if (load) begin
            kernel_reg    <= kernel;
            count         <= 0;
            max_reach     <= 0;
            hold_zero     <= 1;
            delay_active  <= 0;
        end 
        else if (enable) begin
            max_reach <= 0;

            if (hold_zero) begin
                count <= 0;
                hold_zero <= 0;
            end 
            else if (count == kernel_reg - 1) begin
                count         <= 0;
                hold_zero     <= 1;
                max_reach     <= 1;
                delay_active  <= 1;  // Kích ho?t delay
            end 
            else begin
                count <= count + 1;
            end
        end
    end

    // ----------- Kh?i x? lı riêng cho ready_psum ----------
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ready_psum   <= 0;
        end
        else if (load) begin
            ready_psum   <= 0;
        end
        else if (enable) begin
            if (delay_active) begin
                ready_psum   <= 1;
                delay_active <= 0;
            end else begin
                ready_psum <= 0;
            end
        end
    end

endmodule


//module counter_3bit_new (
//    input clk,
//    input rst_n,
//    input enable,
//    input load,
//    input width_size, // không dùng
//    input [2:0] kernel, // ví d?: 3 s?, giá tr? 0-0-1-2...
//    output reg [2:0] count,
//    output reg ready_psum,
//    output reg max_reach
//);

//    reg [2:0] kernel_reg;
//    reg hold_zero;
//    reg delay_active;  // C? delay ?? sinh tín hi?u ready_psum sau 1 chu k? khi max_reach ??t

//    // Kh?i ??m và ?i?u khi?n chính
//    always @(posedge clk or negedge rst_n) begin
//        if (!rst_n) begin
//            count         <= 0;
//            kernel_reg    <= 0;
//            max_reach     <= 0;
//            hold_zero     <= 1;
//            delay_active  <= 0;
//        end 
//        else if (load) begin
//            kernel_reg    <= kernel;
//            count         <= 0;
//            max_reach     <= 0;
//            hold_zero     <= 1;
//            delay_active  <= 0;
//        end 
//        else if (enable) begin
//            max_reach <= 0;

//            if (hold_zero) begin
//                count <= 0;
//                hold_zero <= 0;
//            end 
//            else if (count == kernel_reg - 1) begin
//                count         <= 0;
//                hold_zero     <= 1;
//                max_reach     <= 1;
//                delay_active  <= 1;  // B?t c? delay ?? delay 1 chu k?
//            end 
//            else begin
//                count <= count + 1;
//            end
//        end
//    end

//    // Kh?i x? lı riêng cho ready_psum
//    always @(posedge clk or negedge rst_n) begin
//        if (!rst_n) begin
//            ready_psum   <= 0;
//            delay_active <= 0;  // Reset tr?ng thái delay khi reset
//        end
//        else if (load) begin
//            ready_psum   <= 0;
//            delay_active <= 0;  // Reset tr?ng thái delay khi load
//        end
//        else if (enable) begin
//            if (delay_active) begin
//                ready_psum   <= 1;   // Sau 1 chu k? delay, kích ho?t ready_psum
//                delay_active <= 0;   // Reset tr?ng thái delay sau khi kích ho?t ready_psum
//            end else begin
//                ready_psum <= 0;
//            end
//        end
//    end

//endmodule





