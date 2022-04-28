A guide to the project files for the cooperative design lab in ECE33700.
Team members contributing to this project were:
Justin Qualley
Robert Sego

All files for this project can be found in
~mg56/ECE337_CDL/
source/
ahb_tx_cdl.sv - top level RTL code for entire design
ahb_slave.sv - handles AHB-Lite protocol to send data and interface with the USB TX
tx.sv - handles sending any of the basic packet types sent from an endpoint to the host during transfers
control_logic.sv -
data_buffer.sv - 64 Byte Buffer to store data to be sent
encoder.sv -
flex_counter.sv - counter module that can be extended to any number of bits
flex_pts_sr.sv - parallel to Serial shift register that can be extended to any number of bits
tb_ahb_slave.sv - testbench for ahb_slave.sv
tb_ahb_tx_cdl.sv - testbench for ahb_tx_cdl.sv, the top level moduule
tb_data_buffer.sv - testbench for data_buffer.sv
tb_tx.sv - testbench for tx.sv, the USB transmitter
ahb_tx_cdl.log - synthesis report file for top level module
ahb_slave.log - synthesis report file for ahb_slave.sv module
tx.sv - synthesis report file for tx.sv module
data_buffer.sv - synthesis report file for data_buffer.sv module
Page 1 of 1
