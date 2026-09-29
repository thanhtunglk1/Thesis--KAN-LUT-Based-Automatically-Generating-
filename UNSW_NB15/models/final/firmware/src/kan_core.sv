import kan_core_pkg::*;
import layer_0_lut_pkg::*;
import layer_1_lut_pkg::*;
import layer_2_lut_pkg::*;

module kan_core (
    input  logic                                       i_clk   ,
    input  logic                                       i_rst_n ,
    input  logic                                       i_en    ,
    input  logic [IN_FEATURES  - 1:0][IN_WIDTH  - 1:0] i_vector,
    output logic [OUT_FEATURES - 1:0][OUT_WIDTH - 1:0] o_vector
);
    // Signal declarations
    // Layer 0: 42 -> 64
    logic  [5:0] acts_0_0_0, acts_0_0_2, acts_0_0_6, acts_0_0_8, acts_0_0_12, acts_0_0_13, acts_0_0_14, acts_0_0_15, acts_0_0_16, acts_0_0_17, acts_0_0_18, acts_0_0_25, acts_0_0_28, acts_0_0_29, acts_0_0_33, acts_0_0_34;
    logic  [5:0] acts_0_0_37, acts_0_0_39, acts_0_0_40, acts_0_1_2, acts_0_1_3, acts_0_1_6, acts_0_1_8, acts_0_1_9, acts_0_1_12, acts_0_1_14, acts_0_1_16, acts_0_1_17, acts_0_1_19, acts_0_1_21, acts_0_1_22, acts_0_1_24;
    logic  [5:0] acts_0_1_26, acts_0_1_29, acts_0_1_31, acts_0_1_33, acts_0_1_36, acts_0_1_39, acts_0_2_0, acts_0_2_1, acts_0_2_2, acts_0_2_3, acts_0_2_7, acts_0_2_9, acts_0_2_11, acts_0_2_17, acts_0_2_19, acts_0_2_24;
    logic  [5:0] acts_0_2_26, acts_0_2_29, acts_0_2_34, acts_0_2_35, acts_0_2_36, acts_0_2_40, acts_0_2_41, acts_0_3_0, acts_0_3_1, acts_0_3_2, acts_0_3_4, acts_0_3_6, acts_0_3_7, acts_0_3_8, acts_0_3_9, acts_0_3_11;
    logic  [5:0] acts_0_3_12, acts_0_3_16, acts_0_3_17, acts_0_3_19, acts_0_3_20, acts_0_3_23, acts_0_3_24, acts_0_3_25, acts_0_3_31, acts_0_3_33, acts_0_3_34, acts_0_3_36, acts_0_3_37, acts_0_3_38, acts_0_4_0, acts_0_4_1;
    logic  [5:0] acts_0_4_2, acts_0_4_4, acts_0_4_6, acts_0_4_9, acts_0_4_10, acts_0_4_11, acts_0_4_12, acts_0_4_14, acts_0_4_16, acts_0_4_17, acts_0_4_18, acts_0_4_21, acts_0_4_23, acts_0_4_29, acts_0_4_34, acts_0_4_35;
    logic  [5:0] acts_0_4_36, acts_0_4_37, acts_0_4_38, acts_0_4_39, acts_0_4_40, acts_0_5_0, acts_0_5_2, acts_0_5_4, acts_0_5_5, acts_0_5_6, acts_0_5_10, acts_0_5_12, acts_0_5_13, acts_0_5_14, acts_0_5_16, acts_0_5_17;
    logic  [5:0] acts_0_5_21, acts_0_5_23, acts_0_5_24, acts_0_5_26, acts_0_5_29, acts_0_5_30, acts_0_5_36, acts_0_5_38, acts_0_5_39, acts_0_5_40, acts_0_6_0, acts_0_6_1, acts_0_6_3, acts_0_6_4, acts_0_6_5, acts_0_6_7;
    logic  [5:0] acts_0_6_10, acts_0_6_13, acts_0_6_16, acts_0_6_19, acts_0_6_24, acts_0_6_29, acts_0_6_33, acts_0_6_34, acts_0_6_37, acts_0_6_38, acts_0_6_40, acts_0_7_0, acts_0_7_2, acts_0_7_3, acts_0_7_7, acts_0_7_9;
    logic  [5:0] acts_0_7_15, acts_0_7_16, acts_0_7_18, acts_0_7_26, acts_0_7_29, acts_0_7_31, acts_0_7_32, acts_0_7_33, acts_0_7_35, acts_0_7_36, acts_0_7_38, acts_0_7_39, acts_0_7_40, acts_0_8_1, acts_0_8_2, acts_0_8_3;
    logic  [5:0] acts_0_8_4, acts_0_8_5, acts_0_8_7, acts_0_8_9, acts_0_8_11, acts_0_8_12, acts_0_8_13, acts_0_8_16, acts_0_8_17, acts_0_8_18, acts_0_8_20, acts_0_8_21, acts_0_8_26, acts_0_8_29, acts_0_8_30, acts_0_8_32;
    logic  [5:0] acts_0_8_33, acts_0_8_34, acts_0_8_37, acts_0_9_1, acts_0_9_2, acts_0_9_3, acts_0_9_4, acts_0_9_5, acts_0_9_6, acts_0_9_10, acts_0_9_13, acts_0_9_16, acts_0_9_19, acts_0_9_21, acts_0_9_22, acts_0_9_25;
    logic  [5:0] acts_0_9_26, acts_0_9_27, acts_0_9_28, acts_0_9_29, acts_0_9_33, acts_0_9_34, acts_0_9_35, acts_0_9_36, acts_0_9_39, acts_0_9_40, acts_0_10_1, acts_0_10_3, acts_0_10_5, acts_0_10_9, acts_0_10_11, acts_0_10_13;
    logic  [5:0] acts_0_10_17, acts_0_10_18, acts_0_10_19, acts_0_10_20, acts_0_10_21, acts_0_10_22, acts_0_10_23, acts_0_10_24, acts_0_10_29, acts_0_10_30, acts_0_10_32, acts_0_10_33, acts_0_10_34, acts_0_10_36, acts_0_10_37, acts_0_10_38;
    logic  [5:0] acts_0_10_39, acts_0_10_41, acts_0_11_0, acts_0_11_1, acts_0_11_2, acts_0_11_3, acts_0_11_5, acts_0_11_6, acts_0_11_11, acts_0_11_12, acts_0_11_14, acts_0_11_19, acts_0_11_25, acts_0_11_26, acts_0_11_34, acts_0_11_37;
    logic  [5:0] acts_0_11_39, acts_0_11_40, acts_0_11_41, acts_0_12_0, acts_0_12_1, acts_0_12_2, acts_0_12_3, acts_0_12_13, acts_0_12_14, acts_0_12_16, acts_0_12_17, acts_0_12_21, acts_0_12_25, acts_0_12_31, acts_0_12_36, acts_0_12_40;
    logic  [5:0] acts_0_13_0, acts_0_13_1, acts_0_13_2, acts_0_13_7, acts_0_13_8, acts_0_13_9, acts_0_13_10, acts_0_13_11, acts_0_13_16, acts_0_13_17, acts_0_13_19, acts_0_13_21, acts_0_13_29, acts_0_13_31, acts_0_13_34, acts_0_13_36;
    logic  [5:0] acts_0_13_38, acts_0_13_40, acts_0_14_0, acts_0_14_1, acts_0_14_2, acts_0_14_4, acts_0_14_7, acts_0_14_9, acts_0_14_10, acts_0_14_12, acts_0_14_14, acts_0_14_15, acts_0_14_16, acts_0_14_17, acts_0_14_18, acts_0_14_19;
    logic  [5:0] acts_0_14_20, acts_0_14_25, acts_0_14_34, acts_0_14_36, acts_0_14_39, acts_0_15_1, acts_0_15_5, acts_0_15_7, acts_0_15_9, acts_0_15_12, acts_0_15_14, acts_0_15_18, acts_0_15_20, acts_0_15_21, acts_0_15_22, acts_0_15_23;
    logic  [5:0] acts_0_15_24, acts_0_15_26, acts_0_15_28, acts_0_15_29, acts_0_15_30, acts_0_15_32, acts_0_15_33, acts_0_15_35, acts_0_15_36, acts_0_15_37, acts_0_15_38, acts_0_15_40, acts_0_16_0, acts_0_16_1, acts_0_16_3, acts_0_16_5;
    logic  [5:0] acts_0_16_6, acts_0_16_7, acts_0_16_9, acts_0_16_11, acts_0_16_13, acts_0_16_16, acts_0_16_17, acts_0_16_19, acts_0_16_22, acts_0_16_23, acts_0_16_24, acts_0_16_32, acts_0_16_37, acts_0_16_40, acts_0_17_0, acts_0_17_2;
    logic  [5:0] acts_0_17_9, acts_0_17_12, acts_0_17_13, acts_0_17_16, acts_0_17_17, acts_0_17_21, acts_0_17_23, acts_0_17_25, acts_0_17_26, acts_0_17_29, acts_0_17_30, acts_0_17_33, acts_0_17_34, acts_0_17_35, acts_0_17_39, acts_0_17_40;
    logic  [5:0] acts_0_18_0, acts_0_18_1, acts_0_18_2, acts_0_18_5, acts_0_18_7, acts_0_18_15, acts_0_18_16, acts_0_18_17, acts_0_18_19, acts_0_18_21, acts_0_18_22, acts_0_18_23, acts_0_18_24, acts_0_18_28, acts_0_18_29, acts_0_18_31;
    logic  [5:0] acts_0_18_32, acts_0_18_33, acts_0_18_34, acts_0_18_36, acts_0_18_39, acts_0_18_40, acts_0_19_1, acts_0_19_3, acts_0_19_4, acts_0_19_7, acts_0_19_8, acts_0_19_9, acts_0_19_11, acts_0_19_12, acts_0_19_13, acts_0_19_16;
    logic  [5:0] acts_0_19_17, acts_0_19_24, acts_0_19_26, acts_0_19_27, acts_0_19_28, acts_0_19_29, acts_0_19_30, acts_0_19_31, acts_0_19_33, acts_0_19_35, acts_0_19_37, acts_0_19_38, acts_0_20_1, acts_0_20_2, acts_0_20_3, acts_0_20_5;
    logic  [5:0] acts_0_20_8, acts_0_20_9, acts_0_20_10, acts_0_20_11, acts_0_20_13, acts_0_20_15, acts_0_20_16, acts_0_20_17, acts_0_20_19, acts_0_20_20, acts_0_20_22, acts_0_20_23, acts_0_20_24, acts_0_20_26, acts_0_20_28, acts_0_20_30;
    logic  [5:0] acts_0_20_33, acts_0_20_34, acts_0_20_35, acts_0_20_36, acts_0_21_0, acts_0_21_2, acts_0_21_3, acts_0_21_4, acts_0_21_6, acts_0_21_8, acts_0_21_9, acts_0_21_11, acts_0_21_13, acts_0_21_15, acts_0_21_16, acts_0_21_17;
    logic  [5:0] acts_0_21_19, acts_0_21_20, acts_0_21_22, acts_0_21_23, acts_0_21_24, acts_0_21_26, acts_0_21_28, acts_0_21_29, acts_0_21_33, acts_0_21_34, acts_0_21_35, acts_0_21_36, acts_0_21_38, acts_0_21_40, acts_0_22_0, acts_0_22_4;
    logic  [5:0] acts_0_22_7, acts_0_22_12, acts_0_22_14, acts_0_22_15, acts_0_22_16, acts_0_22_17, acts_0_22_18, acts_0_22_22, acts_0_22_27, acts_0_22_28, acts_0_22_30, acts_0_22_33, acts_0_22_35, acts_0_22_37, acts_0_22_38, acts_0_22_39;
    logic  [5:0] acts_0_22_40, acts_0_22_41, acts_0_23_0, acts_0_23_2, acts_0_23_3, acts_0_23_11, acts_0_23_12, acts_0_23_13, acts_0_23_16, acts_0_23_17, acts_0_23_22, acts_0_23_25, acts_0_23_27, acts_0_23_29, acts_0_23_33, acts_0_23_36;
    logic  [5:0] acts_0_24_0, acts_0_24_1, acts_0_24_2, acts_0_24_3, acts_0_24_4, acts_0_24_5, acts_0_24_6, acts_0_24_7, acts_0_24_9, acts_0_24_11, acts_0_24_12, acts_0_24_15, acts_0_24_16, acts_0_24_17, acts_0_24_23, acts_0_24_29;
    logic  [5:0] acts_0_24_30, acts_0_24_31, acts_0_24_32, acts_0_24_33, acts_0_24_34, acts_0_24_37, acts_0_24_39, acts_0_24_40, acts_0_24_41, acts_0_25_1, acts_0_25_2, acts_0_25_4, acts_0_25_11, acts_0_25_12, acts_0_25_14, acts_0_25_16;
    logic  [5:0] acts_0_25_17, acts_0_25_18, acts_0_25_21, acts_0_25_22, acts_0_25_25, acts_0_25_28, acts_0_25_29, acts_0_25_33, acts_0_25_35, acts_0_25_37, acts_0_25_38, acts_0_25_39, acts_0_25_40, acts_0_26_1, acts_0_26_2, acts_0_26_3;
    logic  [5:0] acts_0_26_5, acts_0_26_6, acts_0_26_9, acts_0_26_10, acts_0_26_14, acts_0_26_15, acts_0_26_18, acts_0_26_21, acts_0_26_29, acts_0_26_34, acts_0_26_37, acts_0_26_38, acts_0_26_39, acts_0_26_40, acts_0_26_41, acts_0_27_0;
    logic  [5:0] acts_0_27_1, acts_0_27_4, acts_0_27_6, acts_0_27_8, acts_0_27_12, acts_0_27_14, acts_0_27_15, acts_0_27_16, acts_0_27_17, acts_0_27_18, acts_0_27_21, acts_0_27_25, acts_0_27_26, acts_0_27_29, acts_0_27_30, acts_0_27_31;
    logic  [5:0] acts_0_27_36, acts_0_27_37, acts_0_27_38, acts_0_27_39, acts_0_27_40, acts_0_28_1, acts_0_28_2, acts_0_28_4, acts_0_28_5, acts_0_28_6, acts_0_28_7, acts_0_28_8, acts_0_28_14, acts_0_28_18, acts_0_28_19, acts_0_28_21;
    logic  [5:0] acts_0_28_29, acts_0_28_32, acts_0_28_36, acts_0_28_37, acts_0_28_39, acts_0_28_40, acts_0_29_0, acts_0_29_1, acts_0_29_2, acts_0_29_3, acts_0_29_5, acts_0_29_6, acts_0_29_7, acts_0_29_9, acts_0_29_10, acts_0_29_13;
    logic  [5:0] acts_0_29_15, acts_0_29_16, acts_0_29_18, acts_0_29_19, acts_0_29_21, acts_0_29_23, acts_0_29_25, acts_0_29_26, acts_0_29_29, acts_0_29_30, acts_0_29_31, acts_0_29_34, acts_0_29_35, acts_0_29_40, acts_0_30_0, acts_0_30_2;
    logic  [5:0] acts_0_30_3, acts_0_30_4, acts_0_30_6, acts_0_30_8, acts_0_30_11, acts_0_30_13, acts_0_30_15, acts_0_30_16, acts_0_30_17, acts_0_30_35, acts_0_30_40, acts_0_31_0, acts_0_31_1, acts_0_31_9, acts_0_31_12, acts_0_31_14;
    logic  [5:0] acts_0_31_16, acts_0_31_17, acts_0_31_21, acts_0_31_22, acts_0_31_24, acts_0_31_25, acts_0_31_27, acts_0_31_29, acts_0_31_30, acts_0_31_32, acts_0_31_33, acts_0_31_35, acts_0_31_36, acts_0_32_1, acts_0_32_2, acts_0_32_6;
    logic  [5:0] acts_0_32_12, acts_0_32_13, acts_0_32_16, acts_0_32_17, acts_0_32_18, acts_0_32_19, acts_0_32_20, acts_0_32_21, acts_0_32_22, acts_0_32_24, acts_0_32_31, acts_0_32_34, acts_0_32_35, acts_0_32_38, acts_0_32_39, acts_0_32_41;
    logic  [5:0] acts_0_33_1, acts_0_33_4, acts_0_33_5, acts_0_33_6, acts_0_33_7, acts_0_33_10, acts_0_33_11, acts_0_33_12, acts_0_33_14, acts_0_33_16, acts_0_33_18, acts_0_33_19, acts_0_33_21, acts_0_33_26, acts_0_33_33, acts_0_33_34;
    logic  [5:0] acts_0_33_37, acts_0_33_38, acts_0_33_40, acts_0_33_41, acts_0_34_2, acts_0_34_6, acts_0_34_11, acts_0_34_14, acts_0_34_15, acts_0_34_16, acts_0_34_17, acts_0_34_19, acts_0_34_21, acts_0_34_24, acts_0_34_29, acts_0_34_30;
    logic  [5:0] acts_0_34_32, acts_0_34_33, acts_0_34_39, acts_0_34_41, acts_0_35_0, acts_0_35_1, acts_0_35_2, acts_0_35_5, acts_0_35_7, acts_0_35_8, acts_0_35_12, acts_0_35_13, acts_0_35_15, acts_0_35_16, acts_0_35_17, acts_0_35_21;
    logic  [5:0] acts_0_35_22, acts_0_35_24, acts_0_35_26, acts_0_35_27, acts_0_35_30, acts_0_35_31, acts_0_35_32, acts_0_35_35, acts_0_35_36, acts_0_35_40, acts_0_36_0, acts_0_36_1, acts_0_36_2, acts_0_36_4, acts_0_36_5, acts_0_36_7;
    logic  [5:0] acts_0_36_10, acts_0_36_11, acts_0_36_12, acts_0_36_13, acts_0_36_16, acts_0_36_17, acts_0_36_21, acts_0_36_26, acts_0_36_34, acts_0_36_36, acts_0_36_37, acts_0_37_1, acts_0_37_2, acts_0_37_5, acts_0_37_9, acts_0_37_10;
    logic  [5:0] acts_0_37_12, acts_0_37_13, acts_0_37_14, acts_0_37_15, acts_0_37_16, acts_0_37_18, acts_0_37_19, acts_0_37_21, acts_0_37_24, acts_0_37_25, acts_0_37_26, acts_0_37_31, acts_0_37_33, acts_0_37_34, acts_0_37_35, acts_0_37_36;
    logic  [5:0] acts_0_37_37, acts_0_37_38, acts_0_38_0, acts_0_38_2, acts_0_38_3, acts_0_38_4, acts_0_38_8, acts_0_38_9, acts_0_38_11, acts_0_38_12, acts_0_38_17, acts_0_38_23, acts_0_38_28, acts_0_38_34, acts_0_38_36, acts_0_38_38;
    logic  [5:0] acts_0_38_39, acts_0_38_40, acts_0_39_0, acts_0_39_1, acts_0_39_4, acts_0_39_5, acts_0_39_6, acts_0_39_9, acts_0_39_12, acts_0_39_13, acts_0_39_14, acts_0_39_17, acts_0_39_18, acts_0_39_19, acts_0_39_36, acts_0_39_37;
    logic  [5:0] acts_0_39_40, acts_0_40_2, acts_0_40_5, acts_0_40_6, acts_0_40_9, acts_0_40_10, acts_0_40_11, acts_0_40_12, acts_0_40_13, acts_0_40_14, acts_0_40_16, acts_0_40_20, acts_0_40_23, acts_0_40_24, acts_0_40_26, acts_0_40_31;
    logic  [5:0] acts_0_40_35, acts_0_40_36, acts_0_40_38, acts_0_40_39, acts_0_40_40, acts_0_41_0, acts_0_41_2, acts_0_41_4, acts_0_41_6, acts_0_41_7, acts_0_41_14, acts_0_41_16, acts_0_41_17, acts_0_41_25, acts_0_41_29, acts_0_41_37;
    logic  [5:0] acts_0_41_38, acts_0_41_41, acts_0_42_1, acts_0_42_2, acts_0_42_4, acts_0_42_5, acts_0_42_6, acts_0_42_9, acts_0_42_12, acts_0_42_16, acts_0_42_18, acts_0_42_20, acts_0_42_21, acts_0_42_25, acts_0_42_29, acts_0_42_33;
    logic  [5:0] acts_0_42_34, acts_0_42_35, acts_0_42_37, acts_0_42_40, acts_0_43_1, acts_0_43_7, acts_0_43_9, acts_0_43_14, acts_0_43_15, acts_0_43_16, acts_0_43_20, acts_0_43_21, acts_0_43_23, acts_0_43_25, acts_0_43_26, acts_0_43_28;
    logic  [5:0] acts_0_43_29, acts_0_43_33, acts_0_43_35, acts_0_43_37, acts_0_43_38, acts_0_43_39, acts_0_43_40, acts_0_44_0, acts_0_44_2, acts_0_44_8, acts_0_44_12, acts_0_44_14, acts_0_44_15, acts_0_44_17, acts_0_44_19, acts_0_44_20;
    logic  [5:0] acts_0_44_21, acts_0_44_32, acts_0_44_34, acts_0_44_35, acts_0_44_36, acts_0_44_38, acts_0_44_39, acts_0_45_1, acts_0_45_2, acts_0_45_3, acts_0_45_5, acts_0_45_8, acts_0_45_9, acts_0_45_13, acts_0_45_16, acts_0_45_20;
    logic  [5:0] acts_0_45_25, acts_0_45_26, acts_0_45_27, acts_0_45_34, acts_0_45_35, acts_0_45_37, acts_0_45_38, acts_0_45_39, acts_0_45_40, acts_0_46_0, acts_0_46_3, acts_0_46_4, acts_0_46_8, acts_0_46_9, acts_0_46_11, acts_0_46_12;
    logic  [5:0] acts_0_46_13, acts_0_46_14, acts_0_46_15, acts_0_46_16, acts_0_46_17, acts_0_46_18, acts_0_46_20, acts_0_46_21, acts_0_46_22, acts_0_46_23, acts_0_46_24, acts_0_46_29, acts_0_46_30, acts_0_46_31, acts_0_46_32, acts_0_46_33;
    logic  [5:0] acts_0_46_34, acts_0_46_35, acts_0_46_36, acts_0_46_38, acts_0_47_0, acts_0_47_2, acts_0_47_6, acts_0_47_7, acts_0_47_9, acts_0_47_10, acts_0_47_12, acts_0_47_13, acts_0_47_14, acts_0_47_15, acts_0_47_17, acts_0_47_18;
    logic  [5:0] acts_0_47_20, acts_0_47_21, acts_0_47_24, acts_0_47_25, acts_0_47_26, acts_0_47_32, acts_0_47_33, acts_0_47_36, acts_0_47_37, acts_0_47_39, acts_0_48_0, acts_0_48_1, acts_0_48_2, acts_0_48_5, acts_0_48_7, acts_0_48_11;
    logic  [5:0] acts_0_48_13, acts_0_48_15, acts_0_48_16, acts_0_48_23, acts_0_48_24, acts_0_48_26, acts_0_48_27, acts_0_48_28, acts_0_48_29, acts_0_48_30, acts_0_48_34, acts_0_48_38, acts_0_48_40, acts_0_49_1, acts_0_49_2, acts_0_49_4;
    logic  [5:0] acts_0_49_6, acts_0_49_12, acts_0_49_15, acts_0_49_17, acts_0_49_18, acts_0_49_21, acts_0_49_22, acts_0_49_24, acts_0_49_25, acts_0_49_26, acts_0_49_31, acts_0_49_32, acts_0_49_35, acts_0_49_36, acts_0_49_39, acts_0_49_40;
    logic  [5:0] acts_0_50_1, acts_0_50_2, acts_0_50_3, acts_0_50_4, acts_0_50_6, acts_0_50_7, acts_0_50_9, acts_0_50_11, acts_0_50_12, acts_0_50_14, acts_0_50_15, acts_0_50_17, acts_0_50_18, acts_0_50_19, acts_0_50_21, acts_0_50_24;
    logic  [5:0] acts_0_50_27, acts_0_50_29, acts_0_50_31, acts_0_50_32, acts_0_50_34, acts_0_50_36, acts_0_50_37, acts_0_50_39, acts_0_50_41, acts_0_51_2, acts_0_51_3, acts_0_51_4, acts_0_51_5, acts_0_51_7, acts_0_51_9, acts_0_51_14;
    logic  [5:0] acts_0_51_16, acts_0_51_21, acts_0_51_25, acts_0_51_26, acts_0_51_27, acts_0_51_29, acts_0_51_31, acts_0_51_33, acts_0_51_34, acts_0_51_36, acts_0_51_38, acts_0_52_1, acts_0_52_2, acts_0_52_3, acts_0_52_4, acts_0_52_5;
    logic  [5:0] acts_0_52_6, acts_0_52_8, acts_0_52_13, acts_0_52_15, acts_0_52_16, acts_0_52_18, acts_0_52_21, acts_0_52_24, acts_0_52_25, acts_0_52_29, acts_0_52_33, acts_0_52_34, acts_0_52_35, acts_0_52_36, acts_0_52_37, acts_0_52_40;
    logic  [5:0] acts_0_53_0, acts_0_53_2, acts_0_53_3, acts_0_53_7, acts_0_53_8, acts_0_53_12, acts_0_53_13, acts_0_53_14, acts_0_53_17, acts_0_53_19, acts_0_53_21, acts_0_53_22, acts_0_53_25, acts_0_53_33, acts_0_53_37, acts_0_53_39;
    logic  [5:0] acts_0_53_40, acts_0_54_1, acts_0_54_2, acts_0_54_3, acts_0_54_4, acts_0_54_6, acts_0_54_7, acts_0_54_9, acts_0_54_11, acts_0_54_13, acts_0_54_16, acts_0_54_17, acts_0_54_18, acts_0_54_19, acts_0_54_21, acts_0_54_34;
    logic  [5:0] acts_0_54_36, acts_0_54_40, acts_0_55_0, acts_0_55_1, acts_0_55_4, acts_0_55_7, acts_0_55_9, acts_0_55_12, acts_0_55_13, acts_0_55_14, acts_0_55_15, acts_0_55_17, acts_0_55_18, acts_0_55_19, acts_0_55_21, acts_0_55_24;
    logic  [5:0] acts_0_55_25, acts_0_55_26, acts_0_55_29, acts_0_55_31, acts_0_55_32, acts_0_55_37, acts_0_55_38, acts_0_55_40, acts_0_56_1, acts_0_56_2, acts_0_56_3, acts_0_56_4, acts_0_56_5, acts_0_56_6, acts_0_56_9, acts_0_56_11;
    logic  [5:0] acts_0_56_16, acts_0_56_17, acts_0_56_25, acts_0_56_27, acts_0_56_28, acts_0_56_29, acts_0_56_30, acts_0_56_34, acts_0_56_35, acts_0_56_36, acts_0_56_37, acts_0_56_38, acts_0_56_39, acts_0_56_40, acts_0_57_0, acts_0_57_4;
    logic  [5:0] acts_0_57_6, acts_0_57_11, acts_0_57_12, acts_0_57_13, acts_0_57_15, acts_0_57_17, acts_0_57_21, acts_0_57_24, acts_0_57_26, acts_0_57_27, acts_0_57_28, acts_0_57_29, acts_0_57_30, acts_0_57_31, acts_0_57_32, acts_0_57_33;
    logic  [5:0] acts_0_57_35, acts_0_57_36, acts_0_57_39, acts_0_58_0, acts_0_58_1, acts_0_58_2, acts_0_58_3, acts_0_58_4, acts_0_58_6, acts_0_58_7, acts_0_58_9, acts_0_58_12, acts_0_58_14, acts_0_58_16, acts_0_58_17, acts_0_58_18;
    logic  [5:0] acts_0_58_23, acts_0_58_24, acts_0_58_25, acts_0_58_26, acts_0_58_29, acts_0_58_31, acts_0_58_32, acts_0_58_33, acts_0_58_35, acts_0_58_37, acts_0_58_39, acts_0_59_0, acts_0_59_1, acts_0_59_3, acts_0_59_8, acts_0_59_12;
    logic  [5:0] acts_0_59_16, acts_0_59_17, acts_0_59_19, acts_0_59_20, acts_0_59_24, acts_0_59_26, acts_0_59_27, acts_0_59_31, acts_0_59_32, acts_0_59_33, acts_0_59_34, acts_0_59_36, acts_0_60_0, acts_0_60_3, acts_0_60_4, acts_0_60_12;
    logic  [5:0] acts_0_60_13, acts_0_60_16, acts_0_60_18, acts_0_60_19, acts_0_60_21, acts_0_60_23, acts_0_60_26, acts_0_60_29, acts_0_60_31, acts_0_60_32, acts_0_60_33, acts_0_60_36, acts_0_60_40, acts_0_61_1, acts_0_61_3, acts_0_61_4;
    logic  [5:0] acts_0_61_5, acts_0_61_6, acts_0_61_7, acts_0_61_9, acts_0_61_10, acts_0_61_11, acts_0_61_12, acts_0_61_13, acts_0_61_15, acts_0_61_16, acts_0_61_17, acts_0_61_18, acts_0_61_20, acts_0_61_21, acts_0_61_26, acts_0_61_28;
    logic  [5:0] acts_0_61_33, acts_0_61_34, acts_0_61_35, acts_0_61_37, acts_0_61_38, acts_0_61_39, acts_0_62_2, acts_0_62_3, acts_0_62_12, acts_0_62_14, acts_0_62_15, acts_0_62_18, acts_0_62_21, acts_0_62_25, acts_0_62_31, acts_0_62_32;
    logic  [5:0] acts_0_62_36, acts_0_62_38, acts_0_62_39, acts_0_63_0, acts_0_63_1, acts_0_63_2, acts_0_63_5, acts_0_63_6, acts_0_63_7, acts_0_63_8, acts_0_63_9, acts_0_63_10, acts_0_63_11, acts_0_63_12, acts_0_63_14, acts_0_63_16;
    logic  [5:0] acts_0_63_17, acts_0_63_18, acts_0_63_25, acts_0_63_26, acts_0_63_30, acts_0_63_34, acts_0_63_36, acts_0_63_37, acts_0_63_38, acts_0_63_39;
    logic  [5:0] out_0_0_sat, out_0_1_sat, out_0_2_sat, out_0_3_sat, out_0_4_sat, out_0_5_sat, out_0_6_sat, out_0_7_sat, out_0_8_sat, out_0_9_sat, out_0_10_sat, out_0_11_sat, out_0_12_sat, out_0_13_sat, out_0_14_sat, out_0_15_sat;
    logic  [5:0] out_0_16_sat, out_0_17_sat, out_0_18_sat, out_0_19_sat, out_0_20_sat, out_0_21_sat, out_0_22_sat, out_0_23_sat, out_0_24_sat, out_0_25_sat, out_0_26_sat, out_0_27_sat, out_0_28_sat, out_0_29_sat, out_0_30_sat, out_0_31_sat;
    logic  [5:0] out_0_32_sat, out_0_33_sat, out_0_34_sat, out_0_35_sat, out_0_36_sat, out_0_37_sat, out_0_38_sat, out_0_39_sat, out_0_40_sat, out_0_41_sat, out_0_42_sat, out_0_43_sat, out_0_44_sat, out_0_45_sat, out_0_46_sat, out_0_47_sat;
    logic  [5:0] out_0_48_sat, out_0_49_sat, out_0_50_sat, out_0_51_sat, out_0_52_sat, out_0_53_sat, out_0_54_sat, out_0_55_sat, out_0_56_sat, out_0_57_sat, out_0_58_sat, out_0_59_sat, out_0_60_sat, out_0_61_sat, out_0_62_sat, out_0_63_sat;
    logic  [5:0] out_0_0_reg, out_0_1_reg, out_0_2_reg, out_0_3_reg, out_0_4_reg, out_0_5_reg, out_0_6_reg, out_0_7_reg, out_0_8_reg, out_0_9_reg, out_0_10_reg, out_0_11_reg, out_0_12_reg, out_0_13_reg, out_0_14_reg, out_0_15_reg;
    logic  [5:0] out_0_16_reg, out_0_17_reg, out_0_18_reg, out_0_19_reg, out_0_20_reg, out_0_21_reg, out_0_22_reg, out_0_23_reg, out_0_24_reg, out_0_25_reg, out_0_26_reg, out_0_27_reg, out_0_28_reg, out_0_29_reg, out_0_30_reg, out_0_31_reg;
    logic  [5:0] out_0_32_reg, out_0_33_reg, out_0_34_reg, out_0_35_reg, out_0_36_reg, out_0_37_reg, out_0_38_reg, out_0_39_reg, out_0_40_reg, out_0_41_reg, out_0_42_reg, out_0_43_reg, out_0_44_reg, out_0_45_reg, out_0_46_reg, out_0_47_reg;
    logic  [5:0] out_0_48_reg, out_0_49_reg, out_0_50_reg, out_0_51_reg, out_0_52_reg, out_0_53_reg, out_0_54_reg, out_0_55_reg, out_0_56_reg, out_0_57_reg, out_0_58_reg, out_0_59_reg, out_0_60_reg, out_0_61_reg, out_0_62_reg, out_0_63_reg;

// Layer 1: 64 -> 32
    logic  [5:0] acts_1_0_2, acts_1_0_9, acts_1_0_11, acts_1_0_13, acts_1_0_16, acts_1_0_17, acts_1_0_18, acts_1_0_19, acts_1_0_22, acts_1_0_23, acts_1_0_25, acts_1_0_27, acts_1_0_28, acts_1_0_30, acts_1_0_35, acts_1_0_39;
    logic  [5:0] acts_1_0_44, acts_1_0_50, acts_1_0_54, acts_1_0_55, acts_1_0_56, acts_1_0_57, acts_1_0_60, acts_1_1_3, acts_1_1_4, acts_1_1_6, acts_1_1_14, acts_1_1_17, acts_1_1_18, acts_1_1_20, acts_1_1_26, acts_1_1_29;
    logic  [5:0] acts_1_1_32, acts_1_1_33, acts_1_1_34, acts_1_1_38, acts_1_1_39, acts_1_1_41, acts_1_1_42, acts_1_1_45, acts_1_1_46, acts_1_1_49, acts_1_1_52, acts_1_1_54, acts_1_1_56, acts_1_1_57, acts_1_1_60, acts_1_1_61;
    logic  [5:0] acts_1_1_63, acts_1_2_0, acts_1_2_1, acts_1_2_2, acts_1_2_4, acts_1_2_5, acts_1_2_9, acts_1_2_13, acts_1_2_14, acts_1_2_16, acts_1_2_18, acts_1_2_19, acts_1_2_24, acts_1_2_26, acts_1_2_29, acts_1_2_30;
    logic  [5:0] acts_1_2_35, acts_1_2_37, acts_1_2_38, acts_1_2_39, acts_1_2_41, acts_1_2_43, acts_1_2_44, acts_1_2_45, acts_1_2_46, acts_1_2_48, acts_1_2_52, acts_1_2_57, acts_1_2_59, acts_1_3_0, acts_1_3_1, acts_1_3_2;
    logic  [5:0] acts_1_3_4, acts_1_3_7, acts_1_3_14, acts_1_3_17, acts_1_3_19, acts_1_3_20, acts_1_3_22, acts_1_3_23, acts_1_3_25, acts_1_3_27, acts_1_3_29, acts_1_3_31, acts_1_3_32, acts_1_3_35, acts_1_3_38, acts_1_3_39;
    logic  [5:0] acts_1_3_42, acts_1_3_45, acts_1_3_46, acts_1_3_48, acts_1_3_49, acts_1_3_54, acts_1_3_55, acts_1_3_57, acts_1_3_60, acts_1_3_62, acts_1_3_63, acts_1_4_0, acts_1_4_3, acts_1_4_4, acts_1_4_8, acts_1_4_9;
    logic  [5:0] acts_1_4_13, acts_1_4_14, acts_1_4_16, acts_1_4_19, acts_1_4_23, acts_1_4_24, acts_1_4_25, acts_1_4_26, acts_1_4_27, acts_1_4_28, acts_1_4_30, acts_1_4_32, acts_1_4_35, acts_1_4_37, acts_1_4_39, acts_1_4_41;
    logic  [5:0] acts_1_4_42, acts_1_4_43, acts_1_4_45, acts_1_4_48, acts_1_4_49, acts_1_4_50, acts_1_4_51, acts_1_4_52, acts_1_4_54, acts_1_4_56, acts_1_4_59, acts_1_4_61, acts_1_4_62, acts_1_4_63, acts_1_5_0, acts_1_5_2;
    logic  [5:0] acts_1_5_4, acts_1_5_6, acts_1_5_7, acts_1_5_8, acts_1_5_11, acts_1_5_17, acts_1_5_18, acts_1_5_23, acts_1_5_24, acts_1_5_25, acts_1_5_27, acts_1_5_29, acts_1_5_31, acts_1_5_34, acts_1_5_37, acts_1_5_39;
    logic  [5:0] acts_1_5_48, acts_1_5_49, acts_1_5_51, acts_1_5_54, acts_1_5_55, acts_1_5_56, acts_1_5_58, acts_1_5_59, acts_1_5_60, acts_1_5_61, acts_1_5_62, acts_1_6_1, acts_1_6_2, acts_1_6_7, acts_1_6_8, acts_1_6_9;
    logic  [5:0] acts_1_6_11, acts_1_6_12, acts_1_6_13, acts_1_6_14, acts_1_6_15, acts_1_6_16, acts_1_6_18, acts_1_6_21, acts_1_6_26, acts_1_6_27, acts_1_6_30, acts_1_6_31, acts_1_6_33, acts_1_6_34, acts_1_6_35, acts_1_6_36;
    logic  [5:0] acts_1_6_38, acts_1_6_39, acts_1_6_44, acts_1_6_46, acts_1_6_47, acts_1_6_50, acts_1_6_53, acts_1_6_55, acts_1_6_57, acts_1_6_59, acts_1_6_60, acts_1_6_62, acts_1_7_0, acts_1_7_1, acts_1_7_4, acts_1_7_9;
    logic  [5:0] acts_1_7_10, acts_1_7_11, acts_1_7_13, acts_1_7_14, acts_1_7_16, acts_1_7_18, acts_1_7_20, acts_1_7_21, acts_1_7_24, acts_1_7_25, acts_1_7_26, acts_1_7_28, acts_1_7_30, acts_1_7_31, acts_1_7_33, acts_1_7_35;
    logic  [5:0] acts_1_7_36, acts_1_7_38, acts_1_7_39, acts_1_7_41, acts_1_7_45, acts_1_7_47, acts_1_7_49, acts_1_7_50, acts_1_7_53, acts_1_7_54, acts_1_7_55, acts_1_7_58, acts_1_7_59, acts_1_7_60, acts_1_7_63, acts_1_8_3;
    logic  [5:0] acts_1_8_6, acts_1_8_8, acts_1_8_9, acts_1_8_10, acts_1_8_14, acts_1_8_15, acts_1_8_16, acts_1_8_19, acts_1_8_20, acts_1_8_21, acts_1_8_25, acts_1_8_27, acts_1_8_30, acts_1_8_36, acts_1_8_37, acts_1_8_39;
    logic  [5:0] acts_1_8_40, acts_1_8_41, acts_1_8_42, acts_1_8_43, acts_1_8_46, acts_1_8_52, acts_1_8_53, acts_1_8_54, acts_1_8_55, acts_1_8_60, acts_1_8_61, acts_1_9_1, acts_1_9_2, acts_1_9_3, acts_1_9_5, acts_1_9_8;
    logic  [5:0] acts_1_9_9, acts_1_9_10, acts_1_9_12, acts_1_9_13, acts_1_9_14, acts_1_9_15, acts_1_9_16, acts_1_9_17, acts_1_9_19, acts_1_9_24, acts_1_9_25, acts_1_9_31, acts_1_9_36, acts_1_9_38, acts_1_9_39, acts_1_9_41;
    logic  [5:0] acts_1_9_51, acts_1_9_52, acts_1_9_54, acts_1_9_55, acts_1_9_58, acts_1_9_59, acts_1_9_60, acts_1_9_62, acts_1_10_0, acts_1_10_2, acts_1_10_4, acts_1_10_5, acts_1_10_6, acts_1_10_7, acts_1_10_9, acts_1_10_11;
    logic  [5:0] acts_1_10_12, acts_1_10_13, acts_1_10_17, acts_1_10_20, acts_1_10_23, acts_1_10_24, acts_1_10_26, acts_1_10_29, acts_1_10_30, acts_1_10_38, acts_1_10_39, acts_1_10_40, acts_1_10_41, acts_1_10_42, acts_1_10_45, acts_1_10_46;
    logic  [5:0] acts_1_10_50, acts_1_10_52, acts_1_10_54, acts_1_10_55, acts_1_10_56, acts_1_10_57, acts_1_10_60, acts_1_10_61, acts_1_11_0, acts_1_11_2, acts_1_11_3, acts_1_11_4, acts_1_11_5, acts_1_11_6, acts_1_11_8, acts_1_11_9;
    logic  [5:0] acts_1_11_10, acts_1_11_11, acts_1_11_12, acts_1_11_14, acts_1_11_15, acts_1_11_18, acts_1_11_20, acts_1_11_21, acts_1_11_25, acts_1_11_27, acts_1_11_28, acts_1_11_32, acts_1_11_33, acts_1_11_34, acts_1_11_36, acts_1_11_37;
    logic  [5:0] acts_1_11_43, acts_1_11_50, acts_1_11_52, acts_1_11_55, acts_1_11_62, acts_1_11_63, acts_1_12_2, acts_1_12_3, acts_1_12_7, acts_1_12_8, acts_1_12_12, acts_1_12_13, acts_1_12_14, acts_1_12_17, acts_1_12_18, acts_1_12_22;
    logic  [5:0] acts_1_12_23, acts_1_12_25, acts_1_12_26, acts_1_12_27, acts_1_12_28, acts_1_12_30, acts_1_12_32, acts_1_12_33, acts_1_12_34, acts_1_12_36, acts_1_12_37, acts_1_12_39, acts_1_12_43, acts_1_12_44, acts_1_12_46, acts_1_12_47;
    logic  [5:0] acts_1_12_49, acts_1_12_50, acts_1_12_51, acts_1_12_52, acts_1_12_53, acts_1_12_54, acts_1_12_55, acts_1_12_57, acts_1_12_59, acts_1_12_62, acts_1_12_63, acts_1_13_0, acts_1_13_2, acts_1_13_4, acts_1_13_9, acts_1_13_14;
    logic  [5:0] acts_1_13_15, acts_1_13_16, acts_1_13_18, acts_1_13_24, acts_1_13_26, acts_1_13_27, acts_1_13_28, acts_1_13_30, acts_1_13_39, acts_1_13_48, acts_1_13_52, acts_1_13_55, acts_1_13_57, acts_1_13_63, acts_1_14_0, acts_1_14_2;
    logic  [5:0] acts_1_14_4, acts_1_14_8, acts_1_14_10, acts_1_14_12, acts_1_14_14, acts_1_14_15, acts_1_14_18, acts_1_14_22, acts_1_14_24, acts_1_14_26, acts_1_14_27, acts_1_14_28, acts_1_14_29, acts_1_14_30, acts_1_14_34, acts_1_14_35;
    logic  [5:0] acts_1_14_39, acts_1_14_42, acts_1_14_43, acts_1_14_45, acts_1_14_46, acts_1_14_47, acts_1_14_50, acts_1_14_52, acts_1_14_53, acts_1_14_56, acts_1_14_58, acts_1_15_0, acts_1_15_1, acts_1_15_2, acts_1_15_3, acts_1_15_4;
    logic  [5:0] acts_1_15_6, acts_1_15_8, acts_1_15_9, acts_1_15_11, acts_1_15_12, acts_1_15_14, acts_1_15_15, acts_1_15_18, acts_1_15_19, acts_1_15_20, acts_1_15_22, acts_1_15_25, acts_1_15_26, acts_1_15_27, acts_1_15_30, acts_1_15_31;
    logic  [5:0] acts_1_15_33, acts_1_15_34, acts_1_15_36, acts_1_15_39, acts_1_15_42, acts_1_15_43, acts_1_15_44, acts_1_15_48, acts_1_15_49, acts_1_15_52, acts_1_15_55, acts_1_15_56, acts_1_15_58, acts_1_15_59, acts_1_15_60, acts_1_15_61;
    logic  [5:0] acts_1_15_63, acts_1_16_1, acts_1_16_3, acts_1_16_5, acts_1_16_6, acts_1_16_8, acts_1_16_9, acts_1_16_11, acts_1_16_12, acts_1_16_13, acts_1_16_14, acts_1_16_21, acts_1_16_22, acts_1_16_26, acts_1_16_30, acts_1_16_31;
    logic  [5:0] acts_1_16_34, acts_1_16_38, acts_1_16_39, acts_1_16_40, acts_1_16_41, acts_1_16_43, acts_1_16_45, acts_1_16_50, acts_1_16_51, acts_1_16_52, acts_1_16_54, acts_1_16_56, acts_1_16_61, acts_1_16_62, acts_1_16_63, acts_1_17_1;
    logic  [5:0] acts_1_17_2, acts_1_17_5, acts_1_17_7, acts_1_17_10, acts_1_17_11, acts_1_17_12, acts_1_17_13, acts_1_17_18, acts_1_17_19, acts_1_17_20, acts_1_17_21, acts_1_17_24, acts_1_17_28, acts_1_17_29, acts_1_17_30, acts_1_17_37;
    logic  [5:0] acts_1_17_39, acts_1_17_46, acts_1_17_47, acts_1_17_48, acts_1_17_50, acts_1_17_55, acts_1_17_57, acts_1_17_59, acts_1_17_60, acts_1_17_61, acts_1_17_63, acts_1_18_0, acts_1_18_1, acts_1_18_2, acts_1_18_6, acts_1_18_8;
    logic  [5:0] acts_1_18_9, acts_1_18_10, acts_1_18_13, acts_1_18_14, acts_1_18_15, acts_1_18_16, acts_1_18_17, acts_1_18_18, acts_1_18_19, acts_1_18_22, acts_1_18_24, acts_1_18_29, acts_1_18_31, acts_1_18_35, acts_1_18_36, acts_1_18_39;
    logic  [5:0] acts_1_18_45, acts_1_18_48, acts_1_18_49, acts_1_18_55, acts_1_18_59, acts_1_18_63, acts_1_19_1, acts_1_19_2, acts_1_19_3, acts_1_19_5, acts_1_19_6, acts_1_19_10, acts_1_19_14, acts_1_19_15, acts_1_19_22, acts_1_19_23;
    logic  [5:0] acts_1_19_24, acts_1_19_27, acts_1_19_29, acts_1_19_32, acts_1_19_33, acts_1_19_34, acts_1_19_37, acts_1_19_40, acts_1_19_44, acts_1_19_46, acts_1_19_57, acts_1_19_58, acts_1_19_63, acts_1_20_0, acts_1_20_3, acts_1_20_4;
    logic  [5:0] acts_1_20_5, acts_1_20_8, acts_1_20_9, acts_1_20_13, acts_1_20_17, acts_1_20_20, acts_1_20_21, acts_1_20_23, acts_1_20_24, acts_1_20_26, acts_1_20_29, acts_1_20_31, acts_1_20_32, acts_1_20_34, acts_1_20_36, acts_1_20_37;
    logic  [5:0] acts_1_20_39, acts_1_20_41, acts_1_20_42, acts_1_20_45, acts_1_20_46, acts_1_20_48, acts_1_20_50, acts_1_20_51, acts_1_20_52, acts_1_20_53, acts_1_20_56, acts_1_20_58, acts_1_20_59, acts_1_20_60, acts_1_21_2, acts_1_21_3;
    logic  [5:0] acts_1_21_4, acts_1_21_6, acts_1_21_7, acts_1_21_10, acts_1_21_12, acts_1_21_13, acts_1_21_14, acts_1_21_15, acts_1_21_16, acts_1_21_18, acts_1_21_20, acts_1_21_22, acts_1_21_29, acts_1_21_30, acts_1_21_31, acts_1_21_33;
    logic  [5:0] acts_1_21_35, acts_1_21_36, acts_1_21_39, acts_1_21_41, acts_1_21_42, acts_1_21_47, acts_1_21_48, acts_1_21_50, acts_1_21_53, acts_1_21_54, acts_1_21_57, acts_1_21_58, acts_1_21_59, acts_1_21_61, acts_1_22_0, acts_1_22_1;
    logic  [5:0] acts_1_22_2, acts_1_22_6, acts_1_22_8, acts_1_22_9, acts_1_22_11, acts_1_22_12, acts_1_22_13, acts_1_22_16, acts_1_22_18, acts_1_22_19, acts_1_22_20, acts_1_22_22, acts_1_22_23, acts_1_22_24, acts_1_22_25, acts_1_22_26;
    logic  [5:0] acts_1_22_29, acts_1_22_30, acts_1_22_32, acts_1_22_33, acts_1_22_35, acts_1_22_36, acts_1_22_37, acts_1_22_38, acts_1_22_39, acts_1_22_45, acts_1_22_49, acts_1_22_50, acts_1_22_51, acts_1_22_52, acts_1_22_54, acts_1_22_58;
    logic  [5:0] acts_1_22_59, acts_1_22_61, acts_1_22_62, acts_1_23_1, acts_1_23_3, acts_1_23_4, acts_1_23_5, acts_1_23_6, acts_1_23_8, acts_1_23_10, acts_1_23_14, acts_1_23_15, acts_1_23_20, acts_1_23_26, acts_1_23_30, acts_1_23_36;
    logic  [5:0] acts_1_23_39, acts_1_23_43, acts_1_23_44, acts_1_23_45, acts_1_23_50, acts_1_23_56, acts_1_23_57, acts_1_23_58, acts_1_23_61, acts_1_24_0, acts_1_24_1, acts_1_24_2, acts_1_24_9, acts_1_24_10, acts_1_24_12, acts_1_24_13;
    logic  [5:0] acts_1_24_14, acts_1_24_15, acts_1_24_16, acts_1_24_18, acts_1_24_19, acts_1_24_24, acts_1_24_28, acts_1_24_30, acts_1_24_32, acts_1_24_35, acts_1_24_38, acts_1_24_39, acts_1_24_40, acts_1_24_41, acts_1_24_42, acts_1_24_44;
    logic  [5:0] acts_1_24_47, acts_1_24_51, acts_1_24_52, acts_1_24_53, acts_1_24_55, acts_1_24_57, acts_1_24_58, acts_1_24_59, acts_1_24_60, acts_1_24_61, acts_1_24_63, acts_1_25_0, acts_1_25_3, acts_1_25_5, acts_1_25_7, acts_1_25_8;
    logic  [5:0] acts_1_25_9, acts_1_25_13, acts_1_25_17, acts_1_25_19, acts_1_25_20, acts_1_25_21, acts_1_25_23, acts_1_25_24, acts_1_25_26, acts_1_25_29, acts_1_25_30, acts_1_25_32, acts_1_25_34, acts_1_25_36, acts_1_25_37, acts_1_25_39;
    logic  [5:0] acts_1_25_40, acts_1_25_41, acts_1_25_42, acts_1_25_45, acts_1_25_46, acts_1_25_47, acts_1_25_48, acts_1_25_49, acts_1_25_51, acts_1_25_52, acts_1_25_53, acts_1_25_54, acts_1_25_55, acts_1_25_56, acts_1_25_58, acts_1_25_60;
    logic  [5:0] acts_1_25_61, acts_1_25_62, acts_1_26_6, acts_1_26_7, acts_1_26_8, acts_1_26_9, acts_1_26_10, acts_1_26_11, acts_1_26_13, acts_1_26_17, acts_1_26_18, acts_1_26_21, acts_1_26_22, acts_1_26_24, acts_1_26_28, acts_1_26_29;
    logic  [5:0] acts_1_26_31, acts_1_26_34, acts_1_26_36, acts_1_26_38, acts_1_26_39, acts_1_26_40, acts_1_26_43, acts_1_26_44, acts_1_26_45, acts_1_26_46, acts_1_26_47, acts_1_26_50, acts_1_26_51, acts_1_26_52, acts_1_26_54, acts_1_26_55;
    logic  [5:0] acts_1_26_56, acts_1_26_58, acts_1_27_0, acts_1_27_1, acts_1_27_4, acts_1_27_6, acts_1_27_8, acts_1_27_9, acts_1_27_11, acts_1_27_12, acts_1_27_15, acts_1_27_16, acts_1_27_18, acts_1_27_19, acts_1_27_22, acts_1_27_25;
    logic  [5:0] acts_1_27_27, acts_1_27_29, acts_1_27_33, acts_1_27_38, acts_1_27_40, acts_1_27_41, acts_1_27_43, acts_1_27_45, acts_1_27_47, acts_1_27_49, acts_1_27_54, acts_1_27_55, acts_1_27_56, acts_1_27_59, acts_1_28_0, acts_1_28_2;
    logic  [5:0] acts_1_28_4, acts_1_28_5, acts_1_28_6, acts_1_28_8, acts_1_28_9, acts_1_28_13, acts_1_28_14, acts_1_28_15, acts_1_28_16, acts_1_28_19, acts_1_28_20, acts_1_28_22, acts_1_28_25, acts_1_28_26, acts_1_28_27, acts_1_28_28;
    logic  [5:0] acts_1_28_29, acts_1_28_31, acts_1_28_33, acts_1_28_34, acts_1_28_36, acts_1_28_38, acts_1_28_39, acts_1_28_42, acts_1_28_49, acts_1_28_52, acts_1_28_54, acts_1_28_55, acts_1_28_56, acts_1_28_59, acts_1_28_62, acts_1_28_63;
    logic  [5:0] acts_1_29_0, acts_1_29_1, acts_1_29_2, acts_1_29_5, acts_1_29_10, acts_1_29_11, acts_1_29_12, acts_1_29_13, acts_1_29_14, acts_1_29_16, acts_1_29_17, acts_1_29_18, acts_1_29_21, acts_1_29_22, acts_1_29_23, acts_1_29_26;
    logic  [5:0] acts_1_29_29, acts_1_29_31, acts_1_29_33, acts_1_29_36, acts_1_29_37, acts_1_29_38, acts_1_29_40, acts_1_29_41, acts_1_29_44, acts_1_29_45, acts_1_29_50, acts_1_29_52, acts_1_29_53, acts_1_29_54, acts_1_29_55, acts_1_29_56;
    logic  [5:0] acts_1_29_57, acts_1_29_63, acts_1_30_0, acts_1_30_1, acts_1_30_3, acts_1_30_4, acts_1_30_13, acts_1_30_14, acts_1_30_17, acts_1_30_18, acts_1_30_19, acts_1_30_20, acts_1_30_21, acts_1_30_22, acts_1_30_24, acts_1_30_25;
    logic  [5:0] acts_1_30_27, acts_1_30_28, acts_1_30_30, acts_1_30_31, acts_1_30_32, acts_1_30_35, acts_1_30_36, acts_1_30_37, acts_1_30_41, acts_1_30_43, acts_1_30_44, acts_1_30_46, acts_1_30_47, acts_1_30_48, acts_1_30_49, acts_1_30_50;
    logic  [5:0] acts_1_30_51, acts_1_30_52, acts_1_30_53, acts_1_30_57, acts_1_30_62, acts_1_30_63, acts_1_31_4, acts_1_31_6, acts_1_31_7, acts_1_31_8, acts_1_31_9, acts_1_31_11, acts_1_31_16, acts_1_31_17, acts_1_31_19, acts_1_31_20;
    logic  [5:0] acts_1_31_21, acts_1_31_22, acts_1_31_23, acts_1_31_26, acts_1_31_29, acts_1_31_30, acts_1_31_32, acts_1_31_33, acts_1_31_34, acts_1_31_39, acts_1_31_40, acts_1_31_41, acts_1_31_42, acts_1_31_45, acts_1_31_48, acts_1_31_49;
    logic  [5:0] acts_1_31_52, acts_1_31_54, acts_1_31_56, acts_1_31_57, acts_1_31_58, acts_1_31_59, acts_1_31_60, acts_1_31_61, acts_1_31_62;
    logic  [5:0] out_1_0_sat, out_1_1_sat, out_1_2_sat, out_1_3_sat, out_1_4_sat, out_1_5_sat, out_1_6_sat, out_1_7_sat, out_1_8_sat, out_1_9_sat, out_1_10_sat, out_1_11_sat, out_1_12_sat, out_1_13_sat, out_1_14_sat, out_1_15_sat;
    logic  [5:0] out_1_16_sat, out_1_17_sat, out_1_18_sat, out_1_19_sat, out_1_20_sat, out_1_21_sat, out_1_22_sat, out_1_23_sat, out_1_24_sat, out_1_25_sat, out_1_26_sat, out_1_27_sat, out_1_28_sat, out_1_29_sat, out_1_30_sat, out_1_31_sat;
    logic  [5:0] out_1_0_reg, out_1_1_reg, out_1_2_reg, out_1_3_reg, out_1_4_reg, out_1_5_reg, out_1_6_reg, out_1_7_reg, out_1_8_reg, out_1_9_reg, out_1_10_reg, out_1_11_reg, out_1_12_reg, out_1_13_reg, out_1_14_reg, out_1_15_reg;
    logic  [5:0] out_1_16_reg, out_1_17_reg, out_1_18_reg, out_1_19_reg, out_1_20_reg, out_1_21_reg, out_1_22_reg, out_1_23_reg, out_1_24_reg, out_1_25_reg, out_1_26_reg, out_1_27_reg, out_1_28_reg, out_1_29_reg, out_1_30_reg, out_1_31_reg;

// Layer 2: 32 -> 10
    logic  [5:0] acts_2_0_0, acts_2_0_1, acts_2_0_2, acts_2_0_3, acts_2_0_4, acts_2_0_5, acts_2_0_6, acts_2_0_7, acts_2_0_8, acts_2_0_9, acts_2_0_10, acts_2_0_11, acts_2_0_12, acts_2_0_13, acts_2_0_14, acts_2_0_15;
    logic  [5:0] acts_2_0_16, acts_2_0_17, acts_2_0_18, acts_2_0_20, acts_2_0_21, acts_2_0_22, acts_2_0_23, acts_2_0_24, acts_2_0_25, acts_2_0_26, acts_2_0_27, acts_2_0_28, acts_2_0_31, acts_2_1_0, acts_2_1_1, acts_2_1_2;
    logic  [5:0] acts_2_1_3, acts_2_1_4, acts_2_1_6, acts_2_1_7, acts_2_1_8, acts_2_1_9, acts_2_1_11, acts_2_1_12, acts_2_1_13, acts_2_1_14, acts_2_1_15, acts_2_1_17, acts_2_1_18, acts_2_1_19, acts_2_1_20, acts_2_1_21;
    logic  [5:0] acts_2_1_22, acts_2_1_24, acts_2_1_26, acts_2_1_27, acts_2_1_28, acts_2_1_29, acts_2_1_30, acts_2_1_31, acts_2_2_0, acts_2_2_1, acts_2_2_2, acts_2_2_3, acts_2_2_4, acts_2_2_6, acts_2_2_7, acts_2_2_9;
    logic  [5:0] acts_2_2_12, acts_2_2_13, acts_2_2_14, acts_2_2_15, acts_2_2_16, acts_2_2_17, acts_2_2_19, acts_2_2_20, acts_2_2_21, acts_2_2_22, acts_2_2_23, acts_2_2_24, acts_2_2_25, acts_2_2_27, acts_2_2_28, acts_2_2_29;
    logic  [5:0] acts_2_2_30, acts_2_2_31, acts_2_3_0, acts_2_3_1, acts_2_3_2, acts_2_3_3, acts_2_3_4, acts_2_3_5, acts_2_3_6, acts_2_3_9, acts_2_3_10, acts_2_3_11, acts_2_3_12, acts_2_3_14, acts_2_3_15, acts_2_3_16;
    logic  [5:0] acts_2_3_17, acts_2_3_18, acts_2_3_19, acts_2_3_20, acts_2_3_21, acts_2_3_23, acts_2_3_24, acts_2_3_25, acts_2_3_26, acts_2_3_28, acts_2_3_29, acts_2_3_31, acts_2_4_0, acts_2_4_1, acts_2_4_2, acts_2_4_4;
    logic  [5:0] acts_2_4_5, acts_2_4_6, acts_2_4_7, acts_2_4_8, acts_2_4_9, acts_2_4_10, acts_2_4_11, acts_2_4_12, acts_2_4_13, acts_2_4_14, acts_2_4_15, acts_2_4_16, acts_2_4_17, acts_2_4_18, acts_2_4_19, acts_2_4_21;
    logic  [5:0] acts_2_4_22, acts_2_4_24, acts_2_4_26, acts_2_4_27, acts_2_4_28, acts_2_4_29, acts_2_4_30, acts_2_4_31, acts_2_5_1, acts_2_5_2, acts_2_5_3, acts_2_5_4, acts_2_5_5, acts_2_5_6, acts_2_5_7, acts_2_5_10;
    logic  [5:0] acts_2_5_11, acts_2_5_12, acts_2_5_13, acts_2_5_14, acts_2_5_15, acts_2_5_16, acts_2_5_17, acts_2_5_18, acts_2_5_19, acts_2_5_20, acts_2_5_24, acts_2_5_25, acts_2_5_26, acts_2_5_27, acts_2_5_28, acts_2_5_29;
    logic  [5:0] acts_2_6_0, acts_2_6_1, acts_2_6_2, acts_2_6_3, acts_2_6_4, acts_2_6_5, acts_2_6_6, acts_2_6_7, acts_2_6_8, acts_2_6_9, acts_2_6_10, acts_2_6_11, acts_2_6_12, acts_2_6_13, acts_2_6_14, acts_2_6_15;
    logic  [5:0] acts_2_6_16, acts_2_6_17, acts_2_6_19, acts_2_6_21, acts_2_6_23, acts_2_6_24, acts_2_6_25, acts_2_6_26, acts_2_6_27, acts_2_6_28, acts_2_6_29, acts_2_6_30, acts_2_7_0, acts_2_7_1, acts_2_7_2, acts_2_7_3;
    logic  [5:0] acts_2_7_4, acts_2_7_5, acts_2_7_6, acts_2_7_7, acts_2_7_8, acts_2_7_9, acts_2_7_10, acts_2_7_11, acts_2_7_12, acts_2_7_14, acts_2_7_15, acts_2_7_17, acts_2_7_18, acts_2_7_19, acts_2_7_20, acts_2_7_21;
    logic  [5:0] acts_2_7_22, acts_2_7_23, acts_2_7_24, acts_2_7_25, acts_2_7_26, acts_2_7_28, acts_2_7_29, acts_2_7_30, acts_2_7_31, acts_2_8_0, acts_2_8_1, acts_2_8_2, acts_2_8_3, acts_2_8_4, acts_2_8_5, acts_2_8_6;
    logic  [5:0] acts_2_8_7, acts_2_8_8, acts_2_8_9, acts_2_8_10, acts_2_8_11, acts_2_8_12, acts_2_8_13, acts_2_8_14, acts_2_8_15, acts_2_8_17, acts_2_8_18, acts_2_8_20, acts_2_8_21, acts_2_8_22, acts_2_8_24, acts_2_8_25;
    logic  [5:0] acts_2_8_26, acts_2_8_28, acts_2_8_30, acts_2_8_31, acts_2_9_0, acts_2_9_2, acts_2_9_3, acts_2_9_4, acts_2_9_5, acts_2_9_6, acts_2_9_7, acts_2_9_8, acts_2_9_9, acts_2_9_10, acts_2_9_11, acts_2_9_12;
    logic  [5:0] acts_2_9_13, acts_2_9_14, acts_2_9_15, acts_2_9_16, acts_2_9_17, acts_2_9_18, acts_2_9_19, acts_2_9_20, acts_2_9_21, acts_2_9_22, acts_2_9_23, acts_2_9_24, acts_2_9_25, acts_2_9_26, acts_2_9_27, acts_2_9_28;
    logic  [5:0] acts_2_9_29, acts_2_9_30, acts_2_9_31;

    // Auto layer blocks
        // Layer 0, Node 0
      logic  [7:0] s_0_0_1_0, s_0_0_1_1, s_0_0_1_2, s_0_0_1_3, s_0_0_1_4;
    logic  [7:0] s_0_0_1_0_reg, s_0_0_1_1_reg, s_0_0_1_2_reg, s_0_0_1_3_reg, s_0_0_1_4_reg;
    logic  [9:0] s_0_0_2_0, s_0_0_2_1;
    logic  [9:0] s_0_0_2_0_reg, s_0_0_2_1_reg;
    logic [11:0] sum_0_0;
    logic [11:0] sum_0_0_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_0)) 
    rom_0_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_0_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_2)) 
    rom_0_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_0_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_6)) 
    rom_0_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_0_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_8)) 
    rom_0_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_0_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_12)) 
    rom_0_0_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_0_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_13)) 
    rom_0_0_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_0_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_14)) 
    rom_0_0_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_0_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_15)) 
    rom_0_0_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_0_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_16)) 
    rom_0_0_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_0_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_17)) 
    rom_0_0_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_0_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_18)) 
    rom_0_0_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_0_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_25)) 
    rom_0_0_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_0_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_28)) 
    rom_0_0_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_0_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_29)) 
    rom_0_0_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_0_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_33)) 
    rom_0_0_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_0_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_34)) 
    rom_0_0_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_0_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_37)) 
    rom_0_0_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_0_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_39)) 
    rom_0_0_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_0_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_0_40)) 
    rom_0_0_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_0_40));

  // Stage 1
    assign s_0_0_1_0 = {{2{acts_0_0_0[5]}}, acts_0_0_0} + {{2{acts_0_0_2[5]}}, acts_0_0_2} + {{2{acts_0_0_6[5]}}, acts_0_0_6} + {{2{acts_0_0_8[5]}}, acts_0_0_8};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_0), .q(s_0_0_1_0_reg));

    assign s_0_0_1_1 = {{2{acts_0_0_12[5]}}, acts_0_0_12} + {{2{acts_0_0_13[5]}}, acts_0_0_13} + {{2{acts_0_0_14[5]}}, acts_0_0_14} + {{2{acts_0_0_15[5]}}, acts_0_0_15};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_1), .q(s_0_0_1_1_reg));

    assign s_0_0_1_2 = {{2{acts_0_0_16[5]}}, acts_0_0_16} + {{2{acts_0_0_17[5]}}, acts_0_0_17} + {{2{acts_0_0_18[5]}}, acts_0_0_18} + {{2{acts_0_0_25[5]}}, acts_0_0_25};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_2), .q(s_0_0_1_2_reg));

    assign s_0_0_1_3 = {{2{acts_0_0_28[5]}}, acts_0_0_28} + {{2{acts_0_0_29[5]}}, acts_0_0_29} + {{2{acts_0_0_33[5]}}, acts_0_0_33} + {{2{acts_0_0_34[5]}}, acts_0_0_34};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_3), .q(s_0_0_1_3_reg));

    assign s_0_0_1_4 = {{2{acts_0_0_37[5]}}, acts_0_0_37} + {{2{acts_0_0_39[5]}}, acts_0_0_39} + {{2{acts_0_0_40[5]}}, acts_0_0_40};
    registers #(.ARRAY_WIDTH(8)) r_0_0_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_1_4), .q(s_0_0_1_4_reg));

  // Stage 2
    assign s_0_0_2_0 = {{2{s_0_0_1_0_reg[7]}}, s_0_0_1_0_reg} + {{2{s_0_0_1_1_reg[7]}}, s_0_0_1_1_reg} + {{2{s_0_0_1_2_reg[7]}}, s_0_0_1_2_reg} + {{2{s_0_0_1_3_reg[7]}}, s_0_0_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_0_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_2_0), .q(s_0_0_2_0_reg));

    assign s_0_0_2_1 = {{2{s_0_0_1_4_reg[7]}}, s_0_0_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_0_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_0_2_1), .q(s_0_0_2_1_reg));

  // Stage 3
    assign sum_0_0 = {{2{s_0_0_2_0_reg[9]}}, s_0_0_2_0_reg} + {{2{s_0_0_2_1_reg[9]}}, s_0_0_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_0), .q(sum_0_0_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_0 (.i_data(sum_0_0_reg), .o_data(out_0_0_sat));


    // Layer 0, Node 1
      logic  [7:0] s_0_1_1_0, s_0_1_1_1, s_0_1_1_2, s_0_1_1_3, s_0_1_1_4;
    logic  [7:0] s_0_1_1_0_reg, s_0_1_1_1_reg, s_0_1_1_2_reg, s_0_1_1_3_reg, s_0_1_1_4_reg;
    logic  [9:0] s_0_1_2_0, s_0_1_2_1;
    logic  [9:0] s_0_1_2_0_reg, s_0_1_2_1_reg;
    logic [11:0] sum_0_1;
    logic [11:0] sum_0_1_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_2)) 
    rom_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_1_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_3)) 
    rom_0_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_1_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_6)) 
    rom_0_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_1_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_8)) 
    rom_0_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_1_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_9)) 
    rom_0_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_1_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_12)) 
    rom_0_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_1_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_14)) 
    rom_0_1_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_1_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_16)) 
    rom_0_1_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_1_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_17)) 
    rom_0_1_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_1_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_19)) 
    rom_0_1_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_1_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_21)) 
    rom_0_1_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_1_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_22)) 
    rom_0_1_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_1_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_24)) 
    rom_0_1_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_1_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_26)) 
    rom_0_1_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_1_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_29)) 
    rom_0_1_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_1_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_31)) 
    rom_0_1_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_1_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_33)) 
    rom_0_1_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_1_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_36)) 
    rom_0_1_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_1_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_1_39)) 
    rom_0_1_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_1_39));

  // Stage 1
    assign s_0_1_1_0 = {{2{acts_0_1_2[5]}}, acts_0_1_2} + {{2{acts_0_1_3[5]}}, acts_0_1_3} + {{2{acts_0_1_6[5]}}, acts_0_1_6} + {{2{acts_0_1_8[5]}}, acts_0_1_8};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_0), .q(s_0_1_1_0_reg));

    assign s_0_1_1_1 = {{2{acts_0_1_9[5]}}, acts_0_1_9} + {{2{acts_0_1_12[5]}}, acts_0_1_12} + {{2{acts_0_1_14[5]}}, acts_0_1_14} + {{2{acts_0_1_16[5]}}, acts_0_1_16};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_1), .q(s_0_1_1_1_reg));

    assign s_0_1_1_2 = {{2{acts_0_1_17[5]}}, acts_0_1_17} + {{2{acts_0_1_19[5]}}, acts_0_1_19} + {{2{acts_0_1_21[5]}}, acts_0_1_21} + {{2{acts_0_1_22[5]}}, acts_0_1_22};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_2), .q(s_0_1_1_2_reg));

    assign s_0_1_1_3 = {{2{acts_0_1_24[5]}}, acts_0_1_24} + {{2{acts_0_1_26[5]}}, acts_0_1_26} + {{2{acts_0_1_29[5]}}, acts_0_1_29} + {{2{acts_0_1_31[5]}}, acts_0_1_31};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_3), .q(s_0_1_1_3_reg));

    assign s_0_1_1_4 = {{2{acts_0_1_33[5]}}, acts_0_1_33} + {{2{acts_0_1_36[5]}}, acts_0_1_36} + {{2{acts_0_1_39[5]}}, acts_0_1_39};
    registers #(.ARRAY_WIDTH(8)) r_0_1_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_1_4), .q(s_0_1_1_4_reg));

  // Stage 2
    assign s_0_1_2_0 = {{2{s_0_1_1_0_reg[7]}}, s_0_1_1_0_reg} + {{2{s_0_1_1_1_reg[7]}}, s_0_1_1_1_reg} + {{2{s_0_1_1_2_reg[7]}}, s_0_1_1_2_reg} + {{2{s_0_1_1_3_reg[7]}}, s_0_1_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_1_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_2_0), .q(s_0_1_2_0_reg));

    assign s_0_1_2_1 = {{2{s_0_1_1_4_reg[7]}}, s_0_1_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_1_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_1_2_1), .q(s_0_1_2_1_reg));

  // Stage 3
    assign sum_0_1 = {{2{s_0_1_2_0_reg[9]}}, s_0_1_2_0_reg} + {{2{s_0_1_2_1_reg[9]}}, s_0_1_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_1), .q(sum_0_1_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_1 (.i_data(sum_0_1_reg), .o_data(out_0_1_sat));


    // Layer 0, Node 2
      logic  [7:0] s_0_2_1_0, s_0_2_1_1, s_0_2_1_2, s_0_2_1_3, s_0_2_1_4;
    logic  [7:0] s_0_2_1_0_reg, s_0_2_1_1_reg, s_0_2_1_2_reg, s_0_2_1_3_reg, s_0_2_1_4_reg;
    logic  [9:0] s_0_2_2_0, s_0_2_2_1;
    logic  [9:0] s_0_2_2_0_reg, s_0_2_2_1_reg;
    logic [11:0] sum_0_2;
    logic [11:0] sum_0_2_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_0)) 
    rom_0_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_2_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_1)) 
    rom_0_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_2_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_2)) 
    rom_0_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_2_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_3)) 
    rom_0_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_2_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_7)) 
    rom_0_2_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_2_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_9)) 
    rom_0_2_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_2_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_11)) 
    rom_0_2_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_2_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_17)) 
    rom_0_2_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_2_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_19)) 
    rom_0_2_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_2_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_24)) 
    rom_0_2_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_2_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_26)) 
    rom_0_2_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_2_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_29)) 
    rom_0_2_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_2_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_34)) 
    rom_0_2_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_2_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_35)) 
    rom_0_2_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_2_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_36)) 
    rom_0_2_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_2_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_40)) 
    rom_0_2_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_2_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_2_41)) 
    rom_0_2_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_2_41));

  // Stage 1
    assign s_0_2_1_0 = {{2{acts_0_2_0[5]}}, acts_0_2_0} + {{2{acts_0_2_1[5]}}, acts_0_2_1} + {{2{acts_0_2_2[5]}}, acts_0_2_2} + {{2{acts_0_2_3[5]}}, acts_0_2_3};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_0), .q(s_0_2_1_0_reg));

    assign s_0_2_1_1 = {{2{acts_0_2_7[5]}}, acts_0_2_7} + {{2{acts_0_2_9[5]}}, acts_0_2_9} + {{2{acts_0_2_11[5]}}, acts_0_2_11} + {{2{acts_0_2_17[5]}}, acts_0_2_17};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_1), .q(s_0_2_1_1_reg));

    assign s_0_2_1_2 = {{2{acts_0_2_19[5]}}, acts_0_2_19} + {{2{acts_0_2_24[5]}}, acts_0_2_24} + {{2{acts_0_2_26[5]}}, acts_0_2_26} + {{2{acts_0_2_29[5]}}, acts_0_2_29};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_2), .q(s_0_2_1_2_reg));

    assign s_0_2_1_3 = {{2{acts_0_2_34[5]}}, acts_0_2_34} + {{2{acts_0_2_35[5]}}, acts_0_2_35} + {{2{acts_0_2_36[5]}}, acts_0_2_36} + {{2{acts_0_2_40[5]}}, acts_0_2_40};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_3), .q(s_0_2_1_3_reg));

    assign s_0_2_1_4 = {{2{acts_0_2_41[5]}}, acts_0_2_41};
    registers #(.ARRAY_WIDTH(8)) r_0_2_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_1_4), .q(s_0_2_1_4_reg));

  // Stage 2
    assign s_0_2_2_0 = {{2{s_0_2_1_0_reg[7]}}, s_0_2_1_0_reg} + {{2{s_0_2_1_1_reg[7]}}, s_0_2_1_1_reg} + {{2{s_0_2_1_2_reg[7]}}, s_0_2_1_2_reg} + {{2{s_0_2_1_3_reg[7]}}, s_0_2_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_2_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_2_0), .q(s_0_2_2_0_reg));

    assign s_0_2_2_1 = {{2{s_0_2_1_4_reg[7]}}, s_0_2_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_2_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_2_2_1), .q(s_0_2_2_1_reg));

  // Stage 3
    assign sum_0_2 = {{2{s_0_2_2_0_reg[9]}}, s_0_2_2_0_reg} + {{2{s_0_2_2_1_reg[9]}}, s_0_2_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_2), .q(sum_0_2_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_2 (.i_data(sum_0_2_reg), .o_data(out_0_2_sat));


    // Layer 0, Node 3
      logic  [7:0] s_0_3_1_0, s_0_3_1_1, s_0_3_1_2, s_0_3_1_3, s_0_3_1_4, s_0_3_1_5;
    logic  [7:0] s_0_3_1_0_reg, s_0_3_1_1_reg, s_0_3_1_2_reg, s_0_3_1_3_reg, s_0_3_1_4_reg, s_0_3_1_5_reg;
    logic  [9:0] s_0_3_2_0, s_0_3_2_1;
    logic  [9:0] s_0_3_2_0_reg, s_0_3_2_1_reg;
    logic [11:0] sum_0_3;
    logic [11:0] sum_0_3_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_0)) 
    rom_0_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_3_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_1)) 
    rom_0_3_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_3_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_2)) 
    rom_0_3_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_3_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_4)) 
    rom_0_3_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_3_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_6)) 
    rom_0_3_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_3_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_7)) 
    rom_0_3_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_3_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_8)) 
    rom_0_3_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_3_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_9)) 
    rom_0_3_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_3_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_11)) 
    rom_0_3_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_3_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_12)) 
    rom_0_3_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_3_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_16)) 
    rom_0_3_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_3_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_17)) 
    rom_0_3_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_3_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_19)) 
    rom_0_3_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_3_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_20)) 
    rom_0_3_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_3_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_23)) 
    rom_0_3_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_3_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_24)) 
    rom_0_3_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_3_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_25)) 
    rom_0_3_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_3_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_31)) 
    rom_0_3_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_3_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_33)) 
    rom_0_3_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_3_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_34)) 
    rom_0_3_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_3_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_36)) 
    rom_0_3_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_3_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_37)) 
    rom_0_3_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_3_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_3_38)) 
    rom_0_3_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_3_38));

  // Stage 1
    assign s_0_3_1_0 = {{2{acts_0_3_0[5]}}, acts_0_3_0} + {{2{acts_0_3_1[5]}}, acts_0_3_1} + {{2{acts_0_3_2[5]}}, acts_0_3_2} + {{2{acts_0_3_4[5]}}, acts_0_3_4};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_0), .q(s_0_3_1_0_reg));

    assign s_0_3_1_1 = {{2{acts_0_3_6[5]}}, acts_0_3_6} + {{2{acts_0_3_7[5]}}, acts_0_3_7} + {{2{acts_0_3_8[5]}}, acts_0_3_8} + {{2{acts_0_3_9[5]}}, acts_0_3_9};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_1), .q(s_0_3_1_1_reg));

    assign s_0_3_1_2 = {{2{acts_0_3_11[5]}}, acts_0_3_11} + {{2{acts_0_3_12[5]}}, acts_0_3_12} + {{2{acts_0_3_16[5]}}, acts_0_3_16} + {{2{acts_0_3_17[5]}}, acts_0_3_17};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_2), .q(s_0_3_1_2_reg));

    assign s_0_3_1_3 = {{2{acts_0_3_19[5]}}, acts_0_3_19} + {{2{acts_0_3_20[5]}}, acts_0_3_20} + {{2{acts_0_3_23[5]}}, acts_0_3_23} + {{2{acts_0_3_24[5]}}, acts_0_3_24};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_3), .q(s_0_3_1_3_reg));

    assign s_0_3_1_4 = {{2{acts_0_3_25[5]}}, acts_0_3_25} + {{2{acts_0_3_31[5]}}, acts_0_3_31} + {{2{acts_0_3_33[5]}}, acts_0_3_33} + {{2{acts_0_3_34[5]}}, acts_0_3_34};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_4), .q(s_0_3_1_4_reg));

    assign s_0_3_1_5 = {{2{acts_0_3_36[5]}}, acts_0_3_36} + {{2{acts_0_3_37[5]}}, acts_0_3_37} + {{2{acts_0_3_38[5]}}, acts_0_3_38};
    registers #(.ARRAY_WIDTH(8)) r_0_3_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_1_5), .q(s_0_3_1_5_reg));

  // Stage 2
    assign s_0_3_2_0 = {{2{s_0_3_1_0_reg[7]}}, s_0_3_1_0_reg} + {{2{s_0_3_1_1_reg[7]}}, s_0_3_1_1_reg} + {{2{s_0_3_1_2_reg[7]}}, s_0_3_1_2_reg} + {{2{s_0_3_1_3_reg[7]}}, s_0_3_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_3_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_2_0), .q(s_0_3_2_0_reg));

    assign s_0_3_2_1 = {{2{s_0_3_1_4_reg[7]}}, s_0_3_1_4_reg} + {{2{s_0_3_1_5_reg[7]}}, s_0_3_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_3_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_3_2_1), .q(s_0_3_2_1_reg));

  // Stage 3
    assign sum_0_3 = {{2{s_0_3_2_0_reg[9]}}, s_0_3_2_0_reg} + {{2{s_0_3_2_1_reg[9]}}, s_0_3_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_3), .q(sum_0_3_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_3 (.i_data(sum_0_3_reg), .o_data(out_0_3_sat));


    // Layer 0, Node 4
      logic  [7:0] s_0_4_1_0, s_0_4_1_1, s_0_4_1_2, s_0_4_1_3, s_0_4_1_4, s_0_4_1_5;
    logic  [7:0] s_0_4_1_0_reg, s_0_4_1_1_reg, s_0_4_1_2_reg, s_0_4_1_3_reg, s_0_4_1_4_reg, s_0_4_1_5_reg;
    logic  [9:0] s_0_4_2_0, s_0_4_2_1;
    logic  [9:0] s_0_4_2_0_reg, s_0_4_2_1_reg;
    logic [11:0] sum_0_4;
    logic [11:0] sum_0_4_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_0)) 
    rom_0_4_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_4_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_1)) 
    rom_0_4_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_4_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_2)) 
    rom_0_4_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_4_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_4)) 
    rom_0_4_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_4_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_6)) 
    rom_0_4_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_4_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_9)) 
    rom_0_4_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_4_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_10)) 
    rom_0_4_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_4_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_11)) 
    rom_0_4_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_4_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_12)) 
    rom_0_4_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_4_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_14)) 
    rom_0_4_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_4_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_16)) 
    rom_0_4_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_4_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_17)) 
    rom_0_4_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_4_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_18)) 
    rom_0_4_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_4_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_21)) 
    rom_0_4_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_4_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_23)) 
    rom_0_4_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_4_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_29)) 
    rom_0_4_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_4_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_34)) 
    rom_0_4_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_4_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_35)) 
    rom_0_4_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_4_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_36)) 
    rom_0_4_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_4_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_37)) 
    rom_0_4_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_4_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_38)) 
    rom_0_4_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_4_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_39)) 
    rom_0_4_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_4_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_4_40)) 
    rom_0_4_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_4_40));

  // Stage 1
    assign s_0_4_1_0 = {{2{acts_0_4_0[5]}}, acts_0_4_0} + {{2{acts_0_4_1[5]}}, acts_0_4_1} + {{2{acts_0_4_2[5]}}, acts_0_4_2} + {{2{acts_0_4_4[5]}}, acts_0_4_4};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_0), .q(s_0_4_1_0_reg));

    assign s_0_4_1_1 = {{2{acts_0_4_6[5]}}, acts_0_4_6} + {{2{acts_0_4_9[5]}}, acts_0_4_9} + {{2{acts_0_4_10[5]}}, acts_0_4_10} + {{2{acts_0_4_11[5]}}, acts_0_4_11};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_1), .q(s_0_4_1_1_reg));

    assign s_0_4_1_2 = {{2{acts_0_4_12[5]}}, acts_0_4_12} + {{2{acts_0_4_14[5]}}, acts_0_4_14} + {{2{acts_0_4_16[5]}}, acts_0_4_16} + {{2{acts_0_4_17[5]}}, acts_0_4_17};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_2), .q(s_0_4_1_2_reg));

    assign s_0_4_1_3 = {{2{acts_0_4_18[5]}}, acts_0_4_18} + {{2{acts_0_4_21[5]}}, acts_0_4_21} + {{2{acts_0_4_23[5]}}, acts_0_4_23} + {{2{acts_0_4_29[5]}}, acts_0_4_29};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_3), .q(s_0_4_1_3_reg));

    assign s_0_4_1_4 = {{2{acts_0_4_34[5]}}, acts_0_4_34} + {{2{acts_0_4_35[5]}}, acts_0_4_35} + {{2{acts_0_4_36[5]}}, acts_0_4_36} + {{2{acts_0_4_37[5]}}, acts_0_4_37};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_4), .q(s_0_4_1_4_reg));

    assign s_0_4_1_5 = {{2{acts_0_4_38[5]}}, acts_0_4_38} + {{2{acts_0_4_39[5]}}, acts_0_4_39} + {{2{acts_0_4_40[5]}}, acts_0_4_40};
    registers #(.ARRAY_WIDTH(8)) r_0_4_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_1_5), .q(s_0_4_1_5_reg));

  // Stage 2
    assign s_0_4_2_0 = {{2{s_0_4_1_0_reg[7]}}, s_0_4_1_0_reg} + {{2{s_0_4_1_1_reg[7]}}, s_0_4_1_1_reg} + {{2{s_0_4_1_2_reg[7]}}, s_0_4_1_2_reg} + {{2{s_0_4_1_3_reg[7]}}, s_0_4_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_4_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_2_0), .q(s_0_4_2_0_reg));

    assign s_0_4_2_1 = {{2{s_0_4_1_4_reg[7]}}, s_0_4_1_4_reg} + {{2{s_0_4_1_5_reg[7]}}, s_0_4_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_4_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_4_2_1), .q(s_0_4_2_1_reg));

  // Stage 3
    assign sum_0_4 = {{2{s_0_4_2_0_reg[9]}}, s_0_4_2_0_reg} + {{2{s_0_4_2_1_reg[9]}}, s_0_4_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_4), .q(sum_0_4_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_4 (.i_data(sum_0_4_reg), .o_data(out_0_4_sat));


    // Layer 0, Node 5
      logic  [7:0] s_0_5_1_0, s_0_5_1_1, s_0_5_1_2, s_0_5_1_3, s_0_5_1_4, s_0_5_1_5;
    logic  [7:0] s_0_5_1_0_reg, s_0_5_1_1_reg, s_0_5_1_2_reg, s_0_5_1_3_reg, s_0_5_1_4_reg, s_0_5_1_5_reg;
    logic  [9:0] s_0_5_2_0, s_0_5_2_1;
    logic  [9:0] s_0_5_2_0_reg, s_0_5_2_1_reg;
    logic [11:0] sum_0_5;
    logic [11:0] sum_0_5_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_0)) 
    rom_0_5_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_5_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_2)) 
    rom_0_5_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_5_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_4)) 
    rom_0_5_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_5_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_5)) 
    rom_0_5_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_5_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_6)) 
    rom_0_5_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_5_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_10)) 
    rom_0_5_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_5_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_12)) 
    rom_0_5_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_5_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_13)) 
    rom_0_5_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_5_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_14)) 
    rom_0_5_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_5_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_16)) 
    rom_0_5_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_5_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_17)) 
    rom_0_5_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_5_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_21)) 
    rom_0_5_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_5_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_23)) 
    rom_0_5_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_5_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_24)) 
    rom_0_5_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_5_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_26)) 
    rom_0_5_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_5_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_29)) 
    rom_0_5_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_5_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_30)) 
    rom_0_5_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_5_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_36)) 
    rom_0_5_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_5_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_38)) 
    rom_0_5_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_5_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_39)) 
    rom_0_5_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_5_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_5_40)) 
    rom_0_5_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_5_40));

  // Stage 1
    assign s_0_5_1_0 = {{2{acts_0_5_0[5]}}, acts_0_5_0} + {{2{acts_0_5_2[5]}}, acts_0_5_2} + {{2{acts_0_5_4[5]}}, acts_0_5_4} + {{2{acts_0_5_5[5]}}, acts_0_5_5};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_0), .q(s_0_5_1_0_reg));

    assign s_0_5_1_1 = {{2{acts_0_5_6[5]}}, acts_0_5_6} + {{2{acts_0_5_10[5]}}, acts_0_5_10} + {{2{acts_0_5_12[5]}}, acts_0_5_12} + {{2{acts_0_5_13[5]}}, acts_0_5_13};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_1), .q(s_0_5_1_1_reg));

    assign s_0_5_1_2 = {{2{acts_0_5_14[5]}}, acts_0_5_14} + {{2{acts_0_5_16[5]}}, acts_0_5_16} + {{2{acts_0_5_17[5]}}, acts_0_5_17} + {{2{acts_0_5_21[5]}}, acts_0_5_21};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_2), .q(s_0_5_1_2_reg));

    assign s_0_5_1_3 = {{2{acts_0_5_23[5]}}, acts_0_5_23} + {{2{acts_0_5_24[5]}}, acts_0_5_24} + {{2{acts_0_5_26[5]}}, acts_0_5_26} + {{2{acts_0_5_29[5]}}, acts_0_5_29};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_3), .q(s_0_5_1_3_reg));

    assign s_0_5_1_4 = {{2{acts_0_5_30[5]}}, acts_0_5_30} + {{2{acts_0_5_36[5]}}, acts_0_5_36} + {{2{acts_0_5_38[5]}}, acts_0_5_38} + {{2{acts_0_5_39[5]}}, acts_0_5_39};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_4), .q(s_0_5_1_4_reg));

    assign s_0_5_1_5 = {{2{acts_0_5_40[5]}}, acts_0_5_40};
    registers #(.ARRAY_WIDTH(8)) r_0_5_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_1_5), .q(s_0_5_1_5_reg));

  // Stage 2
    assign s_0_5_2_0 = {{2{s_0_5_1_0_reg[7]}}, s_0_5_1_0_reg} + {{2{s_0_5_1_1_reg[7]}}, s_0_5_1_1_reg} + {{2{s_0_5_1_2_reg[7]}}, s_0_5_1_2_reg} + {{2{s_0_5_1_3_reg[7]}}, s_0_5_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_5_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_2_0), .q(s_0_5_2_0_reg));

    assign s_0_5_2_1 = {{2{s_0_5_1_4_reg[7]}}, s_0_5_1_4_reg} + {{2{s_0_5_1_5_reg[7]}}, s_0_5_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_5_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_5_2_1), .q(s_0_5_2_1_reg));

  // Stage 3
    assign sum_0_5 = {{2{s_0_5_2_0_reg[9]}}, s_0_5_2_0_reg} + {{2{s_0_5_2_1_reg[9]}}, s_0_5_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_5), .q(sum_0_5_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_5 (.i_data(sum_0_5_reg), .o_data(out_0_5_sat));


    // Layer 0, Node 6
      logic  [7:0] s_0_6_1_0, s_0_6_1_1, s_0_6_1_2, s_0_6_1_3, s_0_6_1_4;
    logic  [7:0] s_0_6_1_0_reg, s_0_6_1_1_reg, s_0_6_1_2_reg, s_0_6_1_3_reg, s_0_6_1_4_reg;
    logic  [9:0] s_0_6_2_0, s_0_6_2_1;
    logic  [9:0] s_0_6_2_0_reg, s_0_6_2_1_reg;
    logic [11:0] sum_0_6;
    logic [11:0] sum_0_6_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_0)) 
    rom_0_6_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_6_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_1)) 
    rom_0_6_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_6_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_3)) 
    rom_0_6_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_6_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_4)) 
    rom_0_6_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_6_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_5)) 
    rom_0_6_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_6_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_7)) 
    rom_0_6_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_6_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_10)) 
    rom_0_6_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_6_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_13)) 
    rom_0_6_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_6_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_16)) 
    rom_0_6_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_6_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_19)) 
    rom_0_6_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_6_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_24)) 
    rom_0_6_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_6_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_29)) 
    rom_0_6_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_6_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_33)) 
    rom_0_6_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_6_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_34)) 
    rom_0_6_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_6_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_37)) 
    rom_0_6_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_6_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_38)) 
    rom_0_6_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_6_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_6_40)) 
    rom_0_6_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_6_40));

  // Stage 1
    assign s_0_6_1_0 = {{2{acts_0_6_0[5]}}, acts_0_6_0} + {{2{acts_0_6_1[5]}}, acts_0_6_1} + {{2{acts_0_6_3[5]}}, acts_0_6_3} + {{2{acts_0_6_4[5]}}, acts_0_6_4};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_0), .q(s_0_6_1_0_reg));

    assign s_0_6_1_1 = {{2{acts_0_6_5[5]}}, acts_0_6_5} + {{2{acts_0_6_7[5]}}, acts_0_6_7} + {{2{acts_0_6_10[5]}}, acts_0_6_10} + {{2{acts_0_6_13[5]}}, acts_0_6_13};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_1), .q(s_0_6_1_1_reg));

    assign s_0_6_1_2 = {{2{acts_0_6_16[5]}}, acts_0_6_16} + {{2{acts_0_6_19[5]}}, acts_0_6_19} + {{2{acts_0_6_24[5]}}, acts_0_6_24} + {{2{acts_0_6_29[5]}}, acts_0_6_29};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_2), .q(s_0_6_1_2_reg));

    assign s_0_6_1_3 = {{2{acts_0_6_33[5]}}, acts_0_6_33} + {{2{acts_0_6_34[5]}}, acts_0_6_34} + {{2{acts_0_6_37[5]}}, acts_0_6_37} + {{2{acts_0_6_38[5]}}, acts_0_6_38};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_3), .q(s_0_6_1_3_reg));

    assign s_0_6_1_4 = {{2{acts_0_6_40[5]}}, acts_0_6_40};
    registers #(.ARRAY_WIDTH(8)) r_0_6_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_1_4), .q(s_0_6_1_4_reg));

  // Stage 2
    assign s_0_6_2_0 = {{2{s_0_6_1_0_reg[7]}}, s_0_6_1_0_reg} + {{2{s_0_6_1_1_reg[7]}}, s_0_6_1_1_reg} + {{2{s_0_6_1_2_reg[7]}}, s_0_6_1_2_reg} + {{2{s_0_6_1_3_reg[7]}}, s_0_6_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_6_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_2_0), .q(s_0_6_2_0_reg));

    assign s_0_6_2_1 = {{2{s_0_6_1_4_reg[7]}}, s_0_6_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_6_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_6_2_1), .q(s_0_6_2_1_reg));

  // Stage 3
    assign sum_0_6 = {{2{s_0_6_2_0_reg[9]}}, s_0_6_2_0_reg} + {{2{s_0_6_2_1_reg[9]}}, s_0_6_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_6), .q(sum_0_6_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_6 (.i_data(sum_0_6_reg), .o_data(out_0_6_sat));


    // Layer 0, Node 7
      logic  [7:0] s_0_7_1_0, s_0_7_1_1, s_0_7_1_2, s_0_7_1_3, s_0_7_1_4;
    logic  [7:0] s_0_7_1_0_reg, s_0_7_1_1_reg, s_0_7_1_2_reg, s_0_7_1_3_reg, s_0_7_1_4_reg;
    logic  [9:0] s_0_7_2_0, s_0_7_2_1;
    logic  [9:0] s_0_7_2_0_reg, s_0_7_2_1_reg;
    logic [11:0] sum_0_7;
    logic [11:0] sum_0_7_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_0)) 
    rom_0_7_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_7_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_2)) 
    rom_0_7_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_7_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_3)) 
    rom_0_7_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_7_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_7)) 
    rom_0_7_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_7_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_9)) 
    rom_0_7_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_7_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_15)) 
    rom_0_7_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_7_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_16)) 
    rom_0_7_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_7_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_18)) 
    rom_0_7_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_7_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_26)) 
    rom_0_7_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_7_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_29)) 
    rom_0_7_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_7_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_31)) 
    rom_0_7_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_7_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_32)) 
    rom_0_7_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_7_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_33)) 
    rom_0_7_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_7_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_35)) 
    rom_0_7_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_7_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_36)) 
    rom_0_7_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_7_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_38)) 
    rom_0_7_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_7_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_39)) 
    rom_0_7_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_7_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_7_40)) 
    rom_0_7_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_7_40));

  // Stage 1
    assign s_0_7_1_0 = {{2{acts_0_7_0[5]}}, acts_0_7_0} + {{2{acts_0_7_2[5]}}, acts_0_7_2} + {{2{acts_0_7_3[5]}}, acts_0_7_3} + {{2{acts_0_7_7[5]}}, acts_0_7_7};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_0), .q(s_0_7_1_0_reg));

    assign s_0_7_1_1 = {{2{acts_0_7_9[5]}}, acts_0_7_9} + {{2{acts_0_7_15[5]}}, acts_0_7_15} + {{2{acts_0_7_16[5]}}, acts_0_7_16} + {{2{acts_0_7_18[5]}}, acts_0_7_18};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_1), .q(s_0_7_1_1_reg));

    assign s_0_7_1_2 = {{2{acts_0_7_26[5]}}, acts_0_7_26} + {{2{acts_0_7_29[5]}}, acts_0_7_29} + {{2{acts_0_7_31[5]}}, acts_0_7_31} + {{2{acts_0_7_32[5]}}, acts_0_7_32};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_2), .q(s_0_7_1_2_reg));

    assign s_0_7_1_3 = {{2{acts_0_7_33[5]}}, acts_0_7_33} + {{2{acts_0_7_35[5]}}, acts_0_7_35} + {{2{acts_0_7_36[5]}}, acts_0_7_36} + {{2{acts_0_7_38[5]}}, acts_0_7_38};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_3), .q(s_0_7_1_3_reg));

    assign s_0_7_1_4 = {{2{acts_0_7_39[5]}}, acts_0_7_39} + {{2{acts_0_7_40[5]}}, acts_0_7_40};
    registers #(.ARRAY_WIDTH(8)) r_0_7_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_1_4), .q(s_0_7_1_4_reg));

  // Stage 2
    assign s_0_7_2_0 = {{2{s_0_7_1_0_reg[7]}}, s_0_7_1_0_reg} + {{2{s_0_7_1_1_reg[7]}}, s_0_7_1_1_reg} + {{2{s_0_7_1_2_reg[7]}}, s_0_7_1_2_reg} + {{2{s_0_7_1_3_reg[7]}}, s_0_7_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_7_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_2_0), .q(s_0_7_2_0_reg));

    assign s_0_7_2_1 = {{2{s_0_7_1_4_reg[7]}}, s_0_7_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_7_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_7_2_1), .q(s_0_7_2_1_reg));

  // Stage 3
    assign sum_0_7 = {{2{s_0_7_2_0_reg[9]}}, s_0_7_2_0_reg} + {{2{s_0_7_2_1_reg[9]}}, s_0_7_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_7), .q(sum_0_7_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_7 (.i_data(sum_0_7_reg), .o_data(out_0_7_sat));


    // Layer 0, Node 8
      logic  [7:0] s_0_8_1_0, s_0_8_1_1, s_0_8_1_2, s_0_8_1_3, s_0_8_1_4, s_0_8_1_5;
    logic  [7:0] s_0_8_1_0_reg, s_0_8_1_1_reg, s_0_8_1_2_reg, s_0_8_1_3_reg, s_0_8_1_4_reg, s_0_8_1_5_reg;
    logic  [9:0] s_0_8_2_0, s_0_8_2_1;
    logic  [9:0] s_0_8_2_0_reg, s_0_8_2_1_reg;
    logic [11:0] sum_0_8;
    logic [11:0] sum_0_8_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_1)) 
    rom_0_8_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_8_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_2)) 
    rom_0_8_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_8_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_3)) 
    rom_0_8_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_8_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_4)) 
    rom_0_8_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_8_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_5)) 
    rom_0_8_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_8_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_7)) 
    rom_0_8_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_8_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_9)) 
    rom_0_8_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_8_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_11)) 
    rom_0_8_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_8_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_12)) 
    rom_0_8_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_8_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_13)) 
    rom_0_8_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_8_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_16)) 
    rom_0_8_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_8_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_17)) 
    rom_0_8_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_8_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_18)) 
    rom_0_8_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_8_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_20)) 
    rom_0_8_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_8_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_21)) 
    rom_0_8_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_8_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_26)) 
    rom_0_8_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_8_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_29)) 
    rom_0_8_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_8_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_30)) 
    rom_0_8_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_8_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_32)) 
    rom_0_8_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_8_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_33)) 
    rom_0_8_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_8_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_34)) 
    rom_0_8_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_8_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_8_37)) 
    rom_0_8_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_8_37));

  // Stage 1
    assign s_0_8_1_0 = {{2{acts_0_8_1[5]}}, acts_0_8_1} + {{2{acts_0_8_2[5]}}, acts_0_8_2} + {{2{acts_0_8_3[5]}}, acts_0_8_3} + {{2{acts_0_8_4[5]}}, acts_0_8_4};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_0), .q(s_0_8_1_0_reg));

    assign s_0_8_1_1 = {{2{acts_0_8_5[5]}}, acts_0_8_5} + {{2{acts_0_8_7[5]}}, acts_0_8_7} + {{2{acts_0_8_9[5]}}, acts_0_8_9} + {{2{acts_0_8_11[5]}}, acts_0_8_11};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_1), .q(s_0_8_1_1_reg));

    assign s_0_8_1_2 = {{2{acts_0_8_12[5]}}, acts_0_8_12} + {{2{acts_0_8_13[5]}}, acts_0_8_13} + {{2{acts_0_8_16[5]}}, acts_0_8_16} + {{2{acts_0_8_17[5]}}, acts_0_8_17};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_2), .q(s_0_8_1_2_reg));

    assign s_0_8_1_3 = {{2{acts_0_8_18[5]}}, acts_0_8_18} + {{2{acts_0_8_20[5]}}, acts_0_8_20} + {{2{acts_0_8_21[5]}}, acts_0_8_21} + {{2{acts_0_8_26[5]}}, acts_0_8_26};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_3), .q(s_0_8_1_3_reg));

    assign s_0_8_1_4 = {{2{acts_0_8_29[5]}}, acts_0_8_29} + {{2{acts_0_8_30[5]}}, acts_0_8_30} + {{2{acts_0_8_32[5]}}, acts_0_8_32} + {{2{acts_0_8_33[5]}}, acts_0_8_33};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_4), .q(s_0_8_1_4_reg));

    assign s_0_8_1_5 = {{2{acts_0_8_34[5]}}, acts_0_8_34} + {{2{acts_0_8_37[5]}}, acts_0_8_37};
    registers #(.ARRAY_WIDTH(8)) r_0_8_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_1_5), .q(s_0_8_1_5_reg));

  // Stage 2
    assign s_0_8_2_0 = {{2{s_0_8_1_0_reg[7]}}, s_0_8_1_0_reg} + {{2{s_0_8_1_1_reg[7]}}, s_0_8_1_1_reg} + {{2{s_0_8_1_2_reg[7]}}, s_0_8_1_2_reg} + {{2{s_0_8_1_3_reg[7]}}, s_0_8_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_8_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_2_0), .q(s_0_8_2_0_reg));

    assign s_0_8_2_1 = {{2{s_0_8_1_4_reg[7]}}, s_0_8_1_4_reg} + {{2{s_0_8_1_5_reg[7]}}, s_0_8_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_8_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_8_2_1), .q(s_0_8_2_1_reg));

  // Stage 3
    assign sum_0_8 = {{2{s_0_8_2_0_reg[9]}}, s_0_8_2_0_reg} + {{2{s_0_8_2_1_reg[9]}}, s_0_8_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_8), .q(sum_0_8_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_8 (.i_data(sum_0_8_reg), .o_data(out_0_8_sat));


    // Layer 0, Node 9
      logic  [7:0] s_0_9_1_0, s_0_9_1_1, s_0_9_1_2, s_0_9_1_3, s_0_9_1_4, s_0_9_1_5;
    logic  [7:0] s_0_9_1_0_reg, s_0_9_1_1_reg, s_0_9_1_2_reg, s_0_9_1_3_reg, s_0_9_1_4_reg, s_0_9_1_5_reg;
    logic  [9:0] s_0_9_2_0, s_0_9_2_1;
    logic  [9:0] s_0_9_2_0_reg, s_0_9_2_1_reg;
    logic [11:0] sum_0_9;
    logic [11:0] sum_0_9_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_1)) 
    rom_0_9_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_9_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_2)) 
    rom_0_9_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_9_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_3)) 
    rom_0_9_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_9_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_4)) 
    rom_0_9_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_9_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_5)) 
    rom_0_9_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_9_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_6)) 
    rom_0_9_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_9_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_10)) 
    rom_0_9_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_9_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_13)) 
    rom_0_9_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_9_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_16)) 
    rom_0_9_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_9_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_19)) 
    rom_0_9_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_9_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_21)) 
    rom_0_9_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_9_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_22)) 
    rom_0_9_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_9_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_25)) 
    rom_0_9_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_9_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_26)) 
    rom_0_9_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_9_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_27)) 
    rom_0_9_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_9_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_28)) 
    rom_0_9_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_9_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_29)) 
    rom_0_9_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_9_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_33)) 
    rom_0_9_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_9_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_34)) 
    rom_0_9_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_9_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_35)) 
    rom_0_9_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_9_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_36)) 
    rom_0_9_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_9_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_39)) 
    rom_0_9_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_9_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_9_40)) 
    rom_0_9_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_9_40));

  // Stage 1
    assign s_0_9_1_0 = {{2{acts_0_9_1[5]}}, acts_0_9_1} + {{2{acts_0_9_2[5]}}, acts_0_9_2} + {{2{acts_0_9_3[5]}}, acts_0_9_3} + {{2{acts_0_9_4[5]}}, acts_0_9_4};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_0), .q(s_0_9_1_0_reg));

    assign s_0_9_1_1 = {{2{acts_0_9_5[5]}}, acts_0_9_5} + {{2{acts_0_9_6[5]}}, acts_0_9_6} + {{2{acts_0_9_10[5]}}, acts_0_9_10} + {{2{acts_0_9_13[5]}}, acts_0_9_13};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_1), .q(s_0_9_1_1_reg));

    assign s_0_9_1_2 = {{2{acts_0_9_16[5]}}, acts_0_9_16} + {{2{acts_0_9_19[5]}}, acts_0_9_19} + {{2{acts_0_9_21[5]}}, acts_0_9_21} + {{2{acts_0_9_22[5]}}, acts_0_9_22};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_2), .q(s_0_9_1_2_reg));

    assign s_0_9_1_3 = {{2{acts_0_9_25[5]}}, acts_0_9_25} + {{2{acts_0_9_26[5]}}, acts_0_9_26} + {{2{acts_0_9_27[5]}}, acts_0_9_27} + {{2{acts_0_9_28[5]}}, acts_0_9_28};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_3), .q(s_0_9_1_3_reg));

    assign s_0_9_1_4 = {{2{acts_0_9_29[5]}}, acts_0_9_29} + {{2{acts_0_9_33[5]}}, acts_0_9_33} + {{2{acts_0_9_34[5]}}, acts_0_9_34} + {{2{acts_0_9_35[5]}}, acts_0_9_35};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_4), .q(s_0_9_1_4_reg));

    assign s_0_9_1_5 = {{2{acts_0_9_36[5]}}, acts_0_9_36} + {{2{acts_0_9_39[5]}}, acts_0_9_39} + {{2{acts_0_9_40[5]}}, acts_0_9_40};
    registers #(.ARRAY_WIDTH(8)) r_0_9_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_1_5), .q(s_0_9_1_5_reg));

  // Stage 2
    assign s_0_9_2_0 = {{2{s_0_9_1_0_reg[7]}}, s_0_9_1_0_reg} + {{2{s_0_9_1_1_reg[7]}}, s_0_9_1_1_reg} + {{2{s_0_9_1_2_reg[7]}}, s_0_9_1_2_reg} + {{2{s_0_9_1_3_reg[7]}}, s_0_9_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_9_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_2_0), .q(s_0_9_2_0_reg));

    assign s_0_9_2_1 = {{2{s_0_9_1_4_reg[7]}}, s_0_9_1_4_reg} + {{2{s_0_9_1_5_reg[7]}}, s_0_9_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_9_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_9_2_1), .q(s_0_9_2_1_reg));

  // Stage 3
    assign sum_0_9 = {{2{s_0_9_2_0_reg[9]}}, s_0_9_2_0_reg} + {{2{s_0_9_2_1_reg[9]}}, s_0_9_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_9), .q(sum_0_9_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_9 (.i_data(sum_0_9_reg), .o_data(out_0_9_sat));


    // Layer 0, Node 10
      logic  [7:0] s_0_10_1_0, s_0_10_1_1, s_0_10_1_2, s_0_10_1_3, s_0_10_1_4, s_0_10_1_5;
    logic  [7:0] s_0_10_1_0_reg, s_0_10_1_1_reg, s_0_10_1_2_reg, s_0_10_1_3_reg, s_0_10_1_4_reg, s_0_10_1_5_reg;
    logic  [9:0] s_0_10_2_0, s_0_10_2_1;
    logic  [9:0] s_0_10_2_0_reg, s_0_10_2_1_reg;
    logic [11:0] sum_0_10;
    logic [11:0] sum_0_10_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_1)) 
    rom_0_10_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_10_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_3)) 
    rom_0_10_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_10_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_5)) 
    rom_0_10_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_10_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_9)) 
    rom_0_10_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_10_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_11)) 
    rom_0_10_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_10_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_13)) 
    rom_0_10_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_10_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_17)) 
    rom_0_10_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_10_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_18)) 
    rom_0_10_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_10_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_19)) 
    rom_0_10_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_10_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_20)) 
    rom_0_10_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_10_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_21)) 
    rom_0_10_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_10_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_22)) 
    rom_0_10_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_10_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_23)) 
    rom_0_10_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_10_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_24)) 
    rom_0_10_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_10_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_29)) 
    rom_0_10_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_10_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_30)) 
    rom_0_10_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_10_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_32)) 
    rom_0_10_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_10_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_33)) 
    rom_0_10_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_10_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_34)) 
    rom_0_10_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_10_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_36)) 
    rom_0_10_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_10_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_37)) 
    rom_0_10_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_10_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_38)) 
    rom_0_10_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_10_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_39)) 
    rom_0_10_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_10_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_10_41)) 
    rom_0_10_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_10_41));

  // Stage 1
    assign s_0_10_1_0 = {{2{acts_0_10_1[5]}}, acts_0_10_1} + {{2{acts_0_10_3[5]}}, acts_0_10_3} + {{2{acts_0_10_5[5]}}, acts_0_10_5} + {{2{acts_0_10_9[5]}}, acts_0_10_9};
    registers #(.ARRAY_WIDTH(8)) r_0_10_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_10_1_0), .q(s_0_10_1_0_reg));

    assign s_0_10_1_1 = {{2{acts_0_10_11[5]}}, acts_0_10_11} + {{2{acts_0_10_13[5]}}, acts_0_10_13} + {{2{acts_0_10_17[5]}}, acts_0_10_17} + {{2{acts_0_10_18[5]}}, acts_0_10_18};
    registers #(.ARRAY_WIDTH(8)) r_0_10_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_10_1_1), .q(s_0_10_1_1_reg));

    assign s_0_10_1_2 = {{2{acts_0_10_19[5]}}, acts_0_10_19} + {{2{acts_0_10_20[5]}}, acts_0_10_20} + {{2{acts_0_10_21[5]}}, acts_0_10_21} + {{2{acts_0_10_22[5]}}, acts_0_10_22};
    registers #(.ARRAY_WIDTH(8)) r_0_10_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_10_1_2), .q(s_0_10_1_2_reg));

    assign s_0_10_1_3 = {{2{acts_0_10_23[5]}}, acts_0_10_23} + {{2{acts_0_10_24[5]}}, acts_0_10_24} + {{2{acts_0_10_29[5]}}, acts_0_10_29} + {{2{acts_0_10_30[5]}}, acts_0_10_30};
    registers #(.ARRAY_WIDTH(8)) r_0_10_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_10_1_3), .q(s_0_10_1_3_reg));

    assign s_0_10_1_4 = {{2{acts_0_10_32[5]}}, acts_0_10_32} + {{2{acts_0_10_33[5]}}, acts_0_10_33} + {{2{acts_0_10_34[5]}}, acts_0_10_34} + {{2{acts_0_10_36[5]}}, acts_0_10_36};
    registers #(.ARRAY_WIDTH(8)) r_0_10_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_10_1_4), .q(s_0_10_1_4_reg));

    assign s_0_10_1_5 = {{2{acts_0_10_37[5]}}, acts_0_10_37} + {{2{acts_0_10_38[5]}}, acts_0_10_38} + {{2{acts_0_10_39[5]}}, acts_0_10_39} + {{2{acts_0_10_41[5]}}, acts_0_10_41};
    registers #(.ARRAY_WIDTH(8)) r_0_10_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_10_1_5), .q(s_0_10_1_5_reg));

  // Stage 2
    assign s_0_10_2_0 = {{2{s_0_10_1_0_reg[7]}}, s_0_10_1_0_reg} + {{2{s_0_10_1_1_reg[7]}}, s_0_10_1_1_reg} + {{2{s_0_10_1_2_reg[7]}}, s_0_10_1_2_reg} + {{2{s_0_10_1_3_reg[7]}}, s_0_10_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_10_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_10_2_0), .q(s_0_10_2_0_reg));

    assign s_0_10_2_1 = {{2{s_0_10_1_4_reg[7]}}, s_0_10_1_4_reg} + {{2{s_0_10_1_5_reg[7]}}, s_0_10_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_10_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_10_2_1), .q(s_0_10_2_1_reg));

  // Stage 3
    assign sum_0_10 = {{2{s_0_10_2_0_reg[9]}}, s_0_10_2_0_reg} + {{2{s_0_10_2_1_reg[9]}}, s_0_10_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_10), .q(sum_0_10_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_10 (.i_data(sum_0_10_reg), .o_data(out_0_10_sat));


    // Layer 0, Node 11
      logic  [7:0] s_0_11_1_0, s_0_11_1_1, s_0_11_1_2, s_0_11_1_3, s_0_11_1_4;
    logic  [7:0] s_0_11_1_0_reg, s_0_11_1_1_reg, s_0_11_1_2_reg, s_0_11_1_3_reg, s_0_11_1_4_reg;
    logic  [9:0] s_0_11_2_0, s_0_11_2_1;
    logic  [9:0] s_0_11_2_0_reg, s_0_11_2_1_reg;
    logic [11:0] sum_0_11;
    logic [11:0] sum_0_11_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_0)) 
    rom_0_11_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_11_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_1)) 
    rom_0_11_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_11_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_2)) 
    rom_0_11_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_11_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_3)) 
    rom_0_11_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_11_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_5)) 
    rom_0_11_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_11_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_6)) 
    rom_0_11_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_11_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_11)) 
    rom_0_11_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_11_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_12)) 
    rom_0_11_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_11_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_14)) 
    rom_0_11_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_11_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_19)) 
    rom_0_11_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_11_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_25)) 
    rom_0_11_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_11_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_26)) 
    rom_0_11_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_11_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_34)) 
    rom_0_11_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_11_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_37)) 
    rom_0_11_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_11_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_39)) 
    rom_0_11_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_11_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_40)) 
    rom_0_11_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_11_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_11_41)) 
    rom_0_11_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_11_41));

  // Stage 1
    assign s_0_11_1_0 = {{2{acts_0_11_0[5]}}, acts_0_11_0} + {{2{acts_0_11_1[5]}}, acts_0_11_1} + {{2{acts_0_11_2[5]}}, acts_0_11_2} + {{2{acts_0_11_3[5]}}, acts_0_11_3};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_0), .q(s_0_11_1_0_reg));

    assign s_0_11_1_1 = {{2{acts_0_11_5[5]}}, acts_0_11_5} + {{2{acts_0_11_6[5]}}, acts_0_11_6} + {{2{acts_0_11_11[5]}}, acts_0_11_11} + {{2{acts_0_11_12[5]}}, acts_0_11_12};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_1), .q(s_0_11_1_1_reg));

    assign s_0_11_1_2 = {{2{acts_0_11_14[5]}}, acts_0_11_14} + {{2{acts_0_11_19[5]}}, acts_0_11_19} + {{2{acts_0_11_25[5]}}, acts_0_11_25} + {{2{acts_0_11_26[5]}}, acts_0_11_26};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_2), .q(s_0_11_1_2_reg));

    assign s_0_11_1_3 = {{2{acts_0_11_34[5]}}, acts_0_11_34} + {{2{acts_0_11_37[5]}}, acts_0_11_37} + {{2{acts_0_11_39[5]}}, acts_0_11_39} + {{2{acts_0_11_40[5]}}, acts_0_11_40};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_3), .q(s_0_11_1_3_reg));

    assign s_0_11_1_4 = {{2{acts_0_11_41[5]}}, acts_0_11_41};
    registers #(.ARRAY_WIDTH(8)) r_0_11_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_1_4), .q(s_0_11_1_4_reg));

  // Stage 2
    assign s_0_11_2_0 = {{2{s_0_11_1_0_reg[7]}}, s_0_11_1_0_reg} + {{2{s_0_11_1_1_reg[7]}}, s_0_11_1_1_reg} + {{2{s_0_11_1_2_reg[7]}}, s_0_11_1_2_reg} + {{2{s_0_11_1_3_reg[7]}}, s_0_11_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_11_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_2_0), .q(s_0_11_2_0_reg));

    assign s_0_11_2_1 = {{2{s_0_11_1_4_reg[7]}}, s_0_11_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_11_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_11_2_1), .q(s_0_11_2_1_reg));

  // Stage 3
    assign sum_0_11 = {{2{s_0_11_2_0_reg[9]}}, s_0_11_2_0_reg} + {{2{s_0_11_2_1_reg[9]}}, s_0_11_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_11), .q(sum_0_11_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_11 (.i_data(sum_0_11_reg), .o_data(out_0_11_sat));


    // Layer 0, Node 12
      logic  [7:0] s_0_12_1_0, s_0_12_1_1, s_0_12_1_2, s_0_12_1_3;
    logic  [7:0] s_0_12_1_0_reg, s_0_12_1_1_reg, s_0_12_1_2_reg, s_0_12_1_3_reg;
    logic  [9:0] s_0_12_2_0;
    logic  [9:0] s_0_12_2_0_reg;
    logic [11:0] sum_0_12;
    logic [11:0] sum_0_12_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_0)) 
    rom_0_12_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_12_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_1)) 
    rom_0_12_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_12_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_2)) 
    rom_0_12_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_12_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_3)) 
    rom_0_12_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_12_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_13)) 
    rom_0_12_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_12_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_14)) 
    rom_0_12_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_12_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_16)) 
    rom_0_12_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_12_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_17)) 
    rom_0_12_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_12_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_21)) 
    rom_0_12_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_12_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_25)) 
    rom_0_12_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_12_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_31)) 
    rom_0_12_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_12_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_36)) 
    rom_0_12_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_12_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_12_40)) 
    rom_0_12_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_12_40));

  // Stage 1
    assign s_0_12_1_0 = {{2{acts_0_12_0[5]}}, acts_0_12_0} + {{2{acts_0_12_1[5]}}, acts_0_12_1} + {{2{acts_0_12_2[5]}}, acts_0_12_2} + {{2{acts_0_12_3[5]}}, acts_0_12_3};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_0), .q(s_0_12_1_0_reg));

    assign s_0_12_1_1 = {{2{acts_0_12_13[5]}}, acts_0_12_13} + {{2{acts_0_12_14[5]}}, acts_0_12_14} + {{2{acts_0_12_16[5]}}, acts_0_12_16} + {{2{acts_0_12_17[5]}}, acts_0_12_17};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_1), .q(s_0_12_1_1_reg));

    assign s_0_12_1_2 = {{2{acts_0_12_21[5]}}, acts_0_12_21} + {{2{acts_0_12_25[5]}}, acts_0_12_25} + {{2{acts_0_12_31[5]}}, acts_0_12_31} + {{2{acts_0_12_36[5]}}, acts_0_12_36};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_2), .q(s_0_12_1_2_reg));

    assign s_0_12_1_3 = {{2{acts_0_12_40[5]}}, acts_0_12_40};
    registers #(.ARRAY_WIDTH(8)) r_0_12_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_1_3), .q(s_0_12_1_3_reg));

  // Stage 2
    assign s_0_12_2_0 = {{2{s_0_12_1_0_reg[7]}}, s_0_12_1_0_reg} + {{2{s_0_12_1_1_reg[7]}}, s_0_12_1_1_reg} + {{2{s_0_12_1_2_reg[7]}}, s_0_12_1_2_reg} + {{2{s_0_12_1_3_reg[7]}}, s_0_12_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_12_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_12_2_0), .q(s_0_12_2_0_reg));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_12_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_12_2_0_reg[9]}}, s_0_12_2_0_reg}), .q(sum_0_12_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_12 (.i_data(sum_0_12_reg), .o_data(out_0_12_sat));


    // Layer 0, Node 13
      logic  [7:0] s_0_13_1_0, s_0_13_1_1, s_0_13_1_2, s_0_13_1_3, s_0_13_1_4;
    logic  [7:0] s_0_13_1_0_reg, s_0_13_1_1_reg, s_0_13_1_2_reg, s_0_13_1_3_reg, s_0_13_1_4_reg;
    logic  [9:0] s_0_13_2_0, s_0_13_2_1;
    logic  [9:0] s_0_13_2_0_reg, s_0_13_2_1_reg;
    logic [11:0] sum_0_13;
    logic [11:0] sum_0_13_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_0)) 
    rom_0_13_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_13_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_1)) 
    rom_0_13_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_13_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_2)) 
    rom_0_13_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_13_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_7)) 
    rom_0_13_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_13_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_8)) 
    rom_0_13_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_13_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_9)) 
    rom_0_13_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_13_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_10)) 
    rom_0_13_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_13_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_11)) 
    rom_0_13_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_13_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_16)) 
    rom_0_13_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_13_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_17)) 
    rom_0_13_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_13_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_19)) 
    rom_0_13_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_13_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_21)) 
    rom_0_13_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_13_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_29)) 
    rom_0_13_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_13_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_31)) 
    rom_0_13_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_13_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_34)) 
    rom_0_13_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_13_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_36)) 
    rom_0_13_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_13_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_38)) 
    rom_0_13_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_13_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_13_40)) 
    rom_0_13_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_13_40));

  // Stage 1
    assign s_0_13_1_0 = {{2{acts_0_13_0[5]}}, acts_0_13_0} + {{2{acts_0_13_1[5]}}, acts_0_13_1} + {{2{acts_0_13_2[5]}}, acts_0_13_2} + {{2{acts_0_13_7[5]}}, acts_0_13_7};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_0), .q(s_0_13_1_0_reg));

    assign s_0_13_1_1 = {{2{acts_0_13_8[5]}}, acts_0_13_8} + {{2{acts_0_13_9[5]}}, acts_0_13_9} + {{2{acts_0_13_10[5]}}, acts_0_13_10} + {{2{acts_0_13_11[5]}}, acts_0_13_11};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_1), .q(s_0_13_1_1_reg));

    assign s_0_13_1_2 = {{2{acts_0_13_16[5]}}, acts_0_13_16} + {{2{acts_0_13_17[5]}}, acts_0_13_17} + {{2{acts_0_13_19[5]}}, acts_0_13_19} + {{2{acts_0_13_21[5]}}, acts_0_13_21};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_2), .q(s_0_13_1_2_reg));

    assign s_0_13_1_3 = {{2{acts_0_13_29[5]}}, acts_0_13_29} + {{2{acts_0_13_31[5]}}, acts_0_13_31} + {{2{acts_0_13_34[5]}}, acts_0_13_34} + {{2{acts_0_13_36[5]}}, acts_0_13_36};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_3), .q(s_0_13_1_3_reg));

    assign s_0_13_1_4 = {{2{acts_0_13_38[5]}}, acts_0_13_38} + {{2{acts_0_13_40[5]}}, acts_0_13_40};
    registers #(.ARRAY_WIDTH(8)) r_0_13_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_1_4), .q(s_0_13_1_4_reg));

  // Stage 2
    assign s_0_13_2_0 = {{2{s_0_13_1_0_reg[7]}}, s_0_13_1_0_reg} + {{2{s_0_13_1_1_reg[7]}}, s_0_13_1_1_reg} + {{2{s_0_13_1_2_reg[7]}}, s_0_13_1_2_reg} + {{2{s_0_13_1_3_reg[7]}}, s_0_13_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_13_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_2_0), .q(s_0_13_2_0_reg));

    assign s_0_13_2_1 = {{2{s_0_13_1_4_reg[7]}}, s_0_13_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_13_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_13_2_1), .q(s_0_13_2_1_reg));

  // Stage 3
    assign sum_0_13 = {{2{s_0_13_2_0_reg[9]}}, s_0_13_2_0_reg} + {{2{s_0_13_2_1_reg[9]}}, s_0_13_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_13), .q(sum_0_13_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_13 (.i_data(sum_0_13_reg), .o_data(out_0_13_sat));


    // Layer 0, Node 14
      logic  [7:0] s_0_14_1_0, s_0_14_1_1, s_0_14_1_2, s_0_14_1_3, s_0_14_1_4;
    logic  [7:0] s_0_14_1_0_reg, s_0_14_1_1_reg, s_0_14_1_2_reg, s_0_14_1_3_reg, s_0_14_1_4_reg;
    logic  [9:0] s_0_14_2_0, s_0_14_2_1;
    logic  [9:0] s_0_14_2_0_reg, s_0_14_2_1_reg;
    logic [11:0] sum_0_14;
    logic [11:0] sum_0_14_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_0)) 
    rom_0_14_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_14_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_1)) 
    rom_0_14_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_14_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_2)) 
    rom_0_14_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_14_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_4)) 
    rom_0_14_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_14_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_7)) 
    rom_0_14_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_14_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_9)) 
    rom_0_14_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_14_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_10)) 
    rom_0_14_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_14_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_12)) 
    rom_0_14_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_14_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_14)) 
    rom_0_14_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_14_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_15)) 
    rom_0_14_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_14_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_16)) 
    rom_0_14_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_14_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_17)) 
    rom_0_14_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_14_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_18)) 
    rom_0_14_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_14_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_19)) 
    rom_0_14_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_14_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_20)) 
    rom_0_14_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_14_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_25)) 
    rom_0_14_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_14_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_34)) 
    rom_0_14_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_14_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_36)) 
    rom_0_14_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_14_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_14_39)) 
    rom_0_14_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_14_39));

  // Stage 1
    assign s_0_14_1_0 = {{2{acts_0_14_0[5]}}, acts_0_14_0} + {{2{acts_0_14_1[5]}}, acts_0_14_1} + {{2{acts_0_14_2[5]}}, acts_0_14_2} + {{2{acts_0_14_4[5]}}, acts_0_14_4};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_0), .q(s_0_14_1_0_reg));

    assign s_0_14_1_1 = {{2{acts_0_14_7[5]}}, acts_0_14_7} + {{2{acts_0_14_9[5]}}, acts_0_14_9} + {{2{acts_0_14_10[5]}}, acts_0_14_10} + {{2{acts_0_14_12[5]}}, acts_0_14_12};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_1), .q(s_0_14_1_1_reg));

    assign s_0_14_1_2 = {{2{acts_0_14_14[5]}}, acts_0_14_14} + {{2{acts_0_14_15[5]}}, acts_0_14_15} + {{2{acts_0_14_16[5]}}, acts_0_14_16} + {{2{acts_0_14_17[5]}}, acts_0_14_17};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_2), .q(s_0_14_1_2_reg));

    assign s_0_14_1_3 = {{2{acts_0_14_18[5]}}, acts_0_14_18} + {{2{acts_0_14_19[5]}}, acts_0_14_19} + {{2{acts_0_14_20[5]}}, acts_0_14_20} + {{2{acts_0_14_25[5]}}, acts_0_14_25};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_3), .q(s_0_14_1_3_reg));

    assign s_0_14_1_4 = {{2{acts_0_14_34[5]}}, acts_0_14_34} + {{2{acts_0_14_36[5]}}, acts_0_14_36} + {{2{acts_0_14_39[5]}}, acts_0_14_39};
    registers #(.ARRAY_WIDTH(8)) r_0_14_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_1_4), .q(s_0_14_1_4_reg));

  // Stage 2
    assign s_0_14_2_0 = {{2{s_0_14_1_0_reg[7]}}, s_0_14_1_0_reg} + {{2{s_0_14_1_1_reg[7]}}, s_0_14_1_1_reg} + {{2{s_0_14_1_2_reg[7]}}, s_0_14_1_2_reg} + {{2{s_0_14_1_3_reg[7]}}, s_0_14_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_14_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_2_0), .q(s_0_14_2_0_reg));

    assign s_0_14_2_1 = {{2{s_0_14_1_4_reg[7]}}, s_0_14_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_14_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_14_2_1), .q(s_0_14_2_1_reg));

  // Stage 3
    assign sum_0_14 = {{2{s_0_14_2_0_reg[9]}}, s_0_14_2_0_reg} + {{2{s_0_14_2_1_reg[9]}}, s_0_14_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_14), .q(sum_0_14_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_14 (.i_data(sum_0_14_reg), .o_data(out_0_14_sat));


    // Layer 0, Node 15
      logic  [7:0] s_0_15_1_0, s_0_15_1_1, s_0_15_1_2, s_0_15_1_3, s_0_15_1_4, s_0_15_1_5;
    logic  [7:0] s_0_15_1_0_reg, s_0_15_1_1_reg, s_0_15_1_2_reg, s_0_15_1_3_reg, s_0_15_1_4_reg, s_0_15_1_5_reg;
    logic  [9:0] s_0_15_2_0, s_0_15_2_1;
    logic  [9:0] s_0_15_2_0_reg, s_0_15_2_1_reg;
    logic [11:0] sum_0_15;
    logic [11:0] sum_0_15_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_1)) 
    rom_0_15_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_15_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_5)) 
    rom_0_15_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_15_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_7)) 
    rom_0_15_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_15_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_9)) 
    rom_0_15_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_15_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_12)) 
    rom_0_15_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_15_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_14)) 
    rom_0_15_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_15_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_18)) 
    rom_0_15_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_15_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_20)) 
    rom_0_15_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_15_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_21)) 
    rom_0_15_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_15_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_22)) 
    rom_0_15_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_15_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_23)) 
    rom_0_15_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_15_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_24)) 
    rom_0_15_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_15_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_26)) 
    rom_0_15_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_15_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_28)) 
    rom_0_15_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_15_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_29)) 
    rom_0_15_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_15_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_30)) 
    rom_0_15_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_15_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_32)) 
    rom_0_15_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_15_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_33)) 
    rom_0_15_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_15_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_35)) 
    rom_0_15_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_15_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_36)) 
    rom_0_15_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_15_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_37)) 
    rom_0_15_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_15_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_38)) 
    rom_0_15_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_15_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_15_40)) 
    rom_0_15_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_15_40));

  // Stage 1
    assign s_0_15_1_0 = {{2{acts_0_15_1[5]}}, acts_0_15_1} + {{2{acts_0_15_5[5]}}, acts_0_15_5} + {{2{acts_0_15_7[5]}}, acts_0_15_7} + {{2{acts_0_15_9[5]}}, acts_0_15_9};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_0), .q(s_0_15_1_0_reg));

    assign s_0_15_1_1 = {{2{acts_0_15_12[5]}}, acts_0_15_12} + {{2{acts_0_15_14[5]}}, acts_0_15_14} + {{2{acts_0_15_18[5]}}, acts_0_15_18} + {{2{acts_0_15_20[5]}}, acts_0_15_20};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_1), .q(s_0_15_1_1_reg));

    assign s_0_15_1_2 = {{2{acts_0_15_21[5]}}, acts_0_15_21} + {{2{acts_0_15_22[5]}}, acts_0_15_22} + {{2{acts_0_15_23[5]}}, acts_0_15_23} + {{2{acts_0_15_24[5]}}, acts_0_15_24};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_2), .q(s_0_15_1_2_reg));

    assign s_0_15_1_3 = {{2{acts_0_15_26[5]}}, acts_0_15_26} + {{2{acts_0_15_28[5]}}, acts_0_15_28} + {{2{acts_0_15_29[5]}}, acts_0_15_29} + {{2{acts_0_15_30[5]}}, acts_0_15_30};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_3), .q(s_0_15_1_3_reg));

    assign s_0_15_1_4 = {{2{acts_0_15_32[5]}}, acts_0_15_32} + {{2{acts_0_15_33[5]}}, acts_0_15_33} + {{2{acts_0_15_35[5]}}, acts_0_15_35} + {{2{acts_0_15_36[5]}}, acts_0_15_36};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_4), .q(s_0_15_1_4_reg));

    assign s_0_15_1_5 = {{2{acts_0_15_37[5]}}, acts_0_15_37} + {{2{acts_0_15_38[5]}}, acts_0_15_38} + {{2{acts_0_15_40[5]}}, acts_0_15_40};
    registers #(.ARRAY_WIDTH(8)) r_0_15_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_1_5), .q(s_0_15_1_5_reg));

  // Stage 2
    assign s_0_15_2_0 = {{2{s_0_15_1_0_reg[7]}}, s_0_15_1_0_reg} + {{2{s_0_15_1_1_reg[7]}}, s_0_15_1_1_reg} + {{2{s_0_15_1_2_reg[7]}}, s_0_15_1_2_reg} + {{2{s_0_15_1_3_reg[7]}}, s_0_15_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_15_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_2_0), .q(s_0_15_2_0_reg));

    assign s_0_15_2_1 = {{2{s_0_15_1_4_reg[7]}}, s_0_15_1_4_reg} + {{2{s_0_15_1_5_reg[7]}}, s_0_15_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_15_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_15_2_1), .q(s_0_15_2_1_reg));

  // Stage 3
    assign sum_0_15 = {{2{s_0_15_2_0_reg[9]}}, s_0_15_2_0_reg} + {{2{s_0_15_2_1_reg[9]}}, s_0_15_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_15), .q(sum_0_15_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_15 (.i_data(sum_0_15_reg), .o_data(out_0_15_sat));


    // Layer 0, Node 16
      logic  [7:0] s_0_16_1_0, s_0_16_1_1, s_0_16_1_2, s_0_16_1_3, s_0_16_1_4;
    logic  [7:0] s_0_16_1_0_reg, s_0_16_1_1_reg, s_0_16_1_2_reg, s_0_16_1_3_reg, s_0_16_1_4_reg;
    logic  [9:0] s_0_16_2_0, s_0_16_2_1;
    logic  [9:0] s_0_16_2_0_reg, s_0_16_2_1_reg;
    logic [11:0] sum_0_16;
    logic [11:0] sum_0_16_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_0)) 
    rom_0_16_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_16_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_1)) 
    rom_0_16_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_16_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_3)) 
    rom_0_16_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_16_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_5)) 
    rom_0_16_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_16_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_6)) 
    rom_0_16_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_16_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_7)) 
    rom_0_16_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_16_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_9)) 
    rom_0_16_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_16_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_11)) 
    rom_0_16_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_16_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_13)) 
    rom_0_16_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_16_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_16)) 
    rom_0_16_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_16_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_17)) 
    rom_0_16_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_16_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_19)) 
    rom_0_16_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_16_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_22)) 
    rom_0_16_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_16_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_23)) 
    rom_0_16_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_16_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_24)) 
    rom_0_16_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_16_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_32)) 
    rom_0_16_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_16_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_37)) 
    rom_0_16_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_16_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_16_40)) 
    rom_0_16_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_16_40));

  // Stage 1
    assign s_0_16_1_0 = {{2{acts_0_16_0[5]}}, acts_0_16_0} + {{2{acts_0_16_1[5]}}, acts_0_16_1} + {{2{acts_0_16_3[5]}}, acts_0_16_3} + {{2{acts_0_16_5[5]}}, acts_0_16_5};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_0), .q(s_0_16_1_0_reg));

    assign s_0_16_1_1 = {{2{acts_0_16_6[5]}}, acts_0_16_6} + {{2{acts_0_16_7[5]}}, acts_0_16_7} + {{2{acts_0_16_9[5]}}, acts_0_16_9} + {{2{acts_0_16_11[5]}}, acts_0_16_11};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_1), .q(s_0_16_1_1_reg));

    assign s_0_16_1_2 = {{2{acts_0_16_13[5]}}, acts_0_16_13} + {{2{acts_0_16_16[5]}}, acts_0_16_16} + {{2{acts_0_16_17[5]}}, acts_0_16_17} + {{2{acts_0_16_19[5]}}, acts_0_16_19};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_2), .q(s_0_16_1_2_reg));

    assign s_0_16_1_3 = {{2{acts_0_16_22[5]}}, acts_0_16_22} + {{2{acts_0_16_23[5]}}, acts_0_16_23} + {{2{acts_0_16_24[5]}}, acts_0_16_24} + {{2{acts_0_16_32[5]}}, acts_0_16_32};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_3), .q(s_0_16_1_3_reg));

    assign s_0_16_1_4 = {{2{acts_0_16_37[5]}}, acts_0_16_37} + {{2{acts_0_16_40[5]}}, acts_0_16_40};
    registers #(.ARRAY_WIDTH(8)) r_0_16_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_1_4), .q(s_0_16_1_4_reg));

  // Stage 2
    assign s_0_16_2_0 = {{2{s_0_16_1_0_reg[7]}}, s_0_16_1_0_reg} + {{2{s_0_16_1_1_reg[7]}}, s_0_16_1_1_reg} + {{2{s_0_16_1_2_reg[7]}}, s_0_16_1_2_reg} + {{2{s_0_16_1_3_reg[7]}}, s_0_16_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_16_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_2_0), .q(s_0_16_2_0_reg));

    assign s_0_16_2_1 = {{2{s_0_16_1_4_reg[7]}}, s_0_16_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_16_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_16_2_1), .q(s_0_16_2_1_reg));

  // Stage 3
    assign sum_0_16 = {{2{s_0_16_2_0_reg[9]}}, s_0_16_2_0_reg} + {{2{s_0_16_2_1_reg[9]}}, s_0_16_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_16), .q(sum_0_16_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_16 (.i_data(sum_0_16_reg), .o_data(out_0_16_sat));


    // Layer 0, Node 17
      logic  [7:0] s_0_17_1_0, s_0_17_1_1, s_0_17_1_2, s_0_17_1_3, s_0_17_1_4;
    logic  [7:0] s_0_17_1_0_reg, s_0_17_1_1_reg, s_0_17_1_2_reg, s_0_17_1_3_reg, s_0_17_1_4_reg;
    logic  [9:0] s_0_17_2_0, s_0_17_2_1;
    logic  [9:0] s_0_17_2_0_reg, s_0_17_2_1_reg;
    logic [11:0] sum_0_17;
    logic [11:0] sum_0_17_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_0)) 
    rom_0_17_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_17_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_2)) 
    rom_0_17_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_17_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_9)) 
    rom_0_17_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_17_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_12)) 
    rom_0_17_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_17_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_13)) 
    rom_0_17_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_17_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_16)) 
    rom_0_17_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_17_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_17)) 
    rom_0_17_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_17_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_21)) 
    rom_0_17_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_17_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_23)) 
    rom_0_17_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_17_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_25)) 
    rom_0_17_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_17_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_26)) 
    rom_0_17_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_17_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_29)) 
    rom_0_17_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_17_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_30)) 
    rom_0_17_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_17_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_33)) 
    rom_0_17_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_17_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_34)) 
    rom_0_17_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_17_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_35)) 
    rom_0_17_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_17_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_39)) 
    rom_0_17_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_17_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_17_40)) 
    rom_0_17_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_17_40));

  // Stage 1
    assign s_0_17_1_0 = {{2{acts_0_17_0[5]}}, acts_0_17_0} + {{2{acts_0_17_2[5]}}, acts_0_17_2} + {{2{acts_0_17_9[5]}}, acts_0_17_9} + {{2{acts_0_17_12[5]}}, acts_0_17_12};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_0), .q(s_0_17_1_0_reg));

    assign s_0_17_1_1 = {{2{acts_0_17_13[5]}}, acts_0_17_13} + {{2{acts_0_17_16[5]}}, acts_0_17_16} + {{2{acts_0_17_17[5]}}, acts_0_17_17} + {{2{acts_0_17_21[5]}}, acts_0_17_21};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_1), .q(s_0_17_1_1_reg));

    assign s_0_17_1_2 = {{2{acts_0_17_23[5]}}, acts_0_17_23} + {{2{acts_0_17_25[5]}}, acts_0_17_25} + {{2{acts_0_17_26[5]}}, acts_0_17_26} + {{2{acts_0_17_29[5]}}, acts_0_17_29};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_2), .q(s_0_17_1_2_reg));

    assign s_0_17_1_3 = {{2{acts_0_17_30[5]}}, acts_0_17_30} + {{2{acts_0_17_33[5]}}, acts_0_17_33} + {{2{acts_0_17_34[5]}}, acts_0_17_34} + {{2{acts_0_17_35[5]}}, acts_0_17_35};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_3), .q(s_0_17_1_3_reg));

    assign s_0_17_1_4 = {{2{acts_0_17_39[5]}}, acts_0_17_39} + {{2{acts_0_17_40[5]}}, acts_0_17_40};
    registers #(.ARRAY_WIDTH(8)) r_0_17_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_1_4), .q(s_0_17_1_4_reg));

  // Stage 2
    assign s_0_17_2_0 = {{2{s_0_17_1_0_reg[7]}}, s_0_17_1_0_reg} + {{2{s_0_17_1_1_reg[7]}}, s_0_17_1_1_reg} + {{2{s_0_17_1_2_reg[7]}}, s_0_17_1_2_reg} + {{2{s_0_17_1_3_reg[7]}}, s_0_17_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_17_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_2_0), .q(s_0_17_2_0_reg));

    assign s_0_17_2_1 = {{2{s_0_17_1_4_reg[7]}}, s_0_17_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_17_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_17_2_1), .q(s_0_17_2_1_reg));

  // Stage 3
    assign sum_0_17 = {{2{s_0_17_2_0_reg[9]}}, s_0_17_2_0_reg} + {{2{s_0_17_2_1_reg[9]}}, s_0_17_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_17), .q(sum_0_17_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_17 (.i_data(sum_0_17_reg), .o_data(out_0_17_sat));


    // Layer 0, Node 18
      logic  [7:0] s_0_18_1_0, s_0_18_1_1, s_0_18_1_2, s_0_18_1_3, s_0_18_1_4, s_0_18_1_5;
    logic  [7:0] s_0_18_1_0_reg, s_0_18_1_1_reg, s_0_18_1_2_reg, s_0_18_1_3_reg, s_0_18_1_4_reg, s_0_18_1_5_reg;
    logic  [9:0] s_0_18_2_0, s_0_18_2_1;
    logic  [9:0] s_0_18_2_0_reg, s_0_18_2_1_reg;
    logic [11:0] sum_0_18;
    logic [11:0] sum_0_18_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_0)) 
    rom_0_18_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_18_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_1)) 
    rom_0_18_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_18_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_2)) 
    rom_0_18_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_18_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_5)) 
    rom_0_18_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_18_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_7)) 
    rom_0_18_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_18_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_15)) 
    rom_0_18_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_18_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_16)) 
    rom_0_18_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_18_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_17)) 
    rom_0_18_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_18_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_19)) 
    rom_0_18_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_18_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_21)) 
    rom_0_18_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_18_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_22)) 
    rom_0_18_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_18_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_23)) 
    rom_0_18_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_18_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_24)) 
    rom_0_18_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_18_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_28)) 
    rom_0_18_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_18_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_29)) 
    rom_0_18_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_18_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_31)) 
    rom_0_18_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_18_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_32)) 
    rom_0_18_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_18_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_33)) 
    rom_0_18_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_18_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_34)) 
    rom_0_18_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_18_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_36)) 
    rom_0_18_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_18_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_39)) 
    rom_0_18_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_18_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_18_40)) 
    rom_0_18_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_18_40));

  // Stage 1
    assign s_0_18_1_0 = {{2{acts_0_18_0[5]}}, acts_0_18_0} + {{2{acts_0_18_1[5]}}, acts_0_18_1} + {{2{acts_0_18_2[5]}}, acts_0_18_2} + {{2{acts_0_18_5[5]}}, acts_0_18_5};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_0), .q(s_0_18_1_0_reg));

    assign s_0_18_1_1 = {{2{acts_0_18_7[5]}}, acts_0_18_7} + {{2{acts_0_18_15[5]}}, acts_0_18_15} + {{2{acts_0_18_16[5]}}, acts_0_18_16} + {{2{acts_0_18_17[5]}}, acts_0_18_17};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_1), .q(s_0_18_1_1_reg));

    assign s_0_18_1_2 = {{2{acts_0_18_19[5]}}, acts_0_18_19} + {{2{acts_0_18_21[5]}}, acts_0_18_21} + {{2{acts_0_18_22[5]}}, acts_0_18_22} + {{2{acts_0_18_23[5]}}, acts_0_18_23};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_2), .q(s_0_18_1_2_reg));

    assign s_0_18_1_3 = {{2{acts_0_18_24[5]}}, acts_0_18_24} + {{2{acts_0_18_28[5]}}, acts_0_18_28} + {{2{acts_0_18_29[5]}}, acts_0_18_29} + {{2{acts_0_18_31[5]}}, acts_0_18_31};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_3), .q(s_0_18_1_3_reg));

    assign s_0_18_1_4 = {{2{acts_0_18_32[5]}}, acts_0_18_32} + {{2{acts_0_18_33[5]}}, acts_0_18_33} + {{2{acts_0_18_34[5]}}, acts_0_18_34} + {{2{acts_0_18_36[5]}}, acts_0_18_36};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_4), .q(s_0_18_1_4_reg));

    assign s_0_18_1_5 = {{2{acts_0_18_39[5]}}, acts_0_18_39} + {{2{acts_0_18_40[5]}}, acts_0_18_40};
    registers #(.ARRAY_WIDTH(8)) r_0_18_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_1_5), .q(s_0_18_1_5_reg));

  // Stage 2
    assign s_0_18_2_0 = {{2{s_0_18_1_0_reg[7]}}, s_0_18_1_0_reg} + {{2{s_0_18_1_1_reg[7]}}, s_0_18_1_1_reg} + {{2{s_0_18_1_2_reg[7]}}, s_0_18_1_2_reg} + {{2{s_0_18_1_3_reg[7]}}, s_0_18_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_18_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_2_0), .q(s_0_18_2_0_reg));

    assign s_0_18_2_1 = {{2{s_0_18_1_4_reg[7]}}, s_0_18_1_4_reg} + {{2{s_0_18_1_5_reg[7]}}, s_0_18_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_18_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_18_2_1), .q(s_0_18_2_1_reg));

  // Stage 3
    assign sum_0_18 = {{2{s_0_18_2_0_reg[9]}}, s_0_18_2_0_reg} + {{2{s_0_18_2_1_reg[9]}}, s_0_18_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_18), .q(sum_0_18_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_18 (.i_data(sum_0_18_reg), .o_data(out_0_18_sat));


    // Layer 0, Node 19
      logic  [7:0] s_0_19_1_0, s_0_19_1_1, s_0_19_1_2, s_0_19_1_3, s_0_19_1_4, s_0_19_1_5;
    logic  [7:0] s_0_19_1_0_reg, s_0_19_1_1_reg, s_0_19_1_2_reg, s_0_19_1_3_reg, s_0_19_1_4_reg, s_0_19_1_5_reg;
    logic  [9:0] s_0_19_2_0, s_0_19_2_1;
    logic  [9:0] s_0_19_2_0_reg, s_0_19_2_1_reg;
    logic [11:0] sum_0_19;
    logic [11:0] sum_0_19_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_1)) 
    rom_0_19_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_19_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_3)) 
    rom_0_19_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_19_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_4)) 
    rom_0_19_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_19_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_7)) 
    rom_0_19_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_19_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_8)) 
    rom_0_19_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_19_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_9)) 
    rom_0_19_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_19_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_11)) 
    rom_0_19_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_19_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_12)) 
    rom_0_19_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_19_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_13)) 
    rom_0_19_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_19_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_16)) 
    rom_0_19_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_19_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_17)) 
    rom_0_19_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_19_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_24)) 
    rom_0_19_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_19_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_26)) 
    rom_0_19_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_19_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_27)) 
    rom_0_19_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_19_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_28)) 
    rom_0_19_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_19_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_29)) 
    rom_0_19_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_19_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_30)) 
    rom_0_19_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_19_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_31)) 
    rom_0_19_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_19_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_33)) 
    rom_0_19_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_19_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_35)) 
    rom_0_19_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_19_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_37)) 
    rom_0_19_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_19_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_19_38)) 
    rom_0_19_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_19_38));

  // Stage 1
    assign s_0_19_1_0 = {{2{acts_0_19_1[5]}}, acts_0_19_1} + {{2{acts_0_19_3[5]}}, acts_0_19_3} + {{2{acts_0_19_4[5]}}, acts_0_19_4} + {{2{acts_0_19_7[5]}}, acts_0_19_7};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_0), .q(s_0_19_1_0_reg));

    assign s_0_19_1_1 = {{2{acts_0_19_8[5]}}, acts_0_19_8} + {{2{acts_0_19_9[5]}}, acts_0_19_9} + {{2{acts_0_19_11[5]}}, acts_0_19_11} + {{2{acts_0_19_12[5]}}, acts_0_19_12};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_1), .q(s_0_19_1_1_reg));

    assign s_0_19_1_2 = {{2{acts_0_19_13[5]}}, acts_0_19_13} + {{2{acts_0_19_16[5]}}, acts_0_19_16} + {{2{acts_0_19_17[5]}}, acts_0_19_17} + {{2{acts_0_19_24[5]}}, acts_0_19_24};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_2), .q(s_0_19_1_2_reg));

    assign s_0_19_1_3 = {{2{acts_0_19_26[5]}}, acts_0_19_26} + {{2{acts_0_19_27[5]}}, acts_0_19_27} + {{2{acts_0_19_28[5]}}, acts_0_19_28} + {{2{acts_0_19_29[5]}}, acts_0_19_29};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_3), .q(s_0_19_1_3_reg));

    assign s_0_19_1_4 = {{2{acts_0_19_30[5]}}, acts_0_19_30} + {{2{acts_0_19_31[5]}}, acts_0_19_31} + {{2{acts_0_19_33[5]}}, acts_0_19_33} + {{2{acts_0_19_35[5]}}, acts_0_19_35};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_4), .q(s_0_19_1_4_reg));

    assign s_0_19_1_5 = {{2{acts_0_19_37[5]}}, acts_0_19_37} + {{2{acts_0_19_38[5]}}, acts_0_19_38};
    registers #(.ARRAY_WIDTH(8)) r_0_19_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_1_5), .q(s_0_19_1_5_reg));

  // Stage 2
    assign s_0_19_2_0 = {{2{s_0_19_1_0_reg[7]}}, s_0_19_1_0_reg} + {{2{s_0_19_1_1_reg[7]}}, s_0_19_1_1_reg} + {{2{s_0_19_1_2_reg[7]}}, s_0_19_1_2_reg} + {{2{s_0_19_1_3_reg[7]}}, s_0_19_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_19_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_2_0), .q(s_0_19_2_0_reg));

    assign s_0_19_2_1 = {{2{s_0_19_1_4_reg[7]}}, s_0_19_1_4_reg} + {{2{s_0_19_1_5_reg[7]}}, s_0_19_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_19_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_19_2_1), .q(s_0_19_2_1_reg));

  // Stage 3
    assign sum_0_19 = {{2{s_0_19_2_0_reg[9]}}, s_0_19_2_0_reg} + {{2{s_0_19_2_1_reg[9]}}, s_0_19_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_19), .q(sum_0_19_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_19 (.i_data(sum_0_19_reg), .o_data(out_0_19_sat));


    // Layer 0, Node 20
      logic  [7:0] s_0_20_1_0, s_0_20_1_1, s_0_20_1_2, s_0_20_1_3, s_0_20_1_4, s_0_20_1_5;
    logic  [7:0] s_0_20_1_0_reg, s_0_20_1_1_reg, s_0_20_1_2_reg, s_0_20_1_3_reg, s_0_20_1_4_reg, s_0_20_1_5_reg;
    logic  [9:0] s_0_20_2_0, s_0_20_2_1;
    logic  [9:0] s_0_20_2_0_reg, s_0_20_2_1_reg;
    logic [11:0] sum_0_20;
    logic [11:0] sum_0_20_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_1)) 
    rom_0_20_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_20_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_2)) 
    rom_0_20_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_20_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_3)) 
    rom_0_20_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_20_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_5)) 
    rom_0_20_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_20_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_8)) 
    rom_0_20_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_20_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_9)) 
    rom_0_20_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_20_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_10)) 
    rom_0_20_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_20_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_11)) 
    rom_0_20_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_20_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_13)) 
    rom_0_20_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_20_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_15)) 
    rom_0_20_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_20_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_16)) 
    rom_0_20_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_20_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_17)) 
    rom_0_20_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_20_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_19)) 
    rom_0_20_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_20_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_20)) 
    rom_0_20_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_20_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_22)) 
    rom_0_20_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_20_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_23)) 
    rom_0_20_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_20_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_24)) 
    rom_0_20_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_20_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_26)) 
    rom_0_20_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_20_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_28)) 
    rom_0_20_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_20_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_30)) 
    rom_0_20_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_20_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_33)) 
    rom_0_20_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_20_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_34)) 
    rom_0_20_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_20_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_35)) 
    rom_0_20_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_20_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_20_36)) 
    rom_0_20_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_20_36));

  // Stage 1
    assign s_0_20_1_0 = {{2{acts_0_20_1[5]}}, acts_0_20_1} + {{2{acts_0_20_2[5]}}, acts_0_20_2} + {{2{acts_0_20_3[5]}}, acts_0_20_3} + {{2{acts_0_20_5[5]}}, acts_0_20_5};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_0), .q(s_0_20_1_0_reg));

    assign s_0_20_1_1 = {{2{acts_0_20_8[5]}}, acts_0_20_8} + {{2{acts_0_20_9[5]}}, acts_0_20_9} + {{2{acts_0_20_10[5]}}, acts_0_20_10} + {{2{acts_0_20_11[5]}}, acts_0_20_11};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_1), .q(s_0_20_1_1_reg));

    assign s_0_20_1_2 = {{2{acts_0_20_13[5]}}, acts_0_20_13} + {{2{acts_0_20_15[5]}}, acts_0_20_15} + {{2{acts_0_20_16[5]}}, acts_0_20_16} + {{2{acts_0_20_17[5]}}, acts_0_20_17};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_2), .q(s_0_20_1_2_reg));

    assign s_0_20_1_3 = {{2{acts_0_20_19[5]}}, acts_0_20_19} + {{2{acts_0_20_20[5]}}, acts_0_20_20} + {{2{acts_0_20_22[5]}}, acts_0_20_22} + {{2{acts_0_20_23[5]}}, acts_0_20_23};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_3), .q(s_0_20_1_3_reg));

    assign s_0_20_1_4 = {{2{acts_0_20_24[5]}}, acts_0_20_24} + {{2{acts_0_20_26[5]}}, acts_0_20_26} + {{2{acts_0_20_28[5]}}, acts_0_20_28} + {{2{acts_0_20_30[5]}}, acts_0_20_30};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_4), .q(s_0_20_1_4_reg));

    assign s_0_20_1_5 = {{2{acts_0_20_33[5]}}, acts_0_20_33} + {{2{acts_0_20_34[5]}}, acts_0_20_34} + {{2{acts_0_20_35[5]}}, acts_0_20_35} + {{2{acts_0_20_36[5]}}, acts_0_20_36};
    registers #(.ARRAY_WIDTH(8)) r_0_20_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_1_5), .q(s_0_20_1_5_reg));

  // Stage 2
    assign s_0_20_2_0 = {{2{s_0_20_1_0_reg[7]}}, s_0_20_1_0_reg} + {{2{s_0_20_1_1_reg[7]}}, s_0_20_1_1_reg} + {{2{s_0_20_1_2_reg[7]}}, s_0_20_1_2_reg} + {{2{s_0_20_1_3_reg[7]}}, s_0_20_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_20_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_2_0), .q(s_0_20_2_0_reg));

    assign s_0_20_2_1 = {{2{s_0_20_1_4_reg[7]}}, s_0_20_1_4_reg} + {{2{s_0_20_1_5_reg[7]}}, s_0_20_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_20_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_20_2_1), .q(s_0_20_2_1_reg));

  // Stage 3
    assign sum_0_20 = {{2{s_0_20_2_0_reg[9]}}, s_0_20_2_0_reg} + {{2{s_0_20_2_1_reg[9]}}, s_0_20_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_20), .q(sum_0_20_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_20 (.i_data(sum_0_20_reg), .o_data(out_0_20_sat));


    // Layer 0, Node 21
      logic  [7:0] s_0_21_1_0, s_0_21_1_1, s_0_21_1_2, s_0_21_1_3, s_0_21_1_4, s_0_21_1_5, s_0_21_1_6;
    logic  [7:0] s_0_21_1_0_reg, s_0_21_1_1_reg, s_0_21_1_2_reg, s_0_21_1_3_reg, s_0_21_1_4_reg, s_0_21_1_5_reg, s_0_21_1_6_reg;
    logic  [9:0] s_0_21_2_0, s_0_21_2_1;
    logic  [9:0] s_0_21_2_0_reg, s_0_21_2_1_reg;
    logic [11:0] sum_0_21;
    logic [11:0] sum_0_21_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_0)) 
    rom_0_21_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_21_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_2)) 
    rom_0_21_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_21_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_3)) 
    rom_0_21_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_21_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_4)) 
    rom_0_21_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_21_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_6)) 
    rom_0_21_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_21_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_8)) 
    rom_0_21_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_21_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_9)) 
    rom_0_21_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_21_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_11)) 
    rom_0_21_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_21_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_13)) 
    rom_0_21_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_21_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_15)) 
    rom_0_21_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_21_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_16)) 
    rom_0_21_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_21_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_17)) 
    rom_0_21_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_21_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_19)) 
    rom_0_21_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_21_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_20)) 
    rom_0_21_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_21_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_22)) 
    rom_0_21_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_21_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_23)) 
    rom_0_21_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_21_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_24)) 
    rom_0_21_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_21_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_26)) 
    rom_0_21_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_21_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_28)) 
    rom_0_21_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_21_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_29)) 
    rom_0_21_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_21_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_33)) 
    rom_0_21_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_21_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_34)) 
    rom_0_21_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_21_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_35)) 
    rom_0_21_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_21_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_36)) 
    rom_0_21_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_21_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_38)) 
    rom_0_21_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_21_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_21_40)) 
    rom_0_21_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_21_40));

  // Stage 1
    assign s_0_21_1_0 = {{2{acts_0_21_0[5]}}, acts_0_21_0} + {{2{acts_0_21_2[5]}}, acts_0_21_2} + {{2{acts_0_21_3[5]}}, acts_0_21_3} + {{2{acts_0_21_4[5]}}, acts_0_21_4};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_0), .q(s_0_21_1_0_reg));

    assign s_0_21_1_1 = {{2{acts_0_21_6[5]}}, acts_0_21_6} + {{2{acts_0_21_8[5]}}, acts_0_21_8} + {{2{acts_0_21_9[5]}}, acts_0_21_9} + {{2{acts_0_21_11[5]}}, acts_0_21_11};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_1), .q(s_0_21_1_1_reg));

    assign s_0_21_1_2 = {{2{acts_0_21_13[5]}}, acts_0_21_13} + {{2{acts_0_21_15[5]}}, acts_0_21_15} + {{2{acts_0_21_16[5]}}, acts_0_21_16} + {{2{acts_0_21_17[5]}}, acts_0_21_17};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_2), .q(s_0_21_1_2_reg));

    assign s_0_21_1_3 = {{2{acts_0_21_19[5]}}, acts_0_21_19} + {{2{acts_0_21_20[5]}}, acts_0_21_20} + {{2{acts_0_21_22[5]}}, acts_0_21_22} + {{2{acts_0_21_23[5]}}, acts_0_21_23};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_3), .q(s_0_21_1_3_reg));

    assign s_0_21_1_4 = {{2{acts_0_21_24[5]}}, acts_0_21_24} + {{2{acts_0_21_26[5]}}, acts_0_21_26} + {{2{acts_0_21_28[5]}}, acts_0_21_28} + {{2{acts_0_21_29[5]}}, acts_0_21_29};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_4), .q(s_0_21_1_4_reg));

    assign s_0_21_1_5 = {{2{acts_0_21_33[5]}}, acts_0_21_33} + {{2{acts_0_21_34[5]}}, acts_0_21_34} + {{2{acts_0_21_35[5]}}, acts_0_21_35} + {{2{acts_0_21_36[5]}}, acts_0_21_36};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_5), .q(s_0_21_1_5_reg));

    assign s_0_21_1_6 = {{2{acts_0_21_38[5]}}, acts_0_21_38} + {{2{acts_0_21_40[5]}}, acts_0_21_40};
    registers #(.ARRAY_WIDTH(8)) r_0_21_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_1_6), .q(s_0_21_1_6_reg));

  // Stage 2
    assign s_0_21_2_0 = {{2{s_0_21_1_0_reg[7]}}, s_0_21_1_0_reg} + {{2{s_0_21_1_1_reg[7]}}, s_0_21_1_1_reg} + {{2{s_0_21_1_2_reg[7]}}, s_0_21_1_2_reg} + {{2{s_0_21_1_3_reg[7]}}, s_0_21_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_21_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_2_0), .q(s_0_21_2_0_reg));

    assign s_0_21_2_1 = {{2{s_0_21_1_4_reg[7]}}, s_0_21_1_4_reg} + {{2{s_0_21_1_5_reg[7]}}, s_0_21_1_5_reg} + {{2{s_0_21_1_6_reg[7]}}, s_0_21_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_21_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_21_2_1), .q(s_0_21_2_1_reg));

  // Stage 3
    assign sum_0_21 = {{2{s_0_21_2_0_reg[9]}}, s_0_21_2_0_reg} + {{2{s_0_21_2_1_reg[9]}}, s_0_21_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_21), .q(sum_0_21_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_21 (.i_data(sum_0_21_reg), .o_data(out_0_21_sat));


    // Layer 0, Node 22
      logic  [7:0] s_0_22_1_0, s_0_22_1_1, s_0_22_1_2, s_0_22_1_3, s_0_22_1_4;
    logic  [7:0] s_0_22_1_0_reg, s_0_22_1_1_reg, s_0_22_1_2_reg, s_0_22_1_3_reg, s_0_22_1_4_reg;
    logic  [9:0] s_0_22_2_0, s_0_22_2_1;
    logic  [9:0] s_0_22_2_0_reg, s_0_22_2_1_reg;
    logic [11:0] sum_0_22;
    logic [11:0] sum_0_22_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_0)) 
    rom_0_22_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_22_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_4)) 
    rom_0_22_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_22_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_7)) 
    rom_0_22_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_22_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_12)) 
    rom_0_22_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_22_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_14)) 
    rom_0_22_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_22_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_15)) 
    rom_0_22_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_22_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_16)) 
    rom_0_22_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_22_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_17)) 
    rom_0_22_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_22_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_18)) 
    rom_0_22_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_22_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_22)) 
    rom_0_22_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_22_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_27)) 
    rom_0_22_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_22_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_28)) 
    rom_0_22_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_22_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_30)) 
    rom_0_22_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_22_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_33)) 
    rom_0_22_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_22_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_35)) 
    rom_0_22_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_22_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_37)) 
    rom_0_22_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_22_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_38)) 
    rom_0_22_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_22_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_39)) 
    rom_0_22_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_22_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_40)) 
    rom_0_22_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_22_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_22_41)) 
    rom_0_22_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_22_41));

  // Stage 1
    assign s_0_22_1_0 = {{2{acts_0_22_0[5]}}, acts_0_22_0} + {{2{acts_0_22_4[5]}}, acts_0_22_4} + {{2{acts_0_22_7[5]}}, acts_0_22_7} + {{2{acts_0_22_12[5]}}, acts_0_22_12};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_0), .q(s_0_22_1_0_reg));

    assign s_0_22_1_1 = {{2{acts_0_22_14[5]}}, acts_0_22_14} + {{2{acts_0_22_15[5]}}, acts_0_22_15} + {{2{acts_0_22_16[5]}}, acts_0_22_16} + {{2{acts_0_22_17[5]}}, acts_0_22_17};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_1), .q(s_0_22_1_1_reg));

    assign s_0_22_1_2 = {{2{acts_0_22_18[5]}}, acts_0_22_18} + {{2{acts_0_22_22[5]}}, acts_0_22_22} + {{2{acts_0_22_27[5]}}, acts_0_22_27} + {{2{acts_0_22_28[5]}}, acts_0_22_28};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_2), .q(s_0_22_1_2_reg));

    assign s_0_22_1_3 = {{2{acts_0_22_30[5]}}, acts_0_22_30} + {{2{acts_0_22_33[5]}}, acts_0_22_33} + {{2{acts_0_22_35[5]}}, acts_0_22_35} + {{2{acts_0_22_37[5]}}, acts_0_22_37};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_3), .q(s_0_22_1_3_reg));

    assign s_0_22_1_4 = {{2{acts_0_22_38[5]}}, acts_0_22_38} + {{2{acts_0_22_39[5]}}, acts_0_22_39} + {{2{acts_0_22_40[5]}}, acts_0_22_40} + {{2{acts_0_22_41[5]}}, acts_0_22_41};
    registers #(.ARRAY_WIDTH(8)) r_0_22_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_1_4), .q(s_0_22_1_4_reg));

  // Stage 2
    assign s_0_22_2_0 = {{2{s_0_22_1_0_reg[7]}}, s_0_22_1_0_reg} + {{2{s_0_22_1_1_reg[7]}}, s_0_22_1_1_reg} + {{2{s_0_22_1_2_reg[7]}}, s_0_22_1_2_reg} + {{2{s_0_22_1_3_reg[7]}}, s_0_22_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_22_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_2_0), .q(s_0_22_2_0_reg));

    assign s_0_22_2_1 = {{2{s_0_22_1_4_reg[7]}}, s_0_22_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_22_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_22_2_1), .q(s_0_22_2_1_reg));

  // Stage 3
    assign sum_0_22 = {{2{s_0_22_2_0_reg[9]}}, s_0_22_2_0_reg} + {{2{s_0_22_2_1_reg[9]}}, s_0_22_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_22), .q(sum_0_22_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_22 (.i_data(sum_0_22_reg), .o_data(out_0_22_sat));


    // Layer 0, Node 23
      logic  [7:0] s_0_23_1_0, s_0_23_1_1, s_0_23_1_2, s_0_23_1_3;
    logic  [7:0] s_0_23_1_0_reg, s_0_23_1_1_reg, s_0_23_1_2_reg, s_0_23_1_3_reg;
    logic  [9:0] s_0_23_2_0;
    logic  [9:0] s_0_23_2_0_reg;
    logic [11:0] sum_0_23;
    logic [11:0] sum_0_23_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_0)) 
    rom_0_23_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_23_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_2)) 
    rom_0_23_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_23_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_3)) 
    rom_0_23_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_23_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_11)) 
    rom_0_23_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_23_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_12)) 
    rom_0_23_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_23_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_13)) 
    rom_0_23_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_23_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_16)) 
    rom_0_23_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_23_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_17)) 
    rom_0_23_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_23_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_22)) 
    rom_0_23_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_23_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_25)) 
    rom_0_23_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_23_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_27)) 
    rom_0_23_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_23_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_29)) 
    rom_0_23_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_23_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_33)) 
    rom_0_23_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_23_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_23_36)) 
    rom_0_23_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_23_36));

  // Stage 1
    assign s_0_23_1_0 = {{2{acts_0_23_0[5]}}, acts_0_23_0} + {{2{acts_0_23_2[5]}}, acts_0_23_2} + {{2{acts_0_23_3[5]}}, acts_0_23_3} + {{2{acts_0_23_11[5]}}, acts_0_23_11};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_0), .q(s_0_23_1_0_reg));

    assign s_0_23_1_1 = {{2{acts_0_23_12[5]}}, acts_0_23_12} + {{2{acts_0_23_13[5]}}, acts_0_23_13} + {{2{acts_0_23_16[5]}}, acts_0_23_16} + {{2{acts_0_23_17[5]}}, acts_0_23_17};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_1), .q(s_0_23_1_1_reg));

    assign s_0_23_1_2 = {{2{acts_0_23_22[5]}}, acts_0_23_22} + {{2{acts_0_23_25[5]}}, acts_0_23_25} + {{2{acts_0_23_27[5]}}, acts_0_23_27} + {{2{acts_0_23_29[5]}}, acts_0_23_29};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_2), .q(s_0_23_1_2_reg));

    assign s_0_23_1_3 = {{2{acts_0_23_33[5]}}, acts_0_23_33} + {{2{acts_0_23_36[5]}}, acts_0_23_36};
    registers #(.ARRAY_WIDTH(8)) r_0_23_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_1_3), .q(s_0_23_1_3_reg));

  // Stage 2
    assign s_0_23_2_0 = {{2{s_0_23_1_0_reg[7]}}, s_0_23_1_0_reg} + {{2{s_0_23_1_1_reg[7]}}, s_0_23_1_1_reg} + {{2{s_0_23_1_2_reg[7]}}, s_0_23_1_2_reg} + {{2{s_0_23_1_3_reg[7]}}, s_0_23_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_23_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_23_2_0), .q(s_0_23_2_0_reg));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_23_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_23_2_0_reg[9]}}, s_0_23_2_0_reg}), .q(sum_0_23_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_23 (.i_data(sum_0_23_reg), .o_data(out_0_23_sat));


    // Layer 0, Node 24
      logic  [7:0] s_0_24_1_0, s_0_24_1_1, s_0_24_1_2, s_0_24_1_3, s_0_24_1_4, s_0_24_1_5, s_0_24_1_6;
    logic  [7:0] s_0_24_1_0_reg, s_0_24_1_1_reg, s_0_24_1_2_reg, s_0_24_1_3_reg, s_0_24_1_4_reg, s_0_24_1_5_reg, s_0_24_1_6_reg;
    logic  [9:0] s_0_24_2_0, s_0_24_2_1;
    logic  [9:0] s_0_24_2_0_reg, s_0_24_2_1_reg;
    logic [11:0] sum_0_24;
    logic [11:0] sum_0_24_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_0)) 
    rom_0_24_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_24_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_1)) 
    rom_0_24_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_24_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_2)) 
    rom_0_24_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_24_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_3)) 
    rom_0_24_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_24_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_4)) 
    rom_0_24_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_24_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_5)) 
    rom_0_24_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_24_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_6)) 
    rom_0_24_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_24_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_7)) 
    rom_0_24_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_24_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_9)) 
    rom_0_24_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_24_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_11)) 
    rom_0_24_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_24_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_12)) 
    rom_0_24_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_24_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_15)) 
    rom_0_24_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_24_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_16)) 
    rom_0_24_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_24_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_17)) 
    rom_0_24_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_24_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_23)) 
    rom_0_24_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_24_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_29)) 
    rom_0_24_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_24_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_30)) 
    rom_0_24_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_24_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_31)) 
    rom_0_24_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_24_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_32)) 
    rom_0_24_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_24_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_33)) 
    rom_0_24_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_24_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_34)) 
    rom_0_24_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_24_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_37)) 
    rom_0_24_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_24_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_39)) 
    rom_0_24_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_24_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_40)) 
    rom_0_24_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_24_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_24_41)) 
    rom_0_24_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_24_41));

  // Stage 1
    assign s_0_24_1_0 = {{2{acts_0_24_0[5]}}, acts_0_24_0} + {{2{acts_0_24_1[5]}}, acts_0_24_1} + {{2{acts_0_24_2[5]}}, acts_0_24_2} + {{2{acts_0_24_3[5]}}, acts_0_24_3};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_0), .q(s_0_24_1_0_reg));

    assign s_0_24_1_1 = {{2{acts_0_24_4[5]}}, acts_0_24_4} + {{2{acts_0_24_5[5]}}, acts_0_24_5} + {{2{acts_0_24_6[5]}}, acts_0_24_6} + {{2{acts_0_24_7[5]}}, acts_0_24_7};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_1), .q(s_0_24_1_1_reg));

    assign s_0_24_1_2 = {{2{acts_0_24_9[5]}}, acts_0_24_9} + {{2{acts_0_24_11[5]}}, acts_0_24_11} + {{2{acts_0_24_12[5]}}, acts_0_24_12} + {{2{acts_0_24_15[5]}}, acts_0_24_15};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_2), .q(s_0_24_1_2_reg));

    assign s_0_24_1_3 = {{2{acts_0_24_16[5]}}, acts_0_24_16} + {{2{acts_0_24_17[5]}}, acts_0_24_17} + {{2{acts_0_24_23[5]}}, acts_0_24_23} + {{2{acts_0_24_29[5]}}, acts_0_24_29};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_3), .q(s_0_24_1_3_reg));

    assign s_0_24_1_4 = {{2{acts_0_24_30[5]}}, acts_0_24_30} + {{2{acts_0_24_31[5]}}, acts_0_24_31} + {{2{acts_0_24_32[5]}}, acts_0_24_32} + {{2{acts_0_24_33[5]}}, acts_0_24_33};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_4), .q(s_0_24_1_4_reg));

    assign s_0_24_1_5 = {{2{acts_0_24_34[5]}}, acts_0_24_34} + {{2{acts_0_24_37[5]}}, acts_0_24_37} + {{2{acts_0_24_39[5]}}, acts_0_24_39} + {{2{acts_0_24_40[5]}}, acts_0_24_40};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_5), .q(s_0_24_1_5_reg));

    assign s_0_24_1_6 = {{2{acts_0_24_41[5]}}, acts_0_24_41};
    registers #(.ARRAY_WIDTH(8)) r_0_24_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_1_6), .q(s_0_24_1_6_reg));

  // Stage 2
    assign s_0_24_2_0 = {{2{s_0_24_1_0_reg[7]}}, s_0_24_1_0_reg} + {{2{s_0_24_1_1_reg[7]}}, s_0_24_1_1_reg} + {{2{s_0_24_1_2_reg[7]}}, s_0_24_1_2_reg} + {{2{s_0_24_1_3_reg[7]}}, s_0_24_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_24_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_2_0), .q(s_0_24_2_0_reg));

    assign s_0_24_2_1 = {{2{s_0_24_1_4_reg[7]}}, s_0_24_1_4_reg} + {{2{s_0_24_1_5_reg[7]}}, s_0_24_1_5_reg} + {{2{s_0_24_1_6_reg[7]}}, s_0_24_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_24_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_24_2_1), .q(s_0_24_2_1_reg));

  // Stage 3
    assign sum_0_24 = {{2{s_0_24_2_0_reg[9]}}, s_0_24_2_0_reg} + {{2{s_0_24_2_1_reg[9]}}, s_0_24_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_24), .q(sum_0_24_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_24 (.i_data(sum_0_24_reg), .o_data(out_0_24_sat));


    // Layer 0, Node 25
      logic  [7:0] s_0_25_1_0, s_0_25_1_1, s_0_25_1_2, s_0_25_1_3, s_0_25_1_4;
    logic  [7:0] s_0_25_1_0_reg, s_0_25_1_1_reg, s_0_25_1_2_reg, s_0_25_1_3_reg, s_0_25_1_4_reg;
    logic  [9:0] s_0_25_2_0, s_0_25_2_1;
    logic  [9:0] s_0_25_2_0_reg, s_0_25_2_1_reg;
    logic [11:0] sum_0_25;
    logic [11:0] sum_0_25_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_1)) 
    rom_0_25_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_25_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_2)) 
    rom_0_25_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_25_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_4)) 
    rom_0_25_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_25_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_11)) 
    rom_0_25_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_25_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_12)) 
    rom_0_25_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_25_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_14)) 
    rom_0_25_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_25_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_16)) 
    rom_0_25_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_25_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_17)) 
    rom_0_25_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_25_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_18)) 
    rom_0_25_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_25_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_21)) 
    rom_0_25_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_25_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_22)) 
    rom_0_25_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_25_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_25)) 
    rom_0_25_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_25_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_28)) 
    rom_0_25_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_25_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_29)) 
    rom_0_25_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_25_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_33)) 
    rom_0_25_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_25_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_35)) 
    rom_0_25_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_25_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_37)) 
    rom_0_25_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_25_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_38)) 
    rom_0_25_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_25_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_39)) 
    rom_0_25_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_25_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_25_40)) 
    rom_0_25_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_25_40));

  // Stage 1
    assign s_0_25_1_0 = {{2{acts_0_25_1[5]}}, acts_0_25_1} + {{2{acts_0_25_2[5]}}, acts_0_25_2} + {{2{acts_0_25_4[5]}}, acts_0_25_4} + {{2{acts_0_25_11[5]}}, acts_0_25_11};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_0), .q(s_0_25_1_0_reg));

    assign s_0_25_1_1 = {{2{acts_0_25_12[5]}}, acts_0_25_12} + {{2{acts_0_25_14[5]}}, acts_0_25_14} + {{2{acts_0_25_16[5]}}, acts_0_25_16} + {{2{acts_0_25_17[5]}}, acts_0_25_17};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_1), .q(s_0_25_1_1_reg));

    assign s_0_25_1_2 = {{2{acts_0_25_18[5]}}, acts_0_25_18} + {{2{acts_0_25_21[5]}}, acts_0_25_21} + {{2{acts_0_25_22[5]}}, acts_0_25_22} + {{2{acts_0_25_25[5]}}, acts_0_25_25};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_2), .q(s_0_25_1_2_reg));

    assign s_0_25_1_3 = {{2{acts_0_25_28[5]}}, acts_0_25_28} + {{2{acts_0_25_29[5]}}, acts_0_25_29} + {{2{acts_0_25_33[5]}}, acts_0_25_33} + {{2{acts_0_25_35[5]}}, acts_0_25_35};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_3), .q(s_0_25_1_3_reg));

    assign s_0_25_1_4 = {{2{acts_0_25_37[5]}}, acts_0_25_37} + {{2{acts_0_25_38[5]}}, acts_0_25_38} + {{2{acts_0_25_39[5]}}, acts_0_25_39} + {{2{acts_0_25_40[5]}}, acts_0_25_40};
    registers #(.ARRAY_WIDTH(8)) r_0_25_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_1_4), .q(s_0_25_1_4_reg));

  // Stage 2
    assign s_0_25_2_0 = {{2{s_0_25_1_0_reg[7]}}, s_0_25_1_0_reg} + {{2{s_0_25_1_1_reg[7]}}, s_0_25_1_1_reg} + {{2{s_0_25_1_2_reg[7]}}, s_0_25_1_2_reg} + {{2{s_0_25_1_3_reg[7]}}, s_0_25_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_25_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_2_0), .q(s_0_25_2_0_reg));

    assign s_0_25_2_1 = {{2{s_0_25_1_4_reg[7]}}, s_0_25_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_25_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_25_2_1), .q(s_0_25_2_1_reg));

  // Stage 3
    assign sum_0_25 = {{2{s_0_25_2_0_reg[9]}}, s_0_25_2_0_reg} + {{2{s_0_25_2_1_reg[9]}}, s_0_25_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_25), .q(sum_0_25_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_25 (.i_data(sum_0_25_reg), .o_data(out_0_25_sat));


    // Layer 0, Node 26
      logic  [7:0] s_0_26_1_0, s_0_26_1_1, s_0_26_1_2, s_0_26_1_3, s_0_26_1_4;
    logic  [7:0] s_0_26_1_0_reg, s_0_26_1_1_reg, s_0_26_1_2_reg, s_0_26_1_3_reg, s_0_26_1_4_reg;
    logic  [9:0] s_0_26_2_0, s_0_26_2_1;
    logic  [9:0] s_0_26_2_0_reg, s_0_26_2_1_reg;
    logic [11:0] sum_0_26;
    logic [11:0] sum_0_26_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_1)) 
    rom_0_26_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_26_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_2)) 
    rom_0_26_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_26_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_3)) 
    rom_0_26_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_26_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_5)) 
    rom_0_26_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_26_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_6)) 
    rom_0_26_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_26_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_9)) 
    rom_0_26_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_26_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_10)) 
    rom_0_26_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_26_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_14)) 
    rom_0_26_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_26_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_15)) 
    rom_0_26_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_26_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_18)) 
    rom_0_26_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_26_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_21)) 
    rom_0_26_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_26_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_29)) 
    rom_0_26_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_26_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_34)) 
    rom_0_26_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_26_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_37)) 
    rom_0_26_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_26_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_38)) 
    rom_0_26_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_26_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_39)) 
    rom_0_26_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_26_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_40)) 
    rom_0_26_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_26_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_26_41)) 
    rom_0_26_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_26_41));

  // Stage 1
    assign s_0_26_1_0 = {{2{acts_0_26_1[5]}}, acts_0_26_1} + {{2{acts_0_26_2[5]}}, acts_0_26_2} + {{2{acts_0_26_3[5]}}, acts_0_26_3} + {{2{acts_0_26_5[5]}}, acts_0_26_5};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_0), .q(s_0_26_1_0_reg));

    assign s_0_26_1_1 = {{2{acts_0_26_6[5]}}, acts_0_26_6} + {{2{acts_0_26_9[5]}}, acts_0_26_9} + {{2{acts_0_26_10[5]}}, acts_0_26_10} + {{2{acts_0_26_14[5]}}, acts_0_26_14};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_1), .q(s_0_26_1_1_reg));

    assign s_0_26_1_2 = {{2{acts_0_26_15[5]}}, acts_0_26_15} + {{2{acts_0_26_18[5]}}, acts_0_26_18} + {{2{acts_0_26_21[5]}}, acts_0_26_21} + {{2{acts_0_26_29[5]}}, acts_0_26_29};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_2), .q(s_0_26_1_2_reg));

    assign s_0_26_1_3 = {{2{acts_0_26_34[5]}}, acts_0_26_34} + {{2{acts_0_26_37[5]}}, acts_0_26_37} + {{2{acts_0_26_38[5]}}, acts_0_26_38} + {{2{acts_0_26_39[5]}}, acts_0_26_39};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_3), .q(s_0_26_1_3_reg));

    assign s_0_26_1_4 = {{2{acts_0_26_40[5]}}, acts_0_26_40} + {{2{acts_0_26_41[5]}}, acts_0_26_41};
    registers #(.ARRAY_WIDTH(8)) r_0_26_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_1_4), .q(s_0_26_1_4_reg));

  // Stage 2
    assign s_0_26_2_0 = {{2{s_0_26_1_0_reg[7]}}, s_0_26_1_0_reg} + {{2{s_0_26_1_1_reg[7]}}, s_0_26_1_1_reg} + {{2{s_0_26_1_2_reg[7]}}, s_0_26_1_2_reg} + {{2{s_0_26_1_3_reg[7]}}, s_0_26_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_26_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_2_0), .q(s_0_26_2_0_reg));

    assign s_0_26_2_1 = {{2{s_0_26_1_4_reg[7]}}, s_0_26_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_26_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_26_2_1), .q(s_0_26_2_1_reg));

  // Stage 3
    assign sum_0_26 = {{2{s_0_26_2_0_reg[9]}}, s_0_26_2_0_reg} + {{2{s_0_26_2_1_reg[9]}}, s_0_26_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_26), .q(sum_0_26_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_26 (.i_data(sum_0_26_reg), .o_data(out_0_26_sat));


    // Layer 0, Node 27
      logic  [7:0] s_0_27_1_0, s_0_27_1_1, s_0_27_1_2, s_0_27_1_3, s_0_27_1_4, s_0_27_1_5;
    logic  [7:0] s_0_27_1_0_reg, s_0_27_1_1_reg, s_0_27_1_2_reg, s_0_27_1_3_reg, s_0_27_1_4_reg, s_0_27_1_5_reg;
    logic  [9:0] s_0_27_2_0, s_0_27_2_1;
    logic  [9:0] s_0_27_2_0_reg, s_0_27_2_1_reg;
    logic [11:0] sum_0_27;
    logic [11:0] sum_0_27_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_0)) 
    rom_0_27_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_27_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_1)) 
    rom_0_27_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_27_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_4)) 
    rom_0_27_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_27_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_6)) 
    rom_0_27_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_27_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_8)) 
    rom_0_27_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_27_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_12)) 
    rom_0_27_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_27_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_14)) 
    rom_0_27_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_27_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_15)) 
    rom_0_27_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_27_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_16)) 
    rom_0_27_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_27_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_17)) 
    rom_0_27_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_27_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_18)) 
    rom_0_27_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_27_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_21)) 
    rom_0_27_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_27_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_25)) 
    rom_0_27_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_27_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_26)) 
    rom_0_27_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_27_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_29)) 
    rom_0_27_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_27_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_30)) 
    rom_0_27_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_27_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_31)) 
    rom_0_27_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_27_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_36)) 
    rom_0_27_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_27_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_37)) 
    rom_0_27_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_27_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_38)) 
    rom_0_27_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_27_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_39)) 
    rom_0_27_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_27_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_27_40)) 
    rom_0_27_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_27_40));

  // Stage 1
    assign s_0_27_1_0 = {{2{acts_0_27_0[5]}}, acts_0_27_0} + {{2{acts_0_27_1[5]}}, acts_0_27_1} + {{2{acts_0_27_4[5]}}, acts_0_27_4} + {{2{acts_0_27_6[5]}}, acts_0_27_6};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_0), .q(s_0_27_1_0_reg));

    assign s_0_27_1_1 = {{2{acts_0_27_8[5]}}, acts_0_27_8} + {{2{acts_0_27_12[5]}}, acts_0_27_12} + {{2{acts_0_27_14[5]}}, acts_0_27_14} + {{2{acts_0_27_15[5]}}, acts_0_27_15};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_1), .q(s_0_27_1_1_reg));

    assign s_0_27_1_2 = {{2{acts_0_27_16[5]}}, acts_0_27_16} + {{2{acts_0_27_17[5]}}, acts_0_27_17} + {{2{acts_0_27_18[5]}}, acts_0_27_18} + {{2{acts_0_27_21[5]}}, acts_0_27_21};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_2), .q(s_0_27_1_2_reg));

    assign s_0_27_1_3 = {{2{acts_0_27_25[5]}}, acts_0_27_25} + {{2{acts_0_27_26[5]}}, acts_0_27_26} + {{2{acts_0_27_29[5]}}, acts_0_27_29} + {{2{acts_0_27_30[5]}}, acts_0_27_30};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_3), .q(s_0_27_1_3_reg));

    assign s_0_27_1_4 = {{2{acts_0_27_31[5]}}, acts_0_27_31} + {{2{acts_0_27_36[5]}}, acts_0_27_36} + {{2{acts_0_27_37[5]}}, acts_0_27_37} + {{2{acts_0_27_38[5]}}, acts_0_27_38};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_4), .q(s_0_27_1_4_reg));

    assign s_0_27_1_5 = {{2{acts_0_27_39[5]}}, acts_0_27_39} + {{2{acts_0_27_40[5]}}, acts_0_27_40};
    registers #(.ARRAY_WIDTH(8)) r_0_27_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_1_5), .q(s_0_27_1_5_reg));

  // Stage 2
    assign s_0_27_2_0 = {{2{s_0_27_1_0_reg[7]}}, s_0_27_1_0_reg} + {{2{s_0_27_1_1_reg[7]}}, s_0_27_1_1_reg} + {{2{s_0_27_1_2_reg[7]}}, s_0_27_1_2_reg} + {{2{s_0_27_1_3_reg[7]}}, s_0_27_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_27_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_2_0), .q(s_0_27_2_0_reg));

    assign s_0_27_2_1 = {{2{s_0_27_1_4_reg[7]}}, s_0_27_1_4_reg} + {{2{s_0_27_1_5_reg[7]}}, s_0_27_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_27_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_27_2_1), .q(s_0_27_2_1_reg));

  // Stage 3
    assign sum_0_27 = {{2{s_0_27_2_0_reg[9]}}, s_0_27_2_0_reg} + {{2{s_0_27_2_1_reg[9]}}, s_0_27_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_27), .q(sum_0_27_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_27 (.i_data(sum_0_27_reg), .o_data(out_0_27_sat));


    // Layer 0, Node 28
      logic  [7:0] s_0_28_1_0, s_0_28_1_1, s_0_28_1_2, s_0_28_1_3, s_0_28_1_4;
    logic  [7:0] s_0_28_1_0_reg, s_0_28_1_1_reg, s_0_28_1_2_reg, s_0_28_1_3_reg, s_0_28_1_4_reg;
    logic  [9:0] s_0_28_2_0, s_0_28_2_1;
    logic  [9:0] s_0_28_2_0_reg, s_0_28_2_1_reg;
    logic [11:0] sum_0_28;
    logic [11:0] sum_0_28_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_1)) 
    rom_0_28_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_28_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_2)) 
    rom_0_28_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_28_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_4)) 
    rom_0_28_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_28_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_5)) 
    rom_0_28_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_28_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_6)) 
    rom_0_28_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_28_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_7)) 
    rom_0_28_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_28_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_8)) 
    rom_0_28_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_28_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_14)) 
    rom_0_28_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_28_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_18)) 
    rom_0_28_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_28_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_19)) 
    rom_0_28_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_28_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_21)) 
    rom_0_28_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_28_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_29)) 
    rom_0_28_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_28_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_32)) 
    rom_0_28_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_28_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_36)) 
    rom_0_28_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_28_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_37)) 
    rom_0_28_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_28_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_39)) 
    rom_0_28_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_28_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_28_40)) 
    rom_0_28_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_28_40));

  // Stage 1
    assign s_0_28_1_0 = {{2{acts_0_28_1[5]}}, acts_0_28_1} + {{2{acts_0_28_2[5]}}, acts_0_28_2} + {{2{acts_0_28_4[5]}}, acts_0_28_4} + {{2{acts_0_28_5[5]}}, acts_0_28_5};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_0), .q(s_0_28_1_0_reg));

    assign s_0_28_1_1 = {{2{acts_0_28_6[5]}}, acts_0_28_6} + {{2{acts_0_28_7[5]}}, acts_0_28_7} + {{2{acts_0_28_8[5]}}, acts_0_28_8} + {{2{acts_0_28_14[5]}}, acts_0_28_14};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_1), .q(s_0_28_1_1_reg));

    assign s_0_28_1_2 = {{2{acts_0_28_18[5]}}, acts_0_28_18} + {{2{acts_0_28_19[5]}}, acts_0_28_19} + {{2{acts_0_28_21[5]}}, acts_0_28_21} + {{2{acts_0_28_29[5]}}, acts_0_28_29};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_2), .q(s_0_28_1_2_reg));

    assign s_0_28_1_3 = {{2{acts_0_28_32[5]}}, acts_0_28_32} + {{2{acts_0_28_36[5]}}, acts_0_28_36} + {{2{acts_0_28_37[5]}}, acts_0_28_37} + {{2{acts_0_28_39[5]}}, acts_0_28_39};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_3), .q(s_0_28_1_3_reg));

    assign s_0_28_1_4 = {{2{acts_0_28_40[5]}}, acts_0_28_40};
    registers #(.ARRAY_WIDTH(8)) r_0_28_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_1_4), .q(s_0_28_1_4_reg));

  // Stage 2
    assign s_0_28_2_0 = {{2{s_0_28_1_0_reg[7]}}, s_0_28_1_0_reg} + {{2{s_0_28_1_1_reg[7]}}, s_0_28_1_1_reg} + {{2{s_0_28_1_2_reg[7]}}, s_0_28_1_2_reg} + {{2{s_0_28_1_3_reg[7]}}, s_0_28_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_28_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_2_0), .q(s_0_28_2_0_reg));

    assign s_0_28_2_1 = {{2{s_0_28_1_4_reg[7]}}, s_0_28_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_28_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_28_2_1), .q(s_0_28_2_1_reg));

  // Stage 3
    assign sum_0_28 = {{2{s_0_28_2_0_reg[9]}}, s_0_28_2_0_reg} + {{2{s_0_28_2_1_reg[9]}}, s_0_28_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_28), .q(sum_0_28_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_28 (.i_data(sum_0_28_reg), .o_data(out_0_28_sat));


    // Layer 0, Node 29
      logic  [7:0] s_0_29_1_0, s_0_29_1_1, s_0_29_1_2, s_0_29_1_3, s_0_29_1_4, s_0_29_1_5;
    logic  [7:0] s_0_29_1_0_reg, s_0_29_1_1_reg, s_0_29_1_2_reg, s_0_29_1_3_reg, s_0_29_1_4_reg, s_0_29_1_5_reg;
    logic  [9:0] s_0_29_2_0, s_0_29_2_1;
    logic  [9:0] s_0_29_2_0_reg, s_0_29_2_1_reg;
    logic [11:0] sum_0_29;
    logic [11:0] sum_0_29_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_0)) 
    rom_0_29_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_29_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_1)) 
    rom_0_29_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_29_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_2)) 
    rom_0_29_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_29_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_3)) 
    rom_0_29_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_29_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_5)) 
    rom_0_29_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_29_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_6)) 
    rom_0_29_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_29_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_7)) 
    rom_0_29_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_29_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_9)) 
    rom_0_29_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_29_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_10)) 
    rom_0_29_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_29_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_13)) 
    rom_0_29_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_29_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_15)) 
    rom_0_29_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_29_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_16)) 
    rom_0_29_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_29_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_18)) 
    rom_0_29_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_29_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_19)) 
    rom_0_29_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_29_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_21)) 
    rom_0_29_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_29_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_23)) 
    rom_0_29_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_29_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_25)) 
    rom_0_29_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_29_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_26)) 
    rom_0_29_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_29_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_29)) 
    rom_0_29_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_29_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_30)) 
    rom_0_29_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_29_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_31)) 
    rom_0_29_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_29_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_34)) 
    rom_0_29_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_29_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_35)) 
    rom_0_29_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_29_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_29_40)) 
    rom_0_29_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_29_40));

  // Stage 1
    assign s_0_29_1_0 = {{2{acts_0_29_0[5]}}, acts_0_29_0} + {{2{acts_0_29_1[5]}}, acts_0_29_1} + {{2{acts_0_29_2[5]}}, acts_0_29_2} + {{2{acts_0_29_3[5]}}, acts_0_29_3};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_0), .q(s_0_29_1_0_reg));

    assign s_0_29_1_1 = {{2{acts_0_29_5[5]}}, acts_0_29_5} + {{2{acts_0_29_6[5]}}, acts_0_29_6} + {{2{acts_0_29_7[5]}}, acts_0_29_7} + {{2{acts_0_29_9[5]}}, acts_0_29_9};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_1), .q(s_0_29_1_1_reg));

    assign s_0_29_1_2 = {{2{acts_0_29_10[5]}}, acts_0_29_10} + {{2{acts_0_29_13[5]}}, acts_0_29_13} + {{2{acts_0_29_15[5]}}, acts_0_29_15} + {{2{acts_0_29_16[5]}}, acts_0_29_16};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_2), .q(s_0_29_1_2_reg));

    assign s_0_29_1_3 = {{2{acts_0_29_18[5]}}, acts_0_29_18} + {{2{acts_0_29_19[5]}}, acts_0_29_19} + {{2{acts_0_29_21[5]}}, acts_0_29_21} + {{2{acts_0_29_23[5]}}, acts_0_29_23};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_3), .q(s_0_29_1_3_reg));

    assign s_0_29_1_4 = {{2{acts_0_29_25[5]}}, acts_0_29_25} + {{2{acts_0_29_26[5]}}, acts_0_29_26} + {{2{acts_0_29_29[5]}}, acts_0_29_29} + {{2{acts_0_29_30[5]}}, acts_0_29_30};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_4), .q(s_0_29_1_4_reg));

    assign s_0_29_1_5 = {{2{acts_0_29_31[5]}}, acts_0_29_31} + {{2{acts_0_29_34[5]}}, acts_0_29_34} + {{2{acts_0_29_35[5]}}, acts_0_29_35} + {{2{acts_0_29_40[5]}}, acts_0_29_40};
    registers #(.ARRAY_WIDTH(8)) r_0_29_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_1_5), .q(s_0_29_1_5_reg));

  // Stage 2
    assign s_0_29_2_0 = {{2{s_0_29_1_0_reg[7]}}, s_0_29_1_0_reg} + {{2{s_0_29_1_1_reg[7]}}, s_0_29_1_1_reg} + {{2{s_0_29_1_2_reg[7]}}, s_0_29_1_2_reg} + {{2{s_0_29_1_3_reg[7]}}, s_0_29_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_29_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_2_0), .q(s_0_29_2_0_reg));

    assign s_0_29_2_1 = {{2{s_0_29_1_4_reg[7]}}, s_0_29_1_4_reg} + {{2{s_0_29_1_5_reg[7]}}, s_0_29_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_29_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_29_2_1), .q(s_0_29_2_1_reg));

  // Stage 3
    assign sum_0_29 = {{2{s_0_29_2_0_reg[9]}}, s_0_29_2_0_reg} + {{2{s_0_29_2_1_reg[9]}}, s_0_29_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_29), .q(sum_0_29_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_29 (.i_data(sum_0_29_reg), .o_data(out_0_29_sat));


    // Layer 0, Node 30
      logic  [7:0] s_0_30_1_0, s_0_30_1_1, s_0_30_1_2, s_0_30_1_3;
    logic  [7:0] s_0_30_1_0_reg, s_0_30_1_1_reg, s_0_30_1_2_reg, s_0_30_1_3_reg;
    logic  [9:0] s_0_30_2_0;
    logic  [9:0] s_0_30_2_0_reg;
    logic [11:0] sum_0_30;
    logic [11:0] sum_0_30_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_0)) 
    rom_0_30_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_30_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_2)) 
    rom_0_30_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_30_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_3)) 
    rom_0_30_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_30_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_4)) 
    rom_0_30_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_30_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_6)) 
    rom_0_30_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_30_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_8)) 
    rom_0_30_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_30_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_11)) 
    rom_0_30_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_30_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_13)) 
    rom_0_30_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_30_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_15)) 
    rom_0_30_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_30_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_16)) 
    rom_0_30_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_30_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_17)) 
    rom_0_30_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_30_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_35)) 
    rom_0_30_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_30_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_30_40)) 
    rom_0_30_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_30_40));

  // Stage 1
    assign s_0_30_1_0 = {{2{acts_0_30_0[5]}}, acts_0_30_0} + {{2{acts_0_30_2[5]}}, acts_0_30_2} + {{2{acts_0_30_3[5]}}, acts_0_30_3} + {{2{acts_0_30_4[5]}}, acts_0_30_4};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_0), .q(s_0_30_1_0_reg));

    assign s_0_30_1_1 = {{2{acts_0_30_6[5]}}, acts_0_30_6} + {{2{acts_0_30_8[5]}}, acts_0_30_8} + {{2{acts_0_30_11[5]}}, acts_0_30_11} + {{2{acts_0_30_13[5]}}, acts_0_30_13};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_1), .q(s_0_30_1_1_reg));

    assign s_0_30_1_2 = {{2{acts_0_30_15[5]}}, acts_0_30_15} + {{2{acts_0_30_16[5]}}, acts_0_30_16} + {{2{acts_0_30_17[5]}}, acts_0_30_17} + {{2{acts_0_30_35[5]}}, acts_0_30_35};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_2), .q(s_0_30_1_2_reg));

    assign s_0_30_1_3 = {{2{acts_0_30_40[5]}}, acts_0_30_40};
    registers #(.ARRAY_WIDTH(8)) r_0_30_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_1_3), .q(s_0_30_1_3_reg));

  // Stage 2
    assign s_0_30_2_0 = {{2{s_0_30_1_0_reg[7]}}, s_0_30_1_0_reg} + {{2{s_0_30_1_1_reg[7]}}, s_0_30_1_1_reg} + {{2{s_0_30_1_2_reg[7]}}, s_0_30_1_2_reg} + {{2{s_0_30_1_3_reg[7]}}, s_0_30_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_30_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_30_2_0), .q(s_0_30_2_0_reg));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_30_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_30_2_0_reg[9]}}, s_0_30_2_0_reg}), .q(sum_0_30_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_30 (.i_data(sum_0_30_reg), .o_data(out_0_30_sat));


    // Layer 0, Node 31
      logic  [7:0] s_0_31_1_0, s_0_31_1_1, s_0_31_1_2, s_0_31_1_3, s_0_31_1_4;
    logic  [7:0] s_0_31_1_0_reg, s_0_31_1_1_reg, s_0_31_1_2_reg, s_0_31_1_3_reg, s_0_31_1_4_reg;
    logic  [9:0] s_0_31_2_0, s_0_31_2_1;
    logic  [9:0] s_0_31_2_0_reg, s_0_31_2_1_reg;
    logic [11:0] sum_0_31;
    logic [11:0] sum_0_31_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_0)) 
    rom_0_31_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_31_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_1)) 
    rom_0_31_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_31_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_9)) 
    rom_0_31_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_31_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_12)) 
    rom_0_31_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_31_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_14)) 
    rom_0_31_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_31_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_16)) 
    rom_0_31_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_31_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_17)) 
    rom_0_31_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_31_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_21)) 
    rom_0_31_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_31_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_22)) 
    rom_0_31_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_31_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_24)) 
    rom_0_31_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_31_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_25)) 
    rom_0_31_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_31_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_27)) 
    rom_0_31_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_31_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_29)) 
    rom_0_31_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_31_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_30)) 
    rom_0_31_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_31_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_32)) 
    rom_0_31_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_31_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_33)) 
    rom_0_31_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_31_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_35)) 
    rom_0_31_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_31_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_31_36)) 
    rom_0_31_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_31_36));

  // Stage 1
    assign s_0_31_1_0 = {{2{acts_0_31_0[5]}}, acts_0_31_0} + {{2{acts_0_31_1[5]}}, acts_0_31_1} + {{2{acts_0_31_9[5]}}, acts_0_31_9} + {{2{acts_0_31_12[5]}}, acts_0_31_12};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_0), .q(s_0_31_1_0_reg));

    assign s_0_31_1_1 = {{2{acts_0_31_14[5]}}, acts_0_31_14} + {{2{acts_0_31_16[5]}}, acts_0_31_16} + {{2{acts_0_31_17[5]}}, acts_0_31_17} + {{2{acts_0_31_21[5]}}, acts_0_31_21};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_1), .q(s_0_31_1_1_reg));

    assign s_0_31_1_2 = {{2{acts_0_31_22[5]}}, acts_0_31_22} + {{2{acts_0_31_24[5]}}, acts_0_31_24} + {{2{acts_0_31_25[5]}}, acts_0_31_25} + {{2{acts_0_31_27[5]}}, acts_0_31_27};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_2), .q(s_0_31_1_2_reg));

    assign s_0_31_1_3 = {{2{acts_0_31_29[5]}}, acts_0_31_29} + {{2{acts_0_31_30[5]}}, acts_0_31_30} + {{2{acts_0_31_32[5]}}, acts_0_31_32} + {{2{acts_0_31_33[5]}}, acts_0_31_33};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_3), .q(s_0_31_1_3_reg));

    assign s_0_31_1_4 = {{2{acts_0_31_35[5]}}, acts_0_31_35} + {{2{acts_0_31_36[5]}}, acts_0_31_36};
    registers #(.ARRAY_WIDTH(8)) r_0_31_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_1_4), .q(s_0_31_1_4_reg));

  // Stage 2
    assign s_0_31_2_0 = {{2{s_0_31_1_0_reg[7]}}, s_0_31_1_0_reg} + {{2{s_0_31_1_1_reg[7]}}, s_0_31_1_1_reg} + {{2{s_0_31_1_2_reg[7]}}, s_0_31_1_2_reg} + {{2{s_0_31_1_3_reg[7]}}, s_0_31_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_31_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_2_0), .q(s_0_31_2_0_reg));

    assign s_0_31_2_1 = {{2{s_0_31_1_4_reg[7]}}, s_0_31_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_31_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_31_2_1), .q(s_0_31_2_1_reg));

  // Stage 3
    assign sum_0_31 = {{2{s_0_31_2_0_reg[9]}}, s_0_31_2_0_reg} + {{2{s_0_31_2_1_reg[9]}}, s_0_31_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_31), .q(sum_0_31_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_31 (.i_data(sum_0_31_reg), .o_data(out_0_31_sat));


    // Layer 0, Node 32
      logic  [7:0] s_0_32_1_0, s_0_32_1_1, s_0_32_1_2, s_0_32_1_3, s_0_32_1_4;
    logic  [7:0] s_0_32_1_0_reg, s_0_32_1_1_reg, s_0_32_1_2_reg, s_0_32_1_3_reg, s_0_32_1_4_reg;
    logic  [9:0] s_0_32_2_0, s_0_32_2_1;
    logic  [9:0] s_0_32_2_0_reg, s_0_32_2_1_reg;
    logic [11:0] sum_0_32;
    logic [11:0] sum_0_32_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_1)) 
    rom_0_32_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_32_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_2)) 
    rom_0_32_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_32_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_6)) 
    rom_0_32_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_32_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_12)) 
    rom_0_32_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_32_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_13)) 
    rom_0_32_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_32_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_16)) 
    rom_0_32_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_32_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_17)) 
    rom_0_32_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_32_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_18)) 
    rom_0_32_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_32_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_19)) 
    rom_0_32_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_32_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_20)) 
    rom_0_32_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_32_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_21)) 
    rom_0_32_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_32_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_22)) 
    rom_0_32_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_32_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_24)) 
    rom_0_32_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_32_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_31)) 
    rom_0_32_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_32_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_34)) 
    rom_0_32_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_32_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_35)) 
    rom_0_32_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_32_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_38)) 
    rom_0_32_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_32_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_39)) 
    rom_0_32_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_32_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_32_41)) 
    rom_0_32_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_32_41));

  // Stage 1
    assign s_0_32_1_0 = {{2{acts_0_32_1[5]}}, acts_0_32_1} + {{2{acts_0_32_2[5]}}, acts_0_32_2} + {{2{acts_0_32_6[5]}}, acts_0_32_6} + {{2{acts_0_32_12[5]}}, acts_0_32_12};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_0), .q(s_0_32_1_0_reg));

    assign s_0_32_1_1 = {{2{acts_0_32_13[5]}}, acts_0_32_13} + {{2{acts_0_32_16[5]}}, acts_0_32_16} + {{2{acts_0_32_17[5]}}, acts_0_32_17} + {{2{acts_0_32_18[5]}}, acts_0_32_18};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_1), .q(s_0_32_1_1_reg));

    assign s_0_32_1_2 = {{2{acts_0_32_19[5]}}, acts_0_32_19} + {{2{acts_0_32_20[5]}}, acts_0_32_20} + {{2{acts_0_32_21[5]}}, acts_0_32_21} + {{2{acts_0_32_22[5]}}, acts_0_32_22};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_2), .q(s_0_32_1_2_reg));

    assign s_0_32_1_3 = {{2{acts_0_32_24[5]}}, acts_0_32_24} + {{2{acts_0_32_31[5]}}, acts_0_32_31} + {{2{acts_0_32_34[5]}}, acts_0_32_34} + {{2{acts_0_32_35[5]}}, acts_0_32_35};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_3), .q(s_0_32_1_3_reg));

    assign s_0_32_1_4 = {{2{acts_0_32_38[5]}}, acts_0_32_38} + {{2{acts_0_32_39[5]}}, acts_0_32_39} + {{2{acts_0_32_41[5]}}, acts_0_32_41};
    registers #(.ARRAY_WIDTH(8)) r_0_32_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_1_4), .q(s_0_32_1_4_reg));

  // Stage 2
    assign s_0_32_2_0 = {{2{s_0_32_1_0_reg[7]}}, s_0_32_1_0_reg} + {{2{s_0_32_1_1_reg[7]}}, s_0_32_1_1_reg} + {{2{s_0_32_1_2_reg[7]}}, s_0_32_1_2_reg} + {{2{s_0_32_1_3_reg[7]}}, s_0_32_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_32_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_2_0), .q(s_0_32_2_0_reg));

    assign s_0_32_2_1 = {{2{s_0_32_1_4_reg[7]}}, s_0_32_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_32_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_32_2_1), .q(s_0_32_2_1_reg));

  // Stage 3
    assign sum_0_32 = {{2{s_0_32_2_0_reg[9]}}, s_0_32_2_0_reg} + {{2{s_0_32_2_1_reg[9]}}, s_0_32_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_32), .q(sum_0_32_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_32 (.i_data(sum_0_32_reg), .o_data(out_0_32_sat));


    // Layer 0, Node 33
      logic  [7:0] s_0_33_1_0, s_0_33_1_1, s_0_33_1_2, s_0_33_1_3, s_0_33_1_4;
    logic  [7:0] s_0_33_1_0_reg, s_0_33_1_1_reg, s_0_33_1_2_reg, s_0_33_1_3_reg, s_0_33_1_4_reg;
    logic  [9:0] s_0_33_2_0, s_0_33_2_1;
    logic  [9:0] s_0_33_2_0_reg, s_0_33_2_1_reg;
    logic [11:0] sum_0_33;
    logic [11:0] sum_0_33_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_1)) 
    rom_0_33_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_33_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_4)) 
    rom_0_33_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_33_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_5)) 
    rom_0_33_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_33_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_6)) 
    rom_0_33_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_33_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_7)) 
    rom_0_33_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_33_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_10)) 
    rom_0_33_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_33_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_11)) 
    rom_0_33_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_33_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_12)) 
    rom_0_33_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_33_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_14)) 
    rom_0_33_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_33_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_16)) 
    rom_0_33_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_33_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_18)) 
    rom_0_33_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_33_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_19)) 
    rom_0_33_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_33_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_21)) 
    rom_0_33_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_33_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_26)) 
    rom_0_33_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_33_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_33)) 
    rom_0_33_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_33_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_34)) 
    rom_0_33_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_33_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_37)) 
    rom_0_33_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_33_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_38)) 
    rom_0_33_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_33_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_40)) 
    rom_0_33_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_33_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_33_41)) 
    rom_0_33_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_33_41));

  // Stage 1
    assign s_0_33_1_0 = {{2{acts_0_33_1[5]}}, acts_0_33_1} + {{2{acts_0_33_4[5]}}, acts_0_33_4} + {{2{acts_0_33_5[5]}}, acts_0_33_5} + {{2{acts_0_33_6[5]}}, acts_0_33_6};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_0), .q(s_0_33_1_0_reg));

    assign s_0_33_1_1 = {{2{acts_0_33_7[5]}}, acts_0_33_7} + {{2{acts_0_33_10[5]}}, acts_0_33_10} + {{2{acts_0_33_11[5]}}, acts_0_33_11} + {{2{acts_0_33_12[5]}}, acts_0_33_12};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_1), .q(s_0_33_1_1_reg));

    assign s_0_33_1_2 = {{2{acts_0_33_14[5]}}, acts_0_33_14} + {{2{acts_0_33_16[5]}}, acts_0_33_16} + {{2{acts_0_33_18[5]}}, acts_0_33_18} + {{2{acts_0_33_19[5]}}, acts_0_33_19};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_2), .q(s_0_33_1_2_reg));

    assign s_0_33_1_3 = {{2{acts_0_33_21[5]}}, acts_0_33_21} + {{2{acts_0_33_26[5]}}, acts_0_33_26} + {{2{acts_0_33_33[5]}}, acts_0_33_33} + {{2{acts_0_33_34[5]}}, acts_0_33_34};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_3), .q(s_0_33_1_3_reg));

    assign s_0_33_1_4 = {{2{acts_0_33_37[5]}}, acts_0_33_37} + {{2{acts_0_33_38[5]}}, acts_0_33_38} + {{2{acts_0_33_40[5]}}, acts_0_33_40} + {{2{acts_0_33_41[5]}}, acts_0_33_41};
    registers #(.ARRAY_WIDTH(8)) r_0_33_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_1_4), .q(s_0_33_1_4_reg));

  // Stage 2
    assign s_0_33_2_0 = {{2{s_0_33_1_0_reg[7]}}, s_0_33_1_0_reg} + {{2{s_0_33_1_1_reg[7]}}, s_0_33_1_1_reg} + {{2{s_0_33_1_2_reg[7]}}, s_0_33_1_2_reg} + {{2{s_0_33_1_3_reg[7]}}, s_0_33_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_33_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_2_0), .q(s_0_33_2_0_reg));

    assign s_0_33_2_1 = {{2{s_0_33_1_4_reg[7]}}, s_0_33_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_33_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_33_2_1), .q(s_0_33_2_1_reg));

  // Stage 3
    assign sum_0_33 = {{2{s_0_33_2_0_reg[9]}}, s_0_33_2_0_reg} + {{2{s_0_33_2_1_reg[9]}}, s_0_33_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_33), .q(sum_0_33_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_33 (.i_data(sum_0_33_reg), .o_data(out_0_33_sat));


    // Layer 0, Node 34
      logic  [7:0] s_0_34_1_0, s_0_34_1_1, s_0_34_1_2, s_0_34_1_3;
    logic  [7:0] s_0_34_1_0_reg, s_0_34_1_1_reg, s_0_34_1_2_reg, s_0_34_1_3_reg;
    logic  [9:0] s_0_34_2_0;
    logic  [9:0] s_0_34_2_0_reg;
    logic [11:0] sum_0_34;
    logic [11:0] sum_0_34_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_2)) 
    rom_0_34_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_34_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_6)) 
    rom_0_34_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_34_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_11)) 
    rom_0_34_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_34_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_14)) 
    rom_0_34_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_34_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_15)) 
    rom_0_34_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_34_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_16)) 
    rom_0_34_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_34_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_17)) 
    rom_0_34_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_34_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_19)) 
    rom_0_34_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_34_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_21)) 
    rom_0_34_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_34_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_24)) 
    rom_0_34_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_34_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_29)) 
    rom_0_34_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_34_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_30)) 
    rom_0_34_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_34_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_32)) 
    rom_0_34_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_34_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_33)) 
    rom_0_34_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_34_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_39)) 
    rom_0_34_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_34_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_34_41)) 
    rom_0_34_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_34_41));

  // Stage 1
    assign s_0_34_1_0 = {{2{acts_0_34_2[5]}}, acts_0_34_2} + {{2{acts_0_34_6[5]}}, acts_0_34_6} + {{2{acts_0_34_11[5]}}, acts_0_34_11} + {{2{acts_0_34_14[5]}}, acts_0_34_14};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_0), .q(s_0_34_1_0_reg));

    assign s_0_34_1_1 = {{2{acts_0_34_15[5]}}, acts_0_34_15} + {{2{acts_0_34_16[5]}}, acts_0_34_16} + {{2{acts_0_34_17[5]}}, acts_0_34_17} + {{2{acts_0_34_19[5]}}, acts_0_34_19};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_1), .q(s_0_34_1_1_reg));

    assign s_0_34_1_2 = {{2{acts_0_34_21[5]}}, acts_0_34_21} + {{2{acts_0_34_24[5]}}, acts_0_34_24} + {{2{acts_0_34_29[5]}}, acts_0_34_29} + {{2{acts_0_34_30[5]}}, acts_0_34_30};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_2), .q(s_0_34_1_2_reg));

    assign s_0_34_1_3 = {{2{acts_0_34_32[5]}}, acts_0_34_32} + {{2{acts_0_34_33[5]}}, acts_0_34_33} + {{2{acts_0_34_39[5]}}, acts_0_34_39} + {{2{acts_0_34_41[5]}}, acts_0_34_41};
    registers #(.ARRAY_WIDTH(8)) r_0_34_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_1_3), .q(s_0_34_1_3_reg));

  // Stage 2
    assign s_0_34_2_0 = {{2{s_0_34_1_0_reg[7]}}, s_0_34_1_0_reg} + {{2{s_0_34_1_1_reg[7]}}, s_0_34_1_1_reg} + {{2{s_0_34_1_2_reg[7]}}, s_0_34_1_2_reg} + {{2{s_0_34_1_3_reg[7]}}, s_0_34_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_34_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_34_2_0), .q(s_0_34_2_0_reg));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_34_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_34_2_0_reg[9]}}, s_0_34_2_0_reg}), .q(sum_0_34_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_34 (.i_data(sum_0_34_reg), .o_data(out_0_34_sat));


    // Layer 0, Node 35
      logic  [7:0] s_0_35_1_0, s_0_35_1_1, s_0_35_1_2, s_0_35_1_3, s_0_35_1_4, s_0_35_1_5;
    logic  [7:0] s_0_35_1_0_reg, s_0_35_1_1_reg, s_0_35_1_2_reg, s_0_35_1_3_reg, s_0_35_1_4_reg, s_0_35_1_5_reg;
    logic  [9:0] s_0_35_2_0, s_0_35_2_1;
    logic  [9:0] s_0_35_2_0_reg, s_0_35_2_1_reg;
    logic [11:0] sum_0_35;
    logic [11:0] sum_0_35_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_0)) 
    rom_0_35_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_35_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_1)) 
    rom_0_35_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_35_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_2)) 
    rom_0_35_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_35_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_5)) 
    rom_0_35_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_35_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_7)) 
    rom_0_35_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_35_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_8)) 
    rom_0_35_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_35_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_12)) 
    rom_0_35_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_35_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_13)) 
    rom_0_35_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_35_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_15)) 
    rom_0_35_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_35_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_16)) 
    rom_0_35_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_35_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_17)) 
    rom_0_35_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_35_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_21)) 
    rom_0_35_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_35_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_22)) 
    rom_0_35_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_35_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_24)) 
    rom_0_35_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_35_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_26)) 
    rom_0_35_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_35_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_27)) 
    rom_0_35_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_35_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_30)) 
    rom_0_35_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_35_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_31)) 
    rom_0_35_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_35_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_32)) 
    rom_0_35_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_35_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_35)) 
    rom_0_35_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_35_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_36)) 
    rom_0_35_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_35_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_35_40)) 
    rom_0_35_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_35_40));

  // Stage 1
    assign s_0_35_1_0 = {{2{acts_0_35_0[5]}}, acts_0_35_0} + {{2{acts_0_35_1[5]}}, acts_0_35_1} + {{2{acts_0_35_2[5]}}, acts_0_35_2} + {{2{acts_0_35_5[5]}}, acts_0_35_5};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_0), .q(s_0_35_1_0_reg));

    assign s_0_35_1_1 = {{2{acts_0_35_7[5]}}, acts_0_35_7} + {{2{acts_0_35_8[5]}}, acts_0_35_8} + {{2{acts_0_35_12[5]}}, acts_0_35_12} + {{2{acts_0_35_13[5]}}, acts_0_35_13};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_1), .q(s_0_35_1_1_reg));

    assign s_0_35_1_2 = {{2{acts_0_35_15[5]}}, acts_0_35_15} + {{2{acts_0_35_16[5]}}, acts_0_35_16} + {{2{acts_0_35_17[5]}}, acts_0_35_17} + {{2{acts_0_35_21[5]}}, acts_0_35_21};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_2), .q(s_0_35_1_2_reg));

    assign s_0_35_1_3 = {{2{acts_0_35_22[5]}}, acts_0_35_22} + {{2{acts_0_35_24[5]}}, acts_0_35_24} + {{2{acts_0_35_26[5]}}, acts_0_35_26} + {{2{acts_0_35_27[5]}}, acts_0_35_27};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_3), .q(s_0_35_1_3_reg));

    assign s_0_35_1_4 = {{2{acts_0_35_30[5]}}, acts_0_35_30} + {{2{acts_0_35_31[5]}}, acts_0_35_31} + {{2{acts_0_35_32[5]}}, acts_0_35_32} + {{2{acts_0_35_35[5]}}, acts_0_35_35};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_4), .q(s_0_35_1_4_reg));

    assign s_0_35_1_5 = {{2{acts_0_35_36[5]}}, acts_0_35_36} + {{2{acts_0_35_40[5]}}, acts_0_35_40};
    registers #(.ARRAY_WIDTH(8)) r_0_35_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_1_5), .q(s_0_35_1_5_reg));

  // Stage 2
    assign s_0_35_2_0 = {{2{s_0_35_1_0_reg[7]}}, s_0_35_1_0_reg} + {{2{s_0_35_1_1_reg[7]}}, s_0_35_1_1_reg} + {{2{s_0_35_1_2_reg[7]}}, s_0_35_1_2_reg} + {{2{s_0_35_1_3_reg[7]}}, s_0_35_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_35_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_2_0), .q(s_0_35_2_0_reg));

    assign s_0_35_2_1 = {{2{s_0_35_1_4_reg[7]}}, s_0_35_1_4_reg} + {{2{s_0_35_1_5_reg[7]}}, s_0_35_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_35_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_35_2_1), .q(s_0_35_2_1_reg));

  // Stage 3
    assign sum_0_35 = {{2{s_0_35_2_0_reg[9]}}, s_0_35_2_0_reg} + {{2{s_0_35_2_1_reg[9]}}, s_0_35_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_35), .q(sum_0_35_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_35 (.i_data(sum_0_35_reg), .o_data(out_0_35_sat));


    // Layer 0, Node 36
      logic  [7:0] s_0_36_1_0, s_0_36_1_1, s_0_36_1_2, s_0_36_1_3, s_0_36_1_4;
    logic  [7:0] s_0_36_1_0_reg, s_0_36_1_1_reg, s_0_36_1_2_reg, s_0_36_1_3_reg, s_0_36_1_4_reg;
    logic  [9:0] s_0_36_2_0, s_0_36_2_1;
    logic  [9:0] s_0_36_2_0_reg, s_0_36_2_1_reg;
    logic [11:0] sum_0_36;
    logic [11:0] sum_0_36_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_0)) 
    rom_0_36_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_36_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_1)) 
    rom_0_36_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_36_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_2)) 
    rom_0_36_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_36_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_4)) 
    rom_0_36_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_36_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_5)) 
    rom_0_36_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_36_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_7)) 
    rom_0_36_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_36_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_10)) 
    rom_0_36_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_36_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_11)) 
    rom_0_36_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_36_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_12)) 
    rom_0_36_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_36_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_13)) 
    rom_0_36_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_36_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_16)) 
    rom_0_36_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_36_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_17)) 
    rom_0_36_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_36_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_21)) 
    rom_0_36_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_36_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_26)) 
    rom_0_36_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_36_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_34)) 
    rom_0_36_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_36_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_36)) 
    rom_0_36_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_36_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_36_37)) 
    rom_0_36_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_36_37));

  // Stage 1
    assign s_0_36_1_0 = {{2{acts_0_36_0[5]}}, acts_0_36_0} + {{2{acts_0_36_1[5]}}, acts_0_36_1} + {{2{acts_0_36_2[5]}}, acts_0_36_2} + {{2{acts_0_36_4[5]}}, acts_0_36_4};
    registers #(.ARRAY_WIDTH(8)) r_0_36_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_36_1_0), .q(s_0_36_1_0_reg));

    assign s_0_36_1_1 = {{2{acts_0_36_5[5]}}, acts_0_36_5} + {{2{acts_0_36_7[5]}}, acts_0_36_7} + {{2{acts_0_36_10[5]}}, acts_0_36_10} + {{2{acts_0_36_11[5]}}, acts_0_36_11};
    registers #(.ARRAY_WIDTH(8)) r_0_36_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_36_1_1), .q(s_0_36_1_1_reg));

    assign s_0_36_1_2 = {{2{acts_0_36_12[5]}}, acts_0_36_12} + {{2{acts_0_36_13[5]}}, acts_0_36_13} + {{2{acts_0_36_16[5]}}, acts_0_36_16} + {{2{acts_0_36_17[5]}}, acts_0_36_17};
    registers #(.ARRAY_WIDTH(8)) r_0_36_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_36_1_2), .q(s_0_36_1_2_reg));

    assign s_0_36_1_3 = {{2{acts_0_36_21[5]}}, acts_0_36_21} + {{2{acts_0_36_26[5]}}, acts_0_36_26} + {{2{acts_0_36_34[5]}}, acts_0_36_34} + {{2{acts_0_36_36[5]}}, acts_0_36_36};
    registers #(.ARRAY_WIDTH(8)) r_0_36_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_36_1_3), .q(s_0_36_1_3_reg));

    assign s_0_36_1_4 = {{2{acts_0_36_37[5]}}, acts_0_36_37};
    registers #(.ARRAY_WIDTH(8)) r_0_36_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_36_1_4), .q(s_0_36_1_4_reg));

  // Stage 2
    assign s_0_36_2_0 = {{2{s_0_36_1_0_reg[7]}}, s_0_36_1_0_reg} + {{2{s_0_36_1_1_reg[7]}}, s_0_36_1_1_reg} + {{2{s_0_36_1_2_reg[7]}}, s_0_36_1_2_reg} + {{2{s_0_36_1_3_reg[7]}}, s_0_36_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_36_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_36_2_0), .q(s_0_36_2_0_reg));

    assign s_0_36_2_1 = {{2{s_0_36_1_4_reg[7]}}, s_0_36_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_36_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_36_2_1), .q(s_0_36_2_1_reg));

  // Stage 3
    assign sum_0_36 = {{2{s_0_36_2_0_reg[9]}}, s_0_36_2_0_reg} + {{2{s_0_36_2_1_reg[9]}}, s_0_36_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_36), .q(sum_0_36_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_36 (.i_data(sum_0_36_reg), .o_data(out_0_36_sat));


    // Layer 0, Node 37
      logic  [7:0] s_0_37_1_0, s_0_37_1_1, s_0_37_1_2, s_0_37_1_3, s_0_37_1_4, s_0_37_1_5;
    logic  [7:0] s_0_37_1_0_reg, s_0_37_1_1_reg, s_0_37_1_2_reg, s_0_37_1_3_reg, s_0_37_1_4_reg, s_0_37_1_5_reg;
    logic  [9:0] s_0_37_2_0, s_0_37_2_1;
    logic  [9:0] s_0_37_2_0_reg, s_0_37_2_1_reg;
    logic [11:0] sum_0_37;
    logic [11:0] sum_0_37_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_1)) 
    rom_0_37_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_37_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_2)) 
    rom_0_37_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_37_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_5)) 
    rom_0_37_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_37_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_9)) 
    rom_0_37_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_37_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_10)) 
    rom_0_37_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_37_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_12)) 
    rom_0_37_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_37_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_13)) 
    rom_0_37_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_37_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_14)) 
    rom_0_37_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_37_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_15)) 
    rom_0_37_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_37_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_16)) 
    rom_0_37_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_37_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_18)) 
    rom_0_37_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_37_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_19)) 
    rom_0_37_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_37_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_21)) 
    rom_0_37_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_37_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_24)) 
    rom_0_37_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_37_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_25)) 
    rom_0_37_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_37_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_26)) 
    rom_0_37_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_37_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_31)) 
    rom_0_37_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_37_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_33)) 
    rom_0_37_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_37_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_34)) 
    rom_0_37_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_37_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_35)) 
    rom_0_37_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_37_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_36)) 
    rom_0_37_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_37_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_37)) 
    rom_0_37_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_37_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_37_38)) 
    rom_0_37_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_37_38));

  // Stage 1
    assign s_0_37_1_0 = {{2{acts_0_37_1[5]}}, acts_0_37_1} + {{2{acts_0_37_2[5]}}, acts_0_37_2} + {{2{acts_0_37_5[5]}}, acts_0_37_5} + {{2{acts_0_37_9[5]}}, acts_0_37_9};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_0), .q(s_0_37_1_0_reg));

    assign s_0_37_1_1 = {{2{acts_0_37_10[5]}}, acts_0_37_10} + {{2{acts_0_37_12[5]}}, acts_0_37_12} + {{2{acts_0_37_13[5]}}, acts_0_37_13} + {{2{acts_0_37_14[5]}}, acts_0_37_14};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_1), .q(s_0_37_1_1_reg));

    assign s_0_37_1_2 = {{2{acts_0_37_15[5]}}, acts_0_37_15} + {{2{acts_0_37_16[5]}}, acts_0_37_16} + {{2{acts_0_37_18[5]}}, acts_0_37_18} + {{2{acts_0_37_19[5]}}, acts_0_37_19};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_2), .q(s_0_37_1_2_reg));

    assign s_0_37_1_3 = {{2{acts_0_37_21[5]}}, acts_0_37_21} + {{2{acts_0_37_24[5]}}, acts_0_37_24} + {{2{acts_0_37_25[5]}}, acts_0_37_25} + {{2{acts_0_37_26[5]}}, acts_0_37_26};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_3), .q(s_0_37_1_3_reg));

    assign s_0_37_1_4 = {{2{acts_0_37_31[5]}}, acts_0_37_31} + {{2{acts_0_37_33[5]}}, acts_0_37_33} + {{2{acts_0_37_34[5]}}, acts_0_37_34} + {{2{acts_0_37_35[5]}}, acts_0_37_35};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_4), .q(s_0_37_1_4_reg));

    assign s_0_37_1_5 = {{2{acts_0_37_36[5]}}, acts_0_37_36} + {{2{acts_0_37_37[5]}}, acts_0_37_37} + {{2{acts_0_37_38[5]}}, acts_0_37_38};
    registers #(.ARRAY_WIDTH(8)) r_0_37_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_1_5), .q(s_0_37_1_5_reg));

  // Stage 2
    assign s_0_37_2_0 = {{2{s_0_37_1_0_reg[7]}}, s_0_37_1_0_reg} + {{2{s_0_37_1_1_reg[7]}}, s_0_37_1_1_reg} + {{2{s_0_37_1_2_reg[7]}}, s_0_37_1_2_reg} + {{2{s_0_37_1_3_reg[7]}}, s_0_37_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_37_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_2_0), .q(s_0_37_2_0_reg));

    assign s_0_37_2_1 = {{2{s_0_37_1_4_reg[7]}}, s_0_37_1_4_reg} + {{2{s_0_37_1_5_reg[7]}}, s_0_37_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_37_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_37_2_1), .q(s_0_37_2_1_reg));

  // Stage 3
    assign sum_0_37 = {{2{s_0_37_2_0_reg[9]}}, s_0_37_2_0_reg} + {{2{s_0_37_2_1_reg[9]}}, s_0_37_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_37), .q(sum_0_37_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_37 (.i_data(sum_0_37_reg), .o_data(out_0_37_sat));


    // Layer 0, Node 38
      logic  [7:0] s_0_38_1_0, s_0_38_1_1, s_0_38_1_2, s_0_38_1_3;
    logic  [7:0] s_0_38_1_0_reg, s_0_38_1_1_reg, s_0_38_1_2_reg, s_0_38_1_3_reg;
    logic  [9:0] s_0_38_2_0;
    logic  [9:0] s_0_38_2_0_reg;
    logic [11:0] sum_0_38;
    logic [11:0] sum_0_38_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_0)) 
    rom_0_38_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_38_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_2)) 
    rom_0_38_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_38_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_3)) 
    rom_0_38_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_38_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_4)) 
    rom_0_38_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_38_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_8)) 
    rom_0_38_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_38_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_9)) 
    rom_0_38_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_38_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_11)) 
    rom_0_38_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_38_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_12)) 
    rom_0_38_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_38_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_17)) 
    rom_0_38_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_38_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_23)) 
    rom_0_38_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_38_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_28)) 
    rom_0_38_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_38_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_34)) 
    rom_0_38_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_38_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_36)) 
    rom_0_38_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_38_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_38)) 
    rom_0_38_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_38_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_39)) 
    rom_0_38_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_38_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_38_40)) 
    rom_0_38_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_38_40));

  // Stage 1
    assign s_0_38_1_0 = {{2{acts_0_38_0[5]}}, acts_0_38_0} + {{2{acts_0_38_2[5]}}, acts_0_38_2} + {{2{acts_0_38_3[5]}}, acts_0_38_3} + {{2{acts_0_38_4[5]}}, acts_0_38_4};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_0), .q(s_0_38_1_0_reg));

    assign s_0_38_1_1 = {{2{acts_0_38_8[5]}}, acts_0_38_8} + {{2{acts_0_38_9[5]}}, acts_0_38_9} + {{2{acts_0_38_11[5]}}, acts_0_38_11} + {{2{acts_0_38_12[5]}}, acts_0_38_12};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_1), .q(s_0_38_1_1_reg));

    assign s_0_38_1_2 = {{2{acts_0_38_17[5]}}, acts_0_38_17} + {{2{acts_0_38_23[5]}}, acts_0_38_23} + {{2{acts_0_38_28[5]}}, acts_0_38_28} + {{2{acts_0_38_34[5]}}, acts_0_38_34};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_2), .q(s_0_38_1_2_reg));

    assign s_0_38_1_3 = {{2{acts_0_38_36[5]}}, acts_0_38_36} + {{2{acts_0_38_38[5]}}, acts_0_38_38} + {{2{acts_0_38_39[5]}}, acts_0_38_39} + {{2{acts_0_38_40[5]}}, acts_0_38_40};
    registers #(.ARRAY_WIDTH(8)) r_0_38_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_1_3), .q(s_0_38_1_3_reg));

  // Stage 2
    assign s_0_38_2_0 = {{2{s_0_38_1_0_reg[7]}}, s_0_38_1_0_reg} + {{2{s_0_38_1_1_reg[7]}}, s_0_38_1_1_reg} + {{2{s_0_38_1_2_reg[7]}}, s_0_38_1_2_reg} + {{2{s_0_38_1_3_reg[7]}}, s_0_38_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_38_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_38_2_0), .q(s_0_38_2_0_reg));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_38_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_38_2_0_reg[9]}}, s_0_38_2_0_reg}), .q(sum_0_38_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_38 (.i_data(sum_0_38_reg), .o_data(out_0_38_sat));


    // Layer 0, Node 39
      logic  [7:0] s_0_39_1_0, s_0_39_1_1, s_0_39_1_2, s_0_39_1_3;
    logic  [7:0] s_0_39_1_0_reg, s_0_39_1_1_reg, s_0_39_1_2_reg, s_0_39_1_3_reg;
    logic  [9:0] s_0_39_2_0;
    logic  [9:0] s_0_39_2_0_reg;
    logic [11:0] sum_0_39;
    logic [11:0] sum_0_39_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_0)) 
    rom_0_39_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_39_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_1)) 
    rom_0_39_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_39_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_4)) 
    rom_0_39_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_39_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_5)) 
    rom_0_39_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_39_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_6)) 
    rom_0_39_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_39_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_9)) 
    rom_0_39_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_39_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_12)) 
    rom_0_39_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_39_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_13)) 
    rom_0_39_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_39_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_14)) 
    rom_0_39_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_39_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_17)) 
    rom_0_39_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_39_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_18)) 
    rom_0_39_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_39_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_19)) 
    rom_0_39_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_39_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_36)) 
    rom_0_39_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_39_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_37)) 
    rom_0_39_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_39_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_39_40)) 
    rom_0_39_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_39_40));

  // Stage 1
    assign s_0_39_1_0 = {{2{acts_0_39_0[5]}}, acts_0_39_0} + {{2{acts_0_39_1[5]}}, acts_0_39_1} + {{2{acts_0_39_4[5]}}, acts_0_39_4} + {{2{acts_0_39_5[5]}}, acts_0_39_5};
    registers #(.ARRAY_WIDTH(8)) r_0_39_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_1_0), .q(s_0_39_1_0_reg));

    assign s_0_39_1_1 = {{2{acts_0_39_6[5]}}, acts_0_39_6} + {{2{acts_0_39_9[5]}}, acts_0_39_9} + {{2{acts_0_39_12[5]}}, acts_0_39_12} + {{2{acts_0_39_13[5]}}, acts_0_39_13};
    registers #(.ARRAY_WIDTH(8)) r_0_39_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_1_1), .q(s_0_39_1_1_reg));

    assign s_0_39_1_2 = {{2{acts_0_39_14[5]}}, acts_0_39_14} + {{2{acts_0_39_17[5]}}, acts_0_39_17} + {{2{acts_0_39_18[5]}}, acts_0_39_18} + {{2{acts_0_39_19[5]}}, acts_0_39_19};
    registers #(.ARRAY_WIDTH(8)) r_0_39_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_1_2), .q(s_0_39_1_2_reg));

    assign s_0_39_1_3 = {{2{acts_0_39_36[5]}}, acts_0_39_36} + {{2{acts_0_39_37[5]}}, acts_0_39_37} + {{2{acts_0_39_40[5]}}, acts_0_39_40};
    registers #(.ARRAY_WIDTH(8)) r_0_39_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_1_3), .q(s_0_39_1_3_reg));

  // Stage 2
    assign s_0_39_2_0 = {{2{s_0_39_1_0_reg[7]}}, s_0_39_1_0_reg} + {{2{s_0_39_1_1_reg[7]}}, s_0_39_1_1_reg} + {{2{s_0_39_1_2_reg[7]}}, s_0_39_1_2_reg} + {{2{s_0_39_1_3_reg[7]}}, s_0_39_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_39_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_39_2_0), .q(s_0_39_2_0_reg));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_39_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_39_2_0_reg[9]}}, s_0_39_2_0_reg}), .q(sum_0_39_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_39 (.i_data(sum_0_39_reg), .o_data(out_0_39_sat));


    // Layer 0, Node 40
      logic  [7:0] s_0_40_1_0, s_0_40_1_1, s_0_40_1_2, s_0_40_1_3, s_0_40_1_4;
    logic  [7:0] s_0_40_1_0_reg, s_0_40_1_1_reg, s_0_40_1_2_reg, s_0_40_1_3_reg, s_0_40_1_4_reg;
    logic  [9:0] s_0_40_2_0, s_0_40_2_1;
    logic  [9:0] s_0_40_2_0_reg, s_0_40_2_1_reg;
    logic [11:0] sum_0_40;
    logic [11:0] sum_0_40_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_2)) 
    rom_0_40_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_40_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_5)) 
    rom_0_40_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_40_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_6)) 
    rom_0_40_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_40_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_9)) 
    rom_0_40_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_40_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_10)) 
    rom_0_40_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_40_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_11)) 
    rom_0_40_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_40_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_12)) 
    rom_0_40_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_40_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_13)) 
    rom_0_40_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_40_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_14)) 
    rom_0_40_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_40_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_16)) 
    rom_0_40_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_40_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_20)) 
    rom_0_40_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_40_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_23)) 
    rom_0_40_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_40_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_24)) 
    rom_0_40_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_40_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_26)) 
    rom_0_40_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_40_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_31)) 
    rom_0_40_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_40_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_35)) 
    rom_0_40_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_40_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_36)) 
    rom_0_40_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_40_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_38)) 
    rom_0_40_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_40_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_39)) 
    rom_0_40_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_40_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_40_40)) 
    rom_0_40_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_40_40));

  // Stage 1
    assign s_0_40_1_0 = {{2{acts_0_40_2[5]}}, acts_0_40_2} + {{2{acts_0_40_5[5]}}, acts_0_40_5} + {{2{acts_0_40_6[5]}}, acts_0_40_6} + {{2{acts_0_40_9[5]}}, acts_0_40_9};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_0), .q(s_0_40_1_0_reg));

    assign s_0_40_1_1 = {{2{acts_0_40_10[5]}}, acts_0_40_10} + {{2{acts_0_40_11[5]}}, acts_0_40_11} + {{2{acts_0_40_12[5]}}, acts_0_40_12} + {{2{acts_0_40_13[5]}}, acts_0_40_13};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_1), .q(s_0_40_1_1_reg));

    assign s_0_40_1_2 = {{2{acts_0_40_14[5]}}, acts_0_40_14} + {{2{acts_0_40_16[5]}}, acts_0_40_16} + {{2{acts_0_40_20[5]}}, acts_0_40_20} + {{2{acts_0_40_23[5]}}, acts_0_40_23};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_2), .q(s_0_40_1_2_reg));

    assign s_0_40_1_3 = {{2{acts_0_40_24[5]}}, acts_0_40_24} + {{2{acts_0_40_26[5]}}, acts_0_40_26} + {{2{acts_0_40_31[5]}}, acts_0_40_31} + {{2{acts_0_40_35[5]}}, acts_0_40_35};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_3), .q(s_0_40_1_3_reg));

    assign s_0_40_1_4 = {{2{acts_0_40_36[5]}}, acts_0_40_36} + {{2{acts_0_40_38[5]}}, acts_0_40_38} + {{2{acts_0_40_39[5]}}, acts_0_40_39} + {{2{acts_0_40_40[5]}}, acts_0_40_40};
    registers #(.ARRAY_WIDTH(8)) r_0_40_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_1_4), .q(s_0_40_1_4_reg));

  // Stage 2
    assign s_0_40_2_0 = {{2{s_0_40_1_0_reg[7]}}, s_0_40_1_0_reg} + {{2{s_0_40_1_1_reg[7]}}, s_0_40_1_1_reg} + {{2{s_0_40_1_2_reg[7]}}, s_0_40_1_2_reg} + {{2{s_0_40_1_3_reg[7]}}, s_0_40_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_40_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_2_0), .q(s_0_40_2_0_reg));

    assign s_0_40_2_1 = {{2{s_0_40_1_4_reg[7]}}, s_0_40_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_40_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_40_2_1), .q(s_0_40_2_1_reg));

  // Stage 3
    assign sum_0_40 = {{2{s_0_40_2_0_reg[9]}}, s_0_40_2_0_reg} + {{2{s_0_40_2_1_reg[9]}}, s_0_40_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_40), .q(sum_0_40_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_40 (.i_data(sum_0_40_reg), .o_data(out_0_40_sat));


    // Layer 0, Node 41
      logic  [7:0] s_0_41_1_0, s_0_41_1_1, s_0_41_1_2, s_0_41_1_3;
    logic  [7:0] s_0_41_1_0_reg, s_0_41_1_1_reg, s_0_41_1_2_reg, s_0_41_1_3_reg;
    logic  [9:0] s_0_41_2_0;
    logic  [9:0] s_0_41_2_0_reg;
    logic [11:0] sum_0_41;
    logic [11:0] sum_0_41_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_0)) 
    rom_0_41_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_41_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_2)) 
    rom_0_41_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_41_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_4)) 
    rom_0_41_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_41_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_6)) 
    rom_0_41_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_41_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_7)) 
    rom_0_41_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_41_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_14)) 
    rom_0_41_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_41_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_16)) 
    rom_0_41_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_41_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_17)) 
    rom_0_41_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_41_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_25)) 
    rom_0_41_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_41_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_29)) 
    rom_0_41_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_41_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_37)) 
    rom_0_41_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_41_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_38)) 
    rom_0_41_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_41_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_41_41)) 
    rom_0_41_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_41_41));

  // Stage 1
    assign s_0_41_1_0 = {{2{acts_0_41_0[5]}}, acts_0_41_0} + {{2{acts_0_41_2[5]}}, acts_0_41_2} + {{2{acts_0_41_4[5]}}, acts_0_41_4} + {{2{acts_0_41_6[5]}}, acts_0_41_6};
    registers #(.ARRAY_WIDTH(8)) r_0_41_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_1_0), .q(s_0_41_1_0_reg));

    assign s_0_41_1_1 = {{2{acts_0_41_7[5]}}, acts_0_41_7} + {{2{acts_0_41_14[5]}}, acts_0_41_14} + {{2{acts_0_41_16[5]}}, acts_0_41_16} + {{2{acts_0_41_17[5]}}, acts_0_41_17};
    registers #(.ARRAY_WIDTH(8)) r_0_41_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_1_1), .q(s_0_41_1_1_reg));

    assign s_0_41_1_2 = {{2{acts_0_41_25[5]}}, acts_0_41_25} + {{2{acts_0_41_29[5]}}, acts_0_41_29} + {{2{acts_0_41_37[5]}}, acts_0_41_37} + {{2{acts_0_41_38[5]}}, acts_0_41_38};
    registers #(.ARRAY_WIDTH(8)) r_0_41_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_1_2), .q(s_0_41_1_2_reg));

    assign s_0_41_1_3 = {{2{acts_0_41_41[5]}}, acts_0_41_41};
    registers #(.ARRAY_WIDTH(8)) r_0_41_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_1_3), .q(s_0_41_1_3_reg));

  // Stage 2
    assign s_0_41_2_0 = {{2{s_0_41_1_0_reg[7]}}, s_0_41_1_0_reg} + {{2{s_0_41_1_1_reg[7]}}, s_0_41_1_1_reg} + {{2{s_0_41_1_2_reg[7]}}, s_0_41_1_2_reg} + {{2{s_0_41_1_3_reg[7]}}, s_0_41_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_41_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_41_2_0), .q(s_0_41_2_0_reg));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_41_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_41_2_0_reg[9]}}, s_0_41_2_0_reg}), .q(sum_0_41_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_41 (.i_data(sum_0_41_reg), .o_data(out_0_41_sat));


    // Layer 0, Node 42
      logic  [7:0] s_0_42_1_0, s_0_42_1_1, s_0_42_1_2, s_0_42_1_3, s_0_42_1_4;
    logic  [7:0] s_0_42_1_0_reg, s_0_42_1_1_reg, s_0_42_1_2_reg, s_0_42_1_3_reg, s_0_42_1_4_reg;
    logic  [9:0] s_0_42_2_0, s_0_42_2_1;
    logic  [9:0] s_0_42_2_0_reg, s_0_42_2_1_reg;
    logic [11:0] sum_0_42;
    logic [11:0] sum_0_42_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_1)) 
    rom_0_42_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_42_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_2)) 
    rom_0_42_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_42_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_4)) 
    rom_0_42_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_42_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_5)) 
    rom_0_42_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_42_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_6)) 
    rom_0_42_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_42_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_9)) 
    rom_0_42_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_42_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_12)) 
    rom_0_42_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_42_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_16)) 
    rom_0_42_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_42_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_18)) 
    rom_0_42_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_42_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_20)) 
    rom_0_42_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_42_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_21)) 
    rom_0_42_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_42_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_25)) 
    rom_0_42_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_42_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_29)) 
    rom_0_42_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_42_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_33)) 
    rom_0_42_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_42_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_34)) 
    rom_0_42_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_42_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_35)) 
    rom_0_42_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_42_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_37)) 
    rom_0_42_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_42_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_42_40)) 
    rom_0_42_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_42_40));

  // Stage 1
    assign s_0_42_1_0 = {{2{acts_0_42_1[5]}}, acts_0_42_1} + {{2{acts_0_42_2[5]}}, acts_0_42_2} + {{2{acts_0_42_4[5]}}, acts_0_42_4} + {{2{acts_0_42_5[5]}}, acts_0_42_5};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_0), .q(s_0_42_1_0_reg));

    assign s_0_42_1_1 = {{2{acts_0_42_6[5]}}, acts_0_42_6} + {{2{acts_0_42_9[5]}}, acts_0_42_9} + {{2{acts_0_42_12[5]}}, acts_0_42_12} + {{2{acts_0_42_16[5]}}, acts_0_42_16};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_1), .q(s_0_42_1_1_reg));

    assign s_0_42_1_2 = {{2{acts_0_42_18[5]}}, acts_0_42_18} + {{2{acts_0_42_20[5]}}, acts_0_42_20} + {{2{acts_0_42_21[5]}}, acts_0_42_21} + {{2{acts_0_42_25[5]}}, acts_0_42_25};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_2), .q(s_0_42_1_2_reg));

    assign s_0_42_1_3 = {{2{acts_0_42_29[5]}}, acts_0_42_29} + {{2{acts_0_42_33[5]}}, acts_0_42_33} + {{2{acts_0_42_34[5]}}, acts_0_42_34} + {{2{acts_0_42_35[5]}}, acts_0_42_35};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_3), .q(s_0_42_1_3_reg));

    assign s_0_42_1_4 = {{2{acts_0_42_37[5]}}, acts_0_42_37} + {{2{acts_0_42_40[5]}}, acts_0_42_40};
    registers #(.ARRAY_WIDTH(8)) r_0_42_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_1_4), .q(s_0_42_1_4_reg));

  // Stage 2
    assign s_0_42_2_0 = {{2{s_0_42_1_0_reg[7]}}, s_0_42_1_0_reg} + {{2{s_0_42_1_1_reg[7]}}, s_0_42_1_1_reg} + {{2{s_0_42_1_2_reg[7]}}, s_0_42_1_2_reg} + {{2{s_0_42_1_3_reg[7]}}, s_0_42_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_42_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_2_0), .q(s_0_42_2_0_reg));

    assign s_0_42_2_1 = {{2{s_0_42_1_4_reg[7]}}, s_0_42_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_42_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_42_2_1), .q(s_0_42_2_1_reg));

  // Stage 3
    assign sum_0_42 = {{2{s_0_42_2_0_reg[9]}}, s_0_42_2_0_reg} + {{2{s_0_42_2_1_reg[9]}}, s_0_42_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_42), .q(sum_0_42_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_42 (.i_data(sum_0_42_reg), .o_data(out_0_42_sat));


    // Layer 0, Node 43
      logic  [7:0] s_0_43_1_0, s_0_43_1_1, s_0_43_1_2, s_0_43_1_3, s_0_43_1_4;
    logic  [7:0] s_0_43_1_0_reg, s_0_43_1_1_reg, s_0_43_1_2_reg, s_0_43_1_3_reg, s_0_43_1_4_reg;
    logic  [9:0] s_0_43_2_0, s_0_43_2_1;
    logic  [9:0] s_0_43_2_0_reg, s_0_43_2_1_reg;
    logic [11:0] sum_0_43;
    logic [11:0] sum_0_43_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_1)) 
    rom_0_43_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_43_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_7)) 
    rom_0_43_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_43_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_9)) 
    rom_0_43_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_43_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_14)) 
    rom_0_43_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_43_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_15)) 
    rom_0_43_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_43_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_16)) 
    rom_0_43_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_43_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_20)) 
    rom_0_43_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_43_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_21)) 
    rom_0_43_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_43_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_23)) 
    rom_0_43_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_43_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_25)) 
    rom_0_43_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_43_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_26)) 
    rom_0_43_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_43_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_28)) 
    rom_0_43_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_43_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_29)) 
    rom_0_43_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_43_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_33)) 
    rom_0_43_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_43_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_35)) 
    rom_0_43_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_43_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_37)) 
    rom_0_43_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_43_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_38)) 
    rom_0_43_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_43_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_39)) 
    rom_0_43_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_43_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_43_40)) 
    rom_0_43_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_43_40));

  // Stage 1
    assign s_0_43_1_0 = {{2{acts_0_43_1[5]}}, acts_0_43_1} + {{2{acts_0_43_7[5]}}, acts_0_43_7} + {{2{acts_0_43_9[5]}}, acts_0_43_9} + {{2{acts_0_43_14[5]}}, acts_0_43_14};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_0), .q(s_0_43_1_0_reg));

    assign s_0_43_1_1 = {{2{acts_0_43_15[5]}}, acts_0_43_15} + {{2{acts_0_43_16[5]}}, acts_0_43_16} + {{2{acts_0_43_20[5]}}, acts_0_43_20} + {{2{acts_0_43_21[5]}}, acts_0_43_21};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_1), .q(s_0_43_1_1_reg));

    assign s_0_43_1_2 = {{2{acts_0_43_23[5]}}, acts_0_43_23} + {{2{acts_0_43_25[5]}}, acts_0_43_25} + {{2{acts_0_43_26[5]}}, acts_0_43_26} + {{2{acts_0_43_28[5]}}, acts_0_43_28};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_2), .q(s_0_43_1_2_reg));

    assign s_0_43_1_3 = {{2{acts_0_43_29[5]}}, acts_0_43_29} + {{2{acts_0_43_33[5]}}, acts_0_43_33} + {{2{acts_0_43_35[5]}}, acts_0_43_35} + {{2{acts_0_43_37[5]}}, acts_0_43_37};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_3), .q(s_0_43_1_3_reg));

    assign s_0_43_1_4 = {{2{acts_0_43_38[5]}}, acts_0_43_38} + {{2{acts_0_43_39[5]}}, acts_0_43_39} + {{2{acts_0_43_40[5]}}, acts_0_43_40};
    registers #(.ARRAY_WIDTH(8)) r_0_43_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_1_4), .q(s_0_43_1_4_reg));

  // Stage 2
    assign s_0_43_2_0 = {{2{s_0_43_1_0_reg[7]}}, s_0_43_1_0_reg} + {{2{s_0_43_1_1_reg[7]}}, s_0_43_1_1_reg} + {{2{s_0_43_1_2_reg[7]}}, s_0_43_1_2_reg} + {{2{s_0_43_1_3_reg[7]}}, s_0_43_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_43_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_2_0), .q(s_0_43_2_0_reg));

    assign s_0_43_2_1 = {{2{s_0_43_1_4_reg[7]}}, s_0_43_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_43_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_43_2_1), .q(s_0_43_2_1_reg));

  // Stage 3
    assign sum_0_43 = {{2{s_0_43_2_0_reg[9]}}, s_0_43_2_0_reg} + {{2{s_0_43_2_1_reg[9]}}, s_0_43_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_43), .q(sum_0_43_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_43 (.i_data(sum_0_43_reg), .o_data(out_0_43_sat));


    // Layer 0, Node 44
      logic  [7:0] s_0_44_1_0, s_0_44_1_1, s_0_44_1_2, s_0_44_1_3;
    logic  [7:0] s_0_44_1_0_reg, s_0_44_1_1_reg, s_0_44_1_2_reg, s_0_44_1_3_reg;
    logic  [9:0] s_0_44_2_0;
    logic  [9:0] s_0_44_2_0_reg;
    logic [11:0] sum_0_44;
    logic [11:0] sum_0_44_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_0)) 
    rom_0_44_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_44_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_2)) 
    rom_0_44_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_44_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_8)) 
    rom_0_44_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_44_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_12)) 
    rom_0_44_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_44_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_14)) 
    rom_0_44_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_44_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_15)) 
    rom_0_44_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_44_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_17)) 
    rom_0_44_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_44_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_19)) 
    rom_0_44_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_44_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_20)) 
    rom_0_44_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_44_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_21)) 
    rom_0_44_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_44_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_32)) 
    rom_0_44_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_44_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_34)) 
    rom_0_44_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_44_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_35)) 
    rom_0_44_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_44_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_36)) 
    rom_0_44_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_44_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_38)) 
    rom_0_44_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_44_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_44_39)) 
    rom_0_44_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_44_39));

  // Stage 1
    assign s_0_44_1_0 = {{2{acts_0_44_0[5]}}, acts_0_44_0} + {{2{acts_0_44_2[5]}}, acts_0_44_2} + {{2{acts_0_44_8[5]}}, acts_0_44_8} + {{2{acts_0_44_12[5]}}, acts_0_44_12};
    registers #(.ARRAY_WIDTH(8)) r_0_44_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_1_0), .q(s_0_44_1_0_reg));

    assign s_0_44_1_1 = {{2{acts_0_44_14[5]}}, acts_0_44_14} + {{2{acts_0_44_15[5]}}, acts_0_44_15} + {{2{acts_0_44_17[5]}}, acts_0_44_17} + {{2{acts_0_44_19[5]}}, acts_0_44_19};
    registers #(.ARRAY_WIDTH(8)) r_0_44_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_1_1), .q(s_0_44_1_1_reg));

    assign s_0_44_1_2 = {{2{acts_0_44_20[5]}}, acts_0_44_20} + {{2{acts_0_44_21[5]}}, acts_0_44_21} + {{2{acts_0_44_32[5]}}, acts_0_44_32} + {{2{acts_0_44_34[5]}}, acts_0_44_34};
    registers #(.ARRAY_WIDTH(8)) r_0_44_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_1_2), .q(s_0_44_1_2_reg));

    assign s_0_44_1_3 = {{2{acts_0_44_35[5]}}, acts_0_44_35} + {{2{acts_0_44_36[5]}}, acts_0_44_36} + {{2{acts_0_44_38[5]}}, acts_0_44_38} + {{2{acts_0_44_39[5]}}, acts_0_44_39};
    registers #(.ARRAY_WIDTH(8)) r_0_44_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_1_3), .q(s_0_44_1_3_reg));

  // Stage 2
    assign s_0_44_2_0 = {{2{s_0_44_1_0_reg[7]}}, s_0_44_1_0_reg} + {{2{s_0_44_1_1_reg[7]}}, s_0_44_1_1_reg} + {{2{s_0_44_1_2_reg[7]}}, s_0_44_1_2_reg} + {{2{s_0_44_1_3_reg[7]}}, s_0_44_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_44_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_44_2_0), .q(s_0_44_2_0_reg));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_44_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_44_2_0_reg[9]}}, s_0_44_2_0_reg}), .q(sum_0_44_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_44 (.i_data(sum_0_44_reg), .o_data(out_0_44_sat));


    // Layer 0, Node 45
      logic  [7:0] s_0_45_1_0, s_0_45_1_1, s_0_45_1_2, s_0_45_1_3, s_0_45_1_4;
    logic  [7:0] s_0_45_1_0_reg, s_0_45_1_1_reg, s_0_45_1_2_reg, s_0_45_1_3_reg, s_0_45_1_4_reg;
    logic  [9:0] s_0_45_2_0, s_0_45_2_1;
    logic  [9:0] s_0_45_2_0_reg, s_0_45_2_1_reg;
    logic [11:0] sum_0_45;
    logic [11:0] sum_0_45_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_1)) 
    rom_0_45_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_45_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_2)) 
    rom_0_45_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_45_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_3)) 
    rom_0_45_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_45_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_5)) 
    rom_0_45_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_45_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_8)) 
    rom_0_45_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_45_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_9)) 
    rom_0_45_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_45_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_13)) 
    rom_0_45_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_45_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_16)) 
    rom_0_45_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_45_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_20)) 
    rom_0_45_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_45_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_25)) 
    rom_0_45_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_45_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_26)) 
    rom_0_45_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_45_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_27)) 
    rom_0_45_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_45_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_34)) 
    rom_0_45_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_45_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_35)) 
    rom_0_45_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_45_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_37)) 
    rom_0_45_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_45_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_38)) 
    rom_0_45_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_45_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_39)) 
    rom_0_45_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_45_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_45_40)) 
    rom_0_45_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_45_40));

  // Stage 1
    assign s_0_45_1_0 = {{2{acts_0_45_1[5]}}, acts_0_45_1} + {{2{acts_0_45_2[5]}}, acts_0_45_2} + {{2{acts_0_45_3[5]}}, acts_0_45_3} + {{2{acts_0_45_5[5]}}, acts_0_45_5};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_0), .q(s_0_45_1_0_reg));

    assign s_0_45_1_1 = {{2{acts_0_45_8[5]}}, acts_0_45_8} + {{2{acts_0_45_9[5]}}, acts_0_45_9} + {{2{acts_0_45_13[5]}}, acts_0_45_13} + {{2{acts_0_45_16[5]}}, acts_0_45_16};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_1), .q(s_0_45_1_1_reg));

    assign s_0_45_1_2 = {{2{acts_0_45_20[5]}}, acts_0_45_20} + {{2{acts_0_45_25[5]}}, acts_0_45_25} + {{2{acts_0_45_26[5]}}, acts_0_45_26} + {{2{acts_0_45_27[5]}}, acts_0_45_27};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_2), .q(s_0_45_1_2_reg));

    assign s_0_45_1_3 = {{2{acts_0_45_34[5]}}, acts_0_45_34} + {{2{acts_0_45_35[5]}}, acts_0_45_35} + {{2{acts_0_45_37[5]}}, acts_0_45_37} + {{2{acts_0_45_38[5]}}, acts_0_45_38};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_3), .q(s_0_45_1_3_reg));

    assign s_0_45_1_4 = {{2{acts_0_45_39[5]}}, acts_0_45_39} + {{2{acts_0_45_40[5]}}, acts_0_45_40};
    registers #(.ARRAY_WIDTH(8)) r_0_45_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_1_4), .q(s_0_45_1_4_reg));

  // Stage 2
    assign s_0_45_2_0 = {{2{s_0_45_1_0_reg[7]}}, s_0_45_1_0_reg} + {{2{s_0_45_1_1_reg[7]}}, s_0_45_1_1_reg} + {{2{s_0_45_1_2_reg[7]}}, s_0_45_1_2_reg} + {{2{s_0_45_1_3_reg[7]}}, s_0_45_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_45_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_2_0), .q(s_0_45_2_0_reg));

    assign s_0_45_2_1 = {{2{s_0_45_1_4_reg[7]}}, s_0_45_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_45_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_45_2_1), .q(s_0_45_2_1_reg));

  // Stage 3
    assign sum_0_45 = {{2{s_0_45_2_0_reg[9]}}, s_0_45_2_0_reg} + {{2{s_0_45_2_1_reg[9]}}, s_0_45_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_45), .q(sum_0_45_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_45 (.i_data(sum_0_45_reg), .o_data(out_0_45_sat));


    // Layer 0, Node 46
      logic  [7:0] s_0_46_1_0, s_0_46_1_1, s_0_46_1_2, s_0_46_1_3, s_0_46_1_4, s_0_46_1_5, s_0_46_1_6;
    logic  [7:0] s_0_46_1_0_reg, s_0_46_1_1_reg, s_0_46_1_2_reg, s_0_46_1_3_reg, s_0_46_1_4_reg, s_0_46_1_5_reg, s_0_46_1_6_reg;
    logic  [9:0] s_0_46_2_0, s_0_46_2_1;
    logic  [9:0] s_0_46_2_0_reg, s_0_46_2_1_reg;
    logic [11:0] sum_0_46;
    logic [11:0] sum_0_46_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_0)) 
    rom_0_46_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_46_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_3)) 
    rom_0_46_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_46_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_4)) 
    rom_0_46_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_46_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_8)) 
    rom_0_46_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_46_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_9)) 
    rom_0_46_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_46_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_11)) 
    rom_0_46_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_46_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_12)) 
    rom_0_46_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_46_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_13)) 
    rom_0_46_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_46_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_14)) 
    rom_0_46_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_46_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_15)) 
    rom_0_46_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_46_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_16)) 
    rom_0_46_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_46_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_17)) 
    rom_0_46_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_46_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_18)) 
    rom_0_46_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_46_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_20)) 
    rom_0_46_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_46_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_21)) 
    rom_0_46_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_46_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_22)) 
    rom_0_46_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_46_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_23)) 
    rom_0_46_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_46_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_24)) 
    rom_0_46_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_46_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_29)) 
    rom_0_46_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_46_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_30)) 
    rom_0_46_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_46_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_31)) 
    rom_0_46_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_46_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_32)) 
    rom_0_46_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_46_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_33)) 
    rom_0_46_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_46_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_34)) 
    rom_0_46_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_46_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_35)) 
    rom_0_46_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_46_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_36)) 
    rom_0_46_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_46_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_46_38)) 
    rom_0_46_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_46_38));

  // Stage 1
    assign s_0_46_1_0 = {{2{acts_0_46_0[5]}}, acts_0_46_0} + {{2{acts_0_46_3[5]}}, acts_0_46_3} + {{2{acts_0_46_4[5]}}, acts_0_46_4} + {{2{acts_0_46_8[5]}}, acts_0_46_8};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_0), .q(s_0_46_1_0_reg));

    assign s_0_46_1_1 = {{2{acts_0_46_9[5]}}, acts_0_46_9} + {{2{acts_0_46_11[5]}}, acts_0_46_11} + {{2{acts_0_46_12[5]}}, acts_0_46_12} + {{2{acts_0_46_13[5]}}, acts_0_46_13};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_1), .q(s_0_46_1_1_reg));

    assign s_0_46_1_2 = {{2{acts_0_46_14[5]}}, acts_0_46_14} + {{2{acts_0_46_15[5]}}, acts_0_46_15} + {{2{acts_0_46_16[5]}}, acts_0_46_16} + {{2{acts_0_46_17[5]}}, acts_0_46_17};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_2), .q(s_0_46_1_2_reg));

    assign s_0_46_1_3 = {{2{acts_0_46_18[5]}}, acts_0_46_18} + {{2{acts_0_46_20[5]}}, acts_0_46_20} + {{2{acts_0_46_21[5]}}, acts_0_46_21} + {{2{acts_0_46_22[5]}}, acts_0_46_22};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_3), .q(s_0_46_1_3_reg));

    assign s_0_46_1_4 = {{2{acts_0_46_23[5]}}, acts_0_46_23} + {{2{acts_0_46_24[5]}}, acts_0_46_24} + {{2{acts_0_46_29[5]}}, acts_0_46_29} + {{2{acts_0_46_30[5]}}, acts_0_46_30};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_4), .q(s_0_46_1_4_reg));

    assign s_0_46_1_5 = {{2{acts_0_46_31[5]}}, acts_0_46_31} + {{2{acts_0_46_32[5]}}, acts_0_46_32} + {{2{acts_0_46_33[5]}}, acts_0_46_33} + {{2{acts_0_46_34[5]}}, acts_0_46_34};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_5), .q(s_0_46_1_5_reg));

    assign s_0_46_1_6 = {{2{acts_0_46_35[5]}}, acts_0_46_35} + {{2{acts_0_46_36[5]}}, acts_0_46_36} + {{2{acts_0_46_38[5]}}, acts_0_46_38};
    registers #(.ARRAY_WIDTH(8)) r_0_46_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_1_6), .q(s_0_46_1_6_reg));

  // Stage 2
    assign s_0_46_2_0 = {{2{s_0_46_1_0_reg[7]}}, s_0_46_1_0_reg} + {{2{s_0_46_1_1_reg[7]}}, s_0_46_1_1_reg} + {{2{s_0_46_1_2_reg[7]}}, s_0_46_1_2_reg} + {{2{s_0_46_1_3_reg[7]}}, s_0_46_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_46_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_2_0), .q(s_0_46_2_0_reg));

    assign s_0_46_2_1 = {{2{s_0_46_1_4_reg[7]}}, s_0_46_1_4_reg} + {{2{s_0_46_1_5_reg[7]}}, s_0_46_1_5_reg} + {{2{s_0_46_1_6_reg[7]}}, s_0_46_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_46_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_46_2_1), .q(s_0_46_2_1_reg));

  // Stage 3
    assign sum_0_46 = {{2{s_0_46_2_0_reg[9]}}, s_0_46_2_0_reg} + {{2{s_0_46_2_1_reg[9]}}, s_0_46_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_46), .q(sum_0_46_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_46 (.i_data(sum_0_46_reg), .o_data(out_0_46_sat));


    // Layer 0, Node 47
      logic  [7:0] s_0_47_1_0, s_0_47_1_1, s_0_47_1_2, s_0_47_1_3, s_0_47_1_4, s_0_47_1_5;
    logic  [7:0] s_0_47_1_0_reg, s_0_47_1_1_reg, s_0_47_1_2_reg, s_0_47_1_3_reg, s_0_47_1_4_reg, s_0_47_1_5_reg;
    logic  [9:0] s_0_47_2_0, s_0_47_2_1;
    logic  [9:0] s_0_47_2_0_reg, s_0_47_2_1_reg;
    logic [11:0] sum_0_47;
    logic [11:0] sum_0_47_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_0)) 
    rom_0_47_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_47_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_2)) 
    rom_0_47_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_47_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_6)) 
    rom_0_47_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_47_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_7)) 
    rom_0_47_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_47_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_9)) 
    rom_0_47_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_47_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_10)) 
    rom_0_47_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_47_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_12)) 
    rom_0_47_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_47_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_13)) 
    rom_0_47_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_47_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_14)) 
    rom_0_47_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_47_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_15)) 
    rom_0_47_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_47_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_17)) 
    rom_0_47_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_47_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_18)) 
    rom_0_47_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_47_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_20)) 
    rom_0_47_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_47_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_21)) 
    rom_0_47_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_47_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_24)) 
    rom_0_47_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_47_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_25)) 
    rom_0_47_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_47_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_26)) 
    rom_0_47_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_47_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_32)) 
    rom_0_47_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_47_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_33)) 
    rom_0_47_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_47_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_36)) 
    rom_0_47_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_47_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_37)) 
    rom_0_47_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_47_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_47_39)) 
    rom_0_47_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_47_39));

  // Stage 1
    assign s_0_47_1_0 = {{2{acts_0_47_0[5]}}, acts_0_47_0} + {{2{acts_0_47_2[5]}}, acts_0_47_2} + {{2{acts_0_47_6[5]}}, acts_0_47_6} + {{2{acts_0_47_7[5]}}, acts_0_47_7};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_0), .q(s_0_47_1_0_reg));

    assign s_0_47_1_1 = {{2{acts_0_47_9[5]}}, acts_0_47_9} + {{2{acts_0_47_10[5]}}, acts_0_47_10} + {{2{acts_0_47_12[5]}}, acts_0_47_12} + {{2{acts_0_47_13[5]}}, acts_0_47_13};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_1), .q(s_0_47_1_1_reg));

    assign s_0_47_1_2 = {{2{acts_0_47_14[5]}}, acts_0_47_14} + {{2{acts_0_47_15[5]}}, acts_0_47_15} + {{2{acts_0_47_17[5]}}, acts_0_47_17} + {{2{acts_0_47_18[5]}}, acts_0_47_18};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_2), .q(s_0_47_1_2_reg));

    assign s_0_47_1_3 = {{2{acts_0_47_20[5]}}, acts_0_47_20} + {{2{acts_0_47_21[5]}}, acts_0_47_21} + {{2{acts_0_47_24[5]}}, acts_0_47_24} + {{2{acts_0_47_25[5]}}, acts_0_47_25};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_3), .q(s_0_47_1_3_reg));

    assign s_0_47_1_4 = {{2{acts_0_47_26[5]}}, acts_0_47_26} + {{2{acts_0_47_32[5]}}, acts_0_47_32} + {{2{acts_0_47_33[5]}}, acts_0_47_33} + {{2{acts_0_47_36[5]}}, acts_0_47_36};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_4), .q(s_0_47_1_4_reg));

    assign s_0_47_1_5 = {{2{acts_0_47_37[5]}}, acts_0_47_37} + {{2{acts_0_47_39[5]}}, acts_0_47_39};
    registers #(.ARRAY_WIDTH(8)) r_0_47_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_1_5), .q(s_0_47_1_5_reg));

  // Stage 2
    assign s_0_47_2_0 = {{2{s_0_47_1_0_reg[7]}}, s_0_47_1_0_reg} + {{2{s_0_47_1_1_reg[7]}}, s_0_47_1_1_reg} + {{2{s_0_47_1_2_reg[7]}}, s_0_47_1_2_reg} + {{2{s_0_47_1_3_reg[7]}}, s_0_47_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_47_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_2_0), .q(s_0_47_2_0_reg));

    assign s_0_47_2_1 = {{2{s_0_47_1_4_reg[7]}}, s_0_47_1_4_reg} + {{2{s_0_47_1_5_reg[7]}}, s_0_47_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_47_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_47_2_1), .q(s_0_47_2_1_reg));

  // Stage 3
    assign sum_0_47 = {{2{s_0_47_2_0_reg[9]}}, s_0_47_2_0_reg} + {{2{s_0_47_2_1_reg[9]}}, s_0_47_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_47), .q(sum_0_47_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_47 (.i_data(sum_0_47_reg), .o_data(out_0_47_sat));


    // Layer 0, Node 48
      logic  [7:0] s_0_48_1_0, s_0_48_1_1, s_0_48_1_2, s_0_48_1_3, s_0_48_1_4;
    logic  [7:0] s_0_48_1_0_reg, s_0_48_1_1_reg, s_0_48_1_2_reg, s_0_48_1_3_reg, s_0_48_1_4_reg;
    logic  [9:0] s_0_48_2_0, s_0_48_2_1;
    logic  [9:0] s_0_48_2_0_reg, s_0_48_2_1_reg;
    logic [11:0] sum_0_48;
    logic [11:0] sum_0_48_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_0)) 
    rom_0_48_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_48_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_1)) 
    rom_0_48_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_48_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_2)) 
    rom_0_48_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_48_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_5)) 
    rom_0_48_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_48_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_7)) 
    rom_0_48_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_48_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_11)) 
    rom_0_48_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_48_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_13)) 
    rom_0_48_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_48_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_15)) 
    rom_0_48_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_48_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_16)) 
    rom_0_48_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_48_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_23)) 
    rom_0_48_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_48_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_24)) 
    rom_0_48_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_48_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_26)) 
    rom_0_48_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_48_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_27)) 
    rom_0_48_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_48_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_28)) 
    rom_0_48_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_48_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_29)) 
    rom_0_48_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_48_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_30)) 
    rom_0_48_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_48_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_34)) 
    rom_0_48_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_48_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_38)) 
    rom_0_48_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_48_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_48_40)) 
    rom_0_48_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_48_40));

  // Stage 1
    assign s_0_48_1_0 = {{2{acts_0_48_0[5]}}, acts_0_48_0} + {{2{acts_0_48_1[5]}}, acts_0_48_1} + {{2{acts_0_48_2[5]}}, acts_0_48_2} + {{2{acts_0_48_5[5]}}, acts_0_48_5};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_0), .q(s_0_48_1_0_reg));

    assign s_0_48_1_1 = {{2{acts_0_48_7[5]}}, acts_0_48_7} + {{2{acts_0_48_11[5]}}, acts_0_48_11} + {{2{acts_0_48_13[5]}}, acts_0_48_13} + {{2{acts_0_48_15[5]}}, acts_0_48_15};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_1), .q(s_0_48_1_1_reg));

    assign s_0_48_1_2 = {{2{acts_0_48_16[5]}}, acts_0_48_16} + {{2{acts_0_48_23[5]}}, acts_0_48_23} + {{2{acts_0_48_24[5]}}, acts_0_48_24} + {{2{acts_0_48_26[5]}}, acts_0_48_26};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_2), .q(s_0_48_1_2_reg));

    assign s_0_48_1_3 = {{2{acts_0_48_27[5]}}, acts_0_48_27} + {{2{acts_0_48_28[5]}}, acts_0_48_28} + {{2{acts_0_48_29[5]}}, acts_0_48_29} + {{2{acts_0_48_30[5]}}, acts_0_48_30};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_3), .q(s_0_48_1_3_reg));

    assign s_0_48_1_4 = {{2{acts_0_48_34[5]}}, acts_0_48_34} + {{2{acts_0_48_38[5]}}, acts_0_48_38} + {{2{acts_0_48_40[5]}}, acts_0_48_40};
    registers #(.ARRAY_WIDTH(8)) r_0_48_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_1_4), .q(s_0_48_1_4_reg));

  // Stage 2
    assign s_0_48_2_0 = {{2{s_0_48_1_0_reg[7]}}, s_0_48_1_0_reg} + {{2{s_0_48_1_1_reg[7]}}, s_0_48_1_1_reg} + {{2{s_0_48_1_2_reg[7]}}, s_0_48_1_2_reg} + {{2{s_0_48_1_3_reg[7]}}, s_0_48_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_48_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_2_0), .q(s_0_48_2_0_reg));

    assign s_0_48_2_1 = {{2{s_0_48_1_4_reg[7]}}, s_0_48_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_48_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_48_2_1), .q(s_0_48_2_1_reg));

  // Stage 3
    assign sum_0_48 = {{2{s_0_48_2_0_reg[9]}}, s_0_48_2_0_reg} + {{2{s_0_48_2_1_reg[9]}}, s_0_48_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_48), .q(sum_0_48_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_48 (.i_data(sum_0_48_reg), .o_data(out_0_48_sat));


    // Layer 0, Node 49
      logic  [7:0] s_0_49_1_0, s_0_49_1_1, s_0_49_1_2, s_0_49_1_3, s_0_49_1_4;
    logic  [7:0] s_0_49_1_0_reg, s_0_49_1_1_reg, s_0_49_1_2_reg, s_0_49_1_3_reg, s_0_49_1_4_reg;
    logic  [9:0] s_0_49_2_0, s_0_49_2_1;
    logic  [9:0] s_0_49_2_0_reg, s_0_49_2_1_reg;
    logic [11:0] sum_0_49;
    logic [11:0] sum_0_49_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_1)) 
    rom_0_49_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_49_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_2)) 
    rom_0_49_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_49_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_4)) 
    rom_0_49_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_49_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_6)) 
    rom_0_49_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_49_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_12)) 
    rom_0_49_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_49_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_15)) 
    rom_0_49_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_49_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_17)) 
    rom_0_49_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_49_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_18)) 
    rom_0_49_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_49_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_21)) 
    rom_0_49_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_49_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_22)) 
    rom_0_49_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_49_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_24)) 
    rom_0_49_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_49_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_25)) 
    rom_0_49_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_49_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_26)) 
    rom_0_49_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_49_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_31)) 
    rom_0_49_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_49_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_32)) 
    rom_0_49_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_49_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_35)) 
    rom_0_49_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_49_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_36)) 
    rom_0_49_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_49_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_39)) 
    rom_0_49_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_49_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_49_40)) 
    rom_0_49_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_49_40));

  // Stage 1
    assign s_0_49_1_0 = {{2{acts_0_49_1[5]}}, acts_0_49_1} + {{2{acts_0_49_2[5]}}, acts_0_49_2} + {{2{acts_0_49_4[5]}}, acts_0_49_4} + {{2{acts_0_49_6[5]}}, acts_0_49_6};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_0), .q(s_0_49_1_0_reg));

    assign s_0_49_1_1 = {{2{acts_0_49_12[5]}}, acts_0_49_12} + {{2{acts_0_49_15[5]}}, acts_0_49_15} + {{2{acts_0_49_17[5]}}, acts_0_49_17} + {{2{acts_0_49_18[5]}}, acts_0_49_18};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_1), .q(s_0_49_1_1_reg));

    assign s_0_49_1_2 = {{2{acts_0_49_21[5]}}, acts_0_49_21} + {{2{acts_0_49_22[5]}}, acts_0_49_22} + {{2{acts_0_49_24[5]}}, acts_0_49_24} + {{2{acts_0_49_25[5]}}, acts_0_49_25};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_2), .q(s_0_49_1_2_reg));

    assign s_0_49_1_3 = {{2{acts_0_49_26[5]}}, acts_0_49_26} + {{2{acts_0_49_31[5]}}, acts_0_49_31} + {{2{acts_0_49_32[5]}}, acts_0_49_32} + {{2{acts_0_49_35[5]}}, acts_0_49_35};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_3), .q(s_0_49_1_3_reg));

    assign s_0_49_1_4 = {{2{acts_0_49_36[5]}}, acts_0_49_36} + {{2{acts_0_49_39[5]}}, acts_0_49_39} + {{2{acts_0_49_40[5]}}, acts_0_49_40};
    registers #(.ARRAY_WIDTH(8)) r_0_49_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_1_4), .q(s_0_49_1_4_reg));

  // Stage 2
    assign s_0_49_2_0 = {{2{s_0_49_1_0_reg[7]}}, s_0_49_1_0_reg} + {{2{s_0_49_1_1_reg[7]}}, s_0_49_1_1_reg} + {{2{s_0_49_1_2_reg[7]}}, s_0_49_1_2_reg} + {{2{s_0_49_1_3_reg[7]}}, s_0_49_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_49_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_2_0), .q(s_0_49_2_0_reg));

    assign s_0_49_2_1 = {{2{s_0_49_1_4_reg[7]}}, s_0_49_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_49_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_49_2_1), .q(s_0_49_2_1_reg));

  // Stage 3
    assign sum_0_49 = {{2{s_0_49_2_0_reg[9]}}, s_0_49_2_0_reg} + {{2{s_0_49_2_1_reg[9]}}, s_0_49_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_49), .q(sum_0_49_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_49 (.i_data(sum_0_49_reg), .o_data(out_0_49_sat));


    // Layer 0, Node 50
      logic  [7:0] s_0_50_1_0, s_0_50_1_1, s_0_50_1_2, s_0_50_1_3, s_0_50_1_4, s_0_50_1_5, s_0_50_1_6;
    logic  [7:0] s_0_50_1_0_reg, s_0_50_1_1_reg, s_0_50_1_2_reg, s_0_50_1_3_reg, s_0_50_1_4_reg, s_0_50_1_5_reg, s_0_50_1_6_reg;
    logic  [9:0] s_0_50_2_0, s_0_50_2_1;
    logic  [9:0] s_0_50_2_0_reg, s_0_50_2_1_reg;
    logic [11:0] sum_0_50;
    logic [11:0] sum_0_50_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_1)) 
    rom_0_50_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_50_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_2)) 
    rom_0_50_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_50_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_3)) 
    rom_0_50_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_50_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_4)) 
    rom_0_50_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_50_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_6)) 
    rom_0_50_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_50_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_7)) 
    rom_0_50_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_50_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_9)) 
    rom_0_50_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_50_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_11)) 
    rom_0_50_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_50_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_12)) 
    rom_0_50_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_50_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_14)) 
    rom_0_50_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_50_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_15)) 
    rom_0_50_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_50_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_17)) 
    rom_0_50_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_50_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_18)) 
    rom_0_50_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_50_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_19)) 
    rom_0_50_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_50_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_21)) 
    rom_0_50_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_50_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_24)) 
    rom_0_50_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_50_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_27)) 
    rom_0_50_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_50_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_29)) 
    rom_0_50_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_50_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_31)) 
    rom_0_50_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_50_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_32)) 
    rom_0_50_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_50_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_34)) 
    rom_0_50_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_50_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_36)) 
    rom_0_50_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_50_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_37)) 
    rom_0_50_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_50_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_39)) 
    rom_0_50_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_50_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_50_41)) 
    rom_0_50_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[41]), .o_ld_data(acts_0_50_41));

  // Stage 1
    assign s_0_50_1_0 = {{2{acts_0_50_1[5]}}, acts_0_50_1} + {{2{acts_0_50_2[5]}}, acts_0_50_2} + {{2{acts_0_50_3[5]}}, acts_0_50_3} + {{2{acts_0_50_4[5]}}, acts_0_50_4};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_0), .q(s_0_50_1_0_reg));

    assign s_0_50_1_1 = {{2{acts_0_50_6[5]}}, acts_0_50_6} + {{2{acts_0_50_7[5]}}, acts_0_50_7} + {{2{acts_0_50_9[5]}}, acts_0_50_9} + {{2{acts_0_50_11[5]}}, acts_0_50_11};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_1), .q(s_0_50_1_1_reg));

    assign s_0_50_1_2 = {{2{acts_0_50_12[5]}}, acts_0_50_12} + {{2{acts_0_50_14[5]}}, acts_0_50_14} + {{2{acts_0_50_15[5]}}, acts_0_50_15} + {{2{acts_0_50_17[5]}}, acts_0_50_17};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_2), .q(s_0_50_1_2_reg));

    assign s_0_50_1_3 = {{2{acts_0_50_18[5]}}, acts_0_50_18} + {{2{acts_0_50_19[5]}}, acts_0_50_19} + {{2{acts_0_50_21[5]}}, acts_0_50_21} + {{2{acts_0_50_24[5]}}, acts_0_50_24};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_3), .q(s_0_50_1_3_reg));

    assign s_0_50_1_4 = {{2{acts_0_50_27[5]}}, acts_0_50_27} + {{2{acts_0_50_29[5]}}, acts_0_50_29} + {{2{acts_0_50_31[5]}}, acts_0_50_31} + {{2{acts_0_50_32[5]}}, acts_0_50_32};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_4), .q(s_0_50_1_4_reg));

    assign s_0_50_1_5 = {{2{acts_0_50_34[5]}}, acts_0_50_34} + {{2{acts_0_50_36[5]}}, acts_0_50_36} + {{2{acts_0_50_37[5]}}, acts_0_50_37} + {{2{acts_0_50_39[5]}}, acts_0_50_39};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_5), .q(s_0_50_1_5_reg));

    assign s_0_50_1_6 = {{2{acts_0_50_41[5]}}, acts_0_50_41};
    registers #(.ARRAY_WIDTH(8)) r_0_50_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_1_6), .q(s_0_50_1_6_reg));

  // Stage 2
    assign s_0_50_2_0 = {{2{s_0_50_1_0_reg[7]}}, s_0_50_1_0_reg} + {{2{s_0_50_1_1_reg[7]}}, s_0_50_1_1_reg} + {{2{s_0_50_1_2_reg[7]}}, s_0_50_1_2_reg} + {{2{s_0_50_1_3_reg[7]}}, s_0_50_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_50_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_2_0), .q(s_0_50_2_0_reg));

    assign s_0_50_2_1 = {{2{s_0_50_1_4_reg[7]}}, s_0_50_1_4_reg} + {{2{s_0_50_1_5_reg[7]}}, s_0_50_1_5_reg} + {{2{s_0_50_1_6_reg[7]}}, s_0_50_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_50_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_50_2_1), .q(s_0_50_2_1_reg));

  // Stage 3
    assign sum_0_50 = {{2{s_0_50_2_0_reg[9]}}, s_0_50_2_0_reg} + {{2{s_0_50_2_1_reg[9]}}, s_0_50_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_50), .q(sum_0_50_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_50 (.i_data(sum_0_50_reg), .o_data(out_0_50_sat));


    // Layer 0, Node 51
      logic  [7:0] s_0_51_1_0, s_0_51_1_1, s_0_51_1_2, s_0_51_1_3, s_0_51_1_4;
    logic  [7:0] s_0_51_1_0_reg, s_0_51_1_1_reg, s_0_51_1_2_reg, s_0_51_1_3_reg, s_0_51_1_4_reg;
    logic  [9:0] s_0_51_2_0, s_0_51_2_1;
    logic  [9:0] s_0_51_2_0_reg, s_0_51_2_1_reg;
    logic [11:0] sum_0_51;
    logic [11:0] sum_0_51_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_2)) 
    rom_0_51_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_51_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_3)) 
    rom_0_51_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_51_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_4)) 
    rom_0_51_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_51_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_5)) 
    rom_0_51_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_51_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_7)) 
    rom_0_51_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_51_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_9)) 
    rom_0_51_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_51_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_14)) 
    rom_0_51_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_51_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_16)) 
    rom_0_51_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_51_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_21)) 
    rom_0_51_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_51_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_25)) 
    rom_0_51_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_51_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_26)) 
    rom_0_51_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_51_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_27)) 
    rom_0_51_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_51_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_29)) 
    rom_0_51_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_51_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_31)) 
    rom_0_51_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_51_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_33)) 
    rom_0_51_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_51_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_34)) 
    rom_0_51_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_51_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_36)) 
    rom_0_51_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_51_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_51_38)) 
    rom_0_51_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_51_38));

  // Stage 1
    assign s_0_51_1_0 = {{2{acts_0_51_2[5]}}, acts_0_51_2} + {{2{acts_0_51_3[5]}}, acts_0_51_3} + {{2{acts_0_51_4[5]}}, acts_0_51_4} + {{2{acts_0_51_5[5]}}, acts_0_51_5};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_0), .q(s_0_51_1_0_reg));

    assign s_0_51_1_1 = {{2{acts_0_51_7[5]}}, acts_0_51_7} + {{2{acts_0_51_9[5]}}, acts_0_51_9} + {{2{acts_0_51_14[5]}}, acts_0_51_14} + {{2{acts_0_51_16[5]}}, acts_0_51_16};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_1), .q(s_0_51_1_1_reg));

    assign s_0_51_1_2 = {{2{acts_0_51_21[5]}}, acts_0_51_21} + {{2{acts_0_51_25[5]}}, acts_0_51_25} + {{2{acts_0_51_26[5]}}, acts_0_51_26} + {{2{acts_0_51_27[5]}}, acts_0_51_27};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_2), .q(s_0_51_1_2_reg));

    assign s_0_51_1_3 = {{2{acts_0_51_29[5]}}, acts_0_51_29} + {{2{acts_0_51_31[5]}}, acts_0_51_31} + {{2{acts_0_51_33[5]}}, acts_0_51_33} + {{2{acts_0_51_34[5]}}, acts_0_51_34};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_3), .q(s_0_51_1_3_reg));

    assign s_0_51_1_4 = {{2{acts_0_51_36[5]}}, acts_0_51_36} + {{2{acts_0_51_38[5]}}, acts_0_51_38};
    registers #(.ARRAY_WIDTH(8)) r_0_51_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_1_4), .q(s_0_51_1_4_reg));

  // Stage 2
    assign s_0_51_2_0 = {{2{s_0_51_1_0_reg[7]}}, s_0_51_1_0_reg} + {{2{s_0_51_1_1_reg[7]}}, s_0_51_1_1_reg} + {{2{s_0_51_1_2_reg[7]}}, s_0_51_1_2_reg} + {{2{s_0_51_1_3_reg[7]}}, s_0_51_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_51_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_2_0), .q(s_0_51_2_0_reg));

    assign s_0_51_2_1 = {{2{s_0_51_1_4_reg[7]}}, s_0_51_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_51_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_51_2_1), .q(s_0_51_2_1_reg));

  // Stage 3
    assign sum_0_51 = {{2{s_0_51_2_0_reg[9]}}, s_0_51_2_0_reg} + {{2{s_0_51_2_1_reg[9]}}, s_0_51_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_51), .q(sum_0_51_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_51 (.i_data(sum_0_51_reg), .o_data(out_0_51_sat));


    // Layer 0, Node 52
      logic  [7:0] s_0_52_1_0, s_0_52_1_1, s_0_52_1_2, s_0_52_1_3, s_0_52_1_4, s_0_52_1_5;
    logic  [7:0] s_0_52_1_0_reg, s_0_52_1_1_reg, s_0_52_1_2_reg, s_0_52_1_3_reg, s_0_52_1_4_reg, s_0_52_1_5_reg;
    logic  [9:0] s_0_52_2_0, s_0_52_2_1;
    logic  [9:0] s_0_52_2_0_reg, s_0_52_2_1_reg;
    logic [11:0] sum_0_52;
    logic [11:0] sum_0_52_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_1)) 
    rom_0_52_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_52_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_2)) 
    rom_0_52_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_52_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_3)) 
    rom_0_52_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_52_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_4)) 
    rom_0_52_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_52_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_5)) 
    rom_0_52_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_52_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_6)) 
    rom_0_52_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_52_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_8)) 
    rom_0_52_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_52_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_13)) 
    rom_0_52_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_52_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_15)) 
    rom_0_52_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_52_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_16)) 
    rom_0_52_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_52_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_18)) 
    rom_0_52_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_52_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_21)) 
    rom_0_52_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_52_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_24)) 
    rom_0_52_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_52_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_25)) 
    rom_0_52_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_52_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_29)) 
    rom_0_52_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_52_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_33)) 
    rom_0_52_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_52_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_34)) 
    rom_0_52_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_52_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_35)) 
    rom_0_52_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_52_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_36)) 
    rom_0_52_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_52_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_37)) 
    rom_0_52_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_52_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_52_40)) 
    rom_0_52_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_52_40));

  // Stage 1
    assign s_0_52_1_0 = {{2{acts_0_52_1[5]}}, acts_0_52_1} + {{2{acts_0_52_2[5]}}, acts_0_52_2} + {{2{acts_0_52_3[5]}}, acts_0_52_3} + {{2{acts_0_52_4[5]}}, acts_0_52_4};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_0), .q(s_0_52_1_0_reg));

    assign s_0_52_1_1 = {{2{acts_0_52_5[5]}}, acts_0_52_5} + {{2{acts_0_52_6[5]}}, acts_0_52_6} + {{2{acts_0_52_8[5]}}, acts_0_52_8} + {{2{acts_0_52_13[5]}}, acts_0_52_13};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_1), .q(s_0_52_1_1_reg));

    assign s_0_52_1_2 = {{2{acts_0_52_15[5]}}, acts_0_52_15} + {{2{acts_0_52_16[5]}}, acts_0_52_16} + {{2{acts_0_52_18[5]}}, acts_0_52_18} + {{2{acts_0_52_21[5]}}, acts_0_52_21};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_2), .q(s_0_52_1_2_reg));

    assign s_0_52_1_3 = {{2{acts_0_52_24[5]}}, acts_0_52_24} + {{2{acts_0_52_25[5]}}, acts_0_52_25} + {{2{acts_0_52_29[5]}}, acts_0_52_29} + {{2{acts_0_52_33[5]}}, acts_0_52_33};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_3), .q(s_0_52_1_3_reg));

    assign s_0_52_1_4 = {{2{acts_0_52_34[5]}}, acts_0_52_34} + {{2{acts_0_52_35[5]}}, acts_0_52_35} + {{2{acts_0_52_36[5]}}, acts_0_52_36} + {{2{acts_0_52_37[5]}}, acts_0_52_37};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_4), .q(s_0_52_1_4_reg));

    assign s_0_52_1_5 = {{2{acts_0_52_40[5]}}, acts_0_52_40};
    registers #(.ARRAY_WIDTH(8)) r_0_52_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_1_5), .q(s_0_52_1_5_reg));

  // Stage 2
    assign s_0_52_2_0 = {{2{s_0_52_1_0_reg[7]}}, s_0_52_1_0_reg} + {{2{s_0_52_1_1_reg[7]}}, s_0_52_1_1_reg} + {{2{s_0_52_1_2_reg[7]}}, s_0_52_1_2_reg} + {{2{s_0_52_1_3_reg[7]}}, s_0_52_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_52_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_2_0), .q(s_0_52_2_0_reg));

    assign s_0_52_2_1 = {{2{s_0_52_1_4_reg[7]}}, s_0_52_1_4_reg} + {{2{s_0_52_1_5_reg[7]}}, s_0_52_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_52_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_52_2_1), .q(s_0_52_2_1_reg));

  // Stage 3
    assign sum_0_52 = {{2{s_0_52_2_0_reg[9]}}, s_0_52_2_0_reg} + {{2{s_0_52_2_1_reg[9]}}, s_0_52_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_52), .q(sum_0_52_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_52 (.i_data(sum_0_52_reg), .o_data(out_0_52_sat));


    // Layer 0, Node 53
      logic  [7:0] s_0_53_1_0, s_0_53_1_1, s_0_53_1_2, s_0_53_1_3, s_0_53_1_4;
    logic  [7:0] s_0_53_1_0_reg, s_0_53_1_1_reg, s_0_53_1_2_reg, s_0_53_1_3_reg, s_0_53_1_4_reg;
    logic  [9:0] s_0_53_2_0, s_0_53_2_1;
    logic  [9:0] s_0_53_2_0_reg, s_0_53_2_1_reg;
    logic [11:0] sum_0_53;
    logic [11:0] sum_0_53_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_0)) 
    rom_0_53_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_53_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_2)) 
    rom_0_53_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_53_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_3)) 
    rom_0_53_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_53_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_7)) 
    rom_0_53_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_53_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_8)) 
    rom_0_53_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_53_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_12)) 
    rom_0_53_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_53_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_13)) 
    rom_0_53_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_53_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_14)) 
    rom_0_53_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_53_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_17)) 
    rom_0_53_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_53_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_19)) 
    rom_0_53_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_53_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_21)) 
    rom_0_53_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_53_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_22)) 
    rom_0_53_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[22]), .o_ld_data(acts_0_53_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_25)) 
    rom_0_53_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_53_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_33)) 
    rom_0_53_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_53_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_37)) 
    rom_0_53_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_53_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_39)) 
    rom_0_53_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_53_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_53_40)) 
    rom_0_53_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_53_40));

  // Stage 1
    assign s_0_53_1_0 = {{2{acts_0_53_0[5]}}, acts_0_53_0} + {{2{acts_0_53_2[5]}}, acts_0_53_2} + {{2{acts_0_53_3[5]}}, acts_0_53_3} + {{2{acts_0_53_7[5]}}, acts_0_53_7};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_0), .q(s_0_53_1_0_reg));

    assign s_0_53_1_1 = {{2{acts_0_53_8[5]}}, acts_0_53_8} + {{2{acts_0_53_12[5]}}, acts_0_53_12} + {{2{acts_0_53_13[5]}}, acts_0_53_13} + {{2{acts_0_53_14[5]}}, acts_0_53_14};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_1), .q(s_0_53_1_1_reg));

    assign s_0_53_1_2 = {{2{acts_0_53_17[5]}}, acts_0_53_17} + {{2{acts_0_53_19[5]}}, acts_0_53_19} + {{2{acts_0_53_21[5]}}, acts_0_53_21} + {{2{acts_0_53_22[5]}}, acts_0_53_22};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_2), .q(s_0_53_1_2_reg));

    assign s_0_53_1_3 = {{2{acts_0_53_25[5]}}, acts_0_53_25} + {{2{acts_0_53_33[5]}}, acts_0_53_33} + {{2{acts_0_53_37[5]}}, acts_0_53_37} + {{2{acts_0_53_39[5]}}, acts_0_53_39};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_3), .q(s_0_53_1_3_reg));

    assign s_0_53_1_4 = {{2{acts_0_53_40[5]}}, acts_0_53_40};
    registers #(.ARRAY_WIDTH(8)) r_0_53_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_1_4), .q(s_0_53_1_4_reg));

  // Stage 2
    assign s_0_53_2_0 = {{2{s_0_53_1_0_reg[7]}}, s_0_53_1_0_reg} + {{2{s_0_53_1_1_reg[7]}}, s_0_53_1_1_reg} + {{2{s_0_53_1_2_reg[7]}}, s_0_53_1_2_reg} + {{2{s_0_53_1_3_reg[7]}}, s_0_53_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_53_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_2_0), .q(s_0_53_2_0_reg));

    assign s_0_53_2_1 = {{2{s_0_53_1_4_reg[7]}}, s_0_53_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_53_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_53_2_1), .q(s_0_53_2_1_reg));

  // Stage 3
    assign sum_0_53 = {{2{s_0_53_2_0_reg[9]}}, s_0_53_2_0_reg} + {{2{s_0_53_2_1_reg[9]}}, s_0_53_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_53), .q(sum_0_53_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_53 (.i_data(sum_0_53_reg), .o_data(out_0_53_sat));


    // Layer 0, Node 54
      logic  [7:0] s_0_54_1_0, s_0_54_1_1, s_0_54_1_2, s_0_54_1_3, s_0_54_1_4;
    logic  [7:0] s_0_54_1_0_reg, s_0_54_1_1_reg, s_0_54_1_2_reg, s_0_54_1_3_reg, s_0_54_1_4_reg;
    logic  [9:0] s_0_54_2_0, s_0_54_2_1;
    logic  [9:0] s_0_54_2_0_reg, s_0_54_2_1_reg;
    logic [11:0] sum_0_54;
    logic [11:0] sum_0_54_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_1)) 
    rom_0_54_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_54_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_2)) 
    rom_0_54_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_54_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_3)) 
    rom_0_54_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_54_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_4)) 
    rom_0_54_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_54_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_6)) 
    rom_0_54_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_54_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_7)) 
    rom_0_54_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_54_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_9)) 
    rom_0_54_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_54_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_11)) 
    rom_0_54_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_54_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_13)) 
    rom_0_54_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_54_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_16)) 
    rom_0_54_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_54_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_17)) 
    rom_0_54_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_54_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_18)) 
    rom_0_54_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_54_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_19)) 
    rom_0_54_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_54_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_21)) 
    rom_0_54_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_54_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_34)) 
    rom_0_54_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_54_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_36)) 
    rom_0_54_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_54_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_54_40)) 
    rom_0_54_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_54_40));

  // Stage 1
    assign s_0_54_1_0 = {{2{acts_0_54_1[5]}}, acts_0_54_1} + {{2{acts_0_54_2[5]}}, acts_0_54_2} + {{2{acts_0_54_3[5]}}, acts_0_54_3} + {{2{acts_0_54_4[5]}}, acts_0_54_4};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_0), .q(s_0_54_1_0_reg));

    assign s_0_54_1_1 = {{2{acts_0_54_6[5]}}, acts_0_54_6} + {{2{acts_0_54_7[5]}}, acts_0_54_7} + {{2{acts_0_54_9[5]}}, acts_0_54_9} + {{2{acts_0_54_11[5]}}, acts_0_54_11};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_1), .q(s_0_54_1_1_reg));

    assign s_0_54_1_2 = {{2{acts_0_54_13[5]}}, acts_0_54_13} + {{2{acts_0_54_16[5]}}, acts_0_54_16} + {{2{acts_0_54_17[5]}}, acts_0_54_17} + {{2{acts_0_54_18[5]}}, acts_0_54_18};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_2), .q(s_0_54_1_2_reg));

    assign s_0_54_1_3 = {{2{acts_0_54_19[5]}}, acts_0_54_19} + {{2{acts_0_54_21[5]}}, acts_0_54_21} + {{2{acts_0_54_34[5]}}, acts_0_54_34} + {{2{acts_0_54_36[5]}}, acts_0_54_36};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_3), .q(s_0_54_1_3_reg));

    assign s_0_54_1_4 = {{2{acts_0_54_40[5]}}, acts_0_54_40};
    registers #(.ARRAY_WIDTH(8)) r_0_54_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_1_4), .q(s_0_54_1_4_reg));

  // Stage 2
    assign s_0_54_2_0 = {{2{s_0_54_1_0_reg[7]}}, s_0_54_1_0_reg} + {{2{s_0_54_1_1_reg[7]}}, s_0_54_1_1_reg} + {{2{s_0_54_1_2_reg[7]}}, s_0_54_1_2_reg} + {{2{s_0_54_1_3_reg[7]}}, s_0_54_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_54_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_2_0), .q(s_0_54_2_0_reg));

    assign s_0_54_2_1 = {{2{s_0_54_1_4_reg[7]}}, s_0_54_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_54_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_54_2_1), .q(s_0_54_2_1_reg));

  // Stage 3
    assign sum_0_54 = {{2{s_0_54_2_0_reg[9]}}, s_0_54_2_0_reg} + {{2{s_0_54_2_1_reg[9]}}, s_0_54_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_54), .q(sum_0_54_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_54 (.i_data(sum_0_54_reg), .o_data(out_0_54_sat));


    // Layer 0, Node 55
      logic  [7:0] s_0_55_1_0, s_0_55_1_1, s_0_55_1_2, s_0_55_1_3, s_0_55_1_4, s_0_55_1_5;
    logic  [7:0] s_0_55_1_0_reg, s_0_55_1_1_reg, s_0_55_1_2_reg, s_0_55_1_3_reg, s_0_55_1_4_reg, s_0_55_1_5_reg;
    logic  [9:0] s_0_55_2_0, s_0_55_2_1;
    logic  [9:0] s_0_55_2_0_reg, s_0_55_2_1_reg;
    logic [11:0] sum_0_55;
    logic [11:0] sum_0_55_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_0)) 
    rom_0_55_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_55_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_1)) 
    rom_0_55_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_55_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_4)) 
    rom_0_55_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_55_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_7)) 
    rom_0_55_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_55_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_9)) 
    rom_0_55_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_55_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_12)) 
    rom_0_55_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_55_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_13)) 
    rom_0_55_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_55_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_14)) 
    rom_0_55_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_55_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_15)) 
    rom_0_55_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_55_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_17)) 
    rom_0_55_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_55_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_18)) 
    rom_0_55_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_55_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_19)) 
    rom_0_55_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_55_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_21)) 
    rom_0_55_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_55_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_24)) 
    rom_0_55_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_55_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_25)) 
    rom_0_55_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_55_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_26)) 
    rom_0_55_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_55_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_29)) 
    rom_0_55_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_55_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_31)) 
    rom_0_55_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_55_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_32)) 
    rom_0_55_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_55_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_37)) 
    rom_0_55_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_55_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_38)) 
    rom_0_55_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_55_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_55_40)) 
    rom_0_55_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_55_40));

  // Stage 1
    assign s_0_55_1_0 = {{2{acts_0_55_0[5]}}, acts_0_55_0} + {{2{acts_0_55_1[5]}}, acts_0_55_1} + {{2{acts_0_55_4[5]}}, acts_0_55_4} + {{2{acts_0_55_7[5]}}, acts_0_55_7};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_0), .q(s_0_55_1_0_reg));

    assign s_0_55_1_1 = {{2{acts_0_55_9[5]}}, acts_0_55_9} + {{2{acts_0_55_12[5]}}, acts_0_55_12} + {{2{acts_0_55_13[5]}}, acts_0_55_13} + {{2{acts_0_55_14[5]}}, acts_0_55_14};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_1), .q(s_0_55_1_1_reg));

    assign s_0_55_1_2 = {{2{acts_0_55_15[5]}}, acts_0_55_15} + {{2{acts_0_55_17[5]}}, acts_0_55_17} + {{2{acts_0_55_18[5]}}, acts_0_55_18} + {{2{acts_0_55_19[5]}}, acts_0_55_19};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_2), .q(s_0_55_1_2_reg));

    assign s_0_55_1_3 = {{2{acts_0_55_21[5]}}, acts_0_55_21} + {{2{acts_0_55_24[5]}}, acts_0_55_24} + {{2{acts_0_55_25[5]}}, acts_0_55_25} + {{2{acts_0_55_26[5]}}, acts_0_55_26};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_3), .q(s_0_55_1_3_reg));

    assign s_0_55_1_4 = {{2{acts_0_55_29[5]}}, acts_0_55_29} + {{2{acts_0_55_31[5]}}, acts_0_55_31} + {{2{acts_0_55_32[5]}}, acts_0_55_32} + {{2{acts_0_55_37[5]}}, acts_0_55_37};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_4), .q(s_0_55_1_4_reg));

    assign s_0_55_1_5 = {{2{acts_0_55_38[5]}}, acts_0_55_38} + {{2{acts_0_55_40[5]}}, acts_0_55_40};
    registers #(.ARRAY_WIDTH(8)) r_0_55_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_1_5), .q(s_0_55_1_5_reg));

  // Stage 2
    assign s_0_55_2_0 = {{2{s_0_55_1_0_reg[7]}}, s_0_55_1_0_reg} + {{2{s_0_55_1_1_reg[7]}}, s_0_55_1_1_reg} + {{2{s_0_55_1_2_reg[7]}}, s_0_55_1_2_reg} + {{2{s_0_55_1_3_reg[7]}}, s_0_55_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_55_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_2_0), .q(s_0_55_2_0_reg));

    assign s_0_55_2_1 = {{2{s_0_55_1_4_reg[7]}}, s_0_55_1_4_reg} + {{2{s_0_55_1_5_reg[7]}}, s_0_55_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_55_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_55_2_1), .q(s_0_55_2_1_reg));

  // Stage 3
    assign sum_0_55 = {{2{s_0_55_2_0_reg[9]}}, s_0_55_2_0_reg} + {{2{s_0_55_2_1_reg[9]}}, s_0_55_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_55), .q(sum_0_55_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_55 (.i_data(sum_0_55_reg), .o_data(out_0_55_sat));


    // Layer 0, Node 56
      logic  [7:0] s_0_56_1_0, s_0_56_1_1, s_0_56_1_2, s_0_56_1_3, s_0_56_1_4, s_0_56_1_5;
    logic  [7:0] s_0_56_1_0_reg, s_0_56_1_1_reg, s_0_56_1_2_reg, s_0_56_1_3_reg, s_0_56_1_4_reg, s_0_56_1_5_reg;
    logic  [9:0] s_0_56_2_0, s_0_56_2_1;
    logic  [9:0] s_0_56_2_0_reg, s_0_56_2_1_reg;
    logic [11:0] sum_0_56;
    logic [11:0] sum_0_56_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_1)) 
    rom_0_56_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_56_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_2)) 
    rom_0_56_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_56_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_3)) 
    rom_0_56_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_56_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_4)) 
    rom_0_56_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_56_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_5)) 
    rom_0_56_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_56_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_6)) 
    rom_0_56_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_56_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_9)) 
    rom_0_56_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_56_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_11)) 
    rom_0_56_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_56_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_16)) 
    rom_0_56_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_56_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_17)) 
    rom_0_56_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_56_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_25)) 
    rom_0_56_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_56_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_27)) 
    rom_0_56_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_56_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_28)) 
    rom_0_56_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_56_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_29)) 
    rom_0_56_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_56_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_30)) 
    rom_0_56_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_56_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_34)) 
    rom_0_56_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_56_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_35)) 
    rom_0_56_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_56_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_36)) 
    rom_0_56_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_56_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_37)) 
    rom_0_56_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_56_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_38)) 
    rom_0_56_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_56_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_39)) 
    rom_0_56_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_56_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_56_40)) 
    rom_0_56_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_56_40));

  // Stage 1
    assign s_0_56_1_0 = {{2{acts_0_56_1[5]}}, acts_0_56_1} + {{2{acts_0_56_2[5]}}, acts_0_56_2} + {{2{acts_0_56_3[5]}}, acts_0_56_3} + {{2{acts_0_56_4[5]}}, acts_0_56_4};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_0), .q(s_0_56_1_0_reg));

    assign s_0_56_1_1 = {{2{acts_0_56_5[5]}}, acts_0_56_5} + {{2{acts_0_56_6[5]}}, acts_0_56_6} + {{2{acts_0_56_9[5]}}, acts_0_56_9} + {{2{acts_0_56_11[5]}}, acts_0_56_11};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_1), .q(s_0_56_1_1_reg));

    assign s_0_56_1_2 = {{2{acts_0_56_16[5]}}, acts_0_56_16} + {{2{acts_0_56_17[5]}}, acts_0_56_17} + {{2{acts_0_56_25[5]}}, acts_0_56_25} + {{2{acts_0_56_27[5]}}, acts_0_56_27};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_2), .q(s_0_56_1_2_reg));

    assign s_0_56_1_3 = {{2{acts_0_56_28[5]}}, acts_0_56_28} + {{2{acts_0_56_29[5]}}, acts_0_56_29} + {{2{acts_0_56_30[5]}}, acts_0_56_30} + {{2{acts_0_56_34[5]}}, acts_0_56_34};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_3), .q(s_0_56_1_3_reg));

    assign s_0_56_1_4 = {{2{acts_0_56_35[5]}}, acts_0_56_35} + {{2{acts_0_56_36[5]}}, acts_0_56_36} + {{2{acts_0_56_37[5]}}, acts_0_56_37} + {{2{acts_0_56_38[5]}}, acts_0_56_38};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_4), .q(s_0_56_1_4_reg));

    assign s_0_56_1_5 = {{2{acts_0_56_39[5]}}, acts_0_56_39} + {{2{acts_0_56_40[5]}}, acts_0_56_40};
    registers #(.ARRAY_WIDTH(8)) r_0_56_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_1_5), .q(s_0_56_1_5_reg));

  // Stage 2
    assign s_0_56_2_0 = {{2{s_0_56_1_0_reg[7]}}, s_0_56_1_0_reg} + {{2{s_0_56_1_1_reg[7]}}, s_0_56_1_1_reg} + {{2{s_0_56_1_2_reg[7]}}, s_0_56_1_2_reg} + {{2{s_0_56_1_3_reg[7]}}, s_0_56_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_56_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_2_0), .q(s_0_56_2_0_reg));

    assign s_0_56_2_1 = {{2{s_0_56_1_4_reg[7]}}, s_0_56_1_4_reg} + {{2{s_0_56_1_5_reg[7]}}, s_0_56_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_56_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_56_2_1), .q(s_0_56_2_1_reg));

  // Stage 3
    assign sum_0_56 = {{2{s_0_56_2_0_reg[9]}}, s_0_56_2_0_reg} + {{2{s_0_56_2_1_reg[9]}}, s_0_56_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_56), .q(sum_0_56_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_56 (.i_data(sum_0_56_reg), .o_data(out_0_56_sat));


    // Layer 0, Node 57
      logic  [7:0] s_0_57_1_0, s_0_57_1_1, s_0_57_1_2, s_0_57_1_3, s_0_57_1_4, s_0_57_1_5;
    logic  [7:0] s_0_57_1_0_reg, s_0_57_1_1_reg, s_0_57_1_2_reg, s_0_57_1_3_reg, s_0_57_1_4_reg, s_0_57_1_5_reg;
    logic  [9:0] s_0_57_2_0, s_0_57_2_1;
    logic  [9:0] s_0_57_2_0_reg, s_0_57_2_1_reg;
    logic [11:0] sum_0_57;
    logic [11:0] sum_0_57_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_0)) 
    rom_0_57_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_57_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_4)) 
    rom_0_57_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_57_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_6)) 
    rom_0_57_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_57_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_11)) 
    rom_0_57_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_57_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_12)) 
    rom_0_57_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_57_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_13)) 
    rom_0_57_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_57_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_15)) 
    rom_0_57_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_57_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_17)) 
    rom_0_57_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_57_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_21)) 
    rom_0_57_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_57_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_24)) 
    rom_0_57_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_57_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_26)) 
    rom_0_57_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_57_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_27)) 
    rom_0_57_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_57_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_28)) 
    rom_0_57_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_57_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_29)) 
    rom_0_57_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_57_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_30)) 
    rom_0_57_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_57_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_31)) 
    rom_0_57_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_57_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_32)) 
    rom_0_57_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_57_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_33)) 
    rom_0_57_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_57_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_35)) 
    rom_0_57_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_57_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_36)) 
    rom_0_57_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_57_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_57_39)) 
    rom_0_57_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_57_39));

  // Stage 1
    assign s_0_57_1_0 = {{2{acts_0_57_0[5]}}, acts_0_57_0} + {{2{acts_0_57_4[5]}}, acts_0_57_4} + {{2{acts_0_57_6[5]}}, acts_0_57_6} + {{2{acts_0_57_11[5]}}, acts_0_57_11};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_0), .q(s_0_57_1_0_reg));

    assign s_0_57_1_1 = {{2{acts_0_57_12[5]}}, acts_0_57_12} + {{2{acts_0_57_13[5]}}, acts_0_57_13} + {{2{acts_0_57_15[5]}}, acts_0_57_15} + {{2{acts_0_57_17[5]}}, acts_0_57_17};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_1), .q(s_0_57_1_1_reg));

    assign s_0_57_1_2 = {{2{acts_0_57_21[5]}}, acts_0_57_21} + {{2{acts_0_57_24[5]}}, acts_0_57_24} + {{2{acts_0_57_26[5]}}, acts_0_57_26} + {{2{acts_0_57_27[5]}}, acts_0_57_27};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_2), .q(s_0_57_1_2_reg));

    assign s_0_57_1_3 = {{2{acts_0_57_28[5]}}, acts_0_57_28} + {{2{acts_0_57_29[5]}}, acts_0_57_29} + {{2{acts_0_57_30[5]}}, acts_0_57_30} + {{2{acts_0_57_31[5]}}, acts_0_57_31};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_3), .q(s_0_57_1_3_reg));

    assign s_0_57_1_4 = {{2{acts_0_57_32[5]}}, acts_0_57_32} + {{2{acts_0_57_33[5]}}, acts_0_57_33} + {{2{acts_0_57_35[5]}}, acts_0_57_35} + {{2{acts_0_57_36[5]}}, acts_0_57_36};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_4), .q(s_0_57_1_4_reg));

    assign s_0_57_1_5 = {{2{acts_0_57_39[5]}}, acts_0_57_39};
    registers #(.ARRAY_WIDTH(8)) r_0_57_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_1_5), .q(s_0_57_1_5_reg));

  // Stage 2
    assign s_0_57_2_0 = {{2{s_0_57_1_0_reg[7]}}, s_0_57_1_0_reg} + {{2{s_0_57_1_1_reg[7]}}, s_0_57_1_1_reg} + {{2{s_0_57_1_2_reg[7]}}, s_0_57_1_2_reg} + {{2{s_0_57_1_3_reg[7]}}, s_0_57_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_57_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_2_0), .q(s_0_57_2_0_reg));

    assign s_0_57_2_1 = {{2{s_0_57_1_4_reg[7]}}, s_0_57_1_4_reg} + {{2{s_0_57_1_5_reg[7]}}, s_0_57_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_57_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_57_2_1), .q(s_0_57_2_1_reg));

  // Stage 3
    assign sum_0_57 = {{2{s_0_57_2_0_reg[9]}}, s_0_57_2_0_reg} + {{2{s_0_57_2_1_reg[9]}}, s_0_57_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_57), .q(sum_0_57_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_57 (.i_data(sum_0_57_reg), .o_data(out_0_57_sat));


    // Layer 0, Node 58
      logic  [7:0] s_0_58_1_0, s_0_58_1_1, s_0_58_1_2, s_0_58_1_3, s_0_58_1_4, s_0_58_1_5;
    logic  [7:0] s_0_58_1_0_reg, s_0_58_1_1_reg, s_0_58_1_2_reg, s_0_58_1_3_reg, s_0_58_1_4_reg, s_0_58_1_5_reg;
    logic  [9:0] s_0_58_2_0, s_0_58_2_1;
    logic  [9:0] s_0_58_2_0_reg, s_0_58_2_1_reg;
    logic [11:0] sum_0_58;
    logic [11:0] sum_0_58_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_0)) 
    rom_0_58_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_58_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_1)) 
    rom_0_58_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_58_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_2)) 
    rom_0_58_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_58_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_3)) 
    rom_0_58_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_58_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_4)) 
    rom_0_58_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_58_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_6)) 
    rom_0_58_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_58_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_7)) 
    rom_0_58_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_58_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_9)) 
    rom_0_58_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_58_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_12)) 
    rom_0_58_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_58_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_14)) 
    rom_0_58_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_58_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_16)) 
    rom_0_58_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_58_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_17)) 
    rom_0_58_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_58_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_18)) 
    rom_0_58_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_58_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_23)) 
    rom_0_58_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_58_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_24)) 
    rom_0_58_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_58_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_25)) 
    rom_0_58_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_58_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_26)) 
    rom_0_58_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_58_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_29)) 
    rom_0_58_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_58_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_31)) 
    rom_0_58_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_58_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_32)) 
    rom_0_58_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_58_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_33)) 
    rom_0_58_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_58_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_35)) 
    rom_0_58_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_58_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_37)) 
    rom_0_58_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_58_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_58_39)) 
    rom_0_58_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_58_39));

  // Stage 1
    assign s_0_58_1_0 = {{2{acts_0_58_0[5]}}, acts_0_58_0} + {{2{acts_0_58_1[5]}}, acts_0_58_1} + {{2{acts_0_58_2[5]}}, acts_0_58_2} + {{2{acts_0_58_3[5]}}, acts_0_58_3};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_0), .q(s_0_58_1_0_reg));

    assign s_0_58_1_1 = {{2{acts_0_58_4[5]}}, acts_0_58_4} + {{2{acts_0_58_6[5]}}, acts_0_58_6} + {{2{acts_0_58_7[5]}}, acts_0_58_7} + {{2{acts_0_58_9[5]}}, acts_0_58_9};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_1), .q(s_0_58_1_1_reg));

    assign s_0_58_1_2 = {{2{acts_0_58_12[5]}}, acts_0_58_12} + {{2{acts_0_58_14[5]}}, acts_0_58_14} + {{2{acts_0_58_16[5]}}, acts_0_58_16} + {{2{acts_0_58_17[5]}}, acts_0_58_17};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_2), .q(s_0_58_1_2_reg));

    assign s_0_58_1_3 = {{2{acts_0_58_18[5]}}, acts_0_58_18} + {{2{acts_0_58_23[5]}}, acts_0_58_23} + {{2{acts_0_58_24[5]}}, acts_0_58_24} + {{2{acts_0_58_25[5]}}, acts_0_58_25};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_3), .q(s_0_58_1_3_reg));

    assign s_0_58_1_4 = {{2{acts_0_58_26[5]}}, acts_0_58_26} + {{2{acts_0_58_29[5]}}, acts_0_58_29} + {{2{acts_0_58_31[5]}}, acts_0_58_31} + {{2{acts_0_58_32[5]}}, acts_0_58_32};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_4), .q(s_0_58_1_4_reg));

    assign s_0_58_1_5 = {{2{acts_0_58_33[5]}}, acts_0_58_33} + {{2{acts_0_58_35[5]}}, acts_0_58_35} + {{2{acts_0_58_37[5]}}, acts_0_58_37} + {{2{acts_0_58_39[5]}}, acts_0_58_39};
    registers #(.ARRAY_WIDTH(8)) r_0_58_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_1_5), .q(s_0_58_1_5_reg));

  // Stage 2
    assign s_0_58_2_0 = {{2{s_0_58_1_0_reg[7]}}, s_0_58_1_0_reg} + {{2{s_0_58_1_1_reg[7]}}, s_0_58_1_1_reg} + {{2{s_0_58_1_2_reg[7]}}, s_0_58_1_2_reg} + {{2{s_0_58_1_3_reg[7]}}, s_0_58_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_58_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_2_0), .q(s_0_58_2_0_reg));

    assign s_0_58_2_1 = {{2{s_0_58_1_4_reg[7]}}, s_0_58_1_4_reg} + {{2{s_0_58_1_5_reg[7]}}, s_0_58_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_58_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_58_2_1), .q(s_0_58_2_1_reg));

  // Stage 3
    assign sum_0_58 = {{2{s_0_58_2_0_reg[9]}}, s_0_58_2_0_reg} + {{2{s_0_58_2_1_reg[9]}}, s_0_58_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_58), .q(sum_0_58_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_58 (.i_data(sum_0_58_reg), .o_data(out_0_58_sat));


    // Layer 0, Node 59
      logic  [7:0] s_0_59_1_0, s_0_59_1_1, s_0_59_1_2, s_0_59_1_3, s_0_59_1_4;
    logic  [7:0] s_0_59_1_0_reg, s_0_59_1_1_reg, s_0_59_1_2_reg, s_0_59_1_3_reg, s_0_59_1_4_reg;
    logic  [9:0] s_0_59_2_0, s_0_59_2_1;
    logic  [9:0] s_0_59_2_0_reg, s_0_59_2_1_reg;
    logic [11:0] sum_0_59;
    logic [11:0] sum_0_59_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_0)) 
    rom_0_59_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_59_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_1)) 
    rom_0_59_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_59_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_3)) 
    rom_0_59_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_59_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_8)) 
    rom_0_59_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_59_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_12)) 
    rom_0_59_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_59_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_16)) 
    rom_0_59_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_59_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_17)) 
    rom_0_59_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_59_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_19)) 
    rom_0_59_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_59_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_20)) 
    rom_0_59_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_59_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_24)) 
    rom_0_59_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[24]), .o_ld_data(acts_0_59_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_26)) 
    rom_0_59_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_59_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_27)) 
    rom_0_59_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[27]), .o_ld_data(acts_0_59_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_31)) 
    rom_0_59_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_59_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_32)) 
    rom_0_59_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_59_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_33)) 
    rom_0_59_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_59_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_34)) 
    rom_0_59_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_59_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_59_36)) 
    rom_0_59_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_59_36));

  // Stage 1
    assign s_0_59_1_0 = {{2{acts_0_59_0[5]}}, acts_0_59_0} + {{2{acts_0_59_1[5]}}, acts_0_59_1} + {{2{acts_0_59_3[5]}}, acts_0_59_3} + {{2{acts_0_59_8[5]}}, acts_0_59_8};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_0), .q(s_0_59_1_0_reg));

    assign s_0_59_1_1 = {{2{acts_0_59_12[5]}}, acts_0_59_12} + {{2{acts_0_59_16[5]}}, acts_0_59_16} + {{2{acts_0_59_17[5]}}, acts_0_59_17} + {{2{acts_0_59_19[5]}}, acts_0_59_19};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_1), .q(s_0_59_1_1_reg));

    assign s_0_59_1_2 = {{2{acts_0_59_20[5]}}, acts_0_59_20} + {{2{acts_0_59_24[5]}}, acts_0_59_24} + {{2{acts_0_59_26[5]}}, acts_0_59_26} + {{2{acts_0_59_27[5]}}, acts_0_59_27};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_2), .q(s_0_59_1_2_reg));

    assign s_0_59_1_3 = {{2{acts_0_59_31[5]}}, acts_0_59_31} + {{2{acts_0_59_32[5]}}, acts_0_59_32} + {{2{acts_0_59_33[5]}}, acts_0_59_33} + {{2{acts_0_59_34[5]}}, acts_0_59_34};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_3), .q(s_0_59_1_3_reg));

    assign s_0_59_1_4 = {{2{acts_0_59_36[5]}}, acts_0_59_36};
    registers #(.ARRAY_WIDTH(8)) r_0_59_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_1_4), .q(s_0_59_1_4_reg));

  // Stage 2
    assign s_0_59_2_0 = {{2{s_0_59_1_0_reg[7]}}, s_0_59_1_0_reg} + {{2{s_0_59_1_1_reg[7]}}, s_0_59_1_1_reg} + {{2{s_0_59_1_2_reg[7]}}, s_0_59_1_2_reg} + {{2{s_0_59_1_3_reg[7]}}, s_0_59_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_59_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_2_0), .q(s_0_59_2_0_reg));

    assign s_0_59_2_1 = {{2{s_0_59_1_4_reg[7]}}, s_0_59_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_59_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_59_2_1), .q(s_0_59_2_1_reg));

  // Stage 3
    assign sum_0_59 = {{2{s_0_59_2_0_reg[9]}}, s_0_59_2_0_reg} + {{2{s_0_59_2_1_reg[9]}}, s_0_59_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_59), .q(sum_0_59_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_59 (.i_data(sum_0_59_reg), .o_data(out_0_59_sat));


    // Layer 0, Node 60
      logic  [7:0] s_0_60_1_0, s_0_60_1_1, s_0_60_1_2, s_0_60_1_3, s_0_60_1_4;
    logic  [7:0] s_0_60_1_0_reg, s_0_60_1_1_reg, s_0_60_1_2_reg, s_0_60_1_3_reg, s_0_60_1_4_reg;
    logic  [9:0] s_0_60_2_0, s_0_60_2_1;
    logic  [9:0] s_0_60_2_0_reg, s_0_60_2_1_reg;
    logic [11:0] sum_0_60;
    logic [11:0] sum_0_60_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_0)) 
    rom_0_60_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_60_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_3)) 
    rom_0_60_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_60_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_4)) 
    rom_0_60_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_60_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_12)) 
    rom_0_60_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_60_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_13)) 
    rom_0_60_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_60_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_16)) 
    rom_0_60_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_60_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_18)) 
    rom_0_60_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_60_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_19)) 
    rom_0_60_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[19]), .o_ld_data(acts_0_60_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_21)) 
    rom_0_60_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_60_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_23)) 
    rom_0_60_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[23]), .o_ld_data(acts_0_60_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_26)) 
    rom_0_60_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_60_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_29)) 
    rom_0_60_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[29]), .o_ld_data(acts_0_60_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_31)) 
    rom_0_60_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_60_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_32)) 
    rom_0_60_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_60_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_33)) 
    rom_0_60_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_60_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_36)) 
    rom_0_60_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_60_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_60_40)) 
    rom_0_60_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[40]), .o_ld_data(acts_0_60_40));

  // Stage 1
    assign s_0_60_1_0 = {{2{acts_0_60_0[5]}}, acts_0_60_0} + {{2{acts_0_60_3[5]}}, acts_0_60_3} + {{2{acts_0_60_4[5]}}, acts_0_60_4} + {{2{acts_0_60_12[5]}}, acts_0_60_12};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_0), .q(s_0_60_1_0_reg));

    assign s_0_60_1_1 = {{2{acts_0_60_13[5]}}, acts_0_60_13} + {{2{acts_0_60_16[5]}}, acts_0_60_16} + {{2{acts_0_60_18[5]}}, acts_0_60_18} + {{2{acts_0_60_19[5]}}, acts_0_60_19};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_1), .q(s_0_60_1_1_reg));

    assign s_0_60_1_2 = {{2{acts_0_60_21[5]}}, acts_0_60_21} + {{2{acts_0_60_23[5]}}, acts_0_60_23} + {{2{acts_0_60_26[5]}}, acts_0_60_26} + {{2{acts_0_60_29[5]}}, acts_0_60_29};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_2), .q(s_0_60_1_2_reg));

    assign s_0_60_1_3 = {{2{acts_0_60_31[5]}}, acts_0_60_31} + {{2{acts_0_60_32[5]}}, acts_0_60_32} + {{2{acts_0_60_33[5]}}, acts_0_60_33} + {{2{acts_0_60_36[5]}}, acts_0_60_36};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_3), .q(s_0_60_1_3_reg));

    assign s_0_60_1_4 = {{2{acts_0_60_40[5]}}, acts_0_60_40};
    registers #(.ARRAY_WIDTH(8)) r_0_60_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_1_4), .q(s_0_60_1_4_reg));

  // Stage 2
    assign s_0_60_2_0 = {{2{s_0_60_1_0_reg[7]}}, s_0_60_1_0_reg} + {{2{s_0_60_1_1_reg[7]}}, s_0_60_1_1_reg} + {{2{s_0_60_1_2_reg[7]}}, s_0_60_1_2_reg} + {{2{s_0_60_1_3_reg[7]}}, s_0_60_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_60_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_2_0), .q(s_0_60_2_0_reg));

    assign s_0_60_2_1 = {{2{s_0_60_1_4_reg[7]}}, s_0_60_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_60_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_60_2_1), .q(s_0_60_2_1_reg));

  // Stage 3
    assign sum_0_60 = {{2{s_0_60_2_0_reg[9]}}, s_0_60_2_0_reg} + {{2{s_0_60_2_1_reg[9]}}, s_0_60_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_60), .q(sum_0_60_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_60 (.i_data(sum_0_60_reg), .o_data(out_0_60_sat));


    // Layer 0, Node 61
      logic  [7:0] s_0_61_1_0, s_0_61_1_1, s_0_61_1_2, s_0_61_1_3, s_0_61_1_4, s_0_61_1_5, s_0_61_1_6;
    logic  [7:0] s_0_61_1_0_reg, s_0_61_1_1_reg, s_0_61_1_2_reg, s_0_61_1_3_reg, s_0_61_1_4_reg, s_0_61_1_5_reg, s_0_61_1_6_reg;
    logic  [9:0] s_0_61_2_0, s_0_61_2_1;
    logic  [9:0] s_0_61_2_0_reg, s_0_61_2_1_reg;
    logic [11:0] sum_0_61;
    logic [11:0] sum_0_61_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_1)) 
    rom_0_61_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_61_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_3)) 
    rom_0_61_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_61_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_4)) 
    rom_0_61_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[4]), .o_ld_data(acts_0_61_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_5)) 
    rom_0_61_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_61_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_6)) 
    rom_0_61_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_61_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_7)) 
    rom_0_61_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_61_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_9)) 
    rom_0_61_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_61_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_10)) 
    rom_0_61_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_61_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_11)) 
    rom_0_61_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_61_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_12)) 
    rom_0_61_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_61_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_13)) 
    rom_0_61_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[13]), .o_ld_data(acts_0_61_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_15)) 
    rom_0_61_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_61_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_16)) 
    rom_0_61_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_61_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_17)) 
    rom_0_61_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_61_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_18)) 
    rom_0_61_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_61_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_20)) 
    rom_0_61_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[20]), .o_ld_data(acts_0_61_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_21)) 
    rom_0_61_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_61_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_26)) 
    rom_0_61_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_61_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_28)) 
    rom_0_61_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[28]), .o_ld_data(acts_0_61_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_33)) 
    rom_0_61_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[33]), .o_ld_data(acts_0_61_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_34)) 
    rom_0_61_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_61_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_35)) 
    rom_0_61_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[35]), .o_ld_data(acts_0_61_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_37)) 
    rom_0_61_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_61_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_38)) 
    rom_0_61_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_61_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_61_39)) 
    rom_0_61_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_61_39));

  // Stage 1
    assign s_0_61_1_0 = {{2{acts_0_61_1[5]}}, acts_0_61_1} + {{2{acts_0_61_3[5]}}, acts_0_61_3} + {{2{acts_0_61_4[5]}}, acts_0_61_4} + {{2{acts_0_61_5[5]}}, acts_0_61_5};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_0), .q(s_0_61_1_0_reg));

    assign s_0_61_1_1 = {{2{acts_0_61_6[5]}}, acts_0_61_6} + {{2{acts_0_61_7[5]}}, acts_0_61_7} + {{2{acts_0_61_9[5]}}, acts_0_61_9} + {{2{acts_0_61_10[5]}}, acts_0_61_10};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_1), .q(s_0_61_1_1_reg));

    assign s_0_61_1_2 = {{2{acts_0_61_11[5]}}, acts_0_61_11} + {{2{acts_0_61_12[5]}}, acts_0_61_12} + {{2{acts_0_61_13[5]}}, acts_0_61_13} + {{2{acts_0_61_15[5]}}, acts_0_61_15};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_2), .q(s_0_61_1_2_reg));

    assign s_0_61_1_3 = {{2{acts_0_61_16[5]}}, acts_0_61_16} + {{2{acts_0_61_17[5]}}, acts_0_61_17} + {{2{acts_0_61_18[5]}}, acts_0_61_18} + {{2{acts_0_61_20[5]}}, acts_0_61_20};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_3), .q(s_0_61_1_3_reg));

    assign s_0_61_1_4 = {{2{acts_0_61_21[5]}}, acts_0_61_21} + {{2{acts_0_61_26[5]}}, acts_0_61_26} + {{2{acts_0_61_28[5]}}, acts_0_61_28} + {{2{acts_0_61_33[5]}}, acts_0_61_33};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_4), .q(s_0_61_1_4_reg));

    assign s_0_61_1_5 = {{2{acts_0_61_34[5]}}, acts_0_61_34} + {{2{acts_0_61_35[5]}}, acts_0_61_35} + {{2{acts_0_61_37[5]}}, acts_0_61_37} + {{2{acts_0_61_38[5]}}, acts_0_61_38};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_5), .q(s_0_61_1_5_reg));

    assign s_0_61_1_6 = {{2{acts_0_61_39[5]}}, acts_0_61_39};
    registers #(.ARRAY_WIDTH(8)) r_0_61_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_1_6), .q(s_0_61_1_6_reg));

  // Stage 2
    assign s_0_61_2_0 = {{2{s_0_61_1_0_reg[7]}}, s_0_61_1_0_reg} + {{2{s_0_61_1_1_reg[7]}}, s_0_61_1_1_reg} + {{2{s_0_61_1_2_reg[7]}}, s_0_61_1_2_reg} + {{2{s_0_61_1_3_reg[7]}}, s_0_61_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_61_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_2_0), .q(s_0_61_2_0_reg));

    assign s_0_61_2_1 = {{2{s_0_61_1_4_reg[7]}}, s_0_61_1_4_reg} + {{2{s_0_61_1_5_reg[7]}}, s_0_61_1_5_reg} + {{2{s_0_61_1_6_reg[7]}}, s_0_61_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_61_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_61_2_1), .q(s_0_61_2_1_reg));

  // Stage 3
    assign sum_0_61 = {{2{s_0_61_2_0_reg[9]}}, s_0_61_2_0_reg} + {{2{s_0_61_2_1_reg[9]}}, s_0_61_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_61), .q(sum_0_61_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_61 (.i_data(sum_0_61_reg), .o_data(out_0_61_sat));


    // Layer 0, Node 62
      logic  [7:0] s_0_62_1_0, s_0_62_1_1, s_0_62_1_2, s_0_62_1_3;
    logic  [7:0] s_0_62_1_0_reg, s_0_62_1_1_reg, s_0_62_1_2_reg, s_0_62_1_3_reg;
    logic  [9:0] s_0_62_2_0;
    logic  [9:0] s_0_62_2_0_reg;
    logic [11:0] sum_0_62;
    logic [11:0] sum_0_62_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_2)) 
    rom_0_62_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_62_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_3)) 
    rom_0_62_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[3]), .o_ld_data(acts_0_62_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_12)) 
    rom_0_62_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_62_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_14)) 
    rom_0_62_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_62_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_15)) 
    rom_0_62_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[15]), .o_ld_data(acts_0_62_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_18)) 
    rom_0_62_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_62_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_21)) 
    rom_0_62_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[21]), .o_ld_data(acts_0_62_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_25)) 
    rom_0_62_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_62_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_31)) 
    rom_0_62_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[31]), .o_ld_data(acts_0_62_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_32)) 
    rom_0_62_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[32]), .o_ld_data(acts_0_62_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_36)) 
    rom_0_62_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_62_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_38)) 
    rom_0_62_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_62_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_62_39)) 
    rom_0_62_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_62_39));

  // Stage 1
    assign s_0_62_1_0 = {{2{acts_0_62_2[5]}}, acts_0_62_2} + {{2{acts_0_62_3[5]}}, acts_0_62_3} + {{2{acts_0_62_12[5]}}, acts_0_62_12} + {{2{acts_0_62_14[5]}}, acts_0_62_14};
    registers #(.ARRAY_WIDTH(8)) r_0_62_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_62_1_0), .q(s_0_62_1_0_reg));

    assign s_0_62_1_1 = {{2{acts_0_62_15[5]}}, acts_0_62_15} + {{2{acts_0_62_18[5]}}, acts_0_62_18} + {{2{acts_0_62_21[5]}}, acts_0_62_21} + {{2{acts_0_62_25[5]}}, acts_0_62_25};
    registers #(.ARRAY_WIDTH(8)) r_0_62_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_62_1_1), .q(s_0_62_1_1_reg));

    assign s_0_62_1_2 = {{2{acts_0_62_31[5]}}, acts_0_62_31} + {{2{acts_0_62_32[5]}}, acts_0_62_32} + {{2{acts_0_62_36[5]}}, acts_0_62_36} + {{2{acts_0_62_38[5]}}, acts_0_62_38};
    registers #(.ARRAY_WIDTH(8)) r_0_62_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_62_1_2), .q(s_0_62_1_2_reg));

    assign s_0_62_1_3 = {{2{acts_0_62_39[5]}}, acts_0_62_39};
    registers #(.ARRAY_WIDTH(8)) r_0_62_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_62_1_3), .q(s_0_62_1_3_reg));

  // Stage 2
    assign s_0_62_2_0 = {{2{s_0_62_1_0_reg[7]}}, s_0_62_1_0_reg} + {{2{s_0_62_1_1_reg[7]}}, s_0_62_1_1_reg} + {{2{s_0_62_1_2_reg[7]}}, s_0_62_1_2_reg} + {{2{s_0_62_1_3_reg[7]}}, s_0_62_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_62_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_62_2_0), .q(s_0_62_2_0_reg));

  // Stage 3
    registers #(.ARRAY_WIDTH(12)) reg_0_62_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d({{2{s_0_62_2_0_reg[9]}}, s_0_62_2_0_reg}), .q(sum_0_62_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_62 (.i_data(sum_0_62_reg), .o_data(out_0_62_sat));


    // Layer 0, Node 63
      logic  [7:0] s_0_63_1_0, s_0_63_1_1, s_0_63_1_2, s_0_63_1_3, s_0_63_1_4, s_0_63_1_5;
    logic  [7:0] s_0_63_1_0_reg, s_0_63_1_1_reg, s_0_63_1_2_reg, s_0_63_1_3_reg, s_0_63_1_4_reg, s_0_63_1_5_reg;
    logic  [9:0] s_0_63_2_0, s_0_63_2_1;
    logic  [9:0] s_0_63_2_0_reg, s_0_63_2_1_reg;
    logic [11:0] sum_0_63;
    logic [11:0] sum_0_63_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_0)) 
    rom_0_63_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[0]), .o_ld_data(acts_0_63_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_1)) 
    rom_0_63_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[1]), .o_ld_data(acts_0_63_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_2)) 
    rom_0_63_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[2]), .o_ld_data(acts_0_63_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_5)) 
    rom_0_63_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[5]), .o_ld_data(acts_0_63_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_6)) 
    rom_0_63_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[6]), .o_ld_data(acts_0_63_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_7)) 
    rom_0_63_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[7]), .o_ld_data(acts_0_63_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_8)) 
    rom_0_63_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[8]), .o_ld_data(acts_0_63_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_9)) 
    rom_0_63_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[9]), .o_ld_data(acts_0_63_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_10)) 
    rom_0_63_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[10]), .o_ld_data(acts_0_63_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_11)) 
    rom_0_63_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[11]), .o_ld_data(acts_0_63_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_12)) 
    rom_0_63_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[12]), .o_ld_data(acts_0_63_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_14)) 
    rom_0_63_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[14]), .o_ld_data(acts_0_63_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_16)) 
    rom_0_63_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[16]), .o_ld_data(acts_0_63_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_17)) 
    rom_0_63_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[17]), .o_ld_data(acts_0_63_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_18)) 
    rom_0_63_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[18]), .o_ld_data(acts_0_63_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_25)) 
    rom_0_63_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[25]), .o_ld_data(acts_0_63_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_26)) 
    rom_0_63_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[26]), .o_ld_data(acts_0_63_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_30)) 
    rom_0_63_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[30]), .o_ld_data(acts_0_63_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_34)) 
    rom_0_63_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[34]), .o_ld_data(acts_0_63_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_36)) 
    rom_0_63_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[36]), .o_ld_data(acts_0_63_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_37)) 
    rom_0_63_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[37]), .o_ld_data(acts_0_63_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_38)) 
    rom_0_63_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[38]), .o_ld_data(acts_0_63_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_0_63_39)) 
    rom_0_63_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(i_vector[39]), .o_ld_data(acts_0_63_39));

  // Stage 1
    assign s_0_63_1_0 = {{2{acts_0_63_0[5]}}, acts_0_63_0} + {{2{acts_0_63_1[5]}}, acts_0_63_1} + {{2{acts_0_63_2[5]}}, acts_0_63_2} + {{2{acts_0_63_5[5]}}, acts_0_63_5};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_0), .q(s_0_63_1_0_reg));

    assign s_0_63_1_1 = {{2{acts_0_63_6[5]}}, acts_0_63_6} + {{2{acts_0_63_7[5]}}, acts_0_63_7} + {{2{acts_0_63_8[5]}}, acts_0_63_8} + {{2{acts_0_63_9[5]}}, acts_0_63_9};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_1), .q(s_0_63_1_1_reg));

    assign s_0_63_1_2 = {{2{acts_0_63_10[5]}}, acts_0_63_10} + {{2{acts_0_63_11[5]}}, acts_0_63_11} + {{2{acts_0_63_12[5]}}, acts_0_63_12} + {{2{acts_0_63_14[5]}}, acts_0_63_14};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_2), .q(s_0_63_1_2_reg));

    assign s_0_63_1_3 = {{2{acts_0_63_16[5]}}, acts_0_63_16} + {{2{acts_0_63_17[5]}}, acts_0_63_17} + {{2{acts_0_63_18[5]}}, acts_0_63_18} + {{2{acts_0_63_25[5]}}, acts_0_63_25};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_3), .q(s_0_63_1_3_reg));

    assign s_0_63_1_4 = {{2{acts_0_63_26[5]}}, acts_0_63_26} + {{2{acts_0_63_30[5]}}, acts_0_63_30} + {{2{acts_0_63_34[5]}}, acts_0_63_34} + {{2{acts_0_63_36[5]}}, acts_0_63_36};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_4), .q(s_0_63_1_4_reg));

    assign s_0_63_1_5 = {{2{acts_0_63_37[5]}}, acts_0_63_37} + {{2{acts_0_63_38[5]}}, acts_0_63_38} + {{2{acts_0_63_39[5]}}, acts_0_63_39};
    registers #(.ARRAY_WIDTH(8)) r_0_63_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_1_5), .q(s_0_63_1_5_reg));

  // Stage 2
    assign s_0_63_2_0 = {{2{s_0_63_1_0_reg[7]}}, s_0_63_1_0_reg} + {{2{s_0_63_1_1_reg[7]}}, s_0_63_1_1_reg} + {{2{s_0_63_1_2_reg[7]}}, s_0_63_1_2_reg} + {{2{s_0_63_1_3_reg[7]}}, s_0_63_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_63_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_2_0), .q(s_0_63_2_0_reg));

    assign s_0_63_2_1 = {{2{s_0_63_1_4_reg[7]}}, s_0_63_1_4_reg} + {{2{s_0_63_1_5_reg[7]}}, s_0_63_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_0_63_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_0_63_2_1), .q(s_0_63_2_1_reg));

  // Stage 3
    assign sum_0_63 = {{2{s_0_63_2_0_reg[9]}}, s_0_63_2_0_reg} + {{2{s_0_63_2_1_reg[9]}}, s_0_63_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_0_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_0_63), .q(sum_0_63_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_0_63 (.i_data(sum_0_63_reg), .o_data(out_0_63_sat));


  registers #(.ARRAY_WIDTH(6)) node_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_0_sat), .q(out_0_0_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_1_sat), .q(out_0_1_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_2_sat), .q(out_0_2_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_3_sat), .q(out_0_3_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_4_sat), .q(out_0_4_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_5_sat), .q(out_0_5_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_6_sat), .q(out_0_6_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_7_sat), .q(out_0_7_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_8_sat), .q(out_0_8_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_9_sat), .q(out_0_9_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_10_sat), .q(out_0_10_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_11_sat), .q(out_0_11_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_12_sat), .q(out_0_12_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_13_sat), .q(out_0_13_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_14_sat), .q(out_0_14_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_15_sat), .q(out_0_15_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_16_sat), .q(out_0_16_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_17_sat), .q(out_0_17_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_18_sat), .q(out_0_18_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_19_sat), .q(out_0_19_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_20_sat), .q(out_0_20_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_21_sat), .q(out_0_21_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_22_sat), .q(out_0_22_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_23_sat), .q(out_0_23_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_24_sat), .q(out_0_24_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_25_sat), .q(out_0_25_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_26_sat), .q(out_0_26_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_27_sat), .q(out_0_27_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_28_sat), .q(out_0_28_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_29_sat), .q(out_0_29_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_30_sat), .q(out_0_30_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_31_sat), .q(out_0_31_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_32_sat), .q(out_0_32_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_33_sat), .q(out_0_33_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_34_sat), .q(out_0_34_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_35_sat), .q(out_0_35_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_36_sat), .q(out_0_36_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_37_sat), .q(out_0_37_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_38_sat), .q(out_0_38_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_39_sat), .q(out_0_39_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_40_sat), .q(out_0_40_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_41_sat), .q(out_0_41_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_42_sat), .q(out_0_42_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_43_sat), .q(out_0_43_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_44_sat), .q(out_0_44_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_45_sat), .q(out_0_45_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_46_sat), .q(out_0_46_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_47_sat), .q(out_0_47_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_48_sat), .q(out_0_48_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_49_sat), .q(out_0_49_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_50_sat), .q(out_0_50_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_51_sat), .q(out_0_51_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_52_sat), .q(out_0_52_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_53_sat), .q(out_0_53_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_54_sat), .q(out_0_54_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_55_sat), .q(out_0_55_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_56_sat), .q(out_0_56_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_57_sat), .q(out_0_57_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_58_sat), .q(out_0_58_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_59_sat), .q(out_0_59_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_60_sat), .q(out_0_60_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_61_sat), .q(out_0_61_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_62_sat), .q(out_0_62_reg));

    registers #(.ARRAY_WIDTH(6)) node_0_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_0_63_sat), .q(out_0_63_reg));


    // Layer 1, Node 0
      logic  [7:0] s_1_0_1_0, s_1_0_1_1, s_1_0_1_2, s_1_0_1_3, s_1_0_1_4, s_1_0_1_5;
    logic  [7:0] s_1_0_1_0_reg, s_1_0_1_1_reg, s_1_0_1_2_reg, s_1_0_1_3_reg, s_1_0_1_4_reg, s_1_0_1_5_reg;
    logic  [9:0] s_1_0_2_0, s_1_0_2_1;
    logic  [9:0] s_1_0_2_0_reg, s_1_0_2_1_reg;
    logic [11:0] sum_1_0;
    logic [11:0] sum_1_0_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_2)) 
    rom_1_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_0_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_9)) 
    rom_1_0_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_0_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_11)) 
    rom_1_0_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_0_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_13)) 
    rom_1_0_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_0_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_16)) 
    rom_1_0_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_0_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_17)) 
    rom_1_0_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_0_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_18)) 
    rom_1_0_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_0_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_19)) 
    rom_1_0_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_0_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_22)) 
    rom_1_0_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_0_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_23)) 
    rom_1_0_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_0_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_25)) 
    rom_1_0_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_0_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_27)) 
    rom_1_0_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_0_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_28)) 
    rom_1_0_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_0_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_30)) 
    rom_1_0_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_0_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_35)) 
    rom_1_0_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_0_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_39)) 
    rom_1_0_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_0_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_44)) 
    rom_1_0_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_0_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_50)) 
    rom_1_0_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_0_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_54)) 
    rom_1_0_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_0_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_55)) 
    rom_1_0_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_0_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_56)) 
    rom_1_0_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_0_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_57)) 
    rom_1_0_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_0_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_0_60)) 
    rom_1_0_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_0_60));

  // Stage 1
    assign s_1_0_1_0 = {{2{acts_1_0_2[5]}}, acts_1_0_2} + {{2{acts_1_0_9[5]}}, acts_1_0_9} + {{2{acts_1_0_11[5]}}, acts_1_0_11} + {{2{acts_1_0_13[5]}}, acts_1_0_13};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_0), .q(s_1_0_1_0_reg));

    assign s_1_0_1_1 = {{2{acts_1_0_16[5]}}, acts_1_0_16} + {{2{acts_1_0_17[5]}}, acts_1_0_17} + {{2{acts_1_0_18[5]}}, acts_1_0_18} + {{2{acts_1_0_19[5]}}, acts_1_0_19};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_1), .q(s_1_0_1_1_reg));

    assign s_1_0_1_2 = {{2{acts_1_0_22[5]}}, acts_1_0_22} + {{2{acts_1_0_23[5]}}, acts_1_0_23} + {{2{acts_1_0_25[5]}}, acts_1_0_25} + {{2{acts_1_0_27[5]}}, acts_1_0_27};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_2), .q(s_1_0_1_2_reg));

    assign s_1_0_1_3 = {{2{acts_1_0_28[5]}}, acts_1_0_28} + {{2{acts_1_0_30[5]}}, acts_1_0_30} + {{2{acts_1_0_35[5]}}, acts_1_0_35} + {{2{acts_1_0_39[5]}}, acts_1_0_39};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_3), .q(s_1_0_1_3_reg));

    assign s_1_0_1_4 = {{2{acts_1_0_44[5]}}, acts_1_0_44} + {{2{acts_1_0_50[5]}}, acts_1_0_50} + {{2{acts_1_0_54[5]}}, acts_1_0_54} + {{2{acts_1_0_55[5]}}, acts_1_0_55};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_4), .q(s_1_0_1_4_reg));

    assign s_1_0_1_5 = {{2{acts_1_0_56[5]}}, acts_1_0_56} + {{2{acts_1_0_57[5]}}, acts_1_0_57} + {{2{acts_1_0_60[5]}}, acts_1_0_60};
    registers #(.ARRAY_WIDTH(8)) r_1_0_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_1_5), .q(s_1_0_1_5_reg));

  // Stage 2
    assign s_1_0_2_0 = {{2{s_1_0_1_0_reg[7]}}, s_1_0_1_0_reg} + {{2{s_1_0_1_1_reg[7]}}, s_1_0_1_1_reg} + {{2{s_1_0_1_2_reg[7]}}, s_1_0_1_2_reg} + {{2{s_1_0_1_3_reg[7]}}, s_1_0_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_0_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_2_0), .q(s_1_0_2_0_reg));

    assign s_1_0_2_1 = {{2{s_1_0_1_4_reg[7]}}, s_1_0_1_4_reg} + {{2{s_1_0_1_5_reg[7]}}, s_1_0_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_0_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_0_2_1), .q(s_1_0_2_1_reg));

  // Stage 3
    assign sum_1_0 = {{2{s_1_0_2_0_reg[9]}}, s_1_0_2_0_reg} + {{2{s_1_0_2_1_reg[9]}}, s_1_0_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_0), .q(sum_1_0_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_0 (.i_data(sum_1_0_reg), .o_data(out_1_0_sat));


    // Layer 1, Node 1
      logic  [7:0] s_1_1_1_0, s_1_1_1_1, s_1_1_1_2, s_1_1_1_3, s_1_1_1_4, s_1_1_1_5, s_1_1_1_6;
    logic  [7:0] s_1_1_1_0_reg, s_1_1_1_1_reg, s_1_1_1_2_reg, s_1_1_1_3_reg, s_1_1_1_4_reg, s_1_1_1_5_reg, s_1_1_1_6_reg;
    logic  [9:0] s_1_1_2_0, s_1_1_2_1;
    logic  [9:0] s_1_1_2_0_reg, s_1_1_2_1_reg;
    logic [11:0] sum_1_1;
    logic [11:0] sum_1_1_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_3)) 
    rom_1_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_1_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_4)) 
    rom_1_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_1_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_6)) 
    rom_1_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_1_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_14)) 
    rom_1_1_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_1_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_17)) 
    rom_1_1_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_1_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_18)) 
    rom_1_1_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_1_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_20)) 
    rom_1_1_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_1_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_26)) 
    rom_1_1_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_1_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_29)) 
    rom_1_1_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_1_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_32)) 
    rom_1_1_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_1_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_33)) 
    rom_1_1_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_1_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_34)) 
    rom_1_1_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_1_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_38)) 
    rom_1_1_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_1_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_39)) 
    rom_1_1_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_1_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_41)) 
    rom_1_1_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_1_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_42)) 
    rom_1_1_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_1_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_45)) 
    rom_1_1_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_1_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_46)) 
    rom_1_1_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_1_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_49)) 
    rom_1_1_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_1_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_52)) 
    rom_1_1_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_1_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_54)) 
    rom_1_1_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_1_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_56)) 
    rom_1_1_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_1_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_57)) 
    rom_1_1_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_1_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_60)) 
    rom_1_1_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_1_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_61)) 
    rom_1_1_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_1_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_1_63)) 
    rom_1_1_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_1_63));

  // Stage 1
    assign s_1_1_1_0 = {{2{acts_1_1_3[5]}}, acts_1_1_3} + {{2{acts_1_1_4[5]}}, acts_1_1_4} + {{2{acts_1_1_6[5]}}, acts_1_1_6} + {{2{acts_1_1_14[5]}}, acts_1_1_14};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_0), .q(s_1_1_1_0_reg));

    assign s_1_1_1_1 = {{2{acts_1_1_17[5]}}, acts_1_1_17} + {{2{acts_1_1_18[5]}}, acts_1_1_18} + {{2{acts_1_1_20[5]}}, acts_1_1_20} + {{2{acts_1_1_26[5]}}, acts_1_1_26};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_1), .q(s_1_1_1_1_reg));

    assign s_1_1_1_2 = {{2{acts_1_1_29[5]}}, acts_1_1_29} + {{2{acts_1_1_32[5]}}, acts_1_1_32} + {{2{acts_1_1_33[5]}}, acts_1_1_33} + {{2{acts_1_1_34[5]}}, acts_1_1_34};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_2), .q(s_1_1_1_2_reg));

    assign s_1_1_1_3 = {{2{acts_1_1_38[5]}}, acts_1_1_38} + {{2{acts_1_1_39[5]}}, acts_1_1_39} + {{2{acts_1_1_41[5]}}, acts_1_1_41} + {{2{acts_1_1_42[5]}}, acts_1_1_42};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_3), .q(s_1_1_1_3_reg));

    assign s_1_1_1_4 = {{2{acts_1_1_45[5]}}, acts_1_1_45} + {{2{acts_1_1_46[5]}}, acts_1_1_46} + {{2{acts_1_1_49[5]}}, acts_1_1_49} + {{2{acts_1_1_52[5]}}, acts_1_1_52};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_4), .q(s_1_1_1_4_reg));

    assign s_1_1_1_5 = {{2{acts_1_1_54[5]}}, acts_1_1_54} + {{2{acts_1_1_56[5]}}, acts_1_1_56} + {{2{acts_1_1_57[5]}}, acts_1_1_57} + {{2{acts_1_1_60[5]}}, acts_1_1_60};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_5), .q(s_1_1_1_5_reg));

    assign s_1_1_1_6 = {{2{acts_1_1_61[5]}}, acts_1_1_61} + {{2{acts_1_1_63[5]}}, acts_1_1_63};
    registers #(.ARRAY_WIDTH(8)) r_1_1_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_1_6), .q(s_1_1_1_6_reg));

  // Stage 2
    assign s_1_1_2_0 = {{2{s_1_1_1_0_reg[7]}}, s_1_1_1_0_reg} + {{2{s_1_1_1_1_reg[7]}}, s_1_1_1_1_reg} + {{2{s_1_1_1_2_reg[7]}}, s_1_1_1_2_reg} + {{2{s_1_1_1_3_reg[7]}}, s_1_1_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_1_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_2_0), .q(s_1_1_2_0_reg));

    assign s_1_1_2_1 = {{2{s_1_1_1_4_reg[7]}}, s_1_1_1_4_reg} + {{2{s_1_1_1_5_reg[7]}}, s_1_1_1_5_reg} + {{2{s_1_1_1_6_reg[7]}}, s_1_1_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_1_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_1_2_1), .q(s_1_1_2_1_reg));

  // Stage 3
    assign sum_1_1 = {{2{s_1_1_2_0_reg[9]}}, s_1_1_2_0_reg} + {{2{s_1_1_2_1_reg[9]}}, s_1_1_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_1), .q(sum_1_1_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_1 (.i_data(sum_1_1_reg), .o_data(out_1_1_sat));


    // Layer 1, Node 2
      logic  [7:0] s_1_2_1_0, s_1_2_1_1, s_1_2_1_2, s_1_2_1_3, s_1_2_1_4, s_1_2_1_5, s_1_2_1_6;
    logic  [7:0] s_1_2_1_0_reg, s_1_2_1_1_reg, s_1_2_1_2_reg, s_1_2_1_3_reg, s_1_2_1_4_reg, s_1_2_1_5_reg, s_1_2_1_6_reg;
    logic  [9:0] s_1_2_2_0, s_1_2_2_1;
    logic  [9:0] s_1_2_2_0_reg, s_1_2_2_1_reg;
    logic [11:0] sum_1_2;
    logic [11:0] sum_1_2_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_0)) 
    rom_1_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_2_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_1)) 
    rom_1_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_2_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_2)) 
    rom_1_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_2_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_4)) 
    rom_1_2_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_2_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_5)) 
    rom_1_2_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_2_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_9)) 
    rom_1_2_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_2_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_13)) 
    rom_1_2_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_2_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_14)) 
    rom_1_2_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_2_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_16)) 
    rom_1_2_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_2_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_18)) 
    rom_1_2_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_2_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_19)) 
    rom_1_2_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_2_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_24)) 
    rom_1_2_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_2_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_26)) 
    rom_1_2_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_2_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_29)) 
    rom_1_2_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_2_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_30)) 
    rom_1_2_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_2_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_35)) 
    rom_1_2_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_2_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_37)) 
    rom_1_2_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_2_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_38)) 
    rom_1_2_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_2_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_39)) 
    rom_1_2_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_2_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_41)) 
    rom_1_2_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_2_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_43)) 
    rom_1_2_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_2_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_44)) 
    rom_1_2_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_2_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_45)) 
    rom_1_2_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_2_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_46)) 
    rom_1_2_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_2_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_48)) 
    rom_1_2_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_2_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_52)) 
    rom_1_2_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_2_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_57)) 
    rom_1_2_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_2_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_2_59)) 
    rom_1_2_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_2_59));

  // Stage 1
    assign s_1_2_1_0 = {{2{acts_1_2_0[5]}}, acts_1_2_0} + {{2{acts_1_2_1[5]}}, acts_1_2_1} + {{2{acts_1_2_2[5]}}, acts_1_2_2} + {{2{acts_1_2_4[5]}}, acts_1_2_4};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_0), .q(s_1_2_1_0_reg));

    assign s_1_2_1_1 = {{2{acts_1_2_5[5]}}, acts_1_2_5} + {{2{acts_1_2_9[5]}}, acts_1_2_9} + {{2{acts_1_2_13[5]}}, acts_1_2_13} + {{2{acts_1_2_14[5]}}, acts_1_2_14};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_1), .q(s_1_2_1_1_reg));

    assign s_1_2_1_2 = {{2{acts_1_2_16[5]}}, acts_1_2_16} + {{2{acts_1_2_18[5]}}, acts_1_2_18} + {{2{acts_1_2_19[5]}}, acts_1_2_19} + {{2{acts_1_2_24[5]}}, acts_1_2_24};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_2), .q(s_1_2_1_2_reg));

    assign s_1_2_1_3 = {{2{acts_1_2_26[5]}}, acts_1_2_26} + {{2{acts_1_2_29[5]}}, acts_1_2_29} + {{2{acts_1_2_30[5]}}, acts_1_2_30} + {{2{acts_1_2_35[5]}}, acts_1_2_35};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_3), .q(s_1_2_1_3_reg));

    assign s_1_2_1_4 = {{2{acts_1_2_37[5]}}, acts_1_2_37} + {{2{acts_1_2_38[5]}}, acts_1_2_38} + {{2{acts_1_2_39[5]}}, acts_1_2_39} + {{2{acts_1_2_41[5]}}, acts_1_2_41};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_4), .q(s_1_2_1_4_reg));

    assign s_1_2_1_5 = {{2{acts_1_2_43[5]}}, acts_1_2_43} + {{2{acts_1_2_44[5]}}, acts_1_2_44} + {{2{acts_1_2_45[5]}}, acts_1_2_45} + {{2{acts_1_2_46[5]}}, acts_1_2_46};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_5), .q(s_1_2_1_5_reg));

    assign s_1_2_1_6 = {{2{acts_1_2_48[5]}}, acts_1_2_48} + {{2{acts_1_2_52[5]}}, acts_1_2_52} + {{2{acts_1_2_57[5]}}, acts_1_2_57} + {{2{acts_1_2_59[5]}}, acts_1_2_59};
    registers #(.ARRAY_WIDTH(8)) r_1_2_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_1_6), .q(s_1_2_1_6_reg));

  // Stage 2
    assign s_1_2_2_0 = {{2{s_1_2_1_0_reg[7]}}, s_1_2_1_0_reg} + {{2{s_1_2_1_1_reg[7]}}, s_1_2_1_1_reg} + {{2{s_1_2_1_2_reg[7]}}, s_1_2_1_2_reg} + {{2{s_1_2_1_3_reg[7]}}, s_1_2_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_2_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_2_0), .q(s_1_2_2_0_reg));

    assign s_1_2_2_1 = {{2{s_1_2_1_4_reg[7]}}, s_1_2_1_4_reg} + {{2{s_1_2_1_5_reg[7]}}, s_1_2_1_5_reg} + {{2{s_1_2_1_6_reg[7]}}, s_1_2_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_2_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_2_2_1), .q(s_1_2_2_1_reg));

  // Stage 3
    assign sum_1_2 = {{2{s_1_2_2_0_reg[9]}}, s_1_2_2_0_reg} + {{2{s_1_2_2_1_reg[9]}}, s_1_2_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_2), .q(sum_1_2_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_2 (.i_data(sum_1_2_reg), .o_data(out_1_2_sat));


    // Layer 1, Node 3
      logic  [7:0] s_1_3_1_0, s_1_3_1_1, s_1_3_1_2, s_1_3_1_3, s_1_3_1_4, s_1_3_1_5, s_1_3_1_6, s_1_3_1_7;
    logic  [7:0] s_1_3_1_0_reg, s_1_3_1_1_reg, s_1_3_1_2_reg, s_1_3_1_3_reg, s_1_3_1_4_reg, s_1_3_1_5_reg, s_1_3_1_6_reg, s_1_3_1_7_reg;
    logic  [9:0] s_1_3_2_0, s_1_3_2_1;
    logic  [9:0] s_1_3_2_0_reg, s_1_3_2_1_reg;
    logic [11:0] sum_1_3;
    logic [11:0] sum_1_3_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_0)) 
    rom_1_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_3_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_1)) 
    rom_1_3_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_3_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_2)) 
    rom_1_3_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_3_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_4)) 
    rom_1_3_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_3_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_7)) 
    rom_1_3_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_3_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_14)) 
    rom_1_3_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_3_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_17)) 
    rom_1_3_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_3_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_19)) 
    rom_1_3_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_3_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_20)) 
    rom_1_3_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_3_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_22)) 
    rom_1_3_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_3_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_23)) 
    rom_1_3_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_3_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_25)) 
    rom_1_3_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_3_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_27)) 
    rom_1_3_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_3_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_29)) 
    rom_1_3_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_3_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_31)) 
    rom_1_3_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_3_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_32)) 
    rom_1_3_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_3_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_35)) 
    rom_1_3_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_3_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_38)) 
    rom_1_3_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_3_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_39)) 
    rom_1_3_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_3_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_42)) 
    rom_1_3_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_3_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_45)) 
    rom_1_3_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_3_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_46)) 
    rom_1_3_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_3_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_48)) 
    rom_1_3_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_3_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_49)) 
    rom_1_3_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_3_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_54)) 
    rom_1_3_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_3_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_55)) 
    rom_1_3_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_3_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_57)) 
    rom_1_3_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_3_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_60)) 
    rom_1_3_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_3_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_62)) 
    rom_1_3_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_3_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_3_63)) 
    rom_1_3_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_3_63));

  // Stage 1
    assign s_1_3_1_0 = {{2{acts_1_3_0[5]}}, acts_1_3_0} + {{2{acts_1_3_1[5]}}, acts_1_3_1} + {{2{acts_1_3_2[5]}}, acts_1_3_2} + {{2{acts_1_3_4[5]}}, acts_1_3_4};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_0), .q(s_1_3_1_0_reg));

    assign s_1_3_1_1 = {{2{acts_1_3_7[5]}}, acts_1_3_7} + {{2{acts_1_3_14[5]}}, acts_1_3_14} + {{2{acts_1_3_17[5]}}, acts_1_3_17} + {{2{acts_1_3_19[5]}}, acts_1_3_19};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_1), .q(s_1_3_1_1_reg));

    assign s_1_3_1_2 = {{2{acts_1_3_20[5]}}, acts_1_3_20} + {{2{acts_1_3_22[5]}}, acts_1_3_22} + {{2{acts_1_3_23[5]}}, acts_1_3_23} + {{2{acts_1_3_25[5]}}, acts_1_3_25};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_2), .q(s_1_3_1_2_reg));

    assign s_1_3_1_3 = {{2{acts_1_3_27[5]}}, acts_1_3_27} + {{2{acts_1_3_29[5]}}, acts_1_3_29} + {{2{acts_1_3_31[5]}}, acts_1_3_31} + {{2{acts_1_3_32[5]}}, acts_1_3_32};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_3), .q(s_1_3_1_3_reg));

    assign s_1_3_1_4 = {{2{acts_1_3_35[5]}}, acts_1_3_35} + {{2{acts_1_3_38[5]}}, acts_1_3_38} + {{2{acts_1_3_39[5]}}, acts_1_3_39} + {{2{acts_1_3_42[5]}}, acts_1_3_42};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_4), .q(s_1_3_1_4_reg));

    assign s_1_3_1_5 = {{2{acts_1_3_45[5]}}, acts_1_3_45} + {{2{acts_1_3_46[5]}}, acts_1_3_46} + {{2{acts_1_3_48[5]}}, acts_1_3_48} + {{2{acts_1_3_49[5]}}, acts_1_3_49};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_5), .q(s_1_3_1_5_reg));

    assign s_1_3_1_6 = {{2{acts_1_3_54[5]}}, acts_1_3_54} + {{2{acts_1_3_55[5]}}, acts_1_3_55} + {{2{acts_1_3_57[5]}}, acts_1_3_57} + {{2{acts_1_3_60[5]}}, acts_1_3_60};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_6), .q(s_1_3_1_6_reg));

    assign s_1_3_1_7 = {{2{acts_1_3_62[5]}}, acts_1_3_62} + {{2{acts_1_3_63[5]}}, acts_1_3_63};
    registers #(.ARRAY_WIDTH(8)) r_1_3_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_1_7), .q(s_1_3_1_7_reg));

  // Stage 2
    assign s_1_3_2_0 = {{2{s_1_3_1_0_reg[7]}}, s_1_3_1_0_reg} + {{2{s_1_3_1_1_reg[7]}}, s_1_3_1_1_reg} + {{2{s_1_3_1_2_reg[7]}}, s_1_3_1_2_reg} + {{2{s_1_3_1_3_reg[7]}}, s_1_3_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_3_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_2_0), .q(s_1_3_2_0_reg));

    assign s_1_3_2_1 = {{2{s_1_3_1_4_reg[7]}}, s_1_3_1_4_reg} + {{2{s_1_3_1_5_reg[7]}}, s_1_3_1_5_reg} + {{2{s_1_3_1_6_reg[7]}}, s_1_3_1_6_reg} + {{2{s_1_3_1_7_reg[7]}}, s_1_3_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_3_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_3_2_1), .q(s_1_3_2_1_reg));

  // Stage 3
    assign sum_1_3 = {{2{s_1_3_2_0_reg[9]}}, s_1_3_2_0_reg} + {{2{s_1_3_2_1_reg[9]}}, s_1_3_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_3), .q(sum_1_3_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_3 (.i_data(sum_1_3_reg), .o_data(out_1_3_sat));


    // Layer 1, Node 4
      logic  [7:0] s_1_4_1_0, s_1_4_1_1, s_1_4_1_2, s_1_4_1_3, s_1_4_1_4, s_1_4_1_5, s_1_4_1_6, s_1_4_1_7, s_1_4_1_8;
    logic  [7:0] s_1_4_1_0_reg, s_1_4_1_1_reg, s_1_4_1_2_reg, s_1_4_1_3_reg, s_1_4_1_4_reg, s_1_4_1_5_reg, s_1_4_1_6_reg, s_1_4_1_7_reg, s_1_4_1_8_reg;
    logic  [9:0] s_1_4_2_0, s_1_4_2_1, s_1_4_2_2;
    logic  [9:0] s_1_4_2_0_reg, s_1_4_2_1_reg, s_1_4_2_2_reg;
    logic [11:0] sum_1_4;
    logic [11:0] sum_1_4_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_0)) 
    rom_1_4_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_4_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_3)) 
    rom_1_4_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_4_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_4)) 
    rom_1_4_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_4_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_8)) 
    rom_1_4_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_4_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_9)) 
    rom_1_4_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_4_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_13)) 
    rom_1_4_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_4_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_14)) 
    rom_1_4_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_4_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_16)) 
    rom_1_4_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_4_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_19)) 
    rom_1_4_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_4_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_23)) 
    rom_1_4_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_4_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_24)) 
    rom_1_4_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_4_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_25)) 
    rom_1_4_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_4_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_26)) 
    rom_1_4_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_4_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_27)) 
    rom_1_4_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_4_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_28)) 
    rom_1_4_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_4_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_30)) 
    rom_1_4_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_4_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_32)) 
    rom_1_4_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_4_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_35)) 
    rom_1_4_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_4_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_37)) 
    rom_1_4_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_4_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_39)) 
    rom_1_4_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_4_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_41)) 
    rom_1_4_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_4_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_42)) 
    rom_1_4_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_4_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_43)) 
    rom_1_4_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_4_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_45)) 
    rom_1_4_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_4_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_48)) 
    rom_1_4_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_4_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_49)) 
    rom_1_4_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_4_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_50)) 
    rom_1_4_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_4_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_51)) 
    rom_1_4_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_4_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_52)) 
    rom_1_4_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_4_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_54)) 
    rom_1_4_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_4_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_56)) 
    rom_1_4_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_4_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_59)) 
    rom_1_4_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_4_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_61)) 
    rom_1_4_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_4_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_62)) 
    rom_1_4_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_4_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_4_63)) 
    rom_1_4_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_4_63));

  // Stage 1
    assign s_1_4_1_0 = {{2{acts_1_4_0[5]}}, acts_1_4_0} + {{2{acts_1_4_3[5]}}, acts_1_4_3} + {{2{acts_1_4_4[5]}}, acts_1_4_4} + {{2{acts_1_4_8[5]}}, acts_1_4_8};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_0), .q(s_1_4_1_0_reg));

    assign s_1_4_1_1 = {{2{acts_1_4_9[5]}}, acts_1_4_9} + {{2{acts_1_4_13[5]}}, acts_1_4_13} + {{2{acts_1_4_14[5]}}, acts_1_4_14} + {{2{acts_1_4_16[5]}}, acts_1_4_16};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_1), .q(s_1_4_1_1_reg));

    assign s_1_4_1_2 = {{2{acts_1_4_19[5]}}, acts_1_4_19} + {{2{acts_1_4_23[5]}}, acts_1_4_23} + {{2{acts_1_4_24[5]}}, acts_1_4_24} + {{2{acts_1_4_25[5]}}, acts_1_4_25};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_2), .q(s_1_4_1_2_reg));

    assign s_1_4_1_3 = {{2{acts_1_4_26[5]}}, acts_1_4_26} + {{2{acts_1_4_27[5]}}, acts_1_4_27} + {{2{acts_1_4_28[5]}}, acts_1_4_28} + {{2{acts_1_4_30[5]}}, acts_1_4_30};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_3), .q(s_1_4_1_3_reg));

    assign s_1_4_1_4 = {{2{acts_1_4_32[5]}}, acts_1_4_32} + {{2{acts_1_4_35[5]}}, acts_1_4_35} + {{2{acts_1_4_37[5]}}, acts_1_4_37} + {{2{acts_1_4_39[5]}}, acts_1_4_39};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_4), .q(s_1_4_1_4_reg));

    assign s_1_4_1_5 = {{2{acts_1_4_41[5]}}, acts_1_4_41} + {{2{acts_1_4_42[5]}}, acts_1_4_42} + {{2{acts_1_4_43[5]}}, acts_1_4_43} + {{2{acts_1_4_45[5]}}, acts_1_4_45};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_5), .q(s_1_4_1_5_reg));

    assign s_1_4_1_6 = {{2{acts_1_4_48[5]}}, acts_1_4_48} + {{2{acts_1_4_49[5]}}, acts_1_4_49} + {{2{acts_1_4_50[5]}}, acts_1_4_50} + {{2{acts_1_4_51[5]}}, acts_1_4_51};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_6), .q(s_1_4_1_6_reg));

    assign s_1_4_1_7 = {{2{acts_1_4_52[5]}}, acts_1_4_52} + {{2{acts_1_4_54[5]}}, acts_1_4_54} + {{2{acts_1_4_56[5]}}, acts_1_4_56} + {{2{acts_1_4_59[5]}}, acts_1_4_59};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_7), .q(s_1_4_1_7_reg));

    assign s_1_4_1_8 = {{2{acts_1_4_61[5]}}, acts_1_4_61} + {{2{acts_1_4_62[5]}}, acts_1_4_62} + {{2{acts_1_4_63[5]}}, acts_1_4_63};
    registers #(.ARRAY_WIDTH(8)) r_1_4_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_1_8), .q(s_1_4_1_8_reg));

  // Stage 2
    assign s_1_4_2_0 = {{2{s_1_4_1_0_reg[7]}}, s_1_4_1_0_reg} + {{2{s_1_4_1_1_reg[7]}}, s_1_4_1_1_reg} + {{2{s_1_4_1_2_reg[7]}}, s_1_4_1_2_reg} + {{2{s_1_4_1_3_reg[7]}}, s_1_4_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_4_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_2_0), .q(s_1_4_2_0_reg));

    assign s_1_4_2_1 = {{2{s_1_4_1_4_reg[7]}}, s_1_4_1_4_reg} + {{2{s_1_4_1_5_reg[7]}}, s_1_4_1_5_reg} + {{2{s_1_4_1_6_reg[7]}}, s_1_4_1_6_reg} + {{2{s_1_4_1_7_reg[7]}}, s_1_4_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_4_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_2_1), .q(s_1_4_2_1_reg));

    assign s_1_4_2_2 = {{2{s_1_4_1_8_reg[7]}}, s_1_4_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_4_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_4_2_2), .q(s_1_4_2_2_reg));

  // Stage 3
    assign sum_1_4 = {{2{s_1_4_2_0_reg[9]}}, s_1_4_2_0_reg} + {{2{s_1_4_2_1_reg[9]}}, s_1_4_2_1_reg} + {{2{s_1_4_2_2_reg[9]}}, s_1_4_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_4), .q(sum_1_4_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_4 (.i_data(sum_1_4_reg), .o_data(out_1_4_sat));


    // Layer 1, Node 5
      logic  [7:0] s_1_5_1_0, s_1_5_1_1, s_1_5_1_2, s_1_5_1_3, s_1_5_1_4, s_1_5_1_5, s_1_5_1_6, s_1_5_1_7;
    logic  [7:0] s_1_5_1_0_reg, s_1_5_1_1_reg, s_1_5_1_2_reg, s_1_5_1_3_reg, s_1_5_1_4_reg, s_1_5_1_5_reg, s_1_5_1_6_reg, s_1_5_1_7_reg;
    logic  [9:0] s_1_5_2_0, s_1_5_2_1;
    logic  [9:0] s_1_5_2_0_reg, s_1_5_2_1_reg;
    logic [11:0] sum_1_5;
    logic [11:0] sum_1_5_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_0)) 
    rom_1_5_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_5_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_2)) 
    rom_1_5_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_5_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_4)) 
    rom_1_5_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_5_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_6)) 
    rom_1_5_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_5_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_7)) 
    rom_1_5_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_5_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_8)) 
    rom_1_5_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_5_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_11)) 
    rom_1_5_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_5_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_17)) 
    rom_1_5_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_5_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_18)) 
    rom_1_5_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_5_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_23)) 
    rom_1_5_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_5_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_24)) 
    rom_1_5_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_5_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_25)) 
    rom_1_5_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_5_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_27)) 
    rom_1_5_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_5_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_29)) 
    rom_1_5_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_5_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_31)) 
    rom_1_5_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_5_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_34)) 
    rom_1_5_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_5_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_37)) 
    rom_1_5_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_5_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_39)) 
    rom_1_5_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_5_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_48)) 
    rom_1_5_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_5_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_49)) 
    rom_1_5_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_5_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_51)) 
    rom_1_5_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_5_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_54)) 
    rom_1_5_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_5_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_55)) 
    rom_1_5_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_5_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_56)) 
    rom_1_5_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_5_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_58)) 
    rom_1_5_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_5_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_59)) 
    rom_1_5_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_5_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_60)) 
    rom_1_5_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_5_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_61)) 
    rom_1_5_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_5_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_5_62)) 
    rom_1_5_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_5_62));

  // Stage 1
    assign s_1_5_1_0 = {{2{acts_1_5_0[5]}}, acts_1_5_0} + {{2{acts_1_5_2[5]}}, acts_1_5_2} + {{2{acts_1_5_4[5]}}, acts_1_5_4} + {{2{acts_1_5_6[5]}}, acts_1_5_6};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_0), .q(s_1_5_1_0_reg));

    assign s_1_5_1_1 = {{2{acts_1_5_7[5]}}, acts_1_5_7} + {{2{acts_1_5_8[5]}}, acts_1_5_8} + {{2{acts_1_5_11[5]}}, acts_1_5_11} + {{2{acts_1_5_17[5]}}, acts_1_5_17};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_1), .q(s_1_5_1_1_reg));

    assign s_1_5_1_2 = {{2{acts_1_5_18[5]}}, acts_1_5_18} + {{2{acts_1_5_23[5]}}, acts_1_5_23} + {{2{acts_1_5_24[5]}}, acts_1_5_24} + {{2{acts_1_5_25[5]}}, acts_1_5_25};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_2), .q(s_1_5_1_2_reg));

    assign s_1_5_1_3 = {{2{acts_1_5_27[5]}}, acts_1_5_27} + {{2{acts_1_5_29[5]}}, acts_1_5_29} + {{2{acts_1_5_31[5]}}, acts_1_5_31} + {{2{acts_1_5_34[5]}}, acts_1_5_34};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_3), .q(s_1_5_1_3_reg));

    assign s_1_5_1_4 = {{2{acts_1_5_37[5]}}, acts_1_5_37} + {{2{acts_1_5_39[5]}}, acts_1_5_39} + {{2{acts_1_5_48[5]}}, acts_1_5_48} + {{2{acts_1_5_49[5]}}, acts_1_5_49};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_4), .q(s_1_5_1_4_reg));

    assign s_1_5_1_5 = {{2{acts_1_5_51[5]}}, acts_1_5_51} + {{2{acts_1_5_54[5]}}, acts_1_5_54} + {{2{acts_1_5_55[5]}}, acts_1_5_55} + {{2{acts_1_5_56[5]}}, acts_1_5_56};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_5), .q(s_1_5_1_5_reg));

    assign s_1_5_1_6 = {{2{acts_1_5_58[5]}}, acts_1_5_58} + {{2{acts_1_5_59[5]}}, acts_1_5_59} + {{2{acts_1_5_60[5]}}, acts_1_5_60} + {{2{acts_1_5_61[5]}}, acts_1_5_61};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_6), .q(s_1_5_1_6_reg));

    assign s_1_5_1_7 = {{2{acts_1_5_62[5]}}, acts_1_5_62};
    registers #(.ARRAY_WIDTH(8)) r_1_5_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_1_7), .q(s_1_5_1_7_reg));

  // Stage 2
    assign s_1_5_2_0 = {{2{s_1_5_1_0_reg[7]}}, s_1_5_1_0_reg} + {{2{s_1_5_1_1_reg[7]}}, s_1_5_1_1_reg} + {{2{s_1_5_1_2_reg[7]}}, s_1_5_1_2_reg} + {{2{s_1_5_1_3_reg[7]}}, s_1_5_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_5_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_2_0), .q(s_1_5_2_0_reg));

    assign s_1_5_2_1 = {{2{s_1_5_1_4_reg[7]}}, s_1_5_1_4_reg} + {{2{s_1_5_1_5_reg[7]}}, s_1_5_1_5_reg} + {{2{s_1_5_1_6_reg[7]}}, s_1_5_1_6_reg} + {{2{s_1_5_1_7_reg[7]}}, s_1_5_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_5_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_5_2_1), .q(s_1_5_2_1_reg));

  // Stage 3
    assign sum_1_5 = {{2{s_1_5_2_0_reg[9]}}, s_1_5_2_0_reg} + {{2{s_1_5_2_1_reg[9]}}, s_1_5_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_5), .q(sum_1_5_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_5 (.i_data(sum_1_5_reg), .o_data(out_1_5_sat));


    // Layer 1, Node 6
      logic  [7:0] s_1_6_1_0, s_1_6_1_1, s_1_6_1_2, s_1_6_1_3, s_1_6_1_4, s_1_6_1_5, s_1_6_1_6, s_1_6_1_7, s_1_6_1_8;
    logic  [7:0] s_1_6_1_0_reg, s_1_6_1_1_reg, s_1_6_1_2_reg, s_1_6_1_3_reg, s_1_6_1_4_reg, s_1_6_1_5_reg, s_1_6_1_6_reg, s_1_6_1_7_reg, s_1_6_1_8_reg;
    logic  [9:0] s_1_6_2_0, s_1_6_2_1, s_1_6_2_2;
    logic  [9:0] s_1_6_2_0_reg, s_1_6_2_1_reg, s_1_6_2_2_reg;
    logic [11:0] sum_1_6;
    logic [11:0] sum_1_6_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_1)) 
    rom_1_6_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_6_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_2)) 
    rom_1_6_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_6_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_7)) 
    rom_1_6_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_6_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_8)) 
    rom_1_6_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_6_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_9)) 
    rom_1_6_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_6_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_11)) 
    rom_1_6_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_6_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_12)) 
    rom_1_6_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_6_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_13)) 
    rom_1_6_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_6_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_14)) 
    rom_1_6_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_6_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_15)) 
    rom_1_6_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_6_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_16)) 
    rom_1_6_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_6_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_18)) 
    rom_1_6_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_6_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_21)) 
    rom_1_6_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_6_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_26)) 
    rom_1_6_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_6_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_27)) 
    rom_1_6_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_6_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_30)) 
    rom_1_6_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_6_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_31)) 
    rom_1_6_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_6_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_33)) 
    rom_1_6_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_6_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_34)) 
    rom_1_6_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_6_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_35)) 
    rom_1_6_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_6_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_36)) 
    rom_1_6_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_6_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_38)) 
    rom_1_6_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_6_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_39)) 
    rom_1_6_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_6_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_44)) 
    rom_1_6_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_6_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_46)) 
    rom_1_6_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_6_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_47)) 
    rom_1_6_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_6_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_50)) 
    rom_1_6_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_6_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_53)) 
    rom_1_6_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_6_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_55)) 
    rom_1_6_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_6_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_57)) 
    rom_1_6_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_6_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_59)) 
    rom_1_6_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_6_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_60)) 
    rom_1_6_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_6_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_6_62)) 
    rom_1_6_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_6_62));

  // Stage 1
    assign s_1_6_1_0 = {{2{acts_1_6_1[5]}}, acts_1_6_1} + {{2{acts_1_6_2[5]}}, acts_1_6_2} + {{2{acts_1_6_7[5]}}, acts_1_6_7} + {{2{acts_1_6_8[5]}}, acts_1_6_8};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_0), .q(s_1_6_1_0_reg));

    assign s_1_6_1_1 = {{2{acts_1_6_9[5]}}, acts_1_6_9} + {{2{acts_1_6_11[5]}}, acts_1_6_11} + {{2{acts_1_6_12[5]}}, acts_1_6_12} + {{2{acts_1_6_13[5]}}, acts_1_6_13};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_1), .q(s_1_6_1_1_reg));

    assign s_1_6_1_2 = {{2{acts_1_6_14[5]}}, acts_1_6_14} + {{2{acts_1_6_15[5]}}, acts_1_6_15} + {{2{acts_1_6_16[5]}}, acts_1_6_16} + {{2{acts_1_6_18[5]}}, acts_1_6_18};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_2), .q(s_1_6_1_2_reg));

    assign s_1_6_1_3 = {{2{acts_1_6_21[5]}}, acts_1_6_21} + {{2{acts_1_6_26[5]}}, acts_1_6_26} + {{2{acts_1_6_27[5]}}, acts_1_6_27} + {{2{acts_1_6_30[5]}}, acts_1_6_30};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_3), .q(s_1_6_1_3_reg));

    assign s_1_6_1_4 = {{2{acts_1_6_31[5]}}, acts_1_6_31} + {{2{acts_1_6_33[5]}}, acts_1_6_33} + {{2{acts_1_6_34[5]}}, acts_1_6_34} + {{2{acts_1_6_35[5]}}, acts_1_6_35};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_4), .q(s_1_6_1_4_reg));

    assign s_1_6_1_5 = {{2{acts_1_6_36[5]}}, acts_1_6_36} + {{2{acts_1_6_38[5]}}, acts_1_6_38} + {{2{acts_1_6_39[5]}}, acts_1_6_39} + {{2{acts_1_6_44[5]}}, acts_1_6_44};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_5), .q(s_1_6_1_5_reg));

    assign s_1_6_1_6 = {{2{acts_1_6_46[5]}}, acts_1_6_46} + {{2{acts_1_6_47[5]}}, acts_1_6_47} + {{2{acts_1_6_50[5]}}, acts_1_6_50} + {{2{acts_1_6_53[5]}}, acts_1_6_53};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_6), .q(s_1_6_1_6_reg));

    assign s_1_6_1_7 = {{2{acts_1_6_55[5]}}, acts_1_6_55} + {{2{acts_1_6_57[5]}}, acts_1_6_57} + {{2{acts_1_6_59[5]}}, acts_1_6_59} + {{2{acts_1_6_60[5]}}, acts_1_6_60};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_7), .q(s_1_6_1_7_reg));

    assign s_1_6_1_8 = {{2{acts_1_6_62[5]}}, acts_1_6_62};
    registers #(.ARRAY_WIDTH(8)) r_1_6_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_1_8), .q(s_1_6_1_8_reg));

  // Stage 2
    assign s_1_6_2_0 = {{2{s_1_6_1_0_reg[7]}}, s_1_6_1_0_reg} + {{2{s_1_6_1_1_reg[7]}}, s_1_6_1_1_reg} + {{2{s_1_6_1_2_reg[7]}}, s_1_6_1_2_reg} + {{2{s_1_6_1_3_reg[7]}}, s_1_6_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_6_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_2_0), .q(s_1_6_2_0_reg));

    assign s_1_6_2_1 = {{2{s_1_6_1_4_reg[7]}}, s_1_6_1_4_reg} + {{2{s_1_6_1_5_reg[7]}}, s_1_6_1_5_reg} + {{2{s_1_6_1_6_reg[7]}}, s_1_6_1_6_reg} + {{2{s_1_6_1_7_reg[7]}}, s_1_6_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_6_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_2_1), .q(s_1_6_2_1_reg));

    assign s_1_6_2_2 = {{2{s_1_6_1_8_reg[7]}}, s_1_6_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_6_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_6_2_2), .q(s_1_6_2_2_reg));

  // Stage 3
    assign sum_1_6 = {{2{s_1_6_2_0_reg[9]}}, s_1_6_2_0_reg} + {{2{s_1_6_2_1_reg[9]}}, s_1_6_2_1_reg} + {{2{s_1_6_2_2_reg[9]}}, s_1_6_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_6), .q(sum_1_6_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_6 (.i_data(sum_1_6_reg), .o_data(out_1_6_sat));


    // Layer 1, Node 7
      logic  [7:0] s_1_7_1_0, s_1_7_1_1, s_1_7_1_2, s_1_7_1_3, s_1_7_1_4, s_1_7_1_5, s_1_7_1_6, s_1_7_1_7, s_1_7_1_8;
    logic  [7:0] s_1_7_1_0_reg, s_1_7_1_1_reg, s_1_7_1_2_reg, s_1_7_1_3_reg, s_1_7_1_4_reg, s_1_7_1_5_reg, s_1_7_1_6_reg, s_1_7_1_7_reg, s_1_7_1_8_reg;
    logic  [9:0] s_1_7_2_0, s_1_7_2_1, s_1_7_2_2;
    logic  [9:0] s_1_7_2_0_reg, s_1_7_2_1_reg, s_1_7_2_2_reg;
    logic [11:0] sum_1_7;
    logic [11:0] sum_1_7_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_0)) 
    rom_1_7_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_7_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_1)) 
    rom_1_7_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_7_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_4)) 
    rom_1_7_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_7_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_9)) 
    rom_1_7_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_7_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_10)) 
    rom_1_7_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_7_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_11)) 
    rom_1_7_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_7_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_13)) 
    rom_1_7_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_7_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_14)) 
    rom_1_7_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_7_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_16)) 
    rom_1_7_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_7_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_18)) 
    rom_1_7_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_7_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_20)) 
    rom_1_7_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_7_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_21)) 
    rom_1_7_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_7_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_24)) 
    rom_1_7_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_7_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_25)) 
    rom_1_7_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_7_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_26)) 
    rom_1_7_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_7_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_28)) 
    rom_1_7_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_7_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_30)) 
    rom_1_7_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_7_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_31)) 
    rom_1_7_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_7_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_33)) 
    rom_1_7_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_7_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_35)) 
    rom_1_7_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_7_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_36)) 
    rom_1_7_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_7_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_38)) 
    rom_1_7_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_7_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_39)) 
    rom_1_7_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_7_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_41)) 
    rom_1_7_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_7_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_45)) 
    rom_1_7_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_7_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_47)) 
    rom_1_7_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_7_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_49)) 
    rom_1_7_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_7_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_50)) 
    rom_1_7_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_7_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_53)) 
    rom_1_7_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_7_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_54)) 
    rom_1_7_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_7_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_55)) 
    rom_1_7_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_7_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_58)) 
    rom_1_7_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_7_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_59)) 
    rom_1_7_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_7_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_60)) 
    rom_1_7_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_7_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_7_63)) 
    rom_1_7_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_7_63));

  // Stage 1
    assign s_1_7_1_0 = {{2{acts_1_7_0[5]}}, acts_1_7_0} + {{2{acts_1_7_1[5]}}, acts_1_7_1} + {{2{acts_1_7_4[5]}}, acts_1_7_4} + {{2{acts_1_7_9[5]}}, acts_1_7_9};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_0), .q(s_1_7_1_0_reg));

    assign s_1_7_1_1 = {{2{acts_1_7_10[5]}}, acts_1_7_10} + {{2{acts_1_7_11[5]}}, acts_1_7_11} + {{2{acts_1_7_13[5]}}, acts_1_7_13} + {{2{acts_1_7_14[5]}}, acts_1_7_14};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_1), .q(s_1_7_1_1_reg));

    assign s_1_7_1_2 = {{2{acts_1_7_16[5]}}, acts_1_7_16} + {{2{acts_1_7_18[5]}}, acts_1_7_18} + {{2{acts_1_7_20[5]}}, acts_1_7_20} + {{2{acts_1_7_21[5]}}, acts_1_7_21};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_2), .q(s_1_7_1_2_reg));

    assign s_1_7_1_3 = {{2{acts_1_7_24[5]}}, acts_1_7_24} + {{2{acts_1_7_25[5]}}, acts_1_7_25} + {{2{acts_1_7_26[5]}}, acts_1_7_26} + {{2{acts_1_7_28[5]}}, acts_1_7_28};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_3), .q(s_1_7_1_3_reg));

    assign s_1_7_1_4 = {{2{acts_1_7_30[5]}}, acts_1_7_30} + {{2{acts_1_7_31[5]}}, acts_1_7_31} + {{2{acts_1_7_33[5]}}, acts_1_7_33} + {{2{acts_1_7_35[5]}}, acts_1_7_35};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_4), .q(s_1_7_1_4_reg));

    assign s_1_7_1_5 = {{2{acts_1_7_36[5]}}, acts_1_7_36} + {{2{acts_1_7_38[5]}}, acts_1_7_38} + {{2{acts_1_7_39[5]}}, acts_1_7_39} + {{2{acts_1_7_41[5]}}, acts_1_7_41};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_5), .q(s_1_7_1_5_reg));

    assign s_1_7_1_6 = {{2{acts_1_7_45[5]}}, acts_1_7_45} + {{2{acts_1_7_47[5]}}, acts_1_7_47} + {{2{acts_1_7_49[5]}}, acts_1_7_49} + {{2{acts_1_7_50[5]}}, acts_1_7_50};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_6), .q(s_1_7_1_6_reg));

    assign s_1_7_1_7 = {{2{acts_1_7_53[5]}}, acts_1_7_53} + {{2{acts_1_7_54[5]}}, acts_1_7_54} + {{2{acts_1_7_55[5]}}, acts_1_7_55} + {{2{acts_1_7_58[5]}}, acts_1_7_58};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_7), .q(s_1_7_1_7_reg));

    assign s_1_7_1_8 = {{2{acts_1_7_59[5]}}, acts_1_7_59} + {{2{acts_1_7_60[5]}}, acts_1_7_60} + {{2{acts_1_7_63[5]}}, acts_1_7_63};
    registers #(.ARRAY_WIDTH(8)) r_1_7_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_1_8), .q(s_1_7_1_8_reg));

  // Stage 2
    assign s_1_7_2_0 = {{2{s_1_7_1_0_reg[7]}}, s_1_7_1_0_reg} + {{2{s_1_7_1_1_reg[7]}}, s_1_7_1_1_reg} + {{2{s_1_7_1_2_reg[7]}}, s_1_7_1_2_reg} + {{2{s_1_7_1_3_reg[7]}}, s_1_7_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_7_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_2_0), .q(s_1_7_2_0_reg));

    assign s_1_7_2_1 = {{2{s_1_7_1_4_reg[7]}}, s_1_7_1_4_reg} + {{2{s_1_7_1_5_reg[7]}}, s_1_7_1_5_reg} + {{2{s_1_7_1_6_reg[7]}}, s_1_7_1_6_reg} + {{2{s_1_7_1_7_reg[7]}}, s_1_7_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_7_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_2_1), .q(s_1_7_2_1_reg));

    assign s_1_7_2_2 = {{2{s_1_7_1_8_reg[7]}}, s_1_7_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_7_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_7_2_2), .q(s_1_7_2_2_reg));

  // Stage 3
    assign sum_1_7 = {{2{s_1_7_2_0_reg[9]}}, s_1_7_2_0_reg} + {{2{s_1_7_2_1_reg[9]}}, s_1_7_2_1_reg} + {{2{s_1_7_2_2_reg[9]}}, s_1_7_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_7), .q(sum_1_7_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_7 (.i_data(sum_1_7_reg), .o_data(out_1_7_sat));


    // Layer 1, Node 8
      logic  [7:0] s_1_8_1_0, s_1_8_1_1, s_1_8_1_2, s_1_8_1_3, s_1_8_1_4, s_1_8_1_5, s_1_8_1_6;
    logic  [7:0] s_1_8_1_0_reg, s_1_8_1_1_reg, s_1_8_1_2_reg, s_1_8_1_3_reg, s_1_8_1_4_reg, s_1_8_1_5_reg, s_1_8_1_6_reg;
    logic  [9:0] s_1_8_2_0, s_1_8_2_1;
    logic  [9:0] s_1_8_2_0_reg, s_1_8_2_1_reg;
    logic [11:0] sum_1_8;
    logic [11:0] sum_1_8_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_3)) 
    rom_1_8_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_8_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_6)) 
    rom_1_8_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_8_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_8)) 
    rom_1_8_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_8_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_9)) 
    rom_1_8_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_8_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_10)) 
    rom_1_8_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_8_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_14)) 
    rom_1_8_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_8_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_15)) 
    rom_1_8_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_8_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_16)) 
    rom_1_8_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_8_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_19)) 
    rom_1_8_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_8_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_20)) 
    rom_1_8_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_8_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_21)) 
    rom_1_8_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_8_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_25)) 
    rom_1_8_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_8_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_27)) 
    rom_1_8_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_8_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_30)) 
    rom_1_8_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_8_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_36)) 
    rom_1_8_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_8_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_37)) 
    rom_1_8_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_8_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_39)) 
    rom_1_8_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_8_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_40)) 
    rom_1_8_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_8_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_41)) 
    rom_1_8_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_8_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_42)) 
    rom_1_8_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_8_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_43)) 
    rom_1_8_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_8_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_46)) 
    rom_1_8_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_8_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_52)) 
    rom_1_8_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_8_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_53)) 
    rom_1_8_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_8_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_54)) 
    rom_1_8_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_8_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_55)) 
    rom_1_8_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_8_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_60)) 
    rom_1_8_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_8_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_8_61)) 
    rom_1_8_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_8_61));

  // Stage 1
    assign s_1_8_1_0 = {{2{acts_1_8_3[5]}}, acts_1_8_3} + {{2{acts_1_8_6[5]}}, acts_1_8_6} + {{2{acts_1_8_8[5]}}, acts_1_8_8} + {{2{acts_1_8_9[5]}}, acts_1_8_9};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_0), .q(s_1_8_1_0_reg));

    assign s_1_8_1_1 = {{2{acts_1_8_10[5]}}, acts_1_8_10} + {{2{acts_1_8_14[5]}}, acts_1_8_14} + {{2{acts_1_8_15[5]}}, acts_1_8_15} + {{2{acts_1_8_16[5]}}, acts_1_8_16};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_1), .q(s_1_8_1_1_reg));

    assign s_1_8_1_2 = {{2{acts_1_8_19[5]}}, acts_1_8_19} + {{2{acts_1_8_20[5]}}, acts_1_8_20} + {{2{acts_1_8_21[5]}}, acts_1_8_21} + {{2{acts_1_8_25[5]}}, acts_1_8_25};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_2), .q(s_1_8_1_2_reg));

    assign s_1_8_1_3 = {{2{acts_1_8_27[5]}}, acts_1_8_27} + {{2{acts_1_8_30[5]}}, acts_1_8_30} + {{2{acts_1_8_36[5]}}, acts_1_8_36} + {{2{acts_1_8_37[5]}}, acts_1_8_37};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_3), .q(s_1_8_1_3_reg));

    assign s_1_8_1_4 = {{2{acts_1_8_39[5]}}, acts_1_8_39} + {{2{acts_1_8_40[5]}}, acts_1_8_40} + {{2{acts_1_8_41[5]}}, acts_1_8_41} + {{2{acts_1_8_42[5]}}, acts_1_8_42};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_4), .q(s_1_8_1_4_reg));

    assign s_1_8_1_5 = {{2{acts_1_8_43[5]}}, acts_1_8_43} + {{2{acts_1_8_46[5]}}, acts_1_8_46} + {{2{acts_1_8_52[5]}}, acts_1_8_52} + {{2{acts_1_8_53[5]}}, acts_1_8_53};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_5), .q(s_1_8_1_5_reg));

    assign s_1_8_1_6 = {{2{acts_1_8_54[5]}}, acts_1_8_54} + {{2{acts_1_8_55[5]}}, acts_1_8_55} + {{2{acts_1_8_60[5]}}, acts_1_8_60} + {{2{acts_1_8_61[5]}}, acts_1_8_61};
    registers #(.ARRAY_WIDTH(8)) r_1_8_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_1_6), .q(s_1_8_1_6_reg));

  // Stage 2
    assign s_1_8_2_0 = {{2{s_1_8_1_0_reg[7]}}, s_1_8_1_0_reg} + {{2{s_1_8_1_1_reg[7]}}, s_1_8_1_1_reg} + {{2{s_1_8_1_2_reg[7]}}, s_1_8_1_2_reg} + {{2{s_1_8_1_3_reg[7]}}, s_1_8_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_8_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_2_0), .q(s_1_8_2_0_reg));

    assign s_1_8_2_1 = {{2{s_1_8_1_4_reg[7]}}, s_1_8_1_4_reg} + {{2{s_1_8_1_5_reg[7]}}, s_1_8_1_5_reg} + {{2{s_1_8_1_6_reg[7]}}, s_1_8_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_8_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_8_2_1), .q(s_1_8_2_1_reg));

  // Stage 3
    assign sum_1_8 = {{2{s_1_8_2_0_reg[9]}}, s_1_8_2_0_reg} + {{2{s_1_8_2_1_reg[9]}}, s_1_8_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_8), .q(sum_1_8_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_8 (.i_data(sum_1_8_reg), .o_data(out_1_8_sat));


    // Layer 1, Node 9
      logic  [7:0] s_1_9_1_0, s_1_9_1_1, s_1_9_1_2, s_1_9_1_3, s_1_9_1_4, s_1_9_1_5, s_1_9_1_6, s_1_9_1_7;
    logic  [7:0] s_1_9_1_0_reg, s_1_9_1_1_reg, s_1_9_1_2_reg, s_1_9_1_3_reg, s_1_9_1_4_reg, s_1_9_1_5_reg, s_1_9_1_6_reg, s_1_9_1_7_reg;
    logic  [9:0] s_1_9_2_0, s_1_9_2_1;
    logic  [9:0] s_1_9_2_0_reg, s_1_9_2_1_reg;
    logic [11:0] sum_1_9;
    logic [11:0] sum_1_9_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_1)) 
    rom_1_9_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_9_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_2)) 
    rom_1_9_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_9_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_3)) 
    rom_1_9_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_9_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_5)) 
    rom_1_9_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_9_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_8)) 
    rom_1_9_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_9_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_9)) 
    rom_1_9_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_9_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_10)) 
    rom_1_9_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_9_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_12)) 
    rom_1_9_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_9_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_13)) 
    rom_1_9_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_9_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_14)) 
    rom_1_9_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_9_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_15)) 
    rom_1_9_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_9_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_16)) 
    rom_1_9_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_9_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_17)) 
    rom_1_9_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_9_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_19)) 
    rom_1_9_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_9_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_24)) 
    rom_1_9_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_9_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_25)) 
    rom_1_9_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_9_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_31)) 
    rom_1_9_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_9_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_36)) 
    rom_1_9_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_9_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_38)) 
    rom_1_9_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_9_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_39)) 
    rom_1_9_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_9_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_41)) 
    rom_1_9_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_9_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_51)) 
    rom_1_9_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_9_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_52)) 
    rom_1_9_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_9_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_54)) 
    rom_1_9_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_9_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_55)) 
    rom_1_9_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_9_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_58)) 
    rom_1_9_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_9_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_59)) 
    rom_1_9_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_9_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_60)) 
    rom_1_9_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_9_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_9_62)) 
    rom_1_9_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_9_62));

  // Stage 1
    assign s_1_9_1_0 = {{2{acts_1_9_1[5]}}, acts_1_9_1} + {{2{acts_1_9_2[5]}}, acts_1_9_2} + {{2{acts_1_9_3[5]}}, acts_1_9_3} + {{2{acts_1_9_5[5]}}, acts_1_9_5};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_0), .q(s_1_9_1_0_reg));

    assign s_1_9_1_1 = {{2{acts_1_9_8[5]}}, acts_1_9_8} + {{2{acts_1_9_9[5]}}, acts_1_9_9} + {{2{acts_1_9_10[5]}}, acts_1_9_10} + {{2{acts_1_9_12[5]}}, acts_1_9_12};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_1), .q(s_1_9_1_1_reg));

    assign s_1_9_1_2 = {{2{acts_1_9_13[5]}}, acts_1_9_13} + {{2{acts_1_9_14[5]}}, acts_1_9_14} + {{2{acts_1_9_15[5]}}, acts_1_9_15} + {{2{acts_1_9_16[5]}}, acts_1_9_16};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_2), .q(s_1_9_1_2_reg));

    assign s_1_9_1_3 = {{2{acts_1_9_17[5]}}, acts_1_9_17} + {{2{acts_1_9_19[5]}}, acts_1_9_19} + {{2{acts_1_9_24[5]}}, acts_1_9_24} + {{2{acts_1_9_25[5]}}, acts_1_9_25};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_3), .q(s_1_9_1_3_reg));

    assign s_1_9_1_4 = {{2{acts_1_9_31[5]}}, acts_1_9_31} + {{2{acts_1_9_36[5]}}, acts_1_9_36} + {{2{acts_1_9_38[5]}}, acts_1_9_38} + {{2{acts_1_9_39[5]}}, acts_1_9_39};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_4), .q(s_1_9_1_4_reg));

    assign s_1_9_1_5 = {{2{acts_1_9_41[5]}}, acts_1_9_41} + {{2{acts_1_9_51[5]}}, acts_1_9_51} + {{2{acts_1_9_52[5]}}, acts_1_9_52} + {{2{acts_1_9_54[5]}}, acts_1_9_54};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_5), .q(s_1_9_1_5_reg));

    assign s_1_9_1_6 = {{2{acts_1_9_55[5]}}, acts_1_9_55} + {{2{acts_1_9_58[5]}}, acts_1_9_58} + {{2{acts_1_9_59[5]}}, acts_1_9_59} + {{2{acts_1_9_60[5]}}, acts_1_9_60};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_6), .q(s_1_9_1_6_reg));

    assign s_1_9_1_7 = {{2{acts_1_9_62[5]}}, acts_1_9_62};
    registers #(.ARRAY_WIDTH(8)) r_1_9_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_1_7), .q(s_1_9_1_7_reg));

  // Stage 2
    assign s_1_9_2_0 = {{2{s_1_9_1_0_reg[7]}}, s_1_9_1_0_reg} + {{2{s_1_9_1_1_reg[7]}}, s_1_9_1_1_reg} + {{2{s_1_9_1_2_reg[7]}}, s_1_9_1_2_reg} + {{2{s_1_9_1_3_reg[7]}}, s_1_9_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_9_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_2_0), .q(s_1_9_2_0_reg));

    assign s_1_9_2_1 = {{2{s_1_9_1_4_reg[7]}}, s_1_9_1_4_reg} + {{2{s_1_9_1_5_reg[7]}}, s_1_9_1_5_reg} + {{2{s_1_9_1_6_reg[7]}}, s_1_9_1_6_reg} + {{2{s_1_9_1_7_reg[7]}}, s_1_9_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_9_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_9_2_1), .q(s_1_9_2_1_reg));

  // Stage 3
    assign sum_1_9 = {{2{s_1_9_2_0_reg[9]}}, s_1_9_2_0_reg} + {{2{s_1_9_2_1_reg[9]}}, s_1_9_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_9), .q(sum_1_9_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_9 (.i_data(sum_1_9_reg), .o_data(out_1_9_sat));


    // Layer 1, Node 10
      logic  [7:0] s_1_10_1_0, s_1_10_1_1, s_1_10_1_2, s_1_10_1_3, s_1_10_1_4, s_1_10_1_5, s_1_10_1_6, s_1_10_1_7;
    logic  [7:0] s_1_10_1_0_reg, s_1_10_1_1_reg, s_1_10_1_2_reg, s_1_10_1_3_reg, s_1_10_1_4_reg, s_1_10_1_5_reg, s_1_10_1_6_reg, s_1_10_1_7_reg;
    logic  [9:0] s_1_10_2_0, s_1_10_2_1;
    logic  [9:0] s_1_10_2_0_reg, s_1_10_2_1_reg;
    logic [11:0] sum_1_10;
    logic [11:0] sum_1_10_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_0)) 
    rom_1_10_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_10_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_2)) 
    rom_1_10_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_10_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_4)) 
    rom_1_10_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_10_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_5)) 
    rom_1_10_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_10_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_6)) 
    rom_1_10_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_10_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_7)) 
    rom_1_10_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_10_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_9)) 
    rom_1_10_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_10_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_11)) 
    rom_1_10_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_10_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_12)) 
    rom_1_10_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_10_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_13)) 
    rom_1_10_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_10_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_17)) 
    rom_1_10_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_10_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_20)) 
    rom_1_10_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_10_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_23)) 
    rom_1_10_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_10_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_24)) 
    rom_1_10_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_10_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_26)) 
    rom_1_10_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_10_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_29)) 
    rom_1_10_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_10_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_30)) 
    rom_1_10_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_10_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_38)) 
    rom_1_10_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_10_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_39)) 
    rom_1_10_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_10_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_40)) 
    rom_1_10_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_10_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_41)) 
    rom_1_10_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_10_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_42)) 
    rom_1_10_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_10_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_45)) 
    rom_1_10_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_10_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_46)) 
    rom_1_10_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_10_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_50)) 
    rom_1_10_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_10_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_52)) 
    rom_1_10_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_10_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_54)) 
    rom_1_10_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_10_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_55)) 
    rom_1_10_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_10_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_56)) 
    rom_1_10_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_10_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_57)) 
    rom_1_10_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_10_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_60)) 
    rom_1_10_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_10_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_10_61)) 
    rom_1_10_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_10_61));

  // Stage 1
    assign s_1_10_1_0 = {{2{acts_1_10_0[5]}}, acts_1_10_0} + {{2{acts_1_10_2[5]}}, acts_1_10_2} + {{2{acts_1_10_4[5]}}, acts_1_10_4} + {{2{acts_1_10_5[5]}}, acts_1_10_5};
    registers #(.ARRAY_WIDTH(8)) r_1_10_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_10_1_0), .q(s_1_10_1_0_reg));

    assign s_1_10_1_1 = {{2{acts_1_10_6[5]}}, acts_1_10_6} + {{2{acts_1_10_7[5]}}, acts_1_10_7} + {{2{acts_1_10_9[5]}}, acts_1_10_9} + {{2{acts_1_10_11[5]}}, acts_1_10_11};
    registers #(.ARRAY_WIDTH(8)) r_1_10_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_10_1_1), .q(s_1_10_1_1_reg));

    assign s_1_10_1_2 = {{2{acts_1_10_12[5]}}, acts_1_10_12} + {{2{acts_1_10_13[5]}}, acts_1_10_13} + {{2{acts_1_10_17[5]}}, acts_1_10_17} + {{2{acts_1_10_20[5]}}, acts_1_10_20};
    registers #(.ARRAY_WIDTH(8)) r_1_10_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_10_1_2), .q(s_1_10_1_2_reg));

    assign s_1_10_1_3 = {{2{acts_1_10_23[5]}}, acts_1_10_23} + {{2{acts_1_10_24[5]}}, acts_1_10_24} + {{2{acts_1_10_26[5]}}, acts_1_10_26} + {{2{acts_1_10_29[5]}}, acts_1_10_29};
    registers #(.ARRAY_WIDTH(8)) r_1_10_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_10_1_3), .q(s_1_10_1_3_reg));

    assign s_1_10_1_4 = {{2{acts_1_10_30[5]}}, acts_1_10_30} + {{2{acts_1_10_38[5]}}, acts_1_10_38} + {{2{acts_1_10_39[5]}}, acts_1_10_39} + {{2{acts_1_10_40[5]}}, acts_1_10_40};
    registers #(.ARRAY_WIDTH(8)) r_1_10_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_10_1_4), .q(s_1_10_1_4_reg));

    assign s_1_10_1_5 = {{2{acts_1_10_41[5]}}, acts_1_10_41} + {{2{acts_1_10_42[5]}}, acts_1_10_42} + {{2{acts_1_10_45[5]}}, acts_1_10_45} + {{2{acts_1_10_46[5]}}, acts_1_10_46};
    registers #(.ARRAY_WIDTH(8)) r_1_10_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_10_1_5), .q(s_1_10_1_5_reg));

    assign s_1_10_1_6 = {{2{acts_1_10_50[5]}}, acts_1_10_50} + {{2{acts_1_10_52[5]}}, acts_1_10_52} + {{2{acts_1_10_54[5]}}, acts_1_10_54} + {{2{acts_1_10_55[5]}}, acts_1_10_55};
    registers #(.ARRAY_WIDTH(8)) r_1_10_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_10_1_6), .q(s_1_10_1_6_reg));

    assign s_1_10_1_7 = {{2{acts_1_10_56[5]}}, acts_1_10_56} + {{2{acts_1_10_57[5]}}, acts_1_10_57} + {{2{acts_1_10_60[5]}}, acts_1_10_60} + {{2{acts_1_10_61[5]}}, acts_1_10_61};
    registers #(.ARRAY_WIDTH(8)) r_1_10_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_10_1_7), .q(s_1_10_1_7_reg));

  // Stage 2
    assign s_1_10_2_0 = {{2{s_1_10_1_0_reg[7]}}, s_1_10_1_0_reg} + {{2{s_1_10_1_1_reg[7]}}, s_1_10_1_1_reg} + {{2{s_1_10_1_2_reg[7]}}, s_1_10_1_2_reg} + {{2{s_1_10_1_3_reg[7]}}, s_1_10_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_10_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_10_2_0), .q(s_1_10_2_0_reg));

    assign s_1_10_2_1 = {{2{s_1_10_1_4_reg[7]}}, s_1_10_1_4_reg} + {{2{s_1_10_1_5_reg[7]}}, s_1_10_1_5_reg} + {{2{s_1_10_1_6_reg[7]}}, s_1_10_1_6_reg} + {{2{s_1_10_1_7_reg[7]}}, s_1_10_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_10_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_10_2_1), .q(s_1_10_2_1_reg));

  // Stage 3
    assign sum_1_10 = {{2{s_1_10_2_0_reg[9]}}, s_1_10_2_0_reg} + {{2{s_1_10_2_1_reg[9]}}, s_1_10_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_10), .q(sum_1_10_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_10 (.i_data(sum_1_10_reg), .o_data(out_1_10_sat));


    // Layer 1, Node 11
      logic  [7:0] s_1_11_1_0, s_1_11_1_1, s_1_11_1_2, s_1_11_1_3, s_1_11_1_4, s_1_11_1_5, s_1_11_1_6, s_1_11_1_7;
    logic  [7:0] s_1_11_1_0_reg, s_1_11_1_1_reg, s_1_11_1_2_reg, s_1_11_1_3_reg, s_1_11_1_4_reg, s_1_11_1_5_reg, s_1_11_1_6_reg, s_1_11_1_7_reg;
    logic  [9:0] s_1_11_2_0, s_1_11_2_1;
    logic  [9:0] s_1_11_2_0_reg, s_1_11_2_1_reg;
    logic [11:0] sum_1_11;
    logic [11:0] sum_1_11_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_0)) 
    rom_1_11_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_11_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_2)) 
    rom_1_11_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_11_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_3)) 
    rom_1_11_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_11_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_4)) 
    rom_1_11_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_11_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_5)) 
    rom_1_11_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_11_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_6)) 
    rom_1_11_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_11_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_8)) 
    rom_1_11_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_11_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_9)) 
    rom_1_11_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_11_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_10)) 
    rom_1_11_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_11_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_11)) 
    rom_1_11_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_11_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_12)) 
    rom_1_11_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_11_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_14)) 
    rom_1_11_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_11_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_15)) 
    rom_1_11_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_11_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_18)) 
    rom_1_11_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_11_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_20)) 
    rom_1_11_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_11_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_21)) 
    rom_1_11_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_11_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_25)) 
    rom_1_11_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_11_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_27)) 
    rom_1_11_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_11_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_28)) 
    rom_1_11_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_11_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_32)) 
    rom_1_11_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_11_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_33)) 
    rom_1_11_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_11_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_34)) 
    rom_1_11_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_11_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_36)) 
    rom_1_11_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_11_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_37)) 
    rom_1_11_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_11_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_43)) 
    rom_1_11_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_11_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_50)) 
    rom_1_11_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_11_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_52)) 
    rom_1_11_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_11_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_55)) 
    rom_1_11_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_11_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_62)) 
    rom_1_11_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_11_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_11_63)) 
    rom_1_11_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_11_63));

  // Stage 1
    assign s_1_11_1_0 = {{2{acts_1_11_0[5]}}, acts_1_11_0} + {{2{acts_1_11_2[5]}}, acts_1_11_2} + {{2{acts_1_11_3[5]}}, acts_1_11_3} + {{2{acts_1_11_4[5]}}, acts_1_11_4};
    registers #(.ARRAY_WIDTH(8)) r_1_11_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_11_1_0), .q(s_1_11_1_0_reg));

    assign s_1_11_1_1 = {{2{acts_1_11_5[5]}}, acts_1_11_5} + {{2{acts_1_11_6[5]}}, acts_1_11_6} + {{2{acts_1_11_8[5]}}, acts_1_11_8} + {{2{acts_1_11_9[5]}}, acts_1_11_9};
    registers #(.ARRAY_WIDTH(8)) r_1_11_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_11_1_1), .q(s_1_11_1_1_reg));

    assign s_1_11_1_2 = {{2{acts_1_11_10[5]}}, acts_1_11_10} + {{2{acts_1_11_11[5]}}, acts_1_11_11} + {{2{acts_1_11_12[5]}}, acts_1_11_12} + {{2{acts_1_11_14[5]}}, acts_1_11_14};
    registers #(.ARRAY_WIDTH(8)) r_1_11_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_11_1_2), .q(s_1_11_1_2_reg));

    assign s_1_11_1_3 = {{2{acts_1_11_15[5]}}, acts_1_11_15} + {{2{acts_1_11_18[5]}}, acts_1_11_18} + {{2{acts_1_11_20[5]}}, acts_1_11_20} + {{2{acts_1_11_21[5]}}, acts_1_11_21};
    registers #(.ARRAY_WIDTH(8)) r_1_11_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_11_1_3), .q(s_1_11_1_3_reg));

    assign s_1_11_1_4 = {{2{acts_1_11_25[5]}}, acts_1_11_25} + {{2{acts_1_11_27[5]}}, acts_1_11_27} + {{2{acts_1_11_28[5]}}, acts_1_11_28} + {{2{acts_1_11_32[5]}}, acts_1_11_32};
    registers #(.ARRAY_WIDTH(8)) r_1_11_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_11_1_4), .q(s_1_11_1_4_reg));

    assign s_1_11_1_5 = {{2{acts_1_11_33[5]}}, acts_1_11_33} + {{2{acts_1_11_34[5]}}, acts_1_11_34} + {{2{acts_1_11_36[5]}}, acts_1_11_36} + {{2{acts_1_11_37[5]}}, acts_1_11_37};
    registers #(.ARRAY_WIDTH(8)) r_1_11_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_11_1_5), .q(s_1_11_1_5_reg));

    assign s_1_11_1_6 = {{2{acts_1_11_43[5]}}, acts_1_11_43} + {{2{acts_1_11_50[5]}}, acts_1_11_50} + {{2{acts_1_11_52[5]}}, acts_1_11_52} + {{2{acts_1_11_55[5]}}, acts_1_11_55};
    registers #(.ARRAY_WIDTH(8)) r_1_11_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_11_1_6), .q(s_1_11_1_6_reg));

    assign s_1_11_1_7 = {{2{acts_1_11_62[5]}}, acts_1_11_62} + {{2{acts_1_11_63[5]}}, acts_1_11_63};
    registers #(.ARRAY_WIDTH(8)) r_1_11_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_11_1_7), .q(s_1_11_1_7_reg));

  // Stage 2
    assign s_1_11_2_0 = {{2{s_1_11_1_0_reg[7]}}, s_1_11_1_0_reg} + {{2{s_1_11_1_1_reg[7]}}, s_1_11_1_1_reg} + {{2{s_1_11_1_2_reg[7]}}, s_1_11_1_2_reg} + {{2{s_1_11_1_3_reg[7]}}, s_1_11_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_11_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_11_2_0), .q(s_1_11_2_0_reg));

    assign s_1_11_2_1 = {{2{s_1_11_1_4_reg[7]}}, s_1_11_1_4_reg} + {{2{s_1_11_1_5_reg[7]}}, s_1_11_1_5_reg} + {{2{s_1_11_1_6_reg[7]}}, s_1_11_1_6_reg} + {{2{s_1_11_1_7_reg[7]}}, s_1_11_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_11_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_11_2_1), .q(s_1_11_2_1_reg));

  // Stage 3
    assign sum_1_11 = {{2{s_1_11_2_0_reg[9]}}, s_1_11_2_0_reg} + {{2{s_1_11_2_1_reg[9]}}, s_1_11_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_11), .q(sum_1_11_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_11 (.i_data(sum_1_11_reg), .o_data(out_1_11_sat));


    // Layer 1, Node 12
      logic  [7:0] s_1_12_1_0, s_1_12_1_1, s_1_12_1_2, s_1_12_1_3, s_1_12_1_4, s_1_12_1_5, s_1_12_1_6, s_1_12_1_7, s_1_12_1_8, s_1_12_1_9;
    logic  [7:0] s_1_12_1_0_reg, s_1_12_1_1_reg, s_1_12_1_2_reg, s_1_12_1_3_reg, s_1_12_1_4_reg, s_1_12_1_5_reg, s_1_12_1_6_reg, s_1_12_1_7_reg, s_1_12_1_8_reg, s_1_12_1_9_reg;
    logic  [9:0] s_1_12_2_0, s_1_12_2_1, s_1_12_2_2;
    logic  [9:0] s_1_12_2_0_reg, s_1_12_2_1_reg, s_1_12_2_2_reg;
    logic [11:0] sum_1_12;
    logic [11:0] sum_1_12_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_2)) 
    rom_1_12_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_12_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_3)) 
    rom_1_12_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_12_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_7)) 
    rom_1_12_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_12_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_8)) 
    rom_1_12_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_12_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_12)) 
    rom_1_12_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_12_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_13)) 
    rom_1_12_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_12_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_14)) 
    rom_1_12_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_12_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_17)) 
    rom_1_12_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_12_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_18)) 
    rom_1_12_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_12_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_22)) 
    rom_1_12_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_12_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_23)) 
    rom_1_12_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_12_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_25)) 
    rom_1_12_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_12_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_26)) 
    rom_1_12_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_12_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_27)) 
    rom_1_12_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_12_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_28)) 
    rom_1_12_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_12_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_30)) 
    rom_1_12_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_12_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_32)) 
    rom_1_12_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_12_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_33)) 
    rom_1_12_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_12_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_34)) 
    rom_1_12_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_12_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_36)) 
    rom_1_12_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_12_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_37)) 
    rom_1_12_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_12_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_39)) 
    rom_1_12_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_12_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_43)) 
    rom_1_12_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_12_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_44)) 
    rom_1_12_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_12_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_46)) 
    rom_1_12_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_12_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_47)) 
    rom_1_12_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_12_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_49)) 
    rom_1_12_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_12_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_50)) 
    rom_1_12_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_12_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_51)) 
    rom_1_12_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_12_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_52)) 
    rom_1_12_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_12_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_53)) 
    rom_1_12_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_12_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_54)) 
    rom_1_12_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_12_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_55)) 
    rom_1_12_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_12_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_57)) 
    rom_1_12_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_12_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_59)) 
    rom_1_12_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_12_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_62)) 
    rom_1_12_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_12_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_12_63)) 
    rom_1_12_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_12_63));

  // Stage 1
    assign s_1_12_1_0 = {{2{acts_1_12_2[5]}}, acts_1_12_2} + {{2{acts_1_12_3[5]}}, acts_1_12_3} + {{2{acts_1_12_7[5]}}, acts_1_12_7} + {{2{acts_1_12_8[5]}}, acts_1_12_8};
    registers #(.ARRAY_WIDTH(8)) r_1_12_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_1_0), .q(s_1_12_1_0_reg));

    assign s_1_12_1_1 = {{2{acts_1_12_12[5]}}, acts_1_12_12} + {{2{acts_1_12_13[5]}}, acts_1_12_13} + {{2{acts_1_12_14[5]}}, acts_1_12_14} + {{2{acts_1_12_17[5]}}, acts_1_12_17};
    registers #(.ARRAY_WIDTH(8)) r_1_12_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_1_1), .q(s_1_12_1_1_reg));

    assign s_1_12_1_2 = {{2{acts_1_12_18[5]}}, acts_1_12_18} + {{2{acts_1_12_22[5]}}, acts_1_12_22} + {{2{acts_1_12_23[5]}}, acts_1_12_23} + {{2{acts_1_12_25[5]}}, acts_1_12_25};
    registers #(.ARRAY_WIDTH(8)) r_1_12_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_1_2), .q(s_1_12_1_2_reg));

    assign s_1_12_1_3 = {{2{acts_1_12_26[5]}}, acts_1_12_26} + {{2{acts_1_12_27[5]}}, acts_1_12_27} + {{2{acts_1_12_28[5]}}, acts_1_12_28} + {{2{acts_1_12_30[5]}}, acts_1_12_30};
    registers #(.ARRAY_WIDTH(8)) r_1_12_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_1_3), .q(s_1_12_1_3_reg));

    assign s_1_12_1_4 = {{2{acts_1_12_32[5]}}, acts_1_12_32} + {{2{acts_1_12_33[5]}}, acts_1_12_33} + {{2{acts_1_12_34[5]}}, acts_1_12_34} + {{2{acts_1_12_36[5]}}, acts_1_12_36};
    registers #(.ARRAY_WIDTH(8)) r_1_12_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_1_4), .q(s_1_12_1_4_reg));

    assign s_1_12_1_5 = {{2{acts_1_12_37[5]}}, acts_1_12_37} + {{2{acts_1_12_39[5]}}, acts_1_12_39} + {{2{acts_1_12_43[5]}}, acts_1_12_43} + {{2{acts_1_12_44[5]}}, acts_1_12_44};
    registers #(.ARRAY_WIDTH(8)) r_1_12_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_1_5), .q(s_1_12_1_5_reg));

    assign s_1_12_1_6 = {{2{acts_1_12_46[5]}}, acts_1_12_46} + {{2{acts_1_12_47[5]}}, acts_1_12_47} + {{2{acts_1_12_49[5]}}, acts_1_12_49} + {{2{acts_1_12_50[5]}}, acts_1_12_50};
    registers #(.ARRAY_WIDTH(8)) r_1_12_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_1_6), .q(s_1_12_1_6_reg));

    assign s_1_12_1_7 = {{2{acts_1_12_51[5]}}, acts_1_12_51} + {{2{acts_1_12_52[5]}}, acts_1_12_52} + {{2{acts_1_12_53[5]}}, acts_1_12_53} + {{2{acts_1_12_54[5]}}, acts_1_12_54};
    registers #(.ARRAY_WIDTH(8)) r_1_12_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_1_7), .q(s_1_12_1_7_reg));

    assign s_1_12_1_8 = {{2{acts_1_12_55[5]}}, acts_1_12_55} + {{2{acts_1_12_57[5]}}, acts_1_12_57} + {{2{acts_1_12_59[5]}}, acts_1_12_59} + {{2{acts_1_12_62[5]}}, acts_1_12_62};
    registers #(.ARRAY_WIDTH(8)) r_1_12_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_1_8), .q(s_1_12_1_8_reg));

    assign s_1_12_1_9 = {{2{acts_1_12_63[5]}}, acts_1_12_63};
    registers #(.ARRAY_WIDTH(8)) r_1_12_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_1_9), .q(s_1_12_1_9_reg));

  // Stage 2
    assign s_1_12_2_0 = {{2{s_1_12_1_0_reg[7]}}, s_1_12_1_0_reg} + {{2{s_1_12_1_1_reg[7]}}, s_1_12_1_1_reg} + {{2{s_1_12_1_2_reg[7]}}, s_1_12_1_2_reg} + {{2{s_1_12_1_3_reg[7]}}, s_1_12_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_12_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_2_0), .q(s_1_12_2_0_reg));

    assign s_1_12_2_1 = {{2{s_1_12_1_4_reg[7]}}, s_1_12_1_4_reg} + {{2{s_1_12_1_5_reg[7]}}, s_1_12_1_5_reg} + {{2{s_1_12_1_6_reg[7]}}, s_1_12_1_6_reg} + {{2{s_1_12_1_7_reg[7]}}, s_1_12_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_12_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_2_1), .q(s_1_12_2_1_reg));

    assign s_1_12_2_2 = {{2{s_1_12_1_8_reg[7]}}, s_1_12_1_8_reg} + {{2{s_1_12_1_9_reg[7]}}, s_1_12_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_12_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_12_2_2), .q(s_1_12_2_2_reg));

  // Stage 3
    assign sum_1_12 = {{2{s_1_12_2_0_reg[9]}}, s_1_12_2_0_reg} + {{2{s_1_12_2_1_reg[9]}}, s_1_12_2_1_reg} + {{2{s_1_12_2_2_reg[9]}}, s_1_12_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_12), .q(sum_1_12_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_12 (.i_data(sum_1_12_reg), .o_data(out_1_12_sat));


    // Layer 1, Node 13
      logic  [7:0] s_1_13_1_0, s_1_13_1_1, s_1_13_1_2, s_1_13_1_3, s_1_13_1_4;
    logic  [7:0] s_1_13_1_0_reg, s_1_13_1_1_reg, s_1_13_1_2_reg, s_1_13_1_3_reg, s_1_13_1_4_reg;
    logic  [9:0] s_1_13_2_0, s_1_13_2_1;
    logic  [9:0] s_1_13_2_0_reg, s_1_13_2_1_reg;
    logic [11:0] sum_1_13;
    logic [11:0] sum_1_13_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_0)) 
    rom_1_13_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_13_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_2)) 
    rom_1_13_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_13_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_4)) 
    rom_1_13_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_13_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_9)) 
    rom_1_13_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_13_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_14)) 
    rom_1_13_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_13_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_15)) 
    rom_1_13_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_13_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_16)) 
    rom_1_13_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_13_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_18)) 
    rom_1_13_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_13_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_24)) 
    rom_1_13_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_13_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_26)) 
    rom_1_13_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_13_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_27)) 
    rom_1_13_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_13_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_28)) 
    rom_1_13_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_13_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_30)) 
    rom_1_13_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_13_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_39)) 
    rom_1_13_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_13_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_48)) 
    rom_1_13_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_13_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_52)) 
    rom_1_13_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_13_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_55)) 
    rom_1_13_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_13_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_57)) 
    rom_1_13_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_13_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_13_63)) 
    rom_1_13_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_13_63));

  // Stage 1
    assign s_1_13_1_0 = {{2{acts_1_13_0[5]}}, acts_1_13_0} + {{2{acts_1_13_2[5]}}, acts_1_13_2} + {{2{acts_1_13_4[5]}}, acts_1_13_4} + {{2{acts_1_13_9[5]}}, acts_1_13_9};
    registers #(.ARRAY_WIDTH(8)) r_1_13_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_13_1_0), .q(s_1_13_1_0_reg));

    assign s_1_13_1_1 = {{2{acts_1_13_14[5]}}, acts_1_13_14} + {{2{acts_1_13_15[5]}}, acts_1_13_15} + {{2{acts_1_13_16[5]}}, acts_1_13_16} + {{2{acts_1_13_18[5]}}, acts_1_13_18};
    registers #(.ARRAY_WIDTH(8)) r_1_13_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_13_1_1), .q(s_1_13_1_1_reg));

    assign s_1_13_1_2 = {{2{acts_1_13_24[5]}}, acts_1_13_24} + {{2{acts_1_13_26[5]}}, acts_1_13_26} + {{2{acts_1_13_27[5]}}, acts_1_13_27} + {{2{acts_1_13_28[5]}}, acts_1_13_28};
    registers #(.ARRAY_WIDTH(8)) r_1_13_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_13_1_2), .q(s_1_13_1_2_reg));

    assign s_1_13_1_3 = {{2{acts_1_13_30[5]}}, acts_1_13_30} + {{2{acts_1_13_39[5]}}, acts_1_13_39} + {{2{acts_1_13_48[5]}}, acts_1_13_48} + {{2{acts_1_13_52[5]}}, acts_1_13_52};
    registers #(.ARRAY_WIDTH(8)) r_1_13_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_13_1_3), .q(s_1_13_1_3_reg));

    assign s_1_13_1_4 = {{2{acts_1_13_55[5]}}, acts_1_13_55} + {{2{acts_1_13_57[5]}}, acts_1_13_57} + {{2{acts_1_13_63[5]}}, acts_1_13_63};
    registers #(.ARRAY_WIDTH(8)) r_1_13_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_13_1_4), .q(s_1_13_1_4_reg));

  // Stage 2
    assign s_1_13_2_0 = {{2{s_1_13_1_0_reg[7]}}, s_1_13_1_0_reg} + {{2{s_1_13_1_1_reg[7]}}, s_1_13_1_1_reg} + {{2{s_1_13_1_2_reg[7]}}, s_1_13_1_2_reg} + {{2{s_1_13_1_3_reg[7]}}, s_1_13_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_13_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_13_2_0), .q(s_1_13_2_0_reg));

    assign s_1_13_2_1 = {{2{s_1_13_1_4_reg[7]}}, s_1_13_1_4_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_13_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_13_2_1), .q(s_1_13_2_1_reg));

  // Stage 3
    assign sum_1_13 = {{2{s_1_13_2_0_reg[9]}}, s_1_13_2_0_reg} + {{2{s_1_13_2_1_reg[9]}}, s_1_13_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_13), .q(sum_1_13_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_13 (.i_data(sum_1_13_reg), .o_data(out_1_13_sat));


    // Layer 1, Node 14
      logic  [7:0] s_1_14_1_0, s_1_14_1_1, s_1_14_1_2, s_1_14_1_3, s_1_14_1_4, s_1_14_1_5, s_1_14_1_6, s_1_14_1_7;
    logic  [7:0] s_1_14_1_0_reg, s_1_14_1_1_reg, s_1_14_1_2_reg, s_1_14_1_3_reg, s_1_14_1_4_reg, s_1_14_1_5_reg, s_1_14_1_6_reg, s_1_14_1_7_reg;
    logic  [9:0] s_1_14_2_0, s_1_14_2_1;
    logic  [9:0] s_1_14_2_0_reg, s_1_14_2_1_reg;
    logic [11:0] sum_1_14;
    logic [11:0] sum_1_14_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_0)) 
    rom_1_14_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_14_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_2)) 
    rom_1_14_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_14_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_4)) 
    rom_1_14_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_14_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_8)) 
    rom_1_14_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_14_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_10)) 
    rom_1_14_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_14_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_12)) 
    rom_1_14_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_14_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_14)) 
    rom_1_14_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_14_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_15)) 
    rom_1_14_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_14_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_18)) 
    rom_1_14_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_14_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_22)) 
    rom_1_14_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_14_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_24)) 
    rom_1_14_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_14_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_26)) 
    rom_1_14_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_14_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_27)) 
    rom_1_14_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_14_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_28)) 
    rom_1_14_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_14_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_29)) 
    rom_1_14_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_14_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_30)) 
    rom_1_14_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_14_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_34)) 
    rom_1_14_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_14_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_35)) 
    rom_1_14_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_14_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_39)) 
    rom_1_14_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_14_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_42)) 
    rom_1_14_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_14_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_43)) 
    rom_1_14_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_14_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_45)) 
    rom_1_14_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_14_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_46)) 
    rom_1_14_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_14_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_47)) 
    rom_1_14_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_14_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_50)) 
    rom_1_14_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_14_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_52)) 
    rom_1_14_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_14_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_53)) 
    rom_1_14_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_14_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_56)) 
    rom_1_14_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_14_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_14_58)) 
    rom_1_14_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_14_58));

  // Stage 1
    assign s_1_14_1_0 = {{2{acts_1_14_0[5]}}, acts_1_14_0} + {{2{acts_1_14_2[5]}}, acts_1_14_2} + {{2{acts_1_14_4[5]}}, acts_1_14_4} + {{2{acts_1_14_8[5]}}, acts_1_14_8};
    registers #(.ARRAY_WIDTH(8)) r_1_14_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_14_1_0), .q(s_1_14_1_0_reg));

    assign s_1_14_1_1 = {{2{acts_1_14_10[5]}}, acts_1_14_10} + {{2{acts_1_14_12[5]}}, acts_1_14_12} + {{2{acts_1_14_14[5]}}, acts_1_14_14} + {{2{acts_1_14_15[5]}}, acts_1_14_15};
    registers #(.ARRAY_WIDTH(8)) r_1_14_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_14_1_1), .q(s_1_14_1_1_reg));

    assign s_1_14_1_2 = {{2{acts_1_14_18[5]}}, acts_1_14_18} + {{2{acts_1_14_22[5]}}, acts_1_14_22} + {{2{acts_1_14_24[5]}}, acts_1_14_24} + {{2{acts_1_14_26[5]}}, acts_1_14_26};
    registers #(.ARRAY_WIDTH(8)) r_1_14_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_14_1_2), .q(s_1_14_1_2_reg));

    assign s_1_14_1_3 = {{2{acts_1_14_27[5]}}, acts_1_14_27} + {{2{acts_1_14_28[5]}}, acts_1_14_28} + {{2{acts_1_14_29[5]}}, acts_1_14_29} + {{2{acts_1_14_30[5]}}, acts_1_14_30};
    registers #(.ARRAY_WIDTH(8)) r_1_14_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_14_1_3), .q(s_1_14_1_3_reg));

    assign s_1_14_1_4 = {{2{acts_1_14_34[5]}}, acts_1_14_34} + {{2{acts_1_14_35[5]}}, acts_1_14_35} + {{2{acts_1_14_39[5]}}, acts_1_14_39} + {{2{acts_1_14_42[5]}}, acts_1_14_42};
    registers #(.ARRAY_WIDTH(8)) r_1_14_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_14_1_4), .q(s_1_14_1_4_reg));

    assign s_1_14_1_5 = {{2{acts_1_14_43[5]}}, acts_1_14_43} + {{2{acts_1_14_45[5]}}, acts_1_14_45} + {{2{acts_1_14_46[5]}}, acts_1_14_46} + {{2{acts_1_14_47[5]}}, acts_1_14_47};
    registers #(.ARRAY_WIDTH(8)) r_1_14_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_14_1_5), .q(s_1_14_1_5_reg));

    assign s_1_14_1_6 = {{2{acts_1_14_50[5]}}, acts_1_14_50} + {{2{acts_1_14_52[5]}}, acts_1_14_52} + {{2{acts_1_14_53[5]}}, acts_1_14_53} + {{2{acts_1_14_56[5]}}, acts_1_14_56};
    registers #(.ARRAY_WIDTH(8)) r_1_14_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_14_1_6), .q(s_1_14_1_6_reg));

    assign s_1_14_1_7 = {{2{acts_1_14_58[5]}}, acts_1_14_58};
    registers #(.ARRAY_WIDTH(8)) r_1_14_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_14_1_7), .q(s_1_14_1_7_reg));

  // Stage 2
    assign s_1_14_2_0 = {{2{s_1_14_1_0_reg[7]}}, s_1_14_1_0_reg} + {{2{s_1_14_1_1_reg[7]}}, s_1_14_1_1_reg} + {{2{s_1_14_1_2_reg[7]}}, s_1_14_1_2_reg} + {{2{s_1_14_1_3_reg[7]}}, s_1_14_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_14_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_14_2_0), .q(s_1_14_2_0_reg));

    assign s_1_14_2_1 = {{2{s_1_14_1_4_reg[7]}}, s_1_14_1_4_reg} + {{2{s_1_14_1_5_reg[7]}}, s_1_14_1_5_reg} + {{2{s_1_14_1_6_reg[7]}}, s_1_14_1_6_reg} + {{2{s_1_14_1_7_reg[7]}}, s_1_14_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_14_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_14_2_1), .q(s_1_14_2_1_reg));

  // Stage 3
    assign sum_1_14 = {{2{s_1_14_2_0_reg[9]}}, s_1_14_2_0_reg} + {{2{s_1_14_2_1_reg[9]}}, s_1_14_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_14), .q(sum_1_14_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_14 (.i_data(sum_1_14_reg), .o_data(out_1_14_sat));


    // Layer 1, Node 15
      logic  [7:0] s_1_15_1_0, s_1_15_1_1, s_1_15_1_2, s_1_15_1_3, s_1_15_1_4, s_1_15_1_5, s_1_15_1_6, s_1_15_1_7, s_1_15_1_8, s_1_15_1_9;
    logic  [7:0] s_1_15_1_0_reg, s_1_15_1_1_reg, s_1_15_1_2_reg, s_1_15_1_3_reg, s_1_15_1_4_reg, s_1_15_1_5_reg, s_1_15_1_6_reg, s_1_15_1_7_reg, s_1_15_1_8_reg, s_1_15_1_9_reg;
    logic  [9:0] s_1_15_2_0, s_1_15_2_1, s_1_15_2_2;
    logic  [9:0] s_1_15_2_0_reg, s_1_15_2_1_reg, s_1_15_2_2_reg;
    logic [11:0] sum_1_15;
    logic [11:0] sum_1_15_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_0)) 
    rom_1_15_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_15_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_1)) 
    rom_1_15_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_15_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_2)) 
    rom_1_15_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_15_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_3)) 
    rom_1_15_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_15_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_4)) 
    rom_1_15_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_15_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_6)) 
    rom_1_15_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_15_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_8)) 
    rom_1_15_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_15_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_9)) 
    rom_1_15_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_15_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_11)) 
    rom_1_15_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_15_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_12)) 
    rom_1_15_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_15_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_14)) 
    rom_1_15_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_15_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_15)) 
    rom_1_15_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_15_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_18)) 
    rom_1_15_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_15_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_19)) 
    rom_1_15_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_15_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_20)) 
    rom_1_15_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_15_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_22)) 
    rom_1_15_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_15_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_25)) 
    rom_1_15_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_15_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_26)) 
    rom_1_15_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_15_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_27)) 
    rom_1_15_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_15_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_30)) 
    rom_1_15_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_15_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_31)) 
    rom_1_15_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_15_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_33)) 
    rom_1_15_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_15_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_34)) 
    rom_1_15_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_15_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_36)) 
    rom_1_15_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_15_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_39)) 
    rom_1_15_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_15_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_42)) 
    rom_1_15_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_15_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_43)) 
    rom_1_15_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_15_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_44)) 
    rom_1_15_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_15_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_48)) 
    rom_1_15_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_15_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_49)) 
    rom_1_15_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_15_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_52)) 
    rom_1_15_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_15_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_55)) 
    rom_1_15_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_15_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_56)) 
    rom_1_15_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_15_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_58)) 
    rom_1_15_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_15_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_59)) 
    rom_1_15_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_15_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_60)) 
    rom_1_15_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_15_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_61)) 
    rom_1_15_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_15_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_15_63)) 
    rom_1_15_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_15_63));

  // Stage 1
    assign s_1_15_1_0 = {{2{acts_1_15_0[5]}}, acts_1_15_0} + {{2{acts_1_15_1[5]}}, acts_1_15_1} + {{2{acts_1_15_2[5]}}, acts_1_15_2} + {{2{acts_1_15_3[5]}}, acts_1_15_3};
    registers #(.ARRAY_WIDTH(8)) r_1_15_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_1_0), .q(s_1_15_1_0_reg));

    assign s_1_15_1_1 = {{2{acts_1_15_4[5]}}, acts_1_15_4} + {{2{acts_1_15_6[5]}}, acts_1_15_6} + {{2{acts_1_15_8[5]}}, acts_1_15_8} + {{2{acts_1_15_9[5]}}, acts_1_15_9};
    registers #(.ARRAY_WIDTH(8)) r_1_15_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_1_1), .q(s_1_15_1_1_reg));

    assign s_1_15_1_2 = {{2{acts_1_15_11[5]}}, acts_1_15_11} + {{2{acts_1_15_12[5]}}, acts_1_15_12} + {{2{acts_1_15_14[5]}}, acts_1_15_14} + {{2{acts_1_15_15[5]}}, acts_1_15_15};
    registers #(.ARRAY_WIDTH(8)) r_1_15_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_1_2), .q(s_1_15_1_2_reg));

    assign s_1_15_1_3 = {{2{acts_1_15_18[5]}}, acts_1_15_18} + {{2{acts_1_15_19[5]}}, acts_1_15_19} + {{2{acts_1_15_20[5]}}, acts_1_15_20} + {{2{acts_1_15_22[5]}}, acts_1_15_22};
    registers #(.ARRAY_WIDTH(8)) r_1_15_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_1_3), .q(s_1_15_1_3_reg));

    assign s_1_15_1_4 = {{2{acts_1_15_25[5]}}, acts_1_15_25} + {{2{acts_1_15_26[5]}}, acts_1_15_26} + {{2{acts_1_15_27[5]}}, acts_1_15_27} + {{2{acts_1_15_30[5]}}, acts_1_15_30};
    registers #(.ARRAY_WIDTH(8)) r_1_15_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_1_4), .q(s_1_15_1_4_reg));

    assign s_1_15_1_5 = {{2{acts_1_15_31[5]}}, acts_1_15_31} + {{2{acts_1_15_33[5]}}, acts_1_15_33} + {{2{acts_1_15_34[5]}}, acts_1_15_34} + {{2{acts_1_15_36[5]}}, acts_1_15_36};
    registers #(.ARRAY_WIDTH(8)) r_1_15_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_1_5), .q(s_1_15_1_5_reg));

    assign s_1_15_1_6 = {{2{acts_1_15_39[5]}}, acts_1_15_39} + {{2{acts_1_15_42[5]}}, acts_1_15_42} + {{2{acts_1_15_43[5]}}, acts_1_15_43} + {{2{acts_1_15_44[5]}}, acts_1_15_44};
    registers #(.ARRAY_WIDTH(8)) r_1_15_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_1_6), .q(s_1_15_1_6_reg));

    assign s_1_15_1_7 = {{2{acts_1_15_48[5]}}, acts_1_15_48} + {{2{acts_1_15_49[5]}}, acts_1_15_49} + {{2{acts_1_15_52[5]}}, acts_1_15_52} + {{2{acts_1_15_55[5]}}, acts_1_15_55};
    registers #(.ARRAY_WIDTH(8)) r_1_15_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_1_7), .q(s_1_15_1_7_reg));

    assign s_1_15_1_8 = {{2{acts_1_15_56[5]}}, acts_1_15_56} + {{2{acts_1_15_58[5]}}, acts_1_15_58} + {{2{acts_1_15_59[5]}}, acts_1_15_59} + {{2{acts_1_15_60[5]}}, acts_1_15_60};
    registers #(.ARRAY_WIDTH(8)) r_1_15_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_1_8), .q(s_1_15_1_8_reg));

    assign s_1_15_1_9 = {{2{acts_1_15_61[5]}}, acts_1_15_61} + {{2{acts_1_15_63[5]}}, acts_1_15_63};
    registers #(.ARRAY_WIDTH(8)) r_1_15_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_1_9), .q(s_1_15_1_9_reg));

  // Stage 2
    assign s_1_15_2_0 = {{2{s_1_15_1_0_reg[7]}}, s_1_15_1_0_reg} + {{2{s_1_15_1_1_reg[7]}}, s_1_15_1_1_reg} + {{2{s_1_15_1_2_reg[7]}}, s_1_15_1_2_reg} + {{2{s_1_15_1_3_reg[7]}}, s_1_15_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_15_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_2_0), .q(s_1_15_2_0_reg));

    assign s_1_15_2_1 = {{2{s_1_15_1_4_reg[7]}}, s_1_15_1_4_reg} + {{2{s_1_15_1_5_reg[7]}}, s_1_15_1_5_reg} + {{2{s_1_15_1_6_reg[7]}}, s_1_15_1_6_reg} + {{2{s_1_15_1_7_reg[7]}}, s_1_15_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_15_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_2_1), .q(s_1_15_2_1_reg));

    assign s_1_15_2_2 = {{2{s_1_15_1_8_reg[7]}}, s_1_15_1_8_reg} + {{2{s_1_15_1_9_reg[7]}}, s_1_15_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_15_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_15_2_2), .q(s_1_15_2_2_reg));

  // Stage 3
    assign sum_1_15 = {{2{s_1_15_2_0_reg[9]}}, s_1_15_2_0_reg} + {{2{s_1_15_2_1_reg[9]}}, s_1_15_2_1_reg} + {{2{s_1_15_2_2_reg[9]}}, s_1_15_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_15), .q(sum_1_15_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_15 (.i_data(sum_1_15_reg), .o_data(out_1_15_sat));


    // Layer 1, Node 16
      logic  [7:0] s_1_16_1_0, s_1_16_1_1, s_1_16_1_2, s_1_16_1_3, s_1_16_1_4, s_1_16_1_5, s_1_16_1_6, s_1_16_1_7;
    logic  [7:0] s_1_16_1_0_reg, s_1_16_1_1_reg, s_1_16_1_2_reg, s_1_16_1_3_reg, s_1_16_1_4_reg, s_1_16_1_5_reg, s_1_16_1_6_reg, s_1_16_1_7_reg;
    logic  [9:0] s_1_16_2_0, s_1_16_2_1;
    logic  [9:0] s_1_16_2_0_reg, s_1_16_2_1_reg;
    logic [11:0] sum_1_16;
    logic [11:0] sum_1_16_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_1)) 
    rom_1_16_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_16_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_3)) 
    rom_1_16_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_16_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_5)) 
    rom_1_16_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_16_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_6)) 
    rom_1_16_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_16_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_8)) 
    rom_1_16_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_16_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_9)) 
    rom_1_16_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_16_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_11)) 
    rom_1_16_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_16_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_12)) 
    rom_1_16_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_16_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_13)) 
    rom_1_16_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_16_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_14)) 
    rom_1_16_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_16_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_21)) 
    rom_1_16_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_16_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_22)) 
    rom_1_16_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_16_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_26)) 
    rom_1_16_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_16_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_30)) 
    rom_1_16_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_16_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_31)) 
    rom_1_16_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_16_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_34)) 
    rom_1_16_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_16_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_38)) 
    rom_1_16_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_16_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_39)) 
    rom_1_16_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_16_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_40)) 
    rom_1_16_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_16_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_41)) 
    rom_1_16_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_16_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_43)) 
    rom_1_16_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_16_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_45)) 
    rom_1_16_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_16_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_50)) 
    rom_1_16_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_16_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_51)) 
    rom_1_16_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_16_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_52)) 
    rom_1_16_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_16_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_54)) 
    rom_1_16_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_16_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_56)) 
    rom_1_16_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_16_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_61)) 
    rom_1_16_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_16_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_62)) 
    rom_1_16_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_16_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_16_63)) 
    rom_1_16_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_16_63));

  // Stage 1
    assign s_1_16_1_0 = {{2{acts_1_16_1[5]}}, acts_1_16_1} + {{2{acts_1_16_3[5]}}, acts_1_16_3} + {{2{acts_1_16_5[5]}}, acts_1_16_5} + {{2{acts_1_16_6[5]}}, acts_1_16_6};
    registers #(.ARRAY_WIDTH(8)) r_1_16_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_16_1_0), .q(s_1_16_1_0_reg));

    assign s_1_16_1_1 = {{2{acts_1_16_8[5]}}, acts_1_16_8} + {{2{acts_1_16_9[5]}}, acts_1_16_9} + {{2{acts_1_16_11[5]}}, acts_1_16_11} + {{2{acts_1_16_12[5]}}, acts_1_16_12};
    registers #(.ARRAY_WIDTH(8)) r_1_16_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_16_1_1), .q(s_1_16_1_1_reg));

    assign s_1_16_1_2 = {{2{acts_1_16_13[5]}}, acts_1_16_13} + {{2{acts_1_16_14[5]}}, acts_1_16_14} + {{2{acts_1_16_21[5]}}, acts_1_16_21} + {{2{acts_1_16_22[5]}}, acts_1_16_22};
    registers #(.ARRAY_WIDTH(8)) r_1_16_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_16_1_2), .q(s_1_16_1_2_reg));

    assign s_1_16_1_3 = {{2{acts_1_16_26[5]}}, acts_1_16_26} + {{2{acts_1_16_30[5]}}, acts_1_16_30} + {{2{acts_1_16_31[5]}}, acts_1_16_31} + {{2{acts_1_16_34[5]}}, acts_1_16_34};
    registers #(.ARRAY_WIDTH(8)) r_1_16_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_16_1_3), .q(s_1_16_1_3_reg));

    assign s_1_16_1_4 = {{2{acts_1_16_38[5]}}, acts_1_16_38} + {{2{acts_1_16_39[5]}}, acts_1_16_39} + {{2{acts_1_16_40[5]}}, acts_1_16_40} + {{2{acts_1_16_41[5]}}, acts_1_16_41};
    registers #(.ARRAY_WIDTH(8)) r_1_16_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_16_1_4), .q(s_1_16_1_4_reg));

    assign s_1_16_1_5 = {{2{acts_1_16_43[5]}}, acts_1_16_43} + {{2{acts_1_16_45[5]}}, acts_1_16_45} + {{2{acts_1_16_50[5]}}, acts_1_16_50} + {{2{acts_1_16_51[5]}}, acts_1_16_51};
    registers #(.ARRAY_WIDTH(8)) r_1_16_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_16_1_5), .q(s_1_16_1_5_reg));

    assign s_1_16_1_6 = {{2{acts_1_16_52[5]}}, acts_1_16_52} + {{2{acts_1_16_54[5]}}, acts_1_16_54} + {{2{acts_1_16_56[5]}}, acts_1_16_56} + {{2{acts_1_16_61[5]}}, acts_1_16_61};
    registers #(.ARRAY_WIDTH(8)) r_1_16_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_16_1_6), .q(s_1_16_1_6_reg));

    assign s_1_16_1_7 = {{2{acts_1_16_62[5]}}, acts_1_16_62} + {{2{acts_1_16_63[5]}}, acts_1_16_63};
    registers #(.ARRAY_WIDTH(8)) r_1_16_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_16_1_7), .q(s_1_16_1_7_reg));

  // Stage 2
    assign s_1_16_2_0 = {{2{s_1_16_1_0_reg[7]}}, s_1_16_1_0_reg} + {{2{s_1_16_1_1_reg[7]}}, s_1_16_1_1_reg} + {{2{s_1_16_1_2_reg[7]}}, s_1_16_1_2_reg} + {{2{s_1_16_1_3_reg[7]}}, s_1_16_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_16_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_16_2_0), .q(s_1_16_2_0_reg));

    assign s_1_16_2_1 = {{2{s_1_16_1_4_reg[7]}}, s_1_16_1_4_reg} + {{2{s_1_16_1_5_reg[7]}}, s_1_16_1_5_reg} + {{2{s_1_16_1_6_reg[7]}}, s_1_16_1_6_reg} + {{2{s_1_16_1_7_reg[7]}}, s_1_16_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_16_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_16_2_1), .q(s_1_16_2_1_reg));

  // Stage 3
    assign sum_1_16 = {{2{s_1_16_2_0_reg[9]}}, s_1_16_2_0_reg} + {{2{s_1_16_2_1_reg[9]}}, s_1_16_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_16), .q(sum_1_16_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_16 (.i_data(sum_1_16_reg), .o_data(out_1_16_sat));


    // Layer 1, Node 17
      logic  [7:0] s_1_17_1_0, s_1_17_1_1, s_1_17_1_2, s_1_17_1_3, s_1_17_1_4, s_1_17_1_5, s_1_17_1_6;
    logic  [7:0] s_1_17_1_0_reg, s_1_17_1_1_reg, s_1_17_1_2_reg, s_1_17_1_3_reg, s_1_17_1_4_reg, s_1_17_1_5_reg, s_1_17_1_6_reg;
    logic  [9:0] s_1_17_2_0, s_1_17_2_1;
    logic  [9:0] s_1_17_2_0_reg, s_1_17_2_1_reg;
    logic [11:0] sum_1_17;
    logic [11:0] sum_1_17_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_1)) 
    rom_1_17_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_17_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_2)) 
    rom_1_17_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_17_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_5)) 
    rom_1_17_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_17_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_7)) 
    rom_1_17_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_17_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_10)) 
    rom_1_17_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_17_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_11)) 
    rom_1_17_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_17_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_12)) 
    rom_1_17_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_17_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_13)) 
    rom_1_17_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_17_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_18)) 
    rom_1_17_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_17_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_19)) 
    rom_1_17_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_17_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_20)) 
    rom_1_17_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_17_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_21)) 
    rom_1_17_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_17_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_24)) 
    rom_1_17_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_17_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_28)) 
    rom_1_17_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_17_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_29)) 
    rom_1_17_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_17_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_30)) 
    rom_1_17_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_17_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_37)) 
    rom_1_17_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_17_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_39)) 
    rom_1_17_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_17_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_46)) 
    rom_1_17_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_17_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_47)) 
    rom_1_17_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_17_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_48)) 
    rom_1_17_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_17_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_50)) 
    rom_1_17_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_17_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_55)) 
    rom_1_17_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_17_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_57)) 
    rom_1_17_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_17_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_59)) 
    rom_1_17_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_17_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_60)) 
    rom_1_17_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_17_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_61)) 
    rom_1_17_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_17_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_17_63)) 
    rom_1_17_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_17_63));

  // Stage 1
    assign s_1_17_1_0 = {{2{acts_1_17_1[5]}}, acts_1_17_1} + {{2{acts_1_17_2[5]}}, acts_1_17_2} + {{2{acts_1_17_5[5]}}, acts_1_17_5} + {{2{acts_1_17_7[5]}}, acts_1_17_7};
    registers #(.ARRAY_WIDTH(8)) r_1_17_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_17_1_0), .q(s_1_17_1_0_reg));

    assign s_1_17_1_1 = {{2{acts_1_17_10[5]}}, acts_1_17_10} + {{2{acts_1_17_11[5]}}, acts_1_17_11} + {{2{acts_1_17_12[5]}}, acts_1_17_12} + {{2{acts_1_17_13[5]}}, acts_1_17_13};
    registers #(.ARRAY_WIDTH(8)) r_1_17_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_17_1_1), .q(s_1_17_1_1_reg));

    assign s_1_17_1_2 = {{2{acts_1_17_18[5]}}, acts_1_17_18} + {{2{acts_1_17_19[5]}}, acts_1_17_19} + {{2{acts_1_17_20[5]}}, acts_1_17_20} + {{2{acts_1_17_21[5]}}, acts_1_17_21};
    registers #(.ARRAY_WIDTH(8)) r_1_17_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_17_1_2), .q(s_1_17_1_2_reg));

    assign s_1_17_1_3 = {{2{acts_1_17_24[5]}}, acts_1_17_24} + {{2{acts_1_17_28[5]}}, acts_1_17_28} + {{2{acts_1_17_29[5]}}, acts_1_17_29} + {{2{acts_1_17_30[5]}}, acts_1_17_30};
    registers #(.ARRAY_WIDTH(8)) r_1_17_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_17_1_3), .q(s_1_17_1_3_reg));

    assign s_1_17_1_4 = {{2{acts_1_17_37[5]}}, acts_1_17_37} + {{2{acts_1_17_39[5]}}, acts_1_17_39} + {{2{acts_1_17_46[5]}}, acts_1_17_46} + {{2{acts_1_17_47[5]}}, acts_1_17_47};
    registers #(.ARRAY_WIDTH(8)) r_1_17_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_17_1_4), .q(s_1_17_1_4_reg));

    assign s_1_17_1_5 = {{2{acts_1_17_48[5]}}, acts_1_17_48} + {{2{acts_1_17_50[5]}}, acts_1_17_50} + {{2{acts_1_17_55[5]}}, acts_1_17_55} + {{2{acts_1_17_57[5]}}, acts_1_17_57};
    registers #(.ARRAY_WIDTH(8)) r_1_17_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_17_1_5), .q(s_1_17_1_5_reg));

    assign s_1_17_1_6 = {{2{acts_1_17_59[5]}}, acts_1_17_59} + {{2{acts_1_17_60[5]}}, acts_1_17_60} + {{2{acts_1_17_61[5]}}, acts_1_17_61} + {{2{acts_1_17_63[5]}}, acts_1_17_63};
    registers #(.ARRAY_WIDTH(8)) r_1_17_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_17_1_6), .q(s_1_17_1_6_reg));

  // Stage 2
    assign s_1_17_2_0 = {{2{s_1_17_1_0_reg[7]}}, s_1_17_1_0_reg} + {{2{s_1_17_1_1_reg[7]}}, s_1_17_1_1_reg} + {{2{s_1_17_1_2_reg[7]}}, s_1_17_1_2_reg} + {{2{s_1_17_1_3_reg[7]}}, s_1_17_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_17_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_17_2_0), .q(s_1_17_2_0_reg));

    assign s_1_17_2_1 = {{2{s_1_17_1_4_reg[7]}}, s_1_17_1_4_reg} + {{2{s_1_17_1_5_reg[7]}}, s_1_17_1_5_reg} + {{2{s_1_17_1_6_reg[7]}}, s_1_17_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_17_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_17_2_1), .q(s_1_17_2_1_reg));

  // Stage 3
    assign sum_1_17 = {{2{s_1_17_2_0_reg[9]}}, s_1_17_2_0_reg} + {{2{s_1_17_2_1_reg[9]}}, s_1_17_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_17), .q(sum_1_17_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_17 (.i_data(sum_1_17_reg), .o_data(out_1_17_sat));


    // Layer 1, Node 18
      logic  [7:0] s_1_18_1_0, s_1_18_1_1, s_1_18_1_2, s_1_18_1_3, s_1_18_1_4, s_1_18_1_5, s_1_18_1_6;
    logic  [7:0] s_1_18_1_0_reg, s_1_18_1_1_reg, s_1_18_1_2_reg, s_1_18_1_3_reg, s_1_18_1_4_reg, s_1_18_1_5_reg, s_1_18_1_6_reg;
    logic  [9:0] s_1_18_2_0, s_1_18_2_1;
    logic  [9:0] s_1_18_2_0_reg, s_1_18_2_1_reg;
    logic [11:0] sum_1_18;
    logic [11:0] sum_1_18_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_0)) 
    rom_1_18_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_18_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_1)) 
    rom_1_18_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_18_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_2)) 
    rom_1_18_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_18_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_6)) 
    rom_1_18_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_18_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_8)) 
    rom_1_18_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_18_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_9)) 
    rom_1_18_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_18_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_10)) 
    rom_1_18_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_18_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_13)) 
    rom_1_18_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_18_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_14)) 
    rom_1_18_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_18_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_15)) 
    rom_1_18_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_18_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_16)) 
    rom_1_18_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_18_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_17)) 
    rom_1_18_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_18_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_18)) 
    rom_1_18_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_18_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_19)) 
    rom_1_18_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_18_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_22)) 
    rom_1_18_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_18_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_24)) 
    rom_1_18_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_18_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_29)) 
    rom_1_18_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_18_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_31)) 
    rom_1_18_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_18_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_35)) 
    rom_1_18_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_18_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_36)) 
    rom_1_18_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_18_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_39)) 
    rom_1_18_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_18_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_45)) 
    rom_1_18_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_18_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_48)) 
    rom_1_18_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_18_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_49)) 
    rom_1_18_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_18_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_55)) 
    rom_1_18_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_18_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_59)) 
    rom_1_18_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_18_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_18_63)) 
    rom_1_18_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_18_63));

  // Stage 1
    assign s_1_18_1_0 = {{2{acts_1_18_0[5]}}, acts_1_18_0} + {{2{acts_1_18_1[5]}}, acts_1_18_1} + {{2{acts_1_18_2[5]}}, acts_1_18_2} + {{2{acts_1_18_6[5]}}, acts_1_18_6};
    registers #(.ARRAY_WIDTH(8)) r_1_18_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_18_1_0), .q(s_1_18_1_0_reg));

    assign s_1_18_1_1 = {{2{acts_1_18_8[5]}}, acts_1_18_8} + {{2{acts_1_18_9[5]}}, acts_1_18_9} + {{2{acts_1_18_10[5]}}, acts_1_18_10} + {{2{acts_1_18_13[5]}}, acts_1_18_13};
    registers #(.ARRAY_WIDTH(8)) r_1_18_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_18_1_1), .q(s_1_18_1_1_reg));

    assign s_1_18_1_2 = {{2{acts_1_18_14[5]}}, acts_1_18_14} + {{2{acts_1_18_15[5]}}, acts_1_18_15} + {{2{acts_1_18_16[5]}}, acts_1_18_16} + {{2{acts_1_18_17[5]}}, acts_1_18_17};
    registers #(.ARRAY_WIDTH(8)) r_1_18_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_18_1_2), .q(s_1_18_1_2_reg));

    assign s_1_18_1_3 = {{2{acts_1_18_18[5]}}, acts_1_18_18} + {{2{acts_1_18_19[5]}}, acts_1_18_19} + {{2{acts_1_18_22[5]}}, acts_1_18_22} + {{2{acts_1_18_24[5]}}, acts_1_18_24};
    registers #(.ARRAY_WIDTH(8)) r_1_18_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_18_1_3), .q(s_1_18_1_3_reg));

    assign s_1_18_1_4 = {{2{acts_1_18_29[5]}}, acts_1_18_29} + {{2{acts_1_18_31[5]}}, acts_1_18_31} + {{2{acts_1_18_35[5]}}, acts_1_18_35} + {{2{acts_1_18_36[5]}}, acts_1_18_36};
    registers #(.ARRAY_WIDTH(8)) r_1_18_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_18_1_4), .q(s_1_18_1_4_reg));

    assign s_1_18_1_5 = {{2{acts_1_18_39[5]}}, acts_1_18_39} + {{2{acts_1_18_45[5]}}, acts_1_18_45} + {{2{acts_1_18_48[5]}}, acts_1_18_48} + {{2{acts_1_18_49[5]}}, acts_1_18_49};
    registers #(.ARRAY_WIDTH(8)) r_1_18_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_18_1_5), .q(s_1_18_1_5_reg));

    assign s_1_18_1_6 = {{2{acts_1_18_55[5]}}, acts_1_18_55} + {{2{acts_1_18_59[5]}}, acts_1_18_59} + {{2{acts_1_18_63[5]}}, acts_1_18_63};
    registers #(.ARRAY_WIDTH(8)) r_1_18_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_18_1_6), .q(s_1_18_1_6_reg));

  // Stage 2
    assign s_1_18_2_0 = {{2{s_1_18_1_0_reg[7]}}, s_1_18_1_0_reg} + {{2{s_1_18_1_1_reg[7]}}, s_1_18_1_1_reg} + {{2{s_1_18_1_2_reg[7]}}, s_1_18_1_2_reg} + {{2{s_1_18_1_3_reg[7]}}, s_1_18_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_18_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_18_2_0), .q(s_1_18_2_0_reg));

    assign s_1_18_2_1 = {{2{s_1_18_1_4_reg[7]}}, s_1_18_1_4_reg} + {{2{s_1_18_1_5_reg[7]}}, s_1_18_1_5_reg} + {{2{s_1_18_1_6_reg[7]}}, s_1_18_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_18_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_18_2_1), .q(s_1_18_2_1_reg));

  // Stage 3
    assign sum_1_18 = {{2{s_1_18_2_0_reg[9]}}, s_1_18_2_0_reg} + {{2{s_1_18_2_1_reg[9]}}, s_1_18_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_18), .q(sum_1_18_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_18 (.i_data(sum_1_18_reg), .o_data(out_1_18_sat));


    // Layer 1, Node 19
      logic  [7:0] s_1_19_1_0, s_1_19_1_1, s_1_19_1_2, s_1_19_1_3, s_1_19_1_4, s_1_19_1_5;
    logic  [7:0] s_1_19_1_0_reg, s_1_19_1_1_reg, s_1_19_1_2_reg, s_1_19_1_3_reg, s_1_19_1_4_reg, s_1_19_1_5_reg;
    logic  [9:0] s_1_19_2_0, s_1_19_2_1;
    logic  [9:0] s_1_19_2_0_reg, s_1_19_2_1_reg;
    logic [11:0] sum_1_19;
    logic [11:0] sum_1_19_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_1)) 
    rom_1_19_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_19_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_2)) 
    rom_1_19_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_19_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_3)) 
    rom_1_19_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_19_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_5)) 
    rom_1_19_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_19_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_6)) 
    rom_1_19_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_19_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_10)) 
    rom_1_19_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_19_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_14)) 
    rom_1_19_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_19_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_15)) 
    rom_1_19_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_19_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_22)) 
    rom_1_19_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_19_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_23)) 
    rom_1_19_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_19_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_24)) 
    rom_1_19_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_19_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_27)) 
    rom_1_19_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_19_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_29)) 
    rom_1_19_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_19_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_32)) 
    rom_1_19_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_19_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_33)) 
    rom_1_19_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_19_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_34)) 
    rom_1_19_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_19_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_37)) 
    rom_1_19_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_19_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_40)) 
    rom_1_19_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_19_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_44)) 
    rom_1_19_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_19_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_46)) 
    rom_1_19_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_19_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_57)) 
    rom_1_19_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_19_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_58)) 
    rom_1_19_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_19_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_19_63)) 
    rom_1_19_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_19_63));

  // Stage 1
    assign s_1_19_1_0 = {{2{acts_1_19_1[5]}}, acts_1_19_1} + {{2{acts_1_19_2[5]}}, acts_1_19_2} + {{2{acts_1_19_3[5]}}, acts_1_19_3} + {{2{acts_1_19_5[5]}}, acts_1_19_5};
    registers #(.ARRAY_WIDTH(8)) r_1_19_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_19_1_0), .q(s_1_19_1_0_reg));

    assign s_1_19_1_1 = {{2{acts_1_19_6[5]}}, acts_1_19_6} + {{2{acts_1_19_10[5]}}, acts_1_19_10} + {{2{acts_1_19_14[5]}}, acts_1_19_14} + {{2{acts_1_19_15[5]}}, acts_1_19_15};
    registers #(.ARRAY_WIDTH(8)) r_1_19_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_19_1_1), .q(s_1_19_1_1_reg));

    assign s_1_19_1_2 = {{2{acts_1_19_22[5]}}, acts_1_19_22} + {{2{acts_1_19_23[5]}}, acts_1_19_23} + {{2{acts_1_19_24[5]}}, acts_1_19_24} + {{2{acts_1_19_27[5]}}, acts_1_19_27};
    registers #(.ARRAY_WIDTH(8)) r_1_19_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_19_1_2), .q(s_1_19_1_2_reg));

    assign s_1_19_1_3 = {{2{acts_1_19_29[5]}}, acts_1_19_29} + {{2{acts_1_19_32[5]}}, acts_1_19_32} + {{2{acts_1_19_33[5]}}, acts_1_19_33} + {{2{acts_1_19_34[5]}}, acts_1_19_34};
    registers #(.ARRAY_WIDTH(8)) r_1_19_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_19_1_3), .q(s_1_19_1_3_reg));

    assign s_1_19_1_4 = {{2{acts_1_19_37[5]}}, acts_1_19_37} + {{2{acts_1_19_40[5]}}, acts_1_19_40} + {{2{acts_1_19_44[5]}}, acts_1_19_44} + {{2{acts_1_19_46[5]}}, acts_1_19_46};
    registers #(.ARRAY_WIDTH(8)) r_1_19_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_19_1_4), .q(s_1_19_1_4_reg));

    assign s_1_19_1_5 = {{2{acts_1_19_57[5]}}, acts_1_19_57} + {{2{acts_1_19_58[5]}}, acts_1_19_58} + {{2{acts_1_19_63[5]}}, acts_1_19_63};
    registers #(.ARRAY_WIDTH(8)) r_1_19_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_19_1_5), .q(s_1_19_1_5_reg));

  // Stage 2
    assign s_1_19_2_0 = {{2{s_1_19_1_0_reg[7]}}, s_1_19_1_0_reg} + {{2{s_1_19_1_1_reg[7]}}, s_1_19_1_1_reg} + {{2{s_1_19_1_2_reg[7]}}, s_1_19_1_2_reg} + {{2{s_1_19_1_3_reg[7]}}, s_1_19_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_19_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_19_2_0), .q(s_1_19_2_0_reg));

    assign s_1_19_2_1 = {{2{s_1_19_1_4_reg[7]}}, s_1_19_1_4_reg} + {{2{s_1_19_1_5_reg[7]}}, s_1_19_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_19_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_19_2_1), .q(s_1_19_2_1_reg));

  // Stage 3
    assign sum_1_19 = {{2{s_1_19_2_0_reg[9]}}, s_1_19_2_0_reg} + {{2{s_1_19_2_1_reg[9]}}, s_1_19_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_19), .q(sum_1_19_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_19 (.i_data(sum_1_19_reg), .o_data(out_1_19_sat));


    // Layer 1, Node 20
      logic  [7:0] s_1_20_1_0, s_1_20_1_1, s_1_20_1_2, s_1_20_1_3, s_1_20_1_4, s_1_20_1_5, s_1_20_1_6, s_1_20_1_7, s_1_20_1_8;
    logic  [7:0] s_1_20_1_0_reg, s_1_20_1_1_reg, s_1_20_1_2_reg, s_1_20_1_3_reg, s_1_20_1_4_reg, s_1_20_1_5_reg, s_1_20_1_6_reg, s_1_20_1_7_reg, s_1_20_1_8_reg;
    logic  [9:0] s_1_20_2_0, s_1_20_2_1, s_1_20_2_2;
    logic  [9:0] s_1_20_2_0_reg, s_1_20_2_1_reg, s_1_20_2_2_reg;
    logic [11:0] sum_1_20;
    logic [11:0] sum_1_20_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_0)) 
    rom_1_20_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_20_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_3)) 
    rom_1_20_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_20_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_4)) 
    rom_1_20_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_20_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_5)) 
    rom_1_20_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_20_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_8)) 
    rom_1_20_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_20_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_9)) 
    rom_1_20_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_20_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_13)) 
    rom_1_20_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_20_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_17)) 
    rom_1_20_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_20_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_20)) 
    rom_1_20_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_20_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_21)) 
    rom_1_20_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_20_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_23)) 
    rom_1_20_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_20_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_24)) 
    rom_1_20_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_20_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_26)) 
    rom_1_20_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_20_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_29)) 
    rom_1_20_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_20_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_31)) 
    rom_1_20_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_20_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_32)) 
    rom_1_20_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_20_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_34)) 
    rom_1_20_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_20_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_36)) 
    rom_1_20_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_20_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_37)) 
    rom_1_20_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_20_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_39)) 
    rom_1_20_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_20_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_41)) 
    rom_1_20_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_20_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_42)) 
    rom_1_20_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_20_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_45)) 
    rom_1_20_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_20_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_46)) 
    rom_1_20_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_20_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_48)) 
    rom_1_20_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_20_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_50)) 
    rom_1_20_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_20_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_51)) 
    rom_1_20_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_20_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_52)) 
    rom_1_20_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_20_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_53)) 
    rom_1_20_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_20_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_56)) 
    rom_1_20_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_20_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_58)) 
    rom_1_20_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_20_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_59)) 
    rom_1_20_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_20_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_20_60)) 
    rom_1_20_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_20_60));

  // Stage 1
    assign s_1_20_1_0 = {{2{acts_1_20_0[5]}}, acts_1_20_0} + {{2{acts_1_20_3[5]}}, acts_1_20_3} + {{2{acts_1_20_4[5]}}, acts_1_20_4} + {{2{acts_1_20_5[5]}}, acts_1_20_5};
    registers #(.ARRAY_WIDTH(8)) r_1_20_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_1_0), .q(s_1_20_1_0_reg));

    assign s_1_20_1_1 = {{2{acts_1_20_8[5]}}, acts_1_20_8} + {{2{acts_1_20_9[5]}}, acts_1_20_9} + {{2{acts_1_20_13[5]}}, acts_1_20_13} + {{2{acts_1_20_17[5]}}, acts_1_20_17};
    registers #(.ARRAY_WIDTH(8)) r_1_20_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_1_1), .q(s_1_20_1_1_reg));

    assign s_1_20_1_2 = {{2{acts_1_20_20[5]}}, acts_1_20_20} + {{2{acts_1_20_21[5]}}, acts_1_20_21} + {{2{acts_1_20_23[5]}}, acts_1_20_23} + {{2{acts_1_20_24[5]}}, acts_1_20_24};
    registers #(.ARRAY_WIDTH(8)) r_1_20_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_1_2), .q(s_1_20_1_2_reg));

    assign s_1_20_1_3 = {{2{acts_1_20_26[5]}}, acts_1_20_26} + {{2{acts_1_20_29[5]}}, acts_1_20_29} + {{2{acts_1_20_31[5]}}, acts_1_20_31} + {{2{acts_1_20_32[5]}}, acts_1_20_32};
    registers #(.ARRAY_WIDTH(8)) r_1_20_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_1_3), .q(s_1_20_1_3_reg));

    assign s_1_20_1_4 = {{2{acts_1_20_34[5]}}, acts_1_20_34} + {{2{acts_1_20_36[5]}}, acts_1_20_36} + {{2{acts_1_20_37[5]}}, acts_1_20_37} + {{2{acts_1_20_39[5]}}, acts_1_20_39};
    registers #(.ARRAY_WIDTH(8)) r_1_20_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_1_4), .q(s_1_20_1_4_reg));

    assign s_1_20_1_5 = {{2{acts_1_20_41[5]}}, acts_1_20_41} + {{2{acts_1_20_42[5]}}, acts_1_20_42} + {{2{acts_1_20_45[5]}}, acts_1_20_45} + {{2{acts_1_20_46[5]}}, acts_1_20_46};
    registers #(.ARRAY_WIDTH(8)) r_1_20_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_1_5), .q(s_1_20_1_5_reg));

    assign s_1_20_1_6 = {{2{acts_1_20_48[5]}}, acts_1_20_48} + {{2{acts_1_20_50[5]}}, acts_1_20_50} + {{2{acts_1_20_51[5]}}, acts_1_20_51} + {{2{acts_1_20_52[5]}}, acts_1_20_52};
    registers #(.ARRAY_WIDTH(8)) r_1_20_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_1_6), .q(s_1_20_1_6_reg));

    assign s_1_20_1_7 = {{2{acts_1_20_53[5]}}, acts_1_20_53} + {{2{acts_1_20_56[5]}}, acts_1_20_56} + {{2{acts_1_20_58[5]}}, acts_1_20_58} + {{2{acts_1_20_59[5]}}, acts_1_20_59};
    registers #(.ARRAY_WIDTH(8)) r_1_20_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_1_7), .q(s_1_20_1_7_reg));

    assign s_1_20_1_8 = {{2{acts_1_20_60[5]}}, acts_1_20_60};
    registers #(.ARRAY_WIDTH(8)) r_1_20_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_1_8), .q(s_1_20_1_8_reg));

  // Stage 2
    assign s_1_20_2_0 = {{2{s_1_20_1_0_reg[7]}}, s_1_20_1_0_reg} + {{2{s_1_20_1_1_reg[7]}}, s_1_20_1_1_reg} + {{2{s_1_20_1_2_reg[7]}}, s_1_20_1_2_reg} + {{2{s_1_20_1_3_reg[7]}}, s_1_20_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_20_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_2_0), .q(s_1_20_2_0_reg));

    assign s_1_20_2_1 = {{2{s_1_20_1_4_reg[7]}}, s_1_20_1_4_reg} + {{2{s_1_20_1_5_reg[7]}}, s_1_20_1_5_reg} + {{2{s_1_20_1_6_reg[7]}}, s_1_20_1_6_reg} + {{2{s_1_20_1_7_reg[7]}}, s_1_20_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_20_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_2_1), .q(s_1_20_2_1_reg));

    assign s_1_20_2_2 = {{2{s_1_20_1_8_reg[7]}}, s_1_20_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_20_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_20_2_2), .q(s_1_20_2_2_reg));

  // Stage 3
    assign sum_1_20 = {{2{s_1_20_2_0_reg[9]}}, s_1_20_2_0_reg} + {{2{s_1_20_2_1_reg[9]}}, s_1_20_2_1_reg} + {{2{s_1_20_2_2_reg[9]}}, s_1_20_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_20), .q(sum_1_20_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_20 (.i_data(sum_1_20_reg), .o_data(out_1_20_sat));


    // Layer 1, Node 21
      logic  [7:0] s_1_21_1_0, s_1_21_1_1, s_1_21_1_2, s_1_21_1_3, s_1_21_1_4, s_1_21_1_5, s_1_21_1_6, s_1_21_1_7;
    logic  [7:0] s_1_21_1_0_reg, s_1_21_1_1_reg, s_1_21_1_2_reg, s_1_21_1_3_reg, s_1_21_1_4_reg, s_1_21_1_5_reg, s_1_21_1_6_reg, s_1_21_1_7_reg;
    logic  [9:0] s_1_21_2_0, s_1_21_2_1;
    logic  [9:0] s_1_21_2_0_reg, s_1_21_2_1_reg;
    logic [11:0] sum_1_21;
    logic [11:0] sum_1_21_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_2)) 
    rom_1_21_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_21_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_3)) 
    rom_1_21_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_21_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_4)) 
    rom_1_21_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_21_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_6)) 
    rom_1_21_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_21_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_7)) 
    rom_1_21_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_21_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_10)) 
    rom_1_21_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_21_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_12)) 
    rom_1_21_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_21_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_13)) 
    rom_1_21_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_21_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_14)) 
    rom_1_21_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_21_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_15)) 
    rom_1_21_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_21_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_16)) 
    rom_1_21_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_21_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_18)) 
    rom_1_21_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_21_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_20)) 
    rom_1_21_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_21_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_22)) 
    rom_1_21_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_21_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_29)) 
    rom_1_21_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_21_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_30)) 
    rom_1_21_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_21_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_31)) 
    rom_1_21_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_21_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_33)) 
    rom_1_21_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_21_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_35)) 
    rom_1_21_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_21_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_36)) 
    rom_1_21_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_21_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_39)) 
    rom_1_21_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_21_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_41)) 
    rom_1_21_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_21_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_42)) 
    rom_1_21_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_21_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_47)) 
    rom_1_21_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_21_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_48)) 
    rom_1_21_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_21_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_50)) 
    rom_1_21_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_21_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_53)) 
    rom_1_21_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_21_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_54)) 
    rom_1_21_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_21_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_57)) 
    rom_1_21_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_21_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_58)) 
    rom_1_21_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_21_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_59)) 
    rom_1_21_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_21_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_21_61)) 
    rom_1_21_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_21_61));

  // Stage 1
    assign s_1_21_1_0 = {{2{acts_1_21_2[5]}}, acts_1_21_2} + {{2{acts_1_21_3[5]}}, acts_1_21_3} + {{2{acts_1_21_4[5]}}, acts_1_21_4} + {{2{acts_1_21_6[5]}}, acts_1_21_6};
    registers #(.ARRAY_WIDTH(8)) r_1_21_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_21_1_0), .q(s_1_21_1_0_reg));

    assign s_1_21_1_1 = {{2{acts_1_21_7[5]}}, acts_1_21_7} + {{2{acts_1_21_10[5]}}, acts_1_21_10} + {{2{acts_1_21_12[5]}}, acts_1_21_12} + {{2{acts_1_21_13[5]}}, acts_1_21_13};
    registers #(.ARRAY_WIDTH(8)) r_1_21_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_21_1_1), .q(s_1_21_1_1_reg));

    assign s_1_21_1_2 = {{2{acts_1_21_14[5]}}, acts_1_21_14} + {{2{acts_1_21_15[5]}}, acts_1_21_15} + {{2{acts_1_21_16[5]}}, acts_1_21_16} + {{2{acts_1_21_18[5]}}, acts_1_21_18};
    registers #(.ARRAY_WIDTH(8)) r_1_21_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_21_1_2), .q(s_1_21_1_2_reg));

    assign s_1_21_1_3 = {{2{acts_1_21_20[5]}}, acts_1_21_20} + {{2{acts_1_21_22[5]}}, acts_1_21_22} + {{2{acts_1_21_29[5]}}, acts_1_21_29} + {{2{acts_1_21_30[5]}}, acts_1_21_30};
    registers #(.ARRAY_WIDTH(8)) r_1_21_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_21_1_3), .q(s_1_21_1_3_reg));

    assign s_1_21_1_4 = {{2{acts_1_21_31[5]}}, acts_1_21_31} + {{2{acts_1_21_33[5]}}, acts_1_21_33} + {{2{acts_1_21_35[5]}}, acts_1_21_35} + {{2{acts_1_21_36[5]}}, acts_1_21_36};
    registers #(.ARRAY_WIDTH(8)) r_1_21_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_21_1_4), .q(s_1_21_1_4_reg));

    assign s_1_21_1_5 = {{2{acts_1_21_39[5]}}, acts_1_21_39} + {{2{acts_1_21_41[5]}}, acts_1_21_41} + {{2{acts_1_21_42[5]}}, acts_1_21_42} + {{2{acts_1_21_47[5]}}, acts_1_21_47};
    registers #(.ARRAY_WIDTH(8)) r_1_21_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_21_1_5), .q(s_1_21_1_5_reg));

    assign s_1_21_1_6 = {{2{acts_1_21_48[5]}}, acts_1_21_48} + {{2{acts_1_21_50[5]}}, acts_1_21_50} + {{2{acts_1_21_53[5]}}, acts_1_21_53} + {{2{acts_1_21_54[5]}}, acts_1_21_54};
    registers #(.ARRAY_WIDTH(8)) r_1_21_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_21_1_6), .q(s_1_21_1_6_reg));

    assign s_1_21_1_7 = {{2{acts_1_21_57[5]}}, acts_1_21_57} + {{2{acts_1_21_58[5]}}, acts_1_21_58} + {{2{acts_1_21_59[5]}}, acts_1_21_59} + {{2{acts_1_21_61[5]}}, acts_1_21_61};
    registers #(.ARRAY_WIDTH(8)) r_1_21_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_21_1_7), .q(s_1_21_1_7_reg));

  // Stage 2
    assign s_1_21_2_0 = {{2{s_1_21_1_0_reg[7]}}, s_1_21_1_0_reg} + {{2{s_1_21_1_1_reg[7]}}, s_1_21_1_1_reg} + {{2{s_1_21_1_2_reg[7]}}, s_1_21_1_2_reg} + {{2{s_1_21_1_3_reg[7]}}, s_1_21_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_21_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_21_2_0), .q(s_1_21_2_0_reg));

    assign s_1_21_2_1 = {{2{s_1_21_1_4_reg[7]}}, s_1_21_1_4_reg} + {{2{s_1_21_1_5_reg[7]}}, s_1_21_1_5_reg} + {{2{s_1_21_1_6_reg[7]}}, s_1_21_1_6_reg} + {{2{s_1_21_1_7_reg[7]}}, s_1_21_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_21_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_21_2_1), .q(s_1_21_2_1_reg));

  // Stage 3
    assign sum_1_21 = {{2{s_1_21_2_0_reg[9]}}, s_1_21_2_0_reg} + {{2{s_1_21_2_1_reg[9]}}, s_1_21_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_21), .q(sum_1_21_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_21 (.i_data(sum_1_21_reg), .o_data(out_1_21_sat));


    // Layer 1, Node 22
      logic  [7:0] s_1_22_1_0, s_1_22_1_1, s_1_22_1_2, s_1_22_1_3, s_1_22_1_4, s_1_22_1_5, s_1_22_1_6, s_1_22_1_7, s_1_22_1_8, s_1_22_1_9;
    logic  [7:0] s_1_22_1_0_reg, s_1_22_1_1_reg, s_1_22_1_2_reg, s_1_22_1_3_reg, s_1_22_1_4_reg, s_1_22_1_5_reg, s_1_22_1_6_reg, s_1_22_1_7_reg, s_1_22_1_8_reg, s_1_22_1_9_reg;
    logic  [9:0] s_1_22_2_0, s_1_22_2_1, s_1_22_2_2;
    logic  [9:0] s_1_22_2_0_reg, s_1_22_2_1_reg, s_1_22_2_2_reg;
    logic [11:0] sum_1_22;
    logic [11:0] sum_1_22_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_0)) 
    rom_1_22_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_22_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_1)) 
    rom_1_22_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_22_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_2)) 
    rom_1_22_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_22_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_6)) 
    rom_1_22_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_22_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_8)) 
    rom_1_22_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_22_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_9)) 
    rom_1_22_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_22_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_11)) 
    rom_1_22_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_22_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_12)) 
    rom_1_22_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_22_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_13)) 
    rom_1_22_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_22_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_16)) 
    rom_1_22_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_22_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_18)) 
    rom_1_22_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_22_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_19)) 
    rom_1_22_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_22_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_20)) 
    rom_1_22_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_22_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_22)) 
    rom_1_22_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_22_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_23)) 
    rom_1_22_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_22_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_24)) 
    rom_1_22_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_22_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_25)) 
    rom_1_22_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_22_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_26)) 
    rom_1_22_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_22_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_29)) 
    rom_1_22_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_22_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_30)) 
    rom_1_22_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_22_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_32)) 
    rom_1_22_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_22_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_33)) 
    rom_1_22_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_22_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_35)) 
    rom_1_22_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_22_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_36)) 
    rom_1_22_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_22_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_37)) 
    rom_1_22_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_22_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_38)) 
    rom_1_22_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_22_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_39)) 
    rom_1_22_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_22_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_45)) 
    rom_1_22_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_22_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_49)) 
    rom_1_22_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_22_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_50)) 
    rom_1_22_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_22_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_51)) 
    rom_1_22_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_22_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_52)) 
    rom_1_22_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_22_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_54)) 
    rom_1_22_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_22_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_58)) 
    rom_1_22_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_22_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_59)) 
    rom_1_22_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_22_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_61)) 
    rom_1_22_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_22_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_22_62)) 
    rom_1_22_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_22_62));

  // Stage 1
    assign s_1_22_1_0 = {{2{acts_1_22_0[5]}}, acts_1_22_0} + {{2{acts_1_22_1[5]}}, acts_1_22_1} + {{2{acts_1_22_2[5]}}, acts_1_22_2} + {{2{acts_1_22_6[5]}}, acts_1_22_6};
    registers #(.ARRAY_WIDTH(8)) r_1_22_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_1_0), .q(s_1_22_1_0_reg));

    assign s_1_22_1_1 = {{2{acts_1_22_8[5]}}, acts_1_22_8} + {{2{acts_1_22_9[5]}}, acts_1_22_9} + {{2{acts_1_22_11[5]}}, acts_1_22_11} + {{2{acts_1_22_12[5]}}, acts_1_22_12};
    registers #(.ARRAY_WIDTH(8)) r_1_22_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_1_1), .q(s_1_22_1_1_reg));

    assign s_1_22_1_2 = {{2{acts_1_22_13[5]}}, acts_1_22_13} + {{2{acts_1_22_16[5]}}, acts_1_22_16} + {{2{acts_1_22_18[5]}}, acts_1_22_18} + {{2{acts_1_22_19[5]}}, acts_1_22_19};
    registers #(.ARRAY_WIDTH(8)) r_1_22_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_1_2), .q(s_1_22_1_2_reg));

    assign s_1_22_1_3 = {{2{acts_1_22_20[5]}}, acts_1_22_20} + {{2{acts_1_22_22[5]}}, acts_1_22_22} + {{2{acts_1_22_23[5]}}, acts_1_22_23} + {{2{acts_1_22_24[5]}}, acts_1_22_24};
    registers #(.ARRAY_WIDTH(8)) r_1_22_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_1_3), .q(s_1_22_1_3_reg));

    assign s_1_22_1_4 = {{2{acts_1_22_25[5]}}, acts_1_22_25} + {{2{acts_1_22_26[5]}}, acts_1_22_26} + {{2{acts_1_22_29[5]}}, acts_1_22_29} + {{2{acts_1_22_30[5]}}, acts_1_22_30};
    registers #(.ARRAY_WIDTH(8)) r_1_22_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_1_4), .q(s_1_22_1_4_reg));

    assign s_1_22_1_5 = {{2{acts_1_22_32[5]}}, acts_1_22_32} + {{2{acts_1_22_33[5]}}, acts_1_22_33} + {{2{acts_1_22_35[5]}}, acts_1_22_35} + {{2{acts_1_22_36[5]}}, acts_1_22_36};
    registers #(.ARRAY_WIDTH(8)) r_1_22_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_1_5), .q(s_1_22_1_5_reg));

    assign s_1_22_1_6 = {{2{acts_1_22_37[5]}}, acts_1_22_37} + {{2{acts_1_22_38[5]}}, acts_1_22_38} + {{2{acts_1_22_39[5]}}, acts_1_22_39} + {{2{acts_1_22_45[5]}}, acts_1_22_45};
    registers #(.ARRAY_WIDTH(8)) r_1_22_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_1_6), .q(s_1_22_1_6_reg));

    assign s_1_22_1_7 = {{2{acts_1_22_49[5]}}, acts_1_22_49} + {{2{acts_1_22_50[5]}}, acts_1_22_50} + {{2{acts_1_22_51[5]}}, acts_1_22_51} + {{2{acts_1_22_52[5]}}, acts_1_22_52};
    registers #(.ARRAY_WIDTH(8)) r_1_22_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_1_7), .q(s_1_22_1_7_reg));

    assign s_1_22_1_8 = {{2{acts_1_22_54[5]}}, acts_1_22_54} + {{2{acts_1_22_58[5]}}, acts_1_22_58} + {{2{acts_1_22_59[5]}}, acts_1_22_59} + {{2{acts_1_22_61[5]}}, acts_1_22_61};
    registers #(.ARRAY_WIDTH(8)) r_1_22_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_1_8), .q(s_1_22_1_8_reg));

    assign s_1_22_1_9 = {{2{acts_1_22_62[5]}}, acts_1_22_62};
    registers #(.ARRAY_WIDTH(8)) r_1_22_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_1_9), .q(s_1_22_1_9_reg));

  // Stage 2
    assign s_1_22_2_0 = {{2{s_1_22_1_0_reg[7]}}, s_1_22_1_0_reg} + {{2{s_1_22_1_1_reg[7]}}, s_1_22_1_1_reg} + {{2{s_1_22_1_2_reg[7]}}, s_1_22_1_2_reg} + {{2{s_1_22_1_3_reg[7]}}, s_1_22_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_22_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_2_0), .q(s_1_22_2_0_reg));

    assign s_1_22_2_1 = {{2{s_1_22_1_4_reg[7]}}, s_1_22_1_4_reg} + {{2{s_1_22_1_5_reg[7]}}, s_1_22_1_5_reg} + {{2{s_1_22_1_6_reg[7]}}, s_1_22_1_6_reg} + {{2{s_1_22_1_7_reg[7]}}, s_1_22_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_22_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_2_1), .q(s_1_22_2_1_reg));

    assign s_1_22_2_2 = {{2{s_1_22_1_8_reg[7]}}, s_1_22_1_8_reg} + {{2{s_1_22_1_9_reg[7]}}, s_1_22_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_22_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_22_2_2), .q(s_1_22_2_2_reg));

  // Stage 3
    assign sum_1_22 = {{2{s_1_22_2_0_reg[9]}}, s_1_22_2_0_reg} + {{2{s_1_22_2_1_reg[9]}}, s_1_22_2_1_reg} + {{2{s_1_22_2_2_reg[9]}}, s_1_22_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_22), .q(sum_1_22_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_22 (.i_data(sum_1_22_reg), .o_data(out_1_22_sat));


    // Layer 1, Node 23
      logic  [7:0] s_1_23_1_0, s_1_23_1_1, s_1_23_1_2, s_1_23_1_3, s_1_23_1_4, s_1_23_1_5;
    logic  [7:0] s_1_23_1_0_reg, s_1_23_1_1_reg, s_1_23_1_2_reg, s_1_23_1_3_reg, s_1_23_1_4_reg, s_1_23_1_5_reg;
    logic  [9:0] s_1_23_2_0, s_1_23_2_1;
    logic  [9:0] s_1_23_2_0_reg, s_1_23_2_1_reg;
    logic [11:0] sum_1_23;
    logic [11:0] sum_1_23_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_1)) 
    rom_1_23_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_23_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_3)) 
    rom_1_23_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_23_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_4)) 
    rom_1_23_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_23_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_5)) 
    rom_1_23_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_23_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_6)) 
    rom_1_23_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_23_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_8)) 
    rom_1_23_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_23_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_10)) 
    rom_1_23_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_23_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_14)) 
    rom_1_23_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_23_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_15)) 
    rom_1_23_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_23_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_20)) 
    rom_1_23_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_23_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_26)) 
    rom_1_23_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_23_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_30)) 
    rom_1_23_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_23_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_36)) 
    rom_1_23_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_23_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_39)) 
    rom_1_23_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_23_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_43)) 
    rom_1_23_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_23_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_44)) 
    rom_1_23_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_23_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_45)) 
    rom_1_23_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_23_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_50)) 
    rom_1_23_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_23_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_56)) 
    rom_1_23_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_23_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_57)) 
    rom_1_23_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_23_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_58)) 
    rom_1_23_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_23_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_23_61)) 
    rom_1_23_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_23_61));

  // Stage 1
    assign s_1_23_1_0 = {{2{acts_1_23_1[5]}}, acts_1_23_1} + {{2{acts_1_23_3[5]}}, acts_1_23_3} + {{2{acts_1_23_4[5]}}, acts_1_23_4} + {{2{acts_1_23_5[5]}}, acts_1_23_5};
    registers #(.ARRAY_WIDTH(8)) r_1_23_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_23_1_0), .q(s_1_23_1_0_reg));

    assign s_1_23_1_1 = {{2{acts_1_23_6[5]}}, acts_1_23_6} + {{2{acts_1_23_8[5]}}, acts_1_23_8} + {{2{acts_1_23_10[5]}}, acts_1_23_10} + {{2{acts_1_23_14[5]}}, acts_1_23_14};
    registers #(.ARRAY_WIDTH(8)) r_1_23_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_23_1_1), .q(s_1_23_1_1_reg));

    assign s_1_23_1_2 = {{2{acts_1_23_15[5]}}, acts_1_23_15} + {{2{acts_1_23_20[5]}}, acts_1_23_20} + {{2{acts_1_23_26[5]}}, acts_1_23_26} + {{2{acts_1_23_30[5]}}, acts_1_23_30};
    registers #(.ARRAY_WIDTH(8)) r_1_23_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_23_1_2), .q(s_1_23_1_2_reg));

    assign s_1_23_1_3 = {{2{acts_1_23_36[5]}}, acts_1_23_36} + {{2{acts_1_23_39[5]}}, acts_1_23_39} + {{2{acts_1_23_43[5]}}, acts_1_23_43} + {{2{acts_1_23_44[5]}}, acts_1_23_44};
    registers #(.ARRAY_WIDTH(8)) r_1_23_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_23_1_3), .q(s_1_23_1_3_reg));

    assign s_1_23_1_4 = {{2{acts_1_23_45[5]}}, acts_1_23_45} + {{2{acts_1_23_50[5]}}, acts_1_23_50} + {{2{acts_1_23_56[5]}}, acts_1_23_56} + {{2{acts_1_23_57[5]}}, acts_1_23_57};
    registers #(.ARRAY_WIDTH(8)) r_1_23_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_23_1_4), .q(s_1_23_1_4_reg));

    assign s_1_23_1_5 = {{2{acts_1_23_58[5]}}, acts_1_23_58} + {{2{acts_1_23_61[5]}}, acts_1_23_61};
    registers #(.ARRAY_WIDTH(8)) r_1_23_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_23_1_5), .q(s_1_23_1_5_reg));

  // Stage 2
    assign s_1_23_2_0 = {{2{s_1_23_1_0_reg[7]}}, s_1_23_1_0_reg} + {{2{s_1_23_1_1_reg[7]}}, s_1_23_1_1_reg} + {{2{s_1_23_1_2_reg[7]}}, s_1_23_1_2_reg} + {{2{s_1_23_1_3_reg[7]}}, s_1_23_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_23_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_23_2_0), .q(s_1_23_2_0_reg));

    assign s_1_23_2_1 = {{2{s_1_23_1_4_reg[7]}}, s_1_23_1_4_reg} + {{2{s_1_23_1_5_reg[7]}}, s_1_23_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_23_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_23_2_1), .q(s_1_23_2_1_reg));

  // Stage 3
    assign sum_1_23 = {{2{s_1_23_2_0_reg[9]}}, s_1_23_2_0_reg} + {{2{s_1_23_2_1_reg[9]}}, s_1_23_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_23), .q(sum_1_23_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_23 (.i_data(sum_1_23_reg), .o_data(out_1_23_sat));


    // Layer 1, Node 24
      logic  [7:0] s_1_24_1_0, s_1_24_1_1, s_1_24_1_2, s_1_24_1_3, s_1_24_1_4, s_1_24_1_5, s_1_24_1_6, s_1_24_1_7, s_1_24_1_8;
    logic  [7:0] s_1_24_1_0_reg, s_1_24_1_1_reg, s_1_24_1_2_reg, s_1_24_1_3_reg, s_1_24_1_4_reg, s_1_24_1_5_reg, s_1_24_1_6_reg, s_1_24_1_7_reg, s_1_24_1_8_reg;
    logic  [9:0] s_1_24_2_0, s_1_24_2_1, s_1_24_2_2;
    logic  [9:0] s_1_24_2_0_reg, s_1_24_2_1_reg, s_1_24_2_2_reg;
    logic [11:0] sum_1_24;
    logic [11:0] sum_1_24_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_0)) 
    rom_1_24_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_24_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_1)) 
    rom_1_24_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_24_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_2)) 
    rom_1_24_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_24_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_9)) 
    rom_1_24_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_24_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_10)) 
    rom_1_24_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_24_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_12)) 
    rom_1_24_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_24_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_13)) 
    rom_1_24_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_24_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_14)) 
    rom_1_24_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_24_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_15)) 
    rom_1_24_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_24_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_16)) 
    rom_1_24_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_24_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_18)) 
    rom_1_24_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_24_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_19)) 
    rom_1_24_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_24_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_24)) 
    rom_1_24_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_24_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_28)) 
    rom_1_24_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_24_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_30)) 
    rom_1_24_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_24_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_32)) 
    rom_1_24_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_24_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_35)) 
    rom_1_24_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_24_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_38)) 
    rom_1_24_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_24_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_39)) 
    rom_1_24_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_24_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_40)) 
    rom_1_24_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_24_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_41)) 
    rom_1_24_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_24_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_42)) 
    rom_1_24_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_24_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_44)) 
    rom_1_24_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_24_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_47)) 
    rom_1_24_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_24_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_51)) 
    rom_1_24_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_24_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_52)) 
    rom_1_24_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_24_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_53)) 
    rom_1_24_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_24_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_55)) 
    rom_1_24_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_24_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_57)) 
    rom_1_24_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_24_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_58)) 
    rom_1_24_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_24_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_59)) 
    rom_1_24_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_24_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_60)) 
    rom_1_24_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_24_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_61)) 
    rom_1_24_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_24_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_24_63)) 
    rom_1_24_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_24_63));

  // Stage 1
    assign s_1_24_1_0 = {{2{acts_1_24_0[5]}}, acts_1_24_0} + {{2{acts_1_24_1[5]}}, acts_1_24_1} + {{2{acts_1_24_2[5]}}, acts_1_24_2} + {{2{acts_1_24_9[5]}}, acts_1_24_9};
    registers #(.ARRAY_WIDTH(8)) r_1_24_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_1_0), .q(s_1_24_1_0_reg));

    assign s_1_24_1_1 = {{2{acts_1_24_10[5]}}, acts_1_24_10} + {{2{acts_1_24_12[5]}}, acts_1_24_12} + {{2{acts_1_24_13[5]}}, acts_1_24_13} + {{2{acts_1_24_14[5]}}, acts_1_24_14};
    registers #(.ARRAY_WIDTH(8)) r_1_24_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_1_1), .q(s_1_24_1_1_reg));

    assign s_1_24_1_2 = {{2{acts_1_24_15[5]}}, acts_1_24_15} + {{2{acts_1_24_16[5]}}, acts_1_24_16} + {{2{acts_1_24_18[5]}}, acts_1_24_18} + {{2{acts_1_24_19[5]}}, acts_1_24_19};
    registers #(.ARRAY_WIDTH(8)) r_1_24_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_1_2), .q(s_1_24_1_2_reg));

    assign s_1_24_1_3 = {{2{acts_1_24_24[5]}}, acts_1_24_24} + {{2{acts_1_24_28[5]}}, acts_1_24_28} + {{2{acts_1_24_30[5]}}, acts_1_24_30} + {{2{acts_1_24_32[5]}}, acts_1_24_32};
    registers #(.ARRAY_WIDTH(8)) r_1_24_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_1_3), .q(s_1_24_1_3_reg));

    assign s_1_24_1_4 = {{2{acts_1_24_35[5]}}, acts_1_24_35} + {{2{acts_1_24_38[5]}}, acts_1_24_38} + {{2{acts_1_24_39[5]}}, acts_1_24_39} + {{2{acts_1_24_40[5]}}, acts_1_24_40};
    registers #(.ARRAY_WIDTH(8)) r_1_24_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_1_4), .q(s_1_24_1_4_reg));

    assign s_1_24_1_5 = {{2{acts_1_24_41[5]}}, acts_1_24_41} + {{2{acts_1_24_42[5]}}, acts_1_24_42} + {{2{acts_1_24_44[5]}}, acts_1_24_44} + {{2{acts_1_24_47[5]}}, acts_1_24_47};
    registers #(.ARRAY_WIDTH(8)) r_1_24_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_1_5), .q(s_1_24_1_5_reg));

    assign s_1_24_1_6 = {{2{acts_1_24_51[5]}}, acts_1_24_51} + {{2{acts_1_24_52[5]}}, acts_1_24_52} + {{2{acts_1_24_53[5]}}, acts_1_24_53} + {{2{acts_1_24_55[5]}}, acts_1_24_55};
    registers #(.ARRAY_WIDTH(8)) r_1_24_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_1_6), .q(s_1_24_1_6_reg));

    assign s_1_24_1_7 = {{2{acts_1_24_57[5]}}, acts_1_24_57} + {{2{acts_1_24_58[5]}}, acts_1_24_58} + {{2{acts_1_24_59[5]}}, acts_1_24_59} + {{2{acts_1_24_60[5]}}, acts_1_24_60};
    registers #(.ARRAY_WIDTH(8)) r_1_24_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_1_7), .q(s_1_24_1_7_reg));

    assign s_1_24_1_8 = {{2{acts_1_24_61[5]}}, acts_1_24_61} + {{2{acts_1_24_63[5]}}, acts_1_24_63};
    registers #(.ARRAY_WIDTH(8)) r_1_24_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_1_8), .q(s_1_24_1_8_reg));

  // Stage 2
    assign s_1_24_2_0 = {{2{s_1_24_1_0_reg[7]}}, s_1_24_1_0_reg} + {{2{s_1_24_1_1_reg[7]}}, s_1_24_1_1_reg} + {{2{s_1_24_1_2_reg[7]}}, s_1_24_1_2_reg} + {{2{s_1_24_1_3_reg[7]}}, s_1_24_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_24_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_2_0), .q(s_1_24_2_0_reg));

    assign s_1_24_2_1 = {{2{s_1_24_1_4_reg[7]}}, s_1_24_1_4_reg} + {{2{s_1_24_1_5_reg[7]}}, s_1_24_1_5_reg} + {{2{s_1_24_1_6_reg[7]}}, s_1_24_1_6_reg} + {{2{s_1_24_1_7_reg[7]}}, s_1_24_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_24_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_2_1), .q(s_1_24_2_1_reg));

    assign s_1_24_2_2 = {{2{s_1_24_1_8_reg[7]}}, s_1_24_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_24_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_24_2_2), .q(s_1_24_2_2_reg));

  // Stage 3
    assign sum_1_24 = {{2{s_1_24_2_0_reg[9]}}, s_1_24_2_0_reg} + {{2{s_1_24_2_1_reg[9]}}, s_1_24_2_1_reg} + {{2{s_1_24_2_2_reg[9]}}, s_1_24_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_24), .q(sum_1_24_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_24 (.i_data(sum_1_24_reg), .o_data(out_1_24_sat));


    // Layer 1, Node 25
      logic  [7:0] s_1_25_1_0, s_1_25_1_1, s_1_25_1_2, s_1_25_1_3, s_1_25_1_4, s_1_25_1_5, s_1_25_1_6, s_1_25_1_7, s_1_25_1_8, s_1_25_1_9;
    logic  [7:0] s_1_25_1_0_reg, s_1_25_1_1_reg, s_1_25_1_2_reg, s_1_25_1_3_reg, s_1_25_1_4_reg, s_1_25_1_5_reg, s_1_25_1_6_reg, s_1_25_1_7_reg, s_1_25_1_8_reg, s_1_25_1_9_reg;
    logic  [9:0] s_1_25_2_0, s_1_25_2_1, s_1_25_2_2;
    logic  [9:0] s_1_25_2_0_reg, s_1_25_2_1_reg, s_1_25_2_2_reg;
    logic [11:0] sum_1_25;
    logic [11:0] sum_1_25_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_0)) 
    rom_1_25_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_25_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_3)) 
    rom_1_25_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_25_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_5)) 
    rom_1_25_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_25_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_7)) 
    rom_1_25_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_25_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_8)) 
    rom_1_25_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_25_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_9)) 
    rom_1_25_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_25_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_13)) 
    rom_1_25_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_25_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_17)) 
    rom_1_25_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_25_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_19)) 
    rom_1_25_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_25_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_20)) 
    rom_1_25_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_25_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_21)) 
    rom_1_25_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_25_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_23)) 
    rom_1_25_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_25_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_24)) 
    rom_1_25_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_25_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_26)) 
    rom_1_25_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_25_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_29)) 
    rom_1_25_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_25_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_30)) 
    rom_1_25_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_25_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_32)) 
    rom_1_25_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_25_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_34)) 
    rom_1_25_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_25_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_36)) 
    rom_1_25_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_25_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_37)) 
    rom_1_25_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_25_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_39)) 
    rom_1_25_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_25_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_40)) 
    rom_1_25_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_25_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_41)) 
    rom_1_25_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_25_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_42)) 
    rom_1_25_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_25_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_45)) 
    rom_1_25_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_25_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_46)) 
    rom_1_25_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_25_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_47)) 
    rom_1_25_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_25_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_48)) 
    rom_1_25_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_25_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_49)) 
    rom_1_25_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_25_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_51)) 
    rom_1_25_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_25_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_52)) 
    rom_1_25_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_25_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_53)) 
    rom_1_25_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_25_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_54)) 
    rom_1_25_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_25_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_55)) 
    rom_1_25_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_25_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_56)) 
    rom_1_25_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_25_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_58)) 
    rom_1_25_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_25_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_60)) 
    rom_1_25_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_25_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_61)) 
    rom_1_25_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_25_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_25_62)) 
    rom_1_25_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_25_62));

  // Stage 1
    assign s_1_25_1_0 = {{2{acts_1_25_0[5]}}, acts_1_25_0} + {{2{acts_1_25_3[5]}}, acts_1_25_3} + {{2{acts_1_25_5[5]}}, acts_1_25_5} + {{2{acts_1_25_7[5]}}, acts_1_25_7};
    registers #(.ARRAY_WIDTH(8)) r_1_25_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_1_0), .q(s_1_25_1_0_reg));

    assign s_1_25_1_1 = {{2{acts_1_25_8[5]}}, acts_1_25_8} + {{2{acts_1_25_9[5]}}, acts_1_25_9} + {{2{acts_1_25_13[5]}}, acts_1_25_13} + {{2{acts_1_25_17[5]}}, acts_1_25_17};
    registers #(.ARRAY_WIDTH(8)) r_1_25_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_1_1), .q(s_1_25_1_1_reg));

    assign s_1_25_1_2 = {{2{acts_1_25_19[5]}}, acts_1_25_19} + {{2{acts_1_25_20[5]}}, acts_1_25_20} + {{2{acts_1_25_21[5]}}, acts_1_25_21} + {{2{acts_1_25_23[5]}}, acts_1_25_23};
    registers #(.ARRAY_WIDTH(8)) r_1_25_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_1_2), .q(s_1_25_1_2_reg));

    assign s_1_25_1_3 = {{2{acts_1_25_24[5]}}, acts_1_25_24} + {{2{acts_1_25_26[5]}}, acts_1_25_26} + {{2{acts_1_25_29[5]}}, acts_1_25_29} + {{2{acts_1_25_30[5]}}, acts_1_25_30};
    registers #(.ARRAY_WIDTH(8)) r_1_25_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_1_3), .q(s_1_25_1_3_reg));

    assign s_1_25_1_4 = {{2{acts_1_25_32[5]}}, acts_1_25_32} + {{2{acts_1_25_34[5]}}, acts_1_25_34} + {{2{acts_1_25_36[5]}}, acts_1_25_36} + {{2{acts_1_25_37[5]}}, acts_1_25_37};
    registers #(.ARRAY_WIDTH(8)) r_1_25_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_1_4), .q(s_1_25_1_4_reg));

    assign s_1_25_1_5 = {{2{acts_1_25_39[5]}}, acts_1_25_39} + {{2{acts_1_25_40[5]}}, acts_1_25_40} + {{2{acts_1_25_41[5]}}, acts_1_25_41} + {{2{acts_1_25_42[5]}}, acts_1_25_42};
    registers #(.ARRAY_WIDTH(8)) r_1_25_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_1_5), .q(s_1_25_1_5_reg));

    assign s_1_25_1_6 = {{2{acts_1_25_45[5]}}, acts_1_25_45} + {{2{acts_1_25_46[5]}}, acts_1_25_46} + {{2{acts_1_25_47[5]}}, acts_1_25_47} + {{2{acts_1_25_48[5]}}, acts_1_25_48};
    registers #(.ARRAY_WIDTH(8)) r_1_25_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_1_6), .q(s_1_25_1_6_reg));

    assign s_1_25_1_7 = {{2{acts_1_25_49[5]}}, acts_1_25_49} + {{2{acts_1_25_51[5]}}, acts_1_25_51} + {{2{acts_1_25_52[5]}}, acts_1_25_52} + {{2{acts_1_25_53[5]}}, acts_1_25_53};
    registers #(.ARRAY_WIDTH(8)) r_1_25_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_1_7), .q(s_1_25_1_7_reg));

    assign s_1_25_1_8 = {{2{acts_1_25_54[5]}}, acts_1_25_54} + {{2{acts_1_25_55[5]}}, acts_1_25_55} + {{2{acts_1_25_56[5]}}, acts_1_25_56} + {{2{acts_1_25_58[5]}}, acts_1_25_58};
    registers #(.ARRAY_WIDTH(8)) r_1_25_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_1_8), .q(s_1_25_1_8_reg));

    assign s_1_25_1_9 = {{2{acts_1_25_60[5]}}, acts_1_25_60} + {{2{acts_1_25_61[5]}}, acts_1_25_61} + {{2{acts_1_25_62[5]}}, acts_1_25_62};
    registers #(.ARRAY_WIDTH(8)) r_1_25_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_1_9), .q(s_1_25_1_9_reg));

  // Stage 2
    assign s_1_25_2_0 = {{2{s_1_25_1_0_reg[7]}}, s_1_25_1_0_reg} + {{2{s_1_25_1_1_reg[7]}}, s_1_25_1_1_reg} + {{2{s_1_25_1_2_reg[7]}}, s_1_25_1_2_reg} + {{2{s_1_25_1_3_reg[7]}}, s_1_25_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_25_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_2_0), .q(s_1_25_2_0_reg));

    assign s_1_25_2_1 = {{2{s_1_25_1_4_reg[7]}}, s_1_25_1_4_reg} + {{2{s_1_25_1_5_reg[7]}}, s_1_25_1_5_reg} + {{2{s_1_25_1_6_reg[7]}}, s_1_25_1_6_reg} + {{2{s_1_25_1_7_reg[7]}}, s_1_25_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_25_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_2_1), .q(s_1_25_2_1_reg));

    assign s_1_25_2_2 = {{2{s_1_25_1_8_reg[7]}}, s_1_25_1_8_reg} + {{2{s_1_25_1_9_reg[7]}}, s_1_25_1_9_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_25_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_25_2_2), .q(s_1_25_2_2_reg));

  // Stage 3
    assign sum_1_25 = {{2{s_1_25_2_0_reg[9]}}, s_1_25_2_0_reg} + {{2{s_1_25_2_1_reg[9]}}, s_1_25_2_1_reg} + {{2{s_1_25_2_2_reg[9]}}, s_1_25_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_25), .q(sum_1_25_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_25 (.i_data(sum_1_25_reg), .o_data(out_1_25_sat));


    // Layer 1, Node 26
      logic  [7:0] s_1_26_1_0, s_1_26_1_1, s_1_26_1_2, s_1_26_1_3, s_1_26_1_4, s_1_26_1_5, s_1_26_1_6, s_1_26_1_7;
    logic  [7:0] s_1_26_1_0_reg, s_1_26_1_1_reg, s_1_26_1_2_reg, s_1_26_1_3_reg, s_1_26_1_4_reg, s_1_26_1_5_reg, s_1_26_1_6_reg, s_1_26_1_7_reg;
    logic  [9:0] s_1_26_2_0, s_1_26_2_1;
    logic  [9:0] s_1_26_2_0_reg, s_1_26_2_1_reg;
    logic [11:0] sum_1_26;
    logic [11:0] sum_1_26_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_6)) 
    rom_1_26_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_26_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_7)) 
    rom_1_26_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_26_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_8)) 
    rom_1_26_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_26_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_9)) 
    rom_1_26_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_26_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_10)) 
    rom_1_26_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_26_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_11)) 
    rom_1_26_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_26_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_13)) 
    rom_1_26_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_26_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_17)) 
    rom_1_26_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_26_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_18)) 
    rom_1_26_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_26_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_21)) 
    rom_1_26_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_26_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_22)) 
    rom_1_26_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_26_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_24)) 
    rom_1_26_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_26_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_28)) 
    rom_1_26_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_26_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_29)) 
    rom_1_26_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_26_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_31)) 
    rom_1_26_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_26_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_34)) 
    rom_1_26_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_26_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_36)) 
    rom_1_26_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_26_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_38)) 
    rom_1_26_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_26_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_39)) 
    rom_1_26_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_26_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_40)) 
    rom_1_26_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_26_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_43)) 
    rom_1_26_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_26_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_44)) 
    rom_1_26_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_26_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_45)) 
    rom_1_26_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_26_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_46)) 
    rom_1_26_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_26_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_47)) 
    rom_1_26_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_26_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_50)) 
    rom_1_26_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_26_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_51)) 
    rom_1_26_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_26_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_52)) 
    rom_1_26_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_26_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_54)) 
    rom_1_26_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_26_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_55)) 
    rom_1_26_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_26_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_56)) 
    rom_1_26_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_26_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_26_58)) 
    rom_1_26_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_26_58));

  // Stage 1
    assign s_1_26_1_0 = {{2{acts_1_26_6[5]}}, acts_1_26_6} + {{2{acts_1_26_7[5]}}, acts_1_26_7} + {{2{acts_1_26_8[5]}}, acts_1_26_8} + {{2{acts_1_26_9[5]}}, acts_1_26_9};
    registers #(.ARRAY_WIDTH(8)) r_1_26_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_26_1_0), .q(s_1_26_1_0_reg));

    assign s_1_26_1_1 = {{2{acts_1_26_10[5]}}, acts_1_26_10} + {{2{acts_1_26_11[5]}}, acts_1_26_11} + {{2{acts_1_26_13[5]}}, acts_1_26_13} + {{2{acts_1_26_17[5]}}, acts_1_26_17};
    registers #(.ARRAY_WIDTH(8)) r_1_26_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_26_1_1), .q(s_1_26_1_1_reg));

    assign s_1_26_1_2 = {{2{acts_1_26_18[5]}}, acts_1_26_18} + {{2{acts_1_26_21[5]}}, acts_1_26_21} + {{2{acts_1_26_22[5]}}, acts_1_26_22} + {{2{acts_1_26_24[5]}}, acts_1_26_24};
    registers #(.ARRAY_WIDTH(8)) r_1_26_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_26_1_2), .q(s_1_26_1_2_reg));

    assign s_1_26_1_3 = {{2{acts_1_26_28[5]}}, acts_1_26_28} + {{2{acts_1_26_29[5]}}, acts_1_26_29} + {{2{acts_1_26_31[5]}}, acts_1_26_31} + {{2{acts_1_26_34[5]}}, acts_1_26_34};
    registers #(.ARRAY_WIDTH(8)) r_1_26_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_26_1_3), .q(s_1_26_1_3_reg));

    assign s_1_26_1_4 = {{2{acts_1_26_36[5]}}, acts_1_26_36} + {{2{acts_1_26_38[5]}}, acts_1_26_38} + {{2{acts_1_26_39[5]}}, acts_1_26_39} + {{2{acts_1_26_40[5]}}, acts_1_26_40};
    registers #(.ARRAY_WIDTH(8)) r_1_26_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_26_1_4), .q(s_1_26_1_4_reg));

    assign s_1_26_1_5 = {{2{acts_1_26_43[5]}}, acts_1_26_43} + {{2{acts_1_26_44[5]}}, acts_1_26_44} + {{2{acts_1_26_45[5]}}, acts_1_26_45} + {{2{acts_1_26_46[5]}}, acts_1_26_46};
    registers #(.ARRAY_WIDTH(8)) r_1_26_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_26_1_5), .q(s_1_26_1_5_reg));

    assign s_1_26_1_6 = {{2{acts_1_26_47[5]}}, acts_1_26_47} + {{2{acts_1_26_50[5]}}, acts_1_26_50} + {{2{acts_1_26_51[5]}}, acts_1_26_51} + {{2{acts_1_26_52[5]}}, acts_1_26_52};
    registers #(.ARRAY_WIDTH(8)) r_1_26_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_26_1_6), .q(s_1_26_1_6_reg));

    assign s_1_26_1_7 = {{2{acts_1_26_54[5]}}, acts_1_26_54} + {{2{acts_1_26_55[5]}}, acts_1_26_55} + {{2{acts_1_26_56[5]}}, acts_1_26_56} + {{2{acts_1_26_58[5]}}, acts_1_26_58};
    registers #(.ARRAY_WIDTH(8)) r_1_26_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_26_1_7), .q(s_1_26_1_7_reg));

  // Stage 2
    assign s_1_26_2_0 = {{2{s_1_26_1_0_reg[7]}}, s_1_26_1_0_reg} + {{2{s_1_26_1_1_reg[7]}}, s_1_26_1_1_reg} + {{2{s_1_26_1_2_reg[7]}}, s_1_26_1_2_reg} + {{2{s_1_26_1_3_reg[7]}}, s_1_26_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_26_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_26_2_0), .q(s_1_26_2_0_reg));

    assign s_1_26_2_1 = {{2{s_1_26_1_4_reg[7]}}, s_1_26_1_4_reg} + {{2{s_1_26_1_5_reg[7]}}, s_1_26_1_5_reg} + {{2{s_1_26_1_6_reg[7]}}, s_1_26_1_6_reg} + {{2{s_1_26_1_7_reg[7]}}, s_1_26_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_26_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_26_2_1), .q(s_1_26_2_1_reg));

  // Stage 3
    assign sum_1_26 = {{2{s_1_26_2_0_reg[9]}}, s_1_26_2_0_reg} + {{2{s_1_26_2_1_reg[9]}}, s_1_26_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_26), .q(sum_1_26_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_26 (.i_data(sum_1_26_reg), .o_data(out_1_26_sat));


    // Layer 1, Node 27
      logic  [7:0] s_1_27_1_0, s_1_27_1_1, s_1_27_1_2, s_1_27_1_3, s_1_27_1_4, s_1_27_1_5, s_1_27_1_6;
    logic  [7:0] s_1_27_1_0_reg, s_1_27_1_1_reg, s_1_27_1_2_reg, s_1_27_1_3_reg, s_1_27_1_4_reg, s_1_27_1_5_reg, s_1_27_1_6_reg;
    logic  [9:0] s_1_27_2_0, s_1_27_2_1;
    logic  [9:0] s_1_27_2_0_reg, s_1_27_2_1_reg;
    logic [11:0] sum_1_27;
    logic [11:0] sum_1_27_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_0)) 
    rom_1_27_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_27_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_1)) 
    rom_1_27_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_27_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_4)) 
    rom_1_27_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_27_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_6)) 
    rom_1_27_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_27_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_8)) 
    rom_1_27_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_27_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_9)) 
    rom_1_27_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_27_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_11)) 
    rom_1_27_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_27_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_12)) 
    rom_1_27_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_27_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_15)) 
    rom_1_27_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_27_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_16)) 
    rom_1_27_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_27_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_18)) 
    rom_1_27_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_27_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_19)) 
    rom_1_27_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_27_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_22)) 
    rom_1_27_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_27_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_25)) 
    rom_1_27_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_27_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_27)) 
    rom_1_27_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_27_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_29)) 
    rom_1_27_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_27_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_33)) 
    rom_1_27_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_27_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_38)) 
    rom_1_27_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_27_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_40)) 
    rom_1_27_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_27_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_41)) 
    rom_1_27_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_27_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_43)) 
    rom_1_27_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_27_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_45)) 
    rom_1_27_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_27_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_47)) 
    rom_1_27_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_27_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_49)) 
    rom_1_27_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_27_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_54)) 
    rom_1_27_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_27_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_55)) 
    rom_1_27_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_27_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_56)) 
    rom_1_27_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_27_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_27_59)) 
    rom_1_27_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_27_59));

  // Stage 1
    assign s_1_27_1_0 = {{2{acts_1_27_0[5]}}, acts_1_27_0} + {{2{acts_1_27_1[5]}}, acts_1_27_1} + {{2{acts_1_27_4[5]}}, acts_1_27_4} + {{2{acts_1_27_6[5]}}, acts_1_27_6};
    registers #(.ARRAY_WIDTH(8)) r_1_27_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_27_1_0), .q(s_1_27_1_0_reg));

    assign s_1_27_1_1 = {{2{acts_1_27_8[5]}}, acts_1_27_8} + {{2{acts_1_27_9[5]}}, acts_1_27_9} + {{2{acts_1_27_11[5]}}, acts_1_27_11} + {{2{acts_1_27_12[5]}}, acts_1_27_12};
    registers #(.ARRAY_WIDTH(8)) r_1_27_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_27_1_1), .q(s_1_27_1_1_reg));

    assign s_1_27_1_2 = {{2{acts_1_27_15[5]}}, acts_1_27_15} + {{2{acts_1_27_16[5]}}, acts_1_27_16} + {{2{acts_1_27_18[5]}}, acts_1_27_18} + {{2{acts_1_27_19[5]}}, acts_1_27_19};
    registers #(.ARRAY_WIDTH(8)) r_1_27_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_27_1_2), .q(s_1_27_1_2_reg));

    assign s_1_27_1_3 = {{2{acts_1_27_22[5]}}, acts_1_27_22} + {{2{acts_1_27_25[5]}}, acts_1_27_25} + {{2{acts_1_27_27[5]}}, acts_1_27_27} + {{2{acts_1_27_29[5]}}, acts_1_27_29};
    registers #(.ARRAY_WIDTH(8)) r_1_27_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_27_1_3), .q(s_1_27_1_3_reg));

    assign s_1_27_1_4 = {{2{acts_1_27_33[5]}}, acts_1_27_33} + {{2{acts_1_27_38[5]}}, acts_1_27_38} + {{2{acts_1_27_40[5]}}, acts_1_27_40} + {{2{acts_1_27_41[5]}}, acts_1_27_41};
    registers #(.ARRAY_WIDTH(8)) r_1_27_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_27_1_4), .q(s_1_27_1_4_reg));

    assign s_1_27_1_5 = {{2{acts_1_27_43[5]}}, acts_1_27_43} + {{2{acts_1_27_45[5]}}, acts_1_27_45} + {{2{acts_1_27_47[5]}}, acts_1_27_47} + {{2{acts_1_27_49[5]}}, acts_1_27_49};
    registers #(.ARRAY_WIDTH(8)) r_1_27_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_27_1_5), .q(s_1_27_1_5_reg));

    assign s_1_27_1_6 = {{2{acts_1_27_54[5]}}, acts_1_27_54} + {{2{acts_1_27_55[5]}}, acts_1_27_55} + {{2{acts_1_27_56[5]}}, acts_1_27_56} + {{2{acts_1_27_59[5]}}, acts_1_27_59};
    registers #(.ARRAY_WIDTH(8)) r_1_27_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_27_1_6), .q(s_1_27_1_6_reg));

  // Stage 2
    assign s_1_27_2_0 = {{2{s_1_27_1_0_reg[7]}}, s_1_27_1_0_reg} + {{2{s_1_27_1_1_reg[7]}}, s_1_27_1_1_reg} + {{2{s_1_27_1_2_reg[7]}}, s_1_27_1_2_reg} + {{2{s_1_27_1_3_reg[7]}}, s_1_27_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_27_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_27_2_0), .q(s_1_27_2_0_reg));

    assign s_1_27_2_1 = {{2{s_1_27_1_4_reg[7]}}, s_1_27_1_4_reg} + {{2{s_1_27_1_5_reg[7]}}, s_1_27_1_5_reg} + {{2{s_1_27_1_6_reg[7]}}, s_1_27_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_27_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_27_2_1), .q(s_1_27_2_1_reg));

  // Stage 3
    assign sum_1_27 = {{2{s_1_27_2_0_reg[9]}}, s_1_27_2_0_reg} + {{2{s_1_27_2_1_reg[9]}}, s_1_27_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_27), .q(sum_1_27_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_27 (.i_data(sum_1_27_reg), .o_data(out_1_27_sat));


    // Layer 1, Node 28
      logic  [7:0] s_1_28_1_0, s_1_28_1_1, s_1_28_1_2, s_1_28_1_3, s_1_28_1_4, s_1_28_1_5, s_1_28_1_6, s_1_28_1_7, s_1_28_1_8;
    logic  [7:0] s_1_28_1_0_reg, s_1_28_1_1_reg, s_1_28_1_2_reg, s_1_28_1_3_reg, s_1_28_1_4_reg, s_1_28_1_5_reg, s_1_28_1_6_reg, s_1_28_1_7_reg, s_1_28_1_8_reg;
    logic  [9:0] s_1_28_2_0, s_1_28_2_1, s_1_28_2_2;
    logic  [9:0] s_1_28_2_0_reg, s_1_28_2_1_reg, s_1_28_2_2_reg;
    logic [11:0] sum_1_28;
    logic [11:0] sum_1_28_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_0)) 
    rom_1_28_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_28_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_2)) 
    rom_1_28_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_28_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_4)) 
    rom_1_28_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_28_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_5)) 
    rom_1_28_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_28_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_6)) 
    rom_1_28_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_28_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_8)) 
    rom_1_28_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_28_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_9)) 
    rom_1_28_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_28_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_13)) 
    rom_1_28_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_28_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_14)) 
    rom_1_28_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_28_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_15)) 
    rom_1_28_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_15_reg), .o_ld_data(acts_1_28_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_16)) 
    rom_1_28_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_28_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_19)) 
    rom_1_28_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_28_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_20)) 
    rom_1_28_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_28_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_22)) 
    rom_1_28_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_28_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_25)) 
    rom_1_28_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_28_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_26)) 
    rom_1_28_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_28_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_27)) 
    rom_1_28_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_28_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_28)) 
    rom_1_28_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_28_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_29)) 
    rom_1_28_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_28_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_31)) 
    rom_1_28_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_28_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_33)) 
    rom_1_28_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_28_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_34)) 
    rom_1_28_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_28_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_36)) 
    rom_1_28_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_28_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_38)) 
    rom_1_28_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_28_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_39)) 
    rom_1_28_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_28_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_42)) 
    rom_1_28_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_28_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_49)) 
    rom_1_28_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_28_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_52)) 
    rom_1_28_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_28_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_54)) 
    rom_1_28_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_28_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_55)) 
    rom_1_28_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_28_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_56)) 
    rom_1_28_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_28_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_59)) 
    rom_1_28_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_28_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_62)) 
    rom_1_28_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_28_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_28_63)) 
    rom_1_28_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_28_63));

  // Stage 1
    assign s_1_28_1_0 = {{2{acts_1_28_0[5]}}, acts_1_28_0} + {{2{acts_1_28_2[5]}}, acts_1_28_2} + {{2{acts_1_28_4[5]}}, acts_1_28_4} + {{2{acts_1_28_5[5]}}, acts_1_28_5};
    registers #(.ARRAY_WIDTH(8)) r_1_28_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_1_0), .q(s_1_28_1_0_reg));

    assign s_1_28_1_1 = {{2{acts_1_28_6[5]}}, acts_1_28_6} + {{2{acts_1_28_8[5]}}, acts_1_28_8} + {{2{acts_1_28_9[5]}}, acts_1_28_9} + {{2{acts_1_28_13[5]}}, acts_1_28_13};
    registers #(.ARRAY_WIDTH(8)) r_1_28_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_1_1), .q(s_1_28_1_1_reg));

    assign s_1_28_1_2 = {{2{acts_1_28_14[5]}}, acts_1_28_14} + {{2{acts_1_28_15[5]}}, acts_1_28_15} + {{2{acts_1_28_16[5]}}, acts_1_28_16} + {{2{acts_1_28_19[5]}}, acts_1_28_19};
    registers #(.ARRAY_WIDTH(8)) r_1_28_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_1_2), .q(s_1_28_1_2_reg));

    assign s_1_28_1_3 = {{2{acts_1_28_20[5]}}, acts_1_28_20} + {{2{acts_1_28_22[5]}}, acts_1_28_22} + {{2{acts_1_28_25[5]}}, acts_1_28_25} + {{2{acts_1_28_26[5]}}, acts_1_28_26};
    registers #(.ARRAY_WIDTH(8)) r_1_28_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_1_3), .q(s_1_28_1_3_reg));

    assign s_1_28_1_4 = {{2{acts_1_28_27[5]}}, acts_1_28_27} + {{2{acts_1_28_28[5]}}, acts_1_28_28} + {{2{acts_1_28_29[5]}}, acts_1_28_29} + {{2{acts_1_28_31[5]}}, acts_1_28_31};
    registers #(.ARRAY_WIDTH(8)) r_1_28_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_1_4), .q(s_1_28_1_4_reg));

    assign s_1_28_1_5 = {{2{acts_1_28_33[5]}}, acts_1_28_33} + {{2{acts_1_28_34[5]}}, acts_1_28_34} + {{2{acts_1_28_36[5]}}, acts_1_28_36} + {{2{acts_1_28_38[5]}}, acts_1_28_38};
    registers #(.ARRAY_WIDTH(8)) r_1_28_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_1_5), .q(s_1_28_1_5_reg));

    assign s_1_28_1_6 = {{2{acts_1_28_39[5]}}, acts_1_28_39} + {{2{acts_1_28_42[5]}}, acts_1_28_42} + {{2{acts_1_28_49[5]}}, acts_1_28_49} + {{2{acts_1_28_52[5]}}, acts_1_28_52};
    registers #(.ARRAY_WIDTH(8)) r_1_28_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_1_6), .q(s_1_28_1_6_reg));

    assign s_1_28_1_7 = {{2{acts_1_28_54[5]}}, acts_1_28_54} + {{2{acts_1_28_55[5]}}, acts_1_28_55} + {{2{acts_1_28_56[5]}}, acts_1_28_56} + {{2{acts_1_28_59[5]}}, acts_1_28_59};
    registers #(.ARRAY_WIDTH(8)) r_1_28_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_1_7), .q(s_1_28_1_7_reg));

    assign s_1_28_1_8 = {{2{acts_1_28_62[5]}}, acts_1_28_62} + {{2{acts_1_28_63[5]}}, acts_1_28_63};
    registers #(.ARRAY_WIDTH(8)) r_1_28_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_1_8), .q(s_1_28_1_8_reg));

  // Stage 2
    assign s_1_28_2_0 = {{2{s_1_28_1_0_reg[7]}}, s_1_28_1_0_reg} + {{2{s_1_28_1_1_reg[7]}}, s_1_28_1_1_reg} + {{2{s_1_28_1_2_reg[7]}}, s_1_28_1_2_reg} + {{2{s_1_28_1_3_reg[7]}}, s_1_28_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_28_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_2_0), .q(s_1_28_2_0_reg));

    assign s_1_28_2_1 = {{2{s_1_28_1_4_reg[7]}}, s_1_28_1_4_reg} + {{2{s_1_28_1_5_reg[7]}}, s_1_28_1_5_reg} + {{2{s_1_28_1_6_reg[7]}}, s_1_28_1_6_reg} + {{2{s_1_28_1_7_reg[7]}}, s_1_28_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_28_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_2_1), .q(s_1_28_2_1_reg));

    assign s_1_28_2_2 = {{2{s_1_28_1_8_reg[7]}}, s_1_28_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_28_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_28_2_2), .q(s_1_28_2_2_reg));

  // Stage 3
    assign sum_1_28 = {{2{s_1_28_2_0_reg[9]}}, s_1_28_2_0_reg} + {{2{s_1_28_2_1_reg[9]}}, s_1_28_2_1_reg} + {{2{s_1_28_2_2_reg[9]}}, s_1_28_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_28), .q(sum_1_28_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_28 (.i_data(sum_1_28_reg), .o_data(out_1_28_sat));


    // Layer 1, Node 29
      logic  [7:0] s_1_29_1_0, s_1_29_1_1, s_1_29_1_2, s_1_29_1_3, s_1_29_1_4, s_1_29_1_5, s_1_29_1_6, s_1_29_1_7, s_1_29_1_8;
    logic  [7:0] s_1_29_1_0_reg, s_1_29_1_1_reg, s_1_29_1_2_reg, s_1_29_1_3_reg, s_1_29_1_4_reg, s_1_29_1_5_reg, s_1_29_1_6_reg, s_1_29_1_7_reg, s_1_29_1_8_reg;
    logic  [9:0] s_1_29_2_0, s_1_29_2_1, s_1_29_2_2;
    logic  [9:0] s_1_29_2_0_reg, s_1_29_2_1_reg, s_1_29_2_2_reg;
    logic [11:0] sum_1_29;
    logic [11:0] sum_1_29_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_0)) 
    rom_1_29_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_29_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_1)) 
    rom_1_29_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_29_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_2)) 
    rom_1_29_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_2_reg), .o_ld_data(acts_1_29_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_5)) 
    rom_1_29_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_5_reg), .o_ld_data(acts_1_29_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_10)) 
    rom_1_29_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_10_reg), .o_ld_data(acts_1_29_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_11)) 
    rom_1_29_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_29_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_12)) 
    rom_1_29_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_12_reg), .o_ld_data(acts_1_29_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_13)) 
    rom_1_29_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_29_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_14)) 
    rom_1_29_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_29_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_16)) 
    rom_1_29_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_29_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_17)) 
    rom_1_29_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_29_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_18)) 
    rom_1_29_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_29_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_21)) 
    rom_1_29_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_29_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_22)) 
    rom_1_29_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_29_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_23)) 
    rom_1_29_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_29_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_26)) 
    rom_1_29_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_29_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_29)) 
    rom_1_29_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_29_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_31)) 
    rom_1_29_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_29_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_33)) 
    rom_1_29_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_29_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_36)) 
    rom_1_29_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_29_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_37)) 
    rom_1_29_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_29_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_38)) 
    rom_1_29_38 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_38_reg), .o_ld_data(acts_1_29_38));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_40)) 
    rom_1_29_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_29_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_41)) 
    rom_1_29_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_29_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_44)) 
    rom_1_29_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_29_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_45)) 
    rom_1_29_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_29_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_50)) 
    rom_1_29_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_29_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_52)) 
    rom_1_29_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_29_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_53)) 
    rom_1_29_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_29_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_54)) 
    rom_1_29_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_29_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_55)) 
    rom_1_29_55 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_55_reg), .o_ld_data(acts_1_29_55));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_56)) 
    rom_1_29_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_29_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_57)) 
    rom_1_29_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_29_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_29_63)) 
    rom_1_29_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_29_63));

  // Stage 1
    assign s_1_29_1_0 = {{2{acts_1_29_0[5]}}, acts_1_29_0} + {{2{acts_1_29_1[5]}}, acts_1_29_1} + {{2{acts_1_29_2[5]}}, acts_1_29_2} + {{2{acts_1_29_5[5]}}, acts_1_29_5};
    registers #(.ARRAY_WIDTH(8)) r_1_29_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_1_0), .q(s_1_29_1_0_reg));

    assign s_1_29_1_1 = {{2{acts_1_29_10[5]}}, acts_1_29_10} + {{2{acts_1_29_11[5]}}, acts_1_29_11} + {{2{acts_1_29_12[5]}}, acts_1_29_12} + {{2{acts_1_29_13[5]}}, acts_1_29_13};
    registers #(.ARRAY_WIDTH(8)) r_1_29_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_1_1), .q(s_1_29_1_1_reg));

    assign s_1_29_1_2 = {{2{acts_1_29_14[5]}}, acts_1_29_14} + {{2{acts_1_29_16[5]}}, acts_1_29_16} + {{2{acts_1_29_17[5]}}, acts_1_29_17} + {{2{acts_1_29_18[5]}}, acts_1_29_18};
    registers #(.ARRAY_WIDTH(8)) r_1_29_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_1_2), .q(s_1_29_1_2_reg));

    assign s_1_29_1_3 = {{2{acts_1_29_21[5]}}, acts_1_29_21} + {{2{acts_1_29_22[5]}}, acts_1_29_22} + {{2{acts_1_29_23[5]}}, acts_1_29_23} + {{2{acts_1_29_26[5]}}, acts_1_29_26};
    registers #(.ARRAY_WIDTH(8)) r_1_29_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_1_3), .q(s_1_29_1_3_reg));

    assign s_1_29_1_4 = {{2{acts_1_29_29[5]}}, acts_1_29_29} + {{2{acts_1_29_31[5]}}, acts_1_29_31} + {{2{acts_1_29_33[5]}}, acts_1_29_33} + {{2{acts_1_29_36[5]}}, acts_1_29_36};
    registers #(.ARRAY_WIDTH(8)) r_1_29_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_1_4), .q(s_1_29_1_4_reg));

    assign s_1_29_1_5 = {{2{acts_1_29_37[5]}}, acts_1_29_37} + {{2{acts_1_29_38[5]}}, acts_1_29_38} + {{2{acts_1_29_40[5]}}, acts_1_29_40} + {{2{acts_1_29_41[5]}}, acts_1_29_41};
    registers #(.ARRAY_WIDTH(8)) r_1_29_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_1_5), .q(s_1_29_1_5_reg));

    assign s_1_29_1_6 = {{2{acts_1_29_44[5]}}, acts_1_29_44} + {{2{acts_1_29_45[5]}}, acts_1_29_45} + {{2{acts_1_29_50[5]}}, acts_1_29_50} + {{2{acts_1_29_52[5]}}, acts_1_29_52};
    registers #(.ARRAY_WIDTH(8)) r_1_29_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_1_6), .q(s_1_29_1_6_reg));

    assign s_1_29_1_7 = {{2{acts_1_29_53[5]}}, acts_1_29_53} + {{2{acts_1_29_54[5]}}, acts_1_29_54} + {{2{acts_1_29_55[5]}}, acts_1_29_55} + {{2{acts_1_29_56[5]}}, acts_1_29_56};
    registers #(.ARRAY_WIDTH(8)) r_1_29_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_1_7), .q(s_1_29_1_7_reg));

    assign s_1_29_1_8 = {{2{acts_1_29_57[5]}}, acts_1_29_57} + {{2{acts_1_29_63[5]}}, acts_1_29_63};
    registers #(.ARRAY_WIDTH(8)) r_1_29_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_1_8), .q(s_1_29_1_8_reg));

  // Stage 2
    assign s_1_29_2_0 = {{2{s_1_29_1_0_reg[7]}}, s_1_29_1_0_reg} + {{2{s_1_29_1_1_reg[7]}}, s_1_29_1_1_reg} + {{2{s_1_29_1_2_reg[7]}}, s_1_29_1_2_reg} + {{2{s_1_29_1_3_reg[7]}}, s_1_29_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_29_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_2_0), .q(s_1_29_2_0_reg));

    assign s_1_29_2_1 = {{2{s_1_29_1_4_reg[7]}}, s_1_29_1_4_reg} + {{2{s_1_29_1_5_reg[7]}}, s_1_29_1_5_reg} + {{2{s_1_29_1_6_reg[7]}}, s_1_29_1_6_reg} + {{2{s_1_29_1_7_reg[7]}}, s_1_29_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_29_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_2_1), .q(s_1_29_2_1_reg));

    assign s_1_29_2_2 = {{2{s_1_29_1_8_reg[7]}}, s_1_29_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_29_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_29_2_2), .q(s_1_29_2_2_reg));

  // Stage 3
    assign sum_1_29 = {{2{s_1_29_2_0_reg[9]}}, s_1_29_2_0_reg} + {{2{s_1_29_2_1_reg[9]}}, s_1_29_2_1_reg} + {{2{s_1_29_2_2_reg[9]}}, s_1_29_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_29), .q(sum_1_29_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_29 (.i_data(sum_1_29_reg), .o_data(out_1_29_sat));


    // Layer 1, Node 30
      logic  [7:0] s_1_30_1_0, s_1_30_1_1, s_1_30_1_2, s_1_30_1_3, s_1_30_1_4, s_1_30_1_5, s_1_30_1_6, s_1_30_1_7, s_1_30_1_8;
    logic  [7:0] s_1_30_1_0_reg, s_1_30_1_1_reg, s_1_30_1_2_reg, s_1_30_1_3_reg, s_1_30_1_4_reg, s_1_30_1_5_reg, s_1_30_1_6_reg, s_1_30_1_7_reg, s_1_30_1_8_reg;
    logic  [9:0] s_1_30_2_0, s_1_30_2_1, s_1_30_2_2;
    logic  [9:0] s_1_30_2_0_reg, s_1_30_2_1_reg, s_1_30_2_2_reg;
    logic [11:0] sum_1_30;
    logic [11:0] sum_1_30_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_0)) 
    rom_1_30_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_0_reg), .o_ld_data(acts_1_30_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_1)) 
    rom_1_30_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_1_reg), .o_ld_data(acts_1_30_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_3)) 
    rom_1_30_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_3_reg), .o_ld_data(acts_1_30_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_4)) 
    rom_1_30_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_30_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_13)) 
    rom_1_30_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_13_reg), .o_ld_data(acts_1_30_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_14)) 
    rom_1_30_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_14_reg), .o_ld_data(acts_1_30_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_17)) 
    rom_1_30_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_30_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_18)) 
    rom_1_30_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_18_reg), .o_ld_data(acts_1_30_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_19)) 
    rom_1_30_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_30_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_20)) 
    rom_1_30_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_30_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_21)) 
    rom_1_30_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_30_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_22)) 
    rom_1_30_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_30_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_24)) 
    rom_1_30_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_24_reg), .o_ld_data(acts_1_30_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_25)) 
    rom_1_30_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_25_reg), .o_ld_data(acts_1_30_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_27)) 
    rom_1_30_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_27_reg), .o_ld_data(acts_1_30_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_28)) 
    rom_1_30_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_28_reg), .o_ld_data(acts_1_30_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_30)) 
    rom_1_30_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_30_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_31)) 
    rom_1_30_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_31_reg), .o_ld_data(acts_1_30_31));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_32)) 
    rom_1_30_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_30_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_35)) 
    rom_1_30_35 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_35_reg), .o_ld_data(acts_1_30_35));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_36)) 
    rom_1_30_36 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_36_reg), .o_ld_data(acts_1_30_36));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_37)) 
    rom_1_30_37 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_37_reg), .o_ld_data(acts_1_30_37));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_41)) 
    rom_1_30_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_30_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_43)) 
    rom_1_30_43 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_43_reg), .o_ld_data(acts_1_30_43));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_44)) 
    rom_1_30_44 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_44_reg), .o_ld_data(acts_1_30_44));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_46)) 
    rom_1_30_46 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_46_reg), .o_ld_data(acts_1_30_46));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_47)) 
    rom_1_30_47 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_47_reg), .o_ld_data(acts_1_30_47));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_48)) 
    rom_1_30_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_30_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_49)) 
    rom_1_30_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_30_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_50)) 
    rom_1_30_50 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_50_reg), .o_ld_data(acts_1_30_50));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_51)) 
    rom_1_30_51 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_51_reg), .o_ld_data(acts_1_30_51));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_52)) 
    rom_1_30_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_30_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_53)) 
    rom_1_30_53 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_53_reg), .o_ld_data(acts_1_30_53));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_57)) 
    rom_1_30_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_30_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_62)) 
    rom_1_30_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_30_62));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_30_63)) 
    rom_1_30_63 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_63_reg), .o_ld_data(acts_1_30_63));

  // Stage 1
    assign s_1_30_1_0 = {{2{acts_1_30_0[5]}}, acts_1_30_0} + {{2{acts_1_30_1[5]}}, acts_1_30_1} + {{2{acts_1_30_3[5]}}, acts_1_30_3} + {{2{acts_1_30_4[5]}}, acts_1_30_4};
    registers #(.ARRAY_WIDTH(8)) r_1_30_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_1_0), .q(s_1_30_1_0_reg));

    assign s_1_30_1_1 = {{2{acts_1_30_13[5]}}, acts_1_30_13} + {{2{acts_1_30_14[5]}}, acts_1_30_14} + {{2{acts_1_30_17[5]}}, acts_1_30_17} + {{2{acts_1_30_18[5]}}, acts_1_30_18};
    registers #(.ARRAY_WIDTH(8)) r_1_30_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_1_1), .q(s_1_30_1_1_reg));

    assign s_1_30_1_2 = {{2{acts_1_30_19[5]}}, acts_1_30_19} + {{2{acts_1_30_20[5]}}, acts_1_30_20} + {{2{acts_1_30_21[5]}}, acts_1_30_21} + {{2{acts_1_30_22[5]}}, acts_1_30_22};
    registers #(.ARRAY_WIDTH(8)) r_1_30_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_1_2), .q(s_1_30_1_2_reg));

    assign s_1_30_1_3 = {{2{acts_1_30_24[5]}}, acts_1_30_24} + {{2{acts_1_30_25[5]}}, acts_1_30_25} + {{2{acts_1_30_27[5]}}, acts_1_30_27} + {{2{acts_1_30_28[5]}}, acts_1_30_28};
    registers #(.ARRAY_WIDTH(8)) r_1_30_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_1_3), .q(s_1_30_1_3_reg));

    assign s_1_30_1_4 = {{2{acts_1_30_30[5]}}, acts_1_30_30} + {{2{acts_1_30_31[5]}}, acts_1_30_31} + {{2{acts_1_30_32[5]}}, acts_1_30_32} + {{2{acts_1_30_35[5]}}, acts_1_30_35};
    registers #(.ARRAY_WIDTH(8)) r_1_30_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_1_4), .q(s_1_30_1_4_reg));

    assign s_1_30_1_5 = {{2{acts_1_30_36[5]}}, acts_1_30_36} + {{2{acts_1_30_37[5]}}, acts_1_30_37} + {{2{acts_1_30_41[5]}}, acts_1_30_41} + {{2{acts_1_30_43[5]}}, acts_1_30_43};
    registers #(.ARRAY_WIDTH(8)) r_1_30_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_1_5), .q(s_1_30_1_5_reg));

    assign s_1_30_1_6 = {{2{acts_1_30_44[5]}}, acts_1_30_44} + {{2{acts_1_30_46[5]}}, acts_1_30_46} + {{2{acts_1_30_47[5]}}, acts_1_30_47} + {{2{acts_1_30_48[5]}}, acts_1_30_48};
    registers #(.ARRAY_WIDTH(8)) r_1_30_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_1_6), .q(s_1_30_1_6_reg));

    assign s_1_30_1_7 = {{2{acts_1_30_49[5]}}, acts_1_30_49} + {{2{acts_1_30_50[5]}}, acts_1_30_50} + {{2{acts_1_30_51[5]}}, acts_1_30_51} + {{2{acts_1_30_52[5]}}, acts_1_30_52};
    registers #(.ARRAY_WIDTH(8)) r_1_30_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_1_7), .q(s_1_30_1_7_reg));

    assign s_1_30_1_8 = {{2{acts_1_30_53[5]}}, acts_1_30_53} + {{2{acts_1_30_57[5]}}, acts_1_30_57} + {{2{acts_1_30_62[5]}}, acts_1_30_62} + {{2{acts_1_30_63[5]}}, acts_1_30_63};
    registers #(.ARRAY_WIDTH(8)) r_1_30_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_1_8), .q(s_1_30_1_8_reg));

  // Stage 2
    assign s_1_30_2_0 = {{2{s_1_30_1_0_reg[7]}}, s_1_30_1_0_reg} + {{2{s_1_30_1_1_reg[7]}}, s_1_30_1_1_reg} + {{2{s_1_30_1_2_reg[7]}}, s_1_30_1_2_reg} + {{2{s_1_30_1_3_reg[7]}}, s_1_30_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_30_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_2_0), .q(s_1_30_2_0_reg));

    assign s_1_30_2_1 = {{2{s_1_30_1_4_reg[7]}}, s_1_30_1_4_reg} + {{2{s_1_30_1_5_reg[7]}}, s_1_30_1_5_reg} + {{2{s_1_30_1_6_reg[7]}}, s_1_30_1_6_reg} + {{2{s_1_30_1_7_reg[7]}}, s_1_30_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_30_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_2_1), .q(s_1_30_2_1_reg));

    assign s_1_30_2_2 = {{2{s_1_30_1_8_reg[7]}}, s_1_30_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_30_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_30_2_2), .q(s_1_30_2_2_reg));

  // Stage 3
    assign sum_1_30 = {{2{s_1_30_2_0_reg[9]}}, s_1_30_2_0_reg} + {{2{s_1_30_2_1_reg[9]}}, s_1_30_2_1_reg} + {{2{s_1_30_2_2_reg[9]}}, s_1_30_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_30), .q(sum_1_30_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_30 (.i_data(sum_1_30_reg), .o_data(out_1_30_sat));


    // Layer 1, Node 31
      logic  [7:0] s_1_31_1_0, s_1_31_1_1, s_1_31_1_2, s_1_31_1_3, s_1_31_1_4, s_1_31_1_5, s_1_31_1_6, s_1_31_1_7, s_1_31_1_8;
    logic  [7:0] s_1_31_1_0_reg, s_1_31_1_1_reg, s_1_31_1_2_reg, s_1_31_1_3_reg, s_1_31_1_4_reg, s_1_31_1_5_reg, s_1_31_1_6_reg, s_1_31_1_7_reg, s_1_31_1_8_reg;
    logic  [9:0] s_1_31_2_0, s_1_31_2_1, s_1_31_2_2;
    logic  [9:0] s_1_31_2_0_reg, s_1_31_2_1_reg, s_1_31_2_2_reg;
    logic [11:0] sum_1_31;
    logic [11:0] sum_1_31_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_4)) 
    rom_1_31_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_4_reg), .o_ld_data(acts_1_31_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_6)) 
    rom_1_31_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_6_reg), .o_ld_data(acts_1_31_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_7)) 
    rom_1_31_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_7_reg), .o_ld_data(acts_1_31_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_8)) 
    rom_1_31_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_8_reg), .o_ld_data(acts_1_31_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_9)) 
    rom_1_31_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_9_reg), .o_ld_data(acts_1_31_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_11)) 
    rom_1_31_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_11_reg), .o_ld_data(acts_1_31_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_16)) 
    rom_1_31_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_16_reg), .o_ld_data(acts_1_31_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_17)) 
    rom_1_31_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_17_reg), .o_ld_data(acts_1_31_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_19)) 
    rom_1_31_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_19_reg), .o_ld_data(acts_1_31_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_20)) 
    rom_1_31_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_20_reg), .o_ld_data(acts_1_31_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_21)) 
    rom_1_31_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_21_reg), .o_ld_data(acts_1_31_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_22)) 
    rom_1_31_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_22_reg), .o_ld_data(acts_1_31_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_23)) 
    rom_1_31_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_23_reg), .o_ld_data(acts_1_31_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_26)) 
    rom_1_31_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_26_reg), .o_ld_data(acts_1_31_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_29)) 
    rom_1_31_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_29_reg), .o_ld_data(acts_1_31_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_30)) 
    rom_1_31_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_30_reg), .o_ld_data(acts_1_31_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_32)) 
    rom_1_31_32 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_32_reg), .o_ld_data(acts_1_31_32));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_33)) 
    rom_1_31_33 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_33_reg), .o_ld_data(acts_1_31_33));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_34)) 
    rom_1_31_34 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_34_reg), .o_ld_data(acts_1_31_34));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_39)) 
    rom_1_31_39 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_39_reg), .o_ld_data(acts_1_31_39));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_40)) 
    rom_1_31_40 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_40_reg), .o_ld_data(acts_1_31_40));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_41)) 
    rom_1_31_41 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_41_reg), .o_ld_data(acts_1_31_41));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_42)) 
    rom_1_31_42 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_42_reg), .o_ld_data(acts_1_31_42));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_45)) 
    rom_1_31_45 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_45_reg), .o_ld_data(acts_1_31_45));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_48)) 
    rom_1_31_48 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_48_reg), .o_ld_data(acts_1_31_48));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_49)) 
    rom_1_31_49 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_49_reg), .o_ld_data(acts_1_31_49));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_52)) 
    rom_1_31_52 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_52_reg), .o_ld_data(acts_1_31_52));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_54)) 
    rom_1_31_54 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_54_reg), .o_ld_data(acts_1_31_54));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_56)) 
    rom_1_31_56 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_56_reg), .o_ld_data(acts_1_31_56));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_57)) 
    rom_1_31_57 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_57_reg), .o_ld_data(acts_1_31_57));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_58)) 
    rom_1_31_58 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_58_reg), .o_ld_data(acts_1_31_58));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_59)) 
    rom_1_31_59 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_59_reg), .o_ld_data(acts_1_31_59));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_60)) 
    rom_1_31_60 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_60_reg), .o_ld_data(acts_1_31_60));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_61)) 
    rom_1_31_61 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_61_reg), .o_ld_data(acts_1_31_61));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_1_31_62)) 
    rom_1_31_62 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_0_62_reg), .o_ld_data(acts_1_31_62));

  // Stage 1
    assign s_1_31_1_0 = {{2{acts_1_31_4[5]}}, acts_1_31_4} + {{2{acts_1_31_6[5]}}, acts_1_31_6} + {{2{acts_1_31_7[5]}}, acts_1_31_7} + {{2{acts_1_31_8[5]}}, acts_1_31_8};
    registers #(.ARRAY_WIDTH(8)) r_1_31_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_1_0), .q(s_1_31_1_0_reg));

    assign s_1_31_1_1 = {{2{acts_1_31_9[5]}}, acts_1_31_9} + {{2{acts_1_31_11[5]}}, acts_1_31_11} + {{2{acts_1_31_16[5]}}, acts_1_31_16} + {{2{acts_1_31_17[5]}}, acts_1_31_17};
    registers #(.ARRAY_WIDTH(8)) r_1_31_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_1_1), .q(s_1_31_1_1_reg));

    assign s_1_31_1_2 = {{2{acts_1_31_19[5]}}, acts_1_31_19} + {{2{acts_1_31_20[5]}}, acts_1_31_20} + {{2{acts_1_31_21[5]}}, acts_1_31_21} + {{2{acts_1_31_22[5]}}, acts_1_31_22};
    registers #(.ARRAY_WIDTH(8)) r_1_31_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_1_2), .q(s_1_31_1_2_reg));

    assign s_1_31_1_3 = {{2{acts_1_31_23[5]}}, acts_1_31_23} + {{2{acts_1_31_26[5]}}, acts_1_31_26} + {{2{acts_1_31_29[5]}}, acts_1_31_29} + {{2{acts_1_31_30[5]}}, acts_1_31_30};
    registers #(.ARRAY_WIDTH(8)) r_1_31_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_1_3), .q(s_1_31_1_3_reg));

    assign s_1_31_1_4 = {{2{acts_1_31_32[5]}}, acts_1_31_32} + {{2{acts_1_31_33[5]}}, acts_1_31_33} + {{2{acts_1_31_34[5]}}, acts_1_31_34} + {{2{acts_1_31_39[5]}}, acts_1_31_39};
    registers #(.ARRAY_WIDTH(8)) r_1_31_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_1_4), .q(s_1_31_1_4_reg));

    assign s_1_31_1_5 = {{2{acts_1_31_40[5]}}, acts_1_31_40} + {{2{acts_1_31_41[5]}}, acts_1_31_41} + {{2{acts_1_31_42[5]}}, acts_1_31_42} + {{2{acts_1_31_45[5]}}, acts_1_31_45};
    registers #(.ARRAY_WIDTH(8)) r_1_31_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_1_5), .q(s_1_31_1_5_reg));

    assign s_1_31_1_6 = {{2{acts_1_31_48[5]}}, acts_1_31_48} + {{2{acts_1_31_49[5]}}, acts_1_31_49} + {{2{acts_1_31_52[5]}}, acts_1_31_52} + {{2{acts_1_31_54[5]}}, acts_1_31_54};
    registers #(.ARRAY_WIDTH(8)) r_1_31_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_1_6), .q(s_1_31_1_6_reg));

    assign s_1_31_1_7 = {{2{acts_1_31_56[5]}}, acts_1_31_56} + {{2{acts_1_31_57[5]}}, acts_1_31_57} + {{2{acts_1_31_58[5]}}, acts_1_31_58} + {{2{acts_1_31_59[5]}}, acts_1_31_59};
    registers #(.ARRAY_WIDTH(8)) r_1_31_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_1_7), .q(s_1_31_1_7_reg));

    assign s_1_31_1_8 = {{2{acts_1_31_60[5]}}, acts_1_31_60} + {{2{acts_1_31_61[5]}}, acts_1_31_61} + {{2{acts_1_31_62[5]}}, acts_1_31_62};
    registers #(.ARRAY_WIDTH(8)) r_1_31_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_1_8), .q(s_1_31_1_8_reg));

  // Stage 2
    assign s_1_31_2_0 = {{2{s_1_31_1_0_reg[7]}}, s_1_31_1_0_reg} + {{2{s_1_31_1_1_reg[7]}}, s_1_31_1_1_reg} + {{2{s_1_31_1_2_reg[7]}}, s_1_31_1_2_reg} + {{2{s_1_31_1_3_reg[7]}}, s_1_31_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_31_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_2_0), .q(s_1_31_2_0_reg));

    assign s_1_31_2_1 = {{2{s_1_31_1_4_reg[7]}}, s_1_31_1_4_reg} + {{2{s_1_31_1_5_reg[7]}}, s_1_31_1_5_reg} + {{2{s_1_31_1_6_reg[7]}}, s_1_31_1_6_reg} + {{2{s_1_31_1_7_reg[7]}}, s_1_31_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_31_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_2_1), .q(s_1_31_2_1_reg));

    assign s_1_31_2_2 = {{2{s_1_31_1_8_reg[7]}}, s_1_31_1_8_reg};
    registers #(.ARRAY_WIDTH(10)) r_1_31_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_1_31_2_2), .q(s_1_31_2_2_reg));

  // Stage 3
    assign sum_1_31 = {{2{s_1_31_2_0_reg[9]}}, s_1_31_2_0_reg} + {{2{s_1_31_2_1_reg[9]}}, s_1_31_2_1_reg} + {{2{s_1_31_2_2_reg[9]}}, s_1_31_2_2_reg};
    registers #(.ARRAY_WIDTH(12)) r_1_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_1_31), .q(sum_1_31_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_1_31 (.i_data(sum_1_31_reg), .o_data(out_1_31_sat));


  registers #(.ARRAY_WIDTH(6)) node_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_0_sat), .q(out_1_0_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_1_sat), .q(out_1_1_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_2_sat), .q(out_1_2_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_3_sat), .q(out_1_3_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_4_sat), .q(out_1_4_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_5_sat), .q(out_1_5_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_6_sat), .q(out_1_6_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_7_sat), .q(out_1_7_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_8_sat), .q(out_1_8_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_9_sat), .q(out_1_9_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_10_sat), .q(out_1_10_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_11_sat), .q(out_1_11_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_12_sat), .q(out_1_12_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_13_sat), .q(out_1_13_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_14_sat), .q(out_1_14_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_15_sat), .q(out_1_15_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_16_sat), .q(out_1_16_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_17_sat), .q(out_1_17_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_18_sat), .q(out_1_18_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_19_sat), .q(out_1_19_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_20_sat), .q(out_1_20_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_21_sat), .q(out_1_21_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_22_sat), .q(out_1_22_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_23_sat), .q(out_1_23_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_24_sat), .q(out_1_24_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_25_sat), .q(out_1_25_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_26_sat), .q(out_1_26_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_27_sat), .q(out_1_27_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_28_sat), .q(out_1_28_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_29_sat), .q(out_1_29_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_30_sat), .q(out_1_30_reg));

    registers #(.ARRAY_WIDTH(6)) node_1_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(out_1_31_sat), .q(out_1_31_reg));


    // Layer 2, Node 0
      logic  [7:0] s_2_0_1_0, s_2_0_1_1, s_2_0_1_2, s_2_0_1_3, s_2_0_1_4, s_2_0_1_5, s_2_0_1_6, s_2_0_1_7;
    logic  [7:0] s_2_0_1_0_reg, s_2_0_1_1_reg, s_2_0_1_2_reg, s_2_0_1_3_reg, s_2_0_1_4_reg, s_2_0_1_5_reg, s_2_0_1_6_reg, s_2_0_1_7_reg;
    logic  [9:0] s_2_0_2_0, s_2_0_2_1;
    logic  [9:0] s_2_0_2_0_reg, s_2_0_2_1_reg;
    logic [11:0] sum_2_0;
    logic [11:0] sum_2_0_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_0)) 
    rom_2_0_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_0_reg), .o_ld_data(acts_2_0_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_1)) 
    rom_2_0_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_1_reg), .o_ld_data(acts_2_0_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_2)) 
    rom_2_0_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_2_reg), .o_ld_data(acts_2_0_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_3)) 
    rom_2_0_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_3_reg), .o_ld_data(acts_2_0_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_4)) 
    rom_2_0_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_4_reg), .o_ld_data(acts_2_0_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_5)) 
    rom_2_0_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_5_reg), .o_ld_data(acts_2_0_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_6)) 
    rom_2_0_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_6_reg), .o_ld_data(acts_2_0_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_7)) 
    rom_2_0_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_7_reg), .o_ld_data(acts_2_0_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_8)) 
    rom_2_0_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_8_reg), .o_ld_data(acts_2_0_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_9)) 
    rom_2_0_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_9_reg), .o_ld_data(acts_2_0_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_10)) 
    rom_2_0_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_10_reg), .o_ld_data(acts_2_0_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_11)) 
    rom_2_0_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_11_reg), .o_ld_data(acts_2_0_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_12)) 
    rom_2_0_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_12_reg), .o_ld_data(acts_2_0_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_13)) 
    rom_2_0_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_13_reg), .o_ld_data(acts_2_0_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_14)) 
    rom_2_0_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_14_reg), .o_ld_data(acts_2_0_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_15)) 
    rom_2_0_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_15_reg), .o_ld_data(acts_2_0_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_16)) 
    rom_2_0_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_16_reg), .o_ld_data(acts_2_0_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_17)) 
    rom_2_0_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_17_reg), .o_ld_data(acts_2_0_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_18)) 
    rom_2_0_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_18_reg), .o_ld_data(acts_2_0_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_20)) 
    rom_2_0_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_20_reg), .o_ld_data(acts_2_0_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_21)) 
    rom_2_0_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_21_reg), .o_ld_data(acts_2_0_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_22)) 
    rom_2_0_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_22_reg), .o_ld_data(acts_2_0_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_23)) 
    rom_2_0_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_23_reg), .o_ld_data(acts_2_0_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_24)) 
    rom_2_0_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_24_reg), .o_ld_data(acts_2_0_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_25)) 
    rom_2_0_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_25_reg), .o_ld_data(acts_2_0_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_26)) 
    rom_2_0_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_26_reg), .o_ld_data(acts_2_0_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_27)) 
    rom_2_0_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_27_reg), .o_ld_data(acts_2_0_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_28)) 
    rom_2_0_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_28_reg), .o_ld_data(acts_2_0_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_0_31)) 
    rom_2_0_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_31_reg), .o_ld_data(acts_2_0_31));

  // Stage 1
    assign s_2_0_1_0 = {{2{acts_2_0_0[5]}}, acts_2_0_0} + {{2{acts_2_0_1[5]}}, acts_2_0_1} + {{2{acts_2_0_2[5]}}, acts_2_0_2} + {{2{acts_2_0_3[5]}}, acts_2_0_3};
    registers #(.ARRAY_WIDTH(8)) r_2_0_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_0_1_0), .q(s_2_0_1_0_reg));

    assign s_2_0_1_1 = {{2{acts_2_0_4[5]}}, acts_2_0_4} + {{2{acts_2_0_5[5]}}, acts_2_0_5} + {{2{acts_2_0_6[5]}}, acts_2_0_6} + {{2{acts_2_0_7[5]}}, acts_2_0_7};
    registers #(.ARRAY_WIDTH(8)) r_2_0_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_0_1_1), .q(s_2_0_1_1_reg));

    assign s_2_0_1_2 = {{2{acts_2_0_8[5]}}, acts_2_0_8} + {{2{acts_2_0_9[5]}}, acts_2_0_9} + {{2{acts_2_0_10[5]}}, acts_2_0_10} + {{2{acts_2_0_11[5]}}, acts_2_0_11};
    registers #(.ARRAY_WIDTH(8)) r_2_0_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_0_1_2), .q(s_2_0_1_2_reg));

    assign s_2_0_1_3 = {{2{acts_2_0_12[5]}}, acts_2_0_12} + {{2{acts_2_0_13[5]}}, acts_2_0_13} + {{2{acts_2_0_14[5]}}, acts_2_0_14} + {{2{acts_2_0_15[5]}}, acts_2_0_15};
    registers #(.ARRAY_WIDTH(8)) r_2_0_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_0_1_3), .q(s_2_0_1_3_reg));

    assign s_2_0_1_4 = {{2{acts_2_0_16[5]}}, acts_2_0_16} + {{2{acts_2_0_17[5]}}, acts_2_0_17} + {{2{acts_2_0_18[5]}}, acts_2_0_18} + {{2{acts_2_0_20[5]}}, acts_2_0_20};
    registers #(.ARRAY_WIDTH(8)) r_2_0_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_0_1_4), .q(s_2_0_1_4_reg));

    assign s_2_0_1_5 = {{2{acts_2_0_21[5]}}, acts_2_0_21} + {{2{acts_2_0_22[5]}}, acts_2_0_22} + {{2{acts_2_0_23[5]}}, acts_2_0_23} + {{2{acts_2_0_24[5]}}, acts_2_0_24};
    registers #(.ARRAY_WIDTH(8)) r_2_0_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_0_1_5), .q(s_2_0_1_5_reg));

    assign s_2_0_1_6 = {{2{acts_2_0_25[5]}}, acts_2_0_25} + {{2{acts_2_0_26[5]}}, acts_2_0_26} + {{2{acts_2_0_27[5]}}, acts_2_0_27} + {{2{acts_2_0_28[5]}}, acts_2_0_28};
    registers #(.ARRAY_WIDTH(8)) r_2_0_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_0_1_6), .q(s_2_0_1_6_reg));

    assign s_2_0_1_7 = {{2{acts_2_0_31[5]}}, acts_2_0_31};
    registers #(.ARRAY_WIDTH(8)) r_2_0_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_0_1_7), .q(s_2_0_1_7_reg));

  // Stage 2
    assign s_2_0_2_0 = {{2{s_2_0_1_0_reg[7]}}, s_2_0_1_0_reg} + {{2{s_2_0_1_1_reg[7]}}, s_2_0_1_1_reg} + {{2{s_2_0_1_2_reg[7]}}, s_2_0_1_2_reg} + {{2{s_2_0_1_3_reg[7]}}, s_2_0_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_0_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_0_2_0), .q(s_2_0_2_0_reg));

    assign s_2_0_2_1 = {{2{s_2_0_1_4_reg[7]}}, s_2_0_1_4_reg} + {{2{s_2_0_1_5_reg[7]}}, s_2_0_1_5_reg} + {{2{s_2_0_1_6_reg[7]}}, s_2_0_1_6_reg} + {{2{s_2_0_1_7_reg[7]}}, s_2_0_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_0_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_0_2_1), .q(s_2_0_2_1_reg));

  // Stage 3
    assign sum_2_0 = {{2{s_2_0_2_0_reg[9]}}, s_2_0_2_0_reg} + {{2{s_2_0_2_1_reg[9]}}, s_2_0_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_2_0), .q(sum_2_0_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_2_0 (.i_data(sum_2_0_reg), .o_data(o_vector[0]));


    // Layer 2, Node 1
      logic  [7:0] s_2_1_1_0, s_2_1_1_1, s_2_1_1_2, s_2_1_1_3, s_2_1_1_4, s_2_1_1_5, s_2_1_1_6;
    logic  [7:0] s_2_1_1_0_reg, s_2_1_1_1_reg, s_2_1_1_2_reg, s_2_1_1_3_reg, s_2_1_1_4_reg, s_2_1_1_5_reg, s_2_1_1_6_reg;
    logic  [9:0] s_2_1_2_0, s_2_1_2_1;
    logic  [9:0] s_2_1_2_0_reg, s_2_1_2_1_reg;
    logic [11:0] sum_2_1;
    logic [11:0] sum_2_1_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_0)) 
    rom_2_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_0_reg), .o_ld_data(acts_2_1_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_1)) 
    rom_2_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_1_reg), .o_ld_data(acts_2_1_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_2)) 
    rom_2_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_2_reg), .o_ld_data(acts_2_1_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_3)) 
    rom_2_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_3_reg), .o_ld_data(acts_2_1_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_4)) 
    rom_2_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_4_reg), .o_ld_data(acts_2_1_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_6)) 
    rom_2_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_6_reg), .o_ld_data(acts_2_1_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_7)) 
    rom_2_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_7_reg), .o_ld_data(acts_2_1_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_8)) 
    rom_2_1_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_8_reg), .o_ld_data(acts_2_1_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_9)) 
    rom_2_1_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_9_reg), .o_ld_data(acts_2_1_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_11)) 
    rom_2_1_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_11_reg), .o_ld_data(acts_2_1_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_12)) 
    rom_2_1_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_12_reg), .o_ld_data(acts_2_1_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_13)) 
    rom_2_1_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_13_reg), .o_ld_data(acts_2_1_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_14)) 
    rom_2_1_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_14_reg), .o_ld_data(acts_2_1_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_15)) 
    rom_2_1_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_15_reg), .o_ld_data(acts_2_1_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_17)) 
    rom_2_1_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_17_reg), .o_ld_data(acts_2_1_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_18)) 
    rom_2_1_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_18_reg), .o_ld_data(acts_2_1_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_19)) 
    rom_2_1_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_19_reg), .o_ld_data(acts_2_1_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_20)) 
    rom_2_1_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_20_reg), .o_ld_data(acts_2_1_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_21)) 
    rom_2_1_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_21_reg), .o_ld_data(acts_2_1_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_22)) 
    rom_2_1_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_22_reg), .o_ld_data(acts_2_1_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_24)) 
    rom_2_1_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_24_reg), .o_ld_data(acts_2_1_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_26)) 
    rom_2_1_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_26_reg), .o_ld_data(acts_2_1_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_27)) 
    rom_2_1_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_27_reg), .o_ld_data(acts_2_1_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_28)) 
    rom_2_1_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_28_reg), .o_ld_data(acts_2_1_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_29)) 
    rom_2_1_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_29_reg), .o_ld_data(acts_2_1_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_30)) 
    rom_2_1_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_30_reg), .o_ld_data(acts_2_1_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_1_31)) 
    rom_2_1_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_31_reg), .o_ld_data(acts_2_1_31));

  // Stage 1
    assign s_2_1_1_0 = {{2{acts_2_1_0[5]}}, acts_2_1_0} + {{2{acts_2_1_1[5]}}, acts_2_1_1} + {{2{acts_2_1_2[5]}}, acts_2_1_2} + {{2{acts_2_1_3[5]}}, acts_2_1_3};
    registers #(.ARRAY_WIDTH(8)) r_2_1_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_1_1_0), .q(s_2_1_1_0_reg));

    assign s_2_1_1_1 = {{2{acts_2_1_4[5]}}, acts_2_1_4} + {{2{acts_2_1_6[5]}}, acts_2_1_6} + {{2{acts_2_1_7[5]}}, acts_2_1_7} + {{2{acts_2_1_8[5]}}, acts_2_1_8};
    registers #(.ARRAY_WIDTH(8)) r_2_1_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_1_1_1), .q(s_2_1_1_1_reg));

    assign s_2_1_1_2 = {{2{acts_2_1_9[5]}}, acts_2_1_9} + {{2{acts_2_1_11[5]}}, acts_2_1_11} + {{2{acts_2_1_12[5]}}, acts_2_1_12} + {{2{acts_2_1_13[5]}}, acts_2_1_13};
    registers #(.ARRAY_WIDTH(8)) r_2_1_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_1_1_2), .q(s_2_1_1_2_reg));

    assign s_2_1_1_3 = {{2{acts_2_1_14[5]}}, acts_2_1_14} + {{2{acts_2_1_15[5]}}, acts_2_1_15} + {{2{acts_2_1_17[5]}}, acts_2_1_17} + {{2{acts_2_1_18[5]}}, acts_2_1_18};
    registers #(.ARRAY_WIDTH(8)) r_2_1_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_1_1_3), .q(s_2_1_1_3_reg));

    assign s_2_1_1_4 = {{2{acts_2_1_19[5]}}, acts_2_1_19} + {{2{acts_2_1_20[5]}}, acts_2_1_20} + {{2{acts_2_1_21[5]}}, acts_2_1_21} + {{2{acts_2_1_22[5]}}, acts_2_1_22};
    registers #(.ARRAY_WIDTH(8)) r_2_1_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_1_1_4), .q(s_2_1_1_4_reg));

    assign s_2_1_1_5 = {{2{acts_2_1_24[5]}}, acts_2_1_24} + {{2{acts_2_1_26[5]}}, acts_2_1_26} + {{2{acts_2_1_27[5]}}, acts_2_1_27} + {{2{acts_2_1_28[5]}}, acts_2_1_28};
    registers #(.ARRAY_WIDTH(8)) r_2_1_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_1_1_5), .q(s_2_1_1_5_reg));

    assign s_2_1_1_6 = {{2{acts_2_1_29[5]}}, acts_2_1_29} + {{2{acts_2_1_30[5]}}, acts_2_1_30} + {{2{acts_2_1_31[5]}}, acts_2_1_31};
    registers #(.ARRAY_WIDTH(8)) r_2_1_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_1_1_6), .q(s_2_1_1_6_reg));

  // Stage 2
    assign s_2_1_2_0 = {{2{s_2_1_1_0_reg[7]}}, s_2_1_1_0_reg} + {{2{s_2_1_1_1_reg[7]}}, s_2_1_1_1_reg} + {{2{s_2_1_1_2_reg[7]}}, s_2_1_1_2_reg} + {{2{s_2_1_1_3_reg[7]}}, s_2_1_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_1_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_1_2_0), .q(s_2_1_2_0_reg));

    assign s_2_1_2_1 = {{2{s_2_1_1_4_reg[7]}}, s_2_1_1_4_reg} + {{2{s_2_1_1_5_reg[7]}}, s_2_1_1_5_reg} + {{2{s_2_1_1_6_reg[7]}}, s_2_1_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_1_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_1_2_1), .q(s_2_1_2_1_reg));

  // Stage 3
    assign sum_2_1 = {{2{s_2_1_2_0_reg[9]}}, s_2_1_2_0_reg} + {{2{s_2_1_2_1_reg[9]}}, s_2_1_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_2_1), .q(sum_2_1_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_2_1 (.i_data(sum_2_1_reg), .o_data(o_vector[1]));


    // Layer 2, Node 2
      logic  [7:0] s_2_2_1_0, s_2_2_1_1, s_2_2_1_2, s_2_2_1_3, s_2_2_1_4, s_2_2_1_5, s_2_2_1_6;
    logic  [7:0] s_2_2_1_0_reg, s_2_2_1_1_reg, s_2_2_1_2_reg, s_2_2_1_3_reg, s_2_2_1_4_reg, s_2_2_1_5_reg, s_2_2_1_6_reg;
    logic  [9:0] s_2_2_2_0, s_2_2_2_1;
    logic  [9:0] s_2_2_2_0_reg, s_2_2_2_1_reg;
    logic [11:0] sum_2_2;
    logic [11:0] sum_2_2_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_0)) 
    rom_2_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_0_reg), .o_ld_data(acts_2_2_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_1)) 
    rom_2_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_1_reg), .o_ld_data(acts_2_2_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_2)) 
    rom_2_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_2_reg), .o_ld_data(acts_2_2_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_3)) 
    rom_2_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_3_reg), .o_ld_data(acts_2_2_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_4)) 
    rom_2_2_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_4_reg), .o_ld_data(acts_2_2_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_6)) 
    rom_2_2_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_6_reg), .o_ld_data(acts_2_2_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_7)) 
    rom_2_2_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_7_reg), .o_ld_data(acts_2_2_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_9)) 
    rom_2_2_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_9_reg), .o_ld_data(acts_2_2_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_12)) 
    rom_2_2_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_12_reg), .o_ld_data(acts_2_2_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_13)) 
    rom_2_2_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_13_reg), .o_ld_data(acts_2_2_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_14)) 
    rom_2_2_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_14_reg), .o_ld_data(acts_2_2_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_15)) 
    rom_2_2_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_15_reg), .o_ld_data(acts_2_2_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_16)) 
    rom_2_2_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_16_reg), .o_ld_data(acts_2_2_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_17)) 
    rom_2_2_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_17_reg), .o_ld_data(acts_2_2_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_19)) 
    rom_2_2_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_19_reg), .o_ld_data(acts_2_2_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_20)) 
    rom_2_2_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_20_reg), .o_ld_data(acts_2_2_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_21)) 
    rom_2_2_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_21_reg), .o_ld_data(acts_2_2_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_22)) 
    rom_2_2_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_22_reg), .o_ld_data(acts_2_2_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_23)) 
    rom_2_2_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_23_reg), .o_ld_data(acts_2_2_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_24)) 
    rom_2_2_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_24_reg), .o_ld_data(acts_2_2_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_25)) 
    rom_2_2_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_25_reg), .o_ld_data(acts_2_2_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_27)) 
    rom_2_2_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_27_reg), .o_ld_data(acts_2_2_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_28)) 
    rom_2_2_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_28_reg), .o_ld_data(acts_2_2_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_29)) 
    rom_2_2_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_29_reg), .o_ld_data(acts_2_2_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_30)) 
    rom_2_2_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_30_reg), .o_ld_data(acts_2_2_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_2_31)) 
    rom_2_2_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_31_reg), .o_ld_data(acts_2_2_31));

  // Stage 1
    assign s_2_2_1_0 = {{2{acts_2_2_0[5]}}, acts_2_2_0} + {{2{acts_2_2_1[5]}}, acts_2_2_1} + {{2{acts_2_2_2[5]}}, acts_2_2_2} + {{2{acts_2_2_3[5]}}, acts_2_2_3};
    registers #(.ARRAY_WIDTH(8)) r_2_2_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_2_1_0), .q(s_2_2_1_0_reg));

    assign s_2_2_1_1 = {{2{acts_2_2_4[5]}}, acts_2_2_4} + {{2{acts_2_2_6[5]}}, acts_2_2_6} + {{2{acts_2_2_7[5]}}, acts_2_2_7} + {{2{acts_2_2_9[5]}}, acts_2_2_9};
    registers #(.ARRAY_WIDTH(8)) r_2_2_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_2_1_1), .q(s_2_2_1_1_reg));

    assign s_2_2_1_2 = {{2{acts_2_2_12[5]}}, acts_2_2_12} + {{2{acts_2_2_13[5]}}, acts_2_2_13} + {{2{acts_2_2_14[5]}}, acts_2_2_14} + {{2{acts_2_2_15[5]}}, acts_2_2_15};
    registers #(.ARRAY_WIDTH(8)) r_2_2_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_2_1_2), .q(s_2_2_1_2_reg));

    assign s_2_2_1_3 = {{2{acts_2_2_16[5]}}, acts_2_2_16} + {{2{acts_2_2_17[5]}}, acts_2_2_17} + {{2{acts_2_2_19[5]}}, acts_2_2_19} + {{2{acts_2_2_20[5]}}, acts_2_2_20};
    registers #(.ARRAY_WIDTH(8)) r_2_2_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_2_1_3), .q(s_2_2_1_3_reg));

    assign s_2_2_1_4 = {{2{acts_2_2_21[5]}}, acts_2_2_21} + {{2{acts_2_2_22[5]}}, acts_2_2_22} + {{2{acts_2_2_23[5]}}, acts_2_2_23} + {{2{acts_2_2_24[5]}}, acts_2_2_24};
    registers #(.ARRAY_WIDTH(8)) r_2_2_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_2_1_4), .q(s_2_2_1_4_reg));

    assign s_2_2_1_5 = {{2{acts_2_2_25[5]}}, acts_2_2_25} + {{2{acts_2_2_27[5]}}, acts_2_2_27} + {{2{acts_2_2_28[5]}}, acts_2_2_28} + {{2{acts_2_2_29[5]}}, acts_2_2_29};
    registers #(.ARRAY_WIDTH(8)) r_2_2_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_2_1_5), .q(s_2_2_1_5_reg));

    assign s_2_2_1_6 = {{2{acts_2_2_30[5]}}, acts_2_2_30} + {{2{acts_2_2_31[5]}}, acts_2_2_31};
    registers #(.ARRAY_WIDTH(8)) r_2_2_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_2_1_6), .q(s_2_2_1_6_reg));

  // Stage 2
    assign s_2_2_2_0 = {{2{s_2_2_1_0_reg[7]}}, s_2_2_1_0_reg} + {{2{s_2_2_1_1_reg[7]}}, s_2_2_1_1_reg} + {{2{s_2_2_1_2_reg[7]}}, s_2_2_1_2_reg} + {{2{s_2_2_1_3_reg[7]}}, s_2_2_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_2_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_2_2_0), .q(s_2_2_2_0_reg));

    assign s_2_2_2_1 = {{2{s_2_2_1_4_reg[7]}}, s_2_2_1_4_reg} + {{2{s_2_2_1_5_reg[7]}}, s_2_2_1_5_reg} + {{2{s_2_2_1_6_reg[7]}}, s_2_2_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_2_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_2_2_1), .q(s_2_2_2_1_reg));

  // Stage 3
    assign sum_2_2 = {{2{s_2_2_2_0_reg[9]}}, s_2_2_2_0_reg} + {{2{s_2_2_2_1_reg[9]}}, s_2_2_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_2_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_2_2), .q(sum_2_2_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_2_2 (.i_data(sum_2_2_reg), .o_data(o_vector[2]));


    // Layer 2, Node 3
      logic  [7:0] s_2_3_1_0, s_2_3_1_1, s_2_3_1_2, s_2_3_1_3, s_2_3_1_4, s_2_3_1_5, s_2_3_1_6;
    logic  [7:0] s_2_3_1_0_reg, s_2_3_1_1_reg, s_2_3_1_2_reg, s_2_3_1_3_reg, s_2_3_1_4_reg, s_2_3_1_5_reg, s_2_3_1_6_reg;
    logic  [9:0] s_2_3_2_0, s_2_3_2_1;
    logic  [9:0] s_2_3_2_0_reg, s_2_3_2_1_reg;
    logic [11:0] sum_2_3;
    logic [11:0] sum_2_3_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_0)) 
    rom_2_3_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_0_reg), .o_ld_data(acts_2_3_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_1)) 
    rom_2_3_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_1_reg), .o_ld_data(acts_2_3_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_2)) 
    rom_2_3_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_2_reg), .o_ld_data(acts_2_3_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_3)) 
    rom_2_3_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_3_reg), .o_ld_data(acts_2_3_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_4)) 
    rom_2_3_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_4_reg), .o_ld_data(acts_2_3_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_5)) 
    rom_2_3_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_5_reg), .o_ld_data(acts_2_3_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_6)) 
    rom_2_3_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_6_reg), .o_ld_data(acts_2_3_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_9)) 
    rom_2_3_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_9_reg), .o_ld_data(acts_2_3_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_10)) 
    rom_2_3_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_10_reg), .o_ld_data(acts_2_3_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_11)) 
    rom_2_3_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_11_reg), .o_ld_data(acts_2_3_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_12)) 
    rom_2_3_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_12_reg), .o_ld_data(acts_2_3_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_14)) 
    rom_2_3_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_14_reg), .o_ld_data(acts_2_3_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_15)) 
    rom_2_3_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_15_reg), .o_ld_data(acts_2_3_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_16)) 
    rom_2_3_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_16_reg), .o_ld_data(acts_2_3_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_17)) 
    rom_2_3_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_17_reg), .o_ld_data(acts_2_3_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_18)) 
    rom_2_3_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_18_reg), .o_ld_data(acts_2_3_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_19)) 
    rom_2_3_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_19_reg), .o_ld_data(acts_2_3_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_20)) 
    rom_2_3_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_20_reg), .o_ld_data(acts_2_3_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_21)) 
    rom_2_3_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_21_reg), .o_ld_data(acts_2_3_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_23)) 
    rom_2_3_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_23_reg), .o_ld_data(acts_2_3_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_24)) 
    rom_2_3_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_24_reg), .o_ld_data(acts_2_3_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_25)) 
    rom_2_3_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_25_reg), .o_ld_data(acts_2_3_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_26)) 
    rom_2_3_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_26_reg), .o_ld_data(acts_2_3_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_28)) 
    rom_2_3_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_28_reg), .o_ld_data(acts_2_3_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_29)) 
    rom_2_3_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_29_reg), .o_ld_data(acts_2_3_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_3_31)) 
    rom_2_3_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_31_reg), .o_ld_data(acts_2_3_31));

  // Stage 1
    assign s_2_3_1_0 = {{2{acts_2_3_0[5]}}, acts_2_3_0} + {{2{acts_2_3_1[5]}}, acts_2_3_1} + {{2{acts_2_3_2[5]}}, acts_2_3_2} + {{2{acts_2_3_3[5]}}, acts_2_3_3};
    registers #(.ARRAY_WIDTH(8)) r_2_3_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_3_1_0), .q(s_2_3_1_0_reg));

    assign s_2_3_1_1 = {{2{acts_2_3_4[5]}}, acts_2_3_4} + {{2{acts_2_3_5[5]}}, acts_2_3_5} + {{2{acts_2_3_6[5]}}, acts_2_3_6} + {{2{acts_2_3_9[5]}}, acts_2_3_9};
    registers #(.ARRAY_WIDTH(8)) r_2_3_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_3_1_1), .q(s_2_3_1_1_reg));

    assign s_2_3_1_2 = {{2{acts_2_3_10[5]}}, acts_2_3_10} + {{2{acts_2_3_11[5]}}, acts_2_3_11} + {{2{acts_2_3_12[5]}}, acts_2_3_12} + {{2{acts_2_3_14[5]}}, acts_2_3_14};
    registers #(.ARRAY_WIDTH(8)) r_2_3_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_3_1_2), .q(s_2_3_1_2_reg));

    assign s_2_3_1_3 = {{2{acts_2_3_15[5]}}, acts_2_3_15} + {{2{acts_2_3_16[5]}}, acts_2_3_16} + {{2{acts_2_3_17[5]}}, acts_2_3_17} + {{2{acts_2_3_18[5]}}, acts_2_3_18};
    registers #(.ARRAY_WIDTH(8)) r_2_3_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_3_1_3), .q(s_2_3_1_3_reg));

    assign s_2_3_1_4 = {{2{acts_2_3_19[5]}}, acts_2_3_19} + {{2{acts_2_3_20[5]}}, acts_2_3_20} + {{2{acts_2_3_21[5]}}, acts_2_3_21} + {{2{acts_2_3_23[5]}}, acts_2_3_23};
    registers #(.ARRAY_WIDTH(8)) r_2_3_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_3_1_4), .q(s_2_3_1_4_reg));

    assign s_2_3_1_5 = {{2{acts_2_3_24[5]}}, acts_2_3_24} + {{2{acts_2_3_25[5]}}, acts_2_3_25} + {{2{acts_2_3_26[5]}}, acts_2_3_26} + {{2{acts_2_3_28[5]}}, acts_2_3_28};
    registers #(.ARRAY_WIDTH(8)) r_2_3_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_3_1_5), .q(s_2_3_1_5_reg));

    assign s_2_3_1_6 = {{2{acts_2_3_29[5]}}, acts_2_3_29} + {{2{acts_2_3_31[5]}}, acts_2_3_31};
    registers #(.ARRAY_WIDTH(8)) r_2_3_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_3_1_6), .q(s_2_3_1_6_reg));

  // Stage 2
    assign s_2_3_2_0 = {{2{s_2_3_1_0_reg[7]}}, s_2_3_1_0_reg} + {{2{s_2_3_1_1_reg[7]}}, s_2_3_1_1_reg} + {{2{s_2_3_1_2_reg[7]}}, s_2_3_1_2_reg} + {{2{s_2_3_1_3_reg[7]}}, s_2_3_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_3_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_3_2_0), .q(s_2_3_2_0_reg));

    assign s_2_3_2_1 = {{2{s_2_3_1_4_reg[7]}}, s_2_3_1_4_reg} + {{2{s_2_3_1_5_reg[7]}}, s_2_3_1_5_reg} + {{2{s_2_3_1_6_reg[7]}}, s_2_3_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_3_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_3_2_1), .q(s_2_3_2_1_reg));

  // Stage 3
    assign sum_2_3 = {{2{s_2_3_2_0_reg[9]}}, s_2_3_2_0_reg} + {{2{s_2_3_2_1_reg[9]}}, s_2_3_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_2_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_2_3), .q(sum_2_3_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_2_3 (.i_data(sum_2_3_reg), .o_data(o_vector[3]));


    // Layer 2, Node 4
      logic  [7:0] s_2_4_1_0, s_2_4_1_1, s_2_4_1_2, s_2_4_1_3, s_2_4_1_4, s_2_4_1_5, s_2_4_1_6;
    logic  [7:0] s_2_4_1_0_reg, s_2_4_1_1_reg, s_2_4_1_2_reg, s_2_4_1_3_reg, s_2_4_1_4_reg, s_2_4_1_5_reg, s_2_4_1_6_reg;
    logic  [9:0] s_2_4_2_0, s_2_4_2_1;
    logic  [9:0] s_2_4_2_0_reg, s_2_4_2_1_reg;
    logic [11:0] sum_2_4;
    logic [11:0] sum_2_4_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_0)) 
    rom_2_4_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_0_reg), .o_ld_data(acts_2_4_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_1)) 
    rom_2_4_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_1_reg), .o_ld_data(acts_2_4_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_2)) 
    rom_2_4_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_2_reg), .o_ld_data(acts_2_4_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_4)) 
    rom_2_4_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_4_reg), .o_ld_data(acts_2_4_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_5)) 
    rom_2_4_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_5_reg), .o_ld_data(acts_2_4_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_6)) 
    rom_2_4_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_6_reg), .o_ld_data(acts_2_4_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_7)) 
    rom_2_4_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_7_reg), .o_ld_data(acts_2_4_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_8)) 
    rom_2_4_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_8_reg), .o_ld_data(acts_2_4_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_9)) 
    rom_2_4_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_9_reg), .o_ld_data(acts_2_4_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_10)) 
    rom_2_4_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_10_reg), .o_ld_data(acts_2_4_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_11)) 
    rom_2_4_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_11_reg), .o_ld_data(acts_2_4_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_12)) 
    rom_2_4_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_12_reg), .o_ld_data(acts_2_4_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_13)) 
    rom_2_4_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_13_reg), .o_ld_data(acts_2_4_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_14)) 
    rom_2_4_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_14_reg), .o_ld_data(acts_2_4_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_15)) 
    rom_2_4_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_15_reg), .o_ld_data(acts_2_4_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_16)) 
    rom_2_4_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_16_reg), .o_ld_data(acts_2_4_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_17)) 
    rom_2_4_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_17_reg), .o_ld_data(acts_2_4_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_18)) 
    rom_2_4_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_18_reg), .o_ld_data(acts_2_4_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_19)) 
    rom_2_4_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_19_reg), .o_ld_data(acts_2_4_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_21)) 
    rom_2_4_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_21_reg), .o_ld_data(acts_2_4_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_22)) 
    rom_2_4_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_22_reg), .o_ld_data(acts_2_4_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_24)) 
    rom_2_4_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_24_reg), .o_ld_data(acts_2_4_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_26)) 
    rom_2_4_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_26_reg), .o_ld_data(acts_2_4_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_27)) 
    rom_2_4_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_27_reg), .o_ld_data(acts_2_4_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_28)) 
    rom_2_4_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_28_reg), .o_ld_data(acts_2_4_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_29)) 
    rom_2_4_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_29_reg), .o_ld_data(acts_2_4_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_30)) 
    rom_2_4_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_30_reg), .o_ld_data(acts_2_4_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_4_31)) 
    rom_2_4_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_31_reg), .o_ld_data(acts_2_4_31));

  // Stage 1
    assign s_2_4_1_0 = {{2{acts_2_4_0[5]}}, acts_2_4_0} + {{2{acts_2_4_1[5]}}, acts_2_4_1} + {{2{acts_2_4_2[5]}}, acts_2_4_2} + {{2{acts_2_4_4[5]}}, acts_2_4_4};
    registers #(.ARRAY_WIDTH(8)) r_2_4_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_4_1_0), .q(s_2_4_1_0_reg));

    assign s_2_4_1_1 = {{2{acts_2_4_5[5]}}, acts_2_4_5} + {{2{acts_2_4_6[5]}}, acts_2_4_6} + {{2{acts_2_4_7[5]}}, acts_2_4_7} + {{2{acts_2_4_8[5]}}, acts_2_4_8};
    registers #(.ARRAY_WIDTH(8)) r_2_4_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_4_1_1), .q(s_2_4_1_1_reg));

    assign s_2_4_1_2 = {{2{acts_2_4_9[5]}}, acts_2_4_9} + {{2{acts_2_4_10[5]}}, acts_2_4_10} + {{2{acts_2_4_11[5]}}, acts_2_4_11} + {{2{acts_2_4_12[5]}}, acts_2_4_12};
    registers #(.ARRAY_WIDTH(8)) r_2_4_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_4_1_2), .q(s_2_4_1_2_reg));

    assign s_2_4_1_3 = {{2{acts_2_4_13[5]}}, acts_2_4_13} + {{2{acts_2_4_14[5]}}, acts_2_4_14} + {{2{acts_2_4_15[5]}}, acts_2_4_15} + {{2{acts_2_4_16[5]}}, acts_2_4_16};
    registers #(.ARRAY_WIDTH(8)) r_2_4_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_4_1_3), .q(s_2_4_1_3_reg));

    assign s_2_4_1_4 = {{2{acts_2_4_17[5]}}, acts_2_4_17} + {{2{acts_2_4_18[5]}}, acts_2_4_18} + {{2{acts_2_4_19[5]}}, acts_2_4_19} + {{2{acts_2_4_21[5]}}, acts_2_4_21};
    registers #(.ARRAY_WIDTH(8)) r_2_4_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_4_1_4), .q(s_2_4_1_4_reg));

    assign s_2_4_1_5 = {{2{acts_2_4_22[5]}}, acts_2_4_22} + {{2{acts_2_4_24[5]}}, acts_2_4_24} + {{2{acts_2_4_26[5]}}, acts_2_4_26} + {{2{acts_2_4_27[5]}}, acts_2_4_27};
    registers #(.ARRAY_WIDTH(8)) r_2_4_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_4_1_5), .q(s_2_4_1_5_reg));

    assign s_2_4_1_6 = {{2{acts_2_4_28[5]}}, acts_2_4_28} + {{2{acts_2_4_29[5]}}, acts_2_4_29} + {{2{acts_2_4_30[5]}}, acts_2_4_30} + {{2{acts_2_4_31[5]}}, acts_2_4_31};
    registers #(.ARRAY_WIDTH(8)) r_2_4_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_4_1_6), .q(s_2_4_1_6_reg));

  // Stage 2
    assign s_2_4_2_0 = {{2{s_2_4_1_0_reg[7]}}, s_2_4_1_0_reg} + {{2{s_2_4_1_1_reg[7]}}, s_2_4_1_1_reg} + {{2{s_2_4_1_2_reg[7]}}, s_2_4_1_2_reg} + {{2{s_2_4_1_3_reg[7]}}, s_2_4_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_4_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_4_2_0), .q(s_2_4_2_0_reg));

    assign s_2_4_2_1 = {{2{s_2_4_1_4_reg[7]}}, s_2_4_1_4_reg} + {{2{s_2_4_1_5_reg[7]}}, s_2_4_1_5_reg} + {{2{s_2_4_1_6_reg[7]}}, s_2_4_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_4_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_4_2_1), .q(s_2_4_2_1_reg));

  // Stage 3
    assign sum_2_4 = {{2{s_2_4_2_0_reg[9]}}, s_2_4_2_0_reg} + {{2{s_2_4_2_1_reg[9]}}, s_2_4_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_2_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_2_4), .q(sum_2_4_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_2_4 (.i_data(sum_2_4_reg), .o_data(o_vector[4]));


    // Layer 2, Node 5
      logic  [7:0] s_2_5_1_0, s_2_5_1_1, s_2_5_1_2, s_2_5_1_3, s_2_5_1_4, s_2_5_1_5;
    logic  [7:0] s_2_5_1_0_reg, s_2_5_1_1_reg, s_2_5_1_2_reg, s_2_5_1_3_reg, s_2_5_1_4_reg, s_2_5_1_5_reg;
    logic  [9:0] s_2_5_2_0, s_2_5_2_1;
    logic  [9:0] s_2_5_2_0_reg, s_2_5_2_1_reg;
    logic [11:0] sum_2_5;
    logic [11:0] sum_2_5_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_1)) 
    rom_2_5_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_1_reg), .o_ld_data(acts_2_5_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_2)) 
    rom_2_5_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_2_reg), .o_ld_data(acts_2_5_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_3)) 
    rom_2_5_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_3_reg), .o_ld_data(acts_2_5_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_4)) 
    rom_2_5_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_4_reg), .o_ld_data(acts_2_5_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_5)) 
    rom_2_5_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_5_reg), .o_ld_data(acts_2_5_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_6)) 
    rom_2_5_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_6_reg), .o_ld_data(acts_2_5_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_7)) 
    rom_2_5_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_7_reg), .o_ld_data(acts_2_5_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_10)) 
    rom_2_5_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_10_reg), .o_ld_data(acts_2_5_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_11)) 
    rom_2_5_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_11_reg), .o_ld_data(acts_2_5_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_12)) 
    rom_2_5_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_12_reg), .o_ld_data(acts_2_5_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_13)) 
    rom_2_5_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_13_reg), .o_ld_data(acts_2_5_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_14)) 
    rom_2_5_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_14_reg), .o_ld_data(acts_2_5_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_15)) 
    rom_2_5_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_15_reg), .o_ld_data(acts_2_5_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_16)) 
    rom_2_5_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_16_reg), .o_ld_data(acts_2_5_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_17)) 
    rom_2_5_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_17_reg), .o_ld_data(acts_2_5_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_18)) 
    rom_2_5_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_18_reg), .o_ld_data(acts_2_5_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_19)) 
    rom_2_5_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_19_reg), .o_ld_data(acts_2_5_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_20)) 
    rom_2_5_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_20_reg), .o_ld_data(acts_2_5_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_24)) 
    rom_2_5_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_24_reg), .o_ld_data(acts_2_5_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_25)) 
    rom_2_5_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_25_reg), .o_ld_data(acts_2_5_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_26)) 
    rom_2_5_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_26_reg), .o_ld_data(acts_2_5_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_27)) 
    rom_2_5_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_27_reg), .o_ld_data(acts_2_5_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_28)) 
    rom_2_5_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_28_reg), .o_ld_data(acts_2_5_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_5_29)) 
    rom_2_5_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_29_reg), .o_ld_data(acts_2_5_29));

  // Stage 1
    assign s_2_5_1_0 = {{2{acts_2_5_1[5]}}, acts_2_5_1} + {{2{acts_2_5_2[5]}}, acts_2_5_2} + {{2{acts_2_5_3[5]}}, acts_2_5_3} + {{2{acts_2_5_4[5]}}, acts_2_5_4};
    registers #(.ARRAY_WIDTH(8)) r_2_5_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_5_1_0), .q(s_2_5_1_0_reg));

    assign s_2_5_1_1 = {{2{acts_2_5_5[5]}}, acts_2_5_5} + {{2{acts_2_5_6[5]}}, acts_2_5_6} + {{2{acts_2_5_7[5]}}, acts_2_5_7} + {{2{acts_2_5_10[5]}}, acts_2_5_10};
    registers #(.ARRAY_WIDTH(8)) r_2_5_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_5_1_1), .q(s_2_5_1_1_reg));

    assign s_2_5_1_2 = {{2{acts_2_5_11[5]}}, acts_2_5_11} + {{2{acts_2_5_12[5]}}, acts_2_5_12} + {{2{acts_2_5_13[5]}}, acts_2_5_13} + {{2{acts_2_5_14[5]}}, acts_2_5_14};
    registers #(.ARRAY_WIDTH(8)) r_2_5_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_5_1_2), .q(s_2_5_1_2_reg));

    assign s_2_5_1_3 = {{2{acts_2_5_15[5]}}, acts_2_5_15} + {{2{acts_2_5_16[5]}}, acts_2_5_16} + {{2{acts_2_5_17[5]}}, acts_2_5_17} + {{2{acts_2_5_18[5]}}, acts_2_5_18};
    registers #(.ARRAY_WIDTH(8)) r_2_5_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_5_1_3), .q(s_2_5_1_3_reg));

    assign s_2_5_1_4 = {{2{acts_2_5_19[5]}}, acts_2_5_19} + {{2{acts_2_5_20[5]}}, acts_2_5_20} + {{2{acts_2_5_24[5]}}, acts_2_5_24} + {{2{acts_2_5_25[5]}}, acts_2_5_25};
    registers #(.ARRAY_WIDTH(8)) r_2_5_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_5_1_4), .q(s_2_5_1_4_reg));

    assign s_2_5_1_5 = {{2{acts_2_5_26[5]}}, acts_2_5_26} + {{2{acts_2_5_27[5]}}, acts_2_5_27} + {{2{acts_2_5_28[5]}}, acts_2_5_28} + {{2{acts_2_5_29[5]}}, acts_2_5_29};
    registers #(.ARRAY_WIDTH(8)) r_2_5_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_5_1_5), .q(s_2_5_1_5_reg));

  // Stage 2
    assign s_2_5_2_0 = {{2{s_2_5_1_0_reg[7]}}, s_2_5_1_0_reg} + {{2{s_2_5_1_1_reg[7]}}, s_2_5_1_1_reg} + {{2{s_2_5_1_2_reg[7]}}, s_2_5_1_2_reg} + {{2{s_2_5_1_3_reg[7]}}, s_2_5_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_5_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_5_2_0), .q(s_2_5_2_0_reg));

    assign s_2_5_2_1 = {{2{s_2_5_1_4_reg[7]}}, s_2_5_1_4_reg} + {{2{s_2_5_1_5_reg[7]}}, s_2_5_1_5_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_5_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_5_2_1), .q(s_2_5_2_1_reg));

  // Stage 3
    assign sum_2_5 = {{2{s_2_5_2_0_reg[9]}}, s_2_5_2_0_reg} + {{2{s_2_5_2_1_reg[9]}}, s_2_5_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_2_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_2_5), .q(sum_2_5_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_2_5 (.i_data(sum_2_5_reg), .o_data(o_vector[5]));


    // Layer 2, Node 6
      logic  [7:0] s_2_6_1_0, s_2_6_1_1, s_2_6_1_2, s_2_6_1_3, s_2_6_1_4, s_2_6_1_5, s_2_6_1_6;
    logic  [7:0] s_2_6_1_0_reg, s_2_6_1_1_reg, s_2_6_1_2_reg, s_2_6_1_3_reg, s_2_6_1_4_reg, s_2_6_1_5_reg, s_2_6_1_6_reg;
    logic  [9:0] s_2_6_2_0, s_2_6_2_1;
    logic  [9:0] s_2_6_2_0_reg, s_2_6_2_1_reg;
    logic [11:0] sum_2_6;
    logic [11:0] sum_2_6_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_0)) 
    rom_2_6_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_0_reg), .o_ld_data(acts_2_6_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_1)) 
    rom_2_6_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_1_reg), .o_ld_data(acts_2_6_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_2)) 
    rom_2_6_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_2_reg), .o_ld_data(acts_2_6_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_3)) 
    rom_2_6_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_3_reg), .o_ld_data(acts_2_6_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_4)) 
    rom_2_6_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_4_reg), .o_ld_data(acts_2_6_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_5)) 
    rom_2_6_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_5_reg), .o_ld_data(acts_2_6_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_6)) 
    rom_2_6_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_6_reg), .o_ld_data(acts_2_6_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_7)) 
    rom_2_6_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_7_reg), .o_ld_data(acts_2_6_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_8)) 
    rom_2_6_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_8_reg), .o_ld_data(acts_2_6_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_9)) 
    rom_2_6_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_9_reg), .o_ld_data(acts_2_6_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_10)) 
    rom_2_6_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_10_reg), .o_ld_data(acts_2_6_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_11)) 
    rom_2_6_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_11_reg), .o_ld_data(acts_2_6_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_12)) 
    rom_2_6_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_12_reg), .o_ld_data(acts_2_6_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_13)) 
    rom_2_6_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_13_reg), .o_ld_data(acts_2_6_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_14)) 
    rom_2_6_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_14_reg), .o_ld_data(acts_2_6_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_15)) 
    rom_2_6_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_15_reg), .o_ld_data(acts_2_6_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_16)) 
    rom_2_6_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_16_reg), .o_ld_data(acts_2_6_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_17)) 
    rom_2_6_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_17_reg), .o_ld_data(acts_2_6_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_19)) 
    rom_2_6_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_19_reg), .o_ld_data(acts_2_6_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_21)) 
    rom_2_6_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_21_reg), .o_ld_data(acts_2_6_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_23)) 
    rom_2_6_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_23_reg), .o_ld_data(acts_2_6_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_24)) 
    rom_2_6_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_24_reg), .o_ld_data(acts_2_6_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_25)) 
    rom_2_6_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_25_reg), .o_ld_data(acts_2_6_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_26)) 
    rom_2_6_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_26_reg), .o_ld_data(acts_2_6_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_27)) 
    rom_2_6_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_27_reg), .o_ld_data(acts_2_6_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_28)) 
    rom_2_6_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_28_reg), .o_ld_data(acts_2_6_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_29)) 
    rom_2_6_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_29_reg), .o_ld_data(acts_2_6_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_6_30)) 
    rom_2_6_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_30_reg), .o_ld_data(acts_2_6_30));

  // Stage 1
    assign s_2_6_1_0 = {{2{acts_2_6_0[5]}}, acts_2_6_0} + {{2{acts_2_6_1[5]}}, acts_2_6_1} + {{2{acts_2_6_2[5]}}, acts_2_6_2} + {{2{acts_2_6_3[5]}}, acts_2_6_3};
    registers #(.ARRAY_WIDTH(8)) r_2_6_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_6_1_0), .q(s_2_6_1_0_reg));

    assign s_2_6_1_1 = {{2{acts_2_6_4[5]}}, acts_2_6_4} + {{2{acts_2_6_5[5]}}, acts_2_6_5} + {{2{acts_2_6_6[5]}}, acts_2_6_6} + {{2{acts_2_6_7[5]}}, acts_2_6_7};
    registers #(.ARRAY_WIDTH(8)) r_2_6_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_6_1_1), .q(s_2_6_1_1_reg));

    assign s_2_6_1_2 = {{2{acts_2_6_8[5]}}, acts_2_6_8} + {{2{acts_2_6_9[5]}}, acts_2_6_9} + {{2{acts_2_6_10[5]}}, acts_2_6_10} + {{2{acts_2_6_11[5]}}, acts_2_6_11};
    registers #(.ARRAY_WIDTH(8)) r_2_6_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_6_1_2), .q(s_2_6_1_2_reg));

    assign s_2_6_1_3 = {{2{acts_2_6_12[5]}}, acts_2_6_12} + {{2{acts_2_6_13[5]}}, acts_2_6_13} + {{2{acts_2_6_14[5]}}, acts_2_6_14} + {{2{acts_2_6_15[5]}}, acts_2_6_15};
    registers #(.ARRAY_WIDTH(8)) r_2_6_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_6_1_3), .q(s_2_6_1_3_reg));

    assign s_2_6_1_4 = {{2{acts_2_6_16[5]}}, acts_2_6_16} + {{2{acts_2_6_17[5]}}, acts_2_6_17} + {{2{acts_2_6_19[5]}}, acts_2_6_19} + {{2{acts_2_6_21[5]}}, acts_2_6_21};
    registers #(.ARRAY_WIDTH(8)) r_2_6_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_6_1_4), .q(s_2_6_1_4_reg));

    assign s_2_6_1_5 = {{2{acts_2_6_23[5]}}, acts_2_6_23} + {{2{acts_2_6_24[5]}}, acts_2_6_24} + {{2{acts_2_6_25[5]}}, acts_2_6_25} + {{2{acts_2_6_26[5]}}, acts_2_6_26};
    registers #(.ARRAY_WIDTH(8)) r_2_6_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_6_1_5), .q(s_2_6_1_5_reg));

    assign s_2_6_1_6 = {{2{acts_2_6_27[5]}}, acts_2_6_27} + {{2{acts_2_6_28[5]}}, acts_2_6_28} + {{2{acts_2_6_29[5]}}, acts_2_6_29} + {{2{acts_2_6_30[5]}}, acts_2_6_30};
    registers #(.ARRAY_WIDTH(8)) r_2_6_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_6_1_6), .q(s_2_6_1_6_reg));

  // Stage 2
    assign s_2_6_2_0 = {{2{s_2_6_1_0_reg[7]}}, s_2_6_1_0_reg} + {{2{s_2_6_1_1_reg[7]}}, s_2_6_1_1_reg} + {{2{s_2_6_1_2_reg[7]}}, s_2_6_1_2_reg} + {{2{s_2_6_1_3_reg[7]}}, s_2_6_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_6_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_6_2_0), .q(s_2_6_2_0_reg));

    assign s_2_6_2_1 = {{2{s_2_6_1_4_reg[7]}}, s_2_6_1_4_reg} + {{2{s_2_6_1_5_reg[7]}}, s_2_6_1_5_reg} + {{2{s_2_6_1_6_reg[7]}}, s_2_6_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_6_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_6_2_1), .q(s_2_6_2_1_reg));

  // Stage 3
    assign sum_2_6 = {{2{s_2_6_2_0_reg[9]}}, s_2_6_2_0_reg} + {{2{s_2_6_2_1_reg[9]}}, s_2_6_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_2_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_2_6), .q(sum_2_6_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_2_6 (.i_data(sum_2_6_reg), .o_data(o_vector[6]));


    // Layer 2, Node 7
      logic  [7:0] s_2_7_1_0, s_2_7_1_1, s_2_7_1_2, s_2_7_1_3, s_2_7_1_4, s_2_7_1_5, s_2_7_1_6, s_2_7_1_7;
    logic  [7:0] s_2_7_1_0_reg, s_2_7_1_1_reg, s_2_7_1_2_reg, s_2_7_1_3_reg, s_2_7_1_4_reg, s_2_7_1_5_reg, s_2_7_1_6_reg, s_2_7_1_7_reg;
    logic  [9:0] s_2_7_2_0, s_2_7_2_1;
    logic  [9:0] s_2_7_2_0_reg, s_2_7_2_1_reg;
    logic [11:0] sum_2_7;
    logic [11:0] sum_2_7_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_0)) 
    rom_2_7_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_0_reg), .o_ld_data(acts_2_7_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_1)) 
    rom_2_7_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_1_reg), .o_ld_data(acts_2_7_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_2)) 
    rom_2_7_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_2_reg), .o_ld_data(acts_2_7_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_3)) 
    rom_2_7_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_3_reg), .o_ld_data(acts_2_7_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_4)) 
    rom_2_7_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_4_reg), .o_ld_data(acts_2_7_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_5)) 
    rom_2_7_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_5_reg), .o_ld_data(acts_2_7_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_6)) 
    rom_2_7_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_6_reg), .o_ld_data(acts_2_7_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_7)) 
    rom_2_7_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_7_reg), .o_ld_data(acts_2_7_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_8)) 
    rom_2_7_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_8_reg), .o_ld_data(acts_2_7_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_9)) 
    rom_2_7_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_9_reg), .o_ld_data(acts_2_7_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_10)) 
    rom_2_7_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_10_reg), .o_ld_data(acts_2_7_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_11)) 
    rom_2_7_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_11_reg), .o_ld_data(acts_2_7_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_12)) 
    rom_2_7_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_12_reg), .o_ld_data(acts_2_7_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_14)) 
    rom_2_7_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_14_reg), .o_ld_data(acts_2_7_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_15)) 
    rom_2_7_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_15_reg), .o_ld_data(acts_2_7_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_17)) 
    rom_2_7_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_17_reg), .o_ld_data(acts_2_7_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_18)) 
    rom_2_7_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_18_reg), .o_ld_data(acts_2_7_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_19)) 
    rom_2_7_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_19_reg), .o_ld_data(acts_2_7_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_20)) 
    rom_2_7_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_20_reg), .o_ld_data(acts_2_7_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_21)) 
    rom_2_7_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_21_reg), .o_ld_data(acts_2_7_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_22)) 
    rom_2_7_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_22_reg), .o_ld_data(acts_2_7_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_23)) 
    rom_2_7_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_23_reg), .o_ld_data(acts_2_7_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_24)) 
    rom_2_7_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_24_reg), .o_ld_data(acts_2_7_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_25)) 
    rom_2_7_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_25_reg), .o_ld_data(acts_2_7_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_26)) 
    rom_2_7_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_26_reg), .o_ld_data(acts_2_7_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_28)) 
    rom_2_7_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_28_reg), .o_ld_data(acts_2_7_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_29)) 
    rom_2_7_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_29_reg), .o_ld_data(acts_2_7_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_30)) 
    rom_2_7_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_30_reg), .o_ld_data(acts_2_7_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_7_31)) 
    rom_2_7_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_31_reg), .o_ld_data(acts_2_7_31));

  // Stage 1
    assign s_2_7_1_0 = {{2{acts_2_7_0[5]}}, acts_2_7_0} + {{2{acts_2_7_1[5]}}, acts_2_7_1} + {{2{acts_2_7_2[5]}}, acts_2_7_2} + {{2{acts_2_7_3[5]}}, acts_2_7_3};
    registers #(.ARRAY_WIDTH(8)) r_2_7_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_7_1_0), .q(s_2_7_1_0_reg));

    assign s_2_7_1_1 = {{2{acts_2_7_4[5]}}, acts_2_7_4} + {{2{acts_2_7_5[5]}}, acts_2_7_5} + {{2{acts_2_7_6[5]}}, acts_2_7_6} + {{2{acts_2_7_7[5]}}, acts_2_7_7};
    registers #(.ARRAY_WIDTH(8)) r_2_7_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_7_1_1), .q(s_2_7_1_1_reg));

    assign s_2_7_1_2 = {{2{acts_2_7_8[5]}}, acts_2_7_8} + {{2{acts_2_7_9[5]}}, acts_2_7_9} + {{2{acts_2_7_10[5]}}, acts_2_7_10} + {{2{acts_2_7_11[5]}}, acts_2_7_11};
    registers #(.ARRAY_WIDTH(8)) r_2_7_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_7_1_2), .q(s_2_7_1_2_reg));

    assign s_2_7_1_3 = {{2{acts_2_7_12[5]}}, acts_2_7_12} + {{2{acts_2_7_14[5]}}, acts_2_7_14} + {{2{acts_2_7_15[5]}}, acts_2_7_15} + {{2{acts_2_7_17[5]}}, acts_2_7_17};
    registers #(.ARRAY_WIDTH(8)) r_2_7_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_7_1_3), .q(s_2_7_1_3_reg));

    assign s_2_7_1_4 = {{2{acts_2_7_18[5]}}, acts_2_7_18} + {{2{acts_2_7_19[5]}}, acts_2_7_19} + {{2{acts_2_7_20[5]}}, acts_2_7_20} + {{2{acts_2_7_21[5]}}, acts_2_7_21};
    registers #(.ARRAY_WIDTH(8)) r_2_7_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_7_1_4), .q(s_2_7_1_4_reg));

    assign s_2_7_1_5 = {{2{acts_2_7_22[5]}}, acts_2_7_22} + {{2{acts_2_7_23[5]}}, acts_2_7_23} + {{2{acts_2_7_24[5]}}, acts_2_7_24} + {{2{acts_2_7_25[5]}}, acts_2_7_25};
    registers #(.ARRAY_WIDTH(8)) r_2_7_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_7_1_5), .q(s_2_7_1_5_reg));

    assign s_2_7_1_6 = {{2{acts_2_7_26[5]}}, acts_2_7_26} + {{2{acts_2_7_28[5]}}, acts_2_7_28} + {{2{acts_2_7_29[5]}}, acts_2_7_29} + {{2{acts_2_7_30[5]}}, acts_2_7_30};
    registers #(.ARRAY_WIDTH(8)) r_2_7_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_7_1_6), .q(s_2_7_1_6_reg));

    assign s_2_7_1_7 = {{2{acts_2_7_31[5]}}, acts_2_7_31};
    registers #(.ARRAY_WIDTH(8)) r_2_7_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_7_1_7), .q(s_2_7_1_7_reg));

  // Stage 2
    assign s_2_7_2_0 = {{2{s_2_7_1_0_reg[7]}}, s_2_7_1_0_reg} + {{2{s_2_7_1_1_reg[7]}}, s_2_7_1_1_reg} + {{2{s_2_7_1_2_reg[7]}}, s_2_7_1_2_reg} + {{2{s_2_7_1_3_reg[7]}}, s_2_7_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_7_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_7_2_0), .q(s_2_7_2_0_reg));

    assign s_2_7_2_1 = {{2{s_2_7_1_4_reg[7]}}, s_2_7_1_4_reg} + {{2{s_2_7_1_5_reg[7]}}, s_2_7_1_5_reg} + {{2{s_2_7_1_6_reg[7]}}, s_2_7_1_6_reg} + {{2{s_2_7_1_7_reg[7]}}, s_2_7_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_7_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_7_2_1), .q(s_2_7_2_1_reg));

  // Stage 3
    assign sum_2_7 = {{2{s_2_7_2_0_reg[9]}}, s_2_7_2_0_reg} + {{2{s_2_7_2_1_reg[9]}}, s_2_7_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_2_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_2_7), .q(sum_2_7_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_2_7 (.i_data(sum_2_7_reg), .o_data(o_vector[7]));


    // Layer 2, Node 8
      logic  [7:0] s_2_8_1_0, s_2_8_1_1, s_2_8_1_2, s_2_8_1_3, s_2_8_1_4, s_2_8_1_5, s_2_8_1_6;
    logic  [7:0] s_2_8_1_0_reg, s_2_8_1_1_reg, s_2_8_1_2_reg, s_2_8_1_3_reg, s_2_8_1_4_reg, s_2_8_1_5_reg, s_2_8_1_6_reg;
    logic  [9:0] s_2_8_2_0, s_2_8_2_1;
    logic  [9:0] s_2_8_2_0_reg, s_2_8_2_1_reg;
    logic [11:0] sum_2_8;
    logic [11:0] sum_2_8_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_0)) 
    rom_2_8_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_0_reg), .o_ld_data(acts_2_8_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_1)) 
    rom_2_8_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_1_reg), .o_ld_data(acts_2_8_1));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_2)) 
    rom_2_8_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_2_reg), .o_ld_data(acts_2_8_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_3)) 
    rom_2_8_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_3_reg), .o_ld_data(acts_2_8_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_4)) 
    rom_2_8_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_4_reg), .o_ld_data(acts_2_8_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_5)) 
    rom_2_8_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_5_reg), .o_ld_data(acts_2_8_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_6)) 
    rom_2_8_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_6_reg), .o_ld_data(acts_2_8_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_7)) 
    rom_2_8_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_7_reg), .o_ld_data(acts_2_8_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_8)) 
    rom_2_8_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_8_reg), .o_ld_data(acts_2_8_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_9)) 
    rom_2_8_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_9_reg), .o_ld_data(acts_2_8_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_10)) 
    rom_2_8_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_10_reg), .o_ld_data(acts_2_8_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_11)) 
    rom_2_8_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_11_reg), .o_ld_data(acts_2_8_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_12)) 
    rom_2_8_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_12_reg), .o_ld_data(acts_2_8_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_13)) 
    rom_2_8_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_13_reg), .o_ld_data(acts_2_8_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_14)) 
    rom_2_8_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_14_reg), .o_ld_data(acts_2_8_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_15)) 
    rom_2_8_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_15_reg), .o_ld_data(acts_2_8_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_17)) 
    rom_2_8_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_17_reg), .o_ld_data(acts_2_8_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_18)) 
    rom_2_8_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_18_reg), .o_ld_data(acts_2_8_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_20)) 
    rom_2_8_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_20_reg), .o_ld_data(acts_2_8_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_21)) 
    rom_2_8_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_21_reg), .o_ld_data(acts_2_8_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_22)) 
    rom_2_8_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_22_reg), .o_ld_data(acts_2_8_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_24)) 
    rom_2_8_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_24_reg), .o_ld_data(acts_2_8_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_25)) 
    rom_2_8_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_25_reg), .o_ld_data(acts_2_8_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_26)) 
    rom_2_8_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_26_reg), .o_ld_data(acts_2_8_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_28)) 
    rom_2_8_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_28_reg), .o_ld_data(acts_2_8_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_30)) 
    rom_2_8_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_30_reg), .o_ld_data(acts_2_8_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_8_31)) 
    rom_2_8_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_31_reg), .o_ld_data(acts_2_8_31));

  // Stage 1
    assign s_2_8_1_0 = {{2{acts_2_8_0[5]}}, acts_2_8_0} + {{2{acts_2_8_1[5]}}, acts_2_8_1} + {{2{acts_2_8_2[5]}}, acts_2_8_2} + {{2{acts_2_8_3[5]}}, acts_2_8_3};
    registers #(.ARRAY_WIDTH(8)) r_2_8_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_8_1_0), .q(s_2_8_1_0_reg));

    assign s_2_8_1_1 = {{2{acts_2_8_4[5]}}, acts_2_8_4} + {{2{acts_2_8_5[5]}}, acts_2_8_5} + {{2{acts_2_8_6[5]}}, acts_2_8_6} + {{2{acts_2_8_7[5]}}, acts_2_8_7};
    registers #(.ARRAY_WIDTH(8)) r_2_8_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_8_1_1), .q(s_2_8_1_1_reg));

    assign s_2_8_1_2 = {{2{acts_2_8_8[5]}}, acts_2_8_8} + {{2{acts_2_8_9[5]}}, acts_2_8_9} + {{2{acts_2_8_10[5]}}, acts_2_8_10} + {{2{acts_2_8_11[5]}}, acts_2_8_11};
    registers #(.ARRAY_WIDTH(8)) r_2_8_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_8_1_2), .q(s_2_8_1_2_reg));

    assign s_2_8_1_3 = {{2{acts_2_8_12[5]}}, acts_2_8_12} + {{2{acts_2_8_13[5]}}, acts_2_8_13} + {{2{acts_2_8_14[5]}}, acts_2_8_14} + {{2{acts_2_8_15[5]}}, acts_2_8_15};
    registers #(.ARRAY_WIDTH(8)) r_2_8_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_8_1_3), .q(s_2_8_1_3_reg));

    assign s_2_8_1_4 = {{2{acts_2_8_17[5]}}, acts_2_8_17} + {{2{acts_2_8_18[5]}}, acts_2_8_18} + {{2{acts_2_8_20[5]}}, acts_2_8_20} + {{2{acts_2_8_21[5]}}, acts_2_8_21};
    registers #(.ARRAY_WIDTH(8)) r_2_8_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_8_1_4), .q(s_2_8_1_4_reg));

    assign s_2_8_1_5 = {{2{acts_2_8_22[5]}}, acts_2_8_22} + {{2{acts_2_8_24[5]}}, acts_2_8_24} + {{2{acts_2_8_25[5]}}, acts_2_8_25} + {{2{acts_2_8_26[5]}}, acts_2_8_26};
    registers #(.ARRAY_WIDTH(8)) r_2_8_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_8_1_5), .q(s_2_8_1_5_reg));

    assign s_2_8_1_6 = {{2{acts_2_8_28[5]}}, acts_2_8_28} + {{2{acts_2_8_30[5]}}, acts_2_8_30} + {{2{acts_2_8_31[5]}}, acts_2_8_31};
    registers #(.ARRAY_WIDTH(8)) r_2_8_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_8_1_6), .q(s_2_8_1_6_reg));

  // Stage 2
    assign s_2_8_2_0 = {{2{s_2_8_1_0_reg[7]}}, s_2_8_1_0_reg} + {{2{s_2_8_1_1_reg[7]}}, s_2_8_1_1_reg} + {{2{s_2_8_1_2_reg[7]}}, s_2_8_1_2_reg} + {{2{s_2_8_1_3_reg[7]}}, s_2_8_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_8_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_8_2_0), .q(s_2_8_2_0_reg));

    assign s_2_8_2_1 = {{2{s_2_8_1_4_reg[7]}}, s_2_8_1_4_reg} + {{2{s_2_8_1_5_reg[7]}}, s_2_8_1_5_reg} + {{2{s_2_8_1_6_reg[7]}}, s_2_8_1_6_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_8_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_8_2_1), .q(s_2_8_2_1_reg));

  // Stage 3
    assign sum_2_8 = {{2{s_2_8_2_0_reg[9]}}, s_2_8_2_0_reg} + {{2{s_2_8_2_1_reg[9]}}, s_2_8_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_2_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_2_8), .q(sum_2_8_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_2_8 (.i_data(sum_2_8_reg), .o_data(o_vector[8]));


    // Layer 2, Node 9
      logic  [7:0] s_2_9_1_0, s_2_9_1_1, s_2_9_1_2, s_2_9_1_3, s_2_9_1_4, s_2_9_1_5, s_2_9_1_6, s_2_9_1_7;
    logic  [7:0] s_2_9_1_0_reg, s_2_9_1_1_reg, s_2_9_1_2_reg, s_2_9_1_3_reg, s_2_9_1_4_reg, s_2_9_1_5_reg, s_2_9_1_6_reg, s_2_9_1_7_reg;
    logic  [9:0] s_2_9_2_0, s_2_9_2_1;
    logic  [9:0] s_2_9_2_0_reg, s_2_9_2_1_reg;
    logic [11:0] sum_2_9;
    logic [11:0] sum_2_9_reg;
  
    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_0)) 
    rom_2_9_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_0_reg), .o_ld_data(acts_2_9_0));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_2)) 
    rom_2_9_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_2_reg), .o_ld_data(acts_2_9_2));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_3)) 
    rom_2_9_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_3_reg), .o_ld_data(acts_2_9_3));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_4)) 
    rom_2_9_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_4_reg), .o_ld_data(acts_2_9_4));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_5)) 
    rom_2_9_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_5_reg), .o_ld_data(acts_2_9_5));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_6)) 
    rom_2_9_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_6_reg), .o_ld_data(acts_2_9_6));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_7)) 
    rom_2_9_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_7_reg), .o_ld_data(acts_2_9_7));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_8)) 
    rom_2_9_8 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_8_reg), .o_ld_data(acts_2_9_8));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_9)) 
    rom_2_9_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_9_reg), .o_ld_data(acts_2_9_9));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_10)) 
    rom_2_9_10 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_10_reg), .o_ld_data(acts_2_9_10));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_11)) 
    rom_2_9_11 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_11_reg), .o_ld_data(acts_2_9_11));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_12)) 
    rom_2_9_12 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_12_reg), .o_ld_data(acts_2_9_12));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_13)) 
    rom_2_9_13 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_13_reg), .o_ld_data(acts_2_9_13));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_14)) 
    rom_2_9_14 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_14_reg), .o_ld_data(acts_2_9_14));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_15)) 
    rom_2_9_15 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_15_reg), .o_ld_data(acts_2_9_15));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_16)) 
    rom_2_9_16 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_16_reg), .o_ld_data(acts_2_9_16));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_17)) 
    rom_2_9_17 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_17_reg), .o_ld_data(acts_2_9_17));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_18)) 
    rom_2_9_18 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_18_reg), .o_ld_data(acts_2_9_18));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_19)) 
    rom_2_9_19 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_19_reg), .o_ld_data(acts_2_9_19));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_20)) 
    rom_2_9_20 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_20_reg), .o_ld_data(acts_2_9_20));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_21)) 
    rom_2_9_21 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_21_reg), .o_ld_data(acts_2_9_21));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_22)) 
    rom_2_9_22 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_22_reg), .o_ld_data(acts_2_9_22));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_23)) 
    rom_2_9_23 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_23_reg), .o_ld_data(acts_2_9_23));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_24)) 
    rom_2_9_24 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_24_reg), .o_ld_data(acts_2_9_24));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_25)) 
    rom_2_9_25 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_25_reg), .o_ld_data(acts_2_9_25));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_26)) 
    rom_2_9_26 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_26_reg), .o_ld_data(acts_2_9_26));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_27)) 
    rom_2_9_27 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_27_reg), .o_ld_data(acts_2_9_27));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_28)) 
    rom_2_9_28 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_28_reg), .o_ld_data(acts_2_9_28));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_29)) 
    rom_2_9_29 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_29_reg), .o_ld_data(acts_2_9_29));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_30)) 
    rom_2_9_30 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_30_reg), .o_ld_data(acts_2_9_30));

    lut_rom #(.DATA_WIDTH(6), .ADDR_WIDTH(6), .INIT(LUT_2_9_31)) 
    rom_2_9_31 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .i_addr(out_1_31_reg), .o_ld_data(acts_2_9_31));

  // Stage 1
    assign s_2_9_1_0 = {{2{acts_2_9_0[5]}}, acts_2_9_0} + {{2{acts_2_9_2[5]}}, acts_2_9_2} + {{2{acts_2_9_3[5]}}, acts_2_9_3} + {{2{acts_2_9_4[5]}}, acts_2_9_4};
    registers #(.ARRAY_WIDTH(8)) r_2_9_1_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_9_1_0), .q(s_2_9_1_0_reg));

    assign s_2_9_1_1 = {{2{acts_2_9_5[5]}}, acts_2_9_5} + {{2{acts_2_9_6[5]}}, acts_2_9_6} + {{2{acts_2_9_7[5]}}, acts_2_9_7} + {{2{acts_2_9_8[5]}}, acts_2_9_8};
    registers #(.ARRAY_WIDTH(8)) r_2_9_1_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_9_1_1), .q(s_2_9_1_1_reg));

    assign s_2_9_1_2 = {{2{acts_2_9_9[5]}}, acts_2_9_9} + {{2{acts_2_9_10[5]}}, acts_2_9_10} + {{2{acts_2_9_11[5]}}, acts_2_9_11} + {{2{acts_2_9_12[5]}}, acts_2_9_12};
    registers #(.ARRAY_WIDTH(8)) r_2_9_1_2 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_9_1_2), .q(s_2_9_1_2_reg));

    assign s_2_9_1_3 = {{2{acts_2_9_13[5]}}, acts_2_9_13} + {{2{acts_2_9_14[5]}}, acts_2_9_14} + {{2{acts_2_9_15[5]}}, acts_2_9_15} + {{2{acts_2_9_16[5]}}, acts_2_9_16};
    registers #(.ARRAY_WIDTH(8)) r_2_9_1_3 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_9_1_3), .q(s_2_9_1_3_reg));

    assign s_2_9_1_4 = {{2{acts_2_9_17[5]}}, acts_2_9_17} + {{2{acts_2_9_18[5]}}, acts_2_9_18} + {{2{acts_2_9_19[5]}}, acts_2_9_19} + {{2{acts_2_9_20[5]}}, acts_2_9_20};
    registers #(.ARRAY_WIDTH(8)) r_2_9_1_4 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_9_1_4), .q(s_2_9_1_4_reg));

    assign s_2_9_1_5 = {{2{acts_2_9_21[5]}}, acts_2_9_21} + {{2{acts_2_9_22[5]}}, acts_2_9_22} + {{2{acts_2_9_23[5]}}, acts_2_9_23} + {{2{acts_2_9_24[5]}}, acts_2_9_24};
    registers #(.ARRAY_WIDTH(8)) r_2_9_1_5 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_9_1_5), .q(s_2_9_1_5_reg));

    assign s_2_9_1_6 = {{2{acts_2_9_25[5]}}, acts_2_9_25} + {{2{acts_2_9_26[5]}}, acts_2_9_26} + {{2{acts_2_9_27[5]}}, acts_2_9_27} + {{2{acts_2_9_28[5]}}, acts_2_9_28};
    registers #(.ARRAY_WIDTH(8)) r_2_9_1_6 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_9_1_6), .q(s_2_9_1_6_reg));

    assign s_2_9_1_7 = {{2{acts_2_9_29[5]}}, acts_2_9_29} + {{2{acts_2_9_30[5]}}, acts_2_9_30} + {{2{acts_2_9_31[5]}}, acts_2_9_31};
    registers #(.ARRAY_WIDTH(8)) r_2_9_1_7 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_9_1_7), .q(s_2_9_1_7_reg));

  // Stage 2
    assign s_2_9_2_0 = {{2{s_2_9_1_0_reg[7]}}, s_2_9_1_0_reg} + {{2{s_2_9_1_1_reg[7]}}, s_2_9_1_1_reg} + {{2{s_2_9_1_2_reg[7]}}, s_2_9_1_2_reg} + {{2{s_2_9_1_3_reg[7]}}, s_2_9_1_3_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_9_2_0 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_9_2_0), .q(s_2_9_2_0_reg));

    assign s_2_9_2_1 = {{2{s_2_9_1_4_reg[7]}}, s_2_9_1_4_reg} + {{2{s_2_9_1_5_reg[7]}}, s_2_9_1_5_reg} + {{2{s_2_9_1_6_reg[7]}}, s_2_9_1_6_reg} + {{2{s_2_9_1_7_reg[7]}}, s_2_9_1_7_reg};
    registers #(.ARRAY_WIDTH(10)) r_2_9_2_1 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(s_2_9_2_1), .q(s_2_9_2_1_reg));

  // Stage 3
    assign sum_2_9 = {{2{s_2_9_2_0_reg[9]}}, s_2_9_2_0_reg} + {{2{s_2_9_2_1_reg[9]}}, s_2_9_2_1_reg};
    registers #(.ARRAY_WIDTH(12)) r_2_9 (.i_clk(i_clk), .i_rst_n(i_rst_n), .i_en(i_en), .d(sum_2_9), .q(sum_2_9_reg));

    saturate_clip #(.IN_WIDTH(12), .OUT_WIDTH(6)) sat_2_9 (.i_data(sum_2_9_reg), .o_data(o_vector[9]));


endmodule