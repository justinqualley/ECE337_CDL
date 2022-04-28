onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_tx/tb_clk
add wave -noupdate /tb_tx/tb_n_rst
add wave -noupdate -divider <NULL>
add wave -noupdate -color Magenta /tb_tx/tb_dplus_out
add wave -noupdate /tb_tx/DUT/prev_dplus
add wave -noupdate -color Magenta /tb_tx/DUT/serial_out
add wave -noupdate /tb_tx/DUT/shift_data
add wave -noupdate /tb_tx/tb_dminus_out
add wave -noupdate -divider {Encoder Below}
add wave -noupdate /tb_tx/DUT/ENC/state
add wave -noupdate /tb_tx/DUT/end_packet
add wave -noupdate -divider {Control Below}
add wave -noupdate /tb_tx/DUT/CL/state
add wave -noupdate -divider <NULL>
add wave -noupdate /tb_tx/tb_tx_packet_data
add wave -noupdate /tb_tx/tb_tx_packet
add wave -noupdate /tb_tx/tb_buffer_occupancy
add wave -noupdate /tb_tx/tb_get_tx_packet_data
add wave -noupdate /tb_tx/tb_tx_transfer_active
add wave -noupdate /tb_tx/tb_tx_error
add wave -noupdate /tb_tx/tb_expected_get_tx_packet_data
add wave -noupdate /tb_tx/tb_expected_tx_transfer_active
add wave -noupdate /tb_tx/tb_expected_tx_error
add wave -noupdate /tb_tx/tb_expected_dplus_out
add wave -noupdate /tb_tx/tb_expected_dminus_out
add wave -noupdate /tb_tx/tb_test_case
add wave -noupdate /tb_tx/tb_test_case_num
add wave -noupdate /tb_tx/tb_check_tag
add wave -noupdate /tb_tx/tb_mismatch
add wave -noupdate /tb_tx/tb_check
add wave -noupdate /tb_tx/tb_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {149902 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {745605 ps}
