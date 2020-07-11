// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\DATA_MEMORY_block2.v
// Created: 2020-07-09 10:41:45
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: DATA_MEMORY_block2
// Source Path: LLE/LLEHDL/IterativeFilter/Image Filter1/LineBuffer/DATA_MEMORY
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module DATA_MEMORY_block2
          (clk,
           reset,
           enb,
           Unloading,
           pixelIn,
           hStartIn,
           hEndIn,
           vStartIn,
           vEndIn,
           validIn,
           popEn,
           dataVectorOut_0,
           dataVectorOut_1,
           dataVectorOut_2,
           popOut,
           AllAtEnd);


  input   clk;
  input   reset;
  input   enb;
  input   Unloading;
  input   [11:0] pixelIn;  // ufix12_En4
  input   hStartIn;
  input   hEndIn;
  input   vStartIn;
  input   vEndIn;
  input   validIn;
  input   [1:0] popEn;  // ufix2
  output  [11:0] dataVectorOut_0;  // ufix12_En4
  output  [11:0] dataVectorOut_1;  // ufix12_En4
  output  [11:0] dataVectorOut_2;  // ufix12_En4
  output  popOut;
  output  AllAtEnd;


  reg [11:0] intdelay_reg [0:2];  // ufix12 [3]
  wire [11:0] intdelay_reg_next [0:2];  // ufix12_En4 [3]
  wire [11:0] pixelColumn_0;  // ufix12_En4
  reg [11:0] pixelColumnO1;  // ufix12_En4
  reg  validREG;
  reg  unloadPop;
  reg  hEndREG;
  reg  hEndREGT;
  wire unloadPopT;
  wire validPop;
  wire PopEnSL;
  wire [10:0] writeAddr1;  // ufix11
  wire pushFIFO2;
  wire [10:0] readAddr2;  // ufix11
  wire popFIFO_2;
  wire EndofLine1;
  wire [11:0] pixelColumn1;  // ufix12_En4
  wire PopEnSL_1;
  wire [10:0] writeAddr2;  // ufix11
  wire pushFIFO3;
  wire [10:0] readAddr3;  // ufix11
  wire popFIFO_3;
  wire EndofLine2;
  reg [10:0] writeAddrREG2;  // ufix11
  reg  pushOutREG2;
  wire [11:0] pixelColumn2;  // ufix12_En4
  reg  popOut_1;


  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        intdelay_reg[0] <= 12'b000000000000;
        intdelay_reg[1] <= 12'b000000000000;
        intdelay_reg[2] <= 12'b000000000000;
      end
      else begin
        if (enb) begin
          intdelay_reg[0] <= intdelay_reg_next[0];
          intdelay_reg[1] <= intdelay_reg_next[1];
          intdelay_reg[2] <= intdelay_reg_next[2];
        end
      end
    end

  assign pixelColumn_0 = intdelay_reg[2];
  assign intdelay_reg_next[0] = pixelIn;
  assign intdelay_reg_next[1] = intdelay_reg[0];
  assign intdelay_reg_next[2] = intdelay_reg[1];



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        pixelColumnO1 <= 12'b000000000000;
      end
      else begin
        if (enb) begin
          pixelColumnO1 <= pixelColumn_0;
        end
      end
    end



  assign dataVectorOut_0 = pixelColumnO1;

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_1_process
      if (reset == 1'b1) begin
        validREG <= 1'b0;
      end
      else begin
        if (enb) begin
          validREG <= validIn;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_2_process
      if (reset == 1'b1) begin
        unloadPop <= 1'b0;
      end
      else begin
        if (enb) begin
          unloadPop <= validREG;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_3_process
      if (reset == 1'b1) begin
        hEndREG <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndREG <= hEndIn;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_4_process
      if (reset == 1'b1) begin
        hEndREGT <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndREGT <= hEndREG;
        end
      end
    end



  assign unloadPopT = hEndREGT & (unloadPop & Unloading);



  assign validPop = validREG | unloadPopT;



  assign PopEnSL = popEn[0];



  PushPopCounterOne_block2 u_PushPopCounterOne (.clk(clk),
                                                .reset(reset),
                                                .enb(enb),
                                                .hStartIn(hStartIn),
                                                .popIn(validPop),
                                                .popEnable(PopEnSL),
                                                .hEndIn(hEndREG),
                                                .wrAddr(writeAddr1),  // ufix11
                                                .pushOut(pushFIFO2),
                                                .rdAddr(readAddr2),  // ufix11
                                                .popOut(popFIFO_2),
                                                .EndofLine(EndofLine1)
                                                );

  SimpleDualPortRAM_generic #(.AddrWidth(11),
                              .DataWidth(12)
                              )
                            u_SimpleDualPortRAM_Generic1 (.clk(clk),
                                                          .enb(enb),
                                                          .wr_din(pixelColumn_0),
                                                          .wr_addr(writeAddr1),
                                                          .wr_en(pushFIFO2),
                                                          .rd_addr(readAddr2),
                                                          .rd_dout(pixelColumn1)
                                                          );

  assign dataVectorOut_1 = pixelColumn1;

  assign PopEnSL_1 = popEn[0];



  PushPopCounter_block2 u_PushPopCounter2 (.clk(clk),
                                           .reset(reset),
                                           .enb(enb),
                                           .hStartIn(hStartIn),
                                           .popIn(validPop),
                                           .popEnable(PopEnSL_1),
                                           .hEndIn(hEndREG),
                                           .writeCountPrev(writeAddr1),  // ufix11
                                           .wrAddr(writeAddr2),  // ufix11
                                           .pushOut(pushFIFO3),
                                           .rdAddr(readAddr3),  // ufix11
                                           .popOut(popFIFO_3),
                                           .EndofLine(EndofLine2)
                                           );

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_5_process
      if (reset == 1'b1) begin
        writeAddrREG2 <= 11'b00000000000;
      end
      else begin
        if (enb) begin
          writeAddrREG2 <= writeAddr2;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_6_process
      if (reset == 1'b1) begin
        pushOutREG2 <= 1'b0;
      end
      else begin
        if (enb) begin
          pushOutREG2 <= pushFIFO3;
        end
      end
    end



  SimpleDualPortRAM_generic #(.AddrWidth(11),
                              .DataWidth(12)
                              )
                            u_SimpleDualPortRAM_Generic2 (.clk(clk),
                                                          .enb(enb),
                                                          .wr_din(pixelColumn1),
                                                          .wr_addr(writeAddrREG2),
                                                          .wr_en(pushOutREG2),
                                                          .rd_addr(readAddr3),
                                                          .rd_dout(pixelColumn2)
                                                          );

  assign dataVectorOut_2 = pixelColumn2;

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_7_process
      if (reset == 1'b1) begin
        popOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          popOut_1 <= popFIFO_2;
        end
      end
    end



  assign AllAtEnd = EndofLine1 & EndofLine2;



  assign popOut = popOut_1;

endmodule  // DATA_MEMORY_block2

