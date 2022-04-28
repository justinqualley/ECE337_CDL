/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06-SP1
// Date      : Thu Apr 28 12:06:26 2022
/////////////////////////////////////////////////////////////


module control_logic ( clk, n_rst, tx_packet, end_packet, buffer_occupancy, 
        tx_transfer_active, get_tx_packet_data, begin_packet, tx_error );
  input [2:0] tx_packet;
  input [6:0] buffer_occupancy;
  input clk, n_rst, end_packet;
  output tx_transfer_active, get_tx_packet_data, begin_packet, tx_error;
  wire   n28, begin_packet, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n41, n42, n43, n44, n45, n46;
  wire   [1:0] state;
  wire   [1:0] prev_tx_packet;
  assign get_tx_packet_data = begin_packet;

  DFFSR \prev_tx_packet_reg[1]  ( .D(tx_packet[1]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(prev_tx_packet[1]) );
  DFFSR \prev_tx_packet_reg[0]  ( .D(tx_packet[0]), .CLK(clk), .R(n_rst), .S(
        1'b1), .Q(prev_tx_packet[0]) );
  DFFSR \state_reg[0]  ( .D(n28), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(tx_transfer_active), .CLK(clk), .R(n_rst), .S(1'b1), .Q(state[1]) );
  AOI21X1 U31 ( .A(n30), .B(n31), .C(n32), .Y(tx_error) );
  OAI21X1 U32 ( .A(tx_packet[0]), .B(n33), .C(n34), .Y(n32) );
  NAND3X1 U33 ( .A(n35), .B(n36), .C(n37), .Y(n34) );
  XNOR2X1 U34 ( .A(tx_packet[1]), .B(prev_tx_packet[1]), .Y(n37) );
  INVX1 U35 ( .A(tx_packet[2]), .Y(n36) );
  XNOR2X1 U36 ( .A(tx_packet[0]), .B(prev_tx_packet[0]), .Y(n35) );
  INVX1 U37 ( .A(tx_transfer_active), .Y(n31) );
  OAI21X1 U38 ( .A(state[0]), .B(n38), .C(n39), .Y(tx_transfer_active) );
  NAND3X1 U39 ( .A(n40), .B(n41), .C(n42), .Y(n30) );
  AND2X1 U40 ( .A(n43), .B(n44), .Y(n42) );
  NOR2X1 U41 ( .A(buffer_occupancy[6]), .B(buffer_occupancy[5]), .Y(n44) );
  NOR2X1 U42 ( .A(buffer_occupancy[4]), .B(buffer_occupancy[3]), .Y(n43) );
  NOR2X1 U43 ( .A(buffer_occupancy[2]), .B(buffer_occupancy[1]), .Y(n41) );
  NOR2X1 U44 ( .A(buffer_occupancy[0]), .B(n33), .Y(n40) );
  NOR2X1 U45 ( .A(state[0]), .B(n45), .Y(n28) );
  MUX2X1 U46 ( .B(n46), .A(end_packet), .S(state[1]), .Y(n45) );
  OR2X1 U47 ( .A(n33), .B(tx_packet[0]), .Y(n46) );
  OR2X1 U48 ( .A(tx_packet[1]), .B(tx_packet[2]), .Y(n33) );
  INVX1 U49 ( .A(n39), .Y(begin_packet) );
  NAND2X1 U50 ( .A(state[0]), .B(n38), .Y(n39) );
  INVX1 U51 ( .A(state[1]), .Y(n38) );
endmodule

