onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold /tb_ahb_slave/tb_test_case_num
add wave -noupdate -color Gold /tb_ahb_slave/tb_test_case
add wave -noupdate -color Red /tb_ahb_slave/tb_n_rst
add wave -noupdate /tb_ahb_slave/tb_clk
add wave -noupdate -divider Inputs
add wave -noupdate -color Orange /tb_ahb_slave/tb_tx_error
add wave -noupdate -color Orange /tb_ahb_slave/tb_tx_transfer_active
add wave -noupdate -color Orange -radix unsigned /tb_ahb_slave/tb_buffer_occupancy
add wave -noupdate -divider Outputs
add wave -noupdate -color Cyan -radix binary /tb_ahb_slave/tb_tx_data
add wave -noupdate -color Cyan /tb_ahb_slave/tb_store_tx_data
add wave -noupdate -color Cyan -radix unsigned /tb_ahb_slave/tb_tx_packet
add wave -noupdate -color Cyan -radix unsigned /tb_ahb_slave/tb_clear
add wave -noupdate -color Cyan /tb_ahb_slave/tb_hresp
add wave -noupdate -divider {Internal Signals}
add wave -noupdate -color Cyan /tb_ahb_slave/DUT/state
add wave -noupdate -color Cyan -radix unsigned -childformat {{{/tb_ahb_slave/DUT/mem[13]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[12]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[11]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[10]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[9]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[8]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[7]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[6]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[5]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[4]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[3]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[2]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[1]} -radix unsigned} {{/tb_ahb_slave/DUT/mem[0]} -radix unsigned}} -subitemconfig {{/tb_ahb_slave/DUT/mem[13]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[12]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[11]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[10]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[9]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[8]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[7]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[6]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[5]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[4]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[3]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[2]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[1]} {-color Cyan -height 16 -radix unsigned} {/tb_ahb_slave/DUT/mem[0]} {-color Cyan -height 16 -radix unsigned}} /tb_ahb_slave/DUT/mem
add wave -noupdate -divider {AHB Signals}
add wave -noupdate -color White -radix binary -childformat {{{/tb_ahb_slave/tb_hwdata[31]} -radix binary} {{/tb_ahb_slave/tb_hwdata[30]} -radix binary} {{/tb_ahb_slave/tb_hwdata[29]} -radix binary} {{/tb_ahb_slave/tb_hwdata[28]} -radix binary} {{/tb_ahb_slave/tb_hwdata[27]} -radix binary} {{/tb_ahb_slave/tb_hwdata[26]} -radix binary} {{/tb_ahb_slave/tb_hwdata[25]} -radix binary} {{/tb_ahb_slave/tb_hwdata[24]} -radix binary} {{/tb_ahb_slave/tb_hwdata[23]} -radix binary} {{/tb_ahb_slave/tb_hwdata[22]} -radix binary} {{/tb_ahb_slave/tb_hwdata[21]} -radix binary} {{/tb_ahb_slave/tb_hwdata[20]} -radix binary} {{/tb_ahb_slave/tb_hwdata[19]} -radix binary} {{/tb_ahb_slave/tb_hwdata[18]} -radix binary} {{/tb_ahb_slave/tb_hwdata[17]} -radix binary} {{/tb_ahb_slave/tb_hwdata[16]} -radix binary} {{/tb_ahb_slave/tb_hwdata[15]} -radix binary} {{/tb_ahb_slave/tb_hwdata[14]} -radix binary} {{/tb_ahb_slave/tb_hwdata[13]} -radix binary} {{/tb_ahb_slave/tb_hwdata[12]} -radix binary} {{/tb_ahb_slave/tb_hwdata[11]} -radix binary} {{/tb_ahb_slave/tb_hwdata[10]} -radix binary} {{/tb_ahb_slave/tb_hwdata[9]} -radix binary} {{/tb_ahb_slave/tb_hwdata[8]} -radix binary} {{/tb_ahb_slave/tb_hwdata[7]} -radix binary} {{/tb_ahb_slave/tb_hwdata[6]} -radix binary} {{/tb_ahb_slave/tb_hwdata[5]} -radix binary} {{/tb_ahb_slave/tb_hwdata[4]} -radix binary} {{/tb_ahb_slave/tb_hwdata[3]} -radix binary} {{/tb_ahb_slave/tb_hwdata[2]} -radix binary} {{/tb_ahb_slave/tb_hwdata[1]} -radix binary} {{/tb_ahb_slave/tb_hwdata[0]} -radix binary}} -subitemconfig {{/tb_ahb_slave/tb_hwdata[31]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[30]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[29]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[28]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[27]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[26]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[25]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[24]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[23]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[22]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[21]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[20]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[19]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[18]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[17]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[16]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[15]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[14]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[13]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[12]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[11]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[10]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[9]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[8]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[7]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[6]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[5]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[4]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[3]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[2]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[1]} {-color White -radix binary} {/tb_ahb_slave/tb_hwdata[0]} {-color White -radix binary}} /tb_ahb_slave/tb_hwdata
add wave -noupdate -color White -radix unsigned /tb_ahb_slave/tb_hrdata
add wave -noupdate -color White -radix unsigned /tb_ahb_slave/tb_hsel
add wave -noupdate -color White -radix unsigned /tb_ahb_slave/tb_hwrite
add wave -noupdate -color White -radix unsigned /tb_ahb_slave/tb_hsize
add wave -noupdate -color White -radix unsigned /tb_ahb_slave/tb_haddr
add wave -noupdate -color White -radix unsigned /tb_ahb_slave/tb_hready
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {305000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 167
configure wave -valuecolwidth 84
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
WaveRestoreZoom {302040 ps} {310028 ps}
