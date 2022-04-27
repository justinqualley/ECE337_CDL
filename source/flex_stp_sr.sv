// $Id: $
// File name:   flex_stp_sr.sv
// Created:     2/10/2022
// Author:      Robert Sego
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: serial to parallel

module flex_stp_sr
#(
    parameter NUM_BITS = 4,
    parameter SHIFT_MSB = 1
)
(
  input logic clk,
  input logic n_rst,
  input logic serial_in,
  input logic shift_enable,
  output logic [NUM_BITS-1:0] parallel_out 
);

    logic [NUM_BITS-1:0] next;

    always_comb begin
        next = parallel_out;

        if(shift_enable == 1) begin
            if(SHIFT_MSB == 1) begin
                next = (parallel_out << 1) | serial_in;
            end else begin
                next = (parallel_out >> 1) | (serial_in << (NUM_BITS-1));
            end
        end
    end

    always_ff @(negedge n_rst, posedge clk ) begin
        
        if(n_rst == 0) begin
            parallel_out <= '1;
        end else begin
            parallel_out <= next;
        end

    end

    //always_comb begin
    //    parallel_out = shift;
    //end


endmodule