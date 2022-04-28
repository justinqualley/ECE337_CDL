onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_data_buffer/tb_clk
add wave -noupdate /tb_data_buffer/tb_n_rst
add wave -noupdate -divider <NULL>
add wave -noupdate -color Magenta -radix decimal /tb_data_buffer/tb_expected_buffer_occupancy
add wave -noupdate -color Magenta -radix decimal /tb_data_buffer/tb_buffer_occupancy
add wave -noupdate -color Magenta -radix decimal /tb_data_buffer/DUT/nxt_buffer_occupancy
add wave -noupdate -divider <NULL>
add wave -noupdate -color Yellow /tb_data_buffer/tb_expected_tx_packet_data
add wave -noupdate -color Yellow /tb_data_buffer/tb_tx_packet_data
add wave -noupdate /tb_data_buffer/DUT/nxt_tx_packet_data
add wave -noupdate -divider <NULL>
add wave -noupdate -color {Slate Blue} -radix decimal /tb_data_buffer/DUT/buffer
add wave -noupdate -color {Slate Blue} /tb_data_buffer/DUT/nxt_buffer
add wave -noupdate /tb_data_buffer/tb_tx_data
add wave -noupdate /tb_data_buffer/tb_store_tx_data
add wave -noupdate /tb_data_buffer/tb_get_tx_packet_data
add wave -noupdate /tb_data_buffer/tb_clear
add wave -noupdate /tb_data_buffer/tb_test_case
add wave -noupdate /tb_data_buffer/tb_test_case_num
add wave -noupdate /tb_data_buffer/tb_check_tag
add wave -noupdate /tb_data_buffer/tb_mismatch
add wave -noupdate /tb_data_buffer/tb_check
add wave -noupdate /tb_data_buffer/tb_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1187657 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 233
configure wave -valuecolwidth 105
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
WaveRestoreZoom {784440 ps} {1348293 ps}
