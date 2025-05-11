module FIFO_RESULT (
    input              clk,
    input              rst_n,
    input              push,           // ghi d? li?u vào FIFO
    input              pop,            // ??c d? li?u t? FIFO
    input      [15:0]  data_in,
    output reg [15:0]  data_out,
    output             empty,
    output             full,
    output reg [3:0]   count           // ??m s? ph?n t? hi?n t?i (t?i ?a 10)
);

    reg [15:0] fifo_mem [0:9];         // b? nh? FIFO 10 ph?n t?
    reg [3:0]  wr_ptr;                 // con tr? ghi (0-9)
    reg [3:0]  rd_ptr;                 // con tr? ??c (0-9)

    assign empty = (count == 0);
    assign full  = (count == 10);

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            wr_ptr <= 0;
            rd_ptr <= 0;
            count  <= 0;
        end else begin
            // push vào FIFO
            if (push && !full) begin
                fifo_mem[wr_ptr] <= data_in;
                wr_ptr <= (wr_ptr == 9) ? 0 : wr_ptr + 1;
                count <= count + 1;
            end

            // pop kh?i FIFO
            if (pop && !empty) begin
                data_out <= fifo_mem[rd_ptr];
                rd_ptr <= (rd_ptr == 9) ? 0 : rd_ptr + 1;
                count <= count - 1;
            end
        end
    end

endmodule
