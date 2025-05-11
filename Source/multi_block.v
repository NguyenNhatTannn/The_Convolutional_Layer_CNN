module multi_block (
    input  signed [15:0] A,              // Q4.12
    input  signed [15:0] B,              // Q4.12
    output reg signed [15:0] result      // Q4.12 làm tròn
);
    wire signed [31:0] mult_result;      // Q8.24
    wire signed [31:0] mult_result_rounded;
    wire signed [15:0] final_result;

    assign mult_result = A * B;          // Nhân Q4.12 x Q4.12 = Q8.24

    // Làm tròn b?ng cách c?ng thêm 0.5 * 2^12 = 2048 tr??c khi d?ch
    assign mult_result_rounded = mult_result + 32'sd2048;

    // D?ch ph?i 12 bit ?? v? l?i Q4.12
    assign final_result = mult_result_rounded[27:12];

    always @(*) begin
        result = final_result;
    end
endmodule
