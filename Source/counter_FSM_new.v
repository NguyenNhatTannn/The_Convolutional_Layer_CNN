`timescale 1ns/1ps

module counter_FSM_new(
    input clk,                 // Clock ??ng b? ?? l?u giá tr? khi c?n
    input rst_n,            // Reset m?c th?p (active-low)               // Reset m?c cao ?? thi?t l?p l?i giá tr?
    input enable_count, 
    input sign_psum,              // Tín hi?u b?t ??u kh?i này             // Tín hi?u t? h?p ?? ??m ngay l?p t?c
    input load,                // Tín hi?u n?p giá tr? m?i
    input [4:0] image_size,    // Kích th??c ?nh (5-bit, 0 ??n 31)
    input [2:0] kernel_size,   // Kích th??c kernel (3-bit, 0 ??n 7)
    input [2:0] count_bien,
    input done_sum,  
    input DONE,
    input ready_psum,
    input stride,  // ?i?u khi?n bi?n ??m
    output reg [4:0] count,    // Giá tr? b? ??m (5-bit)
    output reg max_reached,    // C? báo khi ??t giá tr? max
    output reg rw_mode_w,      // C? báo khi count != 0
    output reg [5:0] addr_i,   // ??a ch? ??c cho thanh ghi
    output reg rw_mode_i,      // ?i?u khi?n ghi cho thanh ghi
    output [4:0] cc,
    output reg ready_weight,
    output reg ready_input,
    output reg sign_sel,
    
    output reg psum_row,
    output reg addr_psum,
    output reg rw_mode_psum,
    output reg next_step
    
    

      // Gi?i h?n trên c?a b? ??m
);

    reg [4:0] img_reg;
    reg [2:0] kernel_reg;
    reg [4:0] c; // image_size - kernel_size - 1
      // Vì 2-bit là ?? ??m t? 0 ??n 2

  
    //sequential ===============OKKKKKKKKKKKKKK
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            img_reg <= 5'b0;
            kernel_reg <= 3'b0;
            count <=0;
        end 
        else if (load) begin
            img_reg <= image_size;
            kernel_reg <= kernel_size;
        end
    end

   
//++++++++++++++++++++OKKKKKKKKKKKKKKKKKKKKKKK

    // Tính toán c ngay khi img_reg ho?c kernel_reg thay ??i
    always @(*) begin
        if (img_reg >= kernel_reg + 1)
            if(stride == 0)
                 c = img_reg - kernel_reg + 1  ;
            else
                 c = ((img_reg - kernel_reg + 2 - 1) / 2) + 1;


        else
            c = 5'b0;
    end

   //OKKKKKKKKKKKKKKKKKKKKKKKKKKKKKK
   always @(*) begin
      rw_mode_psum = 1'b0;  // Luôn có giá tr? m?c ??nh
      addr_psum = 1;
      next_step = 0;
    
    if (count_bien == 1 && ready_psum != 1) begin
        rw_mode_psum = 1'b1;
        addr_psum = 0;
    end
    if( count == c - 1 && count_bien == 2 )begin
            next_step = 1'b1;
            end
        else
            next_step = 1'b0;
end

 

always @(*) begin
    if (!rst_n) begin
        count = 5'b00000;
        max_reached = 1'b0;
    end
    else if (enable_count) begin
        if (count >= c - 1 && c != 0) begin  // Khi ??t giá tr? c thì reset v? 0
            count = 5'b00000;
            max_reached = 1'b1;
        end   
        else begin
            count = count + 1;
            max_reached = 1'b0;
        end
    end
  
end




//OKKKOKOKOKOKOKO
    always @(*) begin
            sign_sel = sign_psum;
            psum_row = sign_psum;
   
     end

  
    //combination - tín hi?u rw_mode_w
    
    always @(*) begin
    rw_mode_w = (count != 5'b00000) || flag_first_count_nonzero;
    end
    
  // combination - tín hi?u rw_mode_i
    always @(*) begin
        if(stride == 0)
        rw_mode_i = ((count != 0) && (count_bien != kernel_reg - 1));
        else
        rw_mode_i = ((count != 0) && (count_bien < kernel_reg - 2));
    end


  
//    //combination - tín hi?u ready_weight
//    always @(*) begin
//    if ((count == 5'b00000 && count_bien < kernel_reg - 1 ))
//    begin
//        ready_weight = 1'b1;
//    end else begin
//        ready_weight = 1'b0;
//    end
//end

reg flag_first_count_nonzero;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n || c == 0) begin
        flag_first_count_nonzero <= 1'b0;
    end else if (count != 0 && !flag_first_count_nonzero) begin
        flag_first_count_nonzero <= 1'b1;  // Ghi nh?n l?n ??u count ? 0
    end
end

always @(*) begin
    // Ch? cho ready_weight = 1 trong l?n ??u tiên count == 0 và c? ch?a b?t
    if (count == 5'b00000 && !flag_first_count_nonzero && count_bien < kernel_reg - 1)
        ready_weight = 1'b1;
    else
        ready_weight = 1'b0;
end



//always @(*) begin
//    if (c != 0) begin
//        addr_i = (count + count_bien) % (kernel_reg);

//        if (count == 0) begin
//            if (count_bien < (kernel_reg - 1))
//                ready_input = 1'b1;
//            else
//                ready_input = 1'b0;
//        end else begin
//            if (count_bien == (kernel_reg - 2))
//            begin
//                ready_input = 1'b1;
//            end
//            else
//                ready_input = 1'b0;
//        end

//     end else begin
//        addr_i = 3'b000;
//        ready_input = 1'b1;
//    end
//end

//    assign cc = c;


//reg tmp;

//always @(posedge clk or negedge rst_n) begin
//    if (!rst_n) begin
//        tmp <= 1'b0;
//    end else if (c == 0) begin
//        tmp <= 1'b0;  // Reset l?i giai ?o?n ??u n?u c == 0
//    end else if (count == 0 && count_bien >= (kernel_reg - 1)) begin
//        tmp <= 1'b1;  // Chuy?n sang giai ?o?n 2 khi v??t m?c kernel_reg - 1
//    end
//end

//always @(*) begin
//    if (c != 0) begin
//        addr_i = (count + count_bien) % kernel_reg;

//        if (count == 0) begin
//            if (tmp == 1'b0) begin
//                // Giai ?o?n ??u tiên
//                ready_input = (count_bien < (kernel_reg - 1)) ? 1'b1 : 1'b0;
//            end else begin
//                // Giai ?o?n sau: luôn s?n sàng khi count == 0
//                ready_input = 1'b1;
//            end
//        end else begin
//            // count != 0
//            ready_input = (count_bien == (kernel_reg - 2)) ? 1'b1 : 1'b0;
//        end
//    end else begin
//        addr_i = 3'b000;
//        ready_input = 1'b1;
//    end
//end



//always @(*) begin
//    if (c != 0) begin
//        addr_i = (count + count_bien) % kernel_reg;

//        if (count == 0) begin
//            ready_input = 1'b1;
//        end else begin
//            ready_input = (count_bien == (kernel_reg - 2)) ? 1'b1 : 1'b0;
//        end
//    end else begin
//        addr_i = 3'b000;
//        ready_input = 1'b1;
//    end
//end


//reg seen_first_count0;

//always @(posedge clk or negedge rst_n) begin
//    if (!rst_n || c == 0) begin
//        seen_first_count0 <= 1'b0;
//    end else if (!seen_first_count0 && count != 0) begin
//        seen_first_count0 <= 1'b1;  // B?t c? ngay khi count ? 0 l?n ??u
//    end
//end

//always @(*) begin
//    if (c != 0) begin
//        addr_i = (count + count_bien) % kernel_reg;

//        if (count == 0)
//            ready_input = !seen_first_count0 || (count_bien < kernel_reg - 1);
//        else
//            ready_input = (count_bien == kernel_reg - 1);
//    end else begin
//        addr_i = 3'b000;
//        ready_input = 1'b1;
//    end
//end

reg seen_nonzero_before;
reg seen_second_count0;

//always @(posedge clk or negedge rst_n) begin
//    if (!rst_n || c == 0) begin
//        seen_nonzero_before <= 1'b0;
//        seen_second_count0  <= 1'b0;
//    end else begin
//        // Ghi nh?n t?ng th?y count != 0
//        if (count != 0)
//            seen_nonzero_before <= 1'b1;

//        // N?u ?ã t?ng th?y count != 0 và gi? quay l?i count == 0 ? B?t c?
//        if (count == 0 && seen_nonzero_before && !seen_second_count0)
//            seen_second_count0 <= 1'b1;
//    end
//end

//always @(*) begin
//    if (c != 0) begin
//        addr_i = (count + count_bien) % kernel_reg;

//        if (count == 0) begin
//            // Giai ?o?n ??u tiên: ch?a b?t c? thì luôn cho ready_input = 1
//            // Giai ?o?n hai: ch? cho ready_input n?u count_bien < kernel-1
//            ready_input = !seen_second_count0 || (count_bien < kernel_reg);
//        end else begin
//            // Khi count != 0
//            if (!seen_second_count0)
//                ready_input = (count_bien == kernel_reg - 1);
//            else
//                ready_input = (count_bien == kernel_reg - 1);
//        end
//    end else begin
//        addr_i = 3'b000;
//        ready_input = 1'b1;
//    end
//end

reg seen_second_count0;
reg prev_count_nonzero;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n || c == 0) begin
        seen_second_count0  <= 1'b0;
        prev_count_nonzero  <= 1'b0;
    end else begin
        // Phát hi?n biên count: t? ?0 ? 0 ? B?t c?
        // Co sua o day == => !=
        if (prev_count_nonzero && count != 0)
            seen_second_count0 <= 1'b1;

        // C?p nh?t tr?ng thái tr??c
        prev_count_nonzero <= (count != 0);
    end
end

//always @(*) begin
//    if (c != 0) begin
//        // O day co 1 cai addr_i nua 
//        addr_i = (count_bien + (kernel_reg - (count % kernel_reg))) % kernel_reg;
//        if (count == 0)
//            ready_input = !seen_second_count0 || (count_bien < kernel_reg);
//        else
////            ready_input = (count_bien == kernel_reg - 1); // Không ph? thu?c seen_second_count0
//            ready_input = (count_bien == kernel_reg - 2 || count_bien == kernel_reg - 1); // Không ph? thu?c seen_second_count0
//    end else begin
//        addr_i = 3'b000;
//        ready_input = 1'b1;
//    end
//end

always @(*) begin
    if (c != 0) begin
        if(stride == 0)
           addr_i = (count_bien + count) % kernel_reg;
        else
            addr_i = (count_bien + 2 * count) % kernel_reg;


        if (count == 0)
            if(stride == 0)
                 ready_input = (!seen_second_count0 || (count_bien < kernel_reg));
            else
                 ready_input = (count_bien < kernel_reg);
        else
            if(stride == 0)
                ready_input = (count_bien == kernel_reg - 1); 
            else
                ready_input = (count_bien >= kernel_reg - 2);
    end else begin
        addr_i = 3'b000;
        ready_input = 1'b1;
    end
end




endmodule



