// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\Inversion.v
// Created: 2020-07-09 10:41:45
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Inversion
// Source Path: LLE/LLEHDL/Inversion
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Inversion
          (clk,
           reset,
           enb,
           PixIn_0,
           PixIn_1,
           PixIn_2,
           InvOut_0,
           InvOut_1,
           InvOut_2);


  input   clk;
  input   reset;
  input   enb;
  input   [7:0] PixIn_0;  // uint8
  input   [7:0] PixIn_1;  // uint8
  input   [7:0] PixIn_2;  // uint8
  output  [7:0] InvOut_0;  // uint8
  output  [7:0] InvOut_1;  // uint8
  output  [7:0] InvOut_2;  // uint8


  wire [7:0] Constant_out1;  // uint8
  wire [7:0] PixIn [0:2];  // uint8 [3]
  wire signed [8:0] Subtract_u;  // sfix9
  wire signed [8:0] Subtract_sub_temp;  // sfix9
  wire signed [8:0] Subtract_sub_temp_1;  // sfix9
  wire signed [8:0] Subtract_sub_temp_2;  // sfix9
  wire signed [8:0] Subtract_1;  // sfix9
  wire signed [8:0] Subtract_2;  // sfix9
  wire signed [8:0] Subtract_3;  // sfix9
  wire [7:0] Subtract_out1 [0:2];  // uint8 [3]
  reg [7:0] Delay_out1 [0:2];  // uint8 [3]


  assign Constant_out1 = 8'b11111111;



  assign PixIn[0] = PixIn_0;
  assign PixIn[1] = PixIn_1;
  assign PixIn[2] = PixIn_2;

  assign Subtract_u = {1'b0, Constant_out1};
  assign Subtract_1 = {1'b0, PixIn[0]};
  assign Subtract_sub_temp = Subtract_u - Subtract_1;
  assign Subtract_out1[0] = (Subtract_sub_temp[8] == 1'b1 ? 8'b00000000 :
              Subtract_sub_temp[7:0]);
  assign Subtract_2 = {1'b0, PixIn[1]};
  assign Subtract_sub_temp_1 = Subtract_u - Subtract_2;
  assign Subtract_out1[1] = (Subtract_sub_temp_1[8] == 1'b1 ? 8'b00000000 :
              Subtract_sub_temp_1[7:0]);
  assign Subtract_3 = {1'b0, PixIn[2]};
  assign Subtract_sub_temp_2 = Subtract_u - Subtract_3;
  assign Subtract_out1[2] = (Subtract_sub_temp_2[8] == 1'b1 ? 8'b00000000 :
              Subtract_sub_temp_2[7:0]);



  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1[0] <= 8'b00000000;
        Delay_out1[1] <= 8'b00000000;
        Delay_out1[2] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay_out1[0] <= Subtract_out1[0];
          Delay_out1[1] <= Subtract_out1[1];
          Delay_out1[2] <= Subtract_out1[2];
        end
      end
    end



  assign InvOut_0 = Delay_out1[0];

  assign InvOut_1 = Delay_out1[1];

  assign InvOut_2 = Delay_out1[2];

endmodule  // Inversion

