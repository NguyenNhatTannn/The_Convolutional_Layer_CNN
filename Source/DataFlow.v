//module DataFlow (
//    input  [19:0] data_in0,
//    input  [19:0] data_in1,
//    input  [19:0] data_in2,
//    input  [19:0] data_in3,
//    input  [19:0] data_in4,
//    input  [19:0] data_in5,
//    input  [19:0] data_in6,
//    input  [19:0] data_in7,
//    input  [19:0] data_in8,
//    input  [19:0] data_in9,
//    input  [19:0] data_in10,
//    input  [19:0] data_in11,
//    input  [19:0] data_in12,

//    output reg [15:0] dout_input0,
//    output reg [15:0] dout_input1,
//    output reg [15:0] dout_input2,
//    output reg [15:0] dout_input3,
//    output reg [15:0] dout_input4,
//    output reg [15:0] dout_input5,
//    output reg [15:0] dout_input6,
//    output reg [15:0] dout_input7,
//    output reg [15:0] dout_input8,
//    output reg [15:0] dout_input9,
//    output reg [15:0] dout_input10,
//    output reg [15:0] dout_input11,
//    output reg [15:0] dout_input12
//);

//    reg [15:0] temp_output [0:12];
//    reg [19:0] data_arr [0:12];
//    integer i;
//    reg [3:0] index;

//    always @(*) begin
//        // Gán input vào m?ng
//        data_arr[0]  = data_in0;  data_arr[1]  = data_in1;  data_arr[2]  = data_in2;
//        data_arr[3]  = data_in3;  data_arr[4]  = data_in4;  data_arr[5]  = data_in5;
//        data_arr[6]  = data_in6;  data_arr[7]  = data_in7;  data_arr[8]  = data_in8;
//        data_arr[9]  = data_in9;  data_arr[10] = data_in10; data_arr[11] = data_in11;
//        data_arr[12] = data_in12;

//        // Reset t?t c? output = 0
//        for (i = 0; i < 13; i = i + 1)
//            temp_output[i] = 16'd0;

//        // Gán theo index
//        for (i = 0; i < 13; i = i + 1) begin
//            index = data_arr[i][19:16];
//            if (index !=0)
//                temp_output[index-1] = data_arr[i][15:0];
//        end

//        // Gán ra c?ng output
//        dout_input0  = temp_output[0];
//        dout_input1  = temp_output[1];
//        dout_input2  = temp_output[2];
//        dout_input3  = temp_output[3];
//        dout_input4  = temp_output[4];
//        dout_input5  = temp_output[5];
//        dout_input6  = temp_output[6];
//        dout_input7  = temp_output[7];
//        dout_input8  = temp_output[8];
//        dout_input9  = temp_output[9];
//        dout_input10 = temp_output[10];
//        dout_input11 = temp_output[11];
//        dout_input12 = temp_output[12];
        
//    end
//endmodule


//module DataFlow (
//    input  [19:0] data_in0,
//    input  [19:0] data_in1,
//    input  [19:0] data_in2,
//    input  [19:0] data_in3,
//    input  [19:0] data_in4,
//    input  [19:0] data_in5,
//    input  [19:0] data_in6,
//    input  [19:0] data_in7,
//    input  [19:0] data_in8,
//    input  [19:0] data_in9,
//    input  [19:0] data_in10,
//    input  [19:0] data_in11,
//    input  [19:0] data_in12,

//    output reg [15:0] dout_input0,
//    output reg [15:0] dout_input1,
//    output reg [15:0] dout_input2,
//    output reg [15:0] dout_input3,
//    output reg [15:0] dout_input4,
//    output reg [15:0] dout_input5,
//    output reg [15:0] dout_input6,
//    output reg [15:0] dout_input7,
//    output reg [15:0] dout_input8,
//    output reg [15:0] dout_input9,
//    output reg [15:0] dout_input10,
//    output reg [15:0] dout_input11,
//    output reg [15:0] dout_input12
//);

//    // Clear all outputs before assignment
//    always @(*) begin
//        dout_input0  = 16'd0;
//        dout_input1  = 16'd0;
//        dout_input2  = 16'd0;
//        dout_input3  = 16'd0;
//        dout_input4  = 16'd0;
//        dout_input5  = 16'd0;
//        dout_input6  = 16'd0;
//        dout_input7  = 16'd0;
//        dout_input8  = 16'd0;
//        dout_input9  = 16'd0;
//        dout_input10 = 16'd0;
//        dout_input11 = 16'd0;
//        dout_input12 = 16'd0;

//        assign_output(data_in0);
//        assign_output(data_in1);
//        assign_output(data_in2);
//        assign_output(data_in3);
//        assign_output(data_in4);
//        assign_output(data_in5);
//        assign_output(data_in6);
//        assign_output(data_in7);
//        assign_output(data_in8);
//        assign_output(data_in9);
//        assign_output(data_in10);
//        assign_output(data_in11);
//        assign_output(data_in12);
//    end

//    // Task tách riêng giúp ti?t ki?m code và LUT
//    task assign_output;
//        input [19:0] data;
//        reg [3:0] index;
//        begin
//            index = data[19:16];
//            if (index != 0) begin
//                case (index - 1)
//                    4'd0:  dout_input0  = data[15:0];
//                    4'd1:  dout_input1  = data[15:0];
//                    4'd2:  dout_input2  = data[15:0];
//                    4'd3:  dout_input3  = data[15:0];
//                    4'd4:  dout_input4  = data[15:0];
//                    4'd5:  dout_input5  = data[15:0];
//                    4'd6:  dout_input6  = data[15:0];
//                    4'd7:  dout_input7  = data[15:0];
//                    4'd8:  dout_input8  = data[15:0];
//                    4'd9:  dout_input9  = data[15:0];
//                    4'd10: dout_input10 = data[15:0];
//                    4'd11: dout_input11 = data[15:0];
//                    4'd12: dout_input12 = data[15:0];
//                endcase
//            end
//        end
//    endtask

//endmodule


module DataFlow (
    input  [19:0] data_in0,
    input  [19:0] data_in1,
    input  [19:0] data_in2,
    input  [19:0] data_in3,
    input  [19:0] data_in4,
    input  [19:0] data_in5,
    input  [19:0] data_in6,
    input  [19:0] data_in7,
    input  [19:0] data_in8,
    input  [19:0] data_in9,
    input  [19:0] data_in10,
    input  [19:0] data_in11,
    input  [19:0] data_in12,

    output reg [15:0] dout_input0,
    output reg [15:0] dout_input1,
    output reg [15:0] dout_input2,
    output reg [15:0] dout_input3,
    output reg [15:0] dout_input4,
    output reg [15:0] dout_input5,
    output reg [15:0] dout_input6,
    output reg [15:0] dout_input7,
    output reg [15:0] dout_input8,
    output reg [15:0] dout_input9,
    output reg [15:0] dout_input10,
    output reg [15:0] dout_input11,
    output reg [15:0] dout_input12
);

    // Reset toàn b? output v? 0
    always @(*) begin
        dout_input0  = 16'd0;
        dout_input1  = 16'd0;
        dout_input2  = 16'd0;
        dout_input3  = 16'd0;
        dout_input4  = 16'd0;
        dout_input5  = 16'd0;
        dout_input6  = 16'd0;
        dout_input7  = 16'd0;
        dout_input8  = 16'd0;
        dout_input9  = 16'd0;
        dout_input10 = 16'd0;
        dout_input11 = 16'd0;
        dout_input12 = 16'd0;

        set_output(data_in0);
        set_output(data_in1);
        set_output(data_in2);
        set_output(data_in3);
        set_output(data_in4);
        set_output(data_in5);
        set_output(data_in6);
        set_output(data_in7);
        set_output(data_in8);
        set_output(data_in9);
        set_output(data_in10);
        set_output(data_in11);
        set_output(data_in12);
    end

    task set_output(input [19:0] din);
        reg [3:0] idx;
        begin
            idx = din[19:16];
            if (idx != 0) begin
                case (idx)
                    4'd1:  dout_input0  = din[15:0];
                    4'd2:  dout_input1  = din[15:0];
                    4'd3:  dout_input2  = din[15:0];
                    4'd4:  dout_input3  = din[15:0];
                    4'd5:  dout_input4  = din[15:0];
                    4'd6:  dout_input5  = din[15:0];
                    4'd7:  dout_input6  = din[15:0];
                    4'd8:  dout_input7  = din[15:0];
                    4'd9:  dout_input8  = din[15:0];
                    4'd10: dout_input9  = din[15:0];
                    4'd11: dout_input10 = din[15:0];
                    4'd12: dout_input11 = din[15:0];
                    4'd13: dout_input12 = din[15:0];
                endcase
            end
        end
    endtask

endmodule
