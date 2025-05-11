module adder_block (
    input signed [15:0] A,  // Nh?p s? A trong d?ng Q4.12
    input signed [15:0] B,  // Nh?p s? B trong d?ng Q4.12
    output reg signed [15:0] result  // K?t qu? c?ng trong d?ng Q4.12
);
    always @(*) begin
        result = A + B;  // C?ng hai s? fixed-point l?i
    end
endmodule
