/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 28 12:57:17 2022
/////////////////////////////////////////////////////////////


module ahb_slave ( clk, n_rst, hsel, haddr, htrans, hsize, hwrite, hwdata, 
        hrdata, hresp, hready, hburst, buffer_occupancy, tx_transfer_active, 
        tx_error, store_tx_data, clear, dmode, tx_data, tx_packet );
  input [3:0] haddr;
  input [1:0] htrans;
  input [1:0] hsize;
  input [31:0] hwdata;
  output [31:0] hrdata;
  input [2:0] hburst;
  input [6:0] buffer_occupancy;
  output [7:0] tx_data;
  output [2:0] tx_packet;
  input clk, n_rst, hsel, hwrite, tx_transfer_active, tx_error;
  output hresp, hready, store_tx_data, clear, dmode;
  wire   tx_transfer_active, \prev_haddr[0] , prev_hwrite, \mem[13][7] ,
         \mem[13][6] , \mem[13][5] , \mem[13][4] , \mem[13][3] , \mem[13][2] ,
         \mem[13][1] , \mem[13][0] , \mem[12][7] , \mem[12][6] , \mem[12][5] ,
         \mem[12][4] , \mem[12][3] , \mem[8][6] , \mem[8][5] , \mem[8][4] ,
         \mem[8][3] , \mem[8][2] , \mem[8][1] , \mem[8][0] , \mem[7][0] ,
         \mem[5][1] , \mem[3][7] , \mem[3][6] , \mem[3][5] , \mem[3][4] ,
         \mem[3][3] , \mem[3][2] , \mem[3][1] , \mem[3][0] , \mem[2][7] ,
         \mem[2][6] , \mem[2][5] , \mem[2][4] , \mem[2][3] , \mem[2][2] ,
         \mem[2][1] , \mem[2][0] , \mem[1][7] , \mem[1][6] , \mem[1][5] ,
         \mem[1][4] , \mem[1][3] , \mem[1][2] , \mem[1][1] , \mem[1][0] ,
         \mem[0][7] , \mem[0][6] , \mem[0][5] , \mem[0][4] , \mem[0][3] ,
         \mem[0][2] , \mem[0][1] , \mem[0][0] , \next_mem[13][7] ,
         \next_mem[13][6] , \next_mem[13][5] , \next_mem[13][4] ,
         \next_mem[13][3] , \next_mem[13][2] , \next_mem[13][1] ,
         \next_mem[13][0] , \next_mem[12][7] , \next_mem[12][6] ,
         \next_mem[12][5] , \next_mem[12][4] , \next_mem[12][3] ,
         \next_mem[12][2] , \next_mem[12][1] , \next_mem[12][0] ,
         \next_mem[8][6] , \next_mem[8][5] , \next_mem[8][4] ,
         \next_mem[8][3] , \next_mem[8][2] , \next_mem[8][1] ,
         \next_mem[8][0] , \next_mem[7][0] , \next_mem[5][1] ,
         prev_tx_transfer_active, N756, N757, N758, N773, N774, N775, N776,
         N777, N778, N779, N780, N840, N841, N842, N843, N844, N845, N846,
         N847, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n1,
         n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n115, n116, n117, n118, n119, n120, n121, n122, n123,
         n124, n125, n126, n127, n128, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n153, n154, n155, n156,
         n157, n158, n159, n160, n161, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n197, n198, n199, n200,
         n201, n202, n203, n204, n205, n206, n207, n208, n209, n210, n211,
         n212, n213, n214, n215, n216, n217, n218, n219, n220, n221, n222,
         n223, n224, n225, n226, n227, n228, n229, n230, n231, n232, n233,
         n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244,
         n245, n246, n247, n248, n249, n250, n251, n252, n253, n254, n255,
         n256, n257, n258, n259, n260, n261, n262, n263, n264, n265, n266,
         n267, n268, n269, n270, n271, n272, n273, n274, n275, n276, n277,
         n278, n279, n280, n281, n282, n283, n284, n285, n286, n287, n288,
         n289, n290, n291, n292, n325, n326, n327, n328, n329, n330, n331,
         n332, n333, n334, n335, n336, n337, n338, n339, n340, n341, n342,
         n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, n353,
         n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364,
         n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375,
         n376, n377, n378, n379, n380, n381, n382, n383, n384, n385, n386,
         n387, n388, n389, n390, n391, n392, n393, n394, n395, n396, n397,
         n398, n399, n400, n401, n402, n403, n404, n405, n406, n407, n408,
         n409, n410, n411, n412, n413, n414, n415, n416, n417, n418, n419,
         n420, n421, n422, n423, n424, n425, n426, n427, n428, n429, n430,
         n431, n432, n433, n434, n435, n436, n437, n438, n439, n440, n441,
         n442, n443, n444, n445, n446, n447, n448, n449, n450, n451, n452,
         n453, n454, n455, n456, n457, n458, n459, n460, n461, n462, n463,
         n464, n465, n466, n467, n468, n469, n470, n471, n472, n473, n474,
         n475, n476, n477, n478, n479, n480, n481, n482, n483, n484, n485,
         n486, n487, n488, n489, n490, n491, n492, n493, n494, n495, n496,
         n497;
  wire   [2:0] state;
  wire   [2:0] next_state;
  wire   [1:0] next_data_hsize;
  wire   [1:0] prev_hsize;
  wire   [1:0] data_hsize;
  wire   [1:0] prev_htrans;
  assign dmode = tx_transfer_active;
  assign \next_mem[8][6]  = buffer_occupancy[6];
  assign \next_mem[8][5]  = buffer_occupancy[5];
  assign \next_mem[8][4]  = buffer_occupancy[4];
  assign \next_mem[8][3]  = buffer_occupancy[3];
  assign \next_mem[8][2]  = buffer_occupancy[2];
  assign \next_mem[8][1]  = buffer_occupancy[1];
  assign \next_mem[8][0]  = buffer_occupancy[0];

  DFFSR \mem_reg[8][6]  ( .D(\next_mem[8][6] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\mem[8][6] ) );
  DFFSR \mem_reg[8][5]  ( .D(\next_mem[8][5] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\mem[8][5] ) );
  DFFSR \mem_reg[8][4]  ( .D(\next_mem[8][4] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\mem[8][4] ) );
  DFFSR \mem_reg[8][3]  ( .D(\next_mem[8][3] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\mem[8][3] ) );
  DFFSR \mem_reg[8][2]  ( .D(\next_mem[8][2] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\mem[8][2] ) );
  DFFSR \mem_reg[8][1]  ( .D(\next_mem[8][1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\mem[8][1] ) );
  DFFSR \mem_reg[8][0]  ( .D(\next_mem[8][0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\mem[8][0] ) );
  DFFSR \mem_reg[7][0]  ( .D(\next_mem[7][0] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\mem[7][0] ) );
  DFFSR \mem_reg[5][1]  ( .D(\next_mem[5][1] ), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\mem[5][1] ) );
  DFFSR \prev_haddr_reg[3]  ( .D(haddr[3]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(N758) );
  DFFSR \prev_haddr_reg[2]  ( .D(haddr[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(N757) );
  DFFSR \prev_haddr_reg[1]  ( .D(haddr[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(N756) );
  DFFSR \prev_haddr_reg[0]  ( .D(haddr[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(\prev_haddr[0] ) );
  DFFSR \prev_htrans_reg[1]  ( .D(htrans[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_htrans[1]) );
  DFFSR \prev_htrans_reg[0]  ( .D(htrans[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_htrans[0]) );
  DFFSR \prev_hsize_reg[1]  ( .D(hsize[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_hsize[1]) );
  DFFSR \prev_hsize_reg[0]  ( .D(hsize[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(prev_hsize[0]) );
  DFFSR prev_hwrite_reg ( .D(hwrite), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        prev_hwrite) );
  DFFSR \state_reg[0]  ( .D(next_state[0]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[0]) );
  DFFSR \data_hsize_reg[0]  ( .D(next_data_hsize[0]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_hsize[0]) );
  DFFSR \data_hsize_reg[1]  ( .D(next_data_hsize[1]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_hsize[1]) );
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \mem_reg[13][7]  ( .D(\next_mem[13][7] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[13][7] ) );
  DFFSR \mem_reg[13][6]  ( .D(\next_mem[13][6] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[13][6] ) );
  DFFSR \mem_reg[13][5]  ( .D(\next_mem[13][5] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[13][5] ) );
  DFFSR \mem_reg[13][4]  ( .D(\next_mem[13][4] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[13][4] ) );
  DFFSR \mem_reg[13][3]  ( .D(\next_mem[13][3] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[13][3] ) );
  DFFSR \mem_reg[13][2]  ( .D(\next_mem[13][2] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[13][2] ) );
  DFFSR \mem_reg[13][1]  ( .D(\next_mem[13][1] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[13][1] ) );
  DFFSR \mem_reg[13][0]  ( .D(\next_mem[13][0] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[13][0] ) );
  DFFSR \mem_reg[1][0]  ( .D(n316), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[1][0] ) );
  DFFSR \mem_reg[1][1]  ( .D(n315), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[1][1] ) );
  DFFSR \mem_reg[1][2]  ( .D(n314), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[1][2] ) );
  DFFSR \mem_reg[1][3]  ( .D(n313), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[1][3] ) );
  DFFSR \mem_reg[1][4]  ( .D(n312), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[1][4] ) );
  DFFSR \mem_reg[1][5]  ( .D(n311), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[1][5] ) );
  DFFSR \mem_reg[1][6]  ( .D(n310), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[1][6] ) );
  DFFSR \mem_reg[1][7]  ( .D(n309), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[1][7] ) );
  DFFSR \mem_reg[3][7]  ( .D(n293), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[3][7] ) );
  DFFSR \mem_reg[3][6]  ( .D(n294), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[3][6] ) );
  DFFSR \mem_reg[3][5]  ( .D(n295), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[3][5] ) );
  DFFSR \mem_reg[3][4]  ( .D(n296), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[3][4] ) );
  DFFSR \mem_reg[3][3]  ( .D(n297), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[3][3] ) );
  DFFSR \mem_reg[3][2]  ( .D(n298), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[3][2] ) );
  DFFSR \mem_reg[3][1]  ( .D(n299), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[3][1] ) );
  DFFSR \mem_reg[3][0]  ( .D(n300), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[3][0] ) );
  DFFSR \mem_reg[2][7]  ( .D(n301), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[2][7] ) );
  DFFSR \mem_reg[2][6]  ( .D(n302), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[2][6] ) );
  DFFSR \mem_reg[2][5]  ( .D(n303), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[2][5] ) );
  DFFSR \mem_reg[2][4]  ( .D(n304), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[2][4] ) );
  DFFSR \mem_reg[2][3]  ( .D(n305), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[2][3] ) );
  DFFSR \mem_reg[2][2]  ( .D(n306), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[2][2] ) );
  DFFSR \mem_reg[2][1]  ( .D(n307), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[2][1] ) );
  DFFSR \mem_reg[2][0]  ( .D(n308), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[2][0] ) );
  DFFSR \mem_reg[0][7]  ( .D(n317), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[0][7] ) );
  DFFSR \mem_reg[0][6]  ( .D(n318), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[0][6] ) );
  DFFSR \mem_reg[0][5]  ( .D(n319), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[0][5] ) );
  DFFSR \mem_reg[0][4]  ( .D(n320), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[0][4] ) );
  DFFSR \mem_reg[0][3]  ( .D(n321), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[0][3] ) );
  DFFSR \mem_reg[0][2]  ( .D(n322), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[0][2] ) );
  DFFSR \mem_reg[0][1]  ( .D(n323), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[0][1] ) );
  DFFSR \mem_reg[0][0]  ( .D(n324), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        \mem[0][0] ) );
  DFFSR prev_tx_transfer_active_reg ( .D(tx_transfer_active), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(prev_tx_transfer_active) );
  DFFSR \mem_reg[12][7]  ( .D(\next_mem[12][7] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[12][7] ) );
  DFFSR \mem_reg[12][6]  ( .D(\next_mem[12][6] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[12][6] ) );
  DFFSR \mem_reg[12][5]  ( .D(\next_mem[12][5] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[12][5] ) );
  DFFSR \mem_reg[12][4]  ( .D(\next_mem[12][4] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[12][4] ) );
  DFFSR \mem_reg[12][3]  ( .D(\next_mem[12][3] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(\mem[12][3] ) );
  DFFSR \mem_reg[12][2]  ( .D(\next_mem[12][2] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(tx_packet[2]) );
  DFFSR \mem_reg[12][1]  ( .D(\next_mem[12][1] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(tx_packet[1]) );
  DFFSR \mem_reg[12][0]  ( .D(\next_mem[12][0] ), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(tx_packet[0]) );
  OR2X2 U4 ( .A(N758), .B(\prev_haddr[0] ), .Y(n1) );
  OR2X2 U5 ( .A(N758), .B(n497), .Y(n2) );
  AND2X2 U68 ( .A(tx_packet[1]), .B(n170), .Y(n3) );
  AND2X2 U69 ( .A(tx_packet[1]), .B(n263), .Y(n4) );
  AND2X2 U70 ( .A(tx_packet[2]), .B(n170), .Y(n5) );
  AND2X2 U71 ( .A(\mem[12][3] ), .B(n170), .Y(n6) );
  AND2X2 U72 ( .A(\mem[12][4] ), .B(n170), .Y(n7) );
  AND2X2 U73 ( .A(\mem[12][5] ), .B(n170), .Y(n8) );
  AND2X2 U74 ( .A(\mem[12][6] ), .B(n170), .Y(n9) );
  AND2X2 U75 ( .A(\mem[12][7] ), .B(n170), .Y(n10) );
  AND2X2 U76 ( .A(tx_packet[2]), .B(n263), .Y(n11) );
  AND2X2 U78 ( .A(\mem[12][3] ), .B(n263), .Y(n12) );
  AND2X2 U79 ( .A(\mem[12][4] ), .B(n263), .Y(n13) );
  AND2X2 U80 ( .A(\mem[12][5] ), .B(n263), .Y(n14) );
  AND2X2 U81 ( .A(\mem[12][6] ), .B(n263), .Y(n15) );
  AND2X2 U82 ( .A(\mem[12][7] ), .B(n263), .Y(n16) );
  AND2X2 U83 ( .A(N758), .B(\prev_haddr[0] ), .Y(n255) );
  AND2X2 U84 ( .A(N758), .B(n497), .Y(n162) );
  INVX2 U85 ( .A(n486), .Y(n467) );
  BUFX2 U86 ( .A(n414), .Y(n89) );
  INVX2 U87 ( .A(n268), .Y(n90) );
  INVX1 U88 ( .A(n90), .Y(n175) );
  INVX1 U89 ( .A(N756), .Y(n268) );
  BUFX2 U90 ( .A(n464), .Y(n91) );
  NOR2X1 U91 ( .A(n175), .B(n269), .Y(n100) );
  NOR2X1 U93 ( .A(n269), .B(n90), .Y(n98) );
  NOR2X1 U94 ( .A(n497), .B(N758), .Y(n101) );
  AND2X1 U95 ( .A(n98), .B(n101), .Y(n160) );
  NAND2X1 U96 ( .A(\prev_haddr[0] ), .B(N758), .Y(n164) );
  OAI22X1 U97 ( .A(\mem[3][0] ), .B(n176), .C(\mem[2][0] ), .D(n1), .Y(n96) );
  AOI21X1 U98 ( .A(n162), .B(n178), .C(N756), .Y(n93) );
  OAI22X1 U99 ( .A(\mem[1][0] ), .B(n176), .C(\mem[0][0] ), .D(n1), .Y(n94) );
  OAI22X1 U107 ( .A(n97), .B(n96), .C(n95), .D(n94), .Y(n99) );
  NOR2X1 U108 ( .A(n269), .B(n164), .Y(n172) );
  AND2X1 U109 ( .A(n101), .B(n100), .Y(n171) );
  AND2X1 U110 ( .A(n162), .B(N757), .Y(n170) );
  AOI22X1 U111 ( .A(\mem[7][0] ), .B(n171), .C(tx_packet[0]), .D(n170), .Y(
        n102) );
  AOI21X1 U112 ( .A(\mem[13][0] ), .B(n172), .C(n177), .Y(n103) );
  OAI22X1 U113 ( .A(\mem[3][1] ), .B(n176), .C(\mem[2][1] ), .D(n1), .Y(n109)
         );
  AOI21X1 U114 ( .A(n162), .B(n179), .C(N756), .Y(n106) );
  OAI22X1 U115 ( .A(\mem[1][1] ), .B(n176), .C(\mem[0][1] ), .D(n1), .Y(n107)
         );
  OAI22X1 U116 ( .A(n110), .B(n109), .C(n108), .D(n107), .Y(n111) );
  AOI21X1 U117 ( .A(\mem[13][1] ), .B(n172), .C(n3), .Y(n112) );
  NAND3X1 U118 ( .A(n114), .B(n113), .C(n112), .Y(N846) );
  OAI22X1 U119 ( .A(\mem[3][2] ), .B(n176), .C(\mem[2][2] ), .D(n1), .Y(n119)
         );
  AOI21X1 U120 ( .A(n162), .B(n180), .C(N756), .Y(n116) );
  OAI22X1 U121 ( .A(\mem[1][2] ), .B(n176), .C(\mem[0][2] ), .D(n1), .Y(n117)
         );
  OAI22X1 U122 ( .A(n120), .B(n119), .C(n118), .D(n117), .Y(n121) );
  AOI21X1 U123 ( .A(\mem[13][2] ), .B(n172), .C(n5), .Y(n122) );
  OAI22X1 U124 ( .A(\mem[3][3] ), .B(n176), .C(\mem[2][3] ), .D(n1), .Y(n128)
         );
  AOI21X1 U125 ( .A(n162), .B(n181), .C(N756), .Y(n125) );
  OAI22X1 U126 ( .A(\mem[1][3] ), .B(n176), .C(\mem[0][3] ), .D(n1), .Y(n126)
         );
  OAI22X1 U127 ( .A(n129), .B(n128), .C(n127), .D(n126), .Y(n130) );
  AOI21X1 U128 ( .A(\mem[13][3] ), .B(n172), .C(n6), .Y(n131) );
  OAI22X1 U129 ( .A(\mem[3][4] ), .B(n176), .C(\mem[2][4] ), .D(n1), .Y(n137)
         );
  AOI21X1 U130 ( .A(n162), .B(n182), .C(N756), .Y(n134) );
  OAI22X1 U131 ( .A(\mem[1][4] ), .B(n176), .C(\mem[0][4] ), .D(n1), .Y(n135)
         );
  OAI22X1 U132 ( .A(n138), .B(n137), .C(n136), .D(n135), .Y(n139) );
  AOI21X1 U133 ( .A(\mem[13][4] ), .B(n172), .C(n7), .Y(n140) );
  OAI22X1 U134 ( .A(\mem[3][5] ), .B(n176), .C(\mem[2][5] ), .D(n1), .Y(n146)
         );
  AOI21X1 U135 ( .A(n162), .B(n183), .C(N756), .Y(n143) );
  OAI22X1 U136 ( .A(\mem[1][5] ), .B(n176), .C(\mem[0][5] ), .D(n1), .Y(n144)
         );
  OAI22X1 U137 ( .A(n147), .B(n146), .C(n145), .D(n144), .Y(n148) );
  AOI21X1 U138 ( .A(\mem[13][5] ), .B(n172), .C(n8), .Y(n149) );
  OAI22X1 U139 ( .A(\mem[3][6] ), .B(n176), .C(\mem[2][6] ), .D(n1), .Y(n155)
         );
  AOI21X1 U140 ( .A(n162), .B(n184), .C(N756), .Y(n152) );
  OAI22X1 U141 ( .A(\mem[1][6] ), .B(n176), .C(\mem[0][6] ), .D(n1), .Y(n153)
         );
  OAI22X1 U142 ( .A(n156), .B(n155), .C(n154), .D(n153), .Y(n157) );
  AOI21X1 U143 ( .A(\mem[13][6] ), .B(n172), .C(n9), .Y(n158) );
  OAI22X1 U144 ( .A(\mem[3][7] ), .B(n176), .C(\mem[2][7] ), .D(n1), .Y(n167)
         );
  OAI22X1 U145 ( .A(\mem[1][7] ), .B(n176), .C(\mem[0][7] ), .D(n1), .Y(n165)
         );
  OAI22X1 U146 ( .A(n168), .B(n167), .C(n166), .D(n165), .Y(n169) );
  AOI21X1 U147 ( .A(\mem[13][7] ), .B(n172), .C(n10), .Y(n173) );
  NAND2X1 U148 ( .A(n164), .B(n161), .Y(n168) );
  NAND2X1 U149 ( .A(n164), .B(n151), .Y(n156) );
  NAND2X1 U150 ( .A(n164), .B(n142), .Y(n147) );
  NAND2X1 U151 ( .A(n164), .B(n133), .Y(n138) );
  NAND2X1 U152 ( .A(n164), .B(n124), .Y(n129) );
  NAND2X1 U153 ( .A(n164), .B(n115), .Y(n120) );
  NAND2X1 U154 ( .A(n164), .B(n105), .Y(n110) );
  NAND2X1 U155 ( .A(n164), .B(n92), .Y(n97) );
  NAND2X1 U156 ( .A(n164), .B(n163), .Y(n166) );
  NAND2X1 U157 ( .A(n164), .B(n152), .Y(n154) );
  NAND2X1 U158 ( .A(n164), .B(n143), .Y(n145) );
  NAND2X1 U159 ( .A(n164), .B(n134), .Y(n136) );
  NAND2X1 U160 ( .A(n164), .B(n125), .Y(n127) );
  NAND2X1 U161 ( .A(n164), .B(n116), .Y(n118) );
  NAND2X1 U162 ( .A(n164), .B(n106), .Y(n108) );
  NAND2X1 U163 ( .A(n164), .B(n93), .Y(n95) );
  NAND2X1 U164 ( .A(\mem[5][1] ), .B(n160), .Y(n114) );
  NAND2X1 U165 ( .A(n169), .B(n269), .Y(n174) );
  NAND2X1 U166 ( .A(n157), .B(n269), .Y(n159) );
  NAND2X1 U167 ( .A(n148), .B(n269), .Y(n150) );
  NAND2X1 U168 ( .A(n139), .B(n269), .Y(n141) );
  NAND2X1 U169 ( .A(n130), .B(n269), .Y(n132) );
  NAND2X1 U170 ( .A(n121), .B(n269), .Y(n123) );
  NAND2X1 U171 ( .A(n111), .B(n269), .Y(n113) );
  NAND2X1 U172 ( .A(n99), .B(n269), .Y(n104) );
  NOR2X1 U173 ( .A(n162), .B(n90), .Y(n163) );
  NOR2X1 U174 ( .A(n162), .B(n175), .Y(n92) );
  NOR2X1 U175 ( .A(n162), .B(n175), .Y(n105) );
  NOR2X1 U176 ( .A(n162), .B(n175), .Y(n115) );
  NOR2X1 U177 ( .A(n162), .B(n175), .Y(n124) );
  NOR2X1 U178 ( .A(n162), .B(n175), .Y(n133) );
  NOR2X1 U179 ( .A(n162), .B(n175), .Y(n142) );
  NOR2X1 U180 ( .A(n162), .B(n175), .Y(n151) );
  NOR2X1 U181 ( .A(n162), .B(n175), .Y(n161) );
  NAND2X1 U182 ( .A(n174), .B(n173), .Y(N840) );
  NAND2X1 U183 ( .A(n159), .B(n158), .Y(N841) );
  NAND2X1 U184 ( .A(n150), .B(n149), .Y(N842) );
  NAND2X1 U185 ( .A(n141), .B(n140), .Y(N843) );
  NAND2X1 U186 ( .A(n132), .B(n131), .Y(N844) );
  NAND2X1 U187 ( .A(n123), .B(n122), .Y(N845) );
  NAND2X1 U188 ( .A(n104), .B(n103), .Y(N847) );
  INVX2 U189 ( .A(n101), .Y(n176) );
  INVX2 U190 ( .A(n102), .Y(n177) );
  INVX2 U191 ( .A(\mem[8][0] ), .Y(n178) );
  INVX2 U192 ( .A(\mem[8][1] ), .Y(n179) );
  INVX2 U193 ( .A(\mem[8][2] ), .Y(n180) );
  INVX2 U194 ( .A(\mem[8][3] ), .Y(n181) );
  INVX2 U195 ( .A(\mem[8][4] ), .Y(n182) );
  INVX2 U196 ( .A(\mem[8][5] ), .Y(n183) );
  INVX2 U197 ( .A(\mem[8][6] ), .Y(n184) );
  NOR2X1 U198 ( .A(n268), .B(n269), .Y(n193) );
  NOR2X1 U199 ( .A(n269), .B(n90), .Y(n191) );
  NOR2X1 U200 ( .A(\prev_haddr[0] ), .B(N758), .Y(n194) );
  AND2X1 U201 ( .A(n191), .B(n194), .Y(n253) );
  NAND2X1 U202 ( .A(n497), .B(N758), .Y(n257) );
  OAI22X1 U203 ( .A(\mem[3][0] ), .B(n270), .C(\mem[2][0] ), .D(n2), .Y(n189)
         );
  AOI21X1 U204 ( .A(n255), .B(n178), .C(N756), .Y(n186) );
  OAI22X1 U205 ( .A(\mem[1][0] ), .B(n270), .C(\mem[0][0] ), .D(n2), .Y(n187)
         );
  OAI22X1 U206 ( .A(n190), .B(n189), .C(n188), .D(n187), .Y(n192) );
  NOR2X1 U207 ( .A(n269), .B(n257), .Y(n265) );
  AND2X1 U208 ( .A(n194), .B(n193), .Y(n264) );
  AND2X1 U209 ( .A(n255), .B(N757), .Y(n263) );
  AOI22X1 U210 ( .A(\mem[7][0] ), .B(n264), .C(tx_packet[0]), .D(n263), .Y(
        n195) );
  AOI21X1 U211 ( .A(\mem[13][0] ), .B(n265), .C(n271), .Y(n196) );
  OAI22X1 U212 ( .A(\mem[3][1] ), .B(n270), .C(\mem[2][1] ), .D(n2), .Y(n202)
         );
  AOI21X1 U213 ( .A(n255), .B(n179), .C(N756), .Y(n199) );
  OAI22X1 U214 ( .A(\mem[1][1] ), .B(n270), .C(\mem[0][1] ), .D(n2), .Y(n200)
         );
  OAI22X1 U215 ( .A(n203), .B(n202), .C(n201), .D(n200), .Y(n204) );
  AOI21X1 U216 ( .A(\mem[13][1] ), .B(n265), .C(n4), .Y(n205) );
  NAND3X1 U217 ( .A(n207), .B(n206), .C(n205), .Y(N779) );
  OAI22X1 U218 ( .A(\mem[3][2] ), .B(n270), .C(\mem[2][2] ), .D(n2), .Y(n212)
         );
  AOI21X1 U219 ( .A(n255), .B(n180), .C(N756), .Y(n209) );
  OAI22X1 U220 ( .A(\mem[1][2] ), .B(n270), .C(\mem[0][2] ), .D(n2), .Y(n210)
         );
  OAI22X1 U221 ( .A(n213), .B(n212), .C(n211), .D(n210), .Y(n214) );
  AOI21X1 U222 ( .A(\mem[13][2] ), .B(n265), .C(n11), .Y(n215) );
  OAI22X1 U223 ( .A(\mem[3][3] ), .B(n270), .C(\mem[2][3] ), .D(n2), .Y(n221)
         );
  AOI21X1 U224 ( .A(n255), .B(n181), .C(N756), .Y(n218) );
  OAI22X1 U225 ( .A(\mem[1][3] ), .B(n270), .C(\mem[0][3] ), .D(n2), .Y(n219)
         );
  OAI22X1 U226 ( .A(n222), .B(n221), .C(n220), .D(n219), .Y(n223) );
  AOI21X1 U227 ( .A(\mem[13][3] ), .B(n265), .C(n12), .Y(n224) );
  OAI22X1 U228 ( .A(\mem[3][4] ), .B(n270), .C(\mem[2][4] ), .D(n2), .Y(n230)
         );
  AOI21X1 U229 ( .A(n255), .B(n182), .C(N756), .Y(n227) );
  OAI22X1 U230 ( .A(\mem[1][4] ), .B(n270), .C(\mem[0][4] ), .D(n2), .Y(n228)
         );
  OAI22X1 U231 ( .A(n231), .B(n230), .C(n229), .D(n228), .Y(n232) );
  AOI21X1 U232 ( .A(\mem[13][4] ), .B(n265), .C(n13), .Y(n233) );
  OAI22X1 U233 ( .A(\mem[3][5] ), .B(n270), .C(\mem[2][5] ), .D(n2), .Y(n239)
         );
  AOI21X1 U234 ( .A(n255), .B(n183), .C(N756), .Y(n236) );
  OAI22X1 U235 ( .A(\mem[1][5] ), .B(n270), .C(\mem[0][5] ), .D(n2), .Y(n237)
         );
  OAI22X1 U236 ( .A(n240), .B(n239), .C(n238), .D(n237), .Y(n241) );
  AOI21X1 U237 ( .A(\mem[13][5] ), .B(n265), .C(n14), .Y(n242) );
  OAI22X1 U238 ( .A(\mem[3][6] ), .B(n270), .C(\mem[2][6] ), .D(n2), .Y(n248)
         );
  AOI21X1 U239 ( .A(n255), .B(n184), .C(N756), .Y(n245) );
  OAI22X1 U240 ( .A(\mem[1][6] ), .B(n270), .C(\mem[0][6] ), .D(n2), .Y(n246)
         );
  OAI22X1 U241 ( .A(n249), .B(n248), .C(n247), .D(n246), .Y(n250) );
  AOI21X1 U242 ( .A(\mem[13][6] ), .B(n265), .C(n15), .Y(n251) );
  OAI22X1 U243 ( .A(\mem[3][7] ), .B(n270), .C(\mem[2][7] ), .D(n2), .Y(n260)
         );
  OAI22X1 U244 ( .A(\mem[1][7] ), .B(n270), .C(\mem[0][7] ), .D(n2), .Y(n258)
         );
  OAI22X1 U245 ( .A(n261), .B(n260), .C(n259), .D(n258), .Y(n262) );
  AOI21X1 U246 ( .A(\mem[13][7] ), .B(n265), .C(n16), .Y(n266) );
  NAND2X1 U247 ( .A(n257), .B(n254), .Y(n261) );
  NAND2X1 U248 ( .A(n257), .B(n244), .Y(n249) );
  NAND2X1 U249 ( .A(n257), .B(n235), .Y(n240) );
  NAND2X1 U250 ( .A(n257), .B(n226), .Y(n231) );
  NAND2X1 U251 ( .A(n257), .B(n217), .Y(n222) );
  NAND2X1 U252 ( .A(n257), .B(n208), .Y(n213) );
  NAND2X1 U253 ( .A(n257), .B(n198), .Y(n203) );
  NAND2X1 U254 ( .A(n257), .B(n185), .Y(n190) );
  NAND2X1 U255 ( .A(n257), .B(n256), .Y(n259) );
  NAND2X1 U256 ( .A(n257), .B(n245), .Y(n247) );
  NAND2X1 U257 ( .A(n257), .B(n236), .Y(n238) );
  NAND2X1 U258 ( .A(n257), .B(n227), .Y(n229) );
  NAND2X1 U259 ( .A(n257), .B(n218), .Y(n220) );
  NAND2X1 U260 ( .A(n257), .B(n209), .Y(n211) );
  NAND2X1 U261 ( .A(n257), .B(n199), .Y(n201) );
  NAND2X1 U262 ( .A(n257), .B(n186), .Y(n188) );
  NAND2X1 U263 ( .A(\mem[5][1] ), .B(n253), .Y(n207) );
  NAND2X1 U264 ( .A(n262), .B(n269), .Y(n267) );
  NAND2X1 U265 ( .A(n250), .B(n269), .Y(n252) );
  NAND2X1 U266 ( .A(n241), .B(n269), .Y(n243) );
  NAND2X1 U267 ( .A(n232), .B(n269), .Y(n234) );
  NAND2X1 U268 ( .A(n223), .B(n269), .Y(n225) );
  NAND2X1 U269 ( .A(n214), .B(n269), .Y(n216) );
  NAND2X1 U270 ( .A(n204), .B(n269), .Y(n206) );
  NAND2X1 U271 ( .A(n192), .B(n269), .Y(n197) );
  NOR2X1 U272 ( .A(n255), .B(n90), .Y(n256) );
  NOR2X1 U273 ( .A(n255), .B(n268), .Y(n185) );
  NOR2X1 U274 ( .A(n255), .B(n268), .Y(n198) );
  NOR2X1 U275 ( .A(n255), .B(n268), .Y(n208) );
  NOR2X1 U276 ( .A(n255), .B(n268), .Y(n217) );
  NOR2X1 U277 ( .A(n255), .B(n268), .Y(n226) );
  NOR2X1 U278 ( .A(n255), .B(n268), .Y(n235) );
  NOR2X1 U279 ( .A(n255), .B(n268), .Y(n244) );
  NOR2X1 U280 ( .A(n255), .B(n268), .Y(n254) );
  NAND2X1 U281 ( .A(n267), .B(n266), .Y(N773) );
  NAND2X1 U282 ( .A(n252), .B(n251), .Y(N774) );
  NAND2X1 U283 ( .A(n243), .B(n242), .Y(N775) );
  NAND2X1 U284 ( .A(n234), .B(n233), .Y(N776) );
  NAND2X1 U285 ( .A(n225), .B(n224), .Y(N777) );
  NAND2X1 U286 ( .A(n216), .B(n215), .Y(N778) );
  NAND2X1 U287 ( .A(n197), .B(n196), .Y(N780) );
  INVX2 U288 ( .A(N757), .Y(n269) );
  INVX2 U289 ( .A(n194), .Y(n270) );
  INVX2 U290 ( .A(n195), .Y(n271) );
  NAND2X1 U291 ( .A(n272), .B(n273), .Y(tx_data[7]) );
  AOI22X1 U292 ( .A(\mem[1][7] ), .B(n274), .C(\mem[2][7] ), .D(n275), .Y(n273) );
  AOI22X1 U293 ( .A(\mem[3][7] ), .B(n276), .C(\mem[0][7] ), .D(n277), .Y(n272) );
  NAND2X1 U294 ( .A(n278), .B(n279), .Y(tx_data[6]) );
  AOI22X1 U295 ( .A(\mem[1][6] ), .B(n274), .C(\mem[2][6] ), .D(n275), .Y(n279) );
  AOI22X1 U296 ( .A(\mem[3][6] ), .B(n276), .C(\mem[0][6] ), .D(n277), .Y(n278) );
  NAND2X1 U297 ( .A(n280), .B(n281), .Y(tx_data[5]) );
  AOI22X1 U298 ( .A(\mem[1][5] ), .B(n274), .C(\mem[2][5] ), .D(n275), .Y(n281) );
  AOI22X1 U299 ( .A(\mem[3][5] ), .B(n276), .C(\mem[0][5] ), .D(n277), .Y(n280) );
  NAND2X1 U300 ( .A(n282), .B(n283), .Y(tx_data[4]) );
  AOI22X1 U301 ( .A(\mem[1][4] ), .B(n274), .C(\mem[2][4] ), .D(n275), .Y(n283) );
  AOI22X1 U302 ( .A(\mem[3][4] ), .B(n276), .C(\mem[0][4] ), .D(n277), .Y(n282) );
  NAND2X1 U303 ( .A(n284), .B(n285), .Y(tx_data[3]) );
  AOI22X1 U304 ( .A(\mem[1][3] ), .B(n274), .C(\mem[2][3] ), .D(n275), .Y(n285) );
  AOI22X1 U305 ( .A(\mem[3][3] ), .B(n276), .C(\mem[0][3] ), .D(n277), .Y(n284) );
  NAND2X1 U306 ( .A(n286), .B(n287), .Y(tx_data[2]) );
  AOI22X1 U307 ( .A(\mem[1][2] ), .B(n274), .C(\mem[2][2] ), .D(n275), .Y(n287) );
  AOI22X1 U308 ( .A(\mem[3][2] ), .B(n276), .C(\mem[0][2] ), .D(n277), .Y(n286) );
  NAND2X1 U309 ( .A(n288), .B(n289), .Y(tx_data[1]) );
  AOI22X1 U310 ( .A(\mem[1][1] ), .B(n274), .C(\mem[2][1] ), .D(n275), .Y(n289) );
  AOI22X1 U311 ( .A(\mem[3][1] ), .B(n276), .C(\mem[0][1] ), .D(n277), .Y(n288) );
  NAND2X1 U312 ( .A(n290), .B(n291), .Y(tx_data[0]) );
  AOI22X1 U313 ( .A(\mem[1][0] ), .B(n274), .C(\mem[2][0] ), .D(n275), .Y(n291) );
  INVX1 U314 ( .A(n292), .Y(n275) );
  AOI22X1 U315 ( .A(\mem[3][0] ), .B(n276), .C(\mem[0][0] ), .D(n277), .Y(n290) );
  INVX1 U316 ( .A(n325), .Y(n276) );
  OAI22X1 U317 ( .A(n326), .B(n327), .C(n328), .D(n329), .Y(next_state[1]) );
  OAI21X1 U318 ( .A(n328), .B(n330), .C(n331), .Y(next_state[0]) );
  MUX2X1 U319 ( .B(n332), .A(n333), .S(state[0]), .Y(n331) );
  NOR2X1 U320 ( .A(n334), .B(n335), .Y(n332) );
  AOI21X1 U321 ( .A(n330), .B(data_hsize[0]), .C(data_hsize[1]), .Y(n328) );
  OR2X1 U322 ( .A(\mem[7][0] ), .B(tx_error), .Y(\next_mem[7][0] ) );
  OR2X1 U323 ( .A(tx_transfer_active), .B(\mem[5][1] ), .Y(\next_mem[5][1] )
         );
  OAI22X1 U324 ( .A(n336), .B(n337), .C(n338), .D(n339), .Y(\next_mem[13][7] )
         );
  INVX1 U325 ( .A(\mem[13][7] ), .Y(n339) );
  OAI22X1 U326 ( .A(n336), .B(n340), .C(n338), .D(n341), .Y(\next_mem[13][6] )
         );
  INVX1 U327 ( .A(\mem[13][6] ), .Y(n341) );
  OAI22X1 U328 ( .A(n336), .B(n342), .C(n338), .D(n343), .Y(\next_mem[13][5] )
         );
  OAI22X1 U329 ( .A(n336), .B(n344), .C(n338), .D(n345), .Y(\next_mem[13][4] )
         );
  OAI22X1 U330 ( .A(n336), .B(n346), .C(n338), .D(n347), .Y(\next_mem[13][3] )
         );
  INVX1 U331 ( .A(\mem[13][3] ), .Y(n347) );
  OAI22X1 U332 ( .A(n336), .B(n348), .C(n338), .D(n349), .Y(\next_mem[13][2] )
         );
  INVX1 U333 ( .A(\mem[13][2] ), .Y(n349) );
  OAI22X1 U334 ( .A(n336), .B(n350), .C(n338), .D(n351), .Y(\next_mem[13][1] )
         );
  OAI22X1 U335 ( .A(n336), .B(n352), .C(n338), .D(n353), .Y(\next_mem[13][0] )
         );
  INVX1 U336 ( .A(\mem[13][0] ), .Y(n353) );
  OAI21X1 U337 ( .A(n354), .B(n355), .C(n336), .Y(n338) );
  OR2X1 U338 ( .A(\next_mem[8][0] ), .B(n356), .Y(n355) );
  OR2X1 U339 ( .A(\next_mem[8][2] ), .B(\next_mem[8][1] ), .Y(n356) );
  NAND2X1 U340 ( .A(n357), .B(n358), .Y(n354) );
  NOR2X1 U341 ( .A(\next_mem[8][6] ), .B(\next_mem[8][5] ), .Y(n358) );
  NOR2X1 U342 ( .A(\next_mem[8][4] ), .B(\next_mem[8][3] ), .Y(n357) );
  NAND2X1 U343 ( .A(n359), .B(\prev_haddr[0] ), .Y(n336) );
  OAI21X1 U344 ( .A(n337), .B(n360), .C(n361), .Y(\next_mem[12][7] ) );
  NAND2X1 U345 ( .A(\mem[12][7] ), .B(n362), .Y(n361) );
  OAI21X1 U346 ( .A(n340), .B(n360), .C(n363), .Y(\next_mem[12][6] ) );
  NAND2X1 U347 ( .A(\mem[12][6] ), .B(n362), .Y(n363) );
  OAI21X1 U348 ( .A(n342), .B(n360), .C(n364), .Y(\next_mem[12][5] ) );
  NAND2X1 U349 ( .A(\mem[12][5] ), .B(n362), .Y(n364) );
  OAI21X1 U350 ( .A(n344), .B(n360), .C(n365), .Y(\next_mem[12][4] ) );
  NAND2X1 U351 ( .A(\mem[12][4] ), .B(n362), .Y(n365) );
  OAI21X1 U352 ( .A(n346), .B(n360), .C(n366), .Y(\next_mem[12][3] ) );
  NAND2X1 U353 ( .A(\mem[12][3] ), .B(n362), .Y(n366) );
  OAI21X1 U354 ( .A(n348), .B(n360), .C(n367), .Y(\next_mem[12][2] ) );
  NAND2X1 U355 ( .A(tx_packet[2]), .B(n362), .Y(n367) );
  OAI21X1 U356 ( .A(n350), .B(n360), .C(n368), .Y(\next_mem[12][1] ) );
  NAND2X1 U357 ( .A(tx_packet[1]), .B(n362), .Y(n368) );
  OAI21X1 U358 ( .A(n352), .B(n360), .C(n369), .Y(\next_mem[12][0] ) );
  NAND2X1 U359 ( .A(tx_packet[0]), .B(n362), .Y(n369) );
  INVX1 U360 ( .A(n370), .Y(n362) );
  OAI21X1 U361 ( .A(tx_transfer_active), .B(n371), .C(n360), .Y(n370) );
  INVX1 U362 ( .A(prev_tx_transfer_active), .Y(n371) );
  NAND2X1 U363 ( .A(n359), .B(n497), .Y(n360) );
  INVX1 U364 ( .A(n372), .Y(n359) );
  NAND3X1 U365 ( .A(n373), .B(n175), .C(n374), .Y(n372) );
  NOR2X1 U366 ( .A(n269), .B(n375), .Y(n374) );
  NOR2X1 U367 ( .A(n376), .B(n377), .Y(next_data_hsize[1]) );
  MUX2X1 U368 ( .B(prev_hsize[1]), .A(data_hsize[1]), .S(n335), .Y(n377) );
  NOR2X1 U369 ( .A(n376), .B(n378), .Y(next_data_hsize[0]) );
  MUX2X1 U370 ( .B(prev_hsize[0]), .A(data_hsize[0]), .S(n335), .Y(n378) );
  NAND3X1 U371 ( .A(prev_hwrite), .B(hsel), .C(n379), .Y(n335) );
  NOR2X1 U372 ( .A(N758), .B(N757), .Y(n379) );
  INVX1 U373 ( .A(n380), .Y(n376) );
  NAND3X1 U374 ( .A(n334), .B(n381), .C(n329), .Y(n380) );
  INVX1 U375 ( .A(next_state[2]), .Y(n381) );
  NAND2X1 U376 ( .A(n292), .B(n327), .Y(next_state[2]) );
  INVX1 U377 ( .A(n333), .Y(n327) );
  NOR2X1 U378 ( .A(n382), .B(store_tx_data), .Y(n333) );
  NAND3X1 U379 ( .A(n292), .B(n325), .C(n329), .Y(store_tx_data) );
  NOR2X1 U380 ( .A(n277), .B(n274), .Y(n329) );
  INVX1 U381 ( .A(n330), .Y(n274) );
  NAND3X1 U382 ( .A(n383), .B(n384), .C(state[1]), .Y(n330) );
  NAND3X1 U383 ( .A(n383), .B(n326), .C(state[2]), .Y(n325) );
  INVX1 U384 ( .A(state[1]), .Y(n326) );
  NAND3X1 U385 ( .A(state[1]), .B(n384), .C(state[0]), .Y(n292) );
  INVX1 U386 ( .A(state[2]), .Y(n384) );
  MUX2X1 U387 ( .B(n352), .A(n385), .S(n386), .Y(n324) );
  INVX1 U388 ( .A(hwdata[0]), .Y(n352) );
  MUX2X1 U389 ( .B(n350), .A(n387), .S(n386), .Y(n323) );
  INVX1 U390 ( .A(hwdata[1]), .Y(n350) );
  MUX2X1 U391 ( .B(n348), .A(n388), .S(n386), .Y(n322) );
  INVX1 U392 ( .A(hwdata[2]), .Y(n348) );
  MUX2X1 U393 ( .B(n346), .A(n389), .S(n386), .Y(n321) );
  INVX1 U394 ( .A(hwdata[3]), .Y(n346) );
  MUX2X1 U395 ( .B(n344), .A(n390), .S(n386), .Y(n320) );
  INVX1 U396 ( .A(hwdata[4]), .Y(n344) );
  MUX2X1 U397 ( .B(n342), .A(n391), .S(n386), .Y(n319) );
  INVX1 U398 ( .A(hwdata[5]), .Y(n342) );
  MUX2X1 U399 ( .B(n340), .A(n392), .S(n386), .Y(n318) );
  INVX1 U400 ( .A(hwdata[6]), .Y(n340) );
  MUX2X1 U401 ( .B(n337), .A(n393), .S(n386), .Y(n317) );
  INVX1 U402 ( .A(hwdata[7]), .Y(n337) );
  OAI21X1 U403 ( .A(n394), .B(n395), .C(n396), .Y(n316) );
  NAND2X1 U404 ( .A(hwdata[8]), .B(n397), .Y(n396) );
  OAI21X1 U405 ( .A(n394), .B(n398), .C(n399), .Y(n315) );
  NAND2X1 U406 ( .A(hwdata[9]), .B(n397), .Y(n399) );
  OAI21X1 U407 ( .A(n394), .B(n400), .C(n401), .Y(n314) );
  NAND2X1 U408 ( .A(hwdata[10]), .B(n397), .Y(n401) );
  OAI21X1 U409 ( .A(n394), .B(n402), .C(n403), .Y(n313) );
  NAND2X1 U410 ( .A(hwdata[11]), .B(n397), .Y(n403) );
  OAI21X1 U411 ( .A(n394), .B(n404), .C(n405), .Y(n312) );
  NAND2X1 U412 ( .A(hwdata[12]), .B(n397), .Y(n405) );
  OAI21X1 U413 ( .A(n394), .B(n406), .C(n407), .Y(n311) );
  NAND2X1 U414 ( .A(hwdata[13]), .B(n397), .Y(n407) );
  OAI21X1 U415 ( .A(n394), .B(n408), .C(n409), .Y(n310) );
  NAND2X1 U416 ( .A(hwdata[14]), .B(n397), .Y(n409) );
  OAI21X1 U417 ( .A(n394), .B(n410), .C(n411), .Y(n309) );
  NAND2X1 U418 ( .A(hwdata[15]), .B(n397), .Y(n411) );
  OAI21X1 U419 ( .A(n412), .B(n413), .C(n89), .Y(n397) );
  NAND2X1 U420 ( .A(n415), .B(n416), .Y(n413) );
  AOI21X1 U421 ( .A(n416), .B(n412), .C(n386), .Y(n394) );
  OAI21X1 U422 ( .A(n417), .B(n416), .C(n415), .Y(n386) );
  INVX1 U423 ( .A(prev_hsize[0]), .Y(n412) );
  MUX2X1 U424 ( .B(n418), .A(n419), .S(n89), .Y(n308) );
  INVX1 U425 ( .A(hwdata[16]), .Y(n418) );
  MUX2X1 U426 ( .B(n420), .A(n421), .S(n89), .Y(n307) );
  INVX1 U427 ( .A(hwdata[17]), .Y(n420) );
  MUX2X1 U428 ( .B(n422), .A(n423), .S(n89), .Y(n306) );
  INVX1 U429 ( .A(hwdata[18]), .Y(n422) );
  MUX2X1 U430 ( .B(n424), .A(n425), .S(n89), .Y(n305) );
  INVX1 U431 ( .A(hwdata[19]), .Y(n424) );
  MUX2X1 U432 ( .B(n426), .A(n427), .S(n89), .Y(n304) );
  INVX1 U433 ( .A(hwdata[20]), .Y(n426) );
  MUX2X1 U434 ( .B(n428), .A(n429), .S(n89), .Y(n303) );
  INVX1 U435 ( .A(hwdata[21]), .Y(n428) );
  MUX2X1 U436 ( .B(n430), .A(n431), .S(n89), .Y(n302) );
  INVX1 U437 ( .A(hwdata[22]), .Y(n430) );
  MUX2X1 U438 ( .B(n432), .A(n433), .S(n89), .Y(n301) );
  INVX1 U439 ( .A(hwdata[23]), .Y(n432) );
  MUX2X1 U440 ( .B(n434), .A(n435), .S(n89), .Y(n300) );
  INVX1 U441 ( .A(hwdata[24]), .Y(n434) );
  MUX2X1 U442 ( .B(n436), .A(n437), .S(n89), .Y(n299) );
  INVX1 U443 ( .A(hwdata[25]), .Y(n436) );
  MUX2X1 U444 ( .B(n438), .A(n439), .S(n89), .Y(n298) );
  INVX1 U445 ( .A(hwdata[26]), .Y(n438) );
  MUX2X1 U446 ( .B(n440), .A(n441), .S(n89), .Y(n297) );
  INVX1 U447 ( .A(hwdata[27]), .Y(n440) );
  MUX2X1 U448 ( .B(n442), .A(n443), .S(n89), .Y(n296) );
  INVX1 U449 ( .A(hwdata[28]), .Y(n442) );
  MUX2X1 U450 ( .B(n444), .A(n445), .S(n89), .Y(n295) );
  INVX1 U451 ( .A(hwdata[29]), .Y(n444) );
  MUX2X1 U452 ( .B(n446), .A(n447), .S(n89), .Y(n294) );
  INVX1 U453 ( .A(hwdata[30]), .Y(n446) );
  MUX2X1 U454 ( .B(n448), .A(n449), .S(n89), .Y(n293) );
  NAND2X1 U455 ( .A(n417), .B(n415), .Y(n414) );
  INVX1 U456 ( .A(n450), .Y(n415) );
  NAND3X1 U457 ( .A(n269), .B(n375), .C(n373), .Y(n450) );
  INVX1 U458 ( .A(n451), .Y(n373) );
  NAND3X1 U459 ( .A(prev_htrans[1]), .B(prev_hwrite), .C(n452), .Y(n451) );
  AND2X1 U460 ( .A(n453), .B(hsel), .Y(n452) );
  NOR2X1 U461 ( .A(n416), .B(prev_hsize[0]), .Y(n417) );
  INVX1 U462 ( .A(prev_hsize[1]), .Y(n416) );
  INVX1 U463 ( .A(hwdata[31]), .Y(n448) );
  NOR2X1 U464 ( .A(n454), .B(n277), .Y(hready) );
  NOR2X1 U465 ( .A(n334), .B(n383), .Y(n277) );
  INVX1 U466 ( .A(state[0]), .Y(n383) );
  INVX1 U467 ( .A(n382), .Y(n334) );
  NOR2X1 U468 ( .A(state[1]), .B(state[2]), .Y(n382) );
  AOI21X1 U469 ( .A(n455), .B(n456), .C(n457), .Y(n454) );
  INVX1 U470 ( .A(hresp), .Y(n457) );
  OAI21X1 U471 ( .A(n458), .B(n459), .C(n456), .Y(hresp) );
  NAND2X1 U472 ( .A(haddr[2]), .B(haddr[1]), .Y(n459) );
  INVX1 U473 ( .A(haddr[3]), .Y(n458) );
  NAND2X1 U474 ( .A(n460), .B(hwrite), .Y(n456) );
  MUX2X1 U475 ( .B(n461), .A(n462), .S(haddr[3]), .Y(n460) );
  NAND3X1 U476 ( .A(n463), .B(n461), .C(n455), .Y(n462) );
  INVX1 U477 ( .A(haddr[1]), .Y(n463) );
  INVX1 U478 ( .A(haddr[2]), .Y(n461) );
  INVX1 U479 ( .A(haddr[0]), .Y(n455) );
  OAI21X1 U480 ( .A(n398), .B(n91), .C(n465), .Y(hrdata[9]) );
  AOI22X1 U481 ( .A(N779), .B(n466), .C(N846), .D(n467), .Y(n465) );
  INVX1 U482 ( .A(\mem[1][1] ), .Y(n398) );
  OAI21X1 U483 ( .A(n395), .B(n91), .C(n468), .Y(hrdata[8]) );
  AOI22X1 U484 ( .A(N780), .B(n466), .C(N847), .D(n467), .Y(n468) );
  INVX1 U485 ( .A(\mem[1][0] ), .Y(n395) );
  OAI21X1 U486 ( .A(n393), .B(n91), .C(n469), .Y(hrdata[7]) );
  AOI22X1 U487 ( .A(N840), .B(n470), .C(N773), .D(n467), .Y(n469) );
  INVX1 U488 ( .A(\mem[0][7] ), .Y(n393) );
  OAI21X1 U489 ( .A(n392), .B(n91), .C(n471), .Y(hrdata[6]) );
  AOI22X1 U490 ( .A(N841), .B(n470), .C(N774), .D(n467), .Y(n471) );
  INVX1 U491 ( .A(\mem[0][6] ), .Y(n392) );
  OAI21X1 U492 ( .A(n391), .B(n91), .C(n472), .Y(hrdata[5]) );
  AOI22X1 U493 ( .A(N842), .B(n470), .C(N775), .D(n467), .Y(n472) );
  INVX1 U494 ( .A(\mem[0][5] ), .Y(n391) );
  OAI21X1 U495 ( .A(n390), .B(n464), .C(n473), .Y(hrdata[4]) );
  AOI22X1 U496 ( .A(N843), .B(n470), .C(N776), .D(n467), .Y(n473) );
  INVX1 U497 ( .A(\mem[0][4] ), .Y(n390) );
  OAI21X1 U498 ( .A(n389), .B(n464), .C(n474), .Y(hrdata[3]) );
  AOI22X1 U499 ( .A(N844), .B(n470), .C(N777), .D(n467), .Y(n474) );
  INVX1 U500 ( .A(\mem[0][3] ), .Y(n389) );
  NOR2X1 U501 ( .A(n449), .B(n91), .Y(hrdata[31]) );
  INVX1 U502 ( .A(\mem[3][7] ), .Y(n449) );
  NOR2X1 U503 ( .A(n447), .B(n91), .Y(hrdata[30]) );
  INVX1 U504 ( .A(\mem[3][6] ), .Y(n447) );
  OAI21X1 U505 ( .A(n388), .B(n464), .C(n475), .Y(hrdata[2]) );
  AOI22X1 U506 ( .A(N845), .B(n470), .C(N778), .D(n467), .Y(n475) );
  INVX1 U507 ( .A(\mem[0][2] ), .Y(n388) );
  NOR2X1 U508 ( .A(n445), .B(n91), .Y(hrdata[29]) );
  INVX1 U509 ( .A(\mem[3][5] ), .Y(n445) );
  NOR2X1 U510 ( .A(n443), .B(n91), .Y(hrdata[28]) );
  INVX1 U511 ( .A(\mem[3][4] ), .Y(n443) );
  NOR2X1 U512 ( .A(n441), .B(n91), .Y(hrdata[27]) );
  INVX1 U513 ( .A(\mem[3][3] ), .Y(n441) );
  NOR2X1 U514 ( .A(n439), .B(n91), .Y(hrdata[26]) );
  INVX1 U515 ( .A(\mem[3][2] ), .Y(n439) );
  NOR2X1 U516 ( .A(n437), .B(n91), .Y(hrdata[25]) );
  INVX1 U517 ( .A(\mem[3][1] ), .Y(n437) );
  NOR2X1 U518 ( .A(n435), .B(n91), .Y(hrdata[24]) );
  INVX1 U519 ( .A(\mem[3][0] ), .Y(n435) );
  NOR2X1 U520 ( .A(n433), .B(n91), .Y(hrdata[23]) );
  INVX1 U521 ( .A(\mem[2][7] ), .Y(n433) );
  NOR2X1 U522 ( .A(n431), .B(n91), .Y(hrdata[22]) );
  INVX1 U523 ( .A(\mem[2][6] ), .Y(n431) );
  NOR2X1 U524 ( .A(n429), .B(n91), .Y(hrdata[21]) );
  INVX1 U525 ( .A(\mem[2][5] ), .Y(n429) );
  NOR2X1 U526 ( .A(n427), .B(n91), .Y(hrdata[20]) );
  INVX1 U527 ( .A(\mem[2][4] ), .Y(n427) );
  OAI21X1 U528 ( .A(n387), .B(n464), .C(n476), .Y(hrdata[1]) );
  AOI22X1 U529 ( .A(n470), .B(N846), .C(n467), .D(N779), .Y(n476) );
  INVX1 U530 ( .A(\mem[0][1] ), .Y(n387) );
  NOR2X1 U531 ( .A(n425), .B(n91), .Y(hrdata[19]) );
  INVX1 U532 ( .A(\mem[2][3] ), .Y(n425) );
  NOR2X1 U533 ( .A(n423), .B(n91), .Y(hrdata[18]) );
  INVX1 U534 ( .A(\mem[2][2] ), .Y(n423) );
  NOR2X1 U535 ( .A(n421), .B(n91), .Y(hrdata[17]) );
  INVX1 U536 ( .A(\mem[2][1] ), .Y(n421) );
  NOR2X1 U537 ( .A(n419), .B(n91), .Y(hrdata[16]) );
  INVX1 U538 ( .A(\mem[2][0] ), .Y(n419) );
  OAI21X1 U539 ( .A(n410), .B(n464), .C(n477), .Y(hrdata[15]) );
  AOI22X1 U540 ( .A(N773), .B(n466), .C(N840), .D(n467), .Y(n477) );
  INVX1 U541 ( .A(\mem[1][7] ), .Y(n410) );
  OAI21X1 U542 ( .A(n408), .B(n464), .C(n478), .Y(hrdata[14]) );
  AOI22X1 U543 ( .A(N774), .B(n466), .C(N841), .D(n467), .Y(n478) );
  INVX1 U544 ( .A(\mem[1][6] ), .Y(n408) );
  OAI21X1 U545 ( .A(n406), .B(n464), .C(n479), .Y(hrdata[13]) );
  AOI22X1 U546 ( .A(N775), .B(n466), .C(N842), .D(n467), .Y(n479) );
  INVX1 U547 ( .A(\mem[1][5] ), .Y(n406) );
  OAI21X1 U548 ( .A(n404), .B(n464), .C(n480), .Y(hrdata[12]) );
  AOI22X1 U549 ( .A(N776), .B(n466), .C(N843), .D(n467), .Y(n480) );
  INVX1 U550 ( .A(\mem[1][4] ), .Y(n404) );
  OAI21X1 U551 ( .A(n402), .B(n464), .C(n481), .Y(hrdata[11]) );
  AOI22X1 U552 ( .A(N777), .B(n466), .C(N844), .D(n467), .Y(n481) );
  INVX1 U553 ( .A(\mem[1][3] ), .Y(n402) );
  OAI21X1 U554 ( .A(n400), .B(n464), .C(n482), .Y(hrdata[10]) );
  AOI22X1 U555 ( .A(N778), .B(n466), .C(N845), .D(n467), .Y(n482) );
  NOR2X1 U556 ( .A(n483), .B(n484), .Y(n466) );
  INVX1 U557 ( .A(\mem[1][2] ), .Y(n400) );
  OAI21X1 U558 ( .A(n385), .B(n464), .C(n485), .Y(hrdata[0]) );
  AOI22X1 U559 ( .A(n470), .B(N847), .C(N780), .D(n467), .Y(n485) );
  NAND3X1 U560 ( .A(n487), .B(N757), .C(n488), .Y(n486) );
  NOR2X1 U561 ( .A(N758), .B(n497), .Y(n488) );
  AND2X1 U562 ( .A(n487), .B(n489), .Y(n470) );
  OAI21X1 U563 ( .A(n375), .B(n490), .C(n484), .Y(n489) );
  NAND3X1 U564 ( .A(n375), .B(n497), .C(N757), .Y(n484) );
  OAI21X1 U565 ( .A(N757), .B(n497), .C(n175), .Y(n490) );
  INVX1 U566 ( .A(\prev_haddr[0] ), .Y(n497) );
  NAND3X1 U567 ( .A(n269), .B(n375), .C(n487), .Y(n464) );
  INVX1 U568 ( .A(n483), .Y(n487) );
  OAI21X1 U569 ( .A(n491), .B(n492), .C(hsel), .Y(n483) );
  NAND2X1 U570 ( .A(prev_hwrite), .B(n453), .Y(n492) );
  INVX1 U571 ( .A(prev_htrans[0]), .Y(n453) );
  INVX1 U572 ( .A(prev_htrans[1]), .Y(n491) );
  INVX1 U573 ( .A(N758), .Y(n375) );
  INVX1 U574 ( .A(\mem[0][0] ), .Y(n385) );
  NOR2X1 U575 ( .A(n493), .B(n494), .Y(clear) );
  NAND3X1 U576 ( .A(\mem[13][0] ), .B(n351), .C(n495), .Y(n494) );
  NOR2X1 U577 ( .A(\mem[13][3] ), .B(\mem[13][2] ), .Y(n495) );
  INVX1 U578 ( .A(\mem[13][1] ), .Y(n351) );
  NAND3X1 U579 ( .A(n345), .B(n343), .C(n496), .Y(n493) );
  NOR2X1 U580 ( .A(\mem[13][7] ), .B(\mem[13][6] ), .Y(n496) );
  INVX1 U581 ( .A(\mem[13][5] ), .Y(n343) );
  INVX1 U582 ( .A(\mem[13][4] ), .Y(n345) );
endmodule


module flex_counter ( clk, n_rst, clear, count_enable, rollover_val, count_out, 
        rollover_flag );
  input [3:0] rollover_val;
  output [3:0] count_out;
  input clk, n_rst, clear, count_enable;
  output rollover_flag;
  wire   n35, n36, n37, n38, n39, n1, n2, n3, n4, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32;

  DFFSR \count_out_reg[0]  ( .D(n39), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[0]) );
  DFFSR rollover_flag_reg ( .D(n35), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        rollover_flag) );
  DFFSR \count_out_reg[1]  ( .D(n38), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[1]) );
  DFFSR \count_out_reg[2]  ( .D(n37), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[2]) );
  DFFSR \count_out_reg[3]  ( .D(n36), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        count_out[3]) );
  MUX2X1 U8 ( .B(n1), .A(n2), .S(n3), .Y(n39) );
  OAI21X1 U9 ( .A(n4), .B(n3), .C(n10), .Y(n38) );
  XNOR2X1 U10 ( .A(n2), .B(n11), .Y(n10) );
  OAI21X1 U11 ( .A(n12), .B(n3), .C(n13), .Y(n37) );
  XNOR2X1 U12 ( .A(n14), .B(n15), .Y(n13) );
  OAI21X1 U13 ( .A(n16), .B(n3), .C(n17), .Y(n36) );
  AOI22X1 U14 ( .A(n18), .B(count_out[3]), .C(n14), .D(n15), .Y(n17) );
  NOR2X1 U15 ( .A(n19), .B(n12), .Y(n15) );
  AND2X1 U16 ( .A(n2), .B(n11), .Y(n14) );
  NOR2X1 U17 ( .A(n19), .B(n4), .Y(n11) );
  NOR2X1 U18 ( .A(n1), .B(n19), .Y(n2) );
  INVX1 U19 ( .A(n19), .Y(n18) );
  NAND3X1 U20 ( .A(n20), .B(n21), .C(count_enable), .Y(n19) );
  INVX1 U21 ( .A(n22), .Y(n20) );
  MUX2X1 U22 ( .B(n23), .A(n24), .S(n3), .Y(n35) );
  OR2X1 U23 ( .A(count_enable), .B(clear), .Y(n3) );
  NAND2X1 U24 ( .A(n22), .B(n21), .Y(n24) );
  INVX1 U25 ( .A(clear), .Y(n21) );
  OAI21X1 U26 ( .A(rollover_val[3]), .B(n16), .C(n25), .Y(n22) );
  OAI21X1 U27 ( .A(count_out[3]), .B(n26), .C(n27), .Y(n25) );
  OAI21X1 U28 ( .A(rollover_val[2]), .B(n12), .C(n28), .Y(n27) );
  OAI21X1 U29 ( .A(count_out[2]), .B(n29), .C(n30), .Y(n28) );
  AOI22X1 U30 ( .A(n31), .B(rollover_val[0]), .C(rollover_val[1]), .D(n4), .Y(
        n30) );
  INVX1 U31 ( .A(n32), .Y(n31) );
  OAI21X1 U32 ( .A(n4), .B(rollover_val[1]), .C(n1), .Y(n32) );
  INVX1 U33 ( .A(count_out[0]), .Y(n1) );
  INVX1 U34 ( .A(count_out[1]), .Y(n4) );
  INVX1 U35 ( .A(rollover_val[2]), .Y(n29) );
  INVX1 U36 ( .A(count_out[2]), .Y(n12) );
  INVX1 U37 ( .A(rollover_val[3]), .Y(n26) );
  INVX1 U38 ( .A(count_out[3]), .Y(n16) );
  INVX1 U39 ( .A(rollover_flag), .Y(n23) );
endmodule


module flex_pts_sr_NUM_BITS8_SHIFT_MSB0 ( clk, n_rst, shift_enable, 
        load_enable, parallel_in, serial_out );
  input [7:0] parallel_in;
  input clk, n_rst, shift_enable, load_enable;
  output serial_out;
  wire   n28, n2, n3, n4, n5;

  DFFSR \loaded_reg[0]  ( .D(n28), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        serial_out) );
  MUX2X1 U4 ( .B(n4), .A(n5), .S(n3), .Y(n28) );
  NOR2X1 U5 ( .A(load_enable), .B(shift_enable), .Y(n3) );
  INVX1 U6 ( .A(serial_out), .Y(n5) );
  NOR2X1 U7 ( .A(parallel_in[0]), .B(n2), .Y(n4) );
  INVX1 U8 ( .A(load_enable), .Y(n2) );
endmodule


module encoder ( clk, n_rst, begin_packet, tx_packet, tx_packet_data, 
        rollover_flag, buffer_occupancy, end_packet, shift_data, is_eop );
  input [2:0] tx_packet;
  input [7:0] tx_packet_data;
  input [6:0] buffer_occupancy;
  output [7:0] shift_data;
  input clk, n_rst, begin_packet, rollover_flag;
  output end_packet, is_eop;
  wire   n63, n64, n65, n1, n2, n3, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29,
         n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43,
         n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57,
         n58, n59, n60, n61, n62, n66, n67, n68;
  wire   [2:0] state;
  assign is_eop = 1'b1;

  DFFSR \state_reg[0]  ( .D(n65), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n64), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(n63), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  OAI21X1 U4 ( .A(n1), .B(n2), .C(n3), .Y(shift_data[7]) );
  AOI21X1 U7 ( .A(state[0]), .B(n7), .C(n8), .Y(n3) );
  OAI21X1 U8 ( .A(state[2]), .B(n9), .C(state[1]), .Y(n7) );
  INVX1 U9 ( .A(tx_packet_data[7]), .Y(n9) );
  OAI21X1 U10 ( .A(n10), .B(n11), .C(n12), .Y(shift_data[6]) );
  AOI21X1 U11 ( .A(n13), .B(n14), .C(n8), .Y(n12) );
  INVX1 U12 ( .A(tx_packet_data[6]), .Y(n11) );
  OAI21X1 U13 ( .A(n10), .B(n15), .C(n16), .Y(shift_data[5]) );
  INVX1 U14 ( .A(tx_packet_data[5]), .Y(n15) );
  NAND2X1 U15 ( .A(n17), .B(n18), .Y(shift_data[4]) );
  MUX2X1 U16 ( .B(n13), .A(n19), .S(n20), .Y(n18) );
  NOR2X1 U17 ( .A(n21), .B(n22), .Y(n19) );
  NAND2X1 U18 ( .A(n23), .B(n24), .Y(n22) );
  AOI21X1 U19 ( .A(tx_packet_data[4]), .B(n25), .C(n8), .Y(n17) );
  NAND3X1 U20 ( .A(n26), .B(n16), .C(n27), .Y(shift_data[3]) );
  AOI22X1 U21 ( .A(n28), .B(n13), .C(tx_packet_data[3]), .D(n25), .Y(n27) );
  NOR2X1 U22 ( .A(n20), .B(n24), .Y(n28) );
  NAND3X1 U23 ( .A(n26), .B(n16), .C(n29), .Y(shift_data[2]) );
  NAND2X1 U24 ( .A(tx_packet_data[2]), .B(n25), .Y(n29) );
  INVX1 U25 ( .A(n30), .Y(shift_data[1]) );
  AOI21X1 U26 ( .A(n25), .B(tx_packet_data[1]), .C(n31), .Y(n30) );
  OAI21X1 U27 ( .A(n2), .B(n32), .C(n26), .Y(n31) );
  NAND3X1 U28 ( .A(tx_packet[2]), .B(n23), .C(n32), .Y(n26) );
  INVX1 U29 ( .A(n14), .Y(n32) );
  NAND2X1 U30 ( .A(n1), .B(n24), .Y(n14) );
  INVX1 U31 ( .A(tx_packet[0]), .Y(n24) );
  XNOR2X1 U32 ( .A(tx_packet[0]), .B(tx_packet[1]), .Y(n1) );
  INVX1 U33 ( .A(n13), .Y(n2) );
  NOR2X1 U34 ( .A(n33), .B(tx_packet[2]), .Y(n13) );
  OAI21X1 U35 ( .A(n10), .B(n34), .C(n35), .Y(shift_data[0]) );
  INVX1 U36 ( .A(tx_packet_data[0]), .Y(n34) );
  OAI21X1 U37 ( .A(n36), .B(n37), .C(n38), .Y(n65) );
  NAND2X1 U38 ( .A(n39), .B(n40), .Y(n38) );
  OAI21X1 U39 ( .A(state[1]), .B(state[0]), .C(n41), .Y(n39) );
  INVX1 U40 ( .A(n42), .Y(n41) );
  OAI21X1 U41 ( .A(n36), .B(n43), .C(n44), .Y(n64) );
  OAI21X1 U42 ( .A(n45), .B(n42), .C(n40), .Y(n44) );
  OAI22X1 U43 ( .A(n46), .B(n10), .C(n47), .D(n35), .Y(n42) );
  INVX1 U44 ( .A(n48), .Y(n36) );
  NAND3X1 U45 ( .A(n35), .B(n40), .C(n49), .Y(n48) );
  AOI21X1 U46 ( .A(n25), .B(n47), .C(n50), .Y(n49) );
  INVX1 U47 ( .A(n10), .Y(n25) );
  NAND3X1 U48 ( .A(n43), .B(n51), .C(n52), .Y(n40) );
  MUX2X1 U49 ( .B(rollover_flag), .A(begin_packet), .S(n37), .Y(n52) );
  NAND2X1 U50 ( .A(n53), .B(n23), .Y(n35) );
  OAI21X1 U51 ( .A(n53), .B(n33), .C(n54), .Y(n63) );
  AOI22X1 U52 ( .A(n55), .B(n46), .C(n50), .D(state[2]), .Y(n54) );
  INVX1 U53 ( .A(n56), .Y(n50) );
  NAND3X1 U54 ( .A(n57), .B(n10), .C(n58), .Y(n56) );
  NOR2X1 U55 ( .A(n45), .B(n23), .Y(n58) );
  INVX1 U56 ( .A(n33), .Y(n23) );
  INVX1 U57 ( .A(n59), .Y(n45) );
  NAND3X1 U58 ( .A(n43), .B(n51), .C(state[0]), .Y(n59) );
  INVX1 U59 ( .A(state[1]), .Y(n43) );
  INVX1 U60 ( .A(end_packet), .Y(n57) );
  NOR2X1 U61 ( .A(n16), .B(n37), .Y(end_packet) );
  INVX1 U62 ( .A(n8), .Y(n16) );
  NOR2X1 U63 ( .A(n51), .B(state[1]), .Y(n8) );
  INVX1 U64 ( .A(n60), .Y(n46) );
  NAND3X1 U65 ( .A(n61), .B(n62), .C(n66), .Y(n60) );
  NOR2X1 U66 ( .A(buffer_occupancy[0]), .B(n67), .Y(n66) );
  OR2X1 U67 ( .A(buffer_occupancy[2]), .B(buffer_occupancy[1]), .Y(n67) );
  NOR2X1 U68 ( .A(buffer_occupancy[6]), .B(buffer_occupancy[5]), .Y(n62) );
  NOR2X1 U69 ( .A(buffer_occupancy[4]), .B(buffer_occupancy[3]), .Y(n61) );
  NOR2X1 U70 ( .A(n10), .B(n47), .Y(n55) );
  INVX1 U71 ( .A(rollover_flag), .Y(n47) );
  NAND3X1 U72 ( .A(state[1]), .B(n51), .C(state[0]), .Y(n10) );
  NAND3X1 U73 ( .A(n37), .B(n51), .C(state[1]), .Y(n33) );
  INVX1 U74 ( .A(state[2]), .Y(n51) );
  INVX1 U75 ( .A(state[0]), .Y(n37) );
  INVX1 U76 ( .A(n68), .Y(n53) );
  NAND3X1 U77 ( .A(n20), .B(n21), .C(tx_packet[0]), .Y(n68) );
  INVX1 U78 ( .A(tx_packet[2]), .Y(n21) );
  INVX1 U79 ( .A(tx_packet[1]), .Y(n20) );
endmodule


module control_logic ( clk, n_rst, tx_packet, end_packet, buffer_occupancy, 
        tx_transfer_active, get_tx_packet_data, begin_packet, tx_error );
  input [2:0] tx_packet;
  input [6:0] buffer_occupancy;
  input clk, n_rst, end_packet;
  output tx_transfer_active, get_tx_packet_data, begin_packet, tx_error;
  wire   n28, get_tx_packet_data, n1, n2, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21;
  wire   [1:0] state;
  wire   [1:0] prev_tx_packet;
  assign begin_packet = get_tx_packet_data;

  DFFSR \prev_tx_packet_reg[1]  ( .D(tx_packet[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(prev_tx_packet[1]) );
  DFFSR \prev_tx_packet_reg[0]  ( .D(tx_packet[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(prev_tx_packet[0]) );
  DFFSR \state_reg[0]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(tx_transfer_active), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  AOI21X1 U7 ( .A(n1), .B(n2), .C(n7), .Y(tx_error) );
  OAI21X1 U8 ( .A(tx_packet[0]), .B(n8), .C(n9), .Y(n7) );
  NAND3X1 U9 ( .A(n10), .B(n11), .C(n12), .Y(n9) );
  XNOR2X1 U10 ( .A(tx_packet[1]), .B(prev_tx_packet[1]), .Y(n12) );
  INVX1 U11 ( .A(tx_packet[2]), .Y(n11) );
  XNOR2X1 U12 ( .A(tx_packet[0]), .B(prev_tx_packet[0]), .Y(n10) );
  INVX1 U13 ( .A(tx_transfer_active), .Y(n2) );
  NAND3X1 U14 ( .A(n13), .B(n14), .C(n15), .Y(n1) );
  AND2X1 U15 ( .A(n16), .B(n17), .Y(n15) );
  NOR2X1 U16 ( .A(buffer_occupancy[6]), .B(buffer_occupancy[5]), .Y(n17) );
  NOR2X1 U17 ( .A(buffer_occupancy[4]), .B(buffer_occupancy[3]), .Y(n16) );
  NOR2X1 U18 ( .A(buffer_occupancy[2]), .B(buffer_occupancy[1]), .Y(n14) );
  NOR2X1 U19 ( .A(buffer_occupancy[0]), .B(n8), .Y(n13) );
  OAI21X1 U20 ( .A(state[0]), .B(n18), .C(n19), .Y(tx_transfer_active) );
  NOR2X1 U21 ( .A(state[0]), .B(n20), .Y(n28) );
  MUX2X1 U22 ( .B(n21), .A(end_packet), .S(state[1]), .Y(n20) );
  OR2X1 U23 ( .A(n8), .B(tx_packet[0]), .Y(n21) );
  OR2X1 U24 ( .A(tx_packet[1]), .B(tx_packet[2]), .Y(n8) );
  INVX1 U25 ( .A(n19), .Y(get_tx_packet_data) );
  NAND2X1 U26 ( .A(state[0]), .B(n18), .Y(n19) );
  INVX1 U27 ( .A(state[1]), .Y(n18) );
endmodule


module tx ( clk, n_rst, tx_packet_data, tx_packet, buffer_occupancy, 
        get_tx_packet_data, tx_transfer_active, tx_error, dplus_out, 
        dminus_out );
  input [7:0] tx_packet_data;
  input [2:0] tx_packet;
  input [6:0] buffer_occupancy;
  input clk, n_rst;
  output get_tx_packet_data, tx_transfer_active, tx_error, dplus_out,
         dminus_out;
  wire   end_packet, rollover_flag, serial_out, prev_dplus, begin_packet, n2;
  wire   [7:0] shift_data;

  DFFSR prev_dplus_reg ( .D(dplus_out), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        prev_dplus) );
  flex_counter counter ( .clk(clk), .n_rst(n_rst), .clear(end_packet), 
        .count_enable(tx_transfer_active), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0}), .rollover_flag(rollover_flag) );
  flex_pts_sr_NUM_BITS8_SHIFT_MSB0 CORE ( .clk(clk), .n_rst(n_rst), 
        .shift_enable(tx_transfer_active), .load_enable(rollover_flag), 
        .parallel_in(shift_data), .serial_out(serial_out) );
  encoder ENC ( .clk(clk), .n_rst(n_rst), .begin_packet(begin_packet), 
        .tx_packet(tx_packet), .tx_packet_data(tx_packet_data), 
        .rollover_flag(rollover_flag), .buffer_occupancy(buffer_occupancy), 
        .end_packet(end_packet), .shift_data(shift_data) );
  control_logic CL ( .clk(clk), .n_rst(n_rst), .tx_packet(tx_packet), 
        .end_packet(end_packet), .buffer_occupancy(buffer_occupancy), 
        .tx_transfer_active(tx_transfer_active), .get_tx_packet_data(
        get_tx_packet_data), .begin_packet(begin_packet), .tx_error(tx_error)
         );
  INVX1 U4 ( .A(dplus_out), .Y(dminus_out) );
  NAND2X1 U5 ( .A(n2), .B(tx_transfer_active), .Y(dplus_out) );
  XNOR2X1 U6 ( .A(serial_out), .B(prev_dplus), .Y(n2) );
endmodule


module data_buffer_DW01_incdec_0 ( A, INC_DEC, SUM );
  input [6:0] A;
  output [6:0] SUM;
  input INC_DEC;

  wire   [6:0] carry;

  FAX1 U1_6 ( .A(A[6]), .B(INC_DEC), .C(carry[6]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(INC_DEC), .C(carry[5]), .YC(carry[6]), .YS(SUM[5])
         );
  FAX1 U1_4 ( .A(A[4]), .B(INC_DEC), .C(carry[4]), .YC(carry[5]), .YS(SUM[4])
         );
  FAX1 U1_3 ( .A(A[3]), .B(INC_DEC), .C(carry[3]), .YC(carry[4]), .YS(SUM[3])
         );
  FAX1 U1_2 ( .A(A[2]), .B(INC_DEC), .C(carry[2]), .YC(carry[3]), .YS(SUM[2])
         );
  FAX1 U1_1 ( .A(A[1]), .B(INC_DEC), .C(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module data_buffer ( clk, n_rst, tx_data, store_tx_data, get_tx_packet_data, 
        clear, buffer_occupancy, tx_packet_data );
  input [7:0] tx_data;
  output [6:0] buffer_occupancy;
  output [7:0] tx_packet_data;
  input clk, n_rst, store_tx_data, get_tx_packet_data, clear;
  wire   N74, N75, N76, N77, N78, N79, N80, n1191, n1193, n1195, n1197, n1199,
         n1201, n1203, n1205, n1207, n1209, n1211, n1213, n1215, n1217, n1219,
         n1221, n1223, n1225, n1227, n1229, n1231, n1233, n1235, n1237, n1239,
         n1241, n1243, n1245, n1247, n1249, n1251, n1253, n1255, n1257, n1259,
         n1261, n1263, n1265, n1267, n1269, n1271, n1273, n1275, n1277, n1279,
         n1281, n1283, n1285, n1287, n1289, n1291, n1293, n1295, n1297, n1299,
         n1301, n1303, n1305, n1307, n1309, n1311, n1313, n1315, n1317, n1320,
         n1322, n1324, n1326, n1328, n1330, n1332, n1334, n1336, n1338, n1340,
         n1342, n1344, n1346, n1348, n1350, n1352, n1354, n1356, n1358, n1360,
         n1362, n1364, n1366, n1368, n1370, n1372, n1374, n1376, n1378, n1380,
         n1382, n1384, n1386, n1388, n1390, n1392, n1394, n1396, n1398, n1400,
         n1402, n1404, n1406, n1408, n1410, n1412, n1414, n1416, n1418, n1420,
         n1422, n1424, n1426, n1428, n1430, n1432, n1434, n1436, n1438, n1440,
         n1442, n1444, n1446, n1449, n1451, n1453, n1455, n1457, n1459, n1461,
         n1463, n1465, n1467, n1469, n1471, n1473, n1475, n1477, n1479, n1481,
         n1483, n1485, n1487, n1489, n1491, n1493, n1495, n1497, n1499, n1501,
         n1503, n1505, n1507, n1509, n1511, n1513, n1515, n1517, n1519, n1521,
         n1523, n1525, n1527, n1529, n1531, n1533, n1535, n1537, n1539, n1541,
         n1543, n1545, n1547, n1549, n1551, n1553, n1555, n1557, n1559, n1561,
         n1563, n1565, n1567, n1569, n1571, n1573, n1575, n1578, n1580, n1582,
         n1584, n1586, n1588, n1590, n1592, n1594, n1596, n1598, n1600, n1602,
         n1604, n1606, n1608, n1610, n1612, n1614, n1616, n1618, n1620, n1622,
         n1624, n1626, n1628, n1630, n1632, n1634, n1636, n1638, n1640, n1642,
         n1644, n1646, n1648, n1650, n1652, n1654, n1656, n1658, n1660, n1662,
         n1664, n1666, n1668, n1670, n1672, n1674, n1676, n1678, n1680, n1682,
         n1684, n1686, n1688, n1690, n1692, n1694, n1696, n1698, n1700, n1702,
         n1704, n1707, n1709, n1711, n1713, n1715, n1717, n1719, n1721, n1723,
         n1725, n1727, n1729, n1731, n1733, n1735, n1737, n1739, n1741, n1743,
         n1745, n1747, n1749, n1751, n1753, n1755, n1757, n1759, n1761, n1763,
         n1765, n1767, n1769, n1771, n1773, n1775, n1777, n1779, n1781, n1783,
         n1785, n1787, n1789, n1791, n1793, n1795, n1797, n1799, n1801, n1803,
         n1805, n1807, n1809, n1811, n1813, n1815, n1817, n1819, n1821, n1823,
         n1825, n1827, n1829, n1831, n1833, n1836, n1838, n1840, n1842, n1844,
         n1846, n1848, n1850, n1852, n1854, n1856, n1858, n1860, n1862, n1864,
         n1866, n1868, n1870, n1872, n1874, n1876, n1878, n1880, n1882, n1884,
         n1886, n1888, n1890, n1892, n1894, n1896, n1898, n1900, n1902, n1904,
         n1906, n1908, n1910, n1912, n1914, n1916, n1918, n1920, n1922, n1924,
         n1926, n1928, n1930, n1932, n1934, n1936, n1938, n1940, n1942, n1944,
         n1946, n1948, n1950, n1952, n1954, n1956, n1958, n1960, n1962, n1965,
         n1967, n1969, n1971, n1973, n1975, n1977, n1979, n1981, n1983, n1985,
         n1987, n1989, n1991, n1993, n1995, n1997, n1999, n2001, n2003, n2005,
         n2007, n2009, n2011, n2013, n2015, n2017, n2019, n2021, n2023, n2025,
         n2027, n2029, n2031, n2033, n2035, n2037, n2039, n2041, n2043, n2045,
         n2047, n2049, n2051, n2053, n2055, n2057, n2059, n2061, n2063, n2065,
         n2067, n2069, n2071, n2073, n2075, n2077, n2079, n2081, n2083, n2085,
         n2087, n2089, n2091, n2094, n2096, n2098, n2100, n2102, n2104, n2106,
         n2108, n2110, n2112, n2114, n2116, n2118, n2120, n2122, n2124, n2126,
         n2128, n2130, n2132, n2134, n2136, n2138, n2140, n2142, n2144, n2146,
         n2148, n2150, n2152, n2154, n2156, n2158, n2160, n2162, n2164, n2166,
         n2168, n2170, n2172, n2174, n2176, n2178, n2180, n2182, n2184, n2186,
         n2188, n2190, n2192, n2194, n2196, n2198, n2200, n2202, n2204, n2206,
         n2208, n2210, n2212, n2214, n2216, n2218, n2220, n2228, n2229, n2230,
         n2231, n2232, n2233, n2234, n2235, n1, n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n315, n316, n317, n318, n319, n320, n321, n322, n323, n324, n325,
         n326, n327, n328, n329, n330, n331, n332, n333, n334, n335, n336,
         n337, n338, n339, n340, n341, n342, n343, n344, n345, n346, n347,
         n348, n349, n350, n351, n352, n353, n354, n355, n356, n357, n358,
         n359, n360, n361, n362, n363, n364, n365, n366, n367, n368, n369,
         n370, n371, n372, n373, n374, n375, n376, n377, n378, n379, n380,
         n381, n382, n383, n384, n385, n386, n387, n388, n389, n390, n391,
         n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, n402,
         n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413,
         n414, n415, n416, n417, n418, n419, n420, n421, n422, n423, n424,
         n425, n426, n427, n428, n429, n430, n431, n432, n433, n434, n435,
         n436, n437, n438, n439, n440, n441, n442, n443, n444, n445, n446,
         n447, n448, n449, n450, n451, n452, n453, n454, n455, n456, n457,
         n458, n459, n460, n461, n462, n463, n464, n465, n466, n467, n468,
         n469, n470, n471, n472, n473, n474, n475, n476, n477, n478, n479,
         n480, n481, n482, n483, n484, n485, n486, n487, n488, n489, n490,
         n491, n492, n493, n494, n495, n496, n497, n498, n499, n500, n501,
         n502, n503, n504, n505, n506, n507, n508, n509, n510, n511, n512,
         n513, n514, n515, n516, n517, n518, n519, n520, n521, n522, n523,
         n524, n525, n526, n527, n528, n529, n530, n531, n532, n533, n534,
         n535, n536, n537, n538, n539, n540, n541, n542, n543, n544, n545,
         n546, n547, n548, n549, n550, n551, n552, n553, n554, n555, n556,
         n557, n558, n559, n560, n561, n562, n563, n564, n565, n566, n567,
         n568, n569, n570, n571, n572, n573, n574, n575, n576, n577, n578,
         n579, n580, n581, n582, n583, n584, n585, n586, n587, n588, n589,
         n590, n591, n592, n593, n594, n595, n596, n597, n598, n599, n600,
         n601, n602, n603, n604, n605, n606, n607, n608, n609, n610, n611,
         n612, n613, n614, n615, n616, n617, n618, n619, n620, n621, n622,
         n623, n624, n625, n626, n627, n628, n629, n630, n631, n632, n633,
         n634, n635, n636, n637, n638, n639, n640, n641, n642, n643, n644,
         n645, n646, n647, n648, n649, n650, n651, n652, n653, n654, n655,
         n656, n657, n658, n659, n660, n661, n662, n663, n664, n665, n666,
         n667, n668, n669, n670, n671, n672, n673, n674, n675, n676, n677,
         n678, n679, n680, n681, n682, n683, n684, n685, n686, n687, n688,
         n689, n690, n691, n692, n693, n694, n695, n696, n697, n698, n699,
         n700, n701, n702, n703, n704, n705, n706, n707, n708, n709, n710,
         n711, n712, n713, n714, n715, n716, n717, n718, n719, n720, n721,
         n722, n723, n724, n725, n726, n727, n728, n729, n730, n731, n732,
         n733, n734, n735, n736, n737, n738, n739, n740, n741, n742, n743,
         n744, n745, n746, n747, n748, n749, n750, n751, n752, n753, n754,
         n755, n756, n757, n758, n759, n760, n761, n762, n763, n764, n765,
         n766, n767, n768, n769, n770, n771, n772, n773, n774, n775, n776,
         n777, n778, n779, n780, n781, n782, n783, n784, n785, n786, n787,
         n788, n789, n790, n791, n792, n793, n794, n795, n796, n797, n798,
         n799, n800, n801, n802, n803, n804, n805, n806, n807, n808, n809,
         n810, n811, n812, n813, n814, n815, n816, n817, n818, n819, n820,
         n821, n822, n823, n824, n825, n826, n827, n828, n829, n830, n831,
         n832, n833, n834, n835, n836, n837, n838, n839, n840, n841, n842,
         n843, n844, n845, n846, n847, n848, n849, n850, n851, n852, n853,
         n854, n855, n856, n857, n858, n859, n860, n861, n862, n863, n864,
         n865, n866, n867, n868, n869, n870, n871, n872, n873, n874, n875,
         n876, n877, n878, n879, n880, n881, n882, n883, n884, n885, n886,
         n887, n888, n889, n890, n891, n892, n893, n894, n895, n896, n897,
         n898, n899, n900, n901, n902, n903, n904, n905, n906, n907, n908,
         n909, n910, n911, n912, n913, n914, n915, n916, n917, n918, n919,
         n920, n921, n922, n923, n924, n925, n926, n927, n928, n929, n930,
         n931, n932, n933, n934, n935, n936, n937, n938, n939, n940, n941,
         n942, n943, n944, n945, n946, n947, n948, n949, n950, n951, n952,
         n953, n954, n955, n956, n957, n958, n959, n960, n961, n962, n963,
         n964, n965, n966, n967, n968, n969, n970, n971, n972, n973, n974,
         n975, n976, n977, n978, n979, n980, n981, n982, n983, n984, n985,
         n986, n987, n988, n989, n990, n991, n992, n993, n994, n995, n996,
         n997, n998, n999, n1000, n1001, n1002, n1003, n1004, n1005, n1006,
         n1007, n1008, n1009, n1010, n1011, n1012, n1013, n1014, n1015, n1016,
         n1017, n1018, n1019, n1020, n1021, n1022, n1023, n1024, n1025, n1026,
         n1027, n1028, n1029, n1030, n1031, n1032, n1033, n1034, n1035, n1036,
         n1037, n1038, n1039, n1040, n1041, n1042, n1043, n1044, n1045, n1046,
         n1047, n1048, n1049, n1050, n1051, n1052, n1053, n1054, n1055, n1056,
         n1057, n1058, n1059, n1060, n1061, n1062, n1063, n1064, n1065, n1066,
         n1067, n1068, n1069, n1070, n1071, n1072, n1073, n1074, n1075, n1076,
         n1077, n1078, n1079, n1080, n1081, n1082, n1083, n1084, n1085, n1086,
         n1087, n1088, n1089, n1090, n1091, n1092, n1093, n1094, n1095, n1096,
         n1097, n1098, n1099, n1100, n1101, n1102, n1103, n1104, n1105, n1106,
         n1107, n1108, n1109, n1110, n1111, n1112, n1113, n1114, n1115, n1116,
         n1117, n1118, n1119, n1120, n1121, n1122, n1123, n1124, n1125, n1126,
         n1127, n1128, n1129, n1130, n1131, n1132, n1133, n1134, n1135, n1136,
         n1137, n1138, n1139, n1140, n1141, n1142, n1143, n1144, n1145, n1146,
         n1147, n1148, n1149, n1150, n1151, n1152, n1153, n1154, n1155, n1156,
         n1157, n1158, n1159, n1160, n1161, n1162, n1163, n1164, n1165, n1166,
         n1167, n1168, n1169, n1170, n1171, n1172, n1173, n1174, n1175, n1176,
         n1177, n1178, n1179, n1180, n1181, n1182, n1183, n1184, n1185, n1186,
         n1187, n1188, n2236, n2237, n2238, n2239, n2240, n2241, n2242, n2243,
         n2244, n2245, n2246, n2247, n2248, n2249, n2250, n2251, n2252, n2253,
         n2254, n2255, n2256, n2257, n2258, n2259, n2260, n2261, n2262, n2263,
         n2264, n2265, n2266, n2267, n2268, n2269, n2270, n2271, n2272, n2273,
         n2274, n2275;
  wire   [511:0] buffer;
  wire   [7:0] nxt_tx_packet_data;

  DFFSR \buffer_occupancy_reg[0]  ( .D(n2235), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(buffer_occupancy[0]) );
  DFFSR \buffer_occupancy_reg[6]  ( .D(n2234), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(buffer_occupancy[6]) );
  DFFSR \buffer_occupancy_reg[1]  ( .D(n2229), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(buffer_occupancy[1]) );
  DFFSR \buffer_occupancy_reg[2]  ( .D(n2230), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(buffer_occupancy[2]) );
  DFFSR \buffer_occupancy_reg[3]  ( .D(n2231), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(buffer_occupancy[3]) );
  DFFSR \buffer_occupancy_reg[4]  ( .D(n2232), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(buffer_occupancy[4]) );
  DFFSR \buffer_occupancy_reg[5]  ( .D(n2233), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(buffer_occupancy[5]) );
  DFFSR \buffer_reg[7]  ( .D(n2220), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[7]) );
  DFFSR \buffer_reg[15]  ( .D(n2218), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[15]) );
  DFFSR \buffer_reg[23]  ( .D(n2216), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[23]) );
  DFFSR \buffer_reg[31]  ( .D(n2214), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[31]) );
  DFFSR \buffer_reg[39]  ( .D(n2212), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[39]) );
  DFFSR \buffer_reg[47]  ( .D(n2210), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[47]) );
  DFFSR \buffer_reg[55]  ( .D(n2208), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[55]) );
  DFFSR \buffer_reg[63]  ( .D(n2206), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[63]) );
  DFFSR \buffer_reg[71]  ( .D(n2204), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[71]) );
  DFFSR \buffer_reg[79]  ( .D(n2202), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[79]) );
  DFFSR \buffer_reg[87]  ( .D(n2200), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[87]) );
  DFFSR \buffer_reg[95]  ( .D(n2198), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[95]) );
  DFFSR \buffer_reg[103]  ( .D(n2196), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[103]) );
  DFFSR \buffer_reg[111]  ( .D(n2194), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[111]) );
  DFFSR \buffer_reg[119]  ( .D(n2192), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[119]) );
  DFFSR \buffer_reg[127]  ( .D(n2190), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[127]) );
  DFFSR \buffer_reg[135]  ( .D(n2188), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[135]) );
  DFFSR \buffer_reg[143]  ( .D(n2186), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[143]) );
  DFFSR \buffer_reg[151]  ( .D(n2184), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[151]) );
  DFFSR \buffer_reg[159]  ( .D(n2182), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[159]) );
  DFFSR \buffer_reg[167]  ( .D(n2180), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[167]) );
  DFFSR \buffer_reg[175]  ( .D(n2178), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[175]) );
  DFFSR \buffer_reg[183]  ( .D(n2176), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[183]) );
  DFFSR \buffer_reg[191]  ( .D(n2174), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[191]) );
  DFFSR \buffer_reg[199]  ( .D(n2172), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[199]) );
  DFFSR \buffer_reg[207]  ( .D(n2170), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[207]) );
  DFFSR \buffer_reg[215]  ( .D(n2168), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[215]) );
  DFFSR \buffer_reg[223]  ( .D(n2166), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[223]) );
  DFFSR \buffer_reg[231]  ( .D(n2164), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[231]) );
  DFFSR \buffer_reg[239]  ( .D(n2162), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[239]) );
  DFFSR \buffer_reg[247]  ( .D(n2160), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[247]) );
  DFFSR \buffer_reg[255]  ( .D(n2158), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[255]) );
  DFFSR \buffer_reg[263]  ( .D(n2156), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[263]) );
  DFFSR \buffer_reg[271]  ( .D(n2154), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[271]) );
  DFFSR \buffer_reg[279]  ( .D(n2152), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[279]) );
  DFFSR \buffer_reg[287]  ( .D(n2150), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[287]) );
  DFFSR \buffer_reg[295]  ( .D(n2148), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[295]) );
  DFFSR \buffer_reg[303]  ( .D(n2146), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[303]) );
  DFFSR \buffer_reg[311]  ( .D(n2144), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[311]) );
  DFFSR \buffer_reg[319]  ( .D(n2142), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[319]) );
  DFFSR \buffer_reg[327]  ( .D(n2140), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[327]) );
  DFFSR \buffer_reg[335]  ( .D(n2138), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[335]) );
  DFFSR \buffer_reg[343]  ( .D(n2136), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[343]) );
  DFFSR \buffer_reg[351]  ( .D(n2134), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[351]) );
  DFFSR \buffer_reg[359]  ( .D(n2132), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[359]) );
  DFFSR \buffer_reg[367]  ( .D(n2130), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[367]) );
  DFFSR \buffer_reg[375]  ( .D(n2128), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[375]) );
  DFFSR \buffer_reg[383]  ( .D(n2126), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[383]) );
  DFFSR \buffer_reg[391]  ( .D(n2124), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[391]) );
  DFFSR \buffer_reg[399]  ( .D(n2122), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[399]) );
  DFFSR \buffer_reg[407]  ( .D(n2120), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[407]) );
  DFFSR \buffer_reg[415]  ( .D(n2118), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[415]) );
  DFFSR \buffer_reg[423]  ( .D(n2116), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[423]) );
  DFFSR \buffer_reg[431]  ( .D(n2114), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[431]) );
  DFFSR \buffer_reg[439]  ( .D(n2112), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[439]) );
  DFFSR \buffer_reg[447]  ( .D(n2110), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[447]) );
  DFFSR \buffer_reg[455]  ( .D(n2108), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[455]) );
  DFFSR \buffer_reg[463]  ( .D(n2106), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[463]) );
  DFFSR \buffer_reg[471]  ( .D(n2104), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[471]) );
  DFFSR \buffer_reg[479]  ( .D(n2102), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[479]) );
  DFFSR \buffer_reg[487]  ( .D(n2100), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[487]) );
  DFFSR \buffer_reg[495]  ( .D(n2098), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[495]) );
  DFFSR \buffer_reg[503]  ( .D(n2096), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[503]) );
  DFFSR \buffer_reg[511]  ( .D(n2094), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[511]) );
  DFFSR \tx_packet_data_reg[7]  ( .D(nxt_tx_packet_data[7]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(tx_packet_data[7]) );
  DFFSR \buffer_reg[6]  ( .D(n2091), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[6]) );
  DFFSR \buffer_reg[14]  ( .D(n2089), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[14]) );
  DFFSR \buffer_reg[22]  ( .D(n2087), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[22]) );
  DFFSR \buffer_reg[30]  ( .D(n2085), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[30]) );
  DFFSR \buffer_reg[38]  ( .D(n2083), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[38]) );
  DFFSR \buffer_reg[46]  ( .D(n2081), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[46]) );
  DFFSR \buffer_reg[54]  ( .D(n2079), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[54]) );
  DFFSR \buffer_reg[62]  ( .D(n2077), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[62]) );
  DFFSR \buffer_reg[70]  ( .D(n2075), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[70]) );
  DFFSR \buffer_reg[78]  ( .D(n2073), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[78]) );
  DFFSR \buffer_reg[86]  ( .D(n2071), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[86]) );
  DFFSR \buffer_reg[94]  ( .D(n2069), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[94]) );
  DFFSR \buffer_reg[102]  ( .D(n2067), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[102]) );
  DFFSR \buffer_reg[110]  ( .D(n2065), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[110]) );
  DFFSR \buffer_reg[118]  ( .D(n2063), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[118]) );
  DFFSR \buffer_reg[126]  ( .D(n2061), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[126]) );
  DFFSR \buffer_reg[134]  ( .D(n2059), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[134]) );
  DFFSR \buffer_reg[142]  ( .D(n2057), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[142]) );
  DFFSR \buffer_reg[150]  ( .D(n2055), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[150]) );
  DFFSR \buffer_reg[158]  ( .D(n2053), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[158]) );
  DFFSR \buffer_reg[166]  ( .D(n2051), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[166]) );
  DFFSR \buffer_reg[174]  ( .D(n2049), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[174]) );
  DFFSR \buffer_reg[182]  ( .D(n2047), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[182]) );
  DFFSR \buffer_reg[190]  ( .D(n2045), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[190]) );
  DFFSR \buffer_reg[198]  ( .D(n2043), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[198]) );
  DFFSR \buffer_reg[206]  ( .D(n2041), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[206]) );
  DFFSR \buffer_reg[214]  ( .D(n2039), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[214]) );
  DFFSR \buffer_reg[222]  ( .D(n2037), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[222]) );
  DFFSR \buffer_reg[230]  ( .D(n2035), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[230]) );
  DFFSR \buffer_reg[238]  ( .D(n2033), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[238]) );
  DFFSR \buffer_reg[246]  ( .D(n2031), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[246]) );
  DFFSR \buffer_reg[254]  ( .D(n2029), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[254]) );
  DFFSR \buffer_reg[262]  ( .D(n2027), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[262]) );
  DFFSR \buffer_reg[270]  ( .D(n2025), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[270]) );
  DFFSR \buffer_reg[278]  ( .D(n2023), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[278]) );
  DFFSR \buffer_reg[286]  ( .D(n2021), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[286]) );
  DFFSR \buffer_reg[294]  ( .D(n2019), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[294]) );
  DFFSR \buffer_reg[302]  ( .D(n2017), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[302]) );
  DFFSR \buffer_reg[310]  ( .D(n2015), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[310]) );
  DFFSR \buffer_reg[318]  ( .D(n2013), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[318]) );
  DFFSR \buffer_reg[326]  ( .D(n2011), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[326]) );
  DFFSR \buffer_reg[334]  ( .D(n2009), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[334]) );
  DFFSR \buffer_reg[342]  ( .D(n2007), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[342]) );
  DFFSR \buffer_reg[350]  ( .D(n2005), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[350]) );
  DFFSR \buffer_reg[358]  ( .D(n2003), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[358]) );
  DFFSR \buffer_reg[366]  ( .D(n2001), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[366]) );
  DFFSR \buffer_reg[374]  ( .D(n1999), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[374]) );
  DFFSR \buffer_reg[382]  ( .D(n1997), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[382]) );
  DFFSR \buffer_reg[390]  ( .D(n1995), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[390]) );
  DFFSR \buffer_reg[398]  ( .D(n1993), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[398]) );
  DFFSR \buffer_reg[406]  ( .D(n1991), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[406]) );
  DFFSR \buffer_reg[414]  ( .D(n1989), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[414]) );
  DFFSR \buffer_reg[422]  ( .D(n1987), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[422]) );
  DFFSR \buffer_reg[430]  ( .D(n1985), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[430]) );
  DFFSR \buffer_reg[438]  ( .D(n1983), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[438]) );
  DFFSR \buffer_reg[446]  ( .D(n1981), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[446]) );
  DFFSR \buffer_reg[454]  ( .D(n1979), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[454]) );
  DFFSR \buffer_reg[462]  ( .D(n1977), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[462]) );
  DFFSR \buffer_reg[470]  ( .D(n1975), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[470]) );
  DFFSR \buffer_reg[478]  ( .D(n1973), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[478]) );
  DFFSR \buffer_reg[486]  ( .D(n1971), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[486]) );
  DFFSR \buffer_reg[494]  ( .D(n1969), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[494]) );
  DFFSR \buffer_reg[502]  ( .D(n1967), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[502]) );
  DFFSR \buffer_reg[510]  ( .D(n1965), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[510]) );
  DFFSR \tx_packet_data_reg[6]  ( .D(nxt_tx_packet_data[6]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(tx_packet_data[6]) );
  DFFSR \buffer_reg[5]  ( .D(n1962), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[5]) );
  DFFSR \buffer_reg[13]  ( .D(n1960), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[13]) );
  DFFSR \buffer_reg[21]  ( .D(n1958), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[21]) );
  DFFSR \buffer_reg[29]  ( .D(n1956), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[29]) );
  DFFSR \buffer_reg[37]  ( .D(n1954), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[37]) );
  DFFSR \buffer_reg[45]  ( .D(n1952), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[45]) );
  DFFSR \buffer_reg[53]  ( .D(n1950), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[53]) );
  DFFSR \buffer_reg[61]  ( .D(n1948), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[61]) );
  DFFSR \buffer_reg[69]  ( .D(n1946), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[69]) );
  DFFSR \buffer_reg[77]  ( .D(n1944), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[77]) );
  DFFSR \buffer_reg[85]  ( .D(n1942), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[85]) );
  DFFSR \buffer_reg[93]  ( .D(n1940), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[93]) );
  DFFSR \buffer_reg[101]  ( .D(n1938), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[101]) );
  DFFSR \buffer_reg[109]  ( .D(n1936), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[109]) );
  DFFSR \buffer_reg[117]  ( .D(n1934), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[117]) );
  DFFSR \buffer_reg[125]  ( .D(n1932), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[125]) );
  DFFSR \buffer_reg[133]  ( .D(n1930), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[133]) );
  DFFSR \buffer_reg[141]  ( .D(n1928), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[141]) );
  DFFSR \buffer_reg[149]  ( .D(n1926), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[149]) );
  DFFSR \buffer_reg[157]  ( .D(n1924), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[157]) );
  DFFSR \buffer_reg[165]  ( .D(n1922), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[165]) );
  DFFSR \buffer_reg[173]  ( .D(n1920), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[173]) );
  DFFSR \buffer_reg[181]  ( .D(n1918), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[181]) );
  DFFSR \buffer_reg[189]  ( .D(n1916), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[189]) );
  DFFSR \buffer_reg[197]  ( .D(n1914), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[197]) );
  DFFSR \buffer_reg[205]  ( .D(n1912), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[205]) );
  DFFSR \buffer_reg[213]  ( .D(n1910), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[213]) );
  DFFSR \buffer_reg[221]  ( .D(n1908), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[221]) );
  DFFSR \buffer_reg[229]  ( .D(n1906), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[229]) );
  DFFSR \buffer_reg[237]  ( .D(n1904), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[237]) );
  DFFSR \buffer_reg[245]  ( .D(n1902), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[245]) );
  DFFSR \buffer_reg[253]  ( .D(n1900), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[253]) );
  DFFSR \buffer_reg[261]  ( .D(n1898), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[261]) );
  DFFSR \buffer_reg[269]  ( .D(n1896), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[269]) );
  DFFSR \buffer_reg[277]  ( .D(n1894), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[277]) );
  DFFSR \buffer_reg[285]  ( .D(n1892), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[285]) );
  DFFSR \buffer_reg[293]  ( .D(n1890), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[293]) );
  DFFSR \buffer_reg[301]  ( .D(n1888), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[301]) );
  DFFSR \buffer_reg[309]  ( .D(n1886), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[309]) );
  DFFSR \buffer_reg[317]  ( .D(n1884), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[317]) );
  DFFSR \buffer_reg[325]  ( .D(n1882), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[325]) );
  DFFSR \buffer_reg[333]  ( .D(n1880), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[333]) );
  DFFSR \buffer_reg[341]  ( .D(n1878), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[341]) );
  DFFSR \buffer_reg[349]  ( .D(n1876), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[349]) );
  DFFSR \buffer_reg[357]  ( .D(n1874), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[357]) );
  DFFSR \buffer_reg[365]  ( .D(n1872), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[365]) );
  DFFSR \buffer_reg[373]  ( .D(n1870), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[373]) );
  DFFSR \buffer_reg[381]  ( .D(n1868), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[381]) );
  DFFSR \buffer_reg[389]  ( .D(n1866), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[389]) );
  DFFSR \buffer_reg[397]  ( .D(n1864), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[397]) );
  DFFSR \buffer_reg[405]  ( .D(n1862), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[405]) );
  DFFSR \buffer_reg[413]  ( .D(n1860), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[413]) );
  DFFSR \buffer_reg[421]  ( .D(n1858), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[421]) );
  DFFSR \buffer_reg[429]  ( .D(n1856), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[429]) );
  DFFSR \buffer_reg[437]  ( .D(n1854), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[437]) );
  DFFSR \buffer_reg[445]  ( .D(n1852), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[445]) );
  DFFSR \buffer_reg[453]  ( .D(n1850), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[453]) );
  DFFSR \buffer_reg[461]  ( .D(n1848), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[461]) );
  DFFSR \buffer_reg[469]  ( .D(n1846), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[469]) );
  DFFSR \buffer_reg[477]  ( .D(n1844), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[477]) );
  DFFSR \buffer_reg[485]  ( .D(n1842), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[485]) );
  DFFSR \buffer_reg[493]  ( .D(n1840), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[493]) );
  DFFSR \buffer_reg[501]  ( .D(n1838), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[501]) );
  DFFSR \buffer_reg[509]  ( .D(n1836), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[509]) );
  DFFSR \tx_packet_data_reg[5]  ( .D(nxt_tx_packet_data[5]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(tx_packet_data[5]) );
  DFFSR \buffer_reg[4]  ( .D(n1833), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[4]) );
  DFFSR \buffer_reg[12]  ( .D(n1831), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[12]) );
  DFFSR \buffer_reg[20]  ( .D(n1829), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[20]) );
  DFFSR \buffer_reg[28]  ( .D(n1827), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[28]) );
  DFFSR \buffer_reg[36]  ( .D(n1825), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[36]) );
  DFFSR \buffer_reg[44]  ( .D(n1823), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[44]) );
  DFFSR \buffer_reg[52]  ( .D(n1821), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[52]) );
  DFFSR \buffer_reg[60]  ( .D(n1819), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[60]) );
  DFFSR \buffer_reg[68]  ( .D(n1817), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[68]) );
  DFFSR \buffer_reg[76]  ( .D(n1815), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[76]) );
  DFFSR \buffer_reg[84]  ( .D(n1813), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[84]) );
  DFFSR \buffer_reg[92]  ( .D(n1811), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[92]) );
  DFFSR \buffer_reg[100]  ( .D(n1809), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[100]) );
  DFFSR \buffer_reg[108]  ( .D(n1807), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[108]) );
  DFFSR \buffer_reg[116]  ( .D(n1805), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[116]) );
  DFFSR \buffer_reg[124]  ( .D(n1803), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[124]) );
  DFFSR \buffer_reg[132]  ( .D(n1801), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[132]) );
  DFFSR \buffer_reg[140]  ( .D(n1799), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[140]) );
  DFFSR \buffer_reg[148]  ( .D(n1797), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[148]) );
  DFFSR \buffer_reg[156]  ( .D(n1795), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[156]) );
  DFFSR \buffer_reg[164]  ( .D(n1793), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[164]) );
  DFFSR \buffer_reg[172]  ( .D(n1791), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[172]) );
  DFFSR \buffer_reg[180]  ( .D(n1789), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[180]) );
  DFFSR \buffer_reg[188]  ( .D(n1787), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[188]) );
  DFFSR \buffer_reg[196]  ( .D(n1785), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[196]) );
  DFFSR \buffer_reg[204]  ( .D(n1783), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[204]) );
  DFFSR \buffer_reg[212]  ( .D(n1781), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[212]) );
  DFFSR \buffer_reg[220]  ( .D(n1779), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[220]) );
  DFFSR \buffer_reg[228]  ( .D(n1777), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[228]) );
  DFFSR \buffer_reg[236]  ( .D(n1775), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[236]) );
  DFFSR \buffer_reg[244]  ( .D(n1773), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[244]) );
  DFFSR \buffer_reg[252]  ( .D(n1771), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[252]) );
  DFFSR \buffer_reg[260]  ( .D(n1769), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[260]) );
  DFFSR \buffer_reg[268]  ( .D(n1767), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[268]) );
  DFFSR \buffer_reg[276]  ( .D(n1765), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[276]) );
  DFFSR \buffer_reg[284]  ( .D(n1763), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[284]) );
  DFFSR \buffer_reg[292]  ( .D(n1761), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[292]) );
  DFFSR \buffer_reg[300]  ( .D(n1759), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[300]) );
  DFFSR \buffer_reg[308]  ( .D(n1757), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[308]) );
  DFFSR \buffer_reg[316]  ( .D(n1755), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[316]) );
  DFFSR \buffer_reg[324]  ( .D(n1753), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[324]) );
  DFFSR \buffer_reg[332]  ( .D(n1751), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[332]) );
  DFFSR \buffer_reg[340]  ( .D(n1749), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[340]) );
  DFFSR \buffer_reg[348]  ( .D(n1747), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[348]) );
  DFFSR \buffer_reg[356]  ( .D(n1745), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[356]) );
  DFFSR \buffer_reg[364]  ( .D(n1743), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[364]) );
  DFFSR \buffer_reg[372]  ( .D(n1741), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[372]) );
  DFFSR \buffer_reg[380]  ( .D(n1739), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[380]) );
  DFFSR \buffer_reg[388]  ( .D(n1737), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[388]) );
  DFFSR \buffer_reg[396]  ( .D(n1735), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[396]) );
  DFFSR \buffer_reg[404]  ( .D(n1733), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[404]) );
  DFFSR \buffer_reg[412]  ( .D(n1731), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[412]) );
  DFFSR \buffer_reg[420]  ( .D(n1729), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[420]) );
  DFFSR \buffer_reg[428]  ( .D(n1727), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[428]) );
  DFFSR \buffer_reg[436]  ( .D(n1725), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[436]) );
  DFFSR \buffer_reg[444]  ( .D(n1723), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[444]) );
  DFFSR \buffer_reg[452]  ( .D(n1721), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[452]) );
  DFFSR \buffer_reg[460]  ( .D(n1719), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[460]) );
  DFFSR \buffer_reg[468]  ( .D(n1717), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[468]) );
  DFFSR \buffer_reg[476]  ( .D(n1715), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[476]) );
  DFFSR \buffer_reg[484]  ( .D(n1713), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[484]) );
  DFFSR \buffer_reg[492]  ( .D(n1711), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[492]) );
  DFFSR \buffer_reg[500]  ( .D(n1709), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[500]) );
  DFFSR \buffer_reg[508]  ( .D(n1707), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[508]) );
  DFFSR \tx_packet_data_reg[4]  ( .D(nxt_tx_packet_data[4]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(tx_packet_data[4]) );
  DFFSR \buffer_reg[3]  ( .D(n1704), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[3]) );
  DFFSR \buffer_reg[11]  ( .D(n1702), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[11]) );
  DFFSR \buffer_reg[19]  ( .D(n1700), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[19]) );
  DFFSR \buffer_reg[27]  ( .D(n1698), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[27]) );
  DFFSR \buffer_reg[35]  ( .D(n1696), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[35]) );
  DFFSR \buffer_reg[43]  ( .D(n1694), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[43]) );
  DFFSR \buffer_reg[51]  ( .D(n1692), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[51]) );
  DFFSR \buffer_reg[59]  ( .D(n1690), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[59]) );
  DFFSR \buffer_reg[67]  ( .D(n1688), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[67]) );
  DFFSR \buffer_reg[75]  ( .D(n1686), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[75]) );
  DFFSR \buffer_reg[83]  ( .D(n1684), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[83]) );
  DFFSR \buffer_reg[91]  ( .D(n1682), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[91]) );
  DFFSR \buffer_reg[99]  ( .D(n1680), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[99]) );
  DFFSR \buffer_reg[107]  ( .D(n1678), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[107]) );
  DFFSR \buffer_reg[115]  ( .D(n1676), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[115]) );
  DFFSR \buffer_reg[123]  ( .D(n1674), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[123]) );
  DFFSR \buffer_reg[131]  ( .D(n1672), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[131]) );
  DFFSR \buffer_reg[139]  ( .D(n1670), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[139]) );
  DFFSR \buffer_reg[147]  ( .D(n1668), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[147]) );
  DFFSR \buffer_reg[155]  ( .D(n1666), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[155]) );
  DFFSR \buffer_reg[163]  ( .D(n1664), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[163]) );
  DFFSR \buffer_reg[171]  ( .D(n1662), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[171]) );
  DFFSR \buffer_reg[179]  ( .D(n1660), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[179]) );
  DFFSR \buffer_reg[187]  ( .D(n1658), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[187]) );
  DFFSR \buffer_reg[195]  ( .D(n1656), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[195]) );
  DFFSR \buffer_reg[203]  ( .D(n1654), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[203]) );
  DFFSR \buffer_reg[211]  ( .D(n1652), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[211]) );
  DFFSR \buffer_reg[219]  ( .D(n1650), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[219]) );
  DFFSR \buffer_reg[227]  ( .D(n1648), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[227]) );
  DFFSR \buffer_reg[235]  ( .D(n1646), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[235]) );
  DFFSR \buffer_reg[243]  ( .D(n1644), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[243]) );
  DFFSR \buffer_reg[251]  ( .D(n1642), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[251]) );
  DFFSR \buffer_reg[259]  ( .D(n1640), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[259]) );
  DFFSR \buffer_reg[267]  ( .D(n1638), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[267]) );
  DFFSR \buffer_reg[275]  ( .D(n1636), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[275]) );
  DFFSR \buffer_reg[283]  ( .D(n1634), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[283]) );
  DFFSR \buffer_reg[291]  ( .D(n1632), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[291]) );
  DFFSR \buffer_reg[299]  ( .D(n1630), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[299]) );
  DFFSR \buffer_reg[307]  ( .D(n1628), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[307]) );
  DFFSR \buffer_reg[315]  ( .D(n1626), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[315]) );
  DFFSR \buffer_reg[323]  ( .D(n1624), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[323]) );
  DFFSR \buffer_reg[331]  ( .D(n1622), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[331]) );
  DFFSR \buffer_reg[339]  ( .D(n1620), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[339]) );
  DFFSR \buffer_reg[347]  ( .D(n1618), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[347]) );
  DFFSR \buffer_reg[355]  ( .D(n1616), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[355]) );
  DFFSR \buffer_reg[363]  ( .D(n1614), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[363]) );
  DFFSR \buffer_reg[371]  ( .D(n1612), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[371]) );
  DFFSR \buffer_reg[379]  ( .D(n1610), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[379]) );
  DFFSR \buffer_reg[387]  ( .D(n1608), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[387]) );
  DFFSR \buffer_reg[395]  ( .D(n1606), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[395]) );
  DFFSR \buffer_reg[403]  ( .D(n1604), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[403]) );
  DFFSR \buffer_reg[411]  ( .D(n1602), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[411]) );
  DFFSR \buffer_reg[419]  ( .D(n1600), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[419]) );
  DFFSR \buffer_reg[427]  ( .D(n1598), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[427]) );
  DFFSR \buffer_reg[435]  ( .D(n1596), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[435]) );
  DFFSR \buffer_reg[443]  ( .D(n1594), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[443]) );
  DFFSR \buffer_reg[451]  ( .D(n1592), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[451]) );
  DFFSR \buffer_reg[459]  ( .D(n1590), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[459]) );
  DFFSR \buffer_reg[467]  ( .D(n1588), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[467]) );
  DFFSR \buffer_reg[475]  ( .D(n1586), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[475]) );
  DFFSR \buffer_reg[483]  ( .D(n1584), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[483]) );
  DFFSR \buffer_reg[491]  ( .D(n1582), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[491]) );
  DFFSR \buffer_reg[499]  ( .D(n1580), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[499]) );
  DFFSR \buffer_reg[507]  ( .D(n1578), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[507]) );
  DFFSR \tx_packet_data_reg[3]  ( .D(nxt_tx_packet_data[3]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(tx_packet_data[3]) );
  DFFSR \buffer_reg[2]  ( .D(n1575), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[2]) );
  DFFSR \buffer_reg[10]  ( .D(n1573), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[10]) );
  DFFSR \buffer_reg[18]  ( .D(n1571), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[18]) );
  DFFSR \buffer_reg[26]  ( .D(n1569), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[26]) );
  DFFSR \buffer_reg[34]  ( .D(n1567), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[34]) );
  DFFSR \buffer_reg[42]  ( .D(n1565), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[42]) );
  DFFSR \buffer_reg[50]  ( .D(n1563), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[50]) );
  DFFSR \buffer_reg[58]  ( .D(n1561), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[58]) );
  DFFSR \buffer_reg[66]  ( .D(n1559), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[66]) );
  DFFSR \buffer_reg[74]  ( .D(n1557), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[74]) );
  DFFSR \buffer_reg[82]  ( .D(n1555), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[82]) );
  DFFSR \buffer_reg[90]  ( .D(n1553), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[90]) );
  DFFSR \buffer_reg[98]  ( .D(n1551), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[98]) );
  DFFSR \buffer_reg[106]  ( .D(n1549), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[106]) );
  DFFSR \buffer_reg[114]  ( .D(n1547), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[114]) );
  DFFSR \buffer_reg[122]  ( .D(n1545), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[122]) );
  DFFSR \buffer_reg[130]  ( .D(n1543), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[130]) );
  DFFSR \buffer_reg[138]  ( .D(n1541), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[138]) );
  DFFSR \buffer_reg[146]  ( .D(n1539), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[146]) );
  DFFSR \buffer_reg[154]  ( .D(n1537), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[154]) );
  DFFSR \buffer_reg[162]  ( .D(n1535), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[162]) );
  DFFSR \buffer_reg[170]  ( .D(n1533), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[170]) );
  DFFSR \buffer_reg[178]  ( .D(n1531), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[178]) );
  DFFSR \buffer_reg[186]  ( .D(n1529), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[186]) );
  DFFSR \buffer_reg[194]  ( .D(n1527), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[194]) );
  DFFSR \buffer_reg[202]  ( .D(n1525), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[202]) );
  DFFSR \buffer_reg[210]  ( .D(n1523), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[210]) );
  DFFSR \buffer_reg[218]  ( .D(n1521), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[218]) );
  DFFSR \buffer_reg[226]  ( .D(n1519), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[226]) );
  DFFSR \buffer_reg[234]  ( .D(n1517), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[234]) );
  DFFSR \buffer_reg[242]  ( .D(n1515), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[242]) );
  DFFSR \buffer_reg[250]  ( .D(n1513), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[250]) );
  DFFSR \buffer_reg[258]  ( .D(n1511), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[258]) );
  DFFSR \buffer_reg[266]  ( .D(n1509), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[266]) );
  DFFSR \buffer_reg[274]  ( .D(n1507), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[274]) );
  DFFSR \buffer_reg[282]  ( .D(n1505), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[282]) );
  DFFSR \buffer_reg[290]  ( .D(n1503), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[290]) );
  DFFSR \buffer_reg[298]  ( .D(n1501), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[298]) );
  DFFSR \buffer_reg[306]  ( .D(n1499), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[306]) );
  DFFSR \buffer_reg[314]  ( .D(n1497), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[314]) );
  DFFSR \buffer_reg[322]  ( .D(n1495), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[322]) );
  DFFSR \buffer_reg[330]  ( .D(n1493), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[330]) );
  DFFSR \buffer_reg[338]  ( .D(n1491), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[338]) );
  DFFSR \buffer_reg[346]  ( .D(n1489), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[346]) );
  DFFSR \buffer_reg[354]  ( .D(n1487), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[354]) );
  DFFSR \buffer_reg[362]  ( .D(n1485), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[362]) );
  DFFSR \buffer_reg[370]  ( .D(n1483), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[370]) );
  DFFSR \buffer_reg[378]  ( .D(n1481), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[378]) );
  DFFSR \buffer_reg[386]  ( .D(n1479), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[386]) );
  DFFSR \buffer_reg[394]  ( .D(n1477), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[394]) );
  DFFSR \buffer_reg[402]  ( .D(n1475), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[402]) );
  DFFSR \buffer_reg[410]  ( .D(n1473), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[410]) );
  DFFSR \buffer_reg[418]  ( .D(n1471), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[418]) );
  DFFSR \buffer_reg[426]  ( .D(n1469), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[426]) );
  DFFSR \buffer_reg[434]  ( .D(n1467), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[434]) );
  DFFSR \buffer_reg[442]  ( .D(n1465), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[442]) );
  DFFSR \buffer_reg[450]  ( .D(n1463), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[450]) );
  DFFSR \buffer_reg[458]  ( .D(n1461), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[458]) );
  DFFSR \buffer_reg[466]  ( .D(n1459), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[466]) );
  DFFSR \buffer_reg[474]  ( .D(n1457), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[474]) );
  DFFSR \buffer_reg[482]  ( .D(n1455), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[482]) );
  DFFSR \buffer_reg[490]  ( .D(n1453), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[490]) );
  DFFSR \buffer_reg[498]  ( .D(n1451), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[498]) );
  DFFSR \buffer_reg[506]  ( .D(n1449), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[506]) );
  DFFSR \tx_packet_data_reg[2]  ( .D(nxt_tx_packet_data[2]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(tx_packet_data[2]) );
  DFFSR \buffer_reg[1]  ( .D(n1446), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[1]) );
  DFFSR \buffer_reg[9]  ( .D(n1444), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[9]) );
  DFFSR \buffer_reg[17]  ( .D(n1442), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[17]) );
  DFFSR \buffer_reg[25]  ( .D(n1440), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[25]) );
  DFFSR \buffer_reg[33]  ( .D(n1438), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[33]) );
  DFFSR \buffer_reg[41]  ( .D(n1436), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[41]) );
  DFFSR \buffer_reg[49]  ( .D(n1434), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[49]) );
  DFFSR \buffer_reg[57]  ( .D(n1432), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[57]) );
  DFFSR \buffer_reg[65]  ( .D(n1430), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[65]) );
  DFFSR \buffer_reg[73]  ( .D(n1428), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[73]) );
  DFFSR \buffer_reg[81]  ( .D(n1426), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[81]) );
  DFFSR \buffer_reg[89]  ( .D(n1424), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[89]) );
  DFFSR \buffer_reg[97]  ( .D(n1422), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[97]) );
  DFFSR \buffer_reg[105]  ( .D(n1420), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[105]) );
  DFFSR \buffer_reg[113]  ( .D(n1418), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[113]) );
  DFFSR \buffer_reg[121]  ( .D(n1416), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[121]) );
  DFFSR \buffer_reg[129]  ( .D(n1414), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[129]) );
  DFFSR \buffer_reg[137]  ( .D(n1412), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[137]) );
  DFFSR \buffer_reg[145]  ( .D(n1410), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[145]) );
  DFFSR \buffer_reg[153]  ( .D(n1408), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[153]) );
  DFFSR \buffer_reg[161]  ( .D(n1406), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[161]) );
  DFFSR \buffer_reg[169]  ( .D(n1404), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[169]) );
  DFFSR \buffer_reg[177]  ( .D(n1402), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[177]) );
  DFFSR \buffer_reg[185]  ( .D(n1400), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[185]) );
  DFFSR \buffer_reg[193]  ( .D(n1398), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[193]) );
  DFFSR \buffer_reg[201]  ( .D(n1396), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[201]) );
  DFFSR \buffer_reg[209]  ( .D(n1394), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[209]) );
  DFFSR \buffer_reg[217]  ( .D(n1392), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[217]) );
  DFFSR \buffer_reg[225]  ( .D(n1390), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[225]) );
  DFFSR \buffer_reg[233]  ( .D(n1388), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[233]) );
  DFFSR \buffer_reg[241]  ( .D(n1386), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[241]) );
  DFFSR \buffer_reg[249]  ( .D(n1384), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[249]) );
  DFFSR \buffer_reg[257]  ( .D(n1382), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[257]) );
  DFFSR \buffer_reg[265]  ( .D(n1380), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[265]) );
  DFFSR \buffer_reg[273]  ( .D(n1378), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[273]) );
  DFFSR \buffer_reg[281]  ( .D(n1376), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[281]) );
  DFFSR \buffer_reg[289]  ( .D(n1374), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[289]) );
  DFFSR \buffer_reg[297]  ( .D(n1372), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[297]) );
  DFFSR \buffer_reg[305]  ( .D(n1370), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[305]) );
  DFFSR \buffer_reg[313]  ( .D(n1368), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[313]) );
  DFFSR \buffer_reg[321]  ( .D(n1366), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[321]) );
  DFFSR \buffer_reg[329]  ( .D(n1364), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[329]) );
  DFFSR \buffer_reg[337]  ( .D(n1362), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[337]) );
  DFFSR \buffer_reg[345]  ( .D(n1360), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[345]) );
  DFFSR \buffer_reg[353]  ( .D(n1358), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[353]) );
  DFFSR \buffer_reg[361]  ( .D(n1356), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[361]) );
  DFFSR \buffer_reg[369]  ( .D(n1354), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[369]) );
  DFFSR \buffer_reg[377]  ( .D(n1352), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[377]) );
  DFFSR \buffer_reg[385]  ( .D(n1350), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[385]) );
  DFFSR \buffer_reg[393]  ( .D(n1348), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[393]) );
  DFFSR \buffer_reg[401]  ( .D(n1346), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[401]) );
  DFFSR \buffer_reg[409]  ( .D(n1344), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[409]) );
  DFFSR \buffer_reg[417]  ( .D(n1342), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[417]) );
  DFFSR \buffer_reg[425]  ( .D(n1340), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[425]) );
  DFFSR \buffer_reg[433]  ( .D(n1338), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[433]) );
  DFFSR \buffer_reg[441]  ( .D(n1336), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[441]) );
  DFFSR \buffer_reg[449]  ( .D(n1334), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[449]) );
  DFFSR \buffer_reg[457]  ( .D(n1332), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[457]) );
  DFFSR \buffer_reg[465]  ( .D(n1330), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[465]) );
  DFFSR \buffer_reg[473]  ( .D(n1328), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[473]) );
  DFFSR \buffer_reg[481]  ( .D(n1326), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[481]) );
  DFFSR \buffer_reg[489]  ( .D(n1324), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[489]) );
  DFFSR \buffer_reg[497]  ( .D(n1322), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[497]) );
  DFFSR \buffer_reg[505]  ( .D(n1320), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[505]) );
  DFFSR \tx_packet_data_reg[1]  ( .D(nxt_tx_packet_data[1]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(tx_packet_data[1]) );
  DFFSR \buffer_reg[0]  ( .D(n1317), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[0]) );
  DFFSR \buffer_reg[8]  ( .D(n1315), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[8]) );
  DFFSR \buffer_reg[16]  ( .D(n1313), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[16]) );
  DFFSR \buffer_reg[24]  ( .D(n1311), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[24]) );
  DFFSR \buffer_reg[32]  ( .D(n1309), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[32]) );
  DFFSR \buffer_reg[40]  ( .D(n1307), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[40]) );
  DFFSR \buffer_reg[48]  ( .D(n1305), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[48]) );
  DFFSR \buffer_reg[56]  ( .D(n1303), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[56]) );
  DFFSR \buffer_reg[64]  ( .D(n1301), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[64]) );
  DFFSR \buffer_reg[72]  ( .D(n1299), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[72]) );
  DFFSR \buffer_reg[80]  ( .D(n1297), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[80]) );
  DFFSR \buffer_reg[88]  ( .D(n1295), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[88]) );
  DFFSR \buffer_reg[96]  ( .D(n1293), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[96]) );
  DFFSR \buffer_reg[104]  ( .D(n1291), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[104]) );
  DFFSR \buffer_reg[112]  ( .D(n1289), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[112]) );
  DFFSR \buffer_reg[120]  ( .D(n1287), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[120]) );
  DFFSR \buffer_reg[128]  ( .D(n1285), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[128]) );
  DFFSR \buffer_reg[136]  ( .D(n1283), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[136]) );
  DFFSR \buffer_reg[144]  ( .D(n1281), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[144]) );
  DFFSR \buffer_reg[152]  ( .D(n1279), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[152]) );
  DFFSR \buffer_reg[160]  ( .D(n1277), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[160]) );
  DFFSR \buffer_reg[168]  ( .D(n1275), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[168]) );
  DFFSR \buffer_reg[176]  ( .D(n1273), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[176]) );
  DFFSR \buffer_reg[184]  ( .D(n1271), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[184]) );
  DFFSR \buffer_reg[192]  ( .D(n1269), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[192]) );
  DFFSR \buffer_reg[200]  ( .D(n1267), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[200]) );
  DFFSR \buffer_reg[208]  ( .D(n1265), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[208]) );
  DFFSR \buffer_reg[216]  ( .D(n1263), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[216]) );
  DFFSR \buffer_reg[224]  ( .D(n1261), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[224]) );
  DFFSR \buffer_reg[232]  ( .D(n1259), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[232]) );
  DFFSR \buffer_reg[240]  ( .D(n1257), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[240]) );
  DFFSR \buffer_reg[248]  ( .D(n1255), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[248]) );
  DFFSR \buffer_reg[256]  ( .D(n1253), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[256]) );
  DFFSR \buffer_reg[264]  ( .D(n1251), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[264]) );
  DFFSR \buffer_reg[272]  ( .D(n1249), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[272]) );
  DFFSR \buffer_reg[280]  ( .D(n1247), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[280]) );
  DFFSR \buffer_reg[288]  ( .D(n1245), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[288]) );
  DFFSR \buffer_reg[296]  ( .D(n1243), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[296]) );
  DFFSR \buffer_reg[304]  ( .D(n1241), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[304]) );
  DFFSR \buffer_reg[312]  ( .D(n1239), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[312]) );
  DFFSR \buffer_reg[320]  ( .D(n1237), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[320]) );
  DFFSR \buffer_reg[328]  ( .D(n1235), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[328]) );
  DFFSR \buffer_reg[336]  ( .D(n1233), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[336]) );
  DFFSR \buffer_reg[344]  ( .D(n1231), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[344]) );
  DFFSR \buffer_reg[352]  ( .D(n1229), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[352]) );
  DFFSR \buffer_reg[360]  ( .D(n1227), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[360]) );
  DFFSR \buffer_reg[368]  ( .D(n1225), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[368]) );
  DFFSR \buffer_reg[376]  ( .D(n1223), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[376]) );
  DFFSR \buffer_reg[384]  ( .D(n1221), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[384]) );
  DFFSR \buffer_reg[392]  ( .D(n1219), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[392]) );
  DFFSR \buffer_reg[400]  ( .D(n1217), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[400]) );
  DFFSR \buffer_reg[408]  ( .D(n1215), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[408]) );
  DFFSR \buffer_reg[416]  ( .D(n1213), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[416]) );
  DFFSR \buffer_reg[424]  ( .D(n1211), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[424]) );
  DFFSR \buffer_reg[432]  ( .D(n1209), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[432]) );
  DFFSR \buffer_reg[440]  ( .D(n1207), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[440]) );
  DFFSR \buffer_reg[448]  ( .D(n1205), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[448]) );
  DFFSR \buffer_reg[456]  ( .D(n1203), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[456]) );
  DFFSR \buffer_reg[464]  ( .D(n1201), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[464]) );
  DFFSR \buffer_reg[472]  ( .D(n1199), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[472]) );
  DFFSR \buffer_reg[480]  ( .D(n1197), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[480]) );
  DFFSR \buffer_reg[488]  ( .D(n1195), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[488]) );
  DFFSR \buffer_reg[496]  ( .D(n1193), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[496]) );
  DFFSR \buffer_reg[504]  ( .D(n1191), .CLK(clk), .R(n_rst), .S(1'b1), .Q(
        buffer[504]) );
  DFFSR \tx_packet_data_reg[0]  ( .D(nxt_tx_packet_data[0]), .CLK(clk), .R(
        n_rst), .S(1'b1), .Q(tx_packet_data[0]) );
  data_buffer_DW01_incdec_0 r374 ( .A(buffer_occupancy), .INC_DEC(n2228), 
        .SUM({N80, N79, N78, N77, N76, N75, N74}) );
  INVX2 U3 ( .A(n798), .Y(n2228) );
  BUFX2 U4 ( .A(n50), .Y(n11) );
  BUFX2 U5 ( .A(n50), .Y(n12) );
  BUFX2 U6 ( .A(n50), .Y(n13) );
  BUFX2 U7 ( .A(n49), .Y(n14) );
  BUFX2 U8 ( .A(n49), .Y(n15) );
  BUFX2 U9 ( .A(n49), .Y(n16) );
  BUFX2 U10 ( .A(n48), .Y(n17) );
  BUFX2 U11 ( .A(n48), .Y(n18) );
  BUFX2 U12 ( .A(n48), .Y(n19) );
  BUFX2 U13 ( .A(n53), .Y(n2) );
  BUFX2 U14 ( .A(n53), .Y(n3) );
  BUFX2 U15 ( .A(n53), .Y(n4) );
  BUFX2 U16 ( .A(n52), .Y(n5) );
  BUFX2 U17 ( .A(n52), .Y(n6) );
  BUFX2 U18 ( .A(n52), .Y(n7) );
  BUFX2 U19 ( .A(n51), .Y(n8) );
  BUFX2 U20 ( .A(n51), .Y(n9) );
  BUFX2 U21 ( .A(n51), .Y(n10) );
  BUFX2 U22 ( .A(n44), .Y(n31) );
  BUFX2 U23 ( .A(n43), .Y(n32) );
  BUFX2 U24 ( .A(n43), .Y(n33) );
  BUFX2 U25 ( .A(n43), .Y(n34) );
  BUFX2 U26 ( .A(n42), .Y(n35) );
  BUFX2 U27 ( .A(n42), .Y(n36) );
  BUFX2 U28 ( .A(n42), .Y(n37) );
  BUFX2 U29 ( .A(n41), .Y(n38) );
  BUFX2 U30 ( .A(n41), .Y(n39) );
  BUFX2 U31 ( .A(n47), .Y(n20) );
  BUFX2 U32 ( .A(n47), .Y(n21) );
  BUFX2 U33 ( .A(n47), .Y(n22) );
  BUFX2 U34 ( .A(n46), .Y(n23) );
  BUFX2 U35 ( .A(n46), .Y(n24) );
  BUFX2 U36 ( .A(n44), .Y(n30) );
  BUFX2 U37 ( .A(n46), .Y(n25) );
  BUFX2 U38 ( .A(n45), .Y(n26) );
  BUFX2 U39 ( .A(n45), .Y(n27) );
  BUFX2 U40 ( .A(n45), .Y(n28) );
  BUFX2 U41 ( .A(n44), .Y(n29) );
  BUFX2 U42 ( .A(n41), .Y(n40) );
  BUFX2 U43 ( .A(n54), .Y(n1) );
  BUFX2 U44 ( .A(store_tx_data), .Y(n54) );
  BUFX2 U45 ( .A(store_tx_data), .Y(n50) );
  BUFX2 U46 ( .A(store_tx_data), .Y(n49) );
  BUFX2 U47 ( .A(store_tx_data), .Y(n48) );
  BUFX2 U48 ( .A(store_tx_data), .Y(n53) );
  BUFX2 U49 ( .A(store_tx_data), .Y(n52) );
  BUFX2 U50 ( .A(store_tx_data), .Y(n51) );
  BUFX2 U51 ( .A(store_tx_data), .Y(n43) );
  BUFX2 U52 ( .A(store_tx_data), .Y(n42) );
  BUFX2 U53 ( .A(store_tx_data), .Y(n41) );
  BUFX2 U54 ( .A(store_tx_data), .Y(n47) );
  BUFX2 U55 ( .A(store_tx_data), .Y(n46) );
  BUFX2 U56 ( .A(store_tx_data), .Y(n45) );
  BUFX2 U57 ( .A(store_tx_data), .Y(n44) );
  MUX2X1 U58 ( .B(n55), .A(n56), .S(n57), .Y(nxt_tx_packet_data[7]) );
  NOR2X1 U59 ( .A(n58), .B(n59), .Y(n56) );
  NAND2X1 U60 ( .A(n60), .B(n61), .Y(n59) );
  AOI22X1 U61 ( .A(buffer[455]), .B(n62), .C(buffer[463]), .D(n63), .Y(n61) );
  AOI22X1 U62 ( .A(buffer[495]), .B(n64), .C(buffer[487]), .D(n65), .Y(n60) );
  NAND2X1 U63 ( .A(n66), .B(n67), .Y(n58) );
  AOI22X1 U64 ( .A(n68), .B(n69), .C(buffer[503]), .D(n70), .Y(n67) );
  NAND3X1 U65 ( .A(n71), .B(n72), .C(n73), .Y(n69) );
  NOR2X1 U66 ( .A(n74), .B(n75), .Y(n73) );
  OAI22X1 U67 ( .A(n76), .B(n77), .C(n78), .D(n79), .Y(n75) );
  OAI21X1 U68 ( .A(n80), .B(n81), .C(n82), .Y(n74) );
  OAI21X1 U69 ( .A(n83), .B(n84), .C(n85), .Y(n82) );
  NAND2X1 U70 ( .A(n86), .B(n87), .Y(n84) );
  AOI22X1 U71 ( .A(buffer[367]), .B(n88), .C(buffer[359]), .D(n89), .Y(n87) );
  AOI22X1 U72 ( .A(buffer[383]), .B(n90), .C(buffer[375]), .D(n91), .Y(n86) );
  NAND2X1 U73 ( .A(n92), .B(n93), .Y(n83) );
  AOI22X1 U74 ( .A(n94), .B(n95), .C(buffer[391]), .D(n96), .Y(n93) );
  NAND3X1 U75 ( .A(n97), .B(n98), .C(n99), .Y(n95) );
  NOR2X1 U76 ( .A(n100), .B(n101), .Y(n99) );
  OAI22X1 U77 ( .A(n102), .B(n103), .C(n104), .D(n105), .Y(n101) );
  OAI21X1 U78 ( .A(n106), .B(n107), .C(n108), .Y(n100) );
  OAI21X1 U79 ( .A(n109), .B(n110), .C(n111), .Y(n108) );
  NAND2X1 U80 ( .A(n112), .B(n113), .Y(n110) );
  AOI22X1 U81 ( .A(buffer[231]), .B(n114), .C(buffer[239]), .D(n115), .Y(n113)
         );
  AOI22X1 U82 ( .A(buffer[271]), .B(n116), .C(buffer[263]), .D(n117), .Y(n112)
         );
  NAND2X1 U83 ( .A(n118), .B(n119), .Y(n109) );
  AOI22X1 U84 ( .A(n120), .B(n121), .C(buffer[279]), .D(n122), .Y(n119) );
  NAND3X1 U85 ( .A(n123), .B(n124), .C(n125), .Y(n121) );
  NOR2X1 U86 ( .A(n126), .B(n127), .Y(n125) );
  OAI22X1 U87 ( .A(n128), .B(n129), .C(n130), .D(n131), .Y(n127) );
  OAI21X1 U88 ( .A(n132), .B(n133), .C(n134), .Y(n126) );
  OAI21X1 U89 ( .A(n135), .B(n136), .C(n137), .Y(n134) );
  NAND2X1 U90 ( .A(n138), .B(n139), .Y(n136) );
  AOI22X1 U91 ( .A(buffer[135]), .B(n140), .C(buffer[143]), .D(n141), .Y(n139)
         );
  AOI22X1 U92 ( .A(buffer[159]), .B(n142), .C(buffer[151]), .D(n143), .Y(n138)
         );
  NAND2X1 U93 ( .A(n144), .B(n145), .Y(n135) );
  AOI22X1 U94 ( .A(n146), .B(n147), .C(buffer[167]), .D(n148), .Y(n145) );
  NAND3X1 U95 ( .A(n149), .B(n150), .C(n151), .Y(n147) );
  NOR2X1 U96 ( .A(n152), .B(n153), .Y(n151) );
  OAI22X1 U97 ( .A(n154), .B(n155), .C(n156), .D(n157), .Y(n153) );
  OAI21X1 U98 ( .A(n158), .B(n159), .C(n160), .Y(n152) );
  OAI21X1 U99 ( .A(n161), .B(n162), .C(n163), .Y(n160) );
  NAND2X1 U100 ( .A(n164), .B(n165), .Y(n162) );
  AOI22X1 U101 ( .A(buffer[31]), .B(n166), .C(buffer[23]), .D(n167), .Y(n165)
         );
  AOI22X1 U102 ( .A(buffer[47]), .B(n168), .C(buffer[39]), .D(n169), .Y(n164)
         );
  NAND2X1 U103 ( .A(n170), .B(n171), .Y(n161) );
  AOI22X1 U104 ( .A(tx_packet_data[7]), .B(n172), .C(buffer[55]), .D(n173), 
        .Y(n171) );
  AOI22X1 U105 ( .A(buffer[15]), .B(n174), .C(buffer[7]), .D(n175), .Y(n170)
         );
  AOI22X1 U106 ( .A(buffer[79]), .B(n176), .C(buffer[87]), .D(n177), .Y(n150)
         );
  AOI22X1 U107 ( .A(buffer[71]), .B(n178), .C(buffer[63]), .D(n179), .Y(n149)
         );
  AOI22X1 U108 ( .A(buffer[127]), .B(n180), .C(buffer[119]), .D(n181), .Y(n144) );
  AOI22X1 U109 ( .A(buffer[199]), .B(n182), .C(buffer[191]), .D(n183), .Y(n124) );
  AOI22X1 U110 ( .A(buffer[175]), .B(n184), .C(buffer[223]), .D(n185), .Y(n123) );
  AOI22X1 U111 ( .A(buffer[255]), .B(n186), .C(buffer[247]), .D(n187), .Y(n118) );
  AOI22X1 U112 ( .A(buffer[303]), .B(n188), .C(buffer[311]), .D(n189), .Y(n98)
         );
  AOI22X1 U113 ( .A(buffer[287]), .B(n190), .C(buffer[295]), .D(n191), .Y(n97)
         );
  AOI22X1 U114 ( .A(buffer[351]), .B(n192), .C(buffer[343]), .D(n193), .Y(n92)
         );
  AOI22X1 U115 ( .A(buffer[423]), .B(n194), .C(buffer[415]), .D(n195), .Y(n72)
         );
  AOI22X1 U116 ( .A(buffer[399]), .B(n196), .C(buffer[447]), .D(n197), .Y(n71)
         );
  AOI22X1 U117 ( .A(buffer[479]), .B(n198), .C(buffer[471]), .D(n199), .Y(n66)
         );
  MUX2X1 U118 ( .B(n200), .A(n201), .S(n57), .Y(nxt_tx_packet_data[6]) );
  NOR2X1 U119 ( .A(n202), .B(n203), .Y(n201) );
  NAND2X1 U120 ( .A(n204), .B(n205), .Y(n203) );
  AOI22X1 U121 ( .A(buffer[454]), .B(n62), .C(buffer[462]), .D(n63), .Y(n205)
         );
  AOI22X1 U122 ( .A(buffer[494]), .B(n64), .C(buffer[486]), .D(n65), .Y(n204)
         );
  NAND2X1 U123 ( .A(n206), .B(n207), .Y(n202) );
  AOI22X1 U124 ( .A(n68), .B(n208), .C(buffer[502]), .D(n70), .Y(n207) );
  NAND3X1 U125 ( .A(n209), .B(n210), .C(n211), .Y(n208) );
  NOR2X1 U126 ( .A(n212), .B(n213), .Y(n211) );
  OAI22X1 U127 ( .A(n76), .B(n214), .C(n78), .D(n215), .Y(n213) );
  OAI21X1 U128 ( .A(n80), .B(n216), .C(n217), .Y(n212) );
  OAI21X1 U129 ( .A(n218), .B(n219), .C(n85), .Y(n217) );
  NAND2X1 U130 ( .A(n220), .B(n221), .Y(n219) );
  AOI22X1 U131 ( .A(buffer[366]), .B(n88), .C(buffer[358]), .D(n89), .Y(n221)
         );
  AOI22X1 U132 ( .A(buffer[382]), .B(n90), .C(buffer[374]), .D(n91), .Y(n220)
         );
  NAND2X1 U133 ( .A(n222), .B(n223), .Y(n218) );
  AOI22X1 U134 ( .A(n94), .B(n224), .C(buffer[390]), .D(n96), .Y(n223) );
  NAND3X1 U135 ( .A(n225), .B(n226), .C(n227), .Y(n224) );
  NOR2X1 U136 ( .A(n228), .B(n229), .Y(n227) );
  OAI22X1 U137 ( .A(n102), .B(n230), .C(n104), .D(n231), .Y(n229) );
  OAI21X1 U138 ( .A(n106), .B(n232), .C(n233), .Y(n228) );
  OAI21X1 U139 ( .A(n234), .B(n235), .C(n111), .Y(n233) );
  NAND2X1 U140 ( .A(n236), .B(n237), .Y(n235) );
  AOI22X1 U141 ( .A(buffer[230]), .B(n114), .C(buffer[238]), .D(n115), .Y(n237) );
  AOI22X1 U142 ( .A(buffer[270]), .B(n116), .C(buffer[262]), .D(n117), .Y(n236) );
  NAND2X1 U143 ( .A(n238), .B(n239), .Y(n234) );
  AOI22X1 U144 ( .A(n120), .B(n240), .C(buffer[278]), .D(n122), .Y(n239) );
  NAND3X1 U145 ( .A(n241), .B(n242), .C(n243), .Y(n240) );
  NOR2X1 U146 ( .A(n244), .B(n245), .Y(n243) );
  OAI22X1 U147 ( .A(n128), .B(n246), .C(n130), .D(n247), .Y(n245) );
  OAI21X1 U148 ( .A(n132), .B(n248), .C(n249), .Y(n244) );
  OAI21X1 U149 ( .A(n250), .B(n251), .C(n137), .Y(n249) );
  NAND2X1 U150 ( .A(n252), .B(n253), .Y(n251) );
  AOI22X1 U151 ( .A(buffer[134]), .B(n140), .C(buffer[142]), .D(n141), .Y(n253) );
  AOI22X1 U152 ( .A(buffer[158]), .B(n142), .C(buffer[150]), .D(n143), .Y(n252) );
  NAND2X1 U153 ( .A(n254), .B(n255), .Y(n250) );
  AOI22X1 U154 ( .A(n146), .B(n256), .C(buffer[166]), .D(n148), .Y(n255) );
  NAND3X1 U155 ( .A(n257), .B(n258), .C(n259), .Y(n256) );
  NOR2X1 U156 ( .A(n260), .B(n261), .Y(n259) );
  OAI22X1 U157 ( .A(n154), .B(n262), .C(n156), .D(n263), .Y(n261) );
  OAI21X1 U158 ( .A(n158), .B(n264), .C(n265), .Y(n260) );
  OAI21X1 U159 ( .A(n266), .B(n267), .C(n163), .Y(n265) );
  NAND2X1 U160 ( .A(n268), .B(n269), .Y(n267) );
  AOI22X1 U161 ( .A(buffer[30]), .B(n166), .C(buffer[22]), .D(n167), .Y(n269)
         );
  AOI22X1 U162 ( .A(buffer[46]), .B(n168), .C(buffer[38]), .D(n169), .Y(n268)
         );
  NAND2X1 U163 ( .A(n270), .B(n271), .Y(n266) );
  AOI22X1 U164 ( .A(tx_packet_data[6]), .B(n172), .C(buffer[54]), .D(n173), 
        .Y(n271) );
  AOI22X1 U165 ( .A(buffer[14]), .B(n174), .C(buffer[6]), .D(n175), .Y(n270)
         );
  AOI22X1 U166 ( .A(buffer[78]), .B(n176), .C(buffer[86]), .D(n177), .Y(n258)
         );
  AOI22X1 U167 ( .A(buffer[70]), .B(n178), .C(buffer[62]), .D(n179), .Y(n257)
         );
  AOI22X1 U168 ( .A(buffer[126]), .B(n180), .C(buffer[118]), .D(n181), .Y(n254) );
  AOI22X1 U169 ( .A(buffer[198]), .B(n182), .C(buffer[190]), .D(n183), .Y(n242) );
  AOI22X1 U170 ( .A(buffer[174]), .B(n184), .C(buffer[222]), .D(n185), .Y(n241) );
  AOI22X1 U171 ( .A(buffer[254]), .B(n186), .C(buffer[246]), .D(n187), .Y(n238) );
  AOI22X1 U172 ( .A(buffer[302]), .B(n188), .C(buffer[310]), .D(n189), .Y(n226) );
  AOI22X1 U173 ( .A(buffer[286]), .B(n190), .C(buffer[294]), .D(n191), .Y(n225) );
  AOI22X1 U174 ( .A(buffer[350]), .B(n192), .C(buffer[342]), .D(n193), .Y(n222) );
  AOI22X1 U175 ( .A(buffer[422]), .B(n194), .C(buffer[414]), .D(n195), .Y(n210) );
  AOI22X1 U176 ( .A(buffer[398]), .B(n196), .C(buffer[446]), .D(n197), .Y(n209) );
  AOI22X1 U177 ( .A(buffer[478]), .B(n198), .C(buffer[470]), .D(n199), .Y(n206) );
  MUX2X1 U178 ( .B(n272), .A(n273), .S(n57), .Y(nxt_tx_packet_data[5]) );
  NOR2X1 U179 ( .A(n274), .B(n275), .Y(n273) );
  NAND2X1 U180 ( .A(n276), .B(n277), .Y(n275) );
  AOI22X1 U181 ( .A(buffer[453]), .B(n62), .C(buffer[461]), .D(n63), .Y(n277)
         );
  AOI22X1 U182 ( .A(buffer[493]), .B(n64), .C(buffer[485]), .D(n65), .Y(n276)
         );
  NAND2X1 U183 ( .A(n278), .B(n279), .Y(n274) );
  AOI22X1 U184 ( .A(n68), .B(n280), .C(buffer[501]), .D(n70), .Y(n279) );
  NAND3X1 U185 ( .A(n281), .B(n282), .C(n283), .Y(n280) );
  NOR2X1 U186 ( .A(n284), .B(n285), .Y(n283) );
  OAI22X1 U187 ( .A(n76), .B(n286), .C(n78), .D(n287), .Y(n285) );
  OAI21X1 U188 ( .A(n80), .B(n288), .C(n289), .Y(n284) );
  OAI21X1 U189 ( .A(n290), .B(n291), .C(n85), .Y(n289) );
  NAND2X1 U190 ( .A(n292), .B(n293), .Y(n291) );
  AOI22X1 U191 ( .A(buffer[365]), .B(n88), .C(buffer[357]), .D(n89), .Y(n293)
         );
  AOI22X1 U192 ( .A(buffer[381]), .B(n90), .C(buffer[373]), .D(n91), .Y(n292)
         );
  NAND2X1 U193 ( .A(n294), .B(n295), .Y(n290) );
  AOI22X1 U194 ( .A(n94), .B(n296), .C(buffer[389]), .D(n96), .Y(n295) );
  NAND3X1 U195 ( .A(n297), .B(n298), .C(n299), .Y(n296) );
  NOR2X1 U196 ( .A(n300), .B(n301), .Y(n299) );
  OAI22X1 U197 ( .A(n102), .B(n302), .C(n104), .D(n303), .Y(n301) );
  OAI21X1 U198 ( .A(n106), .B(n304), .C(n305), .Y(n300) );
  OAI21X1 U199 ( .A(n306), .B(n307), .C(n111), .Y(n305) );
  NAND2X1 U200 ( .A(n308), .B(n309), .Y(n307) );
  AOI22X1 U201 ( .A(buffer[229]), .B(n114), .C(buffer[237]), .D(n115), .Y(n309) );
  AOI22X1 U202 ( .A(buffer[269]), .B(n116), .C(buffer[261]), .D(n117), .Y(n308) );
  NAND2X1 U203 ( .A(n310), .B(n311), .Y(n306) );
  AOI22X1 U204 ( .A(n120), .B(n312), .C(buffer[277]), .D(n122), .Y(n311) );
  NAND3X1 U205 ( .A(n313), .B(n314), .C(n315), .Y(n312) );
  NOR2X1 U206 ( .A(n316), .B(n317), .Y(n315) );
  OAI22X1 U207 ( .A(n128), .B(n318), .C(n130), .D(n319), .Y(n317) );
  OAI21X1 U208 ( .A(n132), .B(n320), .C(n321), .Y(n316) );
  OAI21X1 U209 ( .A(n322), .B(n323), .C(n137), .Y(n321) );
  NAND2X1 U210 ( .A(n324), .B(n325), .Y(n323) );
  AOI22X1 U211 ( .A(buffer[133]), .B(n140), .C(buffer[141]), .D(n141), .Y(n325) );
  AOI22X1 U212 ( .A(buffer[157]), .B(n142), .C(buffer[149]), .D(n143), .Y(n324) );
  NAND2X1 U213 ( .A(n326), .B(n327), .Y(n322) );
  AOI22X1 U214 ( .A(n146), .B(n328), .C(buffer[165]), .D(n148), .Y(n327) );
  NAND3X1 U215 ( .A(n329), .B(n330), .C(n331), .Y(n328) );
  NOR2X1 U216 ( .A(n332), .B(n333), .Y(n331) );
  OAI22X1 U217 ( .A(n154), .B(n334), .C(n156), .D(n335), .Y(n333) );
  OAI21X1 U218 ( .A(n158), .B(n336), .C(n337), .Y(n332) );
  OAI21X1 U219 ( .A(n338), .B(n339), .C(n163), .Y(n337) );
  NAND2X1 U220 ( .A(n340), .B(n341), .Y(n339) );
  AOI22X1 U221 ( .A(buffer[29]), .B(n166), .C(buffer[21]), .D(n167), .Y(n341)
         );
  AOI22X1 U222 ( .A(buffer[45]), .B(n168), .C(buffer[37]), .D(n169), .Y(n340)
         );
  NAND2X1 U223 ( .A(n342), .B(n343), .Y(n338) );
  AOI22X1 U224 ( .A(tx_packet_data[5]), .B(n172), .C(buffer[53]), .D(n173), 
        .Y(n343) );
  AOI22X1 U225 ( .A(buffer[13]), .B(n174), .C(buffer[5]), .D(n175), .Y(n342)
         );
  AOI22X1 U226 ( .A(buffer[77]), .B(n176), .C(buffer[85]), .D(n177), .Y(n330)
         );
  AOI22X1 U227 ( .A(buffer[69]), .B(n178), .C(buffer[61]), .D(n179), .Y(n329)
         );
  AOI22X1 U228 ( .A(buffer[125]), .B(n180), .C(buffer[117]), .D(n181), .Y(n326) );
  AOI22X1 U229 ( .A(buffer[197]), .B(n182), .C(buffer[189]), .D(n183), .Y(n314) );
  AOI22X1 U230 ( .A(buffer[173]), .B(n184), .C(buffer[221]), .D(n185), .Y(n313) );
  AOI22X1 U231 ( .A(buffer[253]), .B(n186), .C(buffer[245]), .D(n187), .Y(n310) );
  AOI22X1 U232 ( .A(buffer[301]), .B(n188), .C(buffer[309]), .D(n189), .Y(n298) );
  AOI22X1 U233 ( .A(buffer[285]), .B(n190), .C(buffer[293]), .D(n191), .Y(n297) );
  AOI22X1 U234 ( .A(buffer[349]), .B(n192), .C(buffer[341]), .D(n193), .Y(n294) );
  AOI22X1 U235 ( .A(buffer[421]), .B(n194), .C(buffer[413]), .D(n195), .Y(n282) );
  AOI22X1 U236 ( .A(buffer[397]), .B(n196), .C(buffer[445]), .D(n197), .Y(n281) );
  AOI22X1 U237 ( .A(buffer[477]), .B(n198), .C(buffer[469]), .D(n199), .Y(n278) );
  MUX2X1 U238 ( .B(n344), .A(n345), .S(n57), .Y(nxt_tx_packet_data[4]) );
  NOR2X1 U239 ( .A(n346), .B(n347), .Y(n345) );
  NAND2X1 U240 ( .A(n348), .B(n349), .Y(n347) );
  AOI22X1 U241 ( .A(buffer[452]), .B(n62), .C(buffer[460]), .D(n63), .Y(n349)
         );
  AOI22X1 U242 ( .A(buffer[492]), .B(n64), .C(buffer[484]), .D(n65), .Y(n348)
         );
  NAND2X1 U243 ( .A(n350), .B(n351), .Y(n346) );
  AOI22X1 U244 ( .A(n68), .B(n352), .C(buffer[500]), .D(n70), .Y(n351) );
  NAND3X1 U245 ( .A(n353), .B(n354), .C(n355), .Y(n352) );
  NOR2X1 U246 ( .A(n356), .B(n357), .Y(n355) );
  OAI22X1 U247 ( .A(n76), .B(n358), .C(n78), .D(n359), .Y(n357) );
  OAI21X1 U248 ( .A(n80), .B(n360), .C(n361), .Y(n356) );
  OAI21X1 U249 ( .A(n362), .B(n363), .C(n85), .Y(n361) );
  NAND2X1 U250 ( .A(n364), .B(n365), .Y(n363) );
  AOI22X1 U251 ( .A(buffer[364]), .B(n88), .C(buffer[356]), .D(n89), .Y(n365)
         );
  AOI22X1 U252 ( .A(buffer[380]), .B(n90), .C(buffer[372]), .D(n91), .Y(n364)
         );
  NAND2X1 U253 ( .A(n366), .B(n367), .Y(n362) );
  AOI22X1 U254 ( .A(n94), .B(n368), .C(buffer[388]), .D(n96), .Y(n367) );
  NAND3X1 U255 ( .A(n369), .B(n370), .C(n371), .Y(n368) );
  NOR2X1 U256 ( .A(n372), .B(n373), .Y(n371) );
  OAI22X1 U257 ( .A(n102), .B(n374), .C(n104), .D(n375), .Y(n373) );
  OAI21X1 U258 ( .A(n106), .B(n376), .C(n377), .Y(n372) );
  OAI21X1 U259 ( .A(n378), .B(n379), .C(n111), .Y(n377) );
  NAND2X1 U260 ( .A(n380), .B(n381), .Y(n379) );
  AOI22X1 U261 ( .A(buffer[228]), .B(n114), .C(buffer[236]), .D(n115), .Y(n381) );
  AOI22X1 U262 ( .A(buffer[268]), .B(n116), .C(buffer[260]), .D(n117), .Y(n380) );
  NAND2X1 U263 ( .A(n382), .B(n383), .Y(n378) );
  AOI22X1 U264 ( .A(n120), .B(n384), .C(buffer[276]), .D(n122), .Y(n383) );
  NAND3X1 U265 ( .A(n385), .B(n386), .C(n387), .Y(n384) );
  NOR2X1 U266 ( .A(n388), .B(n389), .Y(n387) );
  OAI22X1 U267 ( .A(n128), .B(n390), .C(n130), .D(n391), .Y(n389) );
  OAI21X1 U268 ( .A(n132), .B(n392), .C(n393), .Y(n388) );
  OAI21X1 U269 ( .A(n394), .B(n395), .C(n137), .Y(n393) );
  NAND2X1 U270 ( .A(n396), .B(n397), .Y(n395) );
  AOI22X1 U271 ( .A(buffer[132]), .B(n140), .C(buffer[140]), .D(n141), .Y(n397) );
  AOI22X1 U272 ( .A(buffer[156]), .B(n142), .C(buffer[148]), .D(n143), .Y(n396) );
  NAND2X1 U273 ( .A(n398), .B(n399), .Y(n394) );
  AOI22X1 U274 ( .A(n146), .B(n400), .C(buffer[164]), .D(n148), .Y(n399) );
  NAND3X1 U275 ( .A(n401), .B(n402), .C(n403), .Y(n400) );
  NOR2X1 U276 ( .A(n404), .B(n405), .Y(n403) );
  OAI22X1 U277 ( .A(n154), .B(n406), .C(n156), .D(n407), .Y(n405) );
  OAI21X1 U278 ( .A(n158), .B(n408), .C(n409), .Y(n404) );
  OAI21X1 U279 ( .A(n410), .B(n411), .C(n163), .Y(n409) );
  NAND2X1 U280 ( .A(n412), .B(n413), .Y(n411) );
  AOI22X1 U281 ( .A(buffer[28]), .B(n166), .C(buffer[20]), .D(n167), .Y(n413)
         );
  AOI22X1 U282 ( .A(buffer[44]), .B(n168), .C(buffer[36]), .D(n169), .Y(n412)
         );
  NAND2X1 U283 ( .A(n414), .B(n415), .Y(n410) );
  AOI22X1 U284 ( .A(tx_packet_data[4]), .B(n172), .C(buffer[52]), .D(n173), 
        .Y(n415) );
  AOI22X1 U285 ( .A(buffer[12]), .B(n174), .C(buffer[4]), .D(n175), .Y(n414)
         );
  AOI22X1 U286 ( .A(buffer[76]), .B(n176), .C(buffer[84]), .D(n177), .Y(n402)
         );
  AOI22X1 U287 ( .A(buffer[68]), .B(n178), .C(buffer[60]), .D(n179), .Y(n401)
         );
  AOI22X1 U288 ( .A(buffer[124]), .B(n180), .C(buffer[116]), .D(n181), .Y(n398) );
  AOI22X1 U289 ( .A(buffer[196]), .B(n182), .C(buffer[188]), .D(n183), .Y(n386) );
  AOI22X1 U290 ( .A(buffer[172]), .B(n184), .C(buffer[220]), .D(n185), .Y(n385) );
  AOI22X1 U291 ( .A(buffer[252]), .B(n186), .C(buffer[244]), .D(n187), .Y(n382) );
  AOI22X1 U292 ( .A(buffer[300]), .B(n188), .C(buffer[308]), .D(n189), .Y(n370) );
  AOI22X1 U293 ( .A(buffer[284]), .B(n190), .C(buffer[292]), .D(n191), .Y(n369) );
  AOI22X1 U294 ( .A(buffer[348]), .B(n192), .C(buffer[340]), .D(n193), .Y(n366) );
  AOI22X1 U295 ( .A(buffer[420]), .B(n194), .C(buffer[412]), .D(n195), .Y(n354) );
  AOI22X1 U296 ( .A(buffer[396]), .B(n196), .C(buffer[444]), .D(n197), .Y(n353) );
  AOI22X1 U297 ( .A(buffer[476]), .B(n198), .C(buffer[468]), .D(n199), .Y(n350) );
  MUX2X1 U298 ( .B(n416), .A(n417), .S(n57), .Y(nxt_tx_packet_data[3]) );
  NOR2X1 U299 ( .A(n418), .B(n419), .Y(n417) );
  NAND2X1 U300 ( .A(n420), .B(n421), .Y(n419) );
  AOI22X1 U301 ( .A(buffer[451]), .B(n62), .C(buffer[459]), .D(n63), .Y(n421)
         );
  AOI22X1 U302 ( .A(buffer[491]), .B(n64), .C(buffer[483]), .D(n65), .Y(n420)
         );
  NAND2X1 U303 ( .A(n422), .B(n423), .Y(n418) );
  AOI22X1 U304 ( .A(n68), .B(n424), .C(buffer[499]), .D(n70), .Y(n423) );
  NAND3X1 U305 ( .A(n425), .B(n426), .C(n427), .Y(n424) );
  NOR2X1 U306 ( .A(n428), .B(n429), .Y(n427) );
  OAI22X1 U307 ( .A(n76), .B(n430), .C(n78), .D(n431), .Y(n429) );
  OAI21X1 U308 ( .A(n80), .B(n432), .C(n433), .Y(n428) );
  OAI21X1 U309 ( .A(n434), .B(n435), .C(n85), .Y(n433) );
  NAND2X1 U310 ( .A(n436), .B(n437), .Y(n435) );
  AOI22X1 U311 ( .A(buffer[363]), .B(n88), .C(buffer[355]), .D(n89), .Y(n437)
         );
  AOI22X1 U312 ( .A(buffer[379]), .B(n90), .C(buffer[371]), .D(n91), .Y(n436)
         );
  NAND2X1 U313 ( .A(n438), .B(n439), .Y(n434) );
  AOI22X1 U314 ( .A(n94), .B(n440), .C(buffer[387]), .D(n96), .Y(n439) );
  NAND3X1 U315 ( .A(n441), .B(n442), .C(n443), .Y(n440) );
  NOR2X1 U316 ( .A(n444), .B(n445), .Y(n443) );
  OAI22X1 U317 ( .A(n102), .B(n446), .C(n104), .D(n447), .Y(n445) );
  OAI21X1 U318 ( .A(n106), .B(n448), .C(n449), .Y(n444) );
  OAI21X1 U319 ( .A(n450), .B(n451), .C(n111), .Y(n449) );
  NAND2X1 U320 ( .A(n452), .B(n453), .Y(n451) );
  AOI22X1 U321 ( .A(buffer[227]), .B(n114), .C(buffer[235]), .D(n115), .Y(n453) );
  AOI22X1 U322 ( .A(buffer[267]), .B(n116), .C(buffer[259]), .D(n117), .Y(n452) );
  NAND2X1 U323 ( .A(n454), .B(n455), .Y(n450) );
  AOI22X1 U324 ( .A(n120), .B(n456), .C(buffer[275]), .D(n122), .Y(n455) );
  NAND3X1 U325 ( .A(n457), .B(n458), .C(n459), .Y(n456) );
  NOR2X1 U326 ( .A(n460), .B(n461), .Y(n459) );
  OAI22X1 U327 ( .A(n128), .B(n462), .C(n130), .D(n463), .Y(n461) );
  OAI21X1 U328 ( .A(n132), .B(n464), .C(n465), .Y(n460) );
  OAI21X1 U329 ( .A(n466), .B(n467), .C(n137), .Y(n465) );
  NAND2X1 U330 ( .A(n468), .B(n469), .Y(n467) );
  AOI22X1 U331 ( .A(buffer[131]), .B(n140), .C(buffer[139]), .D(n141), .Y(n469) );
  AOI22X1 U332 ( .A(buffer[155]), .B(n142), .C(buffer[147]), .D(n143), .Y(n468) );
  NAND2X1 U333 ( .A(n470), .B(n471), .Y(n466) );
  AOI22X1 U334 ( .A(n146), .B(n472), .C(buffer[163]), .D(n148), .Y(n471) );
  NAND3X1 U335 ( .A(n473), .B(n474), .C(n475), .Y(n472) );
  NOR2X1 U336 ( .A(n476), .B(n477), .Y(n475) );
  OAI22X1 U337 ( .A(n154), .B(n478), .C(n156), .D(n479), .Y(n477) );
  OAI21X1 U338 ( .A(n158), .B(n480), .C(n481), .Y(n476) );
  OAI21X1 U339 ( .A(n482), .B(n483), .C(n163), .Y(n481) );
  NAND2X1 U340 ( .A(n484), .B(n485), .Y(n483) );
  AOI22X1 U341 ( .A(buffer[27]), .B(n166), .C(buffer[19]), .D(n167), .Y(n485)
         );
  AOI22X1 U342 ( .A(buffer[43]), .B(n168), .C(buffer[35]), .D(n169), .Y(n484)
         );
  NAND2X1 U343 ( .A(n486), .B(n487), .Y(n482) );
  AOI22X1 U344 ( .A(tx_packet_data[3]), .B(n172), .C(buffer[51]), .D(n173), 
        .Y(n487) );
  AOI22X1 U345 ( .A(buffer[11]), .B(n174), .C(buffer[3]), .D(n175), .Y(n486)
         );
  AOI22X1 U346 ( .A(buffer[75]), .B(n176), .C(buffer[83]), .D(n177), .Y(n474)
         );
  AOI22X1 U347 ( .A(buffer[67]), .B(n178), .C(buffer[59]), .D(n179), .Y(n473)
         );
  AOI22X1 U348 ( .A(buffer[123]), .B(n180), .C(buffer[115]), .D(n181), .Y(n470) );
  AOI22X1 U349 ( .A(buffer[195]), .B(n182), .C(buffer[187]), .D(n183), .Y(n458) );
  AOI22X1 U350 ( .A(buffer[171]), .B(n184), .C(buffer[219]), .D(n185), .Y(n457) );
  AOI22X1 U351 ( .A(buffer[251]), .B(n186), .C(buffer[243]), .D(n187), .Y(n454) );
  AOI22X1 U352 ( .A(buffer[299]), .B(n188), .C(buffer[307]), .D(n189), .Y(n442) );
  AOI22X1 U353 ( .A(buffer[283]), .B(n190), .C(buffer[291]), .D(n191), .Y(n441) );
  AOI22X1 U354 ( .A(buffer[347]), .B(n192), .C(buffer[339]), .D(n193), .Y(n438) );
  AOI22X1 U355 ( .A(buffer[419]), .B(n194), .C(buffer[411]), .D(n195), .Y(n426) );
  AOI22X1 U356 ( .A(buffer[395]), .B(n196), .C(buffer[443]), .D(n197), .Y(n425) );
  AOI22X1 U357 ( .A(buffer[475]), .B(n198), .C(buffer[467]), .D(n199), .Y(n422) );
  MUX2X1 U358 ( .B(n488), .A(n489), .S(n57), .Y(nxt_tx_packet_data[2]) );
  NOR2X1 U359 ( .A(n490), .B(n491), .Y(n489) );
  NAND2X1 U360 ( .A(n492), .B(n493), .Y(n491) );
  AOI22X1 U361 ( .A(buffer[450]), .B(n62), .C(buffer[458]), .D(n63), .Y(n493)
         );
  AOI22X1 U362 ( .A(buffer[490]), .B(n64), .C(buffer[482]), .D(n65), .Y(n492)
         );
  NAND2X1 U363 ( .A(n494), .B(n495), .Y(n490) );
  AOI22X1 U364 ( .A(n68), .B(n496), .C(buffer[498]), .D(n70), .Y(n495) );
  NAND3X1 U365 ( .A(n497), .B(n498), .C(n499), .Y(n496) );
  NOR2X1 U366 ( .A(n500), .B(n501), .Y(n499) );
  OAI22X1 U367 ( .A(n76), .B(n502), .C(n78), .D(n503), .Y(n501) );
  OAI21X1 U368 ( .A(n80), .B(n504), .C(n505), .Y(n500) );
  OAI21X1 U369 ( .A(n506), .B(n507), .C(n85), .Y(n505) );
  NAND2X1 U370 ( .A(n508), .B(n509), .Y(n507) );
  AOI22X1 U371 ( .A(buffer[362]), .B(n88), .C(buffer[354]), .D(n89), .Y(n509)
         );
  AOI22X1 U372 ( .A(buffer[378]), .B(n90), .C(buffer[370]), .D(n91), .Y(n508)
         );
  NAND2X1 U373 ( .A(n510), .B(n511), .Y(n506) );
  AOI22X1 U374 ( .A(n94), .B(n512), .C(buffer[386]), .D(n96), .Y(n511) );
  NAND3X1 U375 ( .A(n513), .B(n514), .C(n515), .Y(n512) );
  NOR2X1 U376 ( .A(n516), .B(n517), .Y(n515) );
  OAI22X1 U377 ( .A(n102), .B(n518), .C(n104), .D(n519), .Y(n517) );
  OAI21X1 U378 ( .A(n106), .B(n520), .C(n521), .Y(n516) );
  OAI21X1 U379 ( .A(n522), .B(n523), .C(n111), .Y(n521) );
  NAND2X1 U380 ( .A(n524), .B(n525), .Y(n523) );
  AOI22X1 U381 ( .A(buffer[226]), .B(n114), .C(buffer[234]), .D(n115), .Y(n525) );
  AOI22X1 U382 ( .A(buffer[266]), .B(n116), .C(buffer[258]), .D(n117), .Y(n524) );
  NAND2X1 U383 ( .A(n526), .B(n527), .Y(n522) );
  AOI22X1 U384 ( .A(n120), .B(n528), .C(buffer[274]), .D(n122), .Y(n527) );
  NAND3X1 U385 ( .A(n529), .B(n530), .C(n531), .Y(n528) );
  NOR2X1 U386 ( .A(n532), .B(n533), .Y(n531) );
  OAI22X1 U387 ( .A(n128), .B(n534), .C(n130), .D(n535), .Y(n533) );
  OAI21X1 U388 ( .A(n132), .B(n536), .C(n537), .Y(n532) );
  OAI21X1 U389 ( .A(n538), .B(n539), .C(n137), .Y(n537) );
  NAND2X1 U390 ( .A(n540), .B(n541), .Y(n539) );
  AOI22X1 U391 ( .A(buffer[130]), .B(n140), .C(buffer[138]), .D(n141), .Y(n541) );
  AOI22X1 U392 ( .A(buffer[154]), .B(n142), .C(buffer[146]), .D(n143), .Y(n540) );
  NAND2X1 U393 ( .A(n542), .B(n543), .Y(n538) );
  AOI22X1 U394 ( .A(n146), .B(n544), .C(buffer[162]), .D(n148), .Y(n543) );
  NAND3X1 U395 ( .A(n545), .B(n546), .C(n547), .Y(n544) );
  NOR2X1 U396 ( .A(n548), .B(n549), .Y(n547) );
  OAI22X1 U397 ( .A(n154), .B(n550), .C(n156), .D(n551), .Y(n549) );
  OAI21X1 U398 ( .A(n158), .B(n552), .C(n553), .Y(n548) );
  OAI21X1 U399 ( .A(n554), .B(n555), .C(n163), .Y(n553) );
  NAND2X1 U400 ( .A(n556), .B(n557), .Y(n555) );
  AOI22X1 U401 ( .A(buffer[26]), .B(n166), .C(buffer[18]), .D(n167), .Y(n557)
         );
  AOI22X1 U402 ( .A(buffer[42]), .B(n168), .C(buffer[34]), .D(n169), .Y(n556)
         );
  NAND2X1 U403 ( .A(n558), .B(n559), .Y(n554) );
  AOI22X1 U404 ( .A(tx_packet_data[2]), .B(n172), .C(buffer[50]), .D(n173), 
        .Y(n559) );
  AOI22X1 U405 ( .A(buffer[10]), .B(n174), .C(buffer[2]), .D(n175), .Y(n558)
         );
  AOI22X1 U406 ( .A(buffer[74]), .B(n176), .C(buffer[82]), .D(n177), .Y(n546)
         );
  AOI22X1 U407 ( .A(buffer[66]), .B(n178), .C(buffer[58]), .D(n179), .Y(n545)
         );
  AOI22X1 U408 ( .A(buffer[122]), .B(n180), .C(buffer[114]), .D(n181), .Y(n542) );
  AOI22X1 U409 ( .A(buffer[194]), .B(n182), .C(buffer[186]), .D(n183), .Y(n530) );
  AOI22X1 U410 ( .A(buffer[170]), .B(n184), .C(buffer[218]), .D(n185), .Y(n529) );
  AOI22X1 U411 ( .A(buffer[250]), .B(n186), .C(buffer[242]), .D(n187), .Y(n526) );
  AOI22X1 U412 ( .A(buffer[298]), .B(n188), .C(buffer[306]), .D(n189), .Y(n514) );
  AOI22X1 U413 ( .A(buffer[282]), .B(n190), .C(buffer[290]), .D(n191), .Y(n513) );
  AOI22X1 U414 ( .A(buffer[346]), .B(n192), .C(buffer[338]), .D(n193), .Y(n510) );
  AOI22X1 U415 ( .A(buffer[418]), .B(n194), .C(buffer[410]), .D(n195), .Y(n498) );
  AOI22X1 U416 ( .A(buffer[394]), .B(n196), .C(buffer[442]), .D(n197), .Y(n497) );
  AOI22X1 U417 ( .A(buffer[474]), .B(n198), .C(buffer[466]), .D(n199), .Y(n494) );
  MUX2X1 U418 ( .B(n560), .A(n561), .S(n57), .Y(nxt_tx_packet_data[1]) );
  NOR2X1 U419 ( .A(n562), .B(n563), .Y(n561) );
  NAND2X1 U420 ( .A(n564), .B(n565), .Y(n563) );
  AOI22X1 U421 ( .A(buffer[449]), .B(n62), .C(buffer[457]), .D(n63), .Y(n565)
         );
  AOI22X1 U422 ( .A(buffer[489]), .B(n64), .C(buffer[481]), .D(n65), .Y(n564)
         );
  NAND2X1 U423 ( .A(n566), .B(n567), .Y(n562) );
  AOI22X1 U424 ( .A(n68), .B(n568), .C(buffer[497]), .D(n70), .Y(n567) );
  NAND3X1 U425 ( .A(n569), .B(n570), .C(n571), .Y(n568) );
  NOR2X1 U426 ( .A(n572), .B(n573), .Y(n571) );
  OAI22X1 U427 ( .A(n76), .B(n574), .C(n78), .D(n575), .Y(n573) );
  OAI21X1 U428 ( .A(n80), .B(n576), .C(n577), .Y(n572) );
  OAI21X1 U429 ( .A(n578), .B(n579), .C(n85), .Y(n577) );
  NAND2X1 U430 ( .A(n580), .B(n581), .Y(n579) );
  AOI22X1 U431 ( .A(buffer[361]), .B(n88), .C(buffer[353]), .D(n89), .Y(n581)
         );
  AOI22X1 U432 ( .A(buffer[377]), .B(n90), .C(buffer[369]), .D(n91), .Y(n580)
         );
  NAND2X1 U433 ( .A(n582), .B(n583), .Y(n578) );
  AOI22X1 U434 ( .A(n94), .B(n584), .C(buffer[385]), .D(n96), .Y(n583) );
  NAND3X1 U435 ( .A(n585), .B(n586), .C(n587), .Y(n584) );
  NOR2X1 U436 ( .A(n588), .B(n589), .Y(n587) );
  OAI22X1 U437 ( .A(n102), .B(n590), .C(n104), .D(n591), .Y(n589) );
  OAI21X1 U438 ( .A(n106), .B(n592), .C(n593), .Y(n588) );
  OAI21X1 U439 ( .A(n594), .B(n595), .C(n111), .Y(n593) );
  NAND2X1 U440 ( .A(n596), .B(n597), .Y(n595) );
  AOI22X1 U441 ( .A(buffer[225]), .B(n114), .C(buffer[233]), .D(n115), .Y(n597) );
  AOI22X1 U442 ( .A(buffer[265]), .B(n116), .C(buffer[257]), .D(n117), .Y(n596) );
  NAND2X1 U443 ( .A(n598), .B(n599), .Y(n594) );
  AOI22X1 U444 ( .A(n120), .B(n600), .C(buffer[273]), .D(n122), .Y(n599) );
  NAND3X1 U445 ( .A(n601), .B(n602), .C(n603), .Y(n600) );
  NOR2X1 U446 ( .A(n604), .B(n605), .Y(n603) );
  OAI22X1 U447 ( .A(n128), .B(n606), .C(n130), .D(n607), .Y(n605) );
  OAI21X1 U448 ( .A(n132), .B(n608), .C(n609), .Y(n604) );
  OAI21X1 U449 ( .A(n610), .B(n611), .C(n137), .Y(n609) );
  NAND2X1 U450 ( .A(n612), .B(n613), .Y(n611) );
  AOI22X1 U451 ( .A(buffer[129]), .B(n140), .C(buffer[137]), .D(n141), .Y(n613) );
  AOI22X1 U452 ( .A(buffer[153]), .B(n142), .C(buffer[145]), .D(n143), .Y(n612) );
  NAND2X1 U453 ( .A(n614), .B(n615), .Y(n610) );
  AOI22X1 U454 ( .A(n146), .B(n616), .C(buffer[161]), .D(n148), .Y(n615) );
  NAND3X1 U455 ( .A(n617), .B(n618), .C(n619), .Y(n616) );
  NOR2X1 U456 ( .A(n620), .B(n621), .Y(n619) );
  OAI22X1 U457 ( .A(n154), .B(n622), .C(n156), .D(n623), .Y(n621) );
  OAI21X1 U458 ( .A(n158), .B(n624), .C(n625), .Y(n620) );
  OAI21X1 U459 ( .A(n626), .B(n627), .C(n163), .Y(n625) );
  NAND2X1 U460 ( .A(n628), .B(n629), .Y(n627) );
  AOI22X1 U461 ( .A(buffer[25]), .B(n166), .C(buffer[17]), .D(n167), .Y(n629)
         );
  AOI22X1 U462 ( .A(buffer[41]), .B(n168), .C(buffer[33]), .D(n169), .Y(n628)
         );
  NAND2X1 U463 ( .A(n630), .B(n631), .Y(n626) );
  AOI22X1 U464 ( .A(tx_packet_data[1]), .B(n172), .C(buffer[49]), .D(n173), 
        .Y(n631) );
  AOI22X1 U465 ( .A(buffer[9]), .B(n174), .C(buffer[1]), .D(n175), .Y(n630) );
  AOI22X1 U466 ( .A(buffer[73]), .B(n176), .C(buffer[81]), .D(n177), .Y(n618)
         );
  AOI22X1 U467 ( .A(buffer[65]), .B(n178), .C(buffer[57]), .D(n179), .Y(n617)
         );
  AOI22X1 U468 ( .A(buffer[121]), .B(n180), .C(buffer[113]), .D(n181), .Y(n614) );
  AOI22X1 U469 ( .A(buffer[193]), .B(n182), .C(buffer[185]), .D(n183), .Y(n602) );
  AOI22X1 U470 ( .A(buffer[169]), .B(n184), .C(buffer[217]), .D(n185), .Y(n601) );
  AOI22X1 U471 ( .A(buffer[249]), .B(n186), .C(buffer[241]), .D(n187), .Y(n598) );
  AOI22X1 U472 ( .A(buffer[297]), .B(n188), .C(buffer[305]), .D(n189), .Y(n586) );
  AOI22X1 U473 ( .A(buffer[281]), .B(n190), .C(buffer[289]), .D(n191), .Y(n585) );
  AOI22X1 U474 ( .A(buffer[345]), .B(n192), .C(buffer[337]), .D(n193), .Y(n582) );
  AOI22X1 U475 ( .A(buffer[417]), .B(n194), .C(buffer[409]), .D(n195), .Y(n570) );
  AOI22X1 U476 ( .A(buffer[393]), .B(n196), .C(buffer[441]), .D(n197), .Y(n569) );
  AOI22X1 U477 ( .A(buffer[473]), .B(n198), .C(buffer[465]), .D(n199), .Y(n566) );
  MUX2X1 U478 ( .B(n632), .A(n633), .S(n57), .Y(nxt_tx_packet_data[0]) );
  NAND3X1 U479 ( .A(buffer_occupancy[6]), .B(n634), .C(get_tx_packet_data), 
        .Y(n57) );
  NOR2X1 U480 ( .A(n635), .B(n636), .Y(n633) );
  NAND2X1 U481 ( .A(n637), .B(n638), .Y(n636) );
  AOI22X1 U482 ( .A(buffer[448]), .B(n62), .C(buffer[456]), .D(n63), .Y(n638)
         );
  INVX1 U483 ( .A(n639), .Y(n63) );
  INVX1 U484 ( .A(n640), .Y(n62) );
  AOI22X1 U485 ( .A(buffer[488]), .B(n64), .C(buffer[480]), .D(n65), .Y(n637)
         );
  INVX1 U486 ( .A(n641), .Y(n65) );
  INVX1 U487 ( .A(n642), .Y(n64) );
  NAND2X1 U488 ( .A(n643), .B(n644), .Y(n635) );
  AOI22X1 U489 ( .A(n68), .B(n645), .C(buffer[496]), .D(n70), .Y(n644) );
  INVX1 U490 ( .A(n646), .Y(n70) );
  NAND3X1 U491 ( .A(n647), .B(n648), .C(n649), .Y(n645) );
  NOR2X1 U492 ( .A(n650), .B(n651), .Y(n649) );
  OAI22X1 U493 ( .A(n76), .B(n652), .C(n78), .D(n653), .Y(n651) );
  OAI21X1 U494 ( .A(n80), .B(n654), .C(n655), .Y(n650) );
  OAI21X1 U495 ( .A(n656), .B(n657), .C(n85), .Y(n655) );
  NOR2X1 U496 ( .A(n658), .B(n659), .Y(n85) );
  NAND3X1 U497 ( .A(n78), .B(n76), .C(n80), .Y(n659) );
  NAND2X1 U498 ( .A(n660), .B(n661), .Y(n76) );
  NAND2X1 U499 ( .A(n662), .B(n663), .Y(n78) );
  NAND3X1 U500 ( .A(n664), .B(n665), .C(n666), .Y(n658) );
  NOR2X1 U501 ( .A(n196), .B(n197), .Y(n666) );
  NAND2X1 U502 ( .A(n667), .B(n668), .Y(n657) );
  AOI22X1 U503 ( .A(buffer[360]), .B(n88), .C(buffer[352]), .D(n89), .Y(n668)
         );
  INVX1 U504 ( .A(n669), .Y(n89) );
  INVX1 U505 ( .A(n670), .Y(n88) );
  AOI22X1 U506 ( .A(buffer[376]), .B(n90), .C(buffer[368]), .D(n91), .Y(n667)
         );
  NAND2X1 U507 ( .A(n671), .B(n672), .Y(n656) );
  AOI22X1 U508 ( .A(n94), .B(n673), .C(buffer[384]), .D(n96), .Y(n672) );
  INVX1 U509 ( .A(n674), .Y(n96) );
  NAND3X1 U510 ( .A(n675), .B(n676), .C(n677), .Y(n673) );
  NOR2X1 U511 ( .A(n678), .B(n679), .Y(n677) );
  OAI22X1 U512 ( .A(n102), .B(n680), .C(n104), .D(n681), .Y(n679) );
  OAI21X1 U513 ( .A(n106), .B(n682), .C(n683), .Y(n678) );
  OAI21X1 U514 ( .A(n684), .B(n685), .C(n111), .Y(n683) );
  NOR2X1 U515 ( .A(n686), .B(n687), .Y(n111) );
  NAND3X1 U516 ( .A(n104), .B(n102), .C(n106), .Y(n687) );
  NAND2X1 U517 ( .A(n688), .B(n660), .Y(n102) );
  NAND2X1 U518 ( .A(n688), .B(n689), .Y(n104) );
  NAND3X1 U519 ( .A(n690), .B(n691), .C(n692), .Y(n686) );
  NOR2X1 U520 ( .A(n191), .B(n190), .Y(n692) );
  NAND2X1 U521 ( .A(n693), .B(n694), .Y(n685) );
  AOI22X1 U522 ( .A(buffer[224]), .B(n114), .C(buffer[232]), .D(n115), .Y(n694) );
  INVX1 U523 ( .A(n695), .Y(n115) );
  INVX1 U524 ( .A(n696), .Y(n114) );
  AOI22X1 U525 ( .A(buffer[264]), .B(n116), .C(buffer[256]), .D(n117), .Y(n693) );
  INVX1 U526 ( .A(n697), .Y(n117) );
  INVX1 U527 ( .A(n698), .Y(n116) );
  NAND2X1 U528 ( .A(n699), .B(n700), .Y(n684) );
  AOI22X1 U529 ( .A(n120), .B(n701), .C(buffer[272]), .D(n122), .Y(n700) );
  INVX1 U530 ( .A(n702), .Y(n122) );
  NAND3X1 U531 ( .A(n703), .B(n704), .C(n705), .Y(n701) );
  NOR2X1 U532 ( .A(n706), .B(n707), .Y(n705) );
  OAI22X1 U533 ( .A(n128), .B(n708), .C(n130), .D(n709), .Y(n707) );
  OAI21X1 U534 ( .A(n132), .B(n710), .C(n711), .Y(n706) );
  OAI21X1 U535 ( .A(n712), .B(n713), .C(n137), .Y(n711) );
  NOR2X1 U536 ( .A(n714), .B(n715), .Y(n137) );
  NAND3X1 U537 ( .A(n130), .B(n128), .C(n132), .Y(n715) );
  NAND2X1 U538 ( .A(n716), .B(n660), .Y(n128) );
  NAND2X1 U539 ( .A(n717), .B(n718), .Y(n130) );
  NAND3X1 U540 ( .A(n719), .B(n720), .C(n721), .Y(n714) );
  NOR2X1 U541 ( .A(n183), .B(n182), .Y(n721) );
  NAND2X1 U542 ( .A(n722), .B(n723), .Y(n713) );
  AOI22X1 U543 ( .A(buffer[128]), .B(n140), .C(buffer[136]), .D(n141), .Y(n723) );
  INVX1 U544 ( .A(n724), .Y(n141) );
  INVX1 U545 ( .A(n725), .Y(n140) );
  AOI22X1 U546 ( .A(buffer[152]), .B(n142), .C(buffer[144]), .D(n143), .Y(n722) );
  INVX1 U547 ( .A(n726), .Y(n143) );
  INVX1 U548 ( .A(n727), .Y(n142) );
  NAND2X1 U549 ( .A(n728), .B(n729), .Y(n712) );
  AOI22X1 U550 ( .A(n146), .B(n730), .C(buffer[160]), .D(n148), .Y(n729) );
  INVX1 U551 ( .A(n731), .Y(n148) );
  NAND3X1 U552 ( .A(n732), .B(n733), .C(n734), .Y(n730) );
  NOR2X1 U553 ( .A(n735), .B(n736), .Y(n734) );
  OAI22X1 U554 ( .A(n154), .B(n737), .C(n156), .D(n738), .Y(n736) );
  OAI21X1 U555 ( .A(n158), .B(n739), .C(n740), .Y(n735) );
  OAI21X1 U556 ( .A(n741), .B(n742), .C(n163), .Y(n740) );
  NOR2X1 U557 ( .A(n743), .B(n744), .Y(n163) );
  NAND3X1 U558 ( .A(n156), .B(n154), .C(n158), .Y(n744) );
  NAND2X1 U559 ( .A(n745), .B(n660), .Y(n154) );
  NAND2X1 U560 ( .A(n745), .B(n689), .Y(n156) );
  NAND3X1 U561 ( .A(n746), .B(n747), .C(n748), .Y(n743) );
  NOR2X1 U562 ( .A(n177), .B(n176), .Y(n748) );
  NAND2X1 U563 ( .A(n749), .B(n750), .Y(n742) );
  AOI22X1 U564 ( .A(buffer[24]), .B(n166), .C(buffer[16]), .D(n167), .Y(n750)
         );
  INVX1 U565 ( .A(n751), .Y(n167) );
  INVX1 U566 ( .A(n752), .Y(n166) );
  AOI22X1 U567 ( .A(buffer[40]), .B(n168), .C(buffer[32]), .D(n169), .Y(n749)
         );
  NAND2X1 U568 ( .A(n753), .B(n754), .Y(n741) );
  AOI22X1 U569 ( .A(tx_packet_data[0]), .B(n172), .C(buffer[48]), .D(n173), 
        .Y(n754) );
  INVX1 U570 ( .A(n755), .Y(n173) );
  NOR2X1 U571 ( .A(n756), .B(n757), .Y(n172) );
  NAND3X1 U572 ( .A(n752), .B(n751), .C(n755), .Y(n757) );
  NAND2X1 U573 ( .A(n758), .B(n718), .Y(n755) );
  NAND2X1 U574 ( .A(n662), .B(n759), .Y(n751) );
  NAND2X1 U575 ( .A(n758), .B(n689), .Y(n752) );
  NAND3X1 U576 ( .A(n760), .B(n761), .C(n762), .Y(n756) );
  NOR2X1 U577 ( .A(n169), .B(n168), .Y(n762) );
  AND2X1 U578 ( .A(n758), .B(n660), .Y(n168) );
  AND2X1 U579 ( .A(n758), .B(n763), .Y(n169) );
  AOI22X1 U580 ( .A(buffer[8]), .B(n174), .C(buffer[0]), .D(n175), .Y(n753) );
  INVX1 U581 ( .A(n761), .Y(n175) );
  NAND2X1 U582 ( .A(n764), .B(n759), .Y(n761) );
  INVX1 U583 ( .A(n760), .Y(n174) );
  NAND2X1 U584 ( .A(n765), .B(n759), .Y(n760) );
  NAND2X1 U585 ( .A(n745), .B(n763), .Y(n158) );
  AOI22X1 U586 ( .A(buffer[72]), .B(n176), .C(buffer[80]), .D(n177), .Y(n733)
         );
  AND2X1 U587 ( .A(n766), .B(n718), .Y(n177) );
  AND2X1 U588 ( .A(n766), .B(n660), .Y(n176) );
  AOI22X1 U589 ( .A(buffer[64]), .B(n178), .C(buffer[56]), .D(n179), .Y(n732)
         );
  INVX1 U590 ( .A(n747), .Y(n179) );
  NAND2X1 U591 ( .A(n766), .B(n689), .Y(n747) );
  INVX1 U592 ( .A(n746), .Y(n178) );
  NAND2X1 U593 ( .A(n766), .B(n763), .Y(n746) );
  AND2X1 U594 ( .A(n767), .B(n759), .Y(n766) );
  NOR2X1 U595 ( .A(n768), .B(n769), .Y(n146) );
  NAND3X1 U596 ( .A(n725), .B(n724), .C(n731), .Y(n769) );
  NAND2X1 U597 ( .A(n717), .B(n763), .Y(n731) );
  NAND2X1 U598 ( .A(n770), .B(n765), .Y(n724) );
  NAND2X1 U599 ( .A(n770), .B(n764), .Y(n725) );
  NAND3X1 U600 ( .A(n727), .B(n726), .C(n771), .Y(n768) );
  NOR2X1 U601 ( .A(n181), .B(n180), .Y(n771) );
  NAND2X1 U602 ( .A(n770), .B(n662), .Y(n726) );
  NAND2X1 U603 ( .A(n717), .B(n689), .Y(n727) );
  AOI22X1 U604 ( .A(buffer[120]), .B(n180), .C(buffer[112]), .D(n181), .Y(n728) );
  AND2X1 U605 ( .A(n745), .B(n718), .Y(n181) );
  AND2X1 U606 ( .A(n758), .B(buffer_occupancy[3]), .Y(n745) );
  AND2X1 U607 ( .A(buffer_occupancy[2]), .B(n759), .Y(n758) );
  AND2X1 U608 ( .A(n770), .B(n772), .Y(n180) );
  NAND2X1 U609 ( .A(n716), .B(n718), .Y(n132) );
  AOI22X1 U610 ( .A(buffer[192]), .B(n182), .C(buffer[184]), .D(n183), .Y(n704) );
  AND2X1 U611 ( .A(n716), .B(n689), .Y(n183) );
  AND2X1 U612 ( .A(n716), .B(n763), .Y(n182) );
  AND2X1 U613 ( .A(n770), .B(n767), .Y(n716) );
  AOI22X1 U614 ( .A(buffer[168]), .B(n184), .C(buffer[216]), .D(n185), .Y(n703) );
  INVX1 U615 ( .A(n719), .Y(n184) );
  NAND2X1 U616 ( .A(n717), .B(n660), .Y(n719) );
  NOR2X1 U617 ( .A(n773), .B(n774), .Y(n120) );
  NAND3X1 U618 ( .A(n696), .B(n695), .C(n702), .Y(n774) );
  NAND2X1 U619 ( .A(n662), .B(n775), .Y(n702) );
  AND2X1 U620 ( .A(n718), .B(n776), .Y(n662) );
  NAND2X1 U621 ( .A(n185), .B(n660), .Y(n695) );
  NAND2X1 U622 ( .A(n185), .B(n763), .Y(n696) );
  NAND3X1 U623 ( .A(n698), .B(n697), .C(n777), .Y(n773) );
  NOR2X1 U624 ( .A(n187), .B(n186), .Y(n777) );
  NAND2X1 U625 ( .A(n764), .B(n775), .Y(n697) );
  NAND2X1 U626 ( .A(n765), .B(n775), .Y(n698) );
  AOI22X1 U627 ( .A(buffer[248]), .B(n186), .C(buffer[240]), .D(n187), .Y(n699) );
  AND2X1 U628 ( .A(n185), .B(n718), .Y(n187) );
  INVX1 U629 ( .A(n720), .Y(n185) );
  NAND2X1 U630 ( .A(n717), .B(buffer_occupancy[3]), .Y(n720) );
  AND2X1 U631 ( .A(n770), .B(buffer_occupancy[2]), .Y(n717) );
  AND2X1 U632 ( .A(buffer_occupancy[4]), .B(n759), .Y(n770) );
  AND2X1 U633 ( .A(n775), .B(n772), .Y(n186) );
  NAND2X1 U634 ( .A(n688), .B(n763), .Y(n106) );
  AOI22X1 U635 ( .A(buffer[296]), .B(n188), .C(buffer[304]), .D(n189), .Y(n676) );
  INVX1 U636 ( .A(n691), .Y(n189) );
  NAND2X1 U637 ( .A(n778), .B(n718), .Y(n691) );
  INVX1 U638 ( .A(n690), .Y(n188) );
  NAND2X1 U639 ( .A(n778), .B(n660), .Y(n690) );
  AOI22X1 U640 ( .A(buffer[280]), .B(n190), .C(buffer[288]), .D(n191), .Y(n675) );
  AND2X1 U641 ( .A(n778), .B(n763), .Y(n191) );
  AND2X1 U642 ( .A(n778), .B(n689), .Y(n190) );
  NOR2X1 U643 ( .A(n779), .B(n780), .Y(n94) );
  NAND3X1 U644 ( .A(n670), .B(n669), .C(n674), .Y(n780) );
  NAND2X1 U645 ( .A(n764), .B(n663), .Y(n674) );
  AND2X1 U646 ( .A(n763), .B(n776), .Y(n764) );
  NAND2X1 U647 ( .A(n781), .B(n763), .Y(n669) );
  NAND2X1 U648 ( .A(n781), .B(n660), .Y(n670) );
  NAND3X1 U649 ( .A(n782), .B(n783), .C(n784), .Y(n779) );
  NOR2X1 U650 ( .A(n91), .B(n90), .Y(n784) );
  AND2X1 U651 ( .A(n663), .B(n772), .Y(n90) );
  AND2X1 U652 ( .A(n781), .B(n718), .Y(n91) );
  AOI22X1 U653 ( .A(buffer[344]), .B(n192), .C(buffer[336]), .D(n193), .Y(n671) );
  INVX1 U654 ( .A(n783), .Y(n193) );
  NAND2X1 U655 ( .A(n688), .B(n718), .Y(n783) );
  AND2X1 U656 ( .A(n767), .B(n775), .Y(n688) );
  INVX1 U657 ( .A(n782), .Y(n192) );
  NAND2X1 U658 ( .A(n781), .B(n689), .Y(n782) );
  AND2X1 U659 ( .A(n778), .B(buffer_occupancy[3]), .Y(n781) );
  AND2X1 U660 ( .A(buffer_occupancy[2]), .B(n775), .Y(n778) );
  NAND2X1 U661 ( .A(n661), .B(n718), .Y(n80) );
  AOI22X1 U662 ( .A(buffer[416]), .B(n194), .C(buffer[408]), .D(n195), .Y(n648) );
  INVX1 U663 ( .A(n665), .Y(n195) );
  NAND2X1 U664 ( .A(n661), .B(n689), .Y(n665) );
  INVX1 U665 ( .A(n664), .Y(n194) );
  NAND2X1 U666 ( .A(n763), .B(n661), .Y(n664) );
  AOI22X1 U667 ( .A(buffer[392]), .B(n196), .C(buffer[440]), .D(n197), .Y(n647) );
  AND2X1 U668 ( .A(n765), .B(n663), .Y(n196) );
  AND2X1 U669 ( .A(n660), .B(n776), .Y(n765) );
  NOR2X1 U670 ( .A(n785), .B(n786), .Y(n68) );
  NAND3X1 U671 ( .A(n640), .B(n639), .C(n646), .Y(n786) );
  NAND2X1 U672 ( .A(n787), .B(n718), .Y(n646) );
  NAND2X1 U673 ( .A(n660), .B(n197), .Y(n639) );
  NAND2X1 U674 ( .A(n763), .B(n197), .Y(n640) );
  NAND3X1 U675 ( .A(n642), .B(n641), .C(n788), .Y(n785) );
  NOR2X1 U676 ( .A(n199), .B(n198), .Y(n788) );
  NAND2X1 U677 ( .A(n763), .B(n787), .Y(n641) );
  NOR2X1 U678 ( .A(n789), .B(buffer_occupancy[1]), .Y(n763) );
  NAND2X1 U679 ( .A(n660), .B(n787), .Y(n642) );
  NOR2X1 U680 ( .A(n790), .B(buffer_occupancy[0]), .Y(n660) );
  AOI22X1 U681 ( .A(buffer[472]), .B(n198), .C(buffer[464]), .D(n199), .Y(n643) );
  AND2X1 U682 ( .A(n718), .B(n197), .Y(n199) );
  AND2X1 U683 ( .A(n663), .B(n767), .Y(n197) );
  NOR2X1 U684 ( .A(n791), .B(buffer_occupancy[2]), .Y(n767) );
  NOR2X1 U685 ( .A(n790), .B(n789), .Y(n718) );
  AND2X1 U686 ( .A(n787), .B(n689), .Y(n198) );
  AND2X1 U687 ( .A(n661), .B(buffer_occupancy[3]), .Y(n787) );
  AND2X1 U688 ( .A(buffer_occupancy[2]), .B(n663), .Y(n661) );
  AND2X1 U689 ( .A(buffer_occupancy[4]), .B(n775), .Y(n663) );
  AND2X1 U690 ( .A(buffer_occupancy[5]), .B(n759), .Y(n775) );
  AND2X1 U691 ( .A(get_tx_packet_data), .B(n792), .Y(n759) );
  INVX1 U692 ( .A(n793), .Y(n2235) );
  AOI21X1 U693 ( .A(N74), .B(n794), .C(n795), .Y(n793) );
  MUX2X1 U694 ( .B(n789), .A(n796), .S(n797), .Y(n795) );
  NAND3X1 U695 ( .A(n798), .B(n799), .C(n800), .Y(n796) );
  INVX1 U696 ( .A(buffer_occupancy[0]), .Y(n789) );
  OAI21X1 U697 ( .A(n792), .B(n797), .C(n801), .Y(n2234) );
  NAND2X1 U698 ( .A(N80), .B(n794), .Y(n801) );
  OAI21X1 U699 ( .A(n802), .B(n797), .C(n803), .Y(n2233) );
  NAND2X1 U700 ( .A(N79), .B(n794), .Y(n803) );
  OAI21X1 U701 ( .A(n804), .B(n797), .C(n805), .Y(n2232) );
  NAND2X1 U702 ( .A(N78), .B(n794), .Y(n805) );
  OAI21X1 U703 ( .A(n791), .B(n797), .C(n806), .Y(n2231) );
  NAND2X1 U704 ( .A(N77), .B(n794), .Y(n806) );
  INVX1 U705 ( .A(buffer_occupancy[3]), .Y(n791) );
  OAI21X1 U706 ( .A(n807), .B(n797), .C(n808), .Y(n2230) );
  NAND2X1 U707 ( .A(N76), .B(n794), .Y(n808) );
  INVX1 U708 ( .A(buffer_occupancy[2]), .Y(n807) );
  OAI21X1 U709 ( .A(n790), .B(n797), .C(n809), .Y(n2229) );
  NAND2X1 U710 ( .A(N75), .B(n794), .Y(n809) );
  AOI21X1 U711 ( .A(n798), .B(n800), .C(clear), .Y(n794) );
  NAND3X1 U712 ( .A(n798), .B(n799), .C(n810), .Y(n797) );
  AOI21X1 U713 ( .A(n40), .B(n634), .C(n811), .Y(n810) );
  INVX1 U714 ( .A(n800), .Y(n811) );
  NAND2X1 U715 ( .A(n40), .B(n792), .Y(n800) );
  INVX1 U716 ( .A(buffer_occupancy[6]), .Y(n792) );
  INVX1 U717 ( .A(n812), .Y(n634) );
  INVX1 U718 ( .A(clear), .Y(n799) );
  INVX1 U719 ( .A(buffer_occupancy[1]), .Y(n790) );
  OAI21X1 U720 ( .A(buffer_occupancy[6]), .B(n812), .C(get_tx_packet_data), 
        .Y(n798) );
  NAND3X1 U721 ( .A(n804), .B(n802), .C(n772), .Y(n812) );
  AND2X1 U722 ( .A(n689), .B(n776), .Y(n772) );
  NOR2X1 U723 ( .A(buffer_occupancy[2]), .B(buffer_occupancy[3]), .Y(n776) );
  NOR2X1 U724 ( .A(buffer_occupancy[0]), .B(buffer_occupancy[1]), .Y(n689) );
  INVX1 U725 ( .A(buffer_occupancy[5]), .Y(n802) );
  INVX1 U726 ( .A(buffer_occupancy[4]), .Y(n804) );
  INVX1 U727 ( .A(n813), .Y(n2220) );
  MUX2X1 U728 ( .B(buffer[7]), .A(tx_data[7]), .S(n30), .Y(n813) );
  INVX1 U729 ( .A(n814), .Y(n2218) );
  MUX2X1 U730 ( .B(buffer[15]), .A(buffer[7]), .S(n30), .Y(n814) );
  INVX1 U731 ( .A(n815), .Y(n2216) );
  MUX2X1 U732 ( .B(buffer[23]), .A(buffer[15]), .S(n30), .Y(n815) );
  INVX1 U733 ( .A(n816), .Y(n2214) );
  MUX2X1 U734 ( .B(buffer[31]), .A(buffer[23]), .S(n30), .Y(n816) );
  INVX1 U735 ( .A(n817), .Y(n2212) );
  MUX2X1 U736 ( .B(buffer[39]), .A(buffer[31]), .S(n30), .Y(n817) );
  INVX1 U737 ( .A(n818), .Y(n2210) );
  MUX2X1 U738 ( .B(buffer[47]), .A(buffer[39]), .S(n30), .Y(n818) );
  INVX1 U739 ( .A(n819), .Y(n2208) );
  MUX2X1 U740 ( .B(buffer[55]), .A(buffer[47]), .S(n30), .Y(n819) );
  INVX1 U741 ( .A(n820), .Y(n2206) );
  MUX2X1 U742 ( .B(buffer[63]), .A(buffer[55]), .S(n29), .Y(n820) );
  INVX1 U743 ( .A(n821), .Y(n2204) );
  MUX2X1 U744 ( .B(buffer[71]), .A(buffer[63]), .S(n29), .Y(n821) );
  INVX1 U745 ( .A(n822), .Y(n2202) );
  MUX2X1 U746 ( .B(buffer[79]), .A(buffer[71]), .S(n29), .Y(n822) );
  INVX1 U747 ( .A(n823), .Y(n2200) );
  MUX2X1 U748 ( .B(buffer[87]), .A(buffer[79]), .S(n29), .Y(n823) );
  MUX2X1 U749 ( .B(n157), .A(n824), .S(n29), .Y(n2198) );
  INVX1 U750 ( .A(buffer[87]), .Y(n824) );
  MUX2X1 U751 ( .B(n159), .A(n157), .S(n29), .Y(n2196) );
  INVX1 U752 ( .A(buffer[95]), .Y(n157) );
  MUX2X1 U753 ( .B(n155), .A(n159), .S(n29), .Y(n2194) );
  INVX1 U754 ( .A(buffer[103]), .Y(n159) );
  MUX2X1 U755 ( .B(n825), .A(n155), .S(n29), .Y(n2192) );
  INVX1 U756 ( .A(buffer[111]), .Y(n155) );
  MUX2X1 U757 ( .B(n826), .A(n825), .S(n29), .Y(n2190) );
  INVX1 U758 ( .A(buffer[119]), .Y(n825) );
  MUX2X1 U759 ( .B(n827), .A(n826), .S(n29), .Y(n2188) );
  INVX1 U760 ( .A(buffer[127]), .Y(n826) );
  MUX2X1 U761 ( .B(n828), .A(n827), .S(n29), .Y(n2186) );
  INVX1 U762 ( .A(buffer[135]), .Y(n827) );
  MUX2X1 U763 ( .B(n829), .A(n828), .S(n29), .Y(n2184) );
  INVX1 U764 ( .A(buffer[143]), .Y(n828) );
  MUX2X1 U765 ( .B(n830), .A(n829), .S(n29), .Y(n2182) );
  INVX1 U766 ( .A(buffer[151]), .Y(n829) );
  MUX2X1 U767 ( .B(n831), .A(n830), .S(n28), .Y(n2180) );
  INVX1 U768 ( .A(buffer[159]), .Y(n830) );
  MUX2X1 U769 ( .B(n832), .A(n831), .S(n28), .Y(n2178) );
  INVX1 U770 ( .A(buffer[167]), .Y(n831) );
  MUX2X1 U771 ( .B(n131), .A(n832), .S(n28), .Y(n2176) );
  INVX1 U772 ( .A(buffer[175]), .Y(n832) );
  MUX2X1 U773 ( .B(n833), .A(n131), .S(n28), .Y(n2174) );
  INVX1 U774 ( .A(buffer[183]), .Y(n131) );
  MUX2X1 U775 ( .B(n834), .A(n833), .S(n28), .Y(n2172) );
  INVX1 U776 ( .A(buffer[191]), .Y(n833) );
  MUX2X1 U777 ( .B(n129), .A(n834), .S(n28), .Y(n2170) );
  INVX1 U778 ( .A(buffer[199]), .Y(n834) );
  MUX2X1 U779 ( .B(n133), .A(n129), .S(n28), .Y(n2168) );
  INVX1 U780 ( .A(buffer[207]), .Y(n129) );
  MUX2X1 U781 ( .B(n835), .A(n133), .S(n28), .Y(n2166) );
  INVX1 U782 ( .A(buffer[215]), .Y(n133) );
  MUX2X1 U783 ( .B(n836), .A(n835), .S(n28), .Y(n2164) );
  INVX1 U784 ( .A(buffer[223]), .Y(n835) );
  MUX2X1 U785 ( .B(n837), .A(n836), .S(n28), .Y(n2162) );
  INVX1 U786 ( .A(buffer[231]), .Y(n836) );
  MUX2X1 U787 ( .B(n838), .A(n837), .S(n28), .Y(n2160) );
  INVX1 U788 ( .A(buffer[239]), .Y(n837) );
  MUX2X1 U789 ( .B(n839), .A(n838), .S(n28), .Y(n2158) );
  INVX1 U790 ( .A(buffer[247]), .Y(n838) );
  MUX2X1 U791 ( .B(n840), .A(n839), .S(n28), .Y(n2156) );
  INVX1 U792 ( .A(buffer[255]), .Y(n839) );
  MUX2X1 U793 ( .B(n841), .A(n840), .S(n27), .Y(n2154) );
  INVX1 U794 ( .A(buffer[263]), .Y(n840) );
  MUX2X1 U795 ( .B(n842), .A(n841), .S(n27), .Y(n2152) );
  INVX1 U796 ( .A(buffer[271]), .Y(n841) );
  MUX2X1 U797 ( .B(n843), .A(n842), .S(n27), .Y(n2150) );
  INVX1 U798 ( .A(buffer[279]), .Y(n842) );
  MUX2X1 U799 ( .B(n844), .A(n843), .S(n27), .Y(n2148) );
  INVX1 U800 ( .A(buffer[287]), .Y(n843) );
  MUX2X1 U801 ( .B(n845), .A(n844), .S(n27), .Y(n2146) );
  INVX1 U802 ( .A(buffer[295]), .Y(n844) );
  MUX2X1 U803 ( .B(n846), .A(n845), .S(n27), .Y(n2144) );
  INVX1 U804 ( .A(buffer[303]), .Y(n845) );
  MUX2X1 U805 ( .B(n105), .A(n846), .S(n27), .Y(n2142) );
  INVX1 U806 ( .A(buffer[311]), .Y(n846) );
  MUX2X1 U807 ( .B(n107), .A(n105), .S(n27), .Y(n2140) );
  INVX1 U808 ( .A(buffer[319]), .Y(n105) );
  MUX2X1 U809 ( .B(n103), .A(n107), .S(n27), .Y(n2138) );
  INVX1 U810 ( .A(buffer[327]), .Y(n107) );
  MUX2X1 U811 ( .B(n847), .A(n103), .S(n27), .Y(n2136) );
  INVX1 U812 ( .A(buffer[335]), .Y(n103) );
  MUX2X1 U813 ( .B(n848), .A(n847), .S(n27), .Y(n2134) );
  INVX1 U814 ( .A(buffer[343]), .Y(n847) );
  MUX2X1 U815 ( .B(n849), .A(n848), .S(n27), .Y(n2132) );
  INVX1 U816 ( .A(buffer[351]), .Y(n848) );
  MUX2X1 U817 ( .B(n850), .A(n849), .S(n27), .Y(n2130) );
  INVX1 U818 ( .A(buffer[359]), .Y(n849) );
  MUX2X1 U819 ( .B(n851), .A(n850), .S(n26), .Y(n2128) );
  INVX1 U820 ( .A(buffer[367]), .Y(n850) );
  MUX2X1 U821 ( .B(n852), .A(n851), .S(n26), .Y(n2126) );
  INVX1 U822 ( .A(buffer[375]), .Y(n851) );
  MUX2X1 U823 ( .B(n853), .A(n852), .S(n26), .Y(n2124) );
  INVX1 U824 ( .A(buffer[383]), .Y(n852) );
  MUX2X1 U825 ( .B(n854), .A(n853), .S(n26), .Y(n2122) );
  INVX1 U826 ( .A(buffer[391]), .Y(n853) );
  MUX2X1 U827 ( .B(n79), .A(n854), .S(n26), .Y(n2120) );
  INVX1 U828 ( .A(buffer[399]), .Y(n854) );
  MUX2X1 U829 ( .B(n855), .A(n79), .S(n26), .Y(n2118) );
  INVX1 U830 ( .A(buffer[407]), .Y(n79) );
  MUX2X1 U831 ( .B(n856), .A(n855), .S(n26), .Y(n2116) );
  INVX1 U832 ( .A(buffer[415]), .Y(n855) );
  MUX2X1 U833 ( .B(n77), .A(n856), .S(n26), .Y(n2114) );
  INVX1 U834 ( .A(buffer[423]), .Y(n856) );
  MUX2X1 U835 ( .B(n81), .A(n77), .S(n26), .Y(n2112) );
  INVX1 U836 ( .A(buffer[431]), .Y(n77) );
  MUX2X1 U837 ( .B(n857), .A(n81), .S(n26), .Y(n2110) );
  INVX1 U838 ( .A(buffer[439]), .Y(n81) );
  MUX2X1 U839 ( .B(n858), .A(n857), .S(n26), .Y(n2108) );
  INVX1 U840 ( .A(buffer[447]), .Y(n857) );
  MUX2X1 U841 ( .B(n859), .A(n858), .S(n26), .Y(n2106) );
  INVX1 U842 ( .A(buffer[455]), .Y(n858) );
  MUX2X1 U843 ( .B(n860), .A(n859), .S(n26), .Y(n2104) );
  INVX1 U844 ( .A(buffer[463]), .Y(n859) );
  MUX2X1 U845 ( .B(n861), .A(n860), .S(n25), .Y(n2102) );
  INVX1 U846 ( .A(buffer[471]), .Y(n860) );
  MUX2X1 U847 ( .B(n862), .A(n861), .S(n25), .Y(n2100) );
  INVX1 U848 ( .A(buffer[479]), .Y(n861) );
  MUX2X1 U849 ( .B(n863), .A(n862), .S(n25), .Y(n2098) );
  INVX1 U850 ( .A(buffer[487]), .Y(n862) );
  MUX2X1 U851 ( .B(n864), .A(n863), .S(n30), .Y(n2096) );
  INVX1 U852 ( .A(buffer[495]), .Y(n863) );
  MUX2X1 U853 ( .B(n55), .A(n864), .S(n25), .Y(n2094) );
  INVX1 U854 ( .A(buffer[503]), .Y(n864) );
  INVX1 U855 ( .A(buffer[511]), .Y(n55) );
  INVX1 U856 ( .A(n865), .Y(n2091) );
  MUX2X1 U857 ( .B(buffer[6]), .A(tx_data[6]), .S(n25), .Y(n865) );
  INVX1 U858 ( .A(n866), .Y(n2089) );
  MUX2X1 U859 ( .B(buffer[14]), .A(buffer[6]), .S(n25), .Y(n866) );
  INVX1 U860 ( .A(n867), .Y(n2087) );
  MUX2X1 U861 ( .B(buffer[22]), .A(buffer[14]), .S(n25), .Y(n867) );
  INVX1 U862 ( .A(n868), .Y(n2085) );
  MUX2X1 U863 ( .B(buffer[30]), .A(buffer[22]), .S(n25), .Y(n868) );
  INVX1 U864 ( .A(n869), .Y(n2083) );
  MUX2X1 U865 ( .B(buffer[38]), .A(buffer[30]), .S(n25), .Y(n869) );
  INVX1 U866 ( .A(n870), .Y(n2081) );
  MUX2X1 U867 ( .B(buffer[46]), .A(buffer[38]), .S(n25), .Y(n870) );
  INVX1 U868 ( .A(n871), .Y(n2079) );
  MUX2X1 U869 ( .B(buffer[54]), .A(buffer[46]), .S(n25), .Y(n871) );
  INVX1 U870 ( .A(n872), .Y(n2077) );
  MUX2X1 U871 ( .B(buffer[62]), .A(buffer[54]), .S(n25), .Y(n872) );
  INVX1 U872 ( .A(n873), .Y(n2075) );
  MUX2X1 U873 ( .B(buffer[70]), .A(buffer[62]), .S(n24), .Y(n873) );
  INVX1 U874 ( .A(n874), .Y(n2073) );
  MUX2X1 U875 ( .B(buffer[78]), .A(buffer[70]), .S(n24), .Y(n874) );
  INVX1 U876 ( .A(n875), .Y(n2071) );
  MUX2X1 U877 ( .B(buffer[86]), .A(buffer[78]), .S(n24), .Y(n875) );
  MUX2X1 U878 ( .B(n263), .A(n876), .S(n24), .Y(n2069) );
  INVX1 U879 ( .A(buffer[86]), .Y(n876) );
  MUX2X1 U880 ( .B(n264), .A(n263), .S(n24), .Y(n2067) );
  INVX1 U881 ( .A(buffer[94]), .Y(n263) );
  MUX2X1 U882 ( .B(n262), .A(n264), .S(n24), .Y(n2065) );
  INVX1 U883 ( .A(buffer[102]), .Y(n264) );
  MUX2X1 U884 ( .B(n877), .A(n262), .S(n24), .Y(n2063) );
  INVX1 U885 ( .A(buffer[110]), .Y(n262) );
  MUX2X1 U886 ( .B(n878), .A(n877), .S(n24), .Y(n2061) );
  INVX1 U887 ( .A(buffer[118]), .Y(n877) );
  MUX2X1 U888 ( .B(n879), .A(n878), .S(n24), .Y(n2059) );
  INVX1 U889 ( .A(buffer[126]), .Y(n878) );
  MUX2X1 U890 ( .B(n880), .A(n879), .S(n24), .Y(n2057) );
  INVX1 U891 ( .A(buffer[134]), .Y(n879) );
  MUX2X1 U892 ( .B(n881), .A(n880), .S(n24), .Y(n2055) );
  INVX1 U893 ( .A(buffer[142]), .Y(n880) );
  MUX2X1 U894 ( .B(n882), .A(n881), .S(n24), .Y(n2053) );
  INVX1 U895 ( .A(buffer[150]), .Y(n881) );
  MUX2X1 U896 ( .B(n883), .A(n882), .S(n24), .Y(n2051) );
  INVX1 U897 ( .A(buffer[158]), .Y(n882) );
  MUX2X1 U898 ( .B(n884), .A(n883), .S(n23), .Y(n2049) );
  INVX1 U899 ( .A(buffer[166]), .Y(n883) );
  MUX2X1 U900 ( .B(n247), .A(n884), .S(n23), .Y(n2047) );
  INVX1 U901 ( .A(buffer[174]), .Y(n884) );
  MUX2X1 U902 ( .B(n885), .A(n247), .S(n23), .Y(n2045) );
  INVX1 U903 ( .A(buffer[182]), .Y(n247) );
  MUX2X1 U904 ( .B(n886), .A(n885), .S(n23), .Y(n2043) );
  INVX1 U905 ( .A(buffer[190]), .Y(n885) );
  MUX2X1 U906 ( .B(n246), .A(n886), .S(n23), .Y(n2041) );
  INVX1 U907 ( .A(buffer[198]), .Y(n886) );
  MUX2X1 U908 ( .B(n248), .A(n246), .S(n23), .Y(n2039) );
  INVX1 U909 ( .A(buffer[206]), .Y(n246) );
  MUX2X1 U910 ( .B(n887), .A(n248), .S(n23), .Y(n2037) );
  INVX1 U911 ( .A(buffer[214]), .Y(n248) );
  MUX2X1 U912 ( .B(n888), .A(n887), .S(n23), .Y(n2035) );
  INVX1 U913 ( .A(buffer[222]), .Y(n887) );
  MUX2X1 U914 ( .B(n889), .A(n888), .S(n23), .Y(n2033) );
  INVX1 U915 ( .A(buffer[230]), .Y(n888) );
  MUX2X1 U916 ( .B(n890), .A(n889), .S(n23), .Y(n2031) );
  INVX1 U917 ( .A(buffer[238]), .Y(n889) );
  MUX2X1 U918 ( .B(n891), .A(n890), .S(n23), .Y(n2029) );
  INVX1 U919 ( .A(buffer[246]), .Y(n890) );
  MUX2X1 U920 ( .B(n892), .A(n891), .S(n23), .Y(n2027) );
  INVX1 U921 ( .A(buffer[254]), .Y(n891) );
  MUX2X1 U922 ( .B(n893), .A(n892), .S(n23), .Y(n2025) );
  INVX1 U923 ( .A(buffer[262]), .Y(n892) );
  MUX2X1 U924 ( .B(n894), .A(n893), .S(n22), .Y(n2023) );
  INVX1 U925 ( .A(buffer[270]), .Y(n893) );
  MUX2X1 U926 ( .B(n895), .A(n894), .S(n22), .Y(n2021) );
  INVX1 U927 ( .A(buffer[278]), .Y(n894) );
  MUX2X1 U928 ( .B(n896), .A(n895), .S(n22), .Y(n2019) );
  INVX1 U929 ( .A(buffer[286]), .Y(n895) );
  MUX2X1 U930 ( .B(n897), .A(n896), .S(n22), .Y(n2017) );
  INVX1 U931 ( .A(buffer[294]), .Y(n896) );
  MUX2X1 U932 ( .B(n898), .A(n897), .S(n22), .Y(n2015) );
  INVX1 U933 ( .A(buffer[302]), .Y(n897) );
  MUX2X1 U934 ( .B(n231), .A(n898), .S(n22), .Y(n2013) );
  INVX1 U935 ( .A(buffer[310]), .Y(n898) );
  MUX2X1 U936 ( .B(n232), .A(n231), .S(n22), .Y(n2011) );
  INVX1 U937 ( .A(buffer[318]), .Y(n231) );
  MUX2X1 U938 ( .B(n230), .A(n232), .S(n22), .Y(n2009) );
  INVX1 U939 ( .A(buffer[326]), .Y(n232) );
  MUX2X1 U940 ( .B(n899), .A(n230), .S(n22), .Y(n2007) );
  INVX1 U941 ( .A(buffer[334]), .Y(n230) );
  MUX2X1 U942 ( .B(n900), .A(n899), .S(n22), .Y(n2005) );
  INVX1 U943 ( .A(buffer[342]), .Y(n899) );
  MUX2X1 U944 ( .B(n901), .A(n900), .S(n22), .Y(n2003) );
  INVX1 U945 ( .A(buffer[350]), .Y(n900) );
  MUX2X1 U946 ( .B(n902), .A(n901), .S(n22), .Y(n2001) );
  INVX1 U947 ( .A(buffer[358]), .Y(n901) );
  MUX2X1 U948 ( .B(n903), .A(n902), .S(n22), .Y(n1999) );
  INVX1 U949 ( .A(buffer[366]), .Y(n902) );
  MUX2X1 U950 ( .B(n904), .A(n903), .S(n21), .Y(n1997) );
  INVX1 U951 ( .A(buffer[374]), .Y(n903) );
  MUX2X1 U952 ( .B(n905), .A(n904), .S(n21), .Y(n1995) );
  INVX1 U953 ( .A(buffer[382]), .Y(n904) );
  MUX2X1 U954 ( .B(n906), .A(n905), .S(n21), .Y(n1993) );
  INVX1 U955 ( .A(buffer[390]), .Y(n905) );
  MUX2X1 U956 ( .B(n215), .A(n906), .S(n21), .Y(n1991) );
  INVX1 U957 ( .A(buffer[398]), .Y(n906) );
  MUX2X1 U958 ( .B(n907), .A(n215), .S(n21), .Y(n1989) );
  INVX1 U959 ( .A(buffer[406]), .Y(n215) );
  MUX2X1 U960 ( .B(n908), .A(n907), .S(n21), .Y(n1987) );
  INVX1 U961 ( .A(buffer[414]), .Y(n907) );
  MUX2X1 U962 ( .B(n214), .A(n908), .S(n21), .Y(n1985) );
  INVX1 U963 ( .A(buffer[422]), .Y(n908) );
  MUX2X1 U964 ( .B(n216), .A(n214), .S(n21), .Y(n1983) );
  INVX1 U965 ( .A(buffer[430]), .Y(n214) );
  MUX2X1 U966 ( .B(n909), .A(n216), .S(n21), .Y(n1981) );
  INVX1 U967 ( .A(buffer[438]), .Y(n216) );
  MUX2X1 U968 ( .B(n910), .A(n909), .S(n21), .Y(n1979) );
  INVX1 U969 ( .A(buffer[446]), .Y(n909) );
  MUX2X1 U970 ( .B(n911), .A(n910), .S(n21), .Y(n1977) );
  INVX1 U971 ( .A(buffer[454]), .Y(n910) );
  MUX2X1 U972 ( .B(n912), .A(n911), .S(n21), .Y(n1975) );
  INVX1 U973 ( .A(buffer[462]), .Y(n911) );
  MUX2X1 U974 ( .B(n913), .A(n912), .S(n21), .Y(n1973) );
  INVX1 U975 ( .A(buffer[470]), .Y(n912) );
  MUX2X1 U976 ( .B(n914), .A(n913), .S(n20), .Y(n1971) );
  INVX1 U977 ( .A(buffer[478]), .Y(n913) );
  MUX2X1 U978 ( .B(n915), .A(n914), .S(n20), .Y(n1969) );
  INVX1 U979 ( .A(buffer[486]), .Y(n914) );
  MUX2X1 U980 ( .B(n916), .A(n915), .S(n20), .Y(n1967) );
  INVX1 U981 ( .A(buffer[494]), .Y(n915) );
  MUX2X1 U982 ( .B(n200), .A(n916), .S(n25), .Y(n1965) );
  INVX1 U983 ( .A(buffer[502]), .Y(n916) );
  INVX1 U984 ( .A(buffer[510]), .Y(n200) );
  INVX1 U985 ( .A(n917), .Y(n1962) );
  MUX2X1 U986 ( .B(buffer[5]), .A(tx_data[5]), .S(n40), .Y(n917) );
  INVX1 U987 ( .A(n918), .Y(n1960) );
  MUX2X1 U988 ( .B(buffer[13]), .A(buffer[5]), .S(n40), .Y(n918) );
  INVX1 U989 ( .A(n919), .Y(n1958) );
  MUX2X1 U990 ( .B(buffer[21]), .A(buffer[13]), .S(n40), .Y(n919) );
  INVX1 U991 ( .A(n920), .Y(n1956) );
  MUX2X1 U992 ( .B(buffer[29]), .A(buffer[21]), .S(n40), .Y(n920) );
  INVX1 U993 ( .A(n921), .Y(n1954) );
  MUX2X1 U994 ( .B(buffer[37]), .A(buffer[29]), .S(n40), .Y(n921) );
  INVX1 U995 ( .A(n922), .Y(n1952) );
  MUX2X1 U996 ( .B(buffer[45]), .A(buffer[37]), .S(n39), .Y(n922) );
  INVX1 U997 ( .A(n923), .Y(n1950) );
  MUX2X1 U998 ( .B(buffer[53]), .A(buffer[45]), .S(n39), .Y(n923) );
  INVX1 U999 ( .A(n924), .Y(n1948) );
  MUX2X1 U1000 ( .B(buffer[61]), .A(buffer[53]), .S(n39), .Y(n924) );
  INVX1 U1001 ( .A(n925), .Y(n1946) );
  MUX2X1 U1002 ( .B(buffer[69]), .A(buffer[61]), .S(n39), .Y(n925) );
  INVX1 U1003 ( .A(n926), .Y(n1944) );
  MUX2X1 U1004 ( .B(buffer[77]), .A(buffer[69]), .S(n39), .Y(n926) );
  INVX1 U1005 ( .A(n927), .Y(n1942) );
  MUX2X1 U1006 ( .B(buffer[85]), .A(buffer[77]), .S(n39), .Y(n927) );
  MUX2X1 U1007 ( .B(n335), .A(n928), .S(n39), .Y(n1940) );
  INVX1 U1008 ( .A(buffer[85]), .Y(n928) );
  MUX2X1 U1009 ( .B(n336), .A(n335), .S(n39), .Y(n1938) );
  INVX1 U1010 ( .A(buffer[93]), .Y(n335) );
  MUX2X1 U1011 ( .B(n334), .A(n336), .S(n39), .Y(n1936) );
  INVX1 U1012 ( .A(buffer[101]), .Y(n336) );
  MUX2X1 U1013 ( .B(n929), .A(n334), .S(n39), .Y(n1934) );
  INVX1 U1014 ( .A(buffer[109]), .Y(n334) );
  MUX2X1 U1015 ( .B(n930), .A(n929), .S(n39), .Y(n1932) );
  INVX1 U1016 ( .A(buffer[117]), .Y(n929) );
  MUX2X1 U1017 ( .B(n931), .A(n930), .S(n39), .Y(n1930) );
  INVX1 U1018 ( .A(buffer[125]), .Y(n930) );
  MUX2X1 U1019 ( .B(n932), .A(n931), .S(n38), .Y(n1928) );
  INVX1 U1020 ( .A(buffer[133]), .Y(n931) );
  MUX2X1 U1021 ( .B(n933), .A(n932), .S(n39), .Y(n1926) );
  INVX1 U1022 ( .A(buffer[141]), .Y(n932) );
  MUX2X1 U1023 ( .B(n934), .A(n933), .S(n38), .Y(n1924) );
  INVX1 U1024 ( .A(buffer[149]), .Y(n933) );
  MUX2X1 U1025 ( .B(n935), .A(n934), .S(n38), .Y(n1922) );
  INVX1 U1026 ( .A(buffer[157]), .Y(n934) );
  MUX2X1 U1027 ( .B(n936), .A(n935), .S(n38), .Y(n1920) );
  INVX1 U1028 ( .A(buffer[165]), .Y(n935) );
  MUX2X1 U1029 ( .B(n319), .A(n936), .S(n38), .Y(n1918) );
  INVX1 U1030 ( .A(buffer[173]), .Y(n936) );
  MUX2X1 U1031 ( .B(n937), .A(n319), .S(n38), .Y(n1916) );
  INVX1 U1032 ( .A(buffer[181]), .Y(n319) );
  MUX2X1 U1033 ( .B(n938), .A(n937), .S(n38), .Y(n1914) );
  INVX1 U1034 ( .A(buffer[189]), .Y(n937) );
  MUX2X1 U1035 ( .B(n318), .A(n938), .S(n38), .Y(n1912) );
  INVX1 U1036 ( .A(buffer[197]), .Y(n938) );
  MUX2X1 U1037 ( .B(n320), .A(n318), .S(n38), .Y(n1910) );
  INVX1 U1038 ( .A(buffer[205]), .Y(n318) );
  MUX2X1 U1039 ( .B(n939), .A(n320), .S(n38), .Y(n1908) );
  INVX1 U1040 ( .A(buffer[213]), .Y(n320) );
  MUX2X1 U1041 ( .B(n940), .A(n939), .S(n38), .Y(n1906) );
  INVX1 U1042 ( .A(buffer[221]), .Y(n939) );
  MUX2X1 U1043 ( .B(n941), .A(n940), .S(n38), .Y(n1904) );
  INVX1 U1044 ( .A(buffer[229]), .Y(n940) );
  MUX2X1 U1045 ( .B(n942), .A(n941), .S(n38), .Y(n1902) );
  INVX1 U1046 ( .A(buffer[237]), .Y(n941) );
  MUX2X1 U1047 ( .B(n943), .A(n942), .S(n37), .Y(n1900) );
  INVX1 U1048 ( .A(buffer[245]), .Y(n942) );
  MUX2X1 U1049 ( .B(n944), .A(n943), .S(n37), .Y(n1898) );
  INVX1 U1050 ( .A(buffer[253]), .Y(n943) );
  MUX2X1 U1051 ( .B(n945), .A(n944), .S(n37), .Y(n1896) );
  INVX1 U1052 ( .A(buffer[261]), .Y(n944) );
  MUX2X1 U1053 ( .B(n946), .A(n945), .S(n37), .Y(n1894) );
  INVX1 U1054 ( .A(buffer[269]), .Y(n945) );
  MUX2X1 U1055 ( .B(n947), .A(n946), .S(n37), .Y(n1892) );
  INVX1 U1056 ( .A(buffer[277]), .Y(n946) );
  MUX2X1 U1057 ( .B(n948), .A(n947), .S(n37), .Y(n1890) );
  INVX1 U1058 ( .A(buffer[285]), .Y(n947) );
  MUX2X1 U1059 ( .B(n949), .A(n948), .S(n37), .Y(n1888) );
  INVX1 U1060 ( .A(buffer[293]), .Y(n948) );
  MUX2X1 U1061 ( .B(n950), .A(n949), .S(n37), .Y(n1886) );
  INVX1 U1062 ( .A(buffer[301]), .Y(n949) );
  MUX2X1 U1063 ( .B(n303), .A(n950), .S(n37), .Y(n1884) );
  INVX1 U1064 ( .A(buffer[309]), .Y(n950) );
  MUX2X1 U1065 ( .B(n304), .A(n303), .S(n37), .Y(n1882) );
  INVX1 U1066 ( .A(buffer[317]), .Y(n303) );
  MUX2X1 U1067 ( .B(n302), .A(n304), .S(n37), .Y(n1880) );
  INVX1 U1068 ( .A(buffer[325]), .Y(n304) );
  MUX2X1 U1069 ( .B(n951), .A(n302), .S(n37), .Y(n1878) );
  INVX1 U1070 ( .A(buffer[333]), .Y(n302) );
  MUX2X1 U1071 ( .B(n952), .A(n951), .S(n36), .Y(n1876) );
  INVX1 U1072 ( .A(buffer[341]), .Y(n951) );
  MUX2X1 U1073 ( .B(n953), .A(n952), .S(n37), .Y(n1874) );
  INVX1 U1074 ( .A(buffer[349]), .Y(n952) );
  MUX2X1 U1075 ( .B(n954), .A(n953), .S(n36), .Y(n1872) );
  INVX1 U1076 ( .A(buffer[357]), .Y(n953) );
  MUX2X1 U1077 ( .B(n955), .A(n954), .S(n36), .Y(n1870) );
  INVX1 U1078 ( .A(buffer[365]), .Y(n954) );
  MUX2X1 U1079 ( .B(n956), .A(n955), .S(n36), .Y(n1868) );
  INVX1 U1080 ( .A(buffer[373]), .Y(n955) );
  MUX2X1 U1081 ( .B(n957), .A(n956), .S(n36), .Y(n1866) );
  INVX1 U1082 ( .A(buffer[381]), .Y(n956) );
  MUX2X1 U1083 ( .B(n958), .A(n957), .S(n36), .Y(n1864) );
  INVX1 U1084 ( .A(buffer[389]), .Y(n957) );
  MUX2X1 U1085 ( .B(n287), .A(n958), .S(n36), .Y(n1862) );
  INVX1 U1086 ( .A(buffer[397]), .Y(n958) );
  MUX2X1 U1087 ( .B(n959), .A(n287), .S(n36), .Y(n1860) );
  INVX1 U1088 ( .A(buffer[405]), .Y(n287) );
  MUX2X1 U1089 ( .B(n960), .A(n959), .S(n36), .Y(n1858) );
  INVX1 U1090 ( .A(buffer[413]), .Y(n959) );
  MUX2X1 U1091 ( .B(n286), .A(n960), .S(n36), .Y(n1856) );
  INVX1 U1092 ( .A(buffer[421]), .Y(n960) );
  MUX2X1 U1093 ( .B(n288), .A(n286), .S(n36), .Y(n1854) );
  INVX1 U1094 ( .A(buffer[429]), .Y(n286) );
  MUX2X1 U1095 ( .B(n961), .A(n288), .S(n36), .Y(n1852) );
  INVX1 U1096 ( .A(buffer[437]), .Y(n288) );
  MUX2X1 U1097 ( .B(n962), .A(n961), .S(n36), .Y(n1850) );
  INVX1 U1098 ( .A(buffer[445]), .Y(n961) );
  MUX2X1 U1099 ( .B(n963), .A(n962), .S(n35), .Y(n1848) );
  INVX1 U1100 ( .A(buffer[453]), .Y(n962) );
  MUX2X1 U1101 ( .B(n964), .A(n963), .S(n35), .Y(n1846) );
  INVX1 U1102 ( .A(buffer[461]), .Y(n963) );
  MUX2X1 U1103 ( .B(n965), .A(n964), .S(n35), .Y(n1844) );
  INVX1 U1104 ( .A(buffer[469]), .Y(n964) );
  MUX2X1 U1105 ( .B(n966), .A(n965), .S(n35), .Y(n1842) );
  INVX1 U1106 ( .A(buffer[477]), .Y(n965) );
  MUX2X1 U1107 ( .B(n967), .A(n966), .S(n35), .Y(n1840) );
  INVX1 U1108 ( .A(buffer[485]), .Y(n966) );
  MUX2X1 U1109 ( .B(n968), .A(n967), .S(n35), .Y(n1838) );
  INVX1 U1110 ( .A(buffer[493]), .Y(n967) );
  MUX2X1 U1111 ( .B(n272), .A(n968), .S(n35), .Y(n1836) );
  INVX1 U1112 ( .A(buffer[501]), .Y(n968) );
  INVX1 U1113 ( .A(buffer[509]), .Y(n272) );
  INVX1 U1114 ( .A(n969), .Y(n1833) );
  MUX2X1 U1115 ( .B(buffer[4]), .A(tx_data[4]), .S(n35), .Y(n969) );
  INVX1 U1116 ( .A(n970), .Y(n1831) );
  MUX2X1 U1117 ( .B(buffer[12]), .A(buffer[4]), .S(n35), .Y(n970) );
  INVX1 U1118 ( .A(n971), .Y(n1829) );
  MUX2X1 U1119 ( .B(buffer[20]), .A(buffer[12]), .S(n35), .Y(n971) );
  INVX1 U1120 ( .A(n972), .Y(n1827) );
  MUX2X1 U1121 ( .B(buffer[28]), .A(buffer[20]), .S(n35), .Y(n972) );
  INVX1 U1122 ( .A(n973), .Y(n1825) );
  MUX2X1 U1123 ( .B(buffer[36]), .A(buffer[28]), .S(n35), .Y(n973) );
  INVX1 U1124 ( .A(n974), .Y(n1823) );
  MUX2X1 U1125 ( .B(buffer[44]), .A(buffer[36]), .S(n34), .Y(n974) );
  INVX1 U1126 ( .A(n975), .Y(n1821) );
  MUX2X1 U1127 ( .B(buffer[52]), .A(buffer[44]), .S(n34), .Y(n975) );
  INVX1 U1128 ( .A(n976), .Y(n1819) );
  MUX2X1 U1129 ( .B(buffer[60]), .A(buffer[52]), .S(n34), .Y(n976) );
  INVX1 U1130 ( .A(n977), .Y(n1817) );
  MUX2X1 U1131 ( .B(buffer[68]), .A(buffer[60]), .S(n34), .Y(n977) );
  INVX1 U1132 ( .A(n978), .Y(n1815) );
  MUX2X1 U1133 ( .B(buffer[76]), .A(buffer[68]), .S(n34), .Y(n978) );
  INVX1 U1134 ( .A(n979), .Y(n1813) );
  MUX2X1 U1135 ( .B(buffer[84]), .A(buffer[76]), .S(n34), .Y(n979) );
  MUX2X1 U1136 ( .B(n407), .A(n980), .S(n34), .Y(n1811) );
  INVX1 U1137 ( .A(buffer[84]), .Y(n980) );
  MUX2X1 U1138 ( .B(n408), .A(n407), .S(n34), .Y(n1809) );
  INVX1 U1139 ( .A(buffer[92]), .Y(n407) );
  MUX2X1 U1140 ( .B(n406), .A(n408), .S(n34), .Y(n1807) );
  INVX1 U1141 ( .A(buffer[100]), .Y(n408) );
  MUX2X1 U1142 ( .B(n981), .A(n406), .S(n34), .Y(n1805) );
  INVX1 U1143 ( .A(buffer[108]), .Y(n406) );
  MUX2X1 U1144 ( .B(n982), .A(n981), .S(n34), .Y(n1803) );
  INVX1 U1145 ( .A(buffer[116]), .Y(n981) );
  MUX2X1 U1146 ( .B(n983), .A(n982), .S(n34), .Y(n1801) );
  INVX1 U1147 ( .A(buffer[124]), .Y(n982) );
  MUX2X1 U1148 ( .B(n984), .A(n983), .S(n34), .Y(n1799) );
  INVX1 U1149 ( .A(buffer[132]), .Y(n983) );
  MUX2X1 U1150 ( .B(n985), .A(n984), .S(n33), .Y(n1797) );
  INVX1 U1151 ( .A(buffer[140]), .Y(n984) );
  MUX2X1 U1152 ( .B(n986), .A(n985), .S(n33), .Y(n1795) );
  INVX1 U1153 ( .A(buffer[148]), .Y(n985) );
  MUX2X1 U1154 ( .B(n987), .A(n986), .S(n33), .Y(n1793) );
  INVX1 U1155 ( .A(buffer[156]), .Y(n986) );
  MUX2X1 U1156 ( .B(n988), .A(n987), .S(n33), .Y(n1791) );
  INVX1 U1157 ( .A(buffer[164]), .Y(n987) );
  MUX2X1 U1158 ( .B(n391), .A(n988), .S(n33), .Y(n1789) );
  INVX1 U1159 ( .A(buffer[172]), .Y(n988) );
  MUX2X1 U1160 ( .B(n989), .A(n391), .S(n33), .Y(n1787) );
  INVX1 U1161 ( .A(buffer[180]), .Y(n391) );
  MUX2X1 U1162 ( .B(n990), .A(n989), .S(n33), .Y(n1785) );
  INVX1 U1163 ( .A(buffer[188]), .Y(n989) );
  MUX2X1 U1164 ( .B(n390), .A(n990), .S(n33), .Y(n1783) );
  INVX1 U1165 ( .A(buffer[196]), .Y(n990) );
  MUX2X1 U1166 ( .B(n392), .A(n390), .S(n33), .Y(n1781) );
  INVX1 U1167 ( .A(buffer[204]), .Y(n390) );
  MUX2X1 U1168 ( .B(n991), .A(n392), .S(n33), .Y(n1779) );
  INVX1 U1169 ( .A(buffer[212]), .Y(n392) );
  MUX2X1 U1170 ( .B(n992), .A(n991), .S(n33), .Y(n1777) );
  INVX1 U1171 ( .A(buffer[220]), .Y(n991) );
  MUX2X1 U1172 ( .B(n993), .A(n992), .S(n33), .Y(n1775) );
  INVX1 U1173 ( .A(buffer[228]), .Y(n992) );
  MUX2X1 U1174 ( .B(n994), .A(n993), .S(n33), .Y(n1773) );
  INVX1 U1175 ( .A(buffer[236]), .Y(n993) );
  MUX2X1 U1176 ( .B(n995), .A(n994), .S(n32), .Y(n1771) );
  INVX1 U1177 ( .A(buffer[244]), .Y(n994) );
  MUX2X1 U1178 ( .B(n996), .A(n995), .S(n32), .Y(n1769) );
  INVX1 U1179 ( .A(buffer[252]), .Y(n995) );
  MUX2X1 U1180 ( .B(n997), .A(n996), .S(n32), .Y(n1767) );
  INVX1 U1181 ( .A(buffer[260]), .Y(n996) );
  MUX2X1 U1182 ( .B(n998), .A(n997), .S(n32), .Y(n1765) );
  INVX1 U1183 ( .A(buffer[268]), .Y(n997) );
  MUX2X1 U1184 ( .B(n999), .A(n998), .S(n32), .Y(n1763) );
  INVX1 U1185 ( .A(buffer[276]), .Y(n998) );
  MUX2X1 U1186 ( .B(n1000), .A(n999), .S(n32), .Y(n1761) );
  INVX1 U1187 ( .A(buffer[284]), .Y(n999) );
  MUX2X1 U1188 ( .B(n1001), .A(n1000), .S(n32), .Y(n1759) );
  INVX1 U1189 ( .A(buffer[292]), .Y(n1000) );
  MUX2X1 U1190 ( .B(n1002), .A(n1001), .S(n32), .Y(n1757) );
  INVX1 U1191 ( .A(buffer[300]), .Y(n1001) );
  MUX2X1 U1192 ( .B(n375), .A(n1002), .S(n32), .Y(n1755) );
  INVX1 U1193 ( .A(buffer[308]), .Y(n1002) );
  MUX2X1 U1194 ( .B(n376), .A(n375), .S(n32), .Y(n1753) );
  INVX1 U1195 ( .A(buffer[316]), .Y(n375) );
  MUX2X1 U1196 ( .B(n374), .A(n376), .S(n32), .Y(n1751) );
  INVX1 U1197 ( .A(buffer[324]), .Y(n376) );
  MUX2X1 U1198 ( .B(n1003), .A(n374), .S(n32), .Y(n1749) );
  INVX1 U1199 ( .A(buffer[332]), .Y(n374) );
  MUX2X1 U1200 ( .B(n1004), .A(n1003), .S(n32), .Y(n1747) );
  INVX1 U1201 ( .A(buffer[340]), .Y(n1003) );
  MUX2X1 U1202 ( .B(n1005), .A(n1004), .S(n31), .Y(n1745) );
  INVX1 U1203 ( .A(buffer[348]), .Y(n1004) );
  MUX2X1 U1204 ( .B(n1006), .A(n1005), .S(n31), .Y(n1743) );
  INVX1 U1205 ( .A(buffer[356]), .Y(n1005) );
  MUX2X1 U1206 ( .B(n1007), .A(n1006), .S(n31), .Y(n1741) );
  INVX1 U1207 ( .A(buffer[364]), .Y(n1006) );
  MUX2X1 U1208 ( .B(n1008), .A(n1007), .S(n31), .Y(n1739) );
  INVX1 U1209 ( .A(buffer[372]), .Y(n1007) );
  MUX2X1 U1210 ( .B(n1009), .A(n1008), .S(n31), .Y(n1737) );
  INVX1 U1211 ( .A(buffer[380]), .Y(n1008) );
  MUX2X1 U1212 ( .B(n1010), .A(n1009), .S(n31), .Y(n1735) );
  INVX1 U1213 ( .A(buffer[388]), .Y(n1009) );
  MUX2X1 U1214 ( .B(n359), .A(n1010), .S(n31), .Y(n1733) );
  INVX1 U1215 ( .A(buffer[396]), .Y(n1010) );
  MUX2X1 U1216 ( .B(n1011), .A(n359), .S(n31), .Y(n1731) );
  INVX1 U1217 ( .A(buffer[404]), .Y(n359) );
  MUX2X1 U1218 ( .B(n1012), .A(n1011), .S(n31), .Y(n1729) );
  INVX1 U1219 ( .A(buffer[412]), .Y(n1011) );
  MUX2X1 U1220 ( .B(n358), .A(n1012), .S(n31), .Y(n1727) );
  INVX1 U1221 ( .A(buffer[420]), .Y(n1012) );
  MUX2X1 U1222 ( .B(n360), .A(n358), .S(n31), .Y(n1725) );
  INVX1 U1223 ( .A(buffer[428]), .Y(n358) );
  MUX2X1 U1224 ( .B(n1013), .A(n360), .S(n31), .Y(n1723) );
  INVX1 U1225 ( .A(buffer[436]), .Y(n360) );
  MUX2X1 U1226 ( .B(n1014), .A(n1013), .S(n31), .Y(n1721) );
  INVX1 U1227 ( .A(buffer[444]), .Y(n1013) );
  MUX2X1 U1228 ( .B(n1015), .A(n1014), .S(n30), .Y(n1719) );
  INVX1 U1229 ( .A(buffer[452]), .Y(n1014) );
  MUX2X1 U1230 ( .B(n1016), .A(n1015), .S(n30), .Y(n1717) );
  INVX1 U1231 ( .A(buffer[460]), .Y(n1015) );
  MUX2X1 U1232 ( .B(n1017), .A(n1016), .S(n30), .Y(n1715) );
  INVX1 U1233 ( .A(buffer[468]), .Y(n1016) );
  MUX2X1 U1234 ( .B(n1018), .A(n1017), .S(n30), .Y(n1713) );
  INVX1 U1235 ( .A(buffer[476]), .Y(n1017) );
  MUX2X1 U1236 ( .B(n1019), .A(n1018), .S(n30), .Y(n1711) );
  INVX1 U1237 ( .A(buffer[484]), .Y(n1018) );
  MUX2X1 U1238 ( .B(n1020), .A(n1019), .S(n35), .Y(n1709) );
  INVX1 U1239 ( .A(buffer[492]), .Y(n1019) );
  MUX2X1 U1240 ( .B(n344), .A(n1020), .S(n10), .Y(n1707) );
  INVX1 U1241 ( .A(buffer[500]), .Y(n1020) );
  INVX1 U1242 ( .A(buffer[508]), .Y(n344) );
  INVX1 U1243 ( .A(n1021), .Y(n1704) );
  MUX2X1 U1244 ( .B(buffer[3]), .A(tx_data[3]), .S(n10), .Y(n1021) );
  INVX1 U1245 ( .A(n1022), .Y(n1702) );
  MUX2X1 U1246 ( .B(buffer[11]), .A(buffer[3]), .S(n10), .Y(n1022) );
  INVX1 U1247 ( .A(n1023), .Y(n1700) );
  MUX2X1 U1248 ( .B(buffer[19]), .A(buffer[11]), .S(n10), .Y(n1023) );
  INVX1 U1249 ( .A(n1024), .Y(n1698) );
  MUX2X1 U1250 ( .B(buffer[27]), .A(buffer[19]), .S(n10), .Y(n1024) );
  INVX1 U1251 ( .A(n1025), .Y(n1696) );
  MUX2X1 U1252 ( .B(buffer[35]), .A(buffer[27]), .S(n10), .Y(n1025) );
  INVX1 U1253 ( .A(n1026), .Y(n1694) );
  MUX2X1 U1254 ( .B(buffer[43]), .A(buffer[35]), .S(n10), .Y(n1026) );
  INVX1 U1255 ( .A(n1027), .Y(n1692) );
  MUX2X1 U1256 ( .B(buffer[51]), .A(buffer[43]), .S(n10), .Y(n1027) );
  INVX1 U1257 ( .A(n1028), .Y(n1690) );
  MUX2X1 U1258 ( .B(buffer[59]), .A(buffer[51]), .S(n10), .Y(n1028) );
  INVX1 U1259 ( .A(n1029), .Y(n1688) );
  MUX2X1 U1260 ( .B(buffer[67]), .A(buffer[59]), .S(n10), .Y(n1029) );
  INVX1 U1261 ( .A(n1030), .Y(n1686) );
  MUX2X1 U1262 ( .B(buffer[75]), .A(buffer[67]), .S(n10), .Y(n1030) );
  INVX1 U1263 ( .A(n1031), .Y(n1684) );
  MUX2X1 U1264 ( .B(buffer[83]), .A(buffer[75]), .S(n10), .Y(n1031) );
  MUX2X1 U1265 ( .B(n479), .A(n1032), .S(n9), .Y(n1682) );
  INVX1 U1266 ( .A(buffer[83]), .Y(n1032) );
  MUX2X1 U1267 ( .B(n480), .A(n479), .S(n9), .Y(n1680) );
  INVX1 U1268 ( .A(buffer[91]), .Y(n479) );
  MUX2X1 U1269 ( .B(n478), .A(n480), .S(n9), .Y(n1678) );
  INVX1 U1270 ( .A(buffer[99]), .Y(n480) );
  MUX2X1 U1271 ( .B(n1033), .A(n478), .S(n9), .Y(n1676) );
  INVX1 U1272 ( .A(buffer[107]), .Y(n478) );
  MUX2X1 U1273 ( .B(n1034), .A(n1033), .S(n9), .Y(n1674) );
  INVX1 U1274 ( .A(buffer[115]), .Y(n1033) );
  MUX2X1 U1275 ( .B(n1035), .A(n1034), .S(n9), .Y(n1672) );
  INVX1 U1276 ( .A(buffer[123]), .Y(n1034) );
  MUX2X1 U1277 ( .B(n1036), .A(n1035), .S(n9), .Y(n1670) );
  INVX1 U1278 ( .A(buffer[131]), .Y(n1035) );
  MUX2X1 U1279 ( .B(n1037), .A(n1036), .S(n9), .Y(n1668) );
  INVX1 U1280 ( .A(buffer[139]), .Y(n1036) );
  MUX2X1 U1281 ( .B(n1038), .A(n1037), .S(n9), .Y(n1666) );
  INVX1 U1282 ( .A(buffer[147]), .Y(n1037) );
  MUX2X1 U1283 ( .B(n1039), .A(n1038), .S(n9), .Y(n1664) );
  INVX1 U1284 ( .A(buffer[155]), .Y(n1038) );
  MUX2X1 U1285 ( .B(n1040), .A(n1039), .S(n9), .Y(n1662) );
  INVX1 U1286 ( .A(buffer[163]), .Y(n1039) );
  MUX2X1 U1287 ( .B(n463), .A(n1040), .S(n9), .Y(n1660) );
  INVX1 U1288 ( .A(buffer[171]), .Y(n1040) );
  MUX2X1 U1289 ( .B(n1041), .A(n463), .S(n9), .Y(n1658) );
  INVX1 U1290 ( .A(buffer[179]), .Y(n463) );
  MUX2X1 U1291 ( .B(n1042), .A(n1041), .S(n8), .Y(n1656) );
  INVX1 U1292 ( .A(buffer[187]), .Y(n1041) );
  MUX2X1 U1293 ( .B(n462), .A(n1042), .S(n8), .Y(n1654) );
  INVX1 U1294 ( .A(buffer[195]), .Y(n1042) );
  MUX2X1 U1295 ( .B(n464), .A(n462), .S(n8), .Y(n1652) );
  INVX1 U1296 ( .A(buffer[203]), .Y(n462) );
  MUX2X1 U1297 ( .B(n1043), .A(n464), .S(n8), .Y(n1650) );
  INVX1 U1298 ( .A(buffer[211]), .Y(n464) );
  MUX2X1 U1299 ( .B(n1044), .A(n1043), .S(n8), .Y(n1648) );
  INVX1 U1300 ( .A(buffer[219]), .Y(n1043) );
  MUX2X1 U1301 ( .B(n1045), .A(n1044), .S(n8), .Y(n1646) );
  INVX1 U1302 ( .A(buffer[227]), .Y(n1044) );
  MUX2X1 U1303 ( .B(n1046), .A(n1045), .S(n8), .Y(n1644) );
  INVX1 U1304 ( .A(buffer[235]), .Y(n1045) );
  MUX2X1 U1305 ( .B(n1047), .A(n1046), .S(n8), .Y(n1642) );
  INVX1 U1306 ( .A(buffer[243]), .Y(n1046) );
  MUX2X1 U1307 ( .B(n1048), .A(n1047), .S(n8), .Y(n1640) );
  INVX1 U1308 ( .A(buffer[251]), .Y(n1047) );
  MUX2X1 U1309 ( .B(n1049), .A(n1048), .S(n8), .Y(n1638) );
  INVX1 U1310 ( .A(buffer[259]), .Y(n1048) );
  MUX2X1 U1311 ( .B(n1050), .A(n1049), .S(n8), .Y(n1636) );
  INVX1 U1312 ( .A(buffer[267]), .Y(n1049) );
  MUX2X1 U1313 ( .B(n1051), .A(n1050), .S(n8), .Y(n1634) );
  INVX1 U1314 ( .A(buffer[275]), .Y(n1050) );
  MUX2X1 U1315 ( .B(n1052), .A(n1051), .S(n8), .Y(n1632) );
  INVX1 U1316 ( .A(buffer[283]), .Y(n1051) );
  MUX2X1 U1317 ( .B(n1053), .A(n1052), .S(n7), .Y(n1630) );
  INVX1 U1318 ( .A(buffer[291]), .Y(n1052) );
  MUX2X1 U1319 ( .B(n1054), .A(n1053), .S(n7), .Y(n1628) );
  INVX1 U1320 ( .A(buffer[299]), .Y(n1053) );
  MUX2X1 U1321 ( .B(n447), .A(n1054), .S(n7), .Y(n1626) );
  INVX1 U1322 ( .A(buffer[307]), .Y(n1054) );
  MUX2X1 U1323 ( .B(n448), .A(n447), .S(n7), .Y(n1624) );
  INVX1 U1324 ( .A(buffer[315]), .Y(n447) );
  MUX2X1 U1325 ( .B(n446), .A(n448), .S(n7), .Y(n1622) );
  INVX1 U1326 ( .A(buffer[323]), .Y(n448) );
  MUX2X1 U1327 ( .B(n1055), .A(n446), .S(n7), .Y(n1620) );
  INVX1 U1328 ( .A(buffer[331]), .Y(n446) );
  MUX2X1 U1329 ( .B(n1056), .A(n1055), .S(n7), .Y(n1618) );
  INVX1 U1330 ( .A(buffer[339]), .Y(n1055) );
  MUX2X1 U1331 ( .B(n1057), .A(n1056), .S(n7), .Y(n1616) );
  INVX1 U1332 ( .A(buffer[347]), .Y(n1056) );
  MUX2X1 U1333 ( .B(n1058), .A(n1057), .S(n7), .Y(n1614) );
  INVX1 U1334 ( .A(buffer[355]), .Y(n1057) );
  MUX2X1 U1335 ( .B(n1059), .A(n1058), .S(n7), .Y(n1612) );
  INVX1 U1336 ( .A(buffer[363]), .Y(n1058) );
  MUX2X1 U1337 ( .B(n1060), .A(n1059), .S(n7), .Y(n1610) );
  INVX1 U1338 ( .A(buffer[371]), .Y(n1059) );
  MUX2X1 U1339 ( .B(n1061), .A(n1060), .S(n7), .Y(n1608) );
  INVX1 U1340 ( .A(buffer[379]), .Y(n1060) );
  MUX2X1 U1341 ( .B(n1062), .A(n1061), .S(n7), .Y(n1606) );
  INVX1 U1342 ( .A(buffer[387]), .Y(n1061) );
  MUX2X1 U1343 ( .B(n431), .A(n1062), .S(n6), .Y(n1604) );
  INVX1 U1344 ( .A(buffer[395]), .Y(n1062) );
  MUX2X1 U1345 ( .B(n1063), .A(n431), .S(n6), .Y(n1602) );
  INVX1 U1346 ( .A(buffer[403]), .Y(n431) );
  MUX2X1 U1347 ( .B(n1064), .A(n1063), .S(n6), .Y(n1600) );
  INVX1 U1348 ( .A(buffer[411]), .Y(n1063) );
  MUX2X1 U1349 ( .B(n430), .A(n1064), .S(n6), .Y(n1598) );
  INVX1 U1350 ( .A(buffer[419]), .Y(n1064) );
  MUX2X1 U1351 ( .B(n432), .A(n430), .S(n6), .Y(n1596) );
  INVX1 U1352 ( .A(buffer[427]), .Y(n430) );
  MUX2X1 U1353 ( .B(n1065), .A(n432), .S(n6), .Y(n1594) );
  INVX1 U1354 ( .A(buffer[435]), .Y(n432) );
  MUX2X1 U1355 ( .B(n1066), .A(n1065), .S(n6), .Y(n1592) );
  INVX1 U1356 ( .A(buffer[443]), .Y(n1065) );
  MUX2X1 U1357 ( .B(n1067), .A(n1066), .S(n6), .Y(n1590) );
  INVX1 U1358 ( .A(buffer[451]), .Y(n1066) );
  MUX2X1 U1359 ( .B(n1068), .A(n1067), .S(n6), .Y(n1588) );
  INVX1 U1360 ( .A(buffer[459]), .Y(n1067) );
  MUX2X1 U1361 ( .B(n1069), .A(n1068), .S(n6), .Y(n1586) );
  INVX1 U1362 ( .A(buffer[467]), .Y(n1068) );
  MUX2X1 U1363 ( .B(n1070), .A(n1069), .S(n6), .Y(n1584) );
  INVX1 U1364 ( .A(buffer[475]), .Y(n1069) );
  MUX2X1 U1365 ( .B(n1071), .A(n1070), .S(n6), .Y(n1582) );
  INVX1 U1366 ( .A(buffer[483]), .Y(n1070) );
  MUX2X1 U1367 ( .B(n1072), .A(n1071), .S(n6), .Y(n1580) );
  INVX1 U1368 ( .A(buffer[491]), .Y(n1071) );
  MUX2X1 U1369 ( .B(n416), .A(n1072), .S(n5), .Y(n1578) );
  INVX1 U1370 ( .A(buffer[499]), .Y(n1072) );
  INVX1 U1371 ( .A(buffer[507]), .Y(n416) );
  INVX1 U1372 ( .A(n1073), .Y(n1575) );
  MUX2X1 U1373 ( .B(buffer[2]), .A(tx_data[2]), .S(n5), .Y(n1073) );
  INVX1 U1374 ( .A(n1074), .Y(n1573) );
  MUX2X1 U1375 ( .B(buffer[10]), .A(buffer[2]), .S(n5), .Y(n1074) );
  INVX1 U1376 ( .A(n1075), .Y(n1571) );
  MUX2X1 U1377 ( .B(buffer[18]), .A(buffer[10]), .S(n5), .Y(n1075) );
  INVX1 U1378 ( .A(n1076), .Y(n1569) );
  MUX2X1 U1379 ( .B(buffer[26]), .A(buffer[18]), .S(n5), .Y(n1076) );
  INVX1 U1380 ( .A(n1077), .Y(n1567) );
  MUX2X1 U1381 ( .B(buffer[34]), .A(buffer[26]), .S(n5), .Y(n1077) );
  INVX1 U1382 ( .A(n1078), .Y(n1565) );
  MUX2X1 U1383 ( .B(buffer[42]), .A(buffer[34]), .S(n5), .Y(n1078) );
  INVX1 U1384 ( .A(n1079), .Y(n1563) );
  MUX2X1 U1385 ( .B(buffer[50]), .A(buffer[42]), .S(n5), .Y(n1079) );
  INVX1 U1386 ( .A(n1080), .Y(n1561) );
  MUX2X1 U1387 ( .B(buffer[58]), .A(buffer[50]), .S(n5), .Y(n1080) );
  INVX1 U1388 ( .A(n1081), .Y(n1559) );
  MUX2X1 U1389 ( .B(buffer[66]), .A(buffer[58]), .S(n5), .Y(n1081) );
  INVX1 U1390 ( .A(n1082), .Y(n1557) );
  MUX2X1 U1391 ( .B(buffer[74]), .A(buffer[66]), .S(n5), .Y(n1082) );
  INVX1 U1392 ( .A(n1083), .Y(n1555) );
  MUX2X1 U1393 ( .B(buffer[82]), .A(buffer[74]), .S(n5), .Y(n1083) );
  MUX2X1 U1394 ( .B(n551), .A(n1084), .S(n4), .Y(n1553) );
  INVX1 U1395 ( .A(buffer[82]), .Y(n1084) );
  MUX2X1 U1396 ( .B(n552), .A(n551), .S(n4), .Y(n1551) );
  INVX1 U1397 ( .A(buffer[90]), .Y(n551) );
  MUX2X1 U1398 ( .B(n550), .A(n552), .S(n4), .Y(n1549) );
  INVX1 U1399 ( .A(buffer[98]), .Y(n552) );
  MUX2X1 U1400 ( .B(n1085), .A(n550), .S(n4), .Y(n1547) );
  INVX1 U1401 ( .A(buffer[106]), .Y(n550) );
  MUX2X1 U1402 ( .B(n1086), .A(n1085), .S(n4), .Y(n1545) );
  INVX1 U1403 ( .A(buffer[114]), .Y(n1085) );
  MUX2X1 U1404 ( .B(n1087), .A(n1086), .S(n4), .Y(n1543) );
  INVX1 U1405 ( .A(buffer[122]), .Y(n1086) );
  MUX2X1 U1406 ( .B(n1088), .A(n1087), .S(n4), .Y(n1541) );
  INVX1 U1407 ( .A(buffer[130]), .Y(n1087) );
  MUX2X1 U1408 ( .B(n1089), .A(n1088), .S(n4), .Y(n1539) );
  INVX1 U1409 ( .A(buffer[138]), .Y(n1088) );
  MUX2X1 U1410 ( .B(n1090), .A(n1089), .S(n4), .Y(n1537) );
  INVX1 U1411 ( .A(buffer[146]), .Y(n1089) );
  MUX2X1 U1412 ( .B(n1091), .A(n1090), .S(n4), .Y(n1535) );
  INVX1 U1413 ( .A(buffer[154]), .Y(n1090) );
  MUX2X1 U1414 ( .B(n1092), .A(n1091), .S(n4), .Y(n1533) );
  INVX1 U1415 ( .A(buffer[162]), .Y(n1091) );
  MUX2X1 U1416 ( .B(n535), .A(n1092), .S(n4), .Y(n1531) );
  INVX1 U1417 ( .A(buffer[170]), .Y(n1092) );
  MUX2X1 U1418 ( .B(n1093), .A(n535), .S(n4), .Y(n1529) );
  INVX1 U1419 ( .A(buffer[178]), .Y(n535) );
  MUX2X1 U1420 ( .B(n1094), .A(n1093), .S(n3), .Y(n1527) );
  INVX1 U1421 ( .A(buffer[186]), .Y(n1093) );
  MUX2X1 U1422 ( .B(n534), .A(n1094), .S(n3), .Y(n1525) );
  INVX1 U1423 ( .A(buffer[194]), .Y(n1094) );
  MUX2X1 U1424 ( .B(n536), .A(n534), .S(n3), .Y(n1523) );
  INVX1 U1425 ( .A(buffer[202]), .Y(n534) );
  MUX2X1 U1426 ( .B(n1095), .A(n536), .S(n3), .Y(n1521) );
  INVX1 U1427 ( .A(buffer[210]), .Y(n536) );
  MUX2X1 U1428 ( .B(n1096), .A(n1095), .S(n3), .Y(n1519) );
  INVX1 U1429 ( .A(buffer[218]), .Y(n1095) );
  MUX2X1 U1430 ( .B(n1097), .A(n1096), .S(n3), .Y(n1517) );
  INVX1 U1431 ( .A(buffer[226]), .Y(n1096) );
  MUX2X1 U1432 ( .B(n1098), .A(n1097), .S(n3), .Y(n1515) );
  INVX1 U1433 ( .A(buffer[234]), .Y(n1097) );
  MUX2X1 U1434 ( .B(n1099), .A(n1098), .S(n3), .Y(n1513) );
  INVX1 U1435 ( .A(buffer[242]), .Y(n1098) );
  MUX2X1 U1436 ( .B(n1100), .A(n1099), .S(n3), .Y(n1511) );
  INVX1 U1437 ( .A(buffer[250]), .Y(n1099) );
  MUX2X1 U1438 ( .B(n1101), .A(n1100), .S(n3), .Y(n1509) );
  INVX1 U1439 ( .A(buffer[258]), .Y(n1100) );
  MUX2X1 U1440 ( .B(n1102), .A(n1101), .S(n3), .Y(n1507) );
  INVX1 U1441 ( .A(buffer[266]), .Y(n1101) );
  MUX2X1 U1442 ( .B(n1103), .A(n1102), .S(n3), .Y(n1505) );
  INVX1 U1443 ( .A(buffer[274]), .Y(n1102) );
  MUX2X1 U1444 ( .B(n1104), .A(n1103), .S(n3), .Y(n1503) );
  INVX1 U1445 ( .A(buffer[282]), .Y(n1103) );
  MUX2X1 U1446 ( .B(n1105), .A(n1104), .S(n2), .Y(n1501) );
  INVX1 U1447 ( .A(buffer[290]), .Y(n1104) );
  MUX2X1 U1448 ( .B(n1106), .A(n1105), .S(n2), .Y(n1499) );
  INVX1 U1449 ( .A(buffer[298]), .Y(n1105) );
  MUX2X1 U1450 ( .B(n519), .A(n1106), .S(n2), .Y(n1497) );
  INVX1 U1451 ( .A(buffer[306]), .Y(n1106) );
  MUX2X1 U1452 ( .B(n520), .A(n519), .S(n2), .Y(n1495) );
  INVX1 U1453 ( .A(buffer[314]), .Y(n519) );
  MUX2X1 U1454 ( .B(n518), .A(n520), .S(n2), .Y(n1493) );
  INVX1 U1455 ( .A(buffer[322]), .Y(n520) );
  MUX2X1 U1456 ( .B(n1107), .A(n518), .S(n2), .Y(n1491) );
  INVX1 U1457 ( .A(buffer[330]), .Y(n518) );
  MUX2X1 U1458 ( .B(n1108), .A(n1107), .S(n2), .Y(n1489) );
  INVX1 U1459 ( .A(buffer[338]), .Y(n1107) );
  MUX2X1 U1460 ( .B(n1109), .A(n1108), .S(n2), .Y(n1487) );
  INVX1 U1461 ( .A(buffer[346]), .Y(n1108) );
  MUX2X1 U1462 ( .B(n1110), .A(n1109), .S(n2), .Y(n1485) );
  INVX1 U1463 ( .A(buffer[354]), .Y(n1109) );
  MUX2X1 U1464 ( .B(n1111), .A(n1110), .S(n2), .Y(n1483) );
  INVX1 U1465 ( .A(buffer[362]), .Y(n1110) );
  MUX2X1 U1466 ( .B(n1112), .A(n1111), .S(n2), .Y(n1481) );
  INVX1 U1467 ( .A(buffer[370]), .Y(n1111) );
  MUX2X1 U1468 ( .B(n1113), .A(n1112), .S(n2), .Y(n1479) );
  INVX1 U1469 ( .A(buffer[378]), .Y(n1112) );
  MUX2X1 U1470 ( .B(n1114), .A(n1113), .S(n2), .Y(n1477) );
  INVX1 U1471 ( .A(buffer[386]), .Y(n1113) );
  MUX2X1 U1472 ( .B(n503), .A(n1114), .S(n1), .Y(n1475) );
  INVX1 U1473 ( .A(buffer[394]), .Y(n1114) );
  MUX2X1 U1474 ( .B(n1115), .A(n503), .S(n1), .Y(n1473) );
  INVX1 U1475 ( .A(buffer[402]), .Y(n503) );
  MUX2X1 U1476 ( .B(n1116), .A(n1115), .S(n1), .Y(n1471) );
  INVX1 U1477 ( .A(buffer[410]), .Y(n1115) );
  MUX2X1 U1478 ( .B(n502), .A(n1116), .S(n1), .Y(n1469) );
  INVX1 U1479 ( .A(buffer[418]), .Y(n1116) );
  MUX2X1 U1480 ( .B(n504), .A(n502), .S(n1), .Y(n1467) );
  INVX1 U1481 ( .A(buffer[426]), .Y(n502) );
  MUX2X1 U1482 ( .B(n1117), .A(n504), .S(n1), .Y(n1465) );
  INVX1 U1483 ( .A(buffer[434]), .Y(n504) );
  MUX2X1 U1484 ( .B(n1118), .A(n1117), .S(n1), .Y(n1463) );
  INVX1 U1485 ( .A(buffer[442]), .Y(n1117) );
  MUX2X1 U1486 ( .B(n1119), .A(n1118), .S(n1), .Y(n1461) );
  INVX1 U1487 ( .A(buffer[450]), .Y(n1118) );
  MUX2X1 U1488 ( .B(n1120), .A(n1119), .S(n1), .Y(n1459) );
  INVX1 U1489 ( .A(buffer[458]), .Y(n1119) );
  MUX2X1 U1490 ( .B(n1121), .A(n1120), .S(n1), .Y(n1457) );
  INVX1 U1491 ( .A(buffer[466]), .Y(n1120) );
  MUX2X1 U1492 ( .B(n1122), .A(n1121), .S(n1), .Y(n1455) );
  INVX1 U1493 ( .A(buffer[474]), .Y(n1121) );
  MUX2X1 U1494 ( .B(n1123), .A(n1122), .S(n1), .Y(n1453) );
  INVX1 U1495 ( .A(buffer[482]), .Y(n1122) );
  MUX2X1 U1496 ( .B(n1124), .A(n1123), .S(n5), .Y(n1451) );
  INVX1 U1497 ( .A(buffer[490]), .Y(n1123) );
  MUX2X1 U1498 ( .B(n488), .A(n1124), .S(n20), .Y(n1449) );
  INVX1 U1499 ( .A(buffer[498]), .Y(n1124) );
  INVX1 U1500 ( .A(buffer[506]), .Y(n488) );
  INVX1 U1501 ( .A(n1125), .Y(n1446) );
  MUX2X1 U1502 ( .B(buffer[1]), .A(tx_data[1]), .S(n20), .Y(n1125) );
  INVX1 U1503 ( .A(n1126), .Y(n1444) );
  MUX2X1 U1504 ( .B(buffer[9]), .A(buffer[1]), .S(n20), .Y(n1126) );
  INVX1 U1505 ( .A(n1127), .Y(n1442) );
  MUX2X1 U1506 ( .B(buffer[17]), .A(buffer[9]), .S(n20), .Y(n1127) );
  INVX1 U1507 ( .A(n1128), .Y(n1440) );
  MUX2X1 U1508 ( .B(buffer[25]), .A(buffer[17]), .S(n20), .Y(n1128) );
  INVX1 U1509 ( .A(n1129), .Y(n1438) );
  MUX2X1 U1510 ( .B(buffer[33]), .A(buffer[25]), .S(n20), .Y(n1129) );
  INVX1 U1511 ( .A(n1130), .Y(n1436) );
  MUX2X1 U1512 ( .B(buffer[41]), .A(buffer[33]), .S(n20), .Y(n1130) );
  INVX1 U1513 ( .A(n1131), .Y(n1434) );
  MUX2X1 U1514 ( .B(buffer[49]), .A(buffer[41]), .S(n20), .Y(n1131) );
  INVX1 U1515 ( .A(n1132), .Y(n1432) );
  MUX2X1 U1516 ( .B(buffer[57]), .A(buffer[49]), .S(n20), .Y(n1132) );
  INVX1 U1517 ( .A(n1133), .Y(n1430) );
  MUX2X1 U1518 ( .B(buffer[65]), .A(buffer[57]), .S(n19), .Y(n1133) );
  INVX1 U1519 ( .A(n1134), .Y(n1428) );
  MUX2X1 U1520 ( .B(buffer[73]), .A(buffer[65]), .S(n19), .Y(n1134) );
  INVX1 U1521 ( .A(n1135), .Y(n1426) );
  MUX2X1 U1522 ( .B(buffer[81]), .A(buffer[73]), .S(n19), .Y(n1135) );
  MUX2X1 U1523 ( .B(n623), .A(n1136), .S(n19), .Y(n1424) );
  INVX1 U1524 ( .A(buffer[81]), .Y(n1136) );
  MUX2X1 U1525 ( .B(n624), .A(n623), .S(n19), .Y(n1422) );
  INVX1 U1526 ( .A(buffer[89]), .Y(n623) );
  MUX2X1 U1527 ( .B(n622), .A(n624), .S(n19), .Y(n1420) );
  INVX1 U1528 ( .A(buffer[97]), .Y(n624) );
  MUX2X1 U1529 ( .B(n1137), .A(n622), .S(n19), .Y(n1418) );
  INVX1 U1530 ( .A(buffer[105]), .Y(n622) );
  MUX2X1 U1531 ( .B(n1138), .A(n1137), .S(n19), .Y(n1416) );
  INVX1 U1532 ( .A(buffer[113]), .Y(n1137) );
  MUX2X1 U1533 ( .B(n1139), .A(n1138), .S(n19), .Y(n1414) );
  INVX1 U1534 ( .A(buffer[121]), .Y(n1138) );
  MUX2X1 U1535 ( .B(n1140), .A(n1139), .S(n19), .Y(n1412) );
  INVX1 U1536 ( .A(buffer[129]), .Y(n1139) );
  MUX2X1 U1537 ( .B(n1141), .A(n1140), .S(n19), .Y(n1410) );
  INVX1 U1538 ( .A(buffer[137]), .Y(n1140) );
  MUX2X1 U1539 ( .B(n1142), .A(n1141), .S(n19), .Y(n1408) );
  INVX1 U1540 ( .A(buffer[145]), .Y(n1141) );
  MUX2X1 U1541 ( .B(n1143), .A(n1142), .S(n19), .Y(n1406) );
  INVX1 U1542 ( .A(buffer[153]), .Y(n1142) );
  MUX2X1 U1543 ( .B(n1144), .A(n1143), .S(n18), .Y(n1404) );
  INVX1 U1544 ( .A(buffer[161]), .Y(n1143) );
  MUX2X1 U1545 ( .B(n607), .A(n1144), .S(n18), .Y(n1402) );
  INVX1 U1546 ( .A(buffer[169]), .Y(n1144) );
  MUX2X1 U1547 ( .B(n1145), .A(n607), .S(n18), .Y(n1400) );
  INVX1 U1548 ( .A(buffer[177]), .Y(n607) );
  MUX2X1 U1549 ( .B(n1146), .A(n1145), .S(n18), .Y(n1398) );
  INVX1 U1550 ( .A(buffer[185]), .Y(n1145) );
  MUX2X1 U1551 ( .B(n606), .A(n1146), .S(n18), .Y(n1396) );
  INVX1 U1552 ( .A(buffer[193]), .Y(n1146) );
  MUX2X1 U1553 ( .B(n608), .A(n606), .S(n18), .Y(n1394) );
  INVX1 U1554 ( .A(buffer[201]), .Y(n606) );
  MUX2X1 U1555 ( .B(n1147), .A(n608), .S(n18), .Y(n1392) );
  INVX1 U1556 ( .A(buffer[209]), .Y(n608) );
  MUX2X1 U1557 ( .B(n1148), .A(n1147), .S(n18), .Y(n1390) );
  INVX1 U1558 ( .A(buffer[217]), .Y(n1147) );
  MUX2X1 U1559 ( .B(n1149), .A(n1148), .S(n18), .Y(n1388) );
  INVX1 U1560 ( .A(buffer[225]), .Y(n1148) );
  MUX2X1 U1561 ( .B(n1150), .A(n1149), .S(n18), .Y(n1386) );
  INVX1 U1562 ( .A(buffer[233]), .Y(n1149) );
  MUX2X1 U1563 ( .B(n1151), .A(n1150), .S(n18), .Y(n1384) );
  INVX1 U1564 ( .A(buffer[241]), .Y(n1150) );
  MUX2X1 U1565 ( .B(n1152), .A(n1151), .S(n18), .Y(n1382) );
  INVX1 U1566 ( .A(buffer[249]), .Y(n1151) );
  MUX2X1 U1567 ( .B(n1153), .A(n1152), .S(n18), .Y(n1380) );
  INVX1 U1568 ( .A(buffer[257]), .Y(n1152) );
  MUX2X1 U1569 ( .B(n1154), .A(n1153), .S(n17), .Y(n1378) );
  INVX1 U1570 ( .A(buffer[265]), .Y(n1153) );
  MUX2X1 U1571 ( .B(n1155), .A(n1154), .S(n17), .Y(n1376) );
  INVX1 U1572 ( .A(buffer[273]), .Y(n1154) );
  MUX2X1 U1573 ( .B(n1156), .A(n1155), .S(n17), .Y(n1374) );
  INVX1 U1574 ( .A(buffer[281]), .Y(n1155) );
  MUX2X1 U1575 ( .B(n1157), .A(n1156), .S(n17), .Y(n1372) );
  INVX1 U1576 ( .A(buffer[289]), .Y(n1156) );
  MUX2X1 U1577 ( .B(n1158), .A(n1157), .S(n17), .Y(n1370) );
  INVX1 U1578 ( .A(buffer[297]), .Y(n1157) );
  MUX2X1 U1579 ( .B(n591), .A(n1158), .S(n17), .Y(n1368) );
  INVX1 U1580 ( .A(buffer[305]), .Y(n1158) );
  MUX2X1 U1581 ( .B(n592), .A(n591), .S(n17), .Y(n1366) );
  INVX1 U1582 ( .A(buffer[313]), .Y(n591) );
  MUX2X1 U1583 ( .B(n590), .A(n592), .S(n17), .Y(n1364) );
  INVX1 U1584 ( .A(buffer[321]), .Y(n592) );
  MUX2X1 U1585 ( .B(n1159), .A(n590), .S(n17), .Y(n1362) );
  INVX1 U1586 ( .A(buffer[329]), .Y(n590) );
  MUX2X1 U1587 ( .B(n1160), .A(n1159), .S(n17), .Y(n1360) );
  INVX1 U1588 ( .A(buffer[337]), .Y(n1159) );
  MUX2X1 U1589 ( .B(n1161), .A(n1160), .S(n17), .Y(n1358) );
  INVX1 U1590 ( .A(buffer[345]), .Y(n1160) );
  MUX2X1 U1591 ( .B(n1162), .A(n1161), .S(n17), .Y(n1356) );
  INVX1 U1592 ( .A(buffer[353]), .Y(n1161) );
  MUX2X1 U1593 ( .B(n1163), .A(n1162), .S(n17), .Y(n1354) );
  INVX1 U1594 ( .A(buffer[361]), .Y(n1162) );
  MUX2X1 U1595 ( .B(n1164), .A(n1163), .S(n16), .Y(n1352) );
  INVX1 U1596 ( .A(buffer[369]), .Y(n1163) );
  MUX2X1 U1597 ( .B(n1165), .A(n1164), .S(n16), .Y(n1350) );
  INVX1 U1598 ( .A(buffer[377]), .Y(n1164) );
  MUX2X1 U1599 ( .B(n1166), .A(n1165), .S(n16), .Y(n1348) );
  INVX1 U1600 ( .A(buffer[385]), .Y(n1165) );
  MUX2X1 U1601 ( .B(n575), .A(n1166), .S(n16), .Y(n1346) );
  INVX1 U1602 ( .A(buffer[393]), .Y(n1166) );
  MUX2X1 U1603 ( .B(n1167), .A(n575), .S(n16), .Y(n1344) );
  INVX1 U1604 ( .A(buffer[401]), .Y(n575) );
  MUX2X1 U1605 ( .B(n1168), .A(n1167), .S(n16), .Y(n1342) );
  INVX1 U1606 ( .A(buffer[409]), .Y(n1167) );
  MUX2X1 U1607 ( .B(n574), .A(n1168), .S(n16), .Y(n1340) );
  INVX1 U1608 ( .A(buffer[417]), .Y(n1168) );
  MUX2X1 U1609 ( .B(n576), .A(n574), .S(n16), .Y(n1338) );
  INVX1 U1610 ( .A(buffer[425]), .Y(n574) );
  MUX2X1 U1611 ( .B(n1169), .A(n576), .S(n16), .Y(n1336) );
  INVX1 U1612 ( .A(buffer[433]), .Y(n576) );
  MUX2X1 U1613 ( .B(n1170), .A(n1169), .S(n16), .Y(n1334) );
  INVX1 U1614 ( .A(buffer[441]), .Y(n1169) );
  MUX2X1 U1615 ( .B(n1171), .A(n1170), .S(n16), .Y(n1332) );
  INVX1 U1616 ( .A(buffer[449]), .Y(n1170) );
  MUX2X1 U1617 ( .B(n1172), .A(n1171), .S(n16), .Y(n1330) );
  INVX1 U1618 ( .A(buffer[457]), .Y(n1171) );
  MUX2X1 U1619 ( .B(n1173), .A(n1172), .S(n16), .Y(n1328) );
  INVX1 U1620 ( .A(buffer[465]), .Y(n1172) );
  MUX2X1 U1621 ( .B(n1174), .A(n1173), .S(n15), .Y(n1326) );
  INVX1 U1622 ( .A(buffer[473]), .Y(n1173) );
  MUX2X1 U1623 ( .B(n1175), .A(n1174), .S(n15), .Y(n1324) );
  INVX1 U1624 ( .A(buffer[481]), .Y(n1174) );
  MUX2X1 U1625 ( .B(n1176), .A(n1175), .S(n15), .Y(n1322) );
  INVX1 U1626 ( .A(buffer[489]), .Y(n1175) );
  MUX2X1 U1627 ( .B(n560), .A(n1176), .S(n15), .Y(n1320) );
  INVX1 U1628 ( .A(buffer[497]), .Y(n1176) );
  INVX1 U1629 ( .A(buffer[505]), .Y(n560) );
  INVX1 U1630 ( .A(n1177), .Y(n1317) );
  MUX2X1 U1631 ( .B(buffer[0]), .A(tx_data[0]), .S(n15), .Y(n1177) );
  INVX1 U1632 ( .A(n1178), .Y(n1315) );
  MUX2X1 U1633 ( .B(buffer[8]), .A(buffer[0]), .S(n15), .Y(n1178) );
  INVX1 U1634 ( .A(n1179), .Y(n1313) );
  MUX2X1 U1635 ( .B(buffer[16]), .A(buffer[8]), .S(n15), .Y(n1179) );
  INVX1 U1636 ( .A(n1180), .Y(n1311) );
  MUX2X1 U1637 ( .B(buffer[24]), .A(buffer[16]), .S(n15), .Y(n1180) );
  INVX1 U1638 ( .A(n1181), .Y(n1309) );
  MUX2X1 U1639 ( .B(buffer[32]), .A(buffer[24]), .S(n15), .Y(n1181) );
  INVX1 U1640 ( .A(n1182), .Y(n1307) );
  MUX2X1 U1641 ( .B(buffer[40]), .A(buffer[32]), .S(n15), .Y(n1182) );
  INVX1 U1642 ( .A(n1183), .Y(n1305) );
  MUX2X1 U1643 ( .B(buffer[48]), .A(buffer[40]), .S(n15), .Y(n1183) );
  INVX1 U1644 ( .A(n1184), .Y(n1303) );
  MUX2X1 U1645 ( .B(buffer[56]), .A(buffer[48]), .S(n15), .Y(n1184) );
  INVX1 U1646 ( .A(n1185), .Y(n1301) );
  MUX2X1 U1647 ( .B(buffer[64]), .A(buffer[56]), .S(n14), .Y(n1185) );
  INVX1 U1648 ( .A(n1186), .Y(n1299) );
  MUX2X1 U1649 ( .B(buffer[72]), .A(buffer[64]), .S(n14), .Y(n1186) );
  INVX1 U1650 ( .A(n1187), .Y(n1297) );
  MUX2X1 U1651 ( .B(buffer[80]), .A(buffer[72]), .S(n14), .Y(n1187) );
  MUX2X1 U1652 ( .B(n738), .A(n1188), .S(n14), .Y(n1295) );
  INVX1 U1653 ( .A(buffer[80]), .Y(n1188) );
  MUX2X1 U1654 ( .B(n739), .A(n738), .S(n14), .Y(n1293) );
  INVX1 U1655 ( .A(buffer[88]), .Y(n738) );
  MUX2X1 U1656 ( .B(n737), .A(n739), .S(n14), .Y(n1291) );
  INVX1 U1657 ( .A(buffer[96]), .Y(n739) );
  MUX2X1 U1658 ( .B(n2236), .A(n737), .S(n14), .Y(n1289) );
  INVX1 U1659 ( .A(buffer[104]), .Y(n737) );
  MUX2X1 U1660 ( .B(n2237), .A(n2236), .S(n14), .Y(n1287) );
  INVX1 U1661 ( .A(buffer[112]), .Y(n2236) );
  MUX2X1 U1662 ( .B(n2238), .A(n2237), .S(n14), .Y(n1285) );
  INVX1 U1663 ( .A(buffer[120]), .Y(n2237) );
  MUX2X1 U1664 ( .B(n2239), .A(n2238), .S(n14), .Y(n1283) );
  INVX1 U1665 ( .A(buffer[128]), .Y(n2238) );
  MUX2X1 U1666 ( .B(n2240), .A(n2239), .S(n14), .Y(n1281) );
  INVX1 U1667 ( .A(buffer[136]), .Y(n2239) );
  MUX2X1 U1668 ( .B(n2241), .A(n2240), .S(n14), .Y(n1279) );
  INVX1 U1669 ( .A(buffer[144]), .Y(n2240) );
  MUX2X1 U1670 ( .B(n2242), .A(n2241), .S(n14), .Y(n1277) );
  INVX1 U1671 ( .A(buffer[152]), .Y(n2241) );
  MUX2X1 U1672 ( .B(n2243), .A(n2242), .S(n13), .Y(n1275) );
  INVX1 U1673 ( .A(buffer[160]), .Y(n2242) );
  MUX2X1 U1674 ( .B(n709), .A(n2243), .S(n13), .Y(n1273) );
  INVX1 U1675 ( .A(buffer[168]), .Y(n2243) );
  MUX2X1 U1676 ( .B(n2244), .A(n709), .S(n13), .Y(n1271) );
  INVX1 U1677 ( .A(buffer[176]), .Y(n709) );
  MUX2X1 U1678 ( .B(n2245), .A(n2244), .S(n13), .Y(n1269) );
  INVX1 U1679 ( .A(buffer[184]), .Y(n2244) );
  MUX2X1 U1680 ( .B(n708), .A(n2245), .S(n13), .Y(n1267) );
  INVX1 U1681 ( .A(buffer[192]), .Y(n2245) );
  MUX2X1 U1682 ( .B(n710), .A(n708), .S(n13), .Y(n1265) );
  INVX1 U1683 ( .A(buffer[200]), .Y(n708) );
  MUX2X1 U1684 ( .B(n2246), .A(n710), .S(n13), .Y(n1263) );
  INVX1 U1685 ( .A(buffer[208]), .Y(n710) );
  MUX2X1 U1686 ( .B(n2247), .A(n2246), .S(n13), .Y(n1261) );
  INVX1 U1687 ( .A(buffer[216]), .Y(n2246) );
  MUX2X1 U1688 ( .B(n2248), .A(n2247), .S(n13), .Y(n1259) );
  INVX1 U1689 ( .A(buffer[224]), .Y(n2247) );
  MUX2X1 U1690 ( .B(n2249), .A(n2248), .S(n13), .Y(n1257) );
  INVX1 U1691 ( .A(buffer[232]), .Y(n2248) );
  MUX2X1 U1692 ( .B(n2250), .A(n2249), .S(n13), .Y(n1255) );
  INVX1 U1693 ( .A(buffer[240]), .Y(n2249) );
  MUX2X1 U1694 ( .B(n2251), .A(n2250), .S(n13), .Y(n1253) );
  INVX1 U1695 ( .A(buffer[248]), .Y(n2250) );
  MUX2X1 U1696 ( .B(n2252), .A(n2251), .S(n13), .Y(n1251) );
  INVX1 U1697 ( .A(buffer[256]), .Y(n2251) );
  MUX2X1 U1698 ( .B(n2253), .A(n2252), .S(n12), .Y(n1249) );
  INVX1 U1699 ( .A(buffer[264]), .Y(n2252) );
  MUX2X1 U1700 ( .B(n2254), .A(n2253), .S(n12), .Y(n1247) );
  INVX1 U1701 ( .A(buffer[272]), .Y(n2253) );
  MUX2X1 U1702 ( .B(n2255), .A(n2254), .S(n12), .Y(n1245) );
  INVX1 U1703 ( .A(buffer[280]), .Y(n2254) );
  MUX2X1 U1704 ( .B(n2256), .A(n2255), .S(n12), .Y(n1243) );
  INVX1 U1705 ( .A(buffer[288]), .Y(n2255) );
  MUX2X1 U1706 ( .B(n2257), .A(n2256), .S(n12), .Y(n1241) );
  INVX1 U1707 ( .A(buffer[296]), .Y(n2256) );
  MUX2X1 U1708 ( .B(n681), .A(n2257), .S(n12), .Y(n1239) );
  INVX1 U1709 ( .A(buffer[304]), .Y(n2257) );
  MUX2X1 U1710 ( .B(n682), .A(n681), .S(n12), .Y(n1237) );
  INVX1 U1711 ( .A(buffer[312]), .Y(n681) );
  MUX2X1 U1712 ( .B(n680), .A(n682), .S(n12), .Y(n1235) );
  INVX1 U1713 ( .A(buffer[320]), .Y(n682) );
  MUX2X1 U2241 ( .B(n2258), .A(n680), .S(n12), .Y(n1233) );
  INVX1 U2242 ( .A(buffer[328]), .Y(n680) );
  MUX2X1 U2243 ( .B(n2259), .A(n2258), .S(n12), .Y(n1231) );
  INVX1 U2244 ( .A(buffer[336]), .Y(n2258) );
  MUX2X1 U2245 ( .B(n2260), .A(n2259), .S(n12), .Y(n1229) );
  INVX1 U2246 ( .A(buffer[344]), .Y(n2259) );
  MUX2X1 U2247 ( .B(n2261), .A(n2260), .S(n12), .Y(n1227) );
  INVX1 U2248 ( .A(buffer[352]), .Y(n2260) );
  MUX2X1 U2249 ( .B(n2262), .A(n2261), .S(n12), .Y(n1225) );
  INVX1 U2250 ( .A(buffer[360]), .Y(n2261) );
  MUX2X1 U2251 ( .B(n2263), .A(n2262), .S(n11), .Y(n1223) );
  INVX1 U2252 ( .A(buffer[368]), .Y(n2262) );
  MUX2X1 U2253 ( .B(n2264), .A(n2263), .S(n11), .Y(n1221) );
  INVX1 U2254 ( .A(buffer[376]), .Y(n2263) );
  MUX2X1 U2255 ( .B(n2265), .A(n2264), .S(n11), .Y(n1219) );
  INVX1 U2256 ( .A(buffer[384]), .Y(n2264) );
  MUX2X1 U2257 ( .B(n653), .A(n2265), .S(n11), .Y(n1217) );
  INVX1 U2258 ( .A(buffer[392]), .Y(n2265) );
  MUX2X1 U2259 ( .B(n2266), .A(n653), .S(n11), .Y(n1215) );
  INVX1 U2260 ( .A(buffer[400]), .Y(n653) );
  MUX2X1 U2261 ( .B(n2267), .A(n2266), .S(n11), .Y(n1213) );
  INVX1 U2262 ( .A(buffer[408]), .Y(n2266) );
  MUX2X1 U2263 ( .B(n652), .A(n2267), .S(n11), .Y(n1211) );
  INVX1 U2264 ( .A(buffer[416]), .Y(n2267) );
  MUX2X1 U2265 ( .B(n654), .A(n652), .S(n11), .Y(n1209) );
  INVX1 U2266 ( .A(buffer[424]), .Y(n652) );
  MUX2X1 U2267 ( .B(n2268), .A(n654), .S(n11), .Y(n1207) );
  INVX1 U2268 ( .A(buffer[432]), .Y(n654) );
  MUX2X1 U2269 ( .B(n2269), .A(n2268), .S(n11), .Y(n1205) );
  INVX1 U2270 ( .A(buffer[440]), .Y(n2268) );
  MUX2X1 U2271 ( .B(n2270), .A(n2269), .S(n11), .Y(n1203) );
  INVX1 U2272 ( .A(buffer[448]), .Y(n2269) );
  MUX2X1 U2273 ( .B(n2271), .A(n2270), .S(n11), .Y(n1201) );
  INVX1 U2274 ( .A(buffer[456]), .Y(n2270) );
  MUX2X1 U2275 ( .B(n2272), .A(n2271), .S(n11), .Y(n1199) );
  INVX1 U2276 ( .A(buffer[464]), .Y(n2271) );
  MUX2X1 U2277 ( .B(n2273), .A(n2272), .S(n10), .Y(n1197) );
  INVX1 U2278 ( .A(buffer[472]), .Y(n2272) );
  MUX2X1 U2279 ( .B(n2274), .A(n2273), .S(n15), .Y(n1195) );
  INVX1 U2280 ( .A(buffer[480]), .Y(n2273) );
  MUX2X1 U2281 ( .B(n2275), .A(n2274), .S(n1), .Y(n1193) );
  INVX1 U2282 ( .A(buffer[488]), .Y(n2274) );
  MUX2X1 U2283 ( .B(n632), .A(n2275), .S(n20), .Y(n1191) );
  INVX1 U2284 ( .A(buffer[496]), .Y(n2275) );
  INVX1 U2285 ( .A(buffer[504]), .Y(n632) );
endmodule


module ahb_tx_cdl ( clk, n_rst, hsel, haddr, htrans, hsize, hwrite, hwdata, 
        hrdata, hresp, hready, hburst, dplus_out, dminus_out, dmode );
  input [3:0] haddr;
  input [1:0] htrans;
  input [1:0] hsize;
  input [31:0] hwdata;
  output [31:0] hrdata;
  input [2:0] hburst;
  input clk, n_rst, hsel, hwrite;
  output hresp, hready, dplus_out, dminus_out, dmode;
  wire   tx_transfer_active, tx_error, store_tx_data, clear,
         get_tx_packet_data;
  wire   [6:0] buffer_occupancy;
  wire   [7:0] tx_data;
  wire   [2:0] tx_packet;
  wire   [7:0] tx_packet_data;

  ahb_slave AHB ( .clk(clk), .n_rst(n_rst), .hsel(hsel), .haddr(haddr), 
        .htrans(htrans), .hsize(hsize), .hwrite(hwrite), .hwdata(hwdata), 
        .hrdata(hrdata), .hresp(hresp), .hready(hready), .hburst(hburst), 
        .buffer_occupancy(buffer_occupancy), .tx_transfer_active(
        tx_transfer_active), .tx_error(tx_error), .store_tx_data(store_tx_data), .clear(clear), .dmode(dmode), .tx_data(tx_data), .tx_packet(tx_packet) );
  tx USB ( .clk(clk), .n_rst(n_rst), .tx_packet_data(tx_packet_data), 
        .tx_packet(tx_packet), .buffer_occupancy(buffer_occupancy), 
        .get_tx_packet_data(get_tx_packet_data), .tx_transfer_active(
        tx_transfer_active), .tx_error(tx_error), .dplus_out(dplus_out), 
        .dminus_out(dminus_out) );
  data_buffer DB ( .clk(clk), .n_rst(n_rst), .tx_data(tx_data), 
        .store_tx_data(store_tx_data), .get_tx_packet_data(get_tx_packet_data), 
        .clear(clear), .buffer_occupancy(buffer_occupancy), .tx_packet_data(
        tx_packet_data) );
endmodule

