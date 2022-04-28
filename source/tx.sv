// $Id: $
// File name:   tx.sv
// Created:     4/27/2022
// Author:      Robert Sego
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: usb transmitter

module tx(
  input logic clk,
  input logic n_rst,
  input logic [7:0] tx_packet_data,
  input logic [2:0] tx_packet,
  input logic [6:0] buffer_occupancy,
  output logic get_tx_packet_data,
  output logic tx_transfer_active,
  output logic tx_error,
  output logic dplus_out,
  output logic dminus_out
);

  // Should clear be tx_error?
  logic clear;
  logic count;
  logic rollover_flag;
  flex_counter counter (
    .clk(clk),
    .n_rst(n_rst),
    .clear(clear),
    .count_enable(tx_transfer_active),
    .rollover_val(8),
    .count_out(count),
    .rollover_flag(rollover_flag)
  );

  flex_pts_sr #(
    .NUM_BITS(4),
    .SHIFT_MSB(0)
  )
  CORE(
    .clk(clk),
    .n_rst(n_rst),
    .shift_enable(tx_transfer_active),
    .load_enable(rollover_flag),
    .parallel_in(shift_data),
    .serial_out(dplus_out) 
  );
  assign dminus_out = !dplus_out;

  

  logic end_packet;
  logic begin_packet;
  // ************************************************************
  // * ENCODER
  // ************************************************************
  encoder (
    .clk(clk),
    .n_rst(n_rst),

  );

  // ************************************************************
  // * CONTROL LOGIC
  // ************************************************************
  control_logic (
    .clk(clk),
    .n_rst(n_rst),
    .tx_packet(tx_packet),
    .end_packet(end_packet),
    .tx_transfer_active(tx_transfer_active),
    .get_tx_packet_data(get_tx_packet_data),
    .begin_packet(begin_packet),
    .tx_error(tx_error)
  );


endmodule