
module G_0 ( pik, gik, gik_1, gij );
  input pik, gik, gik_1;
  output gij;
  wire   n2;

  INV_X1 U1 ( .A(n2), .ZN(gij) );
  AOI21_X1 U2 ( .B1(pik), .B2(gik_1), .A(gik), .ZN(n2) );
endmodule


module PG_0 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n2;

  INV_X1 U1 ( .A(n2), .ZN(gij) );
  AND2_X1 U2 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  AOI21_X1 U3 ( .B1(pik), .B2(gik_1), .A(gik), .ZN(n2) );
endmodule


module G_1 ( pik, gik, gik_1, gij );
  input pik, gik, gik_1;
  output gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(pik), .B2(gik_1), .A(gik), .ZN(n3) );
endmodule


module G_2 ( pik, gik, gik_1, gij );
  input pik, gik, gik_1;
  output gij;
  wire   n3, n4;

  INV_X1 U1 ( .A(gik), .ZN(n3) );
  NAND2_X1 U2 ( .A1(gik_1), .A2(pik), .ZN(n4) );
  NAND2_X1 U3 ( .A1(n3), .A2(n4), .ZN(gij) );
endmodule


module G_3 ( pik, gik, gik_1, gij );
  input pik, gik, gik_1;
  output gij;
  wire   n3, n4;

  INV_X1 U1 ( .A(gik), .ZN(n3) );
  NAND2_X1 U2 ( .A1(n4), .A2(n3), .ZN(gij) );
  NAND2_X1 U3 ( .A1(gik_1), .A2(pik), .ZN(n4) );
endmodule


module G_4 ( pik, gik, gik_1, gij );
  input pik, gik, gik_1;
  output gij;
  wire   n3, n4;

  INV_X1 U1 ( .A(gik), .ZN(n3) );
  NAND2_X1 U2 ( .A1(gik_1), .A2(pik), .ZN(n4) );
  NAND2_X1 U3 ( .A1(n3), .A2(n4), .ZN(gij) );
endmodule


module G_5 ( pik, gik, gik_1, gij );
  input pik, gik, gik_1;
  output gij;
  wire   n3, n4;

  NAND2_X1 U1 ( .A1(n3), .A2(n4), .ZN(gij) );
  NAND2_X1 U2 ( .A1(gik_1), .A2(pik), .ZN(n4) );
  INV_X1 U3 ( .A(gik), .ZN(n3) );
endmodule


module G_6 ( pik, gik, gik_1, gij );
  input pik, gik, gik_1;
  output gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(pik), .B2(gik_1), .A(gik), .ZN(n3) );
endmodule


module G_7 ( pik, gik, gik_1, gij );
  input pik, gik, gik_1;
  output gij;
  wire   n3, n4;

  INV_X1 U1 ( .A(gik), .ZN(n3) );
  NAND2_X1 U2 ( .A1(gik_1), .A2(pik), .ZN(n4) );
  NAND2_X1 U3 ( .A1(n4), .A2(n3), .ZN(gij) );
endmodule


module G_8 ( pik, gik, gik_1, gij );
  input pik, gik, gik_1;
  output gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(pik), .B2(gik_1), .A(gik), .ZN(n3) );
endmodule


module PG_1 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  AND2_X1 U1 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  INV_X1 U2 ( .A(n3), .ZN(gij) );
  AOI21_X1 U3 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
endmodule


module PG_2 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n4, n5;

  INV_X1 U1 ( .A(gik), .ZN(n4) );
  AND2_X1 U2 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  NAND2_X1 U3 ( .A1(gik_1), .A2(pik), .ZN(n5) );
  NAND2_X1 U4 ( .A1(n5), .A2(n4), .ZN(gij) );
endmodule


module PG_3 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_4 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  AOI21_X1 U1 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U2 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  INV_X1 U3 ( .A(n3), .ZN(gij) );
endmodule


module PG_5 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n4, n5;

  INV_X1 U1 ( .A(gik), .ZN(n4) );
  AND2_X1 U2 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  NAND2_X1 U3 ( .A1(n4), .A2(n5), .ZN(gij) );
  NAND2_X1 U4 ( .A1(gik_1), .A2(pik), .ZN(n5) );
endmodule


module PG_6 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_7 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_8 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_9 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_10 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  AOI21_X1 U1 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U2 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  INV_X1 U3 ( .A(n3), .ZN(gij) );
endmodule


module PG_11 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  AOI21_X1 U1 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U2 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  INV_X1 U3 ( .A(n3), .ZN(gij) );
endmodule


module PG_12 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  AND2_X1 U1 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  INV_X1 U2 ( .A(n3), .ZN(gij) );
  AOI21_X1 U3 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
endmodule


module PG_13 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_14 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_15 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_16 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_17 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(pik), .B2(gik_1), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik), .A2(pik_1), .ZN(pij) );
endmodule


module PG_18 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AND2_X1 U2 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  AOI21_X1 U3 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
endmodule


module PG_19 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AND2_X1 U2 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  AOI21_X1 U3 ( .B1(pik), .B2(gik_1), .A(gik), .ZN(n3) );
endmodule


module PG_20 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_21 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AND2_X1 U2 ( .A1(pik), .A2(pik_1), .ZN(pij) );
  AOI21_X1 U3 ( .B1(pik), .B2(gik_1), .A(gik), .ZN(n3) );
endmodule


module PG_22 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  AND2_X1 U1 ( .A1(pik_1), .A2(pik), .ZN(pij) );
  INV_X1 U2 ( .A(n3), .ZN(gij) );
  AOI21_X1 U3 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
endmodule


module PG_23 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AND2_X1 U2 ( .A1(pik), .A2(pik_1), .ZN(pij) );
  AOI21_X1 U3 ( .B1(pik), .B2(gik_1), .A(gik), .ZN(n3) );
endmodule


module PG_24 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module PG_25 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AND2_X1 U2 ( .A1(pik), .A2(pik_1), .ZN(pij) );
  AOI21_X1 U3 ( .B1(pik), .B2(gik_1), .A(gik), .ZN(n3) );
endmodule


module PG_26 ( pik, gik, pik_1, gik_1, pij, gij );
  input pik, gik, pik_1, gik_1;
  output pij, gij;
  wire   n3;

  INV_X1 U1 ( .A(n3), .ZN(gij) );
  AOI21_X1 U2 ( .B1(gik_1), .B2(pik), .A(gik), .ZN(n3) );
  AND2_X1 U3 ( .A1(pik_1), .A2(pik), .ZN(pij) );
endmodule


module CARRY_GENERATOR_NBIT32_NBIT_PER_BLOCK4 ( A, B, Cin, Co );
  input [31:0] A;
  input [31:0] B;
  output [8:0] Co;
  input Cin;
  wire   Cin, n27, n28, n29, \G_s[5][31] , \G_s[5][30] , \G_s[5][29] ,
         \G_s[5][28] , \G_s[5][27] , \G_s[5][26] , \G_s[5][25] , \G_s[5][24] ,
         \G_s[5][23] , \G_s[5][22] , \G_s[5][21] , \G_s[5][20] , \G_s[5][19] ,
         \G_s[5][18] , \G_s[5][17] , \G_s[5][16] , \G_s[5][15] , \G_s[5][14] ,
         \G_s[5][13] , \G_s[5][12] , \G_s[5][11] , \G_s[5][10] , \G_s[5][9] ,
         \G_s[5][8] , \G_s[5][7] , \G_s[5][6] , \G_s[5][5] , \G_s[5][4] ,
         \G_s[5][3] , \G_s[5][2] , \G_s[5][1] , \G_s[4][15] , \G_s[4][14] ,
         \G_s[4][13] , \G_s[4][12] , \G_s[4][11] , \G_s[4][10] , \G_s[4][9] ,
         \G_s[4][8] , \G_s[4][7] , \G_s[4][6] , \G_s[4][5] , \G_s[4][4] ,
         \G_s[4][3] , \G_s[4][2] , \G_s[4][1] , \G_s[4][0] , \G_s[3][7] ,
         \G_s[3][6] , \G_s[3][5] , \G_s[3][4] , \G_s[3][3] , \G_s[3][2] ,
         \G_s[3][1] , \G_s[2][7] , \G_s[2][5] , \G_s[2][3] , \G_s[1][7] ,
         \G_s[1][6] , \P_s[5][31] , \P_s[5][30] , \P_s[5][29] , \P_s[5][28] ,
         \P_s[5][27] , \P_s[5][26] , \P_s[5][25] , \P_s[5][24] , \P_s[5][23] ,
         \P_s[5][22] , \P_s[5][21] , \P_s[5][20] , \P_s[5][19] , \P_s[5][18] ,
         \P_s[5][17] , \P_s[5][16] , \P_s[5][15] , \P_s[5][14] , \P_s[5][13] ,
         \P_s[5][12] , \P_s[5][11] , \P_s[5][10] , \P_s[5][9] , \P_s[5][8] ,
         \P_s[5][7] , \P_s[5][6] , \P_s[5][5] , \P_s[5][4] , \P_s[5][3] ,
         \P_s[5][2] , \P_s[5][1] , \P_s[4][15] , \P_s[4][14] , \P_s[4][13] ,
         \P_s[4][12] , \P_s[4][11] , \P_s[4][10] , \P_s[4][9] , \P_s[4][8] ,
         \P_s[4][7] , \P_s[4][6] , \P_s[4][5] , \P_s[4][4] , \P_s[4][3] ,
         \P_s[4][2] , \P_s[4][1] , \P_s[3][7] , \P_s[3][6] , \P_s[3][5] ,
         \P_s[3][4] , \P_s[3][3] , \P_s[3][2] , \P_s[3][1] , \P_s[2][7] ,
         \P_s[2][5] , \P_s[2][3] , \P_s[1][7] , \P_s[1][6] , n1, n2, n3, n4,
         n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19,
         n21, n22, n23, n24;
  assign Co[0] = Cin;

  G_0 G_GEN_1_5_0 ( .pik(\P_s[5][1] ), .gik(\G_s[5][1] ), .gik_1(Cin), .gij(
        \G_s[4][0] ) );
  PG_0 PG_GEN_1_5_1 ( .pik(\P_s[5][3] ), .gik(\G_s[5][3] ), .pik_1(\P_s[5][2] ), .gik_1(\G_s[5][2] ), .pij(\P_s[4][1] ), .gij(\G_s[4][1] ) );
  PG_26 PG_GEN_1_5_2 ( .pik(\P_s[5][5] ), .gik(\G_s[5][5] ), .pik_1(
        \P_s[5][4] ), .gik_1(\G_s[5][4] ), .pij(\P_s[4][2] ), .gij(\G_s[4][2] ) );
  PG_25 PG_GEN_1_5_3 ( .pik(\P_s[5][7] ), .gik(\G_s[5][7] ), .pik_1(
        \P_s[5][6] ), .gik_1(\G_s[5][6] ), .pij(\P_s[4][3] ), .gij(\G_s[4][3] ) );
  PG_24 PG_GEN_1_5_4 ( .pik(\P_s[5][9] ), .gik(\G_s[5][9] ), .pik_1(
        \P_s[5][8] ), .gik_1(\G_s[5][8] ), .pij(\P_s[4][4] ), .gij(\G_s[4][4] ) );
  PG_23 PG_GEN_1_5_5 ( .pik(\P_s[5][11] ), .gik(\G_s[5][11] ), .pik_1(
        \P_s[5][10] ), .gik_1(\G_s[5][10] ), .pij(\P_s[4][5] ), .gij(
        \G_s[4][5] ) );
  PG_22 PG_GEN_1_5_6 ( .pik(\P_s[5][13] ), .gik(\G_s[5][13] ), .pik_1(
        \P_s[5][12] ), .gik_1(\G_s[5][12] ), .pij(\P_s[4][6] ), .gij(
        \G_s[4][6] ) );
  PG_21 PG_GEN_1_5_7 ( .pik(\P_s[5][15] ), .gik(\G_s[5][15] ), .pik_1(
        \P_s[5][14] ), .gik_1(\G_s[5][14] ), .pij(\P_s[4][7] ), .gij(
        \G_s[4][7] ) );
  PG_20 PG_GEN_1_5_8 ( .pik(\P_s[5][17] ), .gik(\G_s[5][17] ), .pik_1(
        \P_s[5][16] ), .gik_1(\G_s[5][16] ), .pij(\P_s[4][8] ), .gij(
        \G_s[4][8] ) );
  PG_19 PG_GEN_1_5_9 ( .pik(\P_s[5][19] ), .gik(\G_s[5][19] ), .pik_1(
        \P_s[5][18] ), .gik_1(\G_s[5][18] ), .pij(\P_s[4][9] ), .gij(
        \G_s[4][9] ) );
  PG_18 PG_GEN_1_5_10 ( .pik(\P_s[5][21] ), .gik(\G_s[5][21] ), .pik_1(
        \P_s[5][20] ), .gik_1(\G_s[5][20] ), .pij(\P_s[4][10] ), .gij(
        \G_s[4][10] ) );
  PG_17 PG_GEN_1_5_11 ( .pik(\P_s[5][23] ), .gik(\G_s[5][23] ), .pik_1(
        \P_s[5][22] ), .gik_1(\G_s[5][22] ), .pij(\P_s[4][11] ), .gij(
        \G_s[4][11] ) );
  PG_16 PG_GEN_1_5_12 ( .pik(\P_s[5][25] ), .gik(\G_s[5][25] ), .pik_1(
        \P_s[5][24] ), .gik_1(\G_s[5][24] ), .pij(\P_s[4][12] ), .gij(
        \G_s[4][12] ) );
  PG_15 PG_GEN_1_5_13 ( .pik(\P_s[5][27] ), .gik(\G_s[5][27] ), .pik_1(
        \P_s[5][26] ), .gik_1(\G_s[5][26] ), .pij(\P_s[4][13] ), .gij(
        \G_s[4][13] ) );
  PG_14 PG_GEN_1_5_14 ( .pik(\P_s[5][29] ), .gik(\G_s[5][29] ), .pik_1(
        \P_s[5][28] ), .gik_1(\G_s[5][28] ), .pij(\P_s[4][14] ), .gij(
        \G_s[4][14] ) );
  PG_13 PG_GEN_1_5_15 ( .pik(\P_s[5][31] ), .gik(\G_s[5][31] ), .pik_1(
        \P_s[5][30] ), .gik_1(\G_s[5][30] ), .pij(\P_s[4][15] ), .gij(
        \G_s[4][15] ) );
  G_8 G_GEN_1_4_0 ( .pik(\P_s[4][1] ), .gik(\G_s[4][1] ), .gik_1(\G_s[4][0] ), 
        .gij(n29) );
  PG_12 PG_GEN_1_4_1 ( .pik(\P_s[4][3] ), .gik(\G_s[4][3] ), .pik_1(
        \P_s[4][2] ), .gik_1(\G_s[4][2] ), .pij(\P_s[3][1] ), .gij(\G_s[3][1] ) );
  PG_11 PG_GEN_1_4_2 ( .pik(\P_s[4][5] ), .gik(\G_s[4][5] ), .pik_1(
        \P_s[4][4] ), .gik_1(\G_s[4][4] ), .pij(\P_s[3][2] ), .gij(\G_s[3][2] ) );
  PG_10 PG_GEN_1_4_3 ( .pik(\P_s[4][7] ), .gik(\G_s[4][7] ), .pik_1(
        \P_s[4][6] ), .gik_1(\G_s[4][6] ), .pij(\P_s[3][3] ), .gij(\G_s[3][3] ) );
  PG_9 PG_GEN_1_4_4 ( .pik(\P_s[4][9] ), .gik(\G_s[4][9] ), .pik_1(\P_s[4][8] ), .gik_1(\G_s[4][8] ), .pij(\P_s[3][4] ), .gij(\G_s[3][4] ) );
  PG_8 PG_GEN_1_4_5 ( .pik(\P_s[4][11] ), .gik(\G_s[4][11] ), .pik_1(
        \P_s[4][10] ), .gik_1(\G_s[4][10] ), .pij(\P_s[3][5] ), .gij(
        \G_s[3][5] ) );
  PG_7 PG_GEN_1_4_6 ( .pik(\P_s[4][13] ), .gik(\G_s[4][13] ), .pik_1(
        \P_s[4][12] ), .gik_1(\G_s[4][12] ), .pij(\P_s[3][6] ), .gij(
        \G_s[3][6] ) );
  PG_6 PG_GEN_1_4_7 ( .pik(\P_s[4][15] ), .gik(\G_s[4][15] ), .pik_1(
        \P_s[4][14] ), .gik_1(\G_s[4][14] ), .pij(\P_s[3][7] ), .gij(
        \G_s[3][7] ) );
  G_7 G_GEN_2_3_0_0 ( .pik(\P_s[3][1] ), .gik(\G_s[3][1] ), .gik_1(n29), .gij(
        n28) );
  PG_5 PG_GEN_2_3_1_0 ( .pik(\P_s[3][3] ), .gik(\G_s[3][3] ), .pik_1(
        \P_s[3][2] ), .gik_1(\G_s[3][2] ), .pij(\P_s[2][3] ), .gij(\G_s[2][3] ) );
  PG_4 PG_GEN_2_3_2_0 ( .pik(\P_s[3][5] ), .gik(\G_s[3][5] ), .pik_1(
        \P_s[3][4] ), .gik_1(\G_s[3][4] ), .pij(\P_s[2][5] ), .gij(\G_s[2][5] ) );
  PG_3 PG_GEN_2_3_3_0 ( .pik(\P_s[3][7] ), .gik(\G_s[3][7] ), .pik_1(
        \P_s[3][6] ), .gik_1(\G_s[3][6] ), .pij(\P_s[2][7] ), .gij(\G_s[2][7] ) );
  G_6 G_GEN_2_2_0_0 ( .pik(\P_s[3][2] ), .gik(\G_s[3][2] ), .gik_1(n6), .gij(
        Co[3]) );
  G_5 G_GEN_2_2_0_1 ( .pik(\P_s[2][3] ), .gik(\G_s[2][3] ), .gik_1(n28), .gij(
        n27) );
  PG_2 PG_GEN_2_2_1_0 ( .pik(\P_s[3][6] ), .gik(\G_s[3][6] ), .pik_1(
        \P_s[2][5] ), .gik_1(\G_s[2][5] ), .pij(\P_s[1][6] ), .gij(\G_s[1][6] ) );
  PG_1 PG_GEN_2_2_1_1 ( .pik(\P_s[2][7] ), .gik(\G_s[2][7] ), .pik_1(
        \P_s[2][5] ), .gik_1(n11), .pij(\P_s[1][7] ), .gij(\G_s[1][7] ) );
  G_4 G_GEN_2_1_0_0 ( .pik(\P_s[3][4] ), .gik(\G_s[3][4] ), .gik_1(n27), .gij(
        Co[5]) );
  G_3 G_GEN_2_1_0_1 ( .pik(\P_s[2][5] ), .gik(n11), .gik_1(n27), .gij(Co[6])
         );
  G_2 G_GEN_2_1_0_2 ( .pik(\P_s[1][6] ), .gik(\G_s[1][6] ), .gik_1(n27), .gij(
        Co[7]) );
  G_1 G_GEN_2_1_0_3 ( .pik(\P_s[1][7] ), .gik(\G_s[1][7] ), .gik_1(n1), .gij(
        Co[8]) );
  XOR2_X1 U32 ( .A(B[9]), .B(A[9]), .Z(\P_s[5][9] ) );
  XOR2_X1 U33 ( .A(B[8]), .B(A[8]), .Z(\P_s[5][8] ) );
  XOR2_X1 U35 ( .A(B[6]), .B(A[6]), .Z(\P_s[5][6] ) );
  XOR2_X1 U36 ( .A(B[5]), .B(A[5]), .Z(\P_s[5][5] ) );
  XOR2_X1 U37 ( .A(B[4]), .B(A[4]), .Z(\P_s[5][4] ) );
  XOR2_X1 U39 ( .A(B[31]), .B(A[31]), .Z(\P_s[5][31] ) );
  XOR2_X1 U40 ( .A(B[30]), .B(A[30]), .Z(\P_s[5][30] ) );
  XOR2_X1 U41 ( .A(B[2]), .B(A[2]), .Z(\P_s[5][2] ) );
  XOR2_X1 U42 ( .A(B[29]), .B(A[29]), .Z(\P_s[5][29] ) );
  XOR2_X1 U43 ( .A(B[28]), .B(A[28]), .Z(\P_s[5][28] ) );
  XOR2_X1 U44 ( .A(B[27]), .B(A[27]), .Z(\P_s[5][27] ) );
  XOR2_X1 U45 ( .A(B[26]), .B(A[26]), .Z(\P_s[5][26] ) );
  XOR2_X1 U46 ( .A(B[25]), .B(A[25]), .Z(\P_s[5][25] ) );
  XOR2_X1 U47 ( .A(B[24]), .B(A[24]), .Z(\P_s[5][24] ) );
  XOR2_X1 U49 ( .A(B[22]), .B(A[22]), .Z(\P_s[5][22] ) );
  XOR2_X1 U50 ( .A(B[21]), .B(A[21]), .Z(\P_s[5][21] ) );
  XOR2_X1 U51 ( .A(B[20]), .B(A[20]), .Z(\P_s[5][20] ) );
  XOR2_X1 U52 ( .A(B[1]), .B(A[1]), .Z(\P_s[5][1] ) );
  XOR2_X1 U54 ( .A(B[18]), .B(A[18]), .Z(\P_s[5][18] ) );
  XOR2_X1 U55 ( .A(B[17]), .B(A[17]), .Z(\P_s[5][17] ) );
  XOR2_X1 U56 ( .A(B[16]), .B(A[16]), .Z(\P_s[5][16] ) );
  XOR2_X1 U58 ( .A(B[14]), .B(A[14]), .Z(\P_s[5][14] ) );
  XOR2_X1 U59 ( .A(B[13]), .B(A[13]), .Z(\P_s[5][13] ) );
  XOR2_X1 U60 ( .A(B[12]), .B(A[12]), .Z(\P_s[5][12] ) );
  XOR2_X1 U61 ( .A(B[11]), .B(A[11]), .Z(\P_s[5][11] ) );
  XOR2_X1 U62 ( .A(B[10]), .B(A[10]), .Z(\P_s[5][10] ) );
  BUF_X2 U1 ( .A(n27), .Z(Co[4]) );
  CLKBUF_X1 U2 ( .A(n27), .Z(n1) );
  NAND2_X1 U3 ( .A1(B[19]), .A2(n3), .ZN(n4) );
  NAND2_X1 U4 ( .A1(n2), .A2(A[19]), .ZN(n5) );
  NAND2_X1 U5 ( .A1(n4), .A2(n5), .ZN(\P_s[5][19] ) );
  INV_X1 U6 ( .A(B[19]), .ZN(n2) );
  INV_X1 U7 ( .A(A[19]), .ZN(n3) );
  BUF_X1 U8 ( .A(n28), .Z(n6) );
  NAND2_X1 U9 ( .A1(B[3]), .A2(n8), .ZN(n9) );
  NAND2_X1 U10 ( .A1(n7), .A2(A[3]), .ZN(n10) );
  NAND2_X1 U11 ( .A1(n9), .A2(n10), .ZN(\P_s[5][3] ) );
  INV_X1 U12 ( .A(B[3]), .ZN(n7) );
  INV_X1 U13 ( .A(A[3]), .ZN(n8) );
  CLKBUF_X1 U14 ( .A(\G_s[2][5] ), .Z(n11) );
  NAND2_X1 U15 ( .A1(n13), .A2(B[23]), .ZN(n14) );
  NAND2_X1 U16 ( .A1(n12), .A2(A[23]), .ZN(n15) );
  NAND2_X1 U17 ( .A1(n14), .A2(n15), .ZN(\P_s[5][23] ) );
  INV_X1 U18 ( .A(B[23]), .ZN(n12) );
  INV_X1 U19 ( .A(A[23]), .ZN(n13) );
  NAND2_X1 U20 ( .A1(n17), .A2(B[15]), .ZN(n18) );
  NAND2_X1 U21 ( .A1(n16), .A2(A[15]), .ZN(n19) );
  NAND2_X1 U22 ( .A1(n19), .A2(n18), .ZN(\P_s[5][15] ) );
  INV_X1 U23 ( .A(B[15]), .ZN(n16) );
  INV_X1 U24 ( .A(A[15]), .ZN(n17) );
  CLKBUF_X1 U25 ( .A(n6), .Z(Co[2]) );
  NAND2_X1 U26 ( .A1(n22), .A2(B[7]), .ZN(n23) );
  NAND2_X1 U27 ( .A1(n21), .A2(A[7]), .ZN(n24) );
  NAND2_X1 U28 ( .A1(n24), .A2(n23), .ZN(\P_s[5][7] ) );
  INV_X1 U29 ( .A(B[7]), .ZN(n21) );
  INV_X1 U30 ( .A(A[7]), .ZN(n22) );
  AND2_X1 U31 ( .A1(B[10]), .A2(A[10]), .ZN(\G_s[5][10] ) );
  AND2_X1 U34 ( .A1(B[11]), .A2(A[11]), .ZN(\G_s[5][11] ) );
  AND2_X1 U38 ( .A1(B[6]), .A2(A[6]), .ZN(\G_s[5][6] ) );
  AND2_X1 U48 ( .A1(B[2]), .A2(A[2]), .ZN(\G_s[5][2] ) );
  AND2_X1 U53 ( .A1(B[3]), .A2(A[3]), .ZN(\G_s[5][3] ) );
  AND2_X1 U57 ( .A1(B[1]), .A2(A[1]), .ZN(\G_s[5][1] ) );
  AND2_X1 U63 ( .A1(B[18]), .A2(A[18]), .ZN(\G_s[5][18] ) );
  AND2_X1 U64 ( .A1(B[19]), .A2(A[19]), .ZN(\G_s[5][19] ) );
  AND2_X1 U65 ( .A1(B[14]), .A2(A[14]), .ZN(\G_s[5][14] ) );
  AND2_X1 U66 ( .A1(B[15]), .A2(A[15]), .ZN(\G_s[5][15] ) );
  AND2_X1 U67 ( .A1(B[16]), .A2(A[16]), .ZN(\G_s[5][16] ) );
  AND2_X1 U68 ( .A1(B[17]), .A2(A[17]), .ZN(\G_s[5][17] ) );
  AND2_X1 U69 ( .A1(B[8]), .A2(A[8]), .ZN(\G_s[5][8] ) );
  AND2_X1 U70 ( .A1(B[9]), .A2(A[9]), .ZN(\G_s[5][9] ) );
  AND2_X1 U71 ( .A1(B[26]), .A2(A[26]), .ZN(\G_s[5][26] ) );
  AND2_X1 U72 ( .A1(B[27]), .A2(A[27]), .ZN(\G_s[5][27] ) );
  AND2_X1 U73 ( .A1(B[24]), .A2(A[24]), .ZN(\G_s[5][24] ) );
  AND2_X1 U74 ( .A1(B[25]), .A2(A[25]), .ZN(\G_s[5][25] ) );
  AND2_X1 U75 ( .A1(B[30]), .A2(A[30]), .ZN(\G_s[5][30] ) );
  AND2_X1 U76 ( .A1(B[31]), .A2(A[31]), .ZN(\G_s[5][31] ) );
  AND2_X1 U77 ( .A1(B[22]), .A2(A[22]), .ZN(\G_s[5][22] ) );
  AND2_X1 U78 ( .A1(B[23]), .A2(A[23]), .ZN(\G_s[5][23] ) );
  AND2_X1 U79 ( .A1(B[29]), .A2(A[29]), .ZN(\G_s[5][29] ) );
  AND2_X1 U80 ( .A1(B[28]), .A2(A[28]), .ZN(\G_s[5][28] ) );
  AND2_X1 U81 ( .A1(B[20]), .A2(A[20]), .ZN(\G_s[5][20] ) );
  AND2_X1 U82 ( .A1(B[21]), .A2(A[21]), .ZN(\G_s[5][21] ) );
  AND2_X1 U83 ( .A1(B[12]), .A2(A[12]), .ZN(\G_s[5][12] ) );
  AND2_X1 U84 ( .A1(B[13]), .A2(A[13]), .ZN(\G_s[5][13] ) );
  AND2_X1 U85 ( .A1(B[4]), .A2(A[4]), .ZN(\G_s[5][4] ) );
  AND2_X1 U86 ( .A1(B[5]), .A2(A[5]), .ZN(\G_s[5][5] ) );
  AND2_X1 U87 ( .A1(B[7]), .A2(A[7]), .ZN(\G_s[5][7] ) );
  CLKBUF_X1 U88 ( .A(n29), .Z(Co[1]) );
endmodule


module RCA_NBITS4_0 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module MUX21_NBIT4_0 ( A, B, SEL, Y );
  input [3:0] A;
  input [3:0] B;
  output [3:0] Y;
  input SEL;
  wire   n5, n6, n7, n8, n9;

  INV_X1 U1 ( .A(SEL), .ZN(n5) );
  INV_X1 U2 ( .A(n6), .ZN(Y[3]) );
  AOI22_X1 U3 ( .A1(A[3]), .A2(n5), .B1(SEL), .B2(B[3]), .ZN(n6) );
  INV_X1 U4 ( .A(n8), .ZN(Y[1]) );
  AOI22_X1 U5 ( .A1(A[1]), .A2(n5), .B1(B[1]), .B2(SEL), .ZN(n8) );
  INV_X1 U6 ( .A(n7), .ZN(Y[2]) );
  AOI22_X1 U7 ( .A1(A[2]), .A2(n5), .B1(B[2]), .B2(SEL), .ZN(n7) );
  INV_X1 U8 ( .A(n9), .ZN(Y[0]) );
  AOI22_X1 U9 ( .A1(A[0]), .A2(n5), .B1(B[0]), .B2(SEL), .ZN(n9) );
endmodule


module RCA_NBITS4_15 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module CARRY_SELECT_N_BIT4_0 ( Cin, A, B, S );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;

  wire   [3:0] S_Ci0;
  wire   [3:0] S_Ci1;

  RCA_NBITS4_0 RCA_0 ( .A(A), .B(B), .Ci(1'b0), .S(S_Ci0) );
  RCA_NBITS4_15 RCA_1 ( .A(A), .B(B), .Ci(1'b1), .S(S_Ci1) );
  MUX21_NBIT4_0 MUX_OUT ( .A(S_Ci0), .B(S_Ci1), .SEL(Cin), .Y(S) );
endmodule


module RCA_NBITS4_13 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module RCA_NBITS4_14 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module MUX21_NBIT4_7 ( A, B, SEL, Y );
  input [3:0] A;
  input [3:0] B;
  output [3:0] Y;
  input SEL;
  wire   n10, n11, n12, n13, n14;

  INV_X1 U1 ( .A(n10), .ZN(Y[0]) );
  INV_X1 U2 ( .A(n11), .ZN(Y[1]) );
  INV_X1 U3 ( .A(n12), .ZN(Y[2]) );
  INV_X1 U4 ( .A(n13), .ZN(Y[3]) );
  AOI22_X1 U5 ( .A1(A[3]), .A2(n14), .B1(SEL), .B2(B[3]), .ZN(n13) );
  AOI22_X1 U6 ( .A1(A[2]), .A2(n14), .B1(B[2]), .B2(SEL), .ZN(n12) );
  AOI22_X1 U7 ( .A1(A[1]), .A2(n14), .B1(B[1]), .B2(SEL), .ZN(n11) );
  AOI22_X1 U8 ( .A1(A[0]), .A2(n14), .B1(B[0]), .B2(SEL), .ZN(n10) );
  INV_X1 U9 ( .A(SEL), .ZN(n14) );
endmodule


module CARRY_SELECT_N_BIT4_7 ( Cin, A, B, S );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;

  wire   [3:0] S_Ci0;
  wire   [3:0] S_Ci1;

  RCA_NBITS4_14 RCA_0 ( .A(A), .B(B), .Ci(1'b0), .S(S_Ci0) );
  RCA_NBITS4_13 RCA_1 ( .A(A), .B(B), .Ci(1'b1), .S(S_Ci1) );
  MUX21_NBIT4_7 MUX_OUT ( .A(S_Ci0), .B(S_Ci1), .SEL(Cin), .Y(S) );
endmodule


module RCA_NBITS4_1 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module RCA_NBITS4_2 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module MUX21_NBIT4_1 ( A, B, SEL, Y );
  input [3:0] A;
  input [3:0] B;
  output [3:0] Y;
  input SEL;


  MUX2_X1 U1 ( .A(A[0]), .B(B[0]), .S(SEL), .Z(Y[0]) );
  MUX2_X1 U2 ( .A(A[1]), .B(B[1]), .S(SEL), .Z(Y[1]) );
  MUX2_X1 U3 ( .A(A[2]), .B(B[2]), .S(SEL), .Z(Y[2]) );
  MUX2_X1 U4 ( .A(A[3]), .B(B[3]), .S(SEL), .Z(Y[3]) );
endmodule


module CARRY_SELECT_N_BIT4_1 ( Cin, A, B, S );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;

  wire   [3:0] S_Ci0;
  wire   [3:0] S_Ci1;

  RCA_NBITS4_2 RCA_0 ( .A(A), .B(B), .Ci(1'b0), .S(S_Ci0) );
  RCA_NBITS4_1 RCA_1 ( .A(A), .B(B), .Ci(1'b1), .S(S_Ci1) );
  MUX21_NBIT4_1 MUX_OUT ( .A(S_Ci0), .B(S_Ci1), .SEL(Cin), .Y(S) );
endmodule


module RCA_NBITS4_3 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module RCA_NBITS4_4 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module MUX21_NBIT4_2 ( A, B, SEL, Y );
  input [3:0] A;
  input [3:0] B;
  output [3:0] Y;
  input SEL;


  MUX2_X1 U1 ( .A(A[2]), .B(B[2]), .S(SEL), .Z(Y[2]) );
  MUX2_X1 U2 ( .A(A[0]), .B(B[0]), .S(SEL), .Z(Y[0]) );
  MUX2_X1 U3 ( .A(A[1]), .B(B[1]), .S(SEL), .Z(Y[1]) );
  MUX2_X1 U4 ( .A(A[3]), .B(B[3]), .S(SEL), .Z(Y[3]) );
endmodule


module CARRY_SELECT_N_BIT4_2 ( Cin, A, B, S );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;

  wire   [3:0] S_Ci0;
  wire   [3:0] S_Ci1;

  RCA_NBITS4_4 RCA_0 ( .A(A), .B(B), .Ci(1'b0), .S(S_Ci0) );
  RCA_NBITS4_3 RCA_1 ( .A(A), .B(B), .Ci(1'b1), .S(S_Ci1) );
  MUX21_NBIT4_2 MUX_OUT ( .A(S_Ci0), .B(S_Ci1), .SEL(Cin), .Y(S) );
endmodule


module RCA_NBITS4_5 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module RCA_NBITS4_6 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module MUX21_NBIT4_3 ( A, B, SEL, Y );
  input [3:0] A;
  input [3:0] B;
  output [3:0] Y;
  input SEL;


  MUX2_X1 U1 ( .A(A[0]), .B(B[0]), .S(SEL), .Z(Y[0]) );
  MUX2_X1 U2 ( .A(A[2]), .B(B[2]), .S(SEL), .Z(Y[2]) );
  MUX2_X1 U3 ( .A(A[1]), .B(B[1]), .S(SEL), .Z(Y[1]) );
  MUX2_X1 U4 ( .A(A[3]), .B(B[3]), .S(SEL), .Z(Y[3]) );
endmodule


module CARRY_SELECT_N_BIT4_3 ( Cin, A, B, S );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;

  wire   [3:0] S_Ci0;
  wire   [3:0] S_Ci1;

  RCA_NBITS4_6 RCA_0 ( .A(A), .B(B), .Ci(1'b0), .S(S_Ci0) );
  RCA_NBITS4_5 RCA_1 ( .A(A), .B(B), .Ci(1'b1), .S(S_Ci1) );
  MUX21_NBIT4_3 MUX_OUT ( .A(S_Ci0), .B(S_Ci1), .SEL(Cin), .Y(S) );
endmodule


module RCA_NBITS4_7 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module RCA_NBITS4_8 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module MUX21_NBIT4_4 ( A, B, SEL, Y );
  input [3:0] A;
  input [3:0] B;
  output [3:0] Y;
  input SEL;
  wire   n10, n11, n12, n13, n14, n15;

  INV_X1 U1 ( .A(SEL), .ZN(n10) );
  INV_X1 U2 ( .A(n11), .ZN(Y[0]) );
  INV_X1 U3 ( .A(n12), .ZN(Y[1]) );
  INV_X1 U4 ( .A(n13), .ZN(Y[2]) );
  INV_X1 U5 ( .A(n14), .ZN(Y[3]) );
  AOI22_X1 U6 ( .A1(A[3]), .A2(n10), .B1(SEL), .B2(B[3]), .ZN(n14) );
  AOI22_X1 U7 ( .A1(A[2]), .A2(n10), .B1(B[2]), .B2(SEL), .ZN(n13) );
  AOI22_X1 U8 ( .A1(A[1]), .A2(n15), .B1(B[1]), .B2(SEL), .ZN(n12) );
  AOI22_X1 U9 ( .A1(A[0]), .A2(n15), .B1(B[0]), .B2(SEL), .ZN(n11) );
  INV_X1 U10 ( .A(SEL), .ZN(n15) );
endmodule


module CARRY_SELECT_N_BIT4_4 ( Cin, A, B, S );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;

  wire   [3:0] S_Ci0;
  wire   [3:0] S_Ci1;

  RCA_NBITS4_8 RCA_0 ( .A(A), .B(B), .Ci(1'b0), .S(S_Ci0) );
  RCA_NBITS4_7 RCA_1 ( .A(A), .B(B), .Ci(1'b1), .S(S_Ci1) );
  MUX21_NBIT4_4 MUX_OUT ( .A(S_Ci0), .B(S_Ci1), .SEL(Cin), .Y(S) );
endmodule


module RCA_NBITS4_9 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module RCA_NBITS4_10 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module MUX21_NBIT4_5 ( A, B, SEL, Y );
  input [3:0] A;
  input [3:0] B;
  output [3:0] Y;
  input SEL;
  wire   n10, n11, n12, n13, n14, n15;

  INV_X1 U1 ( .A(SEL), .ZN(n10) );
  INV_X1 U2 ( .A(SEL), .ZN(n15) );
  INV_X1 U3 ( .A(n11), .ZN(Y[0]) );
  AOI22_X1 U4 ( .A1(A[0]), .A2(n15), .B1(B[0]), .B2(SEL), .ZN(n11) );
  INV_X1 U5 ( .A(n12), .ZN(Y[1]) );
  AOI22_X1 U6 ( .A1(A[1]), .A2(n15), .B1(SEL), .B2(B[1]), .ZN(n12) );
  INV_X1 U7 ( .A(n13), .ZN(Y[2]) );
  AOI22_X1 U8 ( .A1(n10), .A2(A[2]), .B1(SEL), .B2(B[2]), .ZN(n13) );
  INV_X1 U9 ( .A(n14), .ZN(Y[3]) );
  AOI22_X1 U10 ( .A1(A[3]), .A2(n10), .B1(SEL), .B2(B[3]), .ZN(n14) );
endmodule


module CARRY_SELECT_N_BIT4_5 ( Cin, A, B, S );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;

  wire   [3:0] S_Ci0;
  wire   [3:0] S_Ci1;

  RCA_NBITS4_10 RCA_0 ( .A(A), .B(B), .Ci(1'b0), .S(S_Ci0) );
  RCA_NBITS4_9 RCA_1 ( .A(A), .B(B), .Ci(1'b1), .S(S_Ci1) );
  MUX21_NBIT4_5 MUX_OUT ( .A(S_Ci0), .B(S_Ci1), .SEL(Cin), .Y(S) );
endmodule


module RCA_NBITS4_11 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module RCA_NBITS4_12 ( A, B, Ci, S, Co );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Ci;
  output Co;
  wire   \add_1_root_add_51_2/carry[3] , \add_1_root_add_51_2/carry[2] ,
         \add_1_root_add_51_2/carry[1] ;

  FA_X1 \add_1_root_add_51_2/U1_0  ( .A(A[0]), .B(B[0]), .CI(Ci), .CO(
        \add_1_root_add_51_2/carry[1] ), .S(S[0]) );
  FA_X1 \add_1_root_add_51_2/U1_1  ( .A(A[1]), .B(B[1]), .CI(
        \add_1_root_add_51_2/carry[1] ), .CO(\add_1_root_add_51_2/carry[2] ), 
        .S(S[1]) );
  FA_X1 \add_1_root_add_51_2/U1_2  ( .A(A[2]), .B(B[2]), .CI(
        \add_1_root_add_51_2/carry[2] ), .CO(\add_1_root_add_51_2/carry[3] ), 
        .S(S[2]) );
  FA_X1 \add_1_root_add_51_2/U1_3  ( .A(A[3]), .B(B[3]), .CI(
        \add_1_root_add_51_2/carry[3] ), .CO(Co), .S(S[3]) );
endmodule


module MUX21_NBIT4_6 ( A, B, SEL, Y );
  input [3:0] A;
  input [3:0] B;
  output [3:0] Y;
  input SEL;
  wire   n10, n11, n12, n13, n14;

  INV_X1 U1 ( .A(n10), .ZN(Y[0]) );
  INV_X1 U2 ( .A(n11), .ZN(Y[1]) );
  INV_X1 U3 ( .A(n12), .ZN(Y[2]) );
  INV_X1 U4 ( .A(n13), .ZN(Y[3]) );
  AOI22_X1 U5 ( .A1(A[3]), .A2(n14), .B1(SEL), .B2(B[3]), .ZN(n13) );
  AOI22_X1 U6 ( .A1(A[2]), .A2(n14), .B1(B[2]), .B2(SEL), .ZN(n12) );
  AOI22_X1 U7 ( .A1(A[1]), .A2(n14), .B1(B[1]), .B2(SEL), .ZN(n11) );
  AOI22_X1 U8 ( .A1(A[0]), .A2(n14), .B1(B[0]), .B2(SEL), .ZN(n10) );
  INV_X1 U9 ( .A(SEL), .ZN(n14) );
endmodule


module CARRY_SELECT_N_BIT4_6 ( Cin, A, B, S );
  input [3:0] A;
  input [3:0] B;
  output [3:0] S;
  input Cin;

  wire   [3:0] S_Ci0;
  wire   [3:0] S_Ci1;

  RCA_NBITS4_12 RCA_0 ( .A(A), .B(B), .Ci(1'b0), .S(S_Ci0) );
  RCA_NBITS4_11 RCA_1 ( .A(A), .B(B), .Ci(1'b1), .S(S_Ci1) );
  MUX21_NBIT4_6 MUX_OUT ( .A(S_Ci0), .B(S_Ci1), .SEL(Cin), .Y(S) );
endmodule


module SUM_GENERATOR_NBIT_PER_BLOCK4_NBLOCKS8 ( A, B, Ci, S );
  input [31:0] A;
  input [31:0] B;
  input [7:0] Ci;
  output [31:0] S;


  CARRY_SELECT_N_BIT4_0 CS_I_1 ( .Cin(Ci[0]), .A(A[3:0]), .B(B[3:0]), .S(
        S[3:0]) );
  CARRY_SELECT_N_BIT4_7 CS_I_2 ( .Cin(Ci[1]), .A(A[7:4]), .B(B[7:4]), .S(
        S[7:4]) );
  CARRY_SELECT_N_BIT4_6 CS_I_3 ( .Cin(Ci[2]), .A(A[11:8]), .B(B[11:8]), .S(
        S[11:8]) );
  CARRY_SELECT_N_BIT4_5 CS_I_4 ( .Cin(Ci[3]), .A(A[15:12]), .B(B[15:12]), .S(
        S[15:12]) );
  CARRY_SELECT_N_BIT4_4 CS_I_5 ( .Cin(Ci[4]), .A(A[19:16]), .B(B[19:16]), .S(
        S[19:16]) );
  CARRY_SELECT_N_BIT4_3 CS_I_6 ( .Cin(Ci[5]), .A(A[23:20]), .B(B[23:20]), .S(
        S[23:20]) );
  CARRY_SELECT_N_BIT4_2 CS_I_7 ( .Cin(Ci[6]), .A(A[27:24]), .B(B[27:24]), .S(
        S[27:24]) );
  CARRY_SELECT_N_BIT4_1 CS_I_8 ( .Cin(Ci[7]), .A(A[31:28]), .B(B[31:28]), .S(
        S[31:28]) );
endmodule


module P4_ADDER ( A, B, Cin, S, Co );
  input [31:0] A;
  input [31:0] B;
  output [31:0] S;
  input Cin;
  output Co;

  wire   [7:0] int_carry;

  CARRY_GENERATOR_NBIT32_NBIT_PER_BLOCK4 CLA_U ( .A(A), .B(B), .Cin(Cin), .Co(
        {Co, int_carry}) );
  SUM_GENERATOR_NBIT_PER_BLOCK4_NBLOCKS8 SG_U ( .A(A), .B(B), .Ci(int_carry), 
        .S(S) );
endmodule

