// $Id: $
// File name:   control_logic.sv
// Created:     4/27/2022
// Author:      Robert Sego
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: control logic
`define IDLE 2'b00
`define BEGIN 2'b01
`define ACTIVE 2'b10

module control_logic (
  input logic clk,
  input logic n_rst,
  input logic [2:0] tx_packet,
  input logic end_packet,
  output logic tx_transfer_active,
  output logic get_tx_packet_data,
  output logic begin_packet,
  output logic tx_error
);

  // Somewhere in here should be the tx_error?

  logic [1:0] state;
  logic [1:0] nxt_state;

  always_ff @(posedge clk, negedge n_rst) begin
    if (n_rst == 0) begin
      state <= 0;
    end else begin
      state <= nxt_state;
    end
  end

  always_comb begin
    nxt_state = state;

    case(state)
      `IDLE: begin
        if(tx_packet != 0)
          nxt_state = `BEGIN;
      end
      `BEGIN: begin
        nxt_state = `ACTIVE;
      end
      `ACTIVE: begin
        if(end_packet)
          nxt_state = `IDLE;
      end
    endcase
  end

  assign tx_transfer_active = (state == `BEGIN) | (state == `ACTIVE);
  assign get_tx_packet_data = (state == `BEGIN);
  assign begin_packet = (state == `BEGIN);

endmodule