// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\LineInfoStore_block5.v
// Created: 2020-07-09 10:41:45
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: LineInfoStore_block5
// Source Path: LLE/LLEHDL/IterativeFilter/Image Filter1/LineBuffer/LineInfoStore
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module LineInfoStore_block5
          (clk,
           reset,
           enb,
           hStartIn,
           Unloading,
           frameEnd,
           lineStartV);


  input   clk;
  input   reset;
  input   enb;
  input   hStartIn;
  input   Unloading;
  input   frameEnd;
  output  [1:0] lineStartV;  // ufix2


  wire zeroConstant;
  wire InputMuxOut;
  reg  reg_switch_delay;  // ufix1
  wire lineStart2;
  reg  reg_switch_delay_1;  // ufix1
  wire lineStart3;


  assign zeroConstant = 1'b0;



  assign InputMuxOut = (Unloading == 1'b0 ? hStartIn :
              zeroConstant);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        reg_switch_delay <= 1'b0;
      end
      else begin
        if (enb) begin
          if (frameEnd == 1'b1) begin
            reg_switch_delay <= 1'b0;
          end
          else begin
            if (hStartIn) begin
              reg_switch_delay <= InputMuxOut;
            end
          end
        end
      end
    end

  assign lineStart2 = (frameEnd == 1'b1 ? 1'b0 :
              reg_switch_delay);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_1_process
      if (reset == 1'b1) begin
        reg_switch_delay_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          if (frameEnd == 1'b1) begin
            reg_switch_delay_1 <= 1'b0;
          end
          else begin
            if (hStartIn) begin
              reg_switch_delay_1 <= lineStart2;
            end
          end
        end
      end
    end

  assign lineStart3 = (frameEnd == 1'b1 ? 1'b0 :
              reg_switch_delay_1);



  assign lineStartV = {lineStart3, lineStart2};



endmodule  // LineInfoStore_block5

