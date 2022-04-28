// $Id: $
// File name:   tb_data_buffer.sv
// Created:     4/27/2022
// Author:      Robert Sego
// Lab Section: 337-015
// Version:     1.0  Initial Design Entry
// Description: data buffer test bench

`timescale 1ns / 10ps

module tb_data_buffer();
// Timing related constants
localparam CLK_PERIOD = 10;

//*****************************************************************************
// General System signals
//*****************************************************************************
logic tb_clk;
logic tb_n_rst;

//*****************************************************************************
// Declare TB Signals (Bus Model Controls)
//*****************************************************************************
logic [7:0] tb_tx_data;
logic tb_store_tx_data;
logic tb_get_tx_packet_data;
logic tb_clear;
logic [6:0] tb_buffer_occupancy;
logic [7:0] tb_tx_packet_data;

// Expected outputs
logic [6:0] tb_expected_buffer_occupancy;
logic [7:0] tb_expected_tx_packet_data;

// Test controls
string                 tb_test_case;
integer                tb_test_case_num;
string                 tb_check_tag;
logic                  tb_mismatch;
logic                  tb_check;
integer                tb_i;

//*****************************************************************************
// Clock Generation Block
//*****************************************************************************
// Clock generation block
always begin
  // Start with clock low to avoid false rising edge events at t=0
  tb_clk = 1'b0;
  // Wait half of the clock period before toggling clock value (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
  tb_clk = 1'b1;
  // Wait half of the clock period before toggling clock value via rerunning the block (maintain 50% duty cycle)
  #(CLK_PERIOD/2.0);
end

data_buffer DUT(
  .clk(tb_clk),
  .n_rst(tb_n_rst),
  .tx_data(tb_tx_data),
  .store_tx_data(tb_store_tx_data),
  .get_tx_packet_data(tb_get_tx_packet_data),
  .clear(tb_clear),
  .buffer_occupancy(tb_buffer_occupancy),
  .tx_packet_data(tb_tx_packet_data)
);



//*****************************************************************************
// DUT Related TB Tasks
//*****************************************************************************
// Task for standard DUT reset procedure
task reset_dut;
begin
  // Activate the reset
  tb_n_rst = 1'b0;

  // Maintain the reset for more than one cycle
  @(posedge tb_clk);
  @(posedge tb_clk);

  // Wait until safely away from rising edge of the clock before releasing
  @(negedge tb_clk);
  tb_n_rst = 1'b1;

  // Leave out of reset for a couple cycles before allowing other stimulus
  // Wait for negative clock edges, 
  // since inputs to DUT should normally be applied away from rising clock edges
  @(negedge tb_clk);
  @(negedge tb_clk);
end
endtask

// Task to cleanly and consistently check DUT output values
task check_outputs;
begin
  tb_mismatch = 1'b0;
  tb_check    = 1'b1;
  if(tb_expected_buffer_occupancy == tb_buffer_occupancy) begin // Check passed
    $info("Correct 'tb_buffer_occupancy' output during %s test case", tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'tb_buffer_occupancy' output during %s test case", tb_test_case);
  end

  if(tb_expected_tx_packet_data == tb_tx_packet_data) begin // Check passed
    $info("Correct 'tb_tx_packet_data' output during %s test case", tb_test_case);
  end
  else begin // Check failed
    tb_mismatch = 1'b1;
    $error("Incorrect 'tb_tx_packet_data' output during %s test case", tb_test_case);
  end

  // Wait some small amount of time so check pulse timing is visible on waves
  #(0.1);
  tb_check =1'b0;
end
endtask

// Tasl to clear/initialize all inputs
task init_inputs;
begin
  tb_tx_data = 0;
  tb_store_tx_data = 0;
  tb_get_tx_packet_data = 0;
  tb_clear = 0;
end
endtask

// Task to clear/initialize all outputs 
task init_expected_outs;
begin
  tb_expected_buffer_occupancy   = '0;
  tb_expected_tx_packet_data     = '0;
end
endtask

task push;
  input int data;
begin
  tb_tx_data = data;
  tb_store_tx_data = 1;
  #(CLK_PERIOD)
  tb_store_tx_data = 0;
end
endtask

task pop;
begin
  tb_get_tx_packet_data = 1;
  #(CLK_PERIOD)
  tb_get_tx_packet_data = 0;
end
endtask

initial begin
  // Initialize Test Case Navigation Signals
  tb_test_case       = "Initialization";
  tb_test_case_num   = -1;
  tb_check_tag       = "N/A";
  tb_check           = 1'b0;
  tb_mismatch        = 1'b0;
  // Initialize all of the directly controled DUT inputs
  tb_n_rst          = 1'b1;
  // Initialize all of the bus model control inputs
  tb_tx_data = 0;
  tb_store_tx_data = 0;
  tb_get_tx_packet_data = 0;
  tb_clear = 0;

  // Wait some time before starting first test case
  #(0.1);

  // Reset dut
  reset_dut();

  //*****************************************************************************
  // Power-on-Reset Test Case
  //*****************************************************************************
  // Update Navigation Info
  tb_test_case     = "Power-on-Reset";
  tb_test_case_num = tb_test_case_num + 1;
  
  // Reset the DUT
  init_inputs();
  init_expected_outs();
  #(CLK_PERIOD);
  reset_dut();

  //*****************************************************************************
  // AHB Fill 1 Byte
  //*****************************************************************************
  tb_test_case     = "AHB Fill 1 Byte";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT to isolate from prior test case
  reset_dut();
  #(CLK_PERIOD);

  // Setup expected outputs
  init_expected_outs();
  tb_expected_buffer_occupancy = 1;
  tb_expected_tx_packet_data = 8'b0;

  // Setup inputs
  init_inputs();

  // Push
  push(8'b11111111);

  // Check
  check_outputs();
  #(CLK_PERIOD)


  //*****************************************************************************
  // AHB Fill 32 Bytes
  //*****************************************************************************
  tb_test_case     = "AHB Fill 32 Bytes";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT to isolate from prior test case
  reset_dut();
  #(CLK_PERIOD);

  // Setup expected outputs
  init_expected_outs();
  tb_expected_buffer_occupancy = 32;
  tb_expected_tx_packet_data = 8'b0;

  // Setup inputs
  init_inputs();

  // Push
  for(int cnt = 0; cnt < 32; cnt++)
    push(8'b11111111);

  // Check
  check_outputs();
  #(CLK_PERIOD)


  //*****************************************************************************
  // AHB Fill 64 Bytes
  //*****************************************************************************
  tb_test_case     = "AHB Fill 64 Bytes";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT to isolate from prior test case
  reset_dut();
  #(CLK_PERIOD);

  // Setup expected outputs
  init_expected_outs();
  tb_expected_buffer_occupancy = 64;
  tb_expected_tx_packet_data = 8'b0;

  // Setup inputs
  init_inputs();

  // Push
  for(int cnt = 0; cnt < 64; cnt++)
    push(8'b11111111);

  // Check
  check_outputs();
  #(CLK_PERIOD)


  //*****************************************************************************
  // TX Drain 1 Byte
  //*****************************************************************************
  tb_test_case     = "TX Drain 1 Byte";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT to isolate from prior test case
  reset_dut();
  #(CLK_PERIOD);

  // Setup expected outputs
  init_expected_outs();
  tb_expected_buffer_occupancy = 0;
  tb_expected_tx_packet_data = 8'b11111111;

  // Setup inputs
  init_inputs();

  // Push
  push(8'b11111111);

  // Pop
  pop();

  // Check
  check_outputs();
  #(CLK_PERIOD)


  //*****************************************************************************
  // TX Drain 32 Byte
  //*****************************************************************************
  tb_test_case     = "TX Drain 32 Byte";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT to isolate from prior test case
  reset_dut();
  #(CLK_PERIOD);

  // Setup expected outputs
  init_expected_outs();
  tb_expected_buffer_occupancy = 0;
  tb_expected_tx_packet_data = 8'b11111111;

  // Setup inputs
  init_inputs();

  // Push
  for(int cnt = 0; cnt < 31; cnt++)
    push(cnt);
  push(8'b11111111);

  // Pop
  for(int cnt = 0; cnt < 32; cnt++)
    pop();

  // Check
  check_outputs();
  #(CLK_PERIOD)


  //*****************************************************************************
  // TX Drain 64 Byte
  //*****************************************************************************
  tb_test_case     = "TX Drain 64 Byte";
  tb_test_case_num = tb_test_case_num + 1;

  // Reset the DUT to isolate from prior test case
  reset_dut();
  #(CLK_PERIOD);

  // Setup expected outputs
  init_expected_outs();
  tb_expected_buffer_occupancy = 0;
  tb_expected_tx_packet_data = 8'b11111111;

  // Setup inputs
  init_inputs();

  // Push
  for(int cnt = 0; cnt < 63; cnt++)
    push(cnt);
  push(8'b11111111);

  // Pop
  for(int cnt = 0; cnt < 64; cnt++)
    pop();

  // Check
  check_outputs();
  #(CLK_PERIOD)


  $stop;
end



endmodule