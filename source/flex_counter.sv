// $Id: $
// File name:   flex_counter.sv
// Created:     2/9/2022
// Author:      Robert Sego
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: flexible counter

module flex_counter
#(
    parameter NUM_CNT_BITS = 4
)
(
    input logic clk,
    input logic n_rst,
    input logic clear,
    input logic count_enable,
    input logic [NUM_CNT_BITS-1:0] rollover_val,
    output logic [NUM_CNT_BITS-1:0] count_out,
    output logic rollover_flag
);
  always_ff @ (posedge clk, negedge n_rst) begin : counter

    if(n_rst == 0) begin
      count_out <= 0;
      rollover_flag <= 0;
    end else if (clear) begin
      count_out <= 1;
      rollover_flag <= 0;
    end else if(count_enable) begin

      count_out <= count_out + 1;
      rollover_flag <= 0;

      if (count_out >= rollover_val) begin
        count_out <= 1;
        rollover_flag <= 1;
      end

    end

  end

endmodule