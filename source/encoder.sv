// $Id: $
// File name:   encoder.sv
// Created:     4/27/2022
// Author:      Robert Sego
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: encoder
`define IDLE 4'b0000
`define SYNC 4'b0001
`define PID 4'b0010
`define DATA 4'b0011
`define EOP1 4'b0100
`define EOP2 4'b0101

module encoder (
  input logic clk,
  input logic n_rst,
  input logic begin_packet,
  input logic tx_packet,
  input logic [7:0] tx_packet_data,
  input logic rollover_flag,
  input logic [6:0] buffer_occupancy,
  output logic end_packet,
  output logic [7:0] shift_data,
  output logic is_eop
);

  logic [1:0] state;
  logic [1:0] nxt_state;

  always_ff @(posedge clk, negedge n_rst) begin
    if (n_rst == 0) begin
      state <= 0;
    end else begin
      state <= nxt_state;
    end
  end


  logic [2:0] encode;

  always_comb begin
    nxt_state = state;

    case(state)
      `IDLE: begin
        encode = 0;
        if(begin_packet)
          nxt_state = `SYNC;
      end
      `SYNC: begin
        encode = 1;
        if(rollover_flag)
          nxt_state = `PID;
      end
      `PID: begin
        encode = 2;
        if(tx_packet != 1)
          nxt_state = `EOP1;
        else if(rollover_flag)
          nxt_state = `DATA;
      end
      `DATA: begin
        encode = 3;
        if(rollover_flag & (buffer_occupancy > 0))
          nxt_state = `DATA;
        else if(rollover_flag)
          nxt_state = `EOP1;
      end
      `EOP1: begin
        encode = 4;
        nxt_state = `EOP2;
      end
      `EOP2: begin
        encode = 4;
        nxt_state = `IDLE;
      end
    endcase
  end


  logic [7:0] pid;

  always_comb begin
    is_eop = 0;
    shift_data = 0;

    case(tx_packet)
      1: pid = 8'b11000011; // DATA0 0011
      2: pid = 8'b11010010; // ACK   0010
      3: pid = 8'b01011010; // NAK   1010
      4: pid = 8'b00011110; // STALL 1110
      default: pid = 8'b00000000;
    endcase

    if(encode == 1)
      shift_data = 8'b00000001; // SYNC_BYTE
    if(encode == 2)
      shift_data = pid;
    if(encode == 3)
      shift_data = tx_packet_data;
    if(encode == 4)
      shift_data = 8'b11111100; // Assuming lsb and idle value for dplus is 1
      is_eop = 1;
  end
  

endmodule