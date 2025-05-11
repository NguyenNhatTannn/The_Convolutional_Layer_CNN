//module RAM_CONFIG (
//    input wire clk,
//    input wire rst_n,
    
//    // Tín hi?u ?i?u khi?n
//    input wire wr_en,       // Ghi d? li?u

//    // D? li?u ??u vào
//    input wire [2:0] kernel_size_in,
//    input wire [4:0] img_size_in,
//    input wire  [1:0]    stride_in,
//    input wire [4:0] width_size_in,
//    input wire [4:0] number_kernel_in,

//    // D? li?u ??u ra
//    output reg [2:0] kernel_size_out,
//    output reg [4:0] img_size_out,
//    output reg    [1:0]   stride_out,
//    output reg [4:0] width_size_out,
//    output reg [4:0] number_kernel_out
//);

//    // Ghi và xu?t d? li?u
//    always @(posedge clk or negedge rst_n) begin
//        if (!rst_n) begin
//            kernel_size_out <= 3'b0;
//            img_size_out <= 5'b0;
//            stride_out <= 1'b0;
//            width_size_out <= 1'b0;
//            number_kernel_out <= 5'b0;
//        end else if (wr_en) begin
//            kernel_size_out <= kernel_size_in;
//            img_size_out <= img_size_in;
//            stride_out <= stride_in;
//            width_size_out <= width_size_in;
//            number_kernel_out <= number_kernel_in;
//        end
//    end

//endmodule


module RAM_CONFIG (
    input wire clk,
    input wire rst_n,
    input wire wr_en,

    input wire [2:0] kernel_size_in,
    input wire [4:0] img_size_in,
    input wire [1:0] stride_in,
    input wire [4:0] width_size_in,
    input wire [4:0] number_kernel_in,

    output reg [2:0] kernel_size_out,
    output reg [4:0] img_size_out,
    output reg [1:0] stride_out,
    output reg [4:0] width_size_out,
    output reg [4:0] number_kernel_out
);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            {kernel_size_out, img_size_out, stride_out, width_size_out, number_kernel_out} <= 19'b0;
        end else if (wr_en) begin
            {kernel_size_out, img_size_out, stride_out, width_size_out, number_kernel_out} <=
                {kernel_size_in, img_size_in, stride_in, width_size_in, number_kernel_in};
        end
    end

endmodule
