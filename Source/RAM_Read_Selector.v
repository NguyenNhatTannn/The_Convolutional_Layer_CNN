module RAM_Read_Selector (
    input clk,
    input  wire        rst_n,
    input  wire        pop_i,
    input  wire [2:0]  kernel_size,
    input  wire [1:0]  stride,
    input  wire [4:0]  img_size,
    input  wire [4:0]  width_size,
    input wire [4:0] number_kernel,

    output reg  [4:0]  m,
    output reg  [4:0]  start_line,
    output reg [4:0]  addr_read_RAM_input,

    output reg  [4:0]  pattern_out0,
    output reg  [4:0]  pattern_out1,
    output reg  [4:0]  pattern_out2,
    output reg  [4:0]  pattern_out3,
    output reg  [4:0]  pattern_out4,
    output reg  [4:0]  pattern_out5,
    output reg  [4:0]  pattern_out6,
    output reg  [4:0]  pattern_out7,
    output reg  [4:0]  pattern_out8,
    output reg  [4:0]  pattern_out9,
    output reg  [4:0]  pattern_out10,
    output reg  [4:0]  pattern_out11,
    output reg  [4:0]  pattern_out12,
    output  reg DONE,
    //OUTPUT GHI
    output  reg [4:0] k_reg,
    output  reg next_step,
    output  reg [4:0] cot_working,
    output reg [4:0] tmp,
    output reg [24:0] enable_active,
    output reg [4:0] number_kernel_working

);

    reg [4:0] pattern_out [0:12];
    reg [3:0] index;
    integer i;
    reg [4:0] cot_init;
    reg [4:0] number_kernel_init;
    
    

//always @(*) begin
//    if (cot_working > 5) begin
//        tmp = 5;
//        if (kernel_size == 5) begin
//            enable_active = 25'b11111_11111_11111_11111_11111;
//        end else begin
//            enable_active = 25'b00111_00111_00111_00111_00111;
//        end
//    end
//    else begin
//        tmp = cot_working;
//        if (kernel_size == 5) begin
//            enable_active = 25'b0;
//            // Kích ho?t 5*tmp bit cu?i
//            for (i = 0; i < tmp * 5; i = i + 1) begin
//                enable_active[i] = 1'b1;
//            end
//        end else if (kernel_size == 3) begin
//                enable_active = 25'b0;
//            // V?i m?i tmp, chèn 00111 vào t? LSB
//            for (i = 0; i < tmp; i = i + 1) begin
//                enable_active[i*5 +: 5] = 5'b00111;
//            end
//        end
//    end
//    m = kernel_size + (tmp - 1) * stride;
//    start_line = (k_reg - 1) * (stride * 5) + 1;
//end
    reg [24:0] enable_active_next;

always @(*) begin
    tmp = (cot_working > 5) ? 5 : cot_working;

    if (cot_working > 5) begin
        if (kernel_size == 5)
            enable_active_next = 25'b11111_11111_11111_11111_11111;
        else
            enable_active_next = 25'b00111_00111_00111_00111_00111;
    end else begin
        enable_active_next = 25'b0;
        if (kernel_size == 5) begin
            for (i = 0; i < tmp * 5; i = i + 1)
                enable_active_next[i] = 1'b1;
        end else if (kernel_size == 3) begin
            for (i = 0; i < tmp && i<5; i = i + 1)
                enable_active_next[i*5 +: 5] = 5'b00111;
        end
    end

    m = kernel_size + (tmp - 1) * stride;
    start_line = (k_reg - 1) * (stride * 5) + 1;
end

    reg [24:0] enable_shift_reg [2:0];

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        enable_shift_reg[0] <= 25'b0;
        enable_shift_reg[1] <= 25'b0;
        enable_shift_reg[2] <= 25'b0;
        enable_active       <= 25'b0;
    end else begin
        enable_shift_reg[0] <= enable_active_next;
        enable_shift_reg[1] <= enable_shift_reg[0];
        enable_shift_reg[2] <= enable_shift_reg[1];
        enable_active       <= enable_shift_reg[2];
    end
end




    // Counter t?ng theo pop_i ho?c reset khi rst ho?c k thay ??i
   
// always @(negedge rst_n or posedge clk) begin
//    if (!rst_n) begin
//        addr_read_RAM_input <= 0;
//        next_step <= 0;
//    end else if (pop_i) begin
//        if (addr_read_RAM_input == width_size - 1) begin
//            addr_read_RAM_input <= 0;
//            next_step <= 1'b1;
//        end else begin
//            addr_read_RAM_input <= addr_read_RAM_input + 1;
//            next_step <= 1'b0;
//        end
//    end else begin
//        next_step <= 1'b0;  // gi? ho?c reset n?u c?n
//    end
//end

//reg reset_done;

//always @(negedge rst_n or negedge clk) begin
//    if (!rst_n) begin
//        addr_read_RAM_input <= 0;
//        next_step           <= 0;
//        reset_done          <= 0;
//    end else begin
//        if (pop_i) begin
//            if (!reset_done) begin
//                // L?n ??u pop_i lên 1 ? reset v? 0
//                addr_read_RAM_input <= 0;
//                next_step           <= 0;
//                reset_done          <= 1;
//            end else begin
//                // Các l?n sau khi pop_i v?n = 1 ? t?ng
//                if (addr_read_RAM_input == width_size - 1) begin
//                    addr_read_RAM_input <= 0;
//                    next_step           <= 1;
//                end else begin
//                    addr_read_RAM_input <= addr_read_RAM_input + 1;
//                    next_step           <= 0;
//                end
//            end
//        end else begin
//            // pop_i = 0 ? gi? nguyên addr & reset_done, ch? clear next_step
//            next_step <= 0;
//        end
//    end
//end


reg reset_done;
reg hold_cycle;

always @(negedge rst_n or negedge clk) begin
    if (!rst_n) begin
        addr_read_RAM_input <= 0;
        next_step           <= 0;
        reset_done          <= 0;
        hold_cycle          <= 0;
    end else begin
        if (pop_i) begin
            if (!reset_done) begin
                // L?n ??u tiên pop_i lên 1 ? kh?i t?o
                addr_read_RAM_input <= 0;
                next_step           <= 0;
                reset_done          <= 1;
                hold_cycle          <= 0;
            end else if (hold_cycle) begin
                // Chu k? delay gi? addr = 0
                addr_read_RAM_input <= 0;
                next_step           <= 0;
                hold_cycle          <= 0;  // Sau delay 1 chu k? thì t?t c? hold
            end else begin
                // chinh lai o day
                if (addr_read_RAM_input == width_size - 1) begin
                    addr_read_RAM_input <= 0;    // Reset v? 0
                    next_step           <= 1;    // Thông báo ?ã hoàn t?t 1 vòng
                    hold_cycle          <= 1;    // B?t c? gi? 1 chu k? ? 0
                end else begin
                    addr_read_RAM_input <= addr_read_RAM_input + 1;
                    next_step           <= 0;
                end
            end
        end else begin
            // Không có pop_i ? gi? nguyên
            next_step <= 0;
        end
    end
end



  // Sinh pattern_out theo d?ng vòng tròn
     always @(*) begin
        // Reset t?t c? giá tr? v? 0
        for (i = 0; i < 13; i = i + 1)
            pattern_out[i] = 5'b00000;

        // Gán index t?ng d?n vào ?úng pattern_out theo vòng tròn, b?t ??u t? start_line
        for (i = 0; i < m; i = i + 1) begin
            index = i + 1; // index t?ng t? 1 ??n m
            pattern_out[(start_line + i - 1) % 13] = {index, 1'b1};  // Gán giá tr? có bit enable
        end
    end
    
    
  // Mapping m?ng pattern_out vào t?ng c?ng output
    always @(*) begin
        pattern_out0  = pattern_out[0];
        pattern_out1  = pattern_out[1];
        pattern_out2  = pattern_out[2];
        pattern_out3  = pattern_out[3];
        pattern_out4  = pattern_out[4];
        pattern_out5  = pattern_out[5];
        pattern_out6  = pattern_out[6];
        pattern_out7  = pattern_out[7];
        pattern_out8  = pattern_out[8];
        pattern_out9  = pattern_out[9];
        pattern_out10 = pattern_out[10];
        pattern_out11 = pattern_out[11];
        pattern_out12 = pattern_out[12];
    end


  


always @(*) begin
    // Tính giá tr? cot m?t l?n d?a vào thông s? ??u vào
    cot_init = ((img_size - kernel_size + stride - 1) / stride) + 1;
    number_kernel_init = number_kernel;
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        k_reg        <= 5'd1;
        DONE         <= 1'b0;
        cot_working  <= 0;
    end else if (next_step) begin
        if (cot_working > 5) begin
            cot_working <= cot_working - 5;
            k_reg       <= k_reg + 1;
        end else begin
            DONE <= 1'b1;
            k_reg <= 1'd1;
        end
    end else if (k_reg == 5'd1) begin
 
        cot_working <= cot_init;
        DONE         <= 1'b0;
    end
end

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        number_kernel_working <= 0;
    end else if (next_step && cot_working <= 5) begin
        number_kernel_working <= number_kernel_working - 1;
    end else if (k_reg == 5'd1 && number_kernel_working == 0) begin
        number_kernel_working <= number_kernel_init;
    end
end


endmodule