// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\LineBuffer_block.v
// Created: 2020-07-09 10:41:45
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: LineBuffer_block
// Source Path: LLE/LLEHDL/IterativeFilter/Image Filter3/LineBuffer
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module LineBuffer_block
          (clk,
           reset,
           enb,
           dataIn,
           hStartIn,
           hEndIn,
           vStartIn,
           vEndIn,
           validIn,
           dataOut_0,
           dataOut_1,
           dataOut_2,
           hStartOut,
           hEndOut,
           vStartOut,
           vEndOut,
           validOut,
           processDataOut);


  input   clk;
  input   reset;
  input   enb;
  input   [19:0] dataIn;  // ufix20_En12
  input   hStartIn;
  input   hEndIn;
  input   vStartIn;
  input   vEndIn;
  input   validIn;
  output  [19:0] dataOut_0;  // ufix20_En12
  output  [19:0] dataOut_1;  // ufix20_En12
  output  [19:0] dataOut_2;  // ufix20_En12
  output  hStartOut;
  output  hEndOut;
  output  vStartOut;
  output  vEndOut;
  output  validOut;
  output  processDataOut;


  reg  [0:2] intdelay_reg;  // ufix1 [3]
  wire [0:2] intdelay_reg_next;  // ufix1 [3]
  wire hStartInD;
  reg  [0:2] intdelay_reg_1;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_1;  // ufix1 [3]
  wire hEndInD;
  reg  [0:2] intdelay_reg_2;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_2;  // ufix1 [3]
  wire vStartInD;
  reg  [0:2] intdelay_reg_3;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_3;  // ufix1 [3]
  wire vEndInD;
  reg  [0:2] intdelay_reg_4;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_4;  // ufix1 [3]
  wire vEndInD_1;
  wire hStartV;
  wire hEndV;
  wire vStartV;
  wire vEndV;
  wire validInV;
  wire InBetween;
  reg  hStartVREG;
  reg  hEndV_1;
  reg  vStartV_1;
  reg  [0:1] intdelay_reg_5;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_5;  // ufix1 [2]
  wire vEndREG;
  reg  validInV_1;
  reg  InBetweenREG;
  wire [15:0] LineAverage;  // ufix16
  wire [15:0] ConstOne;  // ufix16
  wire [15:0] LineAveragePlus;  // ufix16
  reg [15:0] LineAverageREG;  // ufix16
  reg [19:0] intdelay_reg_6 [0:3];  // ufix20 [4]
  wire [19:0] intdelay_reg_next_6 [0:3];  // ufix20_En12 [4]
  wire [19:0] dataInREG;  // ufix20_En12
  wire [1:0] BooleanZero;  // ufix2
  wire hStartR;
  wire blankCountEn;
  reg [15:0] BlankingCount;  // ufix16
  wire unloading;
  wire [1:0] LineStartV;  // ufix2
  wire [1:0] popEn;  // ufix2
  wire validR;
  reg  validRREG;
  wire vStartR;
  reg  vStartDRC;
  wire hEndR;
  reg  hEndRREG;
  reg  hStartDRC;
  reg  vEndRREG;
  wire [19:0] DataMemVector_0;  // ufix20_En12
  wire [19:0] DataMemVector_1;  // ufix20_En12
  wire [19:0] DataMemVector_2;  // ufix20_En12
  wire popReg;
  wire AllEndOfLine;
  reg  AllEndOfLineREG;
  wire vEndR;
  wire EndOrStart;
  wire outputData;
  wire Running;
  reg  outputDataREG;
  wire [19:0] constZero [0:2];  // ufix20_En12 [3]
  wire runOrUnload;
  reg  [0:1] intdelay_reg_7;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_7;  // ufix1 [2]
  wire hEndRDT;
  wire dumpControl;
  wire preProcess;
  wire PrePadFlag;
  wire OnLineFlag;
  wire PostPadFlag;
  wire DumpingFlag;
  wire BlankingFlag;
  wire hStartOutFG;
  wire hEndOutFG;
  wire vStartOutFG;
  wire vEndOutFG;
  wire validOutFG;
  wire processDataPC;
  wire countResetHC;
  wire countEnHC;
  wire processDataGated;
  wire dumpOrControl;
  wire processDataGatedD;
  wire processDataGatedRU;
  reg  [0:1] intdelay_reg_8;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_8;  // ufix1 [2]
  wire processDataP;
  wire outputProcess;
  wire padShift;
  wire [19:0] DataMemVector [0:2];  // ufix20_En12 [3]
  reg [19:0] intdelay_reg_9 [0:2];  // ufix20 [3]
  wire [19:0] intdelay_reg_next_9 [0:2];  // ufix20_En12 [3]
  wire [19:0] DataMemVectorREG [0:2];  // ufix20_En12 [3]
  wire countEnHC_1;
  reg [10:0] horPadCount;  // ufix11
  reg [10:0] horPadCountREG;  // ufix11
  wire [19:0] DataMemVectorPadded_0;  // ufix20_En12
  wire [19:0] DataMemVectorPadded_1;  // ufix20_En12
  wire [19:0] DataMemVectorPadded_2;  // ufix20_En12
  wire [10:0] VerCountOut;  // ufix11
  wire [19:0] verPadOut_0;  // ufix20_En12
  wire [19:0] verPadOut_1;  // ufix20_En12
  wire [19:0] verPadOut_2;  // ufix20_En12
  wire [19:0] verPadOut [0:2];  // ufix20_En12 [3]
  reg [19:0] reg_reg [0:2];  // ufix20 [3]
  wire [19:0] reg_reg_next [0:2];  // ufix20_En12 [3]
  wire [19:0] verPadD [0:2];  // ufix20_En12 [3]
  wire [19:0] dataSigOut [0:2];  // ufix20_En12 [3]
  reg [19:0] reg_reg_1 [0:2];  // ufix20 [3]
  wire [19:0] reg_reg_next_1 [0:2];  // ufix20_En12 [3]
  wire [19:0] dataSigPreOD [0:2];  // ufix20_En12 [3]
  wire [19:0] dataOut [0:2];  // ufix20_En12 [3]
  wire ctrlOutZero;
  reg  [0:1] intdelay_reg_10;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_10;  // ufix1 [2]
  wire hStartRDP;
  reg  hStartRD;
  wire hStartP;
  reg  hStartOut_1;
  reg  reg_switch_delay;  // ufix1
  wire hEndGate;
  wire hEndGateN;
  wire hEndFGG;
  reg  [0:2] intdelay_reg_11;  // ufix1 [3]
  wire [0:2] intdelay_reg_next_11;  // ufix1 [3]
  wire hEndRD;
  wire hEndP;
  reg  hEndOut_1;
  reg  reg_switch_delay_1;  // ufix1
  wire frameStarted;
  wire frameStartedN;
  wire vStartGate;
  wire vStartP;
  reg  vStartOut_1;
  reg  [0:3] intdelay_reg_12;  // ufix1 [4]
  wire [0:3] intdelay_reg_next_12;  // ufix1 [4]
  wire vEndRD;
  wire vEndRDH;
  wire vEndP;
  reg  vEndOut_1;
  wire validFGG;
  reg  [0:1] intdelay_reg_13;  // ufix1 [2]
  wire [0:1] intdelay_reg_next_13;  // ufix1 [2]
  wire validRPre;
  reg  validRD;
  wire validRDEnd;
  wire validP;
  reg  validOD;
  reg  processDataOD;


  always @(posedge clk or posedge reset)
    begin : intdelay_process
      if (reset == 1'b1) begin
        intdelay_reg[0] <= 1'b0;
        intdelay_reg[1] <= 1'b0;
        intdelay_reg[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg[0] <= intdelay_reg_next[0];
          intdelay_reg[1] <= intdelay_reg_next[1];
          intdelay_reg[2] <= intdelay_reg_next[2];
        end
      end
    end

  assign hStartInD = intdelay_reg[2];
  assign intdelay_reg_next[0] = hStartIn;
  assign intdelay_reg_next[1] = intdelay_reg[0];
  assign intdelay_reg_next[2] = intdelay_reg[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_1_process
      if (reset == 1'b1) begin
        intdelay_reg_1[0] <= 1'b0;
        intdelay_reg_1[1] <= 1'b0;
        intdelay_reg_1[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_1[0] <= intdelay_reg_next_1[0];
          intdelay_reg_1[1] <= intdelay_reg_next_1[1];
          intdelay_reg_1[2] <= intdelay_reg_next_1[2];
        end
      end
    end

  assign hEndInD = intdelay_reg_1[2];
  assign intdelay_reg_next_1[0] = hEndIn;
  assign intdelay_reg_next_1[1] = intdelay_reg_1[0];
  assign intdelay_reg_next_1[2] = intdelay_reg_1[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_2_process
      if (reset == 1'b1) begin
        intdelay_reg_2[0] <= 1'b0;
        intdelay_reg_2[1] <= 1'b0;
        intdelay_reg_2[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_2[0] <= intdelay_reg_next_2[0];
          intdelay_reg_2[1] <= intdelay_reg_next_2[1];
          intdelay_reg_2[2] <= intdelay_reg_next_2[2];
        end
      end
    end

  assign vStartInD = intdelay_reg_2[2];
  assign intdelay_reg_next_2[0] = vStartIn;
  assign intdelay_reg_next_2[1] = intdelay_reg_2[0];
  assign intdelay_reg_next_2[2] = intdelay_reg_2[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_3_process
      if (reset == 1'b1) begin
        intdelay_reg_3[0] <= 1'b0;
        intdelay_reg_3[1] <= 1'b0;
        intdelay_reg_3[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_3[0] <= intdelay_reg_next_3[0];
          intdelay_reg_3[1] <= intdelay_reg_next_3[1];
          intdelay_reg_3[2] <= intdelay_reg_next_3[2];
        end
      end
    end

  assign vEndInD = intdelay_reg_3[2];
  assign intdelay_reg_next_3[0] = vEndIn;
  assign intdelay_reg_next_3[1] = intdelay_reg_3[0];
  assign intdelay_reg_next_3[2] = intdelay_reg_3[1];



  always @(posedge clk or posedge reset)
    begin : intdelay_4_process
      if (reset == 1'b1) begin
        intdelay_reg_4[0] <= 1'b0;
        intdelay_reg_4[1] <= 1'b0;
        intdelay_reg_4[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_4[0] <= intdelay_reg_next_4[0];
          intdelay_reg_4[1] <= intdelay_reg_next_4[1];
          intdelay_reg_4[2] <= intdelay_reg_next_4[2];
        end
      end
    end

  assign vEndInD_1 = intdelay_reg_4[2];
  assign intdelay_reg_next_4[0] = validIn;
  assign intdelay_reg_next_4[1] = intdelay_reg_4[0];
  assign intdelay_reg_next_4[2] = intdelay_reg_4[1];



  InputControlValidation_block u_INPUT_CONTROL_VALIDATION (.clk(clk),
                                                           .reset(reset),
                                                           .enb(enb),
                                                           .hStartIn(hStartInD),
                                                           .hEndIn(hEndInD),
                                                           .vStartIn(vStartInD),
                                                           .vEndIn(vEndInD),
                                                           .validIn(vEndInD_1),
                                                           .hStartOut(hStartV),
                                                           .hEndOut(hEndV),
                                                           .vStartOut(vStartV),
                                                           .vEndOut(vEndV),
                                                           .validOut(validInV),
                                                           .InBetweenOut(InBetween)
                                                           );

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        hStartVREG <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartVREG <= hStartV;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_1_process
      if (reset == 1'b1) begin
        hEndV_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndV_1 <= hEndV;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_2_process
      if (reset == 1'b1) begin
        vStartV_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          vStartV_1 <= vStartV;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_5_process
      if (reset == 1'b1) begin
        intdelay_reg_5[0] <= 1'b0;
        intdelay_reg_5[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_5[0] <= intdelay_reg_next_5[0];
          intdelay_reg_5[1] <= intdelay_reg_next_5[1];
        end
      end
    end

  assign vEndREG = intdelay_reg_5[1];
  assign intdelay_reg_next_5[0] = vEndV;
  assign intdelay_reg_next_5[1] = intdelay_reg_5[0];



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_3_process
      if (reset == 1'b1) begin
        validInV_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          validInV_1 <= validInV;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_4_process
      if (reset == 1'b1) begin
        InBetweenREG <= 1'b0;
      end
      else begin
        if (enb) begin
          InBetweenREG <= InBetween;
        end
      end
    end



  LineSpaceAverager_block u_LineSpaceAverager (.clk(clk),
                                               .reset(reset),
                                               .enb(enb),
                                               .InBetween(InBetweenREG),
                                               .InLine(hStartVREG),
                                               .LineSpaceAverage(LineAverage)  // ufix16
                                               );

  assign ConstOne = 16'b0000000000000001;



  assign LineAveragePlus = LineAverage + ConstOne;



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_5_process
      if (reset == 1'b1) begin
        LineAverageREG <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          LineAverageREG <= LineAveragePlus;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_6_process
      if (reset == 1'b1) begin
        intdelay_reg_6[0] <= 20'b00000000000000000000;
        intdelay_reg_6[1] <= 20'b00000000000000000000;
        intdelay_reg_6[2] <= 20'b00000000000000000000;
        intdelay_reg_6[3] <= 20'b00000000000000000000;
      end
      else begin
        if (enb) begin
          intdelay_reg_6[0] <= intdelay_reg_next_6[0];
          intdelay_reg_6[1] <= intdelay_reg_next_6[1];
          intdelay_reg_6[2] <= intdelay_reg_next_6[2];
          intdelay_reg_6[3] <= intdelay_reg_next_6[3];
        end
      end
    end

  assign dataInREG = intdelay_reg_6[3];
  assign intdelay_reg_next_6[0] = dataIn;
  assign intdelay_reg_next_6[1] = intdelay_reg_6[0];
  assign intdelay_reg_next_6[2] = intdelay_reg_6[1];
  assign intdelay_reg_next_6[3] = intdelay_reg_6[2];



  assign BooleanZero = 2'b11;



  // Free running, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  always @(posedge clk or posedge reset)
    begin : Blank_Count_process
      if (reset == 1'b1) begin
        BlankingCount <= 16'b0000000000000000;
      end
      else begin
        if (enb) begin
          if (hStartR == 1'b1) begin
            BlankingCount <= 16'b0000000000000000;
          end
          else if (blankCountEn == 1'b1) begin
            BlankingCount <= BlankingCount + 16'b0000000000000001;
          end
        end
      end
    end



  assign popEn = (unloading == 1'b0 ? LineStartV :
              BooleanZero);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_6_process
      if (reset == 1'b1) begin
        validRREG <= 1'b0;
      end
      else begin
        if (enb) begin
          validRREG <= validR;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_7_process
      if (reset == 1'b1) begin
        vStartDRC <= 1'b0;
      end
      else begin
        if (enb) begin
          vStartDRC <= vStartR;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_8_process
      if (reset == 1'b1) begin
        hEndRREG <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndRREG <= hEndR;
        end
      end
    end



  DATA_MEMORY_block u_DATA_MEMORY (.clk(clk),
                                   .reset(reset),
                                   .enb(enb),
                                   .Unloading(unloading),
                                   .pixelIn(dataInREG),  // ufix20_En12
                                   .hStartIn(hStartDRC),
                                   .hEndIn(hEndRREG),
                                   .vStartIn(vStartDRC),
                                   .vEndIn(vEndRREG),
                                   .validIn(validRREG),
                                   .popEn(popEn),  // ufix2
                                   .dataVectorOut_0(DataMemVector_0),  // ufix20_En12
                                   .dataVectorOut_1(DataMemVector_1),  // ufix20_En12
                                   .dataVectorOut_2(DataMemVector_2),  // ufix20_En12
                                   .popOut(popReg),
                                   .AllAtEnd(AllEndOfLine)
                                   );

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_9_process
      if (reset == 1'b1) begin
        AllEndOfLineREG <= 1'b0;
      end
      else begin
        if (enb) begin
          AllEndOfLineREG <= AllEndOfLine;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_10_process
      if (reset == 1'b1) begin
        vEndRREG <= 1'b0;
      end
      else begin
        if (enb) begin
          vEndRREG <= vEndR;
        end
      end
    end



  assign EndOrStart = vStartIn | vEndRREG;



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_11_process
      if (reset == 1'b1) begin
        hStartDRC <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartDRC <= hStartR;
        end
      end
    end



  LineInfoStore_block1 u_LINE_INFO_STORE (.clk(clk),
                                          .reset(reset),
                                          .enb(enb),
                                          .hStartIn(hStartDRC),
                                          .Unloading(unloading),
                                          .frameEnd(EndOrStart),
                                          .lineStartV(LineStartV)  // ufix2
                                          );

  DataReadController_block u_DATA_READ_CONTROLLER (.clk(clk),
                                                   .reset(reset),
                                                   .enb(enb),
                                                   .hStartIn(hStartVREG),
                                                   .hEndIn(hEndV_1),
                                                   .vStartIn(vStartV_1),
                                                   .vEndIn(vEndREG),
                                                   .validIn(validInV_1),
                                                   .lineStartV(LineStartV),  // ufix2
                                                   .lineAverage(LineAverageREG),  // ufix16
                                                   .AllEndOfLine(AllEndOfLineREG),
                                                   .BlankCount(BlankingCount),  // ufix16
                                                   .frameStart(vStartIn),
                                                   .hStartR(hStartR),
                                                   .hEndR(hEndR),
                                                   .vStartR(vStartR),
                                                   .vEndR(vEndR),
                                                   .validR(validR),
                                                   .outputData(outputData),
                                                   .Unloading(unloading),
                                                   .blankCountEn(blankCountEn),
                                                   .Running(Running)
                                                   );

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_12_process
      if (reset == 1'b1) begin
        outputDataREG <= 1'b0;
      end
      else begin
        if (enb) begin
          outputDataREG <= outputData;
        end
      end
    end



  assign constZero[0] = 20'b00000000000000000000;
  assign constZero[1] = 20'b00000000000000000000;
  assign constZero[2] = 20'b00000000000000000000;



  assign runOrUnload = unloading | Running;



  always @(posedge clk or posedge reset)
    begin : intdelay_7_process
      if (reset == 1'b1) begin
        intdelay_reg_7[0] <= 1'b0;
        intdelay_reg_7[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_7[0] <= intdelay_reg_next_7[0];
          intdelay_reg_7[1] <= intdelay_reg_next_7[1];
        end
      end
    end

  assign hEndRDT = intdelay_reg_7[1];
  assign intdelay_reg_next_7[0] = hEndR;
  assign intdelay_reg_next_7[1] = intdelay_reg_7[0];



  LineInfoStore_block2 u_State_Transition_Flag_Gen (.clk(clk),
                                                    .reset(reset),
                                                    .enb(enb),
                                                    .hStartIn(hStartDRC),
                                                    .hEndIn(hEndRDT),
                                                    .alphavStartIn(vStartDRC),
                                                    .vEndIn(vEndRREG),
                                                    .validIn(validRREG),
                                                    .dumpControl(dumpControl),
                                                    .preProcess(preProcess),
                                                    .PrePadFlag(PrePadFlag),
                                                    .OnLineFlag(OnLineFlag),
                                                    .PostPadFlag(PostPadFlag),
                                                    .DumpingFlag(DumpingFlag),
                                                    .BlankingFlag(BlankingFlag),
                                                    .hStartOut(hStartOutFG),
                                                    .hEndOut(hEndOutFG),
                                                    .vStartOut(vStartOutFG),
                                                    .vEndOut(vEndOutFG),
                                                    .validOut(validOutFG)
                                                    );

  PaddingController_block u_Padding_Controller (.clk(clk),
                                                .reset(reset),
                                                .enb(enb),
                                                .PrePadFlag(PrePadFlag),
                                                .OnLineFlag(OnLineFlag),
                                                .alphaPostPadFlag(PostPadFlag),
                                                .DumpingFlag(DumpingFlag),
                                                .BlankingFlag(BlankingFlag),
                                                .processData(processDataPC),
                                                .countReset(countResetHC),
                                                .countEn(countEnHC),
                                                .dumpControl(dumpControl),
                                                .PrePadding(preProcess)
                                                );

  GateProcessData_block u_Gate_Process_Data (.clk(clk),
                                             .reset(reset),
                                             .enb(enb),
                                             .processDataIn(processDataPC),
                                             .validIn(validRREG),
                                             .dumping(dumpControl),
                                             .outputData(outputData),
                                             .processData(processDataGated),
                                             .dumpOrValid(dumpOrControl)
                                             );

  assign processDataGatedD = processDataGated | DumpingFlag;



  assign processDataGatedRU = runOrUnload & processDataGatedD;



  always @(posedge clk or posedge reset)
    begin : intdelay_8_process
      if (reset == 1'b1) begin
        intdelay_reg_8[0] <= 1'b0;
        intdelay_reg_8[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_8[0] <= intdelay_reg_next_8[0];
          intdelay_reg_8[1] <= intdelay_reg_next_8[1];
        end
      end
    end

  assign processDataP = intdelay_reg_8[1];
  assign intdelay_reg_next_8[0] = processDataGatedRU;
  assign intdelay_reg_next_8[1] = intdelay_reg_8[0];



  assign outputProcess = outputData & processDataP;



  assign padShift = popReg | dumpControl;



  assign DataMemVector[0] = DataMemVector_0;
  assign DataMemVector[1] = DataMemVector_1;
  assign DataMemVector[2] = DataMemVector_2;

  always @(posedge clk or posedge reset)
    begin : intdelay_9_process
      if (reset == 1'b1) begin
        intdelay_reg_9[0] <= 20'b00000000000000000000;
        intdelay_reg_9[1] <= 20'b00000000000000000000;
        intdelay_reg_9[2] <= 20'b00000000000000000000;
      end
      else begin
        if (enb && padShift) begin
          intdelay_reg_9[0] <= intdelay_reg_next_9[0];
          intdelay_reg_9[1] <= intdelay_reg_next_9[1];
          intdelay_reg_9[2] <= intdelay_reg_next_9[2];
        end
      end
    end

  assign DataMemVectorREG[0] = intdelay_reg_9[0];
  assign DataMemVectorREG[1] = intdelay_reg_9[1];
  assign DataMemVectorREG[2] = intdelay_reg_9[2];
  assign intdelay_reg_next_9[0] = DataMemVector[0];
  assign intdelay_reg_next_9[1] = DataMemVector[1];
  assign intdelay_reg_next_9[2] = DataMemVector[2];



  assign countEnHC_1 = dumpOrControl & countEnHC;



  // Free running, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  always @(posedge clk or posedge reset)
    begin : Horizontal_Pad_Counter_process
      if (reset == 1'b1) begin
        horPadCount <= 11'b00000000000;
      end
      else begin
        if (enb) begin
          if (countResetHC == 1'b1) begin
            horPadCount <= 11'b00000000000;
          end
          else if (countEnHC_1 == 1'b1) begin
            horPadCount <= horPadCount + 11'b00000000001;
          end
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_13_process
      if (reset == 1'b1) begin
        horPadCountREG <= 11'b00000000000;
      end
      else begin
        if (enb) begin
          horPadCountREG <= horPadCount;
        end
      end
    end



  Horizontal_Padder_block u_Horizontal_Padder (.clk(clk),
                                               .reset(reset),
                                               .enb(enb),
                                               .dataVectorIn_0(DataMemVectorREG[0]),  // ufix20_En12
                                               .dataVectorIn_1(DataMemVectorREG[1]),  // ufix20_En12
                                               .dataVectorIn_2(DataMemVectorREG[2]),  // ufix20_En12
                                               .horPadCount(horPadCountREG),  // ufix11
                                               .padShift(padShift),
                                               .dataVector_0(DataMemVectorPadded_0),  // ufix20_En12
                                               .dataVector_1(DataMemVectorPadded_1),  // ufix20_En12
                                               .dataVector_2(DataMemVectorPadded_2)  // ufix20_En12
                                               );

  Vertical_Padding_Counter_block u_Vertical_Counter (.clk(clk),
                                                     .reset(reset),
                                                     .enb(enb),
                                                     .frameEnd(vStartIn),
                                                     .unloading(unloading),
                                                     .running(Running),
                                                     .lineStart(hStartR),
                                                     .VCount(VerCountOut)  // ufix11
                                                     );

  Vertical_Padder_block u_Vertical_Padder (.dataVectorIn_0(DataMemVectorPadded_0),  // ufix20_En12
                                           .dataVectorIn_1(DataMemVectorPadded_1),  // ufix20_En12
                                           .dataVectorIn_2(DataMemVectorPadded_2),  // ufix20_En12
                                           .verPadCount(VerCountOut),  // ufix11
                                           .dataVectorOut_0(verPadOut_0),  // ufix20_En12
                                           .dataVectorOut_1(verPadOut_1),  // ufix20_En12
                                           .dataVectorOut_2(verPadOut_2)  // ufix20_En12
                                           );

  assign verPadOut[0] = verPadOut_0;
  assign verPadOut[1] = verPadOut_1;
  assign verPadOut[2] = verPadOut_2;

  always @(posedge clk or posedge reset)
    begin : reg_rsvd_14_process
      if (reset == 1'b1) begin
        reg_reg[0] <= 20'b00000000000000000000;
        reg_reg[1] <= 20'b00000000000000000000;
        reg_reg[2] <= 20'b00000000000000000000;
      end
      else begin
        if (enb) begin
          reg_reg[0] <= reg_reg_next[0];
          reg_reg[1] <= reg_reg_next[1];
          reg_reg[2] <= reg_reg_next[2];
        end
      end
    end

  assign verPadD[0] = reg_reg[0];
  assign verPadD[1] = reg_reg[1];
  assign verPadD[2] = reg_reg[2];
  assign reg_reg_next[0] = verPadOut[0];
  assign reg_reg_next[1] = verPadOut[1];
  assign reg_reg_next[2] = verPadOut[2];



  assign dataSigOut[0] = (outputProcess == 1'b0 ? constZero[0] :
              verPadD[0]);
  assign dataSigOut[1] = (outputProcess == 1'b0 ? constZero[1] :
              verPadD[1]);
  assign dataSigOut[2] = (outputProcess == 1'b0 ? constZero[2] :
              verPadD[2]);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_15_process
      if (reset == 1'b1) begin
        reg_reg_1[0] <= 20'b00000000000000000000;
        reg_reg_1[1] <= 20'b00000000000000000000;
        reg_reg_1[2] <= 20'b00000000000000000000;
      end
      else begin
        if (enb) begin
          reg_reg_1[0] <= reg_reg_next_1[0];
          reg_reg_1[1] <= reg_reg_next_1[1];
          reg_reg_1[2] <= reg_reg_next_1[2];
        end
      end
    end

  assign dataSigPreOD[0] = reg_reg_1[0];
  assign dataSigPreOD[1] = reg_reg_1[1];
  assign dataSigPreOD[2] = reg_reg_1[2];
  assign reg_reg_next_1[0] = dataSigOut[0];
  assign reg_reg_next_1[1] = dataSigOut[1];
  assign reg_reg_next_1[2] = dataSigOut[2];



  assign dataOut[0] = (outputDataREG == 1'b0 ? constZero[0] :
              dataSigPreOD[0]);
  assign dataOut[1] = (outputDataREG == 1'b0 ? constZero[1] :
              dataSigPreOD[1]);
  assign dataOut[2] = (outputDataREG == 1'b0 ? constZero[2] :
              dataSigPreOD[2]);



  assign dataOut_0 = dataOut[0];

  assign dataOut_1 = dataOut[1];

  assign dataOut_2 = dataOut[2];

  assign ctrlOutZero = 1'b0;



  always @(posedge clk or posedge reset)
    begin : intdelay_10_process
      if (reset == 1'b1) begin
        intdelay_reg_10[0] <= 1'b0;
        intdelay_reg_10[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_10[0] <= intdelay_reg_next_10[0];
          intdelay_reg_10[1] <= intdelay_reg_next_10[1];
        end
      end
    end

  assign hStartRDP = intdelay_reg_10[1];
  assign intdelay_reg_next_10[0] = hStartOutFG;
  assign intdelay_reg_next_10[1] = intdelay_reg_10[0];



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_16_process
      if (reset == 1'b1) begin
        hStartRD <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartRD <= hStartRDP;
        end
      end
    end



  assign hStartP = (outputProcess == 1'b0 ? ctrlOutZero :
              hStartRD);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_17_process
      if (reset == 1'b1) begin
        hStartOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartOut_1 <= hStartP;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_18_process
      if (reset == 1'b1) begin
        reg_switch_delay <= 1'b0;
      end
      else begin
        if (enb) begin
          if (hStartOutFG == 1'b1) begin
            reg_switch_delay <= 1'b0;
          end
          else begin
            if (hEndOutFG) begin
              reg_switch_delay <= hEndOutFG;
            end
          end
        end
      end
    end

  assign hEndGate = (hStartOutFG == 1'b1 ? 1'b0 :
              reg_switch_delay);



  assign hEndGateN =  ~ hEndGate;



  assign hEndFGG = hEndOutFG & hEndGateN;



  always @(posedge clk or posedge reset)
    begin : intdelay_11_process
      if (reset == 1'b1) begin
        intdelay_reg_11[0] <= 1'b0;
        intdelay_reg_11[1] <= 1'b0;
        intdelay_reg_11[2] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_11[0] <= intdelay_reg_next_11[0];
          intdelay_reg_11[1] <= intdelay_reg_next_11[1];
          intdelay_reg_11[2] <= intdelay_reg_next_11[2];
        end
      end
    end

  assign hEndRD = intdelay_reg_11[2];
  assign intdelay_reg_next_11[0] = hEndFGG;
  assign intdelay_reg_next_11[1] = intdelay_reg_11[0];
  assign intdelay_reg_next_11[2] = intdelay_reg_11[1];



  assign hEndP = (outputProcess == 1'b0 ? ctrlOutZero :
              hEndRD);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_19_process
      if (reset == 1'b1) begin
        hEndOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndOut_1 <= hEndP;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_20_process
      if (reset == 1'b1) begin
        reg_switch_delay_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          if (vStartIn == 1'b1) begin
            reg_switch_delay_1 <= 1'b0;
          end
          else begin
            if (hStartP) begin
              reg_switch_delay_1 <= hStartP;
            end
          end
        end
      end
    end

  assign frameStarted = (vStartIn == 1'b1 ? 1'b0 :
              reg_switch_delay_1);



  assign frameStartedN =  ~ frameStarted;



  assign vStartGate = hStartP & frameStartedN;



  assign vStartP = (outputProcess == 1'b0 ? ctrlOutZero :
              vStartGate);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_21_process
      if (reset == 1'b1) begin
        vStartOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          vStartOut_1 <= vStartP;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : intdelay_12_process
      if (reset == 1'b1) begin
        intdelay_reg_12[0] <= 1'b0;
        intdelay_reg_12[1] <= 1'b0;
        intdelay_reg_12[2] <= 1'b0;
        intdelay_reg_12[3] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_12[0] <= intdelay_reg_next_12[0];
          intdelay_reg_12[1] <= intdelay_reg_next_12[1];
          intdelay_reg_12[2] <= intdelay_reg_next_12[2];
          intdelay_reg_12[3] <= intdelay_reg_next_12[3];
        end
      end
    end

  assign vEndRD = intdelay_reg_12[3];
  assign intdelay_reg_next_12[0] = vEndOutFG;
  assign intdelay_reg_next_12[1] = intdelay_reg_12[0];
  assign intdelay_reg_next_12[2] = intdelay_reg_12[1];
  assign intdelay_reg_next_12[3] = intdelay_reg_12[2];



  assign vEndRDH = vEndRD & hEndRD;



  assign vEndP = (outputProcess == 1'b0 ? ctrlOutZero :
              vEndRDH);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_22_process
      if (reset == 1'b1) begin
        vEndOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          vEndOut_1 <= vEndP;
        end
      end
    end



  assign validFGG = validOutFG & hEndGateN;



  always @(posedge clk or posedge reset)
    begin : intdelay_13_process
      if (reset == 1'b1) begin
        intdelay_reg_13[0] <= 1'b0;
        intdelay_reg_13[1] <= 1'b0;
      end
      else begin
        if (enb) begin
          intdelay_reg_13[0] <= intdelay_reg_next_13[0];
          intdelay_reg_13[1] <= intdelay_reg_next_13[1];
        end
      end
    end

  assign validRPre = intdelay_reg_13[1];
  assign intdelay_reg_next_13[0] = validFGG;
  assign intdelay_reg_next_13[1] = intdelay_reg_13[0];



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_23_process
      if (reset == 1'b1) begin
        validRD <= 1'b0;
      end
      else begin
        if (enb) begin
          validRD <= validRPre;
        end
      end
    end



  assign validRDEnd = validRD | hEndRD;



  assign validP = (outputProcess == 1'b0 ? ctrlOutZero :
              validRDEnd);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_24_process
      if (reset == 1'b1) begin
        validOD <= 1'b0;
      end
      else begin
        if (enb) begin
          validOD <= validP;
        end
      end
    end



  assign validOut = (outputDataREG == 1'b0 ? ctrlOutZero :
              validOD);



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_25_process
      if (reset == 1'b1) begin
        processDataOD <= 1'b0;
      end
      else begin
        if (enb) begin
          processDataOD <= processDataP;
        end
      end
    end



  assign processDataOut = (outputDataREG == 1'b0 ? ctrlOutZero :
              processDataOD);



  assign hStartOut = hStartOut_1;

  assign hEndOut = hEndOut_1;

  assign vStartOut = vStartOut_1;

  assign vEndOut = vEndOut_1;

endmodule  // LineBuffer_block

