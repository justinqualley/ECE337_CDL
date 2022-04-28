/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 28 12:09:13 2022
/////////////////////////////////////////////////////////////


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
         n58, n59, n60, n61, n62, n66, n67;
  wire   [2:0] state;
  tri   clk;
  tri   n_rst;
  tri   rollover_flag;
  tri   [7:0] shift_data;
  tri   end_packet;
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
  NOR2X1 U37 ( .A(n36), .B(n16), .Y(end_packet) );
  INVX1 U38 ( .A(n8), .Y(n16) );
  NOR2X1 U39 ( .A(n37), .B(state[1]), .Y(n8) );
  OAI21X1 U40 ( .A(n38), .B(n36), .C(n39), .Y(n65) );
  NAND2X1 U41 ( .A(n40), .B(n41), .Y(n39) );
  OAI21X1 U42 ( .A(state[1]), .B(state[0]), .C(n42), .Y(n40) );
  INVX1 U43 ( .A(n43), .Y(n42) );
  OAI21X1 U44 ( .A(n38), .B(n44), .C(n45), .Y(n64) );
  OAI21X1 U45 ( .A(n46), .B(n43), .C(n41), .Y(n45) );
  OAI22X1 U46 ( .A(n47), .B(n10), .C(n48), .D(n35), .Y(n43) );
  INVX1 U47 ( .A(n49), .Y(n38) );
  NAND3X1 U48 ( .A(n35), .B(n41), .C(n50), .Y(n49) );
  AOI21X1 U49 ( .A(n25), .B(n48), .C(n51), .Y(n50) );
  INVX1 U50 ( .A(n10), .Y(n25) );
  NAND3X1 U51 ( .A(n44), .B(n37), .C(n52), .Y(n41) );
  MUX2X1 U52 ( .B(rollover_flag), .A(begin_packet), .S(n36), .Y(n52) );
  NAND2X1 U53 ( .A(n53), .B(n23), .Y(n35) );
  INVX1 U54 ( .A(n33), .Y(n23) );
  OAI21X1 U55 ( .A(n53), .B(n33), .C(n54), .Y(n63) );
  AOI22X1 U56 ( .A(n55), .B(n47), .C(n51), .D(state[2]), .Y(n54) );
  INVX1 U57 ( .A(n56), .Y(n51) );
  NAND3X1 U58 ( .A(n10), .B(n33), .C(n57), .Y(n56) );
  NOR2X1 U59 ( .A(end_packet), .B(n46), .Y(n57) );
  INVX1 U60 ( .A(n58), .Y(n46) );
  NAND3X1 U61 ( .A(n44), .B(n37), .C(state[0]), .Y(n58) );
  INVX1 U62 ( .A(state[1]), .Y(n44) );
  INVX1 U63 ( .A(n59), .Y(n47) );
  NAND3X1 U64 ( .A(n60), .B(n61), .C(n62), .Y(n59) );
  NOR2X1 U65 ( .A(buffer_occupancy[0]), .B(n66), .Y(n62) );
  OR2X1 U66 ( .A(buffer_occupancy[2]), .B(buffer_occupancy[1]), .Y(n66) );
  NOR2X1 U67 ( .A(buffer_occupancy[6]), .B(buffer_occupancy[5]), .Y(n61) );
  NOR2X1 U68 ( .A(buffer_occupancy[4]), .B(buffer_occupancy[3]), .Y(n60) );
  NOR2X1 U69 ( .A(n10), .B(n48), .Y(n55) );
  INVX1 U70 ( .A(rollover_flag), .Y(n48) );
  NAND3X1 U71 ( .A(state[1]), .B(n37), .C(state[0]), .Y(n10) );
  NAND3X1 U72 ( .A(n36), .B(n37), .C(state[1]), .Y(n33) );
  INVX1 U73 ( .A(state[2]), .Y(n37) );
  INVX1 U74 ( .A(state[0]), .Y(n36) );
  INVX1 U75 ( .A(n67), .Y(n53) );
  NAND3X1 U76 ( .A(n20), .B(n21), .C(tx_packet[0]), .Y(n67) );
  INVX1 U77 ( .A(tx_packet[2]), .Y(n21) );
  INVX1 U78 ( .A(tx_packet[1]), .Y(n20) );
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
  tri   clk;
  tri   n_rst;
  tri   end_packet;
  tri   tx_transfer_active;
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
  OAI21X1 U14 ( .A(state[0]), .B(n13), .C(n14), .Y(tx_transfer_active) );
  NAND3X1 U15 ( .A(n15), .B(n16), .C(n17), .Y(n1) );
  AND2X1 U16 ( .A(n18), .B(n19), .Y(n17) );
  NOR2X1 U17 ( .A(buffer_occupancy[6]), .B(buffer_occupancy[5]), .Y(n19) );
  NOR2X1 U18 ( .A(buffer_occupancy[4]), .B(buffer_occupancy[3]), .Y(n18) );
  NOR2X1 U19 ( .A(buffer_occupancy[2]), .B(buffer_occupancy[1]), .Y(n16) );
  NOR2X1 U20 ( .A(buffer_occupancy[0]), .B(n8), .Y(n15) );
  NOR2X1 U21 ( .A(state[0]), .B(n20), .Y(n28) );
  MUX2X1 U22 ( .B(n21), .A(end_packet), .S(state[1]), .Y(n20) );
  OR2X1 U23 ( .A(n8), .B(tx_packet[0]), .Y(n21) );
  OR2X1 U24 ( .A(tx_packet[1]), .B(tx_packet[2]), .Y(n8) );
  INVX1 U25 ( .A(n14), .Y(get_tx_packet_data) );
  NAND2X1 U26 ( .A(state[0]), .B(n13), .Y(n14) );
  INVX1 U27 ( .A(state[1]), .Y(n13) );
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
  wire   prev_dplus, begin_packet, n5;
  tri   clk;
  tri   n_rst;
  tri   tx_transfer_active;
  tri   end_packet;
  tri   rollover_flag;
  tri   [7:0] shift_data;
  tri   serial_out;
  tri   n6;
  tri   n7;

  DFFSR prev_dplus_reg ( .D(dplus_out), .CLK(clk), .R(1'b1), .S(n_rst), .Q(
        prev_dplus) );
  flex_counter counter ( .clk(clk), .n_rst(n_rst), .clear(end_packet), 
        .count_enable(tx_transfer_active), .rollover_val({1'b1, 1'b0, 1'b0, 
        1'b0}), .rollover_flag(rollover_flag) );
  flex_pts_sr CORE ( .clk(clk), .n_rst(n_rst), .shift_enable(
        tx_transfer_active), .load_enable(rollover_flag), .parallel_in(
        shift_data), .serial_out(serial_out) );
  encoder ENC ( .clk(clk), .n_rst(n_rst), .begin_packet(begin_packet), 
        .tx_packet(tx_packet), .tx_packet_data(tx_packet_data), 
        .rollover_flag(rollover_flag), .buffer_occupancy(buffer_occupancy), 
        .end_packet(end_packet), .shift_data(shift_data) );
  control_logic CL ( .clk(clk), .n_rst(n_rst), .tx_packet(tx_packet), 
        .end_packet(end_packet), .buffer_occupancy(buffer_occupancy), 
        .tx_transfer_active(tx_transfer_active), .get_tx_packet_data(
        get_tx_packet_data), .begin_packet(begin_packet), .tx_error(tx_error)
         );
  INVX1 U8 ( .A(dplus_out), .Y(dminus_out) );
  NAND2X1 U9 ( .A(n5), .B(tx_transfer_active), .Y(dplus_out) );
  XNOR2X1 U10 ( .A(serial_out), .B(prev_dplus), .Y(n5) );
endmodule

