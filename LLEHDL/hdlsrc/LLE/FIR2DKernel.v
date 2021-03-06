// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\FIR2DKernel.v
// Created: 2020-07-09 10:41:45
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: FIR2DKernel
// Source Path: LLE/LLEHDL/IterativeFilter/Image Filter4/FIR2DKernel
// Hierarchy Level: 3
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module FIR2DKernel
          (clk,
           reset,
           enb,
           dataIn_0,
           dataIn_1,
           dataIn_2,
           vStartIn,
           vEndIn,
           hStartIn,
           hEndIn,
           validIn,
           processData,
           dataOut,
           vStartOut,
           vEndOut,
           hStartOut,
           hEndOut,
           validOut);


  input   clk;
  input   reset;
  input   enb;
  input   [23:0] dataIn_0;  // ufix24_En16
  input   [23:0] dataIn_1;  // ufix24_En16
  input   [23:0] dataIn_2;  // ufix24_En16
  input   vStartIn;
  input   vEndIn;
  input   hStartIn;
  input   hEndIn;
  input   validIn;
  input   processData;
  output  [27:0] dataOut;  // ufix28_En20
  output  vStartOut;
  output  vEndOut;
  output  hStartOut;
  output  hEndOut;
  output  validOut;


  reg [23:0] tapDelay_1_reg [0:1];  // ufix24 [2]
  wire [23:0] tapDelay_1_reg_next [0:1];  // ufix24_En16 [2]
  wire [23:0] tapOutData_1 [0:2];  // ufix24_En16 [3]
  wire [23:0] tapOutData_1_0;  // ufix24_En16
  reg [23:0] preAdd1_stage1_1;  // ufix24_En16
  reg [23:0] tapDelay_3_reg [0:1];  // ufix24 [2]
  wire [23:0] tapDelay_3_reg_next [0:1];  // ufix24_En16 [2]
  wire [23:0] tapOutData_3 [0:2];  // ufix24_En16 [3]
  wire [23:0] tapOutData_3_0;  // ufix24_En16
  reg [23:0] preAdd1_stage1_2;  // ufix24_En16
  wire [24:0] adder_add_cast;  // ufix25_En16
  wire [24:0] adder_add_cast_1;  // ufix25_En16
  wire [24:0] preAdd1_stage1_add_1;  // ufix25_En16
  reg [24:0] preAdd1_stage2_1;  // ufix25_En16
  wire [23:0] tapOutData_1_2;  // ufix24_En16
  reg [23:0] preAdd1_stage1_3;  // ufix24_En16
  wire [23:0] tapOutData_3_2;  // ufix24_En16
  reg [23:0] preAdd1_stage1_4;  // ufix24_En16
  wire [24:0] adder_add_cast_2;  // ufix25_En16
  wire [24:0] adder_add_cast_3;  // ufix25_En16
  wire [24:0] preAdd1_stage1_add_2;  // ufix25_En16
  reg [24:0] preAdd1_stage2_2;  // ufix25_En16
  wire [25:0] adder_add_cast_4;  // ufix26_En16
  wire [25:0] adder_add_cast_5;  // ufix26_En16
  wire [25:0] preAdd1_stage2_add_1;  // ufix26_En16
  reg [25:0] preAdd1_final_reg;  // ufix26_En16
  reg [25:0] multInDelay1_reg [0:1];  // ufix26 [2]
  wire [25:0] multInDelay1_reg_next [0:1];  // ufix26_En16 [2]
  wire [25:0] multInReg1;  // ufix26_En16
  wire [29:0] multOut1;  // ufix30_En20
  reg [29:0] multOutDelay1_reg [0:1];  // ufix30 [2]
  wire [29:0] multOutDelay1_reg_next [0:1];  // ufix30_En20 [2]
  wire [29:0] multOutReg1;  // ufix30_En20
  reg [29:0] add_stage1_1;  // ufix30_En20
  reg [23:0] tapDelay_2_reg [0:1];  // ufix24 [2]
  wire [23:0] tapDelay_2_reg_next [0:1];  // ufix24_En16 [2]
  wire [23:0] tapOutData_2 [0:2];  // ufix24_En16 [3]
  wire [23:0] tapOutData_2_0;  // ufix24_En16
  reg [23:0] preAdd2_stage1_1;  // ufix24_En16
  wire [23:0] tapOutData_1_1;  // ufix24_En16
  reg [23:0] preAdd2_stage1_2;  // ufix24_En16
  wire [24:0] adder_add_cast_6;  // ufix25_En16
  wire [24:0] adder_add_cast_7;  // ufix25_En16
  wire [24:0] preAdd2_stage1_add_1;  // ufix25_En16
  reg [24:0] preAdd2_stage2_1;  // ufix25_En16
  wire [23:0] tapOutData_3_1;  // ufix24_En16
  reg [23:0] preAdd2_stage1_3;  // ufix24_En16
  wire [23:0] tapOutData_2_2;  // ufix24_En16
  reg [23:0] preAdd2_stage1_4;  // ufix24_En16
  wire [24:0] adder_add_cast_8;  // ufix25_En16
  wire [24:0] adder_add_cast_9;  // ufix25_En16
  wire [24:0] preAdd2_stage1_add_2;  // ufix25_En16
  reg [24:0] preAdd2_stage2_2;  // ufix25_En16
  wire [25:0] adder_add_cast_10;  // ufix26_En16
  wire [25:0] adder_add_cast_11;  // ufix26_En16
  wire [25:0] preAdd2_stage2_add_1;  // ufix26_En16
  reg [25:0] preAdd2_final_reg;  // ufix26_En16
  reg [25:0] multInDelay2_reg [0:1];  // ufix26 [2]
  wire [25:0] multInDelay2_reg_next [0:1];  // ufix26_En16 [2]
  wire [25:0] multInReg2;  // ufix26_En16
  wire [29:0] multOut2;  // ufix30_En20
  reg [29:0] multOutDelay2_reg [0:1];  // ufix30 [2]
  wire [29:0] multOutDelay2_reg_next [0:1];  // ufix30_En20 [2]
  wire [29:0] multOutReg2;  // ufix30_En20
  reg [29:0] add_stage1_2;  // ufix30_En20
  wire [30:0] adder_add_cast_12;  // ufix31_En20
  wire [30:0] adder_add_cast_13;  // ufix31_En20
  wire [30:0] add_stage1_add_1;  // ufix31_En20
  reg [30:0] add_stage2_1;  // ufix31_En20
  wire [23:0] tapOutData_2_1;  // ufix24_En16
  reg [23:0] preAdd3_balance_reg [0:2];  // ufix24 [3]
  wire [23:0] preAdd3_balance_reg_next [0:2];  // ufix24_En16 [3]
  wire [23:0] preAdd3_balance_reg_1;  // ufix24_En16
  reg [23:0] multInDelay3_reg [0:1];  // ufix24 [2]
  wire [23:0] multInDelay3_reg_next [0:1];  // ufix24_En16 [2]
  wire [23:0] multInReg3;  // ufix24_En16
  wire [27:0] multOut3;  // ufix28_En20
  reg [27:0] multOutDelay3_reg [0:1];  // ufix28 [2]
  wire [27:0] multOutDelay3_reg_next [0:1];  // ufix28_En20 [2]
  wire [27:0] multOutReg3;  // ufix28_En20
  reg [27:0] add_stage2_2_reg_reg [0:1];  // ufix28 [2]
  wire [27:0] add_stage2_2_reg_reg_next [0:1];  // ufix28_En20 [2]
  wire [27:0] add_stage2_2;  // ufix28_En20
  wire [31:0] adder_add_cast_14;  // ufix32_En20
  wire [31:0] adder_add_cast_15;  // ufix32_En20
  wire [31:0] add_stage2_add_1;  // ufix32_En20
  reg [31:0] add_final_reg;  // ufix32_En20
  wire [27:0] add_final_reg_conv;  // ufix28_En20
  reg [27:0] dataOut_2;  // ufix28_En20
  reg  vStartIn_reg;
  wire vStartIn_reg_vldSig;
  reg  [0:10] vStartOut_fir_latency_reg;  // ufix1 [11]
  wire [0:10] vStartOut_fir_latency_reg_next;  // ufix1 [11]
  reg  vEndIn_reg;
  wire vEndIn_reg_vldSig;
  reg  [0:10] vEndOut_fir_latency_reg;  // ufix1 [11]
  wire [0:10] vEndOut_fir_latency_reg_next;  // ufix1 [11]
  reg  hStartIn_reg;
  wire hStartIn_reg_vldSig;
  reg  [0:10] hStartOut_fir_latency_reg;  // ufix1 [11]
  wire [0:10] hStartOut_fir_latency_reg_next;  // ufix1 [11]
  reg  hEndIn_reg;
  wire hEndIn_reg_vldSig;
  reg  [0:10] hEndOut_fir_latency_reg;  // ufix1 [11]
  wire [0:10] hEndOut_fir_latency_reg_next;  // ufix1 [11]
  reg  validIn_reg;
  wire validIn_reg_vldSig;
  reg  [0:10] validOut_fir_latency_reg;  // ufix1 [11]
  wire [0:10] validOut_fir_latency_reg_next;  // ufix1 [11]


  always @(posedge clk or posedge reset)
    begin : tapDelay_1_process
      if (reset == 1'b1) begin
        tapDelay_1_reg[0] <= 24'b000000000000000000000000;
        tapDelay_1_reg[1] <= 24'b000000000000000000000000;
      end
      else begin
        if (enb && processData) begin
          tapDelay_1_reg[0] <= tapDelay_1_reg_next[0];
          tapDelay_1_reg[1] <= tapDelay_1_reg_next[1];
        end
      end
    end

  assign tapOutData_1[0] = tapDelay_1_reg[0];
  assign tapOutData_1[1] = tapDelay_1_reg[1];
  assign tapOutData_1[2] = dataIn_0;
  assign tapDelay_1_reg_next[0] = tapDelay_1_reg[1];
  assign tapDelay_1_reg_next[1] = dataIn_0;



  assign tapOutData_1_0 = tapOutData_1[0];

  always @(posedge clk or posedge reset)
    begin : preAdd1_stage1_1_reg_process
      if (reset == 1'b1) begin
        preAdd1_stage1_1 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd1_stage1_1 <= tapOutData_1_0;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : tapDelay_3_process
      if (reset == 1'b1) begin
        tapDelay_3_reg[0] <= 24'b000000000000000000000000;
        tapDelay_3_reg[1] <= 24'b000000000000000000000000;
      end
      else begin
        if (enb && processData) begin
          tapDelay_3_reg[0] <= tapDelay_3_reg_next[0];
          tapDelay_3_reg[1] <= tapDelay_3_reg_next[1];
        end
      end
    end

  assign tapOutData_3[0] = tapDelay_3_reg[0];
  assign tapOutData_3[1] = tapDelay_3_reg[1];
  assign tapOutData_3[2] = dataIn_2;
  assign tapDelay_3_reg_next[0] = tapDelay_3_reg[1];
  assign tapDelay_3_reg_next[1] = dataIn_2;



  assign tapOutData_3_0 = tapOutData_3[0];

  always @(posedge clk or posedge reset)
    begin : preAdd1_stage1_2_reg_process
      if (reset == 1'b1) begin
        preAdd1_stage1_2 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd1_stage1_2 <= tapOutData_3_0;
        end
      end
    end



  assign adder_add_cast = {1'b0, preAdd1_stage1_1};
  assign adder_add_cast_1 = {1'b0, preAdd1_stage1_2};
  assign preAdd1_stage1_add_1 = adder_add_cast + adder_add_cast_1;



  always @(posedge clk or posedge reset)
    begin : preAdd1_stage2_1_reg_process
      if (reset == 1'b1) begin
        preAdd1_stage2_1 <= 25'b0000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd1_stage2_1 <= preAdd1_stage1_add_1;
        end
      end
    end



  assign tapOutData_1_2 = tapOutData_1[2];

  always @(posedge clk or posedge reset)
    begin : preAdd1_stage1_3_reg_process
      if (reset == 1'b1) begin
        preAdd1_stage1_3 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd1_stage1_3 <= tapOutData_1_2;
        end
      end
    end



  assign tapOutData_3_2 = tapOutData_3[2];

  always @(posedge clk or posedge reset)
    begin : preAdd1_stage1_4_reg_process
      if (reset == 1'b1) begin
        preAdd1_stage1_4 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd1_stage1_4 <= tapOutData_3_2;
        end
      end
    end



  assign adder_add_cast_2 = {1'b0, preAdd1_stage1_3};
  assign adder_add_cast_3 = {1'b0, preAdd1_stage1_4};
  assign preAdd1_stage1_add_2 = adder_add_cast_2 + adder_add_cast_3;



  always @(posedge clk or posedge reset)
    begin : preAdd1_stage2_2_reg_process
      if (reset == 1'b1) begin
        preAdd1_stage2_2 <= 25'b0000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd1_stage2_2 <= preAdd1_stage1_add_2;
        end
      end
    end



  assign adder_add_cast_4 = {1'b0, preAdd1_stage2_1};
  assign adder_add_cast_5 = {1'b0, preAdd1_stage2_2};
  assign preAdd1_stage2_add_1 = adder_add_cast_4 + adder_add_cast_5;



  always @(posedge clk or posedge reset)
    begin : preAdd1_final_process
      if (reset == 1'b1) begin
        preAdd1_final_reg <= 26'b00000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd1_final_reg <= preAdd1_stage2_add_1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : multInDelay1_process
      if (reset == 1'b1) begin
        multInDelay1_reg[0] <= 26'b00000000000000000000000000;
        multInDelay1_reg[1] <= 26'b00000000000000000000000000;
      end
      else begin
        if (enb) begin
          multInDelay1_reg[0] <= multInDelay1_reg_next[0];
          multInDelay1_reg[1] <= multInDelay1_reg_next[1];
        end
      end
    end

  assign multInReg1 = multInDelay1_reg[1];
  assign multInDelay1_reg_next[0] = preAdd1_final_reg;
  assign multInDelay1_reg_next[1] = multInDelay1_reg[0];



  assign multOut1 = {4'b0, multInReg1};



  always @(posedge clk or posedge reset)
    begin : multOutDelay1_process
      if (reset == 1'b1) begin
        multOutDelay1_reg[0] <= 30'b000000000000000000000000000000;
        multOutDelay1_reg[1] <= 30'b000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          multOutDelay1_reg[0] <= multOutDelay1_reg_next[0];
          multOutDelay1_reg[1] <= multOutDelay1_reg_next[1];
        end
      end
    end

  assign multOutReg1 = multOutDelay1_reg[1];
  assign multOutDelay1_reg_next[0] = multOut1;
  assign multOutDelay1_reg_next[1] = multOutDelay1_reg[0];



  always @(posedge clk or posedge reset)
    begin : add_stage1_1_reg_process
      if (reset == 1'b1) begin
        add_stage1_1 <= 30'b000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          add_stage1_1 <= multOutReg1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : tapDelay_2_process
      if (reset == 1'b1) begin
        tapDelay_2_reg[0] <= 24'b000000000000000000000000;
        tapDelay_2_reg[1] <= 24'b000000000000000000000000;
      end
      else begin
        if (enb && processData) begin
          tapDelay_2_reg[0] <= tapDelay_2_reg_next[0];
          tapDelay_2_reg[1] <= tapDelay_2_reg_next[1];
        end
      end
    end

  assign tapOutData_2[0] = tapDelay_2_reg[0];
  assign tapOutData_2[1] = tapDelay_2_reg[1];
  assign tapOutData_2[2] = dataIn_1;
  assign tapDelay_2_reg_next[0] = tapDelay_2_reg[1];
  assign tapDelay_2_reg_next[1] = dataIn_1;



  assign tapOutData_2_0 = tapOutData_2[0];

  always @(posedge clk or posedge reset)
    begin : preAdd2_stage1_1_reg_process
      if (reset == 1'b1) begin
        preAdd2_stage1_1 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd2_stage1_1 <= tapOutData_2_0;
        end
      end
    end



  assign tapOutData_1_1 = tapOutData_1[1];

  always @(posedge clk or posedge reset)
    begin : preAdd2_stage1_2_reg_process
      if (reset == 1'b1) begin
        preAdd2_stage1_2 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd2_stage1_2 <= tapOutData_1_1;
        end
      end
    end



  assign adder_add_cast_6 = {1'b0, preAdd2_stage1_1};
  assign adder_add_cast_7 = {1'b0, preAdd2_stage1_2};
  assign preAdd2_stage1_add_1 = adder_add_cast_6 + adder_add_cast_7;



  always @(posedge clk or posedge reset)
    begin : preAdd2_stage2_1_reg_process
      if (reset == 1'b1) begin
        preAdd2_stage2_1 <= 25'b0000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd2_stage2_1 <= preAdd2_stage1_add_1;
        end
      end
    end



  assign tapOutData_3_1 = tapOutData_3[1];

  always @(posedge clk or posedge reset)
    begin : preAdd2_stage1_3_reg_process
      if (reset == 1'b1) begin
        preAdd2_stage1_3 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd2_stage1_3 <= tapOutData_3_1;
        end
      end
    end



  assign tapOutData_2_2 = tapOutData_2[2];

  always @(posedge clk or posedge reset)
    begin : preAdd2_stage1_4_reg_process
      if (reset == 1'b1) begin
        preAdd2_stage1_4 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd2_stage1_4 <= tapOutData_2_2;
        end
      end
    end



  assign adder_add_cast_8 = {1'b0, preAdd2_stage1_3};
  assign adder_add_cast_9 = {1'b0, preAdd2_stage1_4};
  assign preAdd2_stage1_add_2 = adder_add_cast_8 + adder_add_cast_9;



  always @(posedge clk or posedge reset)
    begin : preAdd2_stage2_2_reg_process
      if (reset == 1'b1) begin
        preAdd2_stage2_2 <= 25'b0000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd2_stage2_2 <= preAdd2_stage1_add_2;
        end
      end
    end



  assign adder_add_cast_10 = {1'b0, preAdd2_stage2_1};
  assign adder_add_cast_11 = {1'b0, preAdd2_stage2_2};
  assign preAdd2_stage2_add_1 = adder_add_cast_10 + adder_add_cast_11;



  always @(posedge clk or posedge reset)
    begin : preAdd2_final_process
      if (reset == 1'b1) begin
        preAdd2_final_reg <= 26'b00000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd2_final_reg <= preAdd2_stage2_add_1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : multInDelay2_process
      if (reset == 1'b1) begin
        multInDelay2_reg[0] <= 26'b00000000000000000000000000;
        multInDelay2_reg[1] <= 26'b00000000000000000000000000;
      end
      else begin
        if (enb) begin
          multInDelay2_reg[0] <= multInDelay2_reg_next[0];
          multInDelay2_reg[1] <= multInDelay2_reg_next[1];
        end
      end
    end

  assign multInReg2 = multInDelay2_reg[1];
  assign multInDelay2_reg_next[0] = preAdd2_final_reg;
  assign multInDelay2_reg_next[1] = multInDelay2_reg[0];



  assign multOut2 = {3'b0, {multInReg2, 1'b0}};



  always @(posedge clk or posedge reset)
    begin : multOutDelay2_process
      if (reset == 1'b1) begin
        multOutDelay2_reg[0] <= 30'b000000000000000000000000000000;
        multOutDelay2_reg[1] <= 30'b000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          multOutDelay2_reg[0] <= multOutDelay2_reg_next[0];
          multOutDelay2_reg[1] <= multOutDelay2_reg_next[1];
        end
      end
    end

  assign multOutReg2 = multOutDelay2_reg[1];
  assign multOutDelay2_reg_next[0] = multOut2;
  assign multOutDelay2_reg_next[1] = multOutDelay2_reg[0];



  always @(posedge clk or posedge reset)
    begin : add_stage1_2_reg_process
      if (reset == 1'b1) begin
        add_stage1_2 <= 30'b000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          add_stage1_2 <= multOutReg2;
        end
      end
    end



  assign adder_add_cast_12 = {1'b0, add_stage1_1};
  assign adder_add_cast_13 = {1'b0, add_stage1_2};
  assign add_stage1_add_1 = adder_add_cast_12 + adder_add_cast_13;



  always @(posedge clk or posedge reset)
    begin : add_stage2_1_reg_process
      if (reset == 1'b1) begin
        add_stage2_1 <= 31'b0000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          add_stage2_1 <= add_stage1_add_1;
        end
      end
    end



  assign tapOutData_2_1 = tapOutData_2[1];

  always @(posedge clk or posedge reset)
    begin : preAdd3_balance_process
      if (reset == 1'b1) begin
        preAdd3_balance_reg[0] <= 24'b000000000000000000000000;
        preAdd3_balance_reg[1] <= 24'b000000000000000000000000;
        preAdd3_balance_reg[2] <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          preAdd3_balance_reg[0] <= preAdd3_balance_reg_next[0];
          preAdd3_balance_reg[1] <= preAdd3_balance_reg_next[1];
          preAdd3_balance_reg[2] <= preAdd3_balance_reg_next[2];
        end
      end
    end

  assign preAdd3_balance_reg_1 = preAdd3_balance_reg[2];
  assign preAdd3_balance_reg_next[0] = tapOutData_2_1;
  assign preAdd3_balance_reg_next[1] = preAdd3_balance_reg[0];
  assign preAdd3_balance_reg_next[2] = preAdd3_balance_reg[1];



  always @(posedge clk or posedge reset)
    begin : multInDelay3_process
      if (reset == 1'b1) begin
        multInDelay3_reg[0] <= 24'b000000000000000000000000;
        multInDelay3_reg[1] <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          multInDelay3_reg[0] <= multInDelay3_reg_next[0];
          multInDelay3_reg[1] <= multInDelay3_reg_next[1];
        end
      end
    end

  assign multInReg3 = multInDelay3_reg[1];
  assign multInDelay3_reg_next[0] = preAdd3_balance_reg_1;
  assign multInDelay3_reg_next[1] = multInDelay3_reg[0];



  assign multOut3 = {2'b0, {multInReg3, 2'b00}};



  always @(posedge clk or posedge reset)
    begin : multOutDelay3_process
      if (reset == 1'b1) begin
        multOutDelay3_reg[0] <= 28'b0000000000000000000000000000;
        multOutDelay3_reg[1] <= 28'b0000000000000000000000000000;
      end
      else begin
        if (enb) begin
          multOutDelay3_reg[0] <= multOutDelay3_reg_next[0];
          multOutDelay3_reg[1] <= multOutDelay3_reg_next[1];
        end
      end
    end

  assign multOutReg3 = multOutDelay3_reg[1];
  assign multOutDelay3_reg_next[0] = multOut3;
  assign multOutDelay3_reg_next[1] = multOutDelay3_reg[0];



  always @(posedge clk or posedge reset)
    begin : add_stage2_2_reg_process
      if (reset == 1'b1) begin
        add_stage2_2_reg_reg[0] <= 28'b0000000000000000000000000000;
        add_stage2_2_reg_reg[1] <= 28'b0000000000000000000000000000;
      end
      else begin
        if (enb) begin
          add_stage2_2_reg_reg[0] <= add_stage2_2_reg_reg_next[0];
          add_stage2_2_reg_reg[1] <= add_stage2_2_reg_reg_next[1];
        end
      end
    end

  assign add_stage2_2 = add_stage2_2_reg_reg[1];
  assign add_stage2_2_reg_reg_next[0] = multOutReg3;
  assign add_stage2_2_reg_reg_next[1] = add_stage2_2_reg_reg[0];



  assign adder_add_cast_14 = {1'b0, add_stage2_1};
  assign adder_add_cast_15 = {4'b0, add_stage2_2};
  assign add_stage2_add_1 = adder_add_cast_14 + adder_add_cast_15;



  always @(posedge clk or posedge reset)
    begin : add_final_process
      if (reset == 1'b1) begin
        add_final_reg <= 32'b00000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          add_final_reg <= add_stage2_add_1;
        end
      end
    end



  assign add_final_reg_conv = (add_final_reg[31:28] != 4'b0000 ? 28'b1111111111111111111111111111 :
              add_final_reg[27:0]);



  always @(posedge clk or posedge reset)
    begin : dataOut_1_process
      if (reset == 1'b1) begin
        dataOut_2 <= 28'b0000000000000000000000000000;
      end
      else begin
        if (enb) begin
          dataOut_2 <= add_final_reg_conv;
        end
      end
    end



  // Delay Pixel
  always @(posedge clk or posedge reset)
    begin : vStartOut_tap_latency_process
      if (reset == 1'b1) begin
        vStartIn_reg <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          vStartIn_reg <= vStartIn;
        end
      end
    end



  assign vStartIn_reg_vldSig = vStartIn_reg & processData;



  // Delay Pixel
  always @(posedge clk or posedge reset)
    begin : vStartOut_fir_latency_process
      if (reset == 1'b1) begin
        vStartOut_fir_latency_reg[0] <= 1'b0;
        vStartOut_fir_latency_reg[1] <= 1'b0;
        vStartOut_fir_latency_reg[2] <= 1'b0;
        vStartOut_fir_latency_reg[3] <= 1'b0;
        vStartOut_fir_latency_reg[4] <= 1'b0;
        vStartOut_fir_latency_reg[5] <= 1'b0;
        vStartOut_fir_latency_reg[6] <= 1'b0;
        vStartOut_fir_latency_reg[7] <= 1'b0;
        vStartOut_fir_latency_reg[8] <= 1'b0;
        vStartOut_fir_latency_reg[9] <= 1'b0;
        vStartOut_fir_latency_reg[10] <= 1'b0;
      end
      else begin
        if (enb) begin
          vStartOut_fir_latency_reg[0] <= vStartOut_fir_latency_reg_next[0];
          vStartOut_fir_latency_reg[1] <= vStartOut_fir_latency_reg_next[1];
          vStartOut_fir_latency_reg[2] <= vStartOut_fir_latency_reg_next[2];
          vStartOut_fir_latency_reg[3] <= vStartOut_fir_latency_reg_next[3];
          vStartOut_fir_latency_reg[4] <= vStartOut_fir_latency_reg_next[4];
          vStartOut_fir_latency_reg[5] <= vStartOut_fir_latency_reg_next[5];
          vStartOut_fir_latency_reg[6] <= vStartOut_fir_latency_reg_next[6];
          vStartOut_fir_latency_reg[7] <= vStartOut_fir_latency_reg_next[7];
          vStartOut_fir_latency_reg[8] <= vStartOut_fir_latency_reg_next[8];
          vStartOut_fir_latency_reg[9] <= vStartOut_fir_latency_reg_next[9];
          vStartOut_fir_latency_reg[10] <= vStartOut_fir_latency_reg_next[10];
        end
      end
    end

  assign vStartOut = vStartOut_fir_latency_reg[10];
  assign vStartOut_fir_latency_reg_next[0] = vStartIn_reg_vldSig;
  assign vStartOut_fir_latency_reg_next[1] = vStartOut_fir_latency_reg[0];
  assign vStartOut_fir_latency_reg_next[2] = vStartOut_fir_latency_reg[1];
  assign vStartOut_fir_latency_reg_next[3] = vStartOut_fir_latency_reg[2];
  assign vStartOut_fir_latency_reg_next[4] = vStartOut_fir_latency_reg[3];
  assign vStartOut_fir_latency_reg_next[5] = vStartOut_fir_latency_reg[4];
  assign vStartOut_fir_latency_reg_next[6] = vStartOut_fir_latency_reg[5];
  assign vStartOut_fir_latency_reg_next[7] = vStartOut_fir_latency_reg[6];
  assign vStartOut_fir_latency_reg_next[8] = vStartOut_fir_latency_reg[7];
  assign vStartOut_fir_latency_reg_next[9] = vStartOut_fir_latency_reg[8];
  assign vStartOut_fir_latency_reg_next[10] = vStartOut_fir_latency_reg[9];



  // Delay Horizontal Start
  always @(posedge clk or posedge reset)
    begin : vEndOut_tap_latency_process
      if (reset == 1'b1) begin
        vEndIn_reg <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          vEndIn_reg <= vEndIn;
        end
      end
    end



  assign vEndIn_reg_vldSig = vEndIn_reg & processData;



  // Delay Horizontal Start
  always @(posedge clk or posedge reset)
    begin : vEndOut_fir_latency_process
      if (reset == 1'b1) begin
        vEndOut_fir_latency_reg[0] <= 1'b0;
        vEndOut_fir_latency_reg[1] <= 1'b0;
        vEndOut_fir_latency_reg[2] <= 1'b0;
        vEndOut_fir_latency_reg[3] <= 1'b0;
        vEndOut_fir_latency_reg[4] <= 1'b0;
        vEndOut_fir_latency_reg[5] <= 1'b0;
        vEndOut_fir_latency_reg[6] <= 1'b0;
        vEndOut_fir_latency_reg[7] <= 1'b0;
        vEndOut_fir_latency_reg[8] <= 1'b0;
        vEndOut_fir_latency_reg[9] <= 1'b0;
        vEndOut_fir_latency_reg[10] <= 1'b0;
      end
      else begin
        if (enb) begin
          vEndOut_fir_latency_reg[0] <= vEndOut_fir_latency_reg_next[0];
          vEndOut_fir_latency_reg[1] <= vEndOut_fir_latency_reg_next[1];
          vEndOut_fir_latency_reg[2] <= vEndOut_fir_latency_reg_next[2];
          vEndOut_fir_latency_reg[3] <= vEndOut_fir_latency_reg_next[3];
          vEndOut_fir_latency_reg[4] <= vEndOut_fir_latency_reg_next[4];
          vEndOut_fir_latency_reg[5] <= vEndOut_fir_latency_reg_next[5];
          vEndOut_fir_latency_reg[6] <= vEndOut_fir_latency_reg_next[6];
          vEndOut_fir_latency_reg[7] <= vEndOut_fir_latency_reg_next[7];
          vEndOut_fir_latency_reg[8] <= vEndOut_fir_latency_reg_next[8];
          vEndOut_fir_latency_reg[9] <= vEndOut_fir_latency_reg_next[9];
          vEndOut_fir_latency_reg[10] <= vEndOut_fir_latency_reg_next[10];
        end
      end
    end

  assign vEndOut = vEndOut_fir_latency_reg[10];
  assign vEndOut_fir_latency_reg_next[0] = vEndIn_reg_vldSig;
  assign vEndOut_fir_latency_reg_next[1] = vEndOut_fir_latency_reg[0];
  assign vEndOut_fir_latency_reg_next[2] = vEndOut_fir_latency_reg[1];
  assign vEndOut_fir_latency_reg_next[3] = vEndOut_fir_latency_reg[2];
  assign vEndOut_fir_latency_reg_next[4] = vEndOut_fir_latency_reg[3];
  assign vEndOut_fir_latency_reg_next[5] = vEndOut_fir_latency_reg[4];
  assign vEndOut_fir_latency_reg_next[6] = vEndOut_fir_latency_reg[5];
  assign vEndOut_fir_latency_reg_next[7] = vEndOut_fir_latency_reg[6];
  assign vEndOut_fir_latency_reg_next[8] = vEndOut_fir_latency_reg[7];
  assign vEndOut_fir_latency_reg_next[9] = vEndOut_fir_latency_reg[8];
  assign vEndOut_fir_latency_reg_next[10] = vEndOut_fir_latency_reg[9];



  // Delay Horizontal End
  always @(posedge clk or posedge reset)
    begin : hStartOut_tap_latency_process
      if (reset == 1'b1) begin
        hStartIn_reg <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          hStartIn_reg <= hStartIn;
        end
      end
    end



  assign hStartIn_reg_vldSig = hStartIn_reg & processData;



  // Delay Horizontal End
  always @(posedge clk or posedge reset)
    begin : hStartOut_fir_latency_process
      if (reset == 1'b1) begin
        hStartOut_fir_latency_reg[0] <= 1'b0;
        hStartOut_fir_latency_reg[1] <= 1'b0;
        hStartOut_fir_latency_reg[2] <= 1'b0;
        hStartOut_fir_latency_reg[3] <= 1'b0;
        hStartOut_fir_latency_reg[4] <= 1'b0;
        hStartOut_fir_latency_reg[5] <= 1'b0;
        hStartOut_fir_latency_reg[6] <= 1'b0;
        hStartOut_fir_latency_reg[7] <= 1'b0;
        hStartOut_fir_latency_reg[8] <= 1'b0;
        hStartOut_fir_latency_reg[9] <= 1'b0;
        hStartOut_fir_latency_reg[10] <= 1'b0;
      end
      else begin
        if (enb) begin
          hStartOut_fir_latency_reg[0] <= hStartOut_fir_latency_reg_next[0];
          hStartOut_fir_latency_reg[1] <= hStartOut_fir_latency_reg_next[1];
          hStartOut_fir_latency_reg[2] <= hStartOut_fir_latency_reg_next[2];
          hStartOut_fir_latency_reg[3] <= hStartOut_fir_latency_reg_next[3];
          hStartOut_fir_latency_reg[4] <= hStartOut_fir_latency_reg_next[4];
          hStartOut_fir_latency_reg[5] <= hStartOut_fir_latency_reg_next[5];
          hStartOut_fir_latency_reg[6] <= hStartOut_fir_latency_reg_next[6];
          hStartOut_fir_latency_reg[7] <= hStartOut_fir_latency_reg_next[7];
          hStartOut_fir_latency_reg[8] <= hStartOut_fir_latency_reg_next[8];
          hStartOut_fir_latency_reg[9] <= hStartOut_fir_latency_reg_next[9];
          hStartOut_fir_latency_reg[10] <= hStartOut_fir_latency_reg_next[10];
        end
      end
    end

  assign hStartOut = hStartOut_fir_latency_reg[10];
  assign hStartOut_fir_latency_reg_next[0] = hStartIn_reg_vldSig;
  assign hStartOut_fir_latency_reg_next[1] = hStartOut_fir_latency_reg[0];
  assign hStartOut_fir_latency_reg_next[2] = hStartOut_fir_latency_reg[1];
  assign hStartOut_fir_latency_reg_next[3] = hStartOut_fir_latency_reg[2];
  assign hStartOut_fir_latency_reg_next[4] = hStartOut_fir_latency_reg[3];
  assign hStartOut_fir_latency_reg_next[5] = hStartOut_fir_latency_reg[4];
  assign hStartOut_fir_latency_reg_next[6] = hStartOut_fir_latency_reg[5];
  assign hStartOut_fir_latency_reg_next[7] = hStartOut_fir_latency_reg[6];
  assign hStartOut_fir_latency_reg_next[8] = hStartOut_fir_latency_reg[7];
  assign hStartOut_fir_latency_reg_next[9] = hStartOut_fir_latency_reg[8];
  assign hStartOut_fir_latency_reg_next[10] = hStartOut_fir_latency_reg[9];



  // Delay Vertical Start
  always @(posedge clk or posedge reset)
    begin : hEndOut_tap_latency_process
      if (reset == 1'b1) begin
        hEndIn_reg <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          hEndIn_reg <= hEndIn;
        end
      end
    end



  assign hEndIn_reg_vldSig = hEndIn_reg & processData;



  // Delay Vertical Start
  always @(posedge clk or posedge reset)
    begin : hEndOut_fir_latency_process
      if (reset == 1'b1) begin
        hEndOut_fir_latency_reg[0] <= 1'b0;
        hEndOut_fir_latency_reg[1] <= 1'b0;
        hEndOut_fir_latency_reg[2] <= 1'b0;
        hEndOut_fir_latency_reg[3] <= 1'b0;
        hEndOut_fir_latency_reg[4] <= 1'b0;
        hEndOut_fir_latency_reg[5] <= 1'b0;
        hEndOut_fir_latency_reg[6] <= 1'b0;
        hEndOut_fir_latency_reg[7] <= 1'b0;
        hEndOut_fir_latency_reg[8] <= 1'b0;
        hEndOut_fir_latency_reg[9] <= 1'b0;
        hEndOut_fir_latency_reg[10] <= 1'b0;
      end
      else begin
        if (enb) begin
          hEndOut_fir_latency_reg[0] <= hEndOut_fir_latency_reg_next[0];
          hEndOut_fir_latency_reg[1] <= hEndOut_fir_latency_reg_next[1];
          hEndOut_fir_latency_reg[2] <= hEndOut_fir_latency_reg_next[2];
          hEndOut_fir_latency_reg[3] <= hEndOut_fir_latency_reg_next[3];
          hEndOut_fir_latency_reg[4] <= hEndOut_fir_latency_reg_next[4];
          hEndOut_fir_latency_reg[5] <= hEndOut_fir_latency_reg_next[5];
          hEndOut_fir_latency_reg[6] <= hEndOut_fir_latency_reg_next[6];
          hEndOut_fir_latency_reg[7] <= hEndOut_fir_latency_reg_next[7];
          hEndOut_fir_latency_reg[8] <= hEndOut_fir_latency_reg_next[8];
          hEndOut_fir_latency_reg[9] <= hEndOut_fir_latency_reg_next[9];
          hEndOut_fir_latency_reg[10] <= hEndOut_fir_latency_reg_next[10];
        end
      end
    end

  assign hEndOut = hEndOut_fir_latency_reg[10];
  assign hEndOut_fir_latency_reg_next[0] = hEndIn_reg_vldSig;
  assign hEndOut_fir_latency_reg_next[1] = hEndOut_fir_latency_reg[0];
  assign hEndOut_fir_latency_reg_next[2] = hEndOut_fir_latency_reg[1];
  assign hEndOut_fir_latency_reg_next[3] = hEndOut_fir_latency_reg[2];
  assign hEndOut_fir_latency_reg_next[4] = hEndOut_fir_latency_reg[3];
  assign hEndOut_fir_latency_reg_next[5] = hEndOut_fir_latency_reg[4];
  assign hEndOut_fir_latency_reg_next[6] = hEndOut_fir_latency_reg[5];
  assign hEndOut_fir_latency_reg_next[7] = hEndOut_fir_latency_reg[6];
  assign hEndOut_fir_latency_reg_next[8] = hEndOut_fir_latency_reg[7];
  assign hEndOut_fir_latency_reg_next[9] = hEndOut_fir_latency_reg[8];
  assign hEndOut_fir_latency_reg_next[10] = hEndOut_fir_latency_reg[9];



  // Delay Vertical End
  always @(posedge clk or posedge reset)
    begin : validOut_tap_latency_process
      if (reset == 1'b1) begin
        validIn_reg <= 1'b0;
      end
      else begin
        if (enb && processData) begin
          validIn_reg <= validIn;
        end
      end
    end



  assign validIn_reg_vldSig = validIn_reg & processData;



  // Delay Vertical End
  always @(posedge clk or posedge reset)
    begin : validOut_fir_latency_process
      if (reset == 1'b1) begin
        validOut_fir_latency_reg[0] <= 1'b0;
        validOut_fir_latency_reg[1] <= 1'b0;
        validOut_fir_latency_reg[2] <= 1'b0;
        validOut_fir_latency_reg[3] <= 1'b0;
        validOut_fir_latency_reg[4] <= 1'b0;
        validOut_fir_latency_reg[5] <= 1'b0;
        validOut_fir_latency_reg[6] <= 1'b0;
        validOut_fir_latency_reg[7] <= 1'b0;
        validOut_fir_latency_reg[8] <= 1'b0;
        validOut_fir_latency_reg[9] <= 1'b0;
        validOut_fir_latency_reg[10] <= 1'b0;
      end
      else begin
        if (enb) begin
          validOut_fir_latency_reg[0] <= validOut_fir_latency_reg_next[0];
          validOut_fir_latency_reg[1] <= validOut_fir_latency_reg_next[1];
          validOut_fir_latency_reg[2] <= validOut_fir_latency_reg_next[2];
          validOut_fir_latency_reg[3] <= validOut_fir_latency_reg_next[3];
          validOut_fir_latency_reg[4] <= validOut_fir_latency_reg_next[4];
          validOut_fir_latency_reg[5] <= validOut_fir_latency_reg_next[5];
          validOut_fir_latency_reg[6] <= validOut_fir_latency_reg_next[6];
          validOut_fir_latency_reg[7] <= validOut_fir_latency_reg_next[7];
          validOut_fir_latency_reg[8] <= validOut_fir_latency_reg_next[8];
          validOut_fir_latency_reg[9] <= validOut_fir_latency_reg_next[9];
          validOut_fir_latency_reg[10] <= validOut_fir_latency_reg_next[10];
        end
      end
    end

  assign validOut = validOut_fir_latency_reg[10];
  assign validOut_fir_latency_reg_next[0] = validIn_reg_vldSig;
  assign validOut_fir_latency_reg_next[1] = validOut_fir_latency_reg[0];
  assign validOut_fir_latency_reg_next[2] = validOut_fir_latency_reg[1];
  assign validOut_fir_latency_reg_next[3] = validOut_fir_latency_reg[2];
  assign validOut_fir_latency_reg_next[4] = validOut_fir_latency_reg[3];
  assign validOut_fir_latency_reg_next[5] = validOut_fir_latency_reg[4];
  assign validOut_fir_latency_reg_next[6] = validOut_fir_latency_reg[5];
  assign validOut_fir_latency_reg_next[7] = validOut_fir_latency_reg[6];
  assign validOut_fir_latency_reg_next[8] = validOut_fir_latency_reg[7];
  assign validOut_fir_latency_reg_next[9] = validOut_fir_latency_reg[8];
  assign validOut_fir_latency_reg_next[10] = validOut_fir_latency_reg[9];



  assign dataOut = dataOut_2;

endmodule  // FIR2DKernel

