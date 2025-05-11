`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/05/2025 11:48:52 AM
// Design Name: 
// Module Name: row_mapper
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module row_mapper #(
    parameter PE_ROWS     = 5,
    parameter PE_COLS     = 5,
    parameter DATA_WIDTH  = 16
)(
    input sel, // buoc stride    // max 19

    // 19 dòng d? li?u vào
    input  [DATA_WIDTH-1:0] dataout_1,
    input  [DATA_WIDTH-1:0] dataout_2,
    input  [DATA_WIDTH-1:0] dataout_3,
    input  [DATA_WIDTH-1:0] dataout_4,
    input  [DATA_WIDTH-1:0] dataout_5,
    input  [DATA_WIDTH-1:0] dataout_6,
    input  [DATA_WIDTH-1:0] dataout_7,
    input  [DATA_WIDTH-1:0] dataout_8,
    input  [DATA_WIDTH-1:0] dataout_9,
    input  [DATA_WIDTH-1:0] dataout_10,
    input  [DATA_WIDTH-1:0] dataout_11,
    input  [DATA_WIDTH-1:0] dataout_12,
    input  [DATA_WIDTH-1:0] dataout_13,

    // 25 ??u ra ?ng v?i 25 PE
    output  [DATA_WIDTH-1:0] d_1,
    output  [DATA_WIDTH-1:0] d_2,
    output  [DATA_WIDTH-1:0] d_3,
    output  [DATA_WIDTH-1:0] d_4,
    output  [DATA_WIDTH-1:0] d_5,
    output  [DATA_WIDTH-1:0] d_6,
    output  [DATA_WIDTH-1:0] d_7,
    output  [DATA_WIDTH-1:0] d_8,
    output  [DATA_WIDTH-1:0] d_9,
    output  [DATA_WIDTH-1:0] d_10,
    output  [DATA_WIDTH-1:0] d_11,
    output  [DATA_WIDTH-1:0] d_12,
    output  [DATA_WIDTH-1:0] d_13,
    output  [DATA_WIDTH-1:0] d_14,
    output  [DATA_WIDTH-1:0] d_15,
    output  [DATA_WIDTH-1:0] d_16,
    output  [DATA_WIDTH-1:0] d_17,
    output  [DATA_WIDTH-1:0] d_18,
    output  [DATA_WIDTH-1:0] d_19,
    output  [DATA_WIDTH-1:0] d_20,
    output  [DATA_WIDTH-1:0] d_21,
    output  [DATA_WIDTH-1:0] d_22,
    output  [DATA_WIDTH-1:0] d_23,
    output  [DATA_WIDTH-1:0] d_24,
    output  [DATA_WIDTH-1:0] d_25
    
    
    
);
    assign d_1 = dataout_1;
    assign d_2 = dataout_2;
    assign d_3 = dataout_3;
    
    assign d_4 = dataout_4;
    assign d_5 = dataout_5;
    
    mux2_1 pe6 (.in0(dataout_2),.in1(dataout_3),.sel(sel),.out(d_6));
    
    mux2_1 pe7 (.in0(dataout_3),.in1(dataout_4),.sel(sel),.out(d_7));
    
    mux2_1 pe8 (.in0(dataout_4),.in1(dataout_5),.sel(sel),.out(d_8));
    
    mux2_1 pe9 (.in0(dataout_5),.in1(dataout_6),.sel(sel),.out(d_9));
    
    mux2_1 pe10(.in0(dataout_6),.in1(dataout_7),.sel(sel),.out(d_10));
    
    mux2_1 pe11(.in0(dataout_3),.in1(dataout_5),.sel(sel),.out(d_11));
    
    mux2_1 pe12(.in0(dataout_4),.in1(dataout_6),.sel(sel),.out(d_12));
    
    mux2_1 pe13(.in0(dataout_5),.in1(dataout_7),.sel(sel),.out(d_13));
    
    mux2_1 pe14(.in0(dataout_6),.in1(dataout_8),.sel(sel),.out(d_14));
    
    mux2_1 pe15(.in0(dataout_7),.in1(dataout_9),.sel(sel),.out(d_15));
    
    mux2_1 pe16(.in0(dataout_4),.in1(dataout_7),.sel(sel),.out(d_16));
    
    mux2_1 pe17(.in0(dataout_5),.in1(dataout_8),.sel(sel),.out(d_17));
    
    mux2_1 pe18 (.in0(dataout_6),.in1(dataout_9),.sel(sel),.out(d_18));
    
    mux2_1 pe19 (.in0(dataout_7),.in1(dataout_10),.sel(sel),.out(d_19));
    
    mux2_1 pe20 (.in0(dataout_8),.in1(dataout_11),.sel(sel),.out(d_20));
    
    mux2_1 pe21 (.in0(dataout_5),.in1(dataout_9),.sel(sel),.out(d_21));
    
    mux2_1 pe22 (.in0(dataout_6),.in1(dataout_10),.sel(sel),.out(d_22));
     
    mux2_1 pe23 (.in0(dataout_7),.in1(dataout_11),.sel(sel),.out(d_23));
     
    mux2_1 pe24 (.in0(dataout_8),.in1(dataout_12),.sel(sel),.out(d_24));
      
    mux2_1 pe25 (.in0(dataout_9),.in1(dataout_13),.sel(sel),.out(d_25));
    
    
    
    
    
  

endmodule

