// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\GateProcessData_block1.v
// Created: 2020-07-09 10:41:45
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: GateProcessData_block1
// Source Path: LLE/LLEHDL/IterativeFilter/Image Filter2/LineBuffer/GateProcessData
// Hierarchy Level: 4
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module GateProcessData_block1
          (clk,
           reset,
           enb,
           processDataIn,
           validIn,
           dumping,
           outputData,
           processData,
           dumpOrValid);


  input   clk;
  input   reset;
  input   enb;
  input   processDataIn;
  input   validIn;
  input   dumping;
  input   outputData;
  output  processData;
  output  dumpOrValid;


  wire processNull;
  reg  validREG;
  wire validOrDumping;
  wire processValid;


  assign processNull = 1'b0;



  always @(posedge clk or posedge reset)
    begin : reg_rsvd_process
      if (reset == 1'b1) begin
        validREG <= 1'b0;
      end
      else begin
        if (enb) begin
          validREG <= validIn;
        end
      end
    end



  assign validOrDumping = validREG | dumping;



  assign processValid = processDataIn & validOrDumping;



  assign processData = (outputData == 1'b0 ? processNull :
              processValid);



  assign dumpOrValid = validOrDumping;

endmodule  // GateProcessData_block1

