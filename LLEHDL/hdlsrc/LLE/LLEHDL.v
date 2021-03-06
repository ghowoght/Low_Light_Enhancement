// -------------------------------------------------------------
// 
// File Name: hdlsrc\LLE\LLEHDL.v
// Created: 2020-07-09 10:41:46
// 
// Generated by MATLAB 9.8 and HDL Coder 3.16
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// pixelOut_0                    ce_out        1
// pixelOut_1                    ce_out        1
// pixelOut_2                    ce_out        1
// ctrlOut_hStart                ce_out        1
// ctrlOut_hEnd                  ce_out        1
// ctrlOut_vStart                ce_out        1
// ctrlOut_vEnd                  ce_out        1
// ctrlOut_valid                 ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: LLEHDL
// Source Path: LLE/LLEHDL
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module LLEHDL
          (clk,
           reset,
           clk_enable,
           pixelIn_0,
           pixelIn_1,
           pixelIn_2,
           ctrlIn_hStart,
           ctrlIn_hEnd,
           ctrlIn_vStart,
           ctrlIn_vEnd,
           ctrlIn_valid,
           ce_out,
           pixelOut_0,
           pixelOut_1,
           pixelOut_2,
           ctrlOut_hStart,
           ctrlOut_hEnd,
           ctrlOut_vStart,
           ctrlOut_vEnd,
           ctrlOut_valid);


  input   clk;
  input   reset;
  input   clk_enable;
  input   [7:0] pixelIn_0;  // uint8
  input   [7:0] pixelIn_1;  // uint8
  input   [7:0] pixelIn_2;  // uint8
  input   ctrlIn_hStart;
  input   ctrlIn_hEnd;
  input   ctrlIn_vStart;
  input   ctrlIn_vEnd;
  input   ctrlIn_valid;
  output  ce_out;
  output  [7:0] pixelOut_0;  // uint8
  output  [7:0] pixelOut_1;  // uint8
  output  [7:0] pixelOut_2;  // uint8
  output  ctrlOut_hStart;
  output  ctrlOut_hEnd;
  output  ctrlOut_vStart;
  output  ctrlOut_vEnd;
  output  ctrlOut_valid;


  wire enb;
  wire [7:0] Constant4_out1;  // uint8
  wire [7:0] Inversion_out1_0;  // uint8
  wire [7:0] Inversion_out1_1;  // uint8
  wire [7:0] Inversion_out1_2;  // uint8
  wire [7:0] DarkChannel_out1;  // uint8
  reg [7:0] Delay_out1;  // uint8
  reg  Delay2_out1_hStart;
  reg  Delay1_out1_hStart;
  reg  Delay2_out1_hEnd;
  reg  Delay1_out1_hEnd;
  reg  Delay2_out1_vStart;
  reg  Delay1_out1_vStart;
  reg  Delay2_out1_vEnd;
  reg  Delay1_out1_vEnd;
  reg  Delay2_out1_valid;
  reg  Delay1_out1_valid;
  wire [27:0] IterativeFilter_out1;  // ufix28_En20
  wire IterativeFilter_out2_hStart;
  wire IterativeFilter_out2_hEnd;
  wire IterativeFilter_out2_vStart;
  wire IterativeFilter_out2_vEnd;
  wire IterativeFilter_out2_valid;
  wire [51:0] Gain_mul_temp;  // ufix52_En40
  wire [23:0] Gain_out1;  // ufix24_En22
  reg [23:0] Delay9_out1;  // ufix24_En22
  wire [47:0] Product2_mul_temp;  // ufix48_En44
  wire [25:0] Product2_out1;  // ufix26_En22
  reg [25:0] Delay6_out1;  // ufix26_En22
  wire [51:0] Product3_mul_temp;  // ufix52_En44
  wire [29:0] Product3_out1;  // ufix30_En22
  reg [29:0] Delay7_out1;  // ufix30_En22
  wire [30:0] Add_add_cast;  // ufix31_En22
  wire [30:0] Add_add_cast_1;  // ufix31_En22
  wire [30:0] Add_add_temp;  // ufix31_En22
  wire [29:0] Add_out1;  // ufix30_En22
  reg [29:0] Delay8_out1;  // ufix30_En22
  reg  [0:3] alpha_reg;  // ufix1 [4]
  wire [0:3] alpha_reg_next;  // ufix1 [4]
  wire Delay11_out1_hStart;
  reg  [0:3] alpha_reg_1;  // ufix1 [4]
  wire [0:3] alpha_reg_next_1;  // ufix1 [4]
  wire Delay11_out1_hEnd;
  reg  [0:3] alpha_reg_2;  // ufix1 [4]
  wire [0:3] alpha_reg_next_2;  // ufix1 [4]
  wire Delay11_out1_vStart;
  reg  [0:3] alpha_reg_3;  // ufix1 [4]
  wire [0:3] alpha_reg_next_3;  // ufix1 [4]
  wire Delay11_out1_vEnd;
  reg  [0:3] alpha_reg_4;  // ufix1 [4]
  wire [0:3] alpha_reg_next_4;  // ufix1 [4]
  wire Delay11_out1_valid;
  wire [7:0] Pixel_Stream_Aligner_out1_0;  // uint8
  wire [7:0] Pixel_Stream_Aligner_out1_1;  // uint8
  wire [7:0] Pixel_Stream_Aligner_out1_2;  // uint8
  wire [29:0] Pixel_Stream_Aligner_out2;  // ufix30_En22
  wire Pixel_Stream_Aligner_out3_hStart;
  wire Pixel_Stream_Aligner_out3_hEnd;
  wire Pixel_Stream_Aligner_out3_vStart;
  wire Pixel_Stream_Aligner_out3_vEnd;
  wire Pixel_Stream_Aligner_out3_valid;
  wire [7:0] Pixel_Stream_Aligner_out1 [0:2];  // uint8 [3]
  reg [7:0] Delay3_out1 [0:2];  // uint8 [3]
  reg [29:0] Delay4_out1;  // ufix30_En22
  wire [37:0] Enhance_ment_mul_temp;  // ufix38_En22
  wire [37:0] Enhance_ment_mul_temp_1;  // ufix38_En22
  wire [37:0] Enhance_ment_mul_temp_2;  // ufix38_En22
  wire [7:0] Enhance_ment_out1 [0:2];  // uint8 [3]
  reg  Delay5_out1_hStart;
  reg  Delay5_out1_hEnd;
  reg  Delay5_out1_vStart;
  reg  Delay5_out1_vEnd;
  reg  Delay5_out1_valid;

  // EnhancementFactor


  assign Constant4_out1 = 8'b00000001;



  Inversion u_Inversion (.clk(clk),
                         .reset(reset),
                         .enb(clk_enable),
                         .PixIn_0(pixelIn_0),  // uint8
                         .PixIn_1(pixelIn_1),  // uint8
                         .PixIn_2(pixelIn_2),  // uint8
                         .InvOut_0(Inversion_out1_0),  // uint8
                         .InvOut_1(Inversion_out1_1),  // uint8
                         .InvOut_2(Inversion_out1_2)  // uint8
                         );

  DarkChannel u_DarkChannel (.in0_0(Inversion_out1_0),  // uint8
                             .in0_1(Inversion_out1_1),  // uint8
                             .in0_2(Inversion_out1_2),  // uint8
                             .out0(DarkChannel_out1)  // uint8
                             );

  assign enb = clk_enable;

  always @(posedge clk or posedge reset)
    begin : Delay_process
      if (reset == 1'b1) begin
        Delay_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay_out1 <= DarkChannel_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_process
      if (reset == 1'b1) begin
        Delay2_out1_hStart <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_out1_hStart <= ctrlIn_hStart;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_1_process
      if (reset == 1'b1) begin
        Delay1_out1_hStart <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1_hStart <= Delay2_out1_hStart;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_2_process
      if (reset == 1'b1) begin
        Delay2_out1_hEnd <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_out1_hEnd <= ctrlIn_hEnd;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_3_process
      if (reset == 1'b1) begin
        Delay1_out1_hEnd <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1_hEnd <= Delay2_out1_hEnd;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_4_process
      if (reset == 1'b1) begin
        Delay2_out1_vStart <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_out1_vStart <= ctrlIn_vStart;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_5_process
      if (reset == 1'b1) begin
        Delay1_out1_vStart <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1_vStart <= Delay2_out1_vStart;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_6_process
      if (reset == 1'b1) begin
        Delay2_out1_vEnd <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_out1_vEnd <= ctrlIn_vEnd;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_7_process
      if (reset == 1'b1) begin
        Delay1_out1_vEnd <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1_vEnd <= Delay2_out1_vEnd;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_8_process
      if (reset == 1'b1) begin
        Delay2_out1_valid <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay2_out1_valid <= ctrlIn_valid;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_9_process
      if (reset == 1'b1) begin
        Delay1_out1_valid <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1_valid <= Delay2_out1_valid;
        end
      end
    end



  IterativeFilter u_IterativeFilter (.clk(clk),
                                     .reset(reset),
                                     .enb(clk_enable),
                                     .pixelIn(Delay_out1),  // uint8
                                     .ctrlIn_hStart(Delay1_out1_hStart),
                                     .ctrlIn_hEnd(Delay1_out1_hEnd),
                                     .ctrlIn_vStart(Delay1_out1_vStart),
                                     .ctrlIn_vEnd(Delay1_out1_vEnd),
                                     .ctrlIn_valid(Delay1_out1_valid),
                                     .pixelOut(IterativeFilter_out1),  // ufix28_En20
                                     .ctrlOut_hStart(IterativeFilter_out2_hStart),
                                     .ctrlOut_hEnd(IterativeFilter_out2_hEnd),
                                     .ctrlOut_vStart(IterativeFilter_out2_vStart),
                                     .ctrlOut_vEnd(IterativeFilter_out2_vEnd),
                                     .ctrlOut_valid(IterativeFilter_out2_valid)
                                     );

  assign Gain_mul_temp = 24'b000000000001100000011000 * IterativeFilter_out1;
  assign Gain_out1 = Gain_mul_temp[41:18];



  always @(posedge clk or posedge reset)
    begin : Delay9_process
      if (reset == 1'b1) begin
        Delay9_out1 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay9_out1 <= Gain_out1;
        end
      end
    end



  assign Product2_mul_temp = Delay9_out1 * Delay9_out1;
  assign Product2_out1 = (Product2_mul_temp[47:22] == 26'b11111111111111111111111111 ? 26'b11111111111111111111111111 :
              Product2_mul_temp[47:22] + Product2_mul_temp[21]);



  always @(posedge clk or posedge reset)
    begin : Delay6_process
      if (reset == 1'b1) begin
        Delay6_out1 <= 26'b00000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay6_out1 <= Product2_out1;
        end
      end
    end



  assign Product3_mul_temp = Delay6_out1 * Delay6_out1;
  assign Product3_out1 = (Product3_mul_temp[51:22] == 30'b111111111111111111111111111111 ? 30'b111111111111111111111111111111 :
              Product3_mul_temp[51:22] + Product3_mul_temp[21]);



  always @(posedge clk or posedge reset)
    begin : Delay7_process
      if (reset == 1'b1) begin
        Delay7_out1 <= 30'b000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay7_out1 <= Product3_out1;
        end
      end
    end



  assign Add_add_cast = {1'b0, {Constant4_out1, 22'b0000000000000000000000}};
  assign Add_add_cast_1 = {1'b0, Delay7_out1};
  assign Add_add_temp = Add_add_cast + Add_add_cast_1;
  assign Add_out1 = (Add_add_temp[30] != 1'b0 ? 30'b111111111111111111111111111111 :
              Add_add_temp[29:0]);



  always @(posedge clk or posedge reset)
    begin : Delay8_process
      if (reset == 1'b1) begin
        Delay8_out1 <= 30'b000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay8_out1 <= Add_out1;
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : c_10_process
      if (reset == 1'b1) begin
        alpha_reg[0] <= 1'b0;
        alpha_reg[1] <= 1'b0;
        alpha_reg[2] <= 1'b0;
        alpha_reg[3] <= 1'b0;
      end
      else begin
        if (enb) begin
          alpha_reg[0] <= alpha_reg_next[0];
          alpha_reg[1] <= alpha_reg_next[1];
          alpha_reg[2] <= alpha_reg_next[2];
          alpha_reg[3] <= alpha_reg_next[3];
        end
      end
    end

  assign Delay11_out1_hStart = alpha_reg[3];
  assign alpha_reg_next[0] = IterativeFilter_out2_hStart;
  assign alpha_reg_next[1] = alpha_reg[0];
  assign alpha_reg_next[2] = alpha_reg[1];
  assign alpha_reg_next[3] = alpha_reg[2];



  always @(posedge clk or posedge reset)
    begin : c_11_process
      if (reset == 1'b1) begin
        alpha_reg_1[0] <= 1'b0;
        alpha_reg_1[1] <= 1'b0;
        alpha_reg_1[2] <= 1'b0;
        alpha_reg_1[3] <= 1'b0;
      end
      else begin
        if (enb) begin
          alpha_reg_1[0] <= alpha_reg_next_1[0];
          alpha_reg_1[1] <= alpha_reg_next_1[1];
          alpha_reg_1[2] <= alpha_reg_next_1[2];
          alpha_reg_1[3] <= alpha_reg_next_1[3];
        end
      end
    end

  assign Delay11_out1_hEnd = alpha_reg_1[3];
  assign alpha_reg_next_1[0] = IterativeFilter_out2_hEnd;
  assign alpha_reg_next_1[1] = alpha_reg_1[0];
  assign alpha_reg_next_1[2] = alpha_reg_1[1];
  assign alpha_reg_next_1[3] = alpha_reg_1[2];



  always @(posedge clk or posedge reset)
    begin : c_12_process
      if (reset == 1'b1) begin
        alpha_reg_2[0] <= 1'b0;
        alpha_reg_2[1] <= 1'b0;
        alpha_reg_2[2] <= 1'b0;
        alpha_reg_2[3] <= 1'b0;
      end
      else begin
        if (enb) begin
          alpha_reg_2[0] <= alpha_reg_next_2[0];
          alpha_reg_2[1] <= alpha_reg_next_2[1];
          alpha_reg_2[2] <= alpha_reg_next_2[2];
          alpha_reg_2[3] <= alpha_reg_next_2[3];
        end
      end
    end

  assign Delay11_out1_vStart = alpha_reg_2[3];
  assign alpha_reg_next_2[0] = IterativeFilter_out2_vStart;
  assign alpha_reg_next_2[1] = alpha_reg_2[0];
  assign alpha_reg_next_2[2] = alpha_reg_2[1];
  assign alpha_reg_next_2[3] = alpha_reg_2[2];



  always @(posedge clk or posedge reset)
    begin : c_13_process
      if (reset == 1'b1) begin
        alpha_reg_3[0] <= 1'b0;
        alpha_reg_3[1] <= 1'b0;
        alpha_reg_3[2] <= 1'b0;
        alpha_reg_3[3] <= 1'b0;
      end
      else begin
        if (enb) begin
          alpha_reg_3[0] <= alpha_reg_next_3[0];
          alpha_reg_3[1] <= alpha_reg_next_3[1];
          alpha_reg_3[2] <= alpha_reg_next_3[2];
          alpha_reg_3[3] <= alpha_reg_next_3[3];
        end
      end
    end

  assign Delay11_out1_vEnd = alpha_reg_3[3];
  assign alpha_reg_next_3[0] = IterativeFilter_out2_vEnd;
  assign alpha_reg_next_3[1] = alpha_reg_3[0];
  assign alpha_reg_next_3[2] = alpha_reg_3[1];
  assign alpha_reg_next_3[3] = alpha_reg_3[2];



  always @(posedge clk or posedge reset)
    begin : c_14_process
      if (reset == 1'b1) begin
        alpha_reg_4[0] <= 1'b0;
        alpha_reg_4[1] <= 1'b0;
        alpha_reg_4[2] <= 1'b0;
        alpha_reg_4[3] <= 1'b0;
      end
      else begin
        if (enb) begin
          alpha_reg_4[0] <= alpha_reg_next_4[0];
          alpha_reg_4[1] <= alpha_reg_next_4[1];
          alpha_reg_4[2] <= alpha_reg_next_4[2];
          alpha_reg_4[3] <= alpha_reg_next_4[3];
        end
      end
    end

  assign Delay11_out1_valid = alpha_reg_4[3];
  assign alpha_reg_next_4[0] = IterativeFilter_out2_valid;
  assign alpha_reg_next_4[1] = alpha_reg_4[0];
  assign alpha_reg_next_4[2] = alpha_reg_4[1];
  assign alpha_reg_next_4[3] = alpha_reg_4[2];



  Pixel_Stream_Aligner u_Pixel_Stream_Aligner (.clk(clk),
                                               .reset(reset),
                                               .enb(clk_enable),
                                               .in0_0(pixelIn_0),  // uint8
                                               .in0_1(pixelIn_1),  // uint8
                                               .in0_2(pixelIn_2),  // uint8
                                               .in1_hStart(ctrlIn_hStart),
                                               .in1_hEnd(ctrlIn_hEnd),
                                               .in1_vStart(ctrlIn_vStart),
                                               .in1_vEnd(ctrlIn_vEnd),
                                               .in1_valid(ctrlIn_valid),
                                               .in2(Delay8_out1),  // ufix30_En22
                                               .in3_hStart(Delay11_out1_hStart),
                                               .in3_hEnd(Delay11_out1_hEnd),
                                               .in3_vStart(Delay11_out1_vStart),
                                               .in3_vEnd(Delay11_out1_vEnd),
                                               .in3_valid(Delay11_out1_valid),
                                               .out0_0(Pixel_Stream_Aligner_out1_0),  // uint8
                                               .out0_1(Pixel_Stream_Aligner_out1_1),  // uint8
                                               .out0_2(Pixel_Stream_Aligner_out1_2),  // uint8
                                               .out1(Pixel_Stream_Aligner_out2),  // ufix30_En22
                                               .out2_hStart(Pixel_Stream_Aligner_out3_hStart),
                                               .out2_hEnd(Pixel_Stream_Aligner_out3_hEnd),
                                               .out2_vStart(Pixel_Stream_Aligner_out3_vStart),
                                               .out2_vEnd(Pixel_Stream_Aligner_out3_vEnd),
                                               .out2_valid(Pixel_Stream_Aligner_out3_valid)
                                               );

  assign Pixel_Stream_Aligner_out1[0] = Pixel_Stream_Aligner_out1_0;
  assign Pixel_Stream_Aligner_out1[1] = Pixel_Stream_Aligner_out1_1;
  assign Pixel_Stream_Aligner_out1[2] = Pixel_Stream_Aligner_out1_2;

  always @(posedge clk or posedge reset)
    begin : Delay3_process
      if (reset == 1'b1) begin
        Delay3_out1[0] <= 8'b00000000;
        Delay3_out1[1] <= 8'b00000000;
        Delay3_out1[2] <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay3_out1[0] <= Pixel_Stream_Aligner_out1[0];
          Delay3_out1[1] <= Pixel_Stream_Aligner_out1[1];
          Delay3_out1[2] <= Pixel_Stream_Aligner_out1[2];
        end
      end
    end



  always @(posedge clk or posedge reset)
    begin : Delay4_process
      if (reset == 1'b1) begin
        Delay4_out1 <= 30'b000000000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= Pixel_Stream_Aligner_out2;
        end
      end
    end



  assign Enhance_ment_mul_temp = Delay3_out1[0] * Delay4_out1;
  assign Enhance_ment_out1[0] = ((Enhance_ment_mul_temp[37:30] != 8'b00000000) || ((Enhance_ment_mul_temp[37] == 1'b0) && (Enhance_ment_mul_temp[29:22] == 8'b11111111)) ? 8'b11111111 :
              Enhance_ment_mul_temp[29:22] + Enhance_ment_mul_temp[21]);
  assign Enhance_ment_mul_temp_1 = Delay3_out1[1] * Delay4_out1;
  assign Enhance_ment_out1[1] = ((Enhance_ment_mul_temp_1[37:30] != 8'b00000000) || ((Enhance_ment_mul_temp_1[37] == 1'b0) && (Enhance_ment_mul_temp_1[29:22] == 8'b11111111)) ? 8'b11111111 :
              Enhance_ment_mul_temp_1[29:22] + Enhance_ment_mul_temp_1[21]);
  assign Enhance_ment_mul_temp_2 = Delay3_out1[2] * Delay4_out1;
  assign Enhance_ment_out1[2] = ((Enhance_ment_mul_temp_2[37:30] != 8'b00000000) || ((Enhance_ment_mul_temp_2[37] == 1'b0) && (Enhance_ment_mul_temp_2[29:22] == 8'b11111111)) ? 8'b11111111 :
              Enhance_ment_mul_temp_2[29:22] + Enhance_ment_mul_temp_2[21]);



  assign pixelOut_0 = Enhance_ment_out1[0];

  assign pixelOut_1 = Enhance_ment_out1[1];

  assign pixelOut_2 = Enhance_ment_out1[2];

  always @(posedge clk or posedge reset)
    begin : c_15_process
      if (reset == 1'b1) begin
        Delay5_out1_hStart <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay5_out1_hStart <= Pixel_Stream_Aligner_out3_hStart;
        end
      end
    end



  assign ctrlOut_hStart = Delay5_out1_hStart;

  always @(posedge clk or posedge reset)
    begin : c_16_process
      if (reset == 1'b1) begin
        Delay5_out1_hEnd <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay5_out1_hEnd <= Pixel_Stream_Aligner_out3_hEnd;
        end
      end
    end



  assign ctrlOut_hEnd = Delay5_out1_hEnd;

  always @(posedge clk or posedge reset)
    begin : c_17_process
      if (reset == 1'b1) begin
        Delay5_out1_vStart <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay5_out1_vStart <= Pixel_Stream_Aligner_out3_vStart;
        end
      end
    end



  assign ctrlOut_vStart = Delay5_out1_vStart;

  always @(posedge clk or posedge reset)
    begin : c_18_process
      if (reset == 1'b1) begin
        Delay5_out1_vEnd <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay5_out1_vEnd <= Pixel_Stream_Aligner_out3_vEnd;
        end
      end
    end



  assign ctrlOut_vEnd = Delay5_out1_vEnd;

  always @(posedge clk or posedge reset)
    begin : c_19_process
      if (reset == 1'b1) begin
        Delay5_out1_valid <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay5_out1_valid <= Pixel_Stream_Aligner_out3_valid;
        end
      end
    end



  assign ctrlOut_valid = Delay5_out1_valid;

  assign ce_out = clk_enable;

endmodule  // LLEHDL

