// $Id: $
// File name:   data_buffer.sv
// Created:     3/25/2022
// Author:      Robert Sego
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: data buffer

module data_buffer (
  input logic clk,
  input logic n_rst,
  input logic [7:0] tx_data,
  input logic store_tx_data,
  input logic get_tx_packet_data,
  input logic clear,
  output logic [6:0] buffer_occupancy,
  output logic [7:0] tx_packet_data
);

  // buffer occupancy counter
  logic [6:0] nxt_buffer_occupancy;
  logic [7:0] nxt_tx_packet_data;
  
  always_ff @(posedge clk, negedge n_rst) begin
    if (n_rst == 0) begin
      buffer_occupancy <= 0;
    end else begin
      buffer_occupancy <= nxt_buffer_occupancy;
    end
  end

  always_comb begin
    nxt_buffer_occupancy = buffer_occupancy;
    if(get_tx_packet_data & buffer_occupancy > 0) begin 
      nxt_buffer_occupancy = buffer_occupancy - 1;
    end else if(store_tx_data & buffer_occupancy < 64) begin
      nxt_buffer_occupancy = buffer_occupancy + 1;
    end else if(buffer_occupancy == 64 & store_tx_data) begin // if buffer full and push new byte, reset buffer occupancy to 1
      nxt_buffer_occupancy = 1;
    end
    if(clear) begin
      nxt_buffer_occupancy = 0;
    end
  end


  // buffer push pop logic
  logic [511:0] buffer;
  logic [511:0] nxt_buffer;

  always_ff @(posedge clk, negedge n_rst) begin
    if (n_rst == 0) begin
      buffer <= 0;
      tx_packet_data <= 0;
    end else begin
      buffer <= nxt_buffer;
      tx_packet_data <= nxt_tx_packet_data;
    end
  end

  always_comb begin
    nxt_buffer = buffer;

    // push
    if(store_tx_data) begin
      nxt_buffer = {buffer[503:0], tx_data[7:0]}; // Move whole buffer over 1 byte
    end

    //pop
    // Very likely that this doesnt actually do anything, make sure to check later
    nxt_tx_packet_data = tx_packet_data;
    for(int i=0; i < 64; i = i+1) begin
      if(get_tx_packet_data & buffer_occupancy == i+1)
        nxt_tx_packet_data = buffer[i*8 +: 8];
    end
  end




endmodule