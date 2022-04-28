/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 28 11:42:25 2022
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
  wire   dmode, \prev_haddr[0] , prev_hwrite, \mem[13][7] , \mem[13][6] ,
         \mem[13][5] , \mem[13][4] , \mem[13][3] , \mem[13][2] , \mem[13][1] ,
         \mem[13][0] , \mem[12][7] , \mem[12][6] , \mem[12][5] , \mem[12][4] ,
         \mem[12][3] , \mem[8][6] , \mem[8][5] , \mem[8][4] , \mem[8][3] ,
         \mem[8][2] , \mem[8][1] , \mem[8][0] , \mem[7][0] , \mem[5][1] ,
         \mem[3][7] , \mem[3][6] , \mem[3][5] , \mem[3][4] , \mem[3][3] ,
         \mem[3][2] , \mem[3][1] , \mem[3][0] , \mem[2][7] , \mem[2][6] ,
         \mem[2][5] , \mem[2][4] , \mem[2][3] , \mem[2][2] , \mem[2][1] ,
         \mem[2][0] , \mem[1][7] , \mem[1][6] , \mem[1][5] , \mem[1][4] ,
         \mem[1][3] , \mem[1][2] , \mem[1][1] , \mem[1][0] , \mem[0][7] ,
         \mem[0][6] , \mem[0][5] , \mem[0][4] , \mem[0][3] , \mem[0][2] ,
         \mem[0][1] , \mem[0][0] , \next_mem[13][7] , \next_mem[13][6] ,
         \next_mem[13][5] , \next_mem[13][4] , \next_mem[13][3] ,
         \next_mem[13][2] , \next_mem[13][1] , \next_mem[13][0] ,
         \next_mem[12][7] , \next_mem[12][6] , \next_mem[12][5] ,
         \next_mem[12][4] , \next_mem[12][3] , \next_mem[12][2] ,
         \next_mem[12][1] , \next_mem[12][0] , \next_mem[8][6] ,
         \next_mem[8][5] , \next_mem[8][4] , \next_mem[8][3] ,
         \next_mem[8][2] , \next_mem[8][1] , \next_mem[8][0] ,
         \next_mem[7][0] , \next_mem[5][1] , prev_tx_transfer_active, N756,
         N757, N758, N773, N774, N775, N776, N777, N778, N779, N780, N840,
         N841, N842, N843, N844, N845, N846, N847, n293, n294, n295, n296,
         n297, n298, n299, n300, n301, n302, n303, n304, n305, n306, n307,
         n308, n309, n310, n311, n312, n313, n314, n315, n316, n317, n318,
         n319, n320, n321, n322, n323, n324, n742, n743, n744, n745, n746,
         n747, n748, n749, n750, n751, n752, n753, n754, n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n813, n814, n815, n816, n817, n818, n819, n820, n821, n822, n823,
         n824, n825, n826, n827, n828, n829, n830, n831, n832, n833, n834,
         n835, n836, n837, n838, n839, n840, n841, n842, n843, n844, n845,
         n846, n847, n848, n849, n850, n851, n852, n853, n854, n855, n856,
         n857, n858, n859, n860, n861, n862, n863, n864, n865, n866, n867,
         n868, n869, n870, n871, n872, n873, n874, n875, n876, n877, n878,
         n879, n880, n881, n882, n883, n884, n885, n886, n887, n888, n889,
         n890, n891, n892, n893, n894, n895, n896, n897, n898, n899, n900,
         n901, n902, n903, n904, n905, n906, n907, n908, n909, n910, n911,
         n912, n913, n914, n915, n916, n917, n918, n919, n920, n921, n922,
         n923, n924, n925, n926, n927, n928, n929, n930, n931, n932, n933,
         n934, n935, n936, n937, n938, n939, n940, n941, n942, n943, n944,
         n945, n946, n947, n948, n949, n950, n951, n952, n953, n954, n955,
         n956, n957, n958, n959, n960, n961, n962, n963, n964, n965, n966,
         n967, n968, n969, n970, n971, n972, n973, n974, n975, n976, n977,
         n978, n979, n980, n981, n982, n983, n984, n985, n986, n987, n988,
         n989, n990, n991, n992, n993, n994, n995, n996, n997, n998, n999,
         n1000, n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009,
         n1010, n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019,
         n1020, n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029,
         n1030, n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039,
         n1040, n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049,
         n1050, n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059,
         n1060, n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069,
         n1070, n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079,
         n1080, n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089,
         n1090, n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099,
         n1100, n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109,
         n1110, n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119,
         n1120, n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129,
         n1130, n1131, n1132;
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
  DFFSR \state_reg[1]  ( .D(next_state[1]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[1]) );
  DFFSR \state_reg[2]  ( .D(next_state[2]), .CLK(clk), .R(n_rst), .S(1'b1), 
        .Q(state[2]) );
  DFFSR \data_hsize_reg[0]  ( .D(next_data_hsize[0]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_hsize[0]) );
  DFFSR \data_hsize_reg[1]  ( .D(next_data_hsize[1]), .CLK(clk), .R(n_rst), 
        .S(1'b1), .Q(data_hsize[1]) );
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
  DFFSR prev_tx_transfer_active_reg ( .D(dmode), .CLK(clk), .R(n_rst), .S(1'b1), .Q(prev_tx_transfer_active) );
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
  OR2X2 U850 ( .A(N758), .B(n1132), .Y(n742) );
  OR2X2 U851 ( .A(N758), .B(\prev_haddr[0] ), .Y(n743) );
  AND2X2 U852 ( .A(tx_packet[1]), .B(n839), .Y(n744) );
  AND2X2 U853 ( .A(tx_packet[2]), .B(n839), .Y(n745) );
  AND2X2 U854 ( .A(\mem[12][3] ), .B(n839), .Y(n746) );
  AND2X2 U855 ( .A(\mem[12][4] ), .B(n839), .Y(n747) );
  AND2X2 U856 ( .A(\mem[12][5] ), .B(n839), .Y(n748) );
  AND2X2 U857 ( .A(\mem[12][6] ), .B(n839), .Y(n749) );
  AND2X2 U858 ( .A(\mem[12][7] ), .B(n839), .Y(n750) );
  AND2X2 U859 ( .A(tx_packet[1]), .B(n932), .Y(n751) );
  AND2X2 U860 ( .A(tx_packet[2]), .B(n932), .Y(n752) );
  AND2X2 U861 ( .A(\mem[12][3] ), .B(n932), .Y(n753) );
  AND2X2 U862 ( .A(\mem[12][4] ), .B(n932), .Y(n754) );
  AND2X2 U863 ( .A(\mem[12][5] ), .B(n932), .Y(n755) );
  AND2X2 U864 ( .A(\mem[12][6] ), .B(n932), .Y(n756) );
  AND2X2 U865 ( .A(\mem[12][7] ), .B(n932), .Y(n757) );
  AND2X2 U866 ( .A(N758), .B(\prev_haddr[0] ), .Y(n831) );
  AND2X2 U867 ( .A(N758), .B(n1132), .Y(n924) );
  INVX2 U868 ( .A(n1121), .Y(n1102) );
  BUFX2 U869 ( .A(n1049), .Y(n758) );
  INVX2 U870 ( .A(n937), .Y(n759) );
  INVX1 U871 ( .A(n759), .Y(n844) );
  INVX1 U872 ( .A(N756), .Y(n937) );
  BUFX2 U873 ( .A(n1099), .Y(n760) );
  NOR2X1 U874 ( .A(n844), .B(n938), .Y(n769) );
  NOR2X1 U875 ( .A(n938), .B(n759), .Y(n767) );
  NOR2X1 U876 ( .A(\prev_haddr[0] ), .B(N758), .Y(n770) );
  AND2X1 U877 ( .A(n767), .B(n770), .Y(n829) );
  NAND2X1 U878 ( .A(n1132), .B(N758), .Y(n833) );
  OAI22X1 U879 ( .A(\mem[3][0] ), .B(n845), .C(\mem[2][0] ), .D(n742), .Y(n765) );
  AOI21X1 U880 ( .A(n831), .B(n847), .C(N756), .Y(n762) );
  OAI22X1 U881 ( .A(\mem[1][0] ), .B(n845), .C(\mem[0][0] ), .D(n742), .Y(n763) );
  OAI22X1 U882 ( .A(n766), .B(n765), .C(n764), .D(n763), .Y(n768) );
  NOR2X1 U883 ( .A(n938), .B(n833), .Y(n841) );
  AND2X1 U884 ( .A(n770), .B(n769), .Y(n840) );
  AND2X1 U885 ( .A(n831), .B(N757), .Y(n839) );
  AOI22X1 U886 ( .A(\mem[7][0] ), .B(n840), .C(tx_packet[0]), .D(n839), .Y(
        n771) );
  AOI21X1 U887 ( .A(\mem[13][0] ), .B(n841), .C(n846), .Y(n772) );
  OAI22X1 U888 ( .A(\mem[3][1] ), .B(n845), .C(\mem[2][1] ), .D(n742), .Y(n778) );
  AOI21X1 U889 ( .A(n831), .B(n848), .C(N756), .Y(n775) );
  OAI22X1 U890 ( .A(\mem[1][1] ), .B(n845), .C(\mem[0][1] ), .D(n742), .Y(n776) );
  OAI22X1 U891 ( .A(n779), .B(n778), .C(n777), .D(n776), .Y(n780) );
  AOI21X1 U892 ( .A(\mem[13][1] ), .B(n841), .C(n744), .Y(n781) );
  NAND3X1 U893 ( .A(n783), .B(n782), .C(n781), .Y(N779) );
  OAI22X1 U894 ( .A(\mem[3][2] ), .B(n845), .C(\mem[2][2] ), .D(n742), .Y(n788) );
  AOI21X1 U895 ( .A(n831), .B(n849), .C(N756), .Y(n785) );
  OAI22X1 U896 ( .A(\mem[1][2] ), .B(n845), .C(\mem[0][2] ), .D(n742), .Y(n786) );
  OAI22X1 U897 ( .A(n789), .B(n788), .C(n787), .D(n786), .Y(n790) );
  AOI21X1 U898 ( .A(\mem[13][2] ), .B(n841), .C(n745), .Y(n791) );
  OAI22X1 U899 ( .A(\mem[3][3] ), .B(n845), .C(\mem[2][3] ), .D(n742), .Y(n797) );
  AOI21X1 U900 ( .A(n831), .B(n850), .C(N756), .Y(n794) );
  OAI22X1 U901 ( .A(\mem[1][3] ), .B(n845), .C(\mem[0][3] ), .D(n742), .Y(n795) );
  OAI22X1 U902 ( .A(n798), .B(n797), .C(n796), .D(n795), .Y(n799) );
  AOI21X1 U903 ( .A(\mem[13][3] ), .B(n841), .C(n746), .Y(n800) );
  OAI22X1 U904 ( .A(\mem[3][4] ), .B(n845), .C(\mem[2][4] ), .D(n742), .Y(n806) );
  AOI21X1 U905 ( .A(n831), .B(n851), .C(N756), .Y(n803) );
  OAI22X1 U906 ( .A(\mem[1][4] ), .B(n845), .C(\mem[0][4] ), .D(n742), .Y(n804) );
  OAI22X1 U907 ( .A(n807), .B(n806), .C(n805), .D(n804), .Y(n808) );
  AOI21X1 U908 ( .A(\mem[13][4] ), .B(n841), .C(n747), .Y(n809) );
  OAI22X1 U909 ( .A(\mem[3][5] ), .B(n845), .C(\mem[2][5] ), .D(n742), .Y(n815) );
  AOI21X1 U910 ( .A(n831), .B(n852), .C(N756), .Y(n812) );
  OAI22X1 U911 ( .A(\mem[1][5] ), .B(n845), .C(\mem[0][5] ), .D(n742), .Y(n813) );
  OAI22X1 U912 ( .A(n816), .B(n815), .C(n814), .D(n813), .Y(n817) );
  AOI21X1 U913 ( .A(\mem[13][5] ), .B(n841), .C(n748), .Y(n818) );
  OAI22X1 U914 ( .A(\mem[3][6] ), .B(n845), .C(\mem[2][6] ), .D(n742), .Y(n824) );
  AOI21X1 U915 ( .A(n831), .B(n853), .C(N756), .Y(n821) );
  OAI22X1 U916 ( .A(\mem[1][6] ), .B(n845), .C(\mem[0][6] ), .D(n742), .Y(n822) );
  OAI22X1 U917 ( .A(n825), .B(n824), .C(n823), .D(n822), .Y(n826) );
  AOI21X1 U918 ( .A(\mem[13][6] ), .B(n841), .C(n749), .Y(n827) );
  OAI22X1 U919 ( .A(\mem[3][7] ), .B(n845), .C(\mem[2][7] ), .D(n742), .Y(n836) );
  OAI22X1 U920 ( .A(\mem[1][7] ), .B(n845), .C(\mem[0][7] ), .D(n742), .Y(n834) );
  OAI22X1 U921 ( .A(n837), .B(n836), .C(n835), .D(n834), .Y(n838) );
  AOI21X1 U922 ( .A(\mem[13][7] ), .B(n841), .C(n750), .Y(n842) );
  NAND2X1 U923 ( .A(n833), .B(n830), .Y(n837) );
  NAND2X1 U924 ( .A(n833), .B(n820), .Y(n825) );
  NAND2X1 U925 ( .A(n833), .B(n811), .Y(n816) );
  NAND2X1 U926 ( .A(n833), .B(n802), .Y(n807) );
  NAND2X1 U927 ( .A(n833), .B(n793), .Y(n798) );
  NAND2X1 U928 ( .A(n833), .B(n784), .Y(n789) );
  NAND2X1 U929 ( .A(n833), .B(n774), .Y(n779) );
  NAND2X1 U930 ( .A(n833), .B(n761), .Y(n766) );
  NAND2X1 U931 ( .A(n833), .B(n832), .Y(n835) );
  NAND2X1 U932 ( .A(n833), .B(n821), .Y(n823) );
  NAND2X1 U933 ( .A(n833), .B(n812), .Y(n814) );
  NAND2X1 U934 ( .A(n833), .B(n803), .Y(n805) );
  NAND2X1 U935 ( .A(n833), .B(n794), .Y(n796) );
  NAND2X1 U936 ( .A(n833), .B(n785), .Y(n787) );
  NAND2X1 U937 ( .A(n833), .B(n775), .Y(n777) );
  NAND2X1 U938 ( .A(n833), .B(n762), .Y(n764) );
  NAND2X1 U939 ( .A(\mem[5][1] ), .B(n829), .Y(n783) );
  NAND2X1 U940 ( .A(n838), .B(n938), .Y(n843) );
  NAND2X1 U941 ( .A(n826), .B(n938), .Y(n828) );
  NAND2X1 U942 ( .A(n817), .B(n938), .Y(n819) );
  NAND2X1 U943 ( .A(n808), .B(n938), .Y(n810) );
  NAND2X1 U944 ( .A(n799), .B(n938), .Y(n801) );
  NAND2X1 U945 ( .A(n790), .B(n938), .Y(n792) );
  NAND2X1 U946 ( .A(n780), .B(n938), .Y(n782) );
  NAND2X1 U947 ( .A(n768), .B(n938), .Y(n773) );
  NOR2X1 U948 ( .A(n831), .B(n759), .Y(n832) );
  NOR2X1 U949 ( .A(n831), .B(n844), .Y(n761) );
  NOR2X1 U950 ( .A(n831), .B(n844), .Y(n774) );
  NOR2X1 U951 ( .A(n831), .B(n844), .Y(n784) );
  NOR2X1 U952 ( .A(n831), .B(n844), .Y(n793) );
  NOR2X1 U953 ( .A(n831), .B(n844), .Y(n802) );
  NOR2X1 U954 ( .A(n831), .B(n844), .Y(n811) );
  NOR2X1 U955 ( .A(n831), .B(n844), .Y(n820) );
  NOR2X1 U956 ( .A(n831), .B(n844), .Y(n830) );
  NAND2X1 U957 ( .A(n843), .B(n842), .Y(N773) );
  NAND2X1 U958 ( .A(n828), .B(n827), .Y(N774) );
  NAND2X1 U959 ( .A(n819), .B(n818), .Y(N775) );
  NAND2X1 U960 ( .A(n810), .B(n809), .Y(N776) );
  NAND2X1 U961 ( .A(n801), .B(n800), .Y(N777) );
  NAND2X1 U962 ( .A(n792), .B(n791), .Y(N778) );
  NAND2X1 U963 ( .A(n773), .B(n772), .Y(N780) );
  INVX2 U964 ( .A(n770), .Y(n845) );
  INVX2 U965 ( .A(n771), .Y(n846) );
  INVX2 U966 ( .A(\mem[8][0] ), .Y(n847) );
  INVX2 U967 ( .A(\mem[8][1] ), .Y(n848) );
  INVX2 U968 ( .A(\mem[8][2] ), .Y(n849) );
  INVX2 U969 ( .A(\mem[8][3] ), .Y(n850) );
  INVX2 U970 ( .A(\mem[8][4] ), .Y(n851) );
  INVX2 U971 ( .A(\mem[8][5] ), .Y(n852) );
  INVX2 U972 ( .A(\mem[8][6] ), .Y(n853) );
  NOR2X1 U973 ( .A(n937), .B(n938), .Y(n862) );
  NOR2X1 U974 ( .A(n938), .B(n759), .Y(n860) );
  NOR2X1 U975 ( .A(n1132), .B(N758), .Y(n863) );
  AND2X1 U976 ( .A(n860), .B(n863), .Y(n922) );
  NAND2X1 U977 ( .A(\prev_haddr[0] ), .B(N758), .Y(n926) );
  OAI22X1 U978 ( .A(\mem[3][0] ), .B(n939), .C(\mem[2][0] ), .D(n743), .Y(n858) );
  AOI21X1 U979 ( .A(n924), .B(n847), .C(N756), .Y(n855) );
  OAI22X1 U980 ( .A(\mem[1][0] ), .B(n939), .C(\mem[0][0] ), .D(n743), .Y(n856) );
  OAI22X1 U981 ( .A(n859), .B(n858), .C(n857), .D(n856), .Y(n861) );
  NOR2X1 U982 ( .A(n938), .B(n926), .Y(n934) );
  AND2X1 U983 ( .A(n863), .B(n862), .Y(n933) );
  AND2X1 U984 ( .A(n924), .B(N757), .Y(n932) );
  AOI22X1 U985 ( .A(\mem[7][0] ), .B(n933), .C(tx_packet[0]), .D(n932), .Y(
        n864) );
  AOI21X1 U986 ( .A(\mem[13][0] ), .B(n934), .C(n940), .Y(n865) );
  OAI22X1 U987 ( .A(\mem[3][1] ), .B(n939), .C(\mem[2][1] ), .D(n743), .Y(n871) );
  AOI21X1 U988 ( .A(n924), .B(n848), .C(N756), .Y(n868) );
  OAI22X1 U989 ( .A(\mem[1][1] ), .B(n939), .C(\mem[0][1] ), .D(n743), .Y(n869) );
  OAI22X1 U990 ( .A(n872), .B(n871), .C(n870), .D(n869), .Y(n873) );
  AOI21X1 U991 ( .A(\mem[13][1] ), .B(n934), .C(n751), .Y(n874) );
  NAND3X1 U992 ( .A(n876), .B(n875), .C(n874), .Y(N846) );
  OAI22X1 U993 ( .A(\mem[3][2] ), .B(n939), .C(\mem[2][2] ), .D(n743), .Y(n881) );
  AOI21X1 U994 ( .A(n924), .B(n849), .C(N756), .Y(n878) );
  OAI22X1 U995 ( .A(\mem[1][2] ), .B(n939), .C(\mem[0][2] ), .D(n743), .Y(n879) );
  OAI22X1 U996 ( .A(n882), .B(n881), .C(n880), .D(n879), .Y(n883) );
  AOI21X1 U997 ( .A(\mem[13][2] ), .B(n934), .C(n752), .Y(n884) );
  OAI22X1 U998 ( .A(\mem[3][3] ), .B(n939), .C(\mem[2][3] ), .D(n743), .Y(n890) );
  AOI21X1 U999 ( .A(n924), .B(n850), .C(N756), .Y(n887) );
  OAI22X1 U1000 ( .A(\mem[1][3] ), .B(n939), .C(\mem[0][3] ), .D(n743), .Y(
        n888) );
  OAI22X1 U1001 ( .A(n891), .B(n890), .C(n889), .D(n888), .Y(n892) );
  AOI21X1 U1002 ( .A(\mem[13][3] ), .B(n934), .C(n753), .Y(n893) );
  OAI22X1 U1003 ( .A(\mem[3][4] ), .B(n939), .C(\mem[2][4] ), .D(n743), .Y(
        n899) );
  AOI21X1 U1004 ( .A(n924), .B(n851), .C(N756), .Y(n896) );
  OAI22X1 U1005 ( .A(\mem[1][4] ), .B(n939), .C(\mem[0][4] ), .D(n743), .Y(
        n897) );
  OAI22X1 U1006 ( .A(n900), .B(n899), .C(n898), .D(n897), .Y(n901) );
  AOI21X1 U1007 ( .A(\mem[13][4] ), .B(n934), .C(n754), .Y(n902) );
  OAI22X1 U1008 ( .A(\mem[3][5] ), .B(n939), .C(\mem[2][5] ), .D(n743), .Y(
        n908) );
  AOI21X1 U1009 ( .A(n924), .B(n852), .C(N756), .Y(n905) );
  OAI22X1 U1010 ( .A(\mem[1][5] ), .B(n939), .C(\mem[0][5] ), .D(n743), .Y(
        n906) );
  OAI22X1 U1011 ( .A(n909), .B(n908), .C(n907), .D(n906), .Y(n910) );
  AOI21X1 U1012 ( .A(\mem[13][5] ), .B(n934), .C(n755), .Y(n911) );
  OAI22X1 U1013 ( .A(\mem[3][6] ), .B(n939), .C(\mem[2][6] ), .D(n743), .Y(
        n917) );
  AOI21X1 U1014 ( .A(n924), .B(n853), .C(N756), .Y(n914) );
  OAI22X1 U1015 ( .A(\mem[1][6] ), .B(n939), .C(\mem[0][6] ), .D(n743), .Y(
        n915) );
  OAI22X1 U1016 ( .A(n918), .B(n917), .C(n916), .D(n915), .Y(n919) );
  AOI21X1 U1017 ( .A(\mem[13][6] ), .B(n934), .C(n756), .Y(n920) );
  OAI22X1 U1018 ( .A(\mem[3][7] ), .B(n939), .C(\mem[2][7] ), .D(n743), .Y(
        n929) );
  OAI22X1 U1019 ( .A(\mem[1][7] ), .B(n939), .C(\mem[0][7] ), .D(n743), .Y(
        n927) );
  OAI22X1 U1020 ( .A(n930), .B(n929), .C(n928), .D(n927), .Y(n931) );
  AOI21X1 U1021 ( .A(\mem[13][7] ), .B(n934), .C(n757), .Y(n935) );
  NAND2X1 U1022 ( .A(n926), .B(n923), .Y(n930) );
  NAND2X1 U1023 ( .A(n926), .B(n913), .Y(n918) );
  NAND2X1 U1024 ( .A(n926), .B(n904), .Y(n909) );
  NAND2X1 U1025 ( .A(n926), .B(n895), .Y(n900) );
  NAND2X1 U1026 ( .A(n926), .B(n886), .Y(n891) );
  NAND2X1 U1027 ( .A(n926), .B(n877), .Y(n882) );
  NAND2X1 U1028 ( .A(n926), .B(n867), .Y(n872) );
  NAND2X1 U1029 ( .A(n926), .B(n854), .Y(n859) );
  NAND2X1 U1030 ( .A(n926), .B(n925), .Y(n928) );
  NAND2X1 U1031 ( .A(n926), .B(n914), .Y(n916) );
  NAND2X1 U1032 ( .A(n926), .B(n905), .Y(n907) );
  NAND2X1 U1033 ( .A(n926), .B(n896), .Y(n898) );
  NAND2X1 U1034 ( .A(n926), .B(n887), .Y(n889) );
  NAND2X1 U1035 ( .A(n926), .B(n878), .Y(n880) );
  NAND2X1 U1036 ( .A(n926), .B(n868), .Y(n870) );
  NAND2X1 U1037 ( .A(n926), .B(n855), .Y(n857) );
  NAND2X1 U1038 ( .A(\mem[5][1] ), .B(n922), .Y(n876) );
  NAND2X1 U1039 ( .A(n931), .B(n938), .Y(n936) );
  NAND2X1 U1040 ( .A(n919), .B(n938), .Y(n921) );
  NAND2X1 U1041 ( .A(n910), .B(n938), .Y(n912) );
  NAND2X1 U1042 ( .A(n901), .B(n938), .Y(n903) );
  NAND2X1 U1043 ( .A(n892), .B(n938), .Y(n894) );
  NAND2X1 U1044 ( .A(n883), .B(n938), .Y(n885) );
  NAND2X1 U1045 ( .A(n873), .B(n938), .Y(n875) );
  NAND2X1 U1046 ( .A(n861), .B(n938), .Y(n866) );
  NOR2X1 U1047 ( .A(n924), .B(n759), .Y(n925) );
  NOR2X1 U1048 ( .A(n924), .B(n937), .Y(n854) );
  NOR2X1 U1049 ( .A(n924), .B(n937), .Y(n867) );
  NOR2X1 U1050 ( .A(n924), .B(n937), .Y(n877) );
  NOR2X1 U1051 ( .A(n924), .B(n937), .Y(n886) );
  NOR2X1 U1052 ( .A(n924), .B(n937), .Y(n895) );
  NOR2X1 U1053 ( .A(n924), .B(n937), .Y(n904) );
  NOR2X1 U1054 ( .A(n924), .B(n937), .Y(n913) );
  NOR2X1 U1055 ( .A(n924), .B(n937), .Y(n923) );
  NAND2X1 U1056 ( .A(n936), .B(n935), .Y(N840) );
  NAND2X1 U1057 ( .A(n921), .B(n920), .Y(N841) );
  NAND2X1 U1058 ( .A(n912), .B(n911), .Y(N842) );
  NAND2X1 U1059 ( .A(n903), .B(n902), .Y(N843) );
  NAND2X1 U1060 ( .A(n894), .B(n893), .Y(N844) );
  NAND2X1 U1061 ( .A(n885), .B(n884), .Y(N845) );
  NAND2X1 U1062 ( .A(n866), .B(n865), .Y(N847) );
  INVX2 U1063 ( .A(N757), .Y(n938) );
  INVX2 U1064 ( .A(n863), .Y(n939) );
  INVX2 U1065 ( .A(n864), .Y(n940) );
  NAND2X1 U1066 ( .A(n941), .B(n942), .Y(tx_data[7]) );
  AOI22X1 U1067 ( .A(\mem[1][7] ), .B(n943), .C(\mem[3][7] ), .D(n944), .Y(
        n942) );
  AOI22X1 U1068 ( .A(\mem[2][7] ), .B(n945), .C(\mem[0][7] ), .D(store_tx_data), .Y(n941) );
  NAND2X1 U1069 ( .A(n946), .B(n947), .Y(tx_data[6]) );
  AOI22X1 U1070 ( .A(\mem[1][6] ), .B(n943), .C(\mem[3][6] ), .D(n944), .Y(
        n947) );
  AOI22X1 U1071 ( .A(\mem[2][6] ), .B(n945), .C(\mem[0][6] ), .D(store_tx_data), .Y(n946) );
  NAND2X1 U1072 ( .A(n948), .B(n949), .Y(tx_data[5]) );
  AOI22X1 U1073 ( .A(\mem[1][5] ), .B(n943), .C(\mem[3][5] ), .D(n944), .Y(
        n949) );
  AOI22X1 U1074 ( .A(\mem[2][5] ), .B(n945), .C(\mem[0][5] ), .D(store_tx_data), .Y(n948) );
  NAND2X1 U1075 ( .A(n950), .B(n951), .Y(tx_data[4]) );
  AOI22X1 U1076 ( .A(\mem[1][4] ), .B(n943), .C(\mem[3][4] ), .D(n944), .Y(
        n951) );
  AOI22X1 U1077 ( .A(\mem[2][4] ), .B(n945), .C(\mem[0][4] ), .D(store_tx_data), .Y(n950) );
  NAND2X1 U1078 ( .A(n952), .B(n953), .Y(tx_data[3]) );
  AOI22X1 U1079 ( .A(\mem[1][3] ), .B(n943), .C(\mem[3][3] ), .D(n944), .Y(
        n953) );
  AOI22X1 U1080 ( .A(\mem[2][3] ), .B(n945), .C(\mem[0][3] ), .D(store_tx_data), .Y(n952) );
  NAND2X1 U1081 ( .A(n954), .B(n955), .Y(tx_data[2]) );
  AOI22X1 U1082 ( .A(\mem[1][2] ), .B(n943), .C(\mem[3][2] ), .D(n944), .Y(
        n955) );
  AOI22X1 U1083 ( .A(\mem[2][2] ), .B(n945), .C(\mem[0][2] ), .D(store_tx_data), .Y(n954) );
  NAND2X1 U1084 ( .A(n956), .B(n957), .Y(tx_data[1]) );
  AOI22X1 U1085 ( .A(\mem[1][1] ), .B(n943), .C(\mem[3][1] ), .D(n944), .Y(
        n957) );
  AOI22X1 U1086 ( .A(\mem[2][1] ), .B(n945), .C(\mem[0][1] ), .D(store_tx_data), .Y(n956) );
  NAND2X1 U1087 ( .A(n958), .B(n959), .Y(tx_data[0]) );
  AOI22X1 U1088 ( .A(\mem[1][0] ), .B(n943), .C(\mem[3][0] ), .D(n944), .Y(
        n959) );
  INVX1 U1089 ( .A(n960), .Y(n944) );
  AOI22X1 U1090 ( .A(\mem[2][0] ), .B(n945), .C(\mem[0][0] ), .D(store_tx_data), .Y(n958) );
  INVX1 U1091 ( .A(n961), .Y(n945) );
  OAI21X1 U1092 ( .A(n962), .B(n963), .C(n964), .Y(next_state[1]) );
  OAI21X1 U1093 ( .A(n943), .B(store_tx_data), .C(n965), .Y(n964) );
  INVX1 U1094 ( .A(n966), .Y(n965) );
  INVX1 U1095 ( .A(n967), .Y(n943) );
  OAI21X1 U1096 ( .A(n966), .B(n967), .C(n968), .Y(next_state[0]) );
  MUX2X1 U1097 ( .B(n969), .A(n970), .S(state[0]), .Y(n968) );
  INVX1 U1098 ( .A(n963), .Y(n970) );
  NOR2X1 U1099 ( .A(n971), .B(n972), .Y(n969) );
  NAND2X1 U1100 ( .A(n962), .B(n973), .Y(n972) );
  AOI21X1 U1101 ( .A(n967), .B(data_hsize[0]), .C(data_hsize[1]), .Y(n966) );
  NAND3X1 U1102 ( .A(n974), .B(n973), .C(state[1]), .Y(n967) );
  OR2X1 U1103 ( .A(\mem[7][0] ), .B(tx_error), .Y(\next_mem[7][0] ) );
  OR2X1 U1104 ( .A(dmode), .B(\mem[5][1] ), .Y(\next_mem[5][1] ) );
  OAI22X1 U1105 ( .A(n975), .B(n976), .C(n977), .D(n978), .Y(\next_mem[13][7] ) );
  INVX1 U1106 ( .A(\mem[13][7] ), .Y(n978) );
  OAI22X1 U1107 ( .A(n975), .B(n979), .C(n977), .D(n980), .Y(\next_mem[13][6] ) );
  INVX1 U1108 ( .A(\mem[13][6] ), .Y(n980) );
  OAI22X1 U1109 ( .A(n975), .B(n981), .C(n977), .D(n982), .Y(\next_mem[13][5] ) );
  OAI22X1 U1110 ( .A(n975), .B(n983), .C(n977), .D(n984), .Y(\next_mem[13][4] ) );
  OAI22X1 U1111 ( .A(n975), .B(n985), .C(n977), .D(n986), .Y(\next_mem[13][3] ) );
  INVX1 U1112 ( .A(\mem[13][3] ), .Y(n986) );
  OAI22X1 U1113 ( .A(n975), .B(n987), .C(n977), .D(n988), .Y(\next_mem[13][2] ) );
  INVX1 U1114 ( .A(\mem[13][2] ), .Y(n988) );
  OAI22X1 U1115 ( .A(n975), .B(n989), .C(n977), .D(n990), .Y(\next_mem[13][1] ) );
  OAI22X1 U1116 ( .A(n975), .B(n991), .C(n977), .D(n992), .Y(\next_mem[13][0] ) );
  INVX1 U1117 ( .A(\mem[13][0] ), .Y(n992) );
  OAI21X1 U1118 ( .A(n993), .B(n994), .C(n975), .Y(n977) );
  OR2X1 U1119 ( .A(\next_mem[8][0] ), .B(n995), .Y(n994) );
  OR2X1 U1120 ( .A(\next_mem[8][2] ), .B(\next_mem[8][1] ), .Y(n995) );
  NAND2X1 U1121 ( .A(n996), .B(n997), .Y(n993) );
  NOR2X1 U1122 ( .A(\next_mem[8][6] ), .B(\next_mem[8][5] ), .Y(n997) );
  NOR2X1 U1123 ( .A(\next_mem[8][4] ), .B(\next_mem[8][3] ), .Y(n996) );
  NAND2X1 U1124 ( .A(n998), .B(\prev_haddr[0] ), .Y(n975) );
  OAI21X1 U1125 ( .A(n976), .B(n999), .C(n1000), .Y(\next_mem[12][7] ) );
  NAND2X1 U1126 ( .A(\mem[12][7] ), .B(n1001), .Y(n1000) );
  OAI21X1 U1127 ( .A(n979), .B(n999), .C(n1002), .Y(\next_mem[12][6] ) );
  NAND2X1 U1128 ( .A(\mem[12][6] ), .B(n1001), .Y(n1002) );
  OAI21X1 U1129 ( .A(n981), .B(n999), .C(n1003), .Y(\next_mem[12][5] ) );
  NAND2X1 U1130 ( .A(\mem[12][5] ), .B(n1001), .Y(n1003) );
  OAI21X1 U1131 ( .A(n983), .B(n999), .C(n1004), .Y(\next_mem[12][4] ) );
  NAND2X1 U1132 ( .A(\mem[12][4] ), .B(n1001), .Y(n1004) );
  OAI21X1 U1133 ( .A(n985), .B(n999), .C(n1005), .Y(\next_mem[12][3] ) );
  NAND2X1 U1134 ( .A(\mem[12][3] ), .B(n1001), .Y(n1005) );
  OAI21X1 U1135 ( .A(n987), .B(n999), .C(n1006), .Y(\next_mem[12][2] ) );
  NAND2X1 U1136 ( .A(tx_packet[2]), .B(n1001), .Y(n1006) );
  OAI21X1 U1137 ( .A(n989), .B(n999), .C(n1007), .Y(\next_mem[12][1] ) );
  NAND2X1 U1138 ( .A(tx_packet[1]), .B(n1001), .Y(n1007) );
  OAI21X1 U1139 ( .A(n991), .B(n999), .C(n1008), .Y(\next_mem[12][0] ) );
  NAND2X1 U1140 ( .A(tx_packet[0]), .B(n1001), .Y(n1008) );
  INVX1 U1141 ( .A(n1009), .Y(n1001) );
  OAI21X1 U1142 ( .A(dmode), .B(n1010), .C(n999), .Y(n1009) );
  INVX1 U1143 ( .A(prev_tx_transfer_active), .Y(n1010) );
  NAND2X1 U1144 ( .A(n998), .B(n1132), .Y(n999) );
  INVX1 U1145 ( .A(n1011), .Y(n998) );
  NAND3X1 U1146 ( .A(n1012), .B(n844), .C(n1013), .Y(n1011) );
  NOR2X1 U1147 ( .A(n938), .B(n1014), .Y(n1013) );
  NOR2X1 U1148 ( .A(n1015), .B(n1016), .Y(next_data_hsize[1]) );
  MUX2X1 U1149 ( .B(prev_hsize[1]), .A(data_hsize[1]), .S(n971), .Y(n1016) );
  NOR2X1 U1150 ( .A(n1015), .B(n1017), .Y(next_data_hsize[0]) );
  MUX2X1 U1151 ( .B(prev_hsize[0]), .A(data_hsize[0]), .S(n971), .Y(n1017) );
  NAND3X1 U1152 ( .A(prev_hwrite), .B(hsel), .C(n1018), .Y(n971) );
  NOR2X1 U1153 ( .A(N758), .B(N757), .Y(n1018) );
  NOR2X1 U1154 ( .A(n973), .B(next_state[2]), .Y(n1015) );
  NAND2X1 U1155 ( .A(n961), .B(n963), .Y(next_state[2]) );
  NAND2X1 U1156 ( .A(state[2]), .B(n960), .Y(n963) );
  NAND3X1 U1157 ( .A(n974), .B(n962), .C(state[2]), .Y(n960) );
  INVX1 U1158 ( .A(state[0]), .Y(n974) );
  NAND3X1 U1159 ( .A(state[1]), .B(n973), .C(state[0]), .Y(n961) );
  INVX1 U1160 ( .A(n1019), .Y(store_tx_data) );
  MUX2X1 U1161 ( .B(n991), .A(n1020), .S(n1021), .Y(n324) );
  INVX1 U1162 ( .A(hwdata[0]), .Y(n991) );
  MUX2X1 U1163 ( .B(n989), .A(n1022), .S(n1021), .Y(n323) );
  INVX1 U1164 ( .A(hwdata[1]), .Y(n989) );
  MUX2X1 U1165 ( .B(n987), .A(n1023), .S(n1021), .Y(n322) );
  INVX1 U1166 ( .A(hwdata[2]), .Y(n987) );
  MUX2X1 U1167 ( .B(n985), .A(n1024), .S(n1021), .Y(n321) );
  INVX1 U1168 ( .A(hwdata[3]), .Y(n985) );
  MUX2X1 U1169 ( .B(n983), .A(n1025), .S(n1021), .Y(n320) );
  INVX1 U1170 ( .A(hwdata[4]), .Y(n983) );
  MUX2X1 U1171 ( .B(n981), .A(n1026), .S(n1021), .Y(n319) );
  INVX1 U1172 ( .A(hwdata[5]), .Y(n981) );
  MUX2X1 U1173 ( .B(n979), .A(n1027), .S(n1021), .Y(n318) );
  INVX1 U1174 ( .A(hwdata[6]), .Y(n979) );
  MUX2X1 U1175 ( .B(n976), .A(n1028), .S(n1021), .Y(n317) );
  INVX1 U1176 ( .A(hwdata[7]), .Y(n976) );
  OAI21X1 U1177 ( .A(n1029), .B(n1030), .C(n1031), .Y(n316) );
  NAND2X1 U1178 ( .A(hwdata[8]), .B(n1032), .Y(n1031) );
  OAI21X1 U1179 ( .A(n1029), .B(n1033), .C(n1034), .Y(n315) );
  NAND2X1 U1180 ( .A(hwdata[9]), .B(n1032), .Y(n1034) );
  OAI21X1 U1181 ( .A(n1029), .B(n1035), .C(n1036), .Y(n314) );
  NAND2X1 U1182 ( .A(hwdata[10]), .B(n1032), .Y(n1036) );
  OAI21X1 U1183 ( .A(n1029), .B(n1037), .C(n1038), .Y(n313) );
  NAND2X1 U1184 ( .A(hwdata[11]), .B(n1032), .Y(n1038) );
  OAI21X1 U1185 ( .A(n1029), .B(n1039), .C(n1040), .Y(n312) );
  NAND2X1 U1186 ( .A(hwdata[12]), .B(n1032), .Y(n1040) );
  OAI21X1 U1187 ( .A(n1029), .B(n1041), .C(n1042), .Y(n311) );
  NAND2X1 U1188 ( .A(hwdata[13]), .B(n1032), .Y(n1042) );
  OAI21X1 U1189 ( .A(n1029), .B(n1043), .C(n1044), .Y(n310) );
  NAND2X1 U1190 ( .A(hwdata[14]), .B(n1032), .Y(n1044) );
  OAI21X1 U1191 ( .A(n1029), .B(n1045), .C(n1046), .Y(n309) );
  NAND2X1 U1192 ( .A(hwdata[15]), .B(n1032), .Y(n1046) );
  OAI21X1 U1193 ( .A(n1047), .B(n1048), .C(n758), .Y(n1032) );
  NAND2X1 U1194 ( .A(n1050), .B(n1051), .Y(n1048) );
  AOI21X1 U1195 ( .A(n1051), .B(n1047), .C(n1021), .Y(n1029) );
  OAI21X1 U1196 ( .A(n1052), .B(n1051), .C(n1050), .Y(n1021) );
  INVX1 U1197 ( .A(prev_hsize[0]), .Y(n1047) );
  MUX2X1 U1198 ( .B(n1053), .A(n1054), .S(n758), .Y(n308) );
  INVX1 U1199 ( .A(hwdata[16]), .Y(n1053) );
  MUX2X1 U1200 ( .B(n1055), .A(n1056), .S(n758), .Y(n307) );
  INVX1 U1201 ( .A(hwdata[17]), .Y(n1055) );
  MUX2X1 U1202 ( .B(n1057), .A(n1058), .S(n758), .Y(n306) );
  INVX1 U1203 ( .A(hwdata[18]), .Y(n1057) );
  MUX2X1 U1204 ( .B(n1059), .A(n1060), .S(n758), .Y(n305) );
  INVX1 U1205 ( .A(hwdata[19]), .Y(n1059) );
  MUX2X1 U1206 ( .B(n1061), .A(n1062), .S(n758), .Y(n304) );
  INVX1 U1207 ( .A(hwdata[20]), .Y(n1061) );
  MUX2X1 U1208 ( .B(n1063), .A(n1064), .S(n758), .Y(n303) );
  INVX1 U1209 ( .A(hwdata[21]), .Y(n1063) );
  MUX2X1 U1210 ( .B(n1065), .A(n1066), .S(n758), .Y(n302) );
  INVX1 U1211 ( .A(hwdata[22]), .Y(n1065) );
  MUX2X1 U1212 ( .B(n1067), .A(n1068), .S(n758), .Y(n301) );
  INVX1 U1213 ( .A(hwdata[23]), .Y(n1067) );
  MUX2X1 U1214 ( .B(n1069), .A(n1070), .S(n758), .Y(n300) );
  INVX1 U1215 ( .A(hwdata[24]), .Y(n1069) );
  MUX2X1 U1216 ( .B(n1071), .A(n1072), .S(n758), .Y(n299) );
  INVX1 U1217 ( .A(hwdata[25]), .Y(n1071) );
  MUX2X1 U1218 ( .B(n1073), .A(n1074), .S(n758), .Y(n298) );
  INVX1 U1219 ( .A(hwdata[26]), .Y(n1073) );
  MUX2X1 U1220 ( .B(n1075), .A(n1076), .S(n758), .Y(n297) );
  INVX1 U1221 ( .A(hwdata[27]), .Y(n1075) );
  MUX2X1 U1222 ( .B(n1077), .A(n1078), .S(n758), .Y(n296) );
  INVX1 U1223 ( .A(hwdata[28]), .Y(n1077) );
  MUX2X1 U1224 ( .B(n1079), .A(n1080), .S(n758), .Y(n295) );
  INVX1 U1225 ( .A(hwdata[29]), .Y(n1079) );
  MUX2X1 U1226 ( .B(n1081), .A(n1082), .S(n758), .Y(n294) );
  INVX1 U1227 ( .A(hwdata[30]), .Y(n1081) );
  MUX2X1 U1228 ( .B(n1083), .A(n1084), .S(n758), .Y(n293) );
  NAND2X1 U1229 ( .A(n1052), .B(n1050), .Y(n1049) );
  INVX1 U1230 ( .A(n1085), .Y(n1050) );
  NAND3X1 U1231 ( .A(n938), .B(n1014), .C(n1012), .Y(n1085) );
  INVX1 U1232 ( .A(n1086), .Y(n1012) );
  NAND3X1 U1233 ( .A(prev_htrans[1]), .B(prev_hwrite), .C(n1087), .Y(n1086) );
  AND2X1 U1234 ( .A(n1088), .B(hsel), .Y(n1087) );
  NOR2X1 U1235 ( .A(n1051), .B(prev_hsize[0]), .Y(n1052) );
  INVX1 U1236 ( .A(prev_hsize[1]), .Y(n1051) );
  INVX1 U1237 ( .A(hwdata[31]), .Y(n1083) );
  AND2X1 U1238 ( .A(n1089), .B(n1019), .Y(hready) );
  NAND3X1 U1239 ( .A(n962), .B(n973), .C(state[0]), .Y(n1019) );
  INVX1 U1240 ( .A(state[2]), .Y(n973) );
  INVX1 U1241 ( .A(state[1]), .Y(n962) );
  OAI21X1 U1242 ( .A(haddr[0]), .B(n1090), .C(hresp), .Y(n1089) );
  OAI21X1 U1243 ( .A(n1091), .B(n1092), .C(n1093), .Y(hresp) );
  NAND2X1 U1244 ( .A(haddr[2]), .B(haddr[1]), .Y(n1092) );
  INVX1 U1245 ( .A(haddr[3]), .Y(n1091) );
  INVX1 U1246 ( .A(n1093), .Y(n1090) );
  NAND2X1 U1247 ( .A(n1094), .B(hwrite), .Y(n1093) );
  MUX2X1 U1248 ( .B(n1095), .A(n1096), .S(haddr[3]), .Y(n1094) );
  NAND3X1 U1249 ( .A(n1097), .B(n1095), .C(n1098), .Y(n1096) );
  INVX1 U1250 ( .A(haddr[0]), .Y(n1098) );
  INVX1 U1251 ( .A(haddr[1]), .Y(n1097) );
  INVX1 U1252 ( .A(haddr[2]), .Y(n1095) );
  OAI21X1 U1253 ( .A(n1033), .B(n760), .C(n1100), .Y(hrdata[9]) );
  AOI22X1 U1254 ( .A(N779), .B(n1101), .C(N846), .D(n1102), .Y(n1100) );
  INVX1 U1255 ( .A(\mem[1][1] ), .Y(n1033) );
  OAI21X1 U1256 ( .A(n1030), .B(n760), .C(n1103), .Y(hrdata[8]) );
  AOI22X1 U1257 ( .A(N780), .B(n1101), .C(N847), .D(n1102), .Y(n1103) );
  INVX1 U1258 ( .A(\mem[1][0] ), .Y(n1030) );
  OAI21X1 U1259 ( .A(n1028), .B(n760), .C(n1104), .Y(hrdata[7]) );
  AOI22X1 U1260 ( .A(N840), .B(n1105), .C(N773), .D(n1102), .Y(n1104) );
  INVX1 U1261 ( .A(\mem[0][7] ), .Y(n1028) );
  OAI21X1 U1262 ( .A(n1027), .B(n760), .C(n1106), .Y(hrdata[6]) );
  AOI22X1 U1263 ( .A(N841), .B(n1105), .C(N774), .D(n1102), .Y(n1106) );
  INVX1 U1264 ( .A(\mem[0][6] ), .Y(n1027) );
  OAI21X1 U1265 ( .A(n1026), .B(n760), .C(n1107), .Y(hrdata[5]) );
  AOI22X1 U1266 ( .A(N842), .B(n1105), .C(N775), .D(n1102), .Y(n1107) );
  INVX1 U1267 ( .A(\mem[0][5] ), .Y(n1026) );
  OAI21X1 U1268 ( .A(n1025), .B(n1099), .C(n1108), .Y(hrdata[4]) );
  AOI22X1 U1269 ( .A(N843), .B(n1105), .C(N776), .D(n1102), .Y(n1108) );
  INVX1 U1270 ( .A(\mem[0][4] ), .Y(n1025) );
  OAI21X1 U1271 ( .A(n1024), .B(n1099), .C(n1109), .Y(hrdata[3]) );
  AOI22X1 U1272 ( .A(N844), .B(n1105), .C(N777), .D(n1102), .Y(n1109) );
  INVX1 U1273 ( .A(\mem[0][3] ), .Y(n1024) );
  NOR2X1 U1274 ( .A(n1084), .B(n760), .Y(hrdata[31]) );
  INVX1 U1275 ( .A(\mem[3][7] ), .Y(n1084) );
  NOR2X1 U1276 ( .A(n1082), .B(n760), .Y(hrdata[30]) );
  INVX1 U1277 ( .A(\mem[3][6] ), .Y(n1082) );
  OAI21X1 U1278 ( .A(n1023), .B(n1099), .C(n1110), .Y(hrdata[2]) );
  AOI22X1 U1279 ( .A(N845), .B(n1105), .C(N778), .D(n1102), .Y(n1110) );
  INVX1 U1280 ( .A(\mem[0][2] ), .Y(n1023) );
  NOR2X1 U1281 ( .A(n1080), .B(n760), .Y(hrdata[29]) );
  INVX1 U1282 ( .A(\mem[3][5] ), .Y(n1080) );
  NOR2X1 U1283 ( .A(n1078), .B(n760), .Y(hrdata[28]) );
  INVX1 U1284 ( .A(\mem[3][4] ), .Y(n1078) );
  NOR2X1 U1285 ( .A(n1076), .B(n760), .Y(hrdata[27]) );
  INVX1 U1286 ( .A(\mem[3][3] ), .Y(n1076) );
  NOR2X1 U1287 ( .A(n1074), .B(n760), .Y(hrdata[26]) );
  INVX1 U1288 ( .A(\mem[3][2] ), .Y(n1074) );
  NOR2X1 U1289 ( .A(n1072), .B(n760), .Y(hrdata[25]) );
  INVX1 U1290 ( .A(\mem[3][1] ), .Y(n1072) );
  NOR2X1 U1291 ( .A(n1070), .B(n760), .Y(hrdata[24]) );
  INVX1 U1292 ( .A(\mem[3][0] ), .Y(n1070) );
  NOR2X1 U1293 ( .A(n1068), .B(n760), .Y(hrdata[23]) );
  INVX1 U1294 ( .A(\mem[2][7] ), .Y(n1068) );
  NOR2X1 U1295 ( .A(n1066), .B(n760), .Y(hrdata[22]) );
  INVX1 U1296 ( .A(\mem[2][6] ), .Y(n1066) );
  NOR2X1 U1297 ( .A(n1064), .B(n760), .Y(hrdata[21]) );
  INVX1 U1298 ( .A(\mem[2][5] ), .Y(n1064) );
  NOR2X1 U1299 ( .A(n1062), .B(n760), .Y(hrdata[20]) );
  INVX1 U1300 ( .A(\mem[2][4] ), .Y(n1062) );
  OAI21X1 U1301 ( .A(n1022), .B(n1099), .C(n1111), .Y(hrdata[1]) );
  AOI22X1 U1302 ( .A(n1105), .B(N846), .C(n1102), .D(N779), .Y(n1111) );
  INVX1 U1303 ( .A(\mem[0][1] ), .Y(n1022) );
  NOR2X1 U1304 ( .A(n1060), .B(n760), .Y(hrdata[19]) );
  INVX1 U1305 ( .A(\mem[2][3] ), .Y(n1060) );
  NOR2X1 U1306 ( .A(n1058), .B(n760), .Y(hrdata[18]) );
  INVX1 U1307 ( .A(\mem[2][2] ), .Y(n1058) );
  NOR2X1 U1308 ( .A(n1056), .B(n760), .Y(hrdata[17]) );
  INVX1 U1309 ( .A(\mem[2][1] ), .Y(n1056) );
  NOR2X1 U1310 ( .A(n1054), .B(n760), .Y(hrdata[16]) );
  INVX1 U1311 ( .A(\mem[2][0] ), .Y(n1054) );
  OAI21X1 U1312 ( .A(n1045), .B(n1099), .C(n1112), .Y(hrdata[15]) );
  AOI22X1 U1313 ( .A(N773), .B(n1101), .C(N840), .D(n1102), .Y(n1112) );
  INVX1 U1314 ( .A(\mem[1][7] ), .Y(n1045) );
  OAI21X1 U1315 ( .A(n1043), .B(n1099), .C(n1113), .Y(hrdata[14]) );
  AOI22X1 U1316 ( .A(N774), .B(n1101), .C(N841), .D(n1102), .Y(n1113) );
  INVX1 U1317 ( .A(\mem[1][6] ), .Y(n1043) );
  OAI21X1 U1318 ( .A(n1041), .B(n1099), .C(n1114), .Y(hrdata[13]) );
  AOI22X1 U1319 ( .A(N775), .B(n1101), .C(N842), .D(n1102), .Y(n1114) );
  INVX1 U1320 ( .A(\mem[1][5] ), .Y(n1041) );
  OAI21X1 U1321 ( .A(n1039), .B(n1099), .C(n1115), .Y(hrdata[12]) );
  AOI22X1 U1322 ( .A(N776), .B(n1101), .C(N843), .D(n1102), .Y(n1115) );
  INVX1 U1323 ( .A(\mem[1][4] ), .Y(n1039) );
  OAI21X1 U1324 ( .A(n1037), .B(n1099), .C(n1116), .Y(hrdata[11]) );
  AOI22X1 U1325 ( .A(N777), .B(n1101), .C(N844), .D(n1102), .Y(n1116) );
  INVX1 U1326 ( .A(\mem[1][3] ), .Y(n1037) );
  OAI21X1 U1327 ( .A(n1035), .B(n1099), .C(n1117), .Y(hrdata[10]) );
  AOI22X1 U1328 ( .A(N778), .B(n1101), .C(N845), .D(n1102), .Y(n1117) );
  NOR2X1 U1329 ( .A(n1118), .B(n1119), .Y(n1101) );
  INVX1 U1330 ( .A(\mem[1][2] ), .Y(n1035) );
  OAI21X1 U1331 ( .A(n1020), .B(n1099), .C(n1120), .Y(hrdata[0]) );
  AOI22X1 U1332 ( .A(n1105), .B(N847), .C(N780), .D(n1102), .Y(n1120) );
  NAND3X1 U1333 ( .A(n1122), .B(N757), .C(n1123), .Y(n1121) );
  NOR2X1 U1334 ( .A(N758), .B(n1132), .Y(n1123) );
  AND2X1 U1335 ( .A(n1122), .B(n1124), .Y(n1105) );
  OAI21X1 U1336 ( .A(n1014), .B(n1125), .C(n1119), .Y(n1124) );
  NAND3X1 U1337 ( .A(n1014), .B(n1132), .C(N757), .Y(n1119) );
  OAI21X1 U1338 ( .A(N757), .B(n1132), .C(n844), .Y(n1125) );
  INVX1 U1339 ( .A(\prev_haddr[0] ), .Y(n1132) );
  NAND3X1 U1340 ( .A(n938), .B(n1014), .C(n1122), .Y(n1099) );
  INVX1 U1341 ( .A(n1118), .Y(n1122) );
  OAI21X1 U1342 ( .A(n1126), .B(n1127), .C(hsel), .Y(n1118) );
  NAND2X1 U1343 ( .A(prev_hwrite), .B(n1088), .Y(n1127) );
  INVX1 U1344 ( .A(prev_htrans[0]), .Y(n1088) );
  INVX1 U1345 ( .A(prev_htrans[1]), .Y(n1126) );
  INVX1 U1346 ( .A(N758), .Y(n1014) );
  INVX1 U1347 ( .A(\mem[0][0] ), .Y(n1020) );
  NOR2X1 U1348 ( .A(n1128), .B(n1129), .Y(clear) );
  NAND3X1 U1349 ( .A(\mem[13][0] ), .B(n990), .C(n1130), .Y(n1129) );
  NOR2X1 U1350 ( .A(\mem[13][3] ), .B(\mem[13][2] ), .Y(n1130) );
  INVX1 U1351 ( .A(\mem[13][1] ), .Y(n990) );
  NAND3X1 U1352 ( .A(n984), .B(n982), .C(n1131), .Y(n1128) );
  NOR2X1 U1353 ( .A(\mem[13][7] ), .B(\mem[13][6] ), .Y(n1131) );
  INVX1 U1354 ( .A(\mem[13][5] ), .Y(n982) );
  INVX1 U1355 ( .A(\mem[13][4] ), .Y(n984) );
endmodule

