// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\LineInfoStore_block6.v
// Created: 2020-07-09 10:41:45
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: LineInfoStore_block6
// Source Path: LLE/LLEHDL/IterativeFilter/Image Filter1/LineBuffer/LineInfoStore
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module LineInfoStore_block6
          (clk,
           reset,
           enb,
           hStartIn,
           hEndIn,
           alphavStartIn,
           vEndIn,
           validIn,
           dumpControl,
           preProcess,
           PrePadFlag,
           OnLineFlag,
           PostPadFlag,
           DumpingFlag,
           BlankingFlag,
           hStartOut,
           hEndOut,
           vStartOut,
           vEndOut,
           validOut);


  input   clk;
  input   reset;
  input   enb;
  input   hStartIn;
  input   hEndIn;
  input   alphavStartIn;
  input   vEndIn;
  input   validIn;
  input   dumpControl;
  input   preProcess;
  output  PrePadFlag;
  output  OnLineFlag;
  output  PostPadFlag;
  output  DumpingFlag;
  output  BlankingFlag;
  output  hStartOut;
  output  hEndOut;
  output  vStartOut;
  output  vEndOut;
  output  validOut;


  wire validTemp1;
  wire validTemp2;
  reg  hStartFirstTap;
  reg  hStartFinalTap;
  reg  hEndFirstTap;
  reg  hEndCentreTap;
  reg  [0:1] intdelay_reg;  // ufix1 [2]
  wire [0:1] intdelay_reg_next;  // ufix1 [2]
  wire hEndFinalTap;
  reg  [0:1] intdelay_reg_1;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_1;  // ufix1 [2]
  reg  [0:1] intdelay_reg_2;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_2;  // ufix1 [2]
  reg  [0:1] intdelay_reg_3;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_3;  // ufix1 [2]
  wire validTap;
  wire validGate1;
  wire notPreProcess;
  wire validGate2;
  wire validGate3;
  wire validGate4;


  assign validTemp1 = validIn | dumpControl;



  assign validTemp2 = hEndIn | validTemp1;



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        hStartFirstTap <= 1'b0;
      end
      else begin
        if (enb && validTemp2) begin
          hStartFirstTap <= hStartIn;
        end
      end
    end



  assign PrePadFlag = hStartFirstTap;

  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        hStartFinalTap <= 1'b0;
      end
      else begin
        if (enb && validTemp2) begin
          hStartFinalTap <= hStartFirstTap;
        end
      end
    end



  assign OnLineFlag = hStartFinalTap;

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_1_process
      if (reset == 1'b1) begin
        hEndFirstTap <= 1'b0;
      end
      else begin
        if (enb && validTemp2) begin
          hEndFirstTap <= hEndIn;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : alphaSignal_CtxName_LLE_RefNum_s18_UserName_validTemp2_RTTIClass_class_pir_Signal_Network_n65_process
      if (reset == 1'b1) begin
        hEndCentreTap <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndCentreTap <= hEndFirstTap;
        end
      end
    end



  assign PostPadFlag = hEndCentreTap;

  assign DumpingFlag = hEndFirstTap;

  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        intdelay_reg[0] <= 1'b0;
        intdelay_reg[1] <= 1'b0;
      end
      else begin
        if (enb && validTemp2) begin
          intdelay_reg[0] <= intdelay_reg_next[0];
          intdelay_reg[1] <= intdelay_reg_next[1];
        end
      end
    end

  assign hEndFinalTap = intdelay_reg[1];
  assign intdelay_reg_next[0] = hEndCentreTap;
  assign intdelay_reg_next[1] = intdelay_reg[0];



  assign BlankingFlag = hEndFinalTap;

  assign hStartOut = hStartFinalTap;

  assign hEndOut = hEndCentreTap;

  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        intdelay_reg_1[0] <= 1'b0;
        intdelay_reg_1[1] <= 1'b0;
      end
      else begin
        if (enb && validTemp2) begin
          intdelay_reg_1[0] <= intdelay_reg_next_1[0];
          intdelay_reg_1[1] <= intdelay_reg_next_1[1];
        end
      end
    end

  assign vStartOut = intdelay_reg_1[1];
  assign intdelay_reg_next_1[0] = alphavStartIn;
  assign intdelay_reg_next_1[1] = intdelay_reg_1[0];



  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        intdelay_reg_2[0] <= 1'b0;
        intdelay_reg_2[1] <= 1'b0;
      end
      else begin
        if (enb && validTemp2) begin
          intdelay_reg_2[0] <= intdelay_reg_next_2[0];
          intdelay_reg_2[1] <= intdelay_reg_next_2[1];
        end
      end
    end

  assign vEndOut = intdelay_reg_2[1];
  assign intdelay_reg_next_2[0] = vEndIn;
  assign intdelay_reg_next_2[1] = intdelay_reg_2[0];



  always @(posedge clk or posedge reset)
    begin : intdelay_4_process
      if (reset == 1'b1) begin
        intdelay_reg_3[0] <= 1'b0;
        intdelay_reg_3[1] <= 1'b0;
      end
      else begin
        if (enb && validTemp2) begin
          intdelay_reg_3[0] <= intdelay_reg_next_3[0];
          intdelay_reg_3[1] <= intdelay_reg_next_3[1];
        end
      end
    end

  assign validTap = intdelay_reg_3[1];
  assign intdelay_reg_next_3[0] = validIn;
  assign intdelay_reg_next_3[1] = intdelay_reg_3[0];



  assign validGate1 = hStartFirstTap & validTap;



  assign notPreProcess =  ~ preProcess;



  assign validGate2 = validTap & notPreProcess;



  assign validGate3 = validGate1 | validGate2;



  assign validGate4 = hStartFinalTap | validGate3;



  assign validOut = validGate4;

endmodule  // LineInfoStore_block6

