module RAM_5x5 (
    input wire clk,                // T�n hi?u ??ng h?
    input wire rst_n,                // T�n hi?u reset
    input wire [2:0] addr_write,   // ??a ch? ghi (0 ??n 18)
    input wire [2:0] addr_read,    // ??a ch? ??c (0 ??n 18)
    
    // T�n hi?u ghi v�o RAM
    input wire [15:0] data_in_0,   // D? li?u v�o RAM 0 (16 bit)
    input wire [15:0] data_in_1,   // D? li?u v�o RAM 1 (16 bit)
    input wire [15:0] data_in_2,   // D? li?u v�o RAM 2 (16 bit)
    input wire [15:0] data_in_3,   // D? li?u v�o RAM 3 (16 bit)
    input wire [15:0] data_in_4,   // D? li?u v�o RAM 4 (16 bit)
    // T�n hi?u ghi cho 13 RAM (13 bit)
    input wire [4:0] write_enable, // T�n hi?u ghi 13 bit (bit 0 ??n bit 12 cho c�c RAM)
    input wire  read_enable,

    // D? li?u ra t? c�c RAM
    output wire [19:0] data_out_0,  // D? li?u ra t? RAM 0 (16 bit)
    output wire [19:0] data_out_1,  // D? li?u ra t? RAM 1 (16 bit)
    output wire [19:0] data_out_2,  // D? li?u ra t? RAM 2 (16 bit)
    output wire [19:0] data_out_3,  // D? li?u ra t? RAM 3 (16 bit)
    output wire [19:0] data_out_4  // D? li?u ra t? RAM 4 (16 bit)

);

    
//    // C�c m�-?un RAM 19x16
//    RAM_weight ram_0 (
//        .clk(clk),
//        .rst(rst),
//        .addr_write(addr_write),
//        .addr_read(addr_read),
//        .data_in(data_in_0),
//        .write_enable(write_enable[0]), // Ghi cho RAM 0
//        .read_enable(read_enable),
//        .data_out(data_out_0)
//    );

    
    
  RAM_weight ram_1 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_0),
        .write_enable(write_enable[0]), // Ghi cho RAM 0
        .read_enable(read_enable),
        .data_out(data_out_0)
    );
   

    RAM_weight ram_2 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_1),
        .write_enable(write_enable[1]), // Ghi cho RAM 0
        .read_enable(read_enable),
        .data_out(data_out_1)
    );

  RAM_weight ram_3 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_2),
        .write_enable(write_enable[2]), // Ghi cho RAM 0
        .read_enable(read_enable),
        .data_out(data_out_2)
    );

  RAM_weight ram_4 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_3),
        .write_enable(write_enable[3]), // Ghi cho RAM 0
        .read_enable(read_enable),
        .data_out(data_out_3)
    );
    
  RAM_weight ram_5 (
        .clk(clk),
        .rst_n(rst_n),
        .addr_write(addr_write),
        .addr_read(addr_read),
        .data_in(data_in_4),
        .write_enable(write_enable[4]), // Ghi cho RAM 0
        .read_enable(read_enable),
        .data_out(data_out_4)
    );

     
endmodule
