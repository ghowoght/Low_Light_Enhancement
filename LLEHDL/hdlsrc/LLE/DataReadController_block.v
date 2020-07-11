// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\DataReadController_block.v
// Created: 2020-07-09 10:41:45
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: DataReadController_block
// Source Path: LLE/LLEHDL/IterativeFilter/Image Filter3/LineBuffer/DataReadController
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module DataReadController_block
          (clk,
           reset,
           enb,
           hStartIn,
           hEndIn,
           vStartIn,
           vEndIn,
           validIn,
           lineStartV,
           lineAverage,
           AllEndOfLine,
           BlankCount,
           frameStart,
           hStartR,
           hEndR,
           vStartR,
           vEndR,
           validR,
           outputData,
           Unloading,
           blankCountEn,
           Running);


  input   clk;
  input   reset;
  input   enb;
  input   hStartIn;
  input   hEndIn;
  input   vStartIn;
  input   vEndIn;
  input   validIn;
  input   [1:0] lineStartV;  // ufix2
  input   [15:0] lineAverage;  // ufix16
  input   AllEndOfLine;
  input   [15:0] BlankCount;  // ufix16
  input   frameStart;
  output  hStartR;
  output  hEndR;
  output  vStartR;
  output  vEndR;
  output  validR;
  output  outputData;
  output  Unloading;
  output  blankCountEn;
  output  Running;


  reg [1:0] DataReadController_FSMState;  // ufix2
  reg  DataReadController_InBetween;
  reg [1:0] DataReadController_FSMState_next;  // ufix2
  reg  DataReadController_InBetween_next;
  reg  hStartR_1;
  reg  hEndR_1;
  reg  vStartR_1;
  reg  vEndR_1;
  reg  validR_1;
  reg  outputData_1;
  reg  Unloading_1;
  reg  blankCountEn_1;
  reg  Running_1;


  // Data Read Controller
  always @(posedge clk or posedge reset)
    begin : DataReadController_process
      if (reset == 1'b1) begin
        DataReadController_FSMState <= 2'b00;
        DataReadController_InBetween <= 1'b0;
      end
      else begin
        if (enb) begin
          DataReadController_FSMState <= DataReadController_FSMState_next;
          DataReadController_InBetween <= DataReadController_InBetween_next;
        end
      end
    end

  always @(AllEndOfLine, BlankCount, DataReadController_FSMState,
       DataReadController_InBetween, frameStart, hEndIn, hStartIn, lineAverage,
       lineStartV, vEndIn, vStartIn, validIn) begin
    DataReadController_FSMState_next = DataReadController_FSMState;
    DataReadController_InBetween_next = DataReadController_InBetween;
    case ( DataReadController_FSMState)
      2'b00 :
        begin
          outputData_1 = 1'b0;
          hStartR_1 = hStartIn;
          hEndR_1 = hEndIn;
          vStartR_1 = vStartIn;
          vEndR_1 = 1'b0;
          validR_1 = validIn;
          Unloading_1 = 1'b0;
          DataReadController_InBetween_next = 1'b0;
          blankCountEn_1 = 1'b0;
          Running_1 = 1'b0;
          if (lineStartV[1] != 1'b0) begin
            DataReadController_FSMState_next = 2'b01;
          end
          else begin
            DataReadController_FSMState_next = 2'b00;
          end
        end
      2'b01 :
        begin
          outputData_1 = 1'b1;
          Unloading_1 = 1'b0;
          Running_1 = 1'b1;
          hStartR_1 = hStartIn;
          hEndR_1 = hEndIn;
          vStartR_1 = vStartIn;
          vEndR_1 = 1'b0;
          validR_1 = validIn;
          if (frameStart != 1'b0) begin
            DataReadController_FSMState_next = 2'b00;
            DataReadController_InBetween_next = 1'b1;
            blankCountEn_1 = 1'b0;
          end
          else if (vEndIn != 1'b0) begin
            DataReadController_FSMState_next = 2'b10;
            DataReadController_InBetween_next = 1'b1;
            blankCountEn_1 = 1'b1;
          end
          else begin
            DataReadController_FSMState_next = 2'b01;
            blankCountEn_1 = 1'b0;
            DataReadController_InBetween_next = 1'b0;
          end
        end
      2'b10 :
        begin
          outputData_1 = 1'b1;
          Unloading_1 = 1'b1;
          Running_1 = 1'b0;
          if (frameStart != 1'b0) begin
            DataReadController_FSMState_next = 2'b00;
            hStartR_1 = 1'b0;
            hEndR_1 = 1'b0;
            vStartR_1 = 1'b0;
            vEndR_1 = 1'b0;
            validR_1 = 1'b0;
            blankCountEn_1 = 1'b0;
            DataReadController_InBetween_next = 1'b1;
          end
          else if ((( ~ lineStartV[0]) && ( ! DataReadController_InBetween)) && AllEndOfLine) begin
            DataReadController_FSMState_next = 2'b10;
            hStartR_1 = 1'b0;
            hEndR_1 = 1'b1;
            vStartR_1 = 1'b0;
            vEndR_1 = 1'b1;
            validR_1 = 1'b1;
            blankCountEn_1 = 1'b0;
            DataReadController_InBetween_next = 1'b1;
          end
          else if ((DataReadController_InBetween && (BlankCount == lineAverage)) && ( ~ lineStartV[0])) begin
            DataReadController_FSMState_next = 2'b00;
            hStartR_1 = 1'b0;
            hEndR_1 = 1'b0;
            vStartR_1 = 1'b0;
            vEndR_1 = 1'b0;
            validR_1 = 1'b0;
            blankCountEn_1 = 1'b0;
            DataReadController_InBetween_next = 1'b0;
          end
          else if (DataReadController_InBetween && (BlankCount < lineAverage)) begin
            DataReadController_FSMState_next = 2'b10;
            hStartR_1 = 1'b0;
            hEndR_1 = 1'b0;
            vStartR_1 = 1'b0;
            vEndR_1 = 1'b0;
            validR_1 = 1'b0;
            blankCountEn_1 = 1'b1;
            DataReadController_InBetween_next = 1'b1;
          end
          else if (DataReadController_InBetween && (BlankCount == lineAverage)) begin
            DataReadController_FSMState_next = 2'b10;
            hStartR_1 = 1'b1;
            hEndR_1 = 1'b0;
            vStartR_1 = 1'b0;
            vEndR_1 = 1'b0;
            validR_1 = 1'b1;
            blankCountEn_1 = 1'b0;
            DataReadController_InBetween_next = 1'b0;
          end
          else if (( ! DataReadController_InBetween) && AllEndOfLine) begin
            DataReadController_FSMState_next = 2'b10;
            hStartR_1 = 1'b0;
            hEndR_1 = 1'b1;
            vStartR_1 = 1'b0;
            vEndR_1 = 1'b0;
            validR_1 = 1'b1;
            blankCountEn_1 = 1'b0;
            DataReadController_InBetween_next = 1'b1;
          end
          else if ( ! DataReadController_InBetween) begin
            DataReadController_FSMState_next = 2'b10;
            hStartR_1 = 1'b0;
            hEndR_1 = 1'b0;
            vStartR_1 = 1'b0;
            vEndR_1 = 1'b0;
            validR_1 = 1'b1;
            blankCountEn_1 = 1'b0;
            DataReadController_InBetween_next = 1'b0;
          end
          else begin
            DataReadController_FSMState_next = 2'b10;
            hStartR_1 = 1'b0;
            hEndR_1 = 1'b0;
            vStartR_1 = 1'b0;
            vEndR_1 = 1'b0;
            validR_1 = 1'b1;
            blankCountEn_1 = 1'b0;
            DataReadController_InBetween_next = 1'b0;
          end
        end
      default :
        begin
          hStartR_1 = hStartIn;
          hEndR_1 = hEndIn;
          vStartR_1 = vStartIn;
          vEndR_1 = 1'b0;
          validR_1 = validIn;
          outputData_1 = 1'b1;
          Unloading_1 = 1'b0;
          blankCountEn_1 = 1'b0;
          DataReadController_InBetween_next = 1'b0;
          Running_1 = 1'b0;
        end
    endcase
  end



  assign hStartR = hStartR_1;

  assign hEndR = hEndR_1;

  assign vStartR = vStartR_1;

  assign vEndR = vEndR_1;

  assign validR = validR_1;

  assign outputData = outputData_1;

  assign Unloading = Unloading_1;

  assign blankCountEn = blankCountEn_1;

  assign Running = Running_1;

endmodule  // DataReadController_block

