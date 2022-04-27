// $Id: $
// File name:   tx.sv
// Created:     4/27/2022
// Author:      Robert Sego
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: usb transmitter

module tx(
  input logic [7:0] tx_packet_data,
  input logic [2:0] tx_packet,
  input logic [6:0] buffer_occupancy,
  output logic get_tx_packet_data,
  output logic tx_transfer_active,
  output logic tx_error,
  output logic dplus_out,
  output logic dminus_out
);



endmodule