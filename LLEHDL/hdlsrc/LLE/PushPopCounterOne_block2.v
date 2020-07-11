// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\PushPopCounterOne_block2.v
// Created: 2020-07-09 10:41:45
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: PushPopCounterOne_block2
// Source Path: LLE/LLEHDL/IterativeFilter/Image Filter1/LineBuffer/DATA_MEMORY/PushPopCounterOne
// Hierarchy Level: 5
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module PushPopCounterOne_block2
          (clk,
           reset,
           enb,
           hStartIn,
           popIn,
           popEnable,
           hEndIn,
           wrAddr,
           pushOut,
           rdAddr,
           popOut,
           EndofLine);


  input   clk;
  input   reset;
  input   enb;
  input   hStartIn;
  input   popIn;
  input   popEnable;
  input   hEndIn;
  output  [10:0] wrAddr;  // ufix11
  output  pushOut;
  output  [10:0] rdAddr;  // ufix11
  output  popOut;
  output  EndofLine;


  reg [10:0] writeCount;  // ufix11
  reg  writeStoreEn;
  reg [10:0] writeCountNext;  // ufix11
  reg [10:0] writeCountCurrent;  // ufix11
  wire InBetweenEn;
  wire ConstantZero;
  wire InBetweenRegIn;
  reg  InBetween;
  wire readCountCompare;
  wire popTerm2;
  reg [10:0] readCount;  // ufix11
  wire relop_relop1;
  wire popTerm1;
  wire popCounter;
  wire [10:0] constantTwo;  // ufix11
  wire [10:0] readCountAhead;  // ufix11
  wire relop_relop1_1;


  // Free running, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  always @(posedge clk or posedge reset)
    begin : Write_Count_process
      if (reset == 1'b1) begin
        writeCount <= 11'b00000000000;
      end
      else begin
        if (enb) begin
          if (hStartIn == 1'b1) begin
            writeCount <= 11'b00000000000;
          end
          else if (popIn == 1'b1) begin
            writeCount <= writeCount + 11'b00000000001;
          end
        end
      end
    end



  assign wrAddr = writeCount;

  assign pushOut = popIn;

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        writeStoreEn <= 1'b0;
      end
      else begin
        if (enb) begin
          writeStoreEn <= hEndIn;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_1_process
      if (reset == 1'b1) begin
        writeCountNext <= 11'b00000000000;
      end
      else begin
        if (enb && writeStoreEn) begin
          writeCountNext <= writeCount;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_2_process
      if (reset == 1'b1) begin
        writeCountCurrent <= 11'b00000000000;
      end
      else begin
        if (enb && hStartIn) begin
          writeCountCurrent <= writeCountNext;
        end
      end
    end



  assign InBetweenEn = hStartIn | hEndIn;



  assign ConstantZero = 1'b0;



  assign InBetweenRegIn = (hStartIn == 1'b0 ? hEndIn :
              ConstantZero);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_3_process
      if (reset == 1'b1) begin
        InBetween <= 1'b0;
      end
      else begin
        if (enb && InBetweenEn) begin
          InBetween <= InBetweenRegIn;
        end
      end
    end



  assign popTerm2 = readCountCompare & InBetween;



  assign relop_relop1 = readCount <= writeCountCurrent;



  assign readCountCompare = popEnable & relop_relop1;



  assign popTerm1 = popIn & readCountCompare;



  assign popCounter = popTerm1 | popTerm2;



  // Free running, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  always @(posedge clk or posedge reset)
    begin : Read_Count_process
      if (reset == 1'b1) begin
        readCount <= 11'b00000000000;
      end
      else begin
        if (enb) begin
          if (hStartIn == 1'b1) begin
            readCount <= 11'b00000000000;
          end
          else if (popCounter == 1'b1) begin
            readCount <= readCount + 11'b00000000001;
          end
        end
      end
    end



  assign rdAddr = readCount;

  assign popOut = popCounter;

  assign constantTwo = 11'b00000000100;



  assign readCountAhead = readCount + constantTwo;



  assign relop_relop1_1 = readCountAhead == writeCountCurrent;



  assign EndofLine = relop_relop1_1;

endmodule  // PushPopCounterOne_block2

