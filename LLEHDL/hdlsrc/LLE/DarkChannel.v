// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\DarkChannel.v
// Created: 2020-07-09 10:41:46
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: DarkChannel
// Source Path: LLE/LLEHDL/DarkChannel/DarkChannel
// Hierarchy Level: 1
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module DarkChannel
          (in0_0,
           in0_1,
           in0_2,
           out0);


  input   [7:0] in0_0;  // uint8
  input   [7:0] in0_1;  // uint8
  input   [7:0] in0_2;  // uint8
  output  [7:0] out0;  // uint8


  wire [7:0] in0 [0:2];  // uint8 [3]
  wire [7:0] DarkChannel_stage1_val [0:1];  // uint8 [2]
  wire [7:0] DarkChannel_stage2_val;  // uint8


  assign in0[0] = in0_0;
  assign in0[1] = in0_1;
  assign in0[2] = in0_2;

  // ---- Tree min implementation ----
  // ---- Tree min stage 1 ----
  assign DarkChannel_stage1_val[0] = (in0[0] <= in0[1] ? in0[0] :
              in0[1]);
  assign DarkChannel_stage1_val[1] = in0[2];



  // ---- Tree min stage 2 ----
  assign DarkChannel_stage2_val = (DarkChannel_stage1_val[0] <= DarkChannel_stage1_val[1] ? DarkChannel_stage1_val[0] :
              DarkChannel_stage1_val[1]);



  assign out0 = DarkChannel_stage2_val;

endmodule  // DarkChannel
