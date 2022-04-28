/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 28 12:08:19 2022
/////////////////////////////////////////////////////////////


module encoder ( clk, n_rst, begin_packet, tx_packet, tx_packet_data, 
        rollover_flag, buffer_occupancy, end_packet, shift_data, is_eop );
  input [2:0] tx_packet;
  input [7:0] tx_packet_data;
  input [6:0] buffer_occupancy;
  output [7:0] shift_data;
  input clk, n_rst, begin_packet, rollover_flag;
  output end_packet, is_eop;
  wire   n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127;
  wire   [2:0] state;
  assign is_eop = 1'b1;

  DFFSR \state_reg[0]  ( .D(n65), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n64), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(n63), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[2])
         );
  OAI21X1 U74 ( .A(n66), .B(n67), .C(n68), .Y(shift_data[7]) );
  AOI21X1 U75 ( .A(state[0]), .B(n69), .C(n70), .Y(n68) );
  OAI21X1 U76 ( .A(state[2]), .B(n71), .C(state[1]), .Y(n69) );
  INVX1 U77 ( .A(tx_packet_data[7]), .Y(n71) );
  OAI21X1 U78 ( .A(n72), .B(n73), .C(n74), .Y(shift_data[6]) );
  AOI21X1 U79 ( .A(n75), .B(n76), .C(n70), .Y(n74) );
  INVX1 U80 ( .A(tx_packet_data[6]), .Y(n73) );
  OAI21X1 U81 ( .A(n72), .B(n77), .C(n78), .Y(shift_data[5]) );
  INVX1 U82 ( .A(tx_packet_data[5]), .Y(n77) );
  NAND2X1 U83 ( .A(n79), .B(n80), .Y(shift_data[4]) );
  MUX2X1 U84 ( .B(n75), .A(n81), .S(n82), .Y(n80) );
  NOR2X1 U85 ( .A(n83), .B(n84), .Y(n81) );
  NAND2X1 U86 ( .A(n85), .B(n86), .Y(n84) );
  AOI21X1 U87 ( .A(tx_packet_data[4]), .B(n87), .C(n70), .Y(n79) );
  NAND3X1 U88 ( .A(n88), .B(n78), .C(n89), .Y(shift_data[3]) );
  AOI22X1 U89 ( .A(n90), .B(n75), .C(tx_packet_data[3]), .D(n87), .Y(n89) );
  NOR2X1 U90 ( .A(n82), .B(n86), .Y(n90) );
  NAND3X1 U91 ( .A(n88), .B(n78), .C(n91), .Y(shift_data[2]) );
  NAND2X1 U92 ( .A(tx_packet_data[2]), .B(n87), .Y(n91) );
  INVX1 U93 ( .A(n92), .Y(shift_data[1]) );
  AOI21X1 U94 ( .A(n87), .B(tx_packet_data[1]), .C(n93), .Y(n92) );
  OAI21X1 U95 ( .A(n67), .B(n94), .C(n88), .Y(n93) );
  NAND3X1 U96 ( .A(tx_packet[2]), .B(n85), .C(n94), .Y(n88) );
  INVX1 U97 ( .A(n76), .Y(n94) );
  NAND2X1 U98 ( .A(n66), .B(n86), .Y(n76) );
  INVX1 U99 ( .A(tx_packet[0]), .Y(n86) );
  XNOR2X1 U100 ( .A(tx_packet[0]), .B(tx_packet[1]), .Y(n66) );
  INVX1 U101 ( .A(n75), .Y(n67) );
  NOR2X1 U102 ( .A(n95), .B(tx_packet[2]), .Y(n75) );
  OAI21X1 U103 ( .A(n72), .B(n96), .C(n97), .Y(shift_data[0]) );
  INVX1 U104 ( .A(tx_packet_data[0]), .Y(n96) );
  OAI21X1 U105 ( .A(n98), .B(n99), .C(n100), .Y(n65) );
  NAND2X1 U106 ( .A(n101), .B(n102), .Y(n100) );
  OAI21X1 U107 ( .A(state[1]), .B(state[0]), .C(n103), .Y(n101) );
  INVX1 U108 ( .A(n104), .Y(n103) );
  OAI21X1 U109 ( .A(n98), .B(n105), .C(n106), .Y(n64) );
  OAI21X1 U110 ( .A(n107), .B(n104), .C(n102), .Y(n106) );
  OAI22X1 U111 ( .A(n108), .B(n72), .C(n109), .D(n97), .Y(n104) );
  INVX1 U112 ( .A(n110), .Y(n98) );
  NAND3X1 U113 ( .A(n97), .B(n102), .C(n111), .Y(n110) );
  AOI21X1 U114 ( .A(n87), .B(n109), .C(n112), .Y(n111) );
  INVX1 U115 ( .A(n72), .Y(n87) );
  NAND3X1 U116 ( .A(n105), .B(n113), .C(n114), .Y(n102) );
  MUX2X1 U117 ( .B(rollover_flag), .A(begin_packet), .S(n99), .Y(n114) );
  NAND2X1 U118 ( .A(n115), .B(n85), .Y(n97) );
  OAI21X1 U119 ( .A(n115), .B(n95), .C(n116), .Y(n63) );
  AOI22X1 U120 ( .A(n117), .B(n108), .C(n112), .D(state[2]), .Y(n116) );
  INVX1 U121 ( .A(n118), .Y(n112) );
  NAND3X1 U122 ( .A(n119), .B(n72), .C(n120), .Y(n118) );
  NOR2X1 U123 ( .A(n107), .B(n85), .Y(n120) );
  INVX1 U124 ( .A(n95), .Y(n85) );
  INVX1 U125 ( .A(n121), .Y(n107) );
  NAND3X1 U126 ( .A(n105), .B(n113), .C(state[0]), .Y(n121) );
  INVX1 U127 ( .A(state[1]), .Y(n105) );
  INVX1 U128 ( .A(end_packet), .Y(n119) );
  NOR2X1 U129 ( .A(n78), .B(n99), .Y(end_packet) );
  INVX1 U130 ( .A(n70), .Y(n78) );
  NOR2X1 U131 ( .A(n113), .B(state[1]), .Y(n70) );
  INVX1 U132 ( .A(n122), .Y(n108) );
  NAND3X1 U133 ( .A(n123), .B(n124), .C(n125), .Y(n122) );
  NOR2X1 U134 ( .A(buffer_occupancy[0]), .B(n126), .Y(n125) );
  OR2X1 U135 ( .A(buffer_occupancy[2]), .B(buffer_occupancy[1]), .Y(n126) );
  NOR2X1 U136 ( .A(buffer_occupancy[6]), .B(buffer_occupancy[5]), .Y(n124) );
  NOR2X1 U137 ( .A(buffer_occupancy[4]), .B(buffer_occupancy[3]), .Y(n123) );
  NOR2X1 U138 ( .A(n72), .B(n109), .Y(n117) );
  INVX1 U139 ( .A(rollover_flag), .Y(n109) );
  NAND3X1 U140 ( .A(state[1]), .B(n113), .C(state[0]), .Y(n72) );
  NAND3X1 U141 ( .A(n99), .B(n113), .C(state[1]), .Y(n95) );
  INVX1 U142 ( .A(state[2]), .Y(n113) );
  INVX1 U143 ( .A(state[0]), .Y(n99) );
  INVX1 U144 ( .A(n127), .Y(n115) );
  NAND3X1 U145 ( .A(n82), .B(n83), .C(tx_packet[0]), .Y(n127) );
  INVX1 U146 ( .A(tx_packet[2]), .Y(n83) );
  INVX1 U147 ( .A(tx_packet[1]), .Y(n82) );
endmodule

