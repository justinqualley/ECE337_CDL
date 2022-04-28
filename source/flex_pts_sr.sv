// $Id: $
// File name:   flex_pts_sr.sv
// Created:     2/10/2022
// Author:      Robert Sego
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: parallel to serias

module flex_pts_sr
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
  input logic clk,
  input logic n_rst,
  input logic shift_enable,
  input logic load_enable,
  input logic [(NUM_BITS-1):0] parallel_in,
  output logic serial_out 
);

    logic [(NUM_BITS)-1:0] loaded; //
    logic [(NUM_BITS)-1:0] next;

    always_comb begin
        if(load_enable == 1) begin
            next = parallel_in;
        end else if(shift_enable == 1) begin
            if(SHIFT_MSB == 1) begin
                next = (next << 1) | 1'b1;
            end else begin
                next = (next >> 1) | (1 << (NUM_BITS-1));
            end
        end else begin
            next = loaded;
        end
    end

    always_ff @(negedge n_rst, posedge clk ) begin
        if(n_rst == 0) begin
            loaded <= -'b1;
        end else begin
            loaded <= next;
        end
    end

    always_comb begin
        if(SHIFT_MSB == 1) begin
            serial_out = loaded[NUM_BITS-1];
        end else begin
            serial_out = loaded[0];
        end
    end

endmodule