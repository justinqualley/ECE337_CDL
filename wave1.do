onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Gold -radix unsigned /tb_ahb_tx_cdl/tb_test_case_num
add wave -noupdate -color Gold /tb_ahb_tx_cdl/tb_test_case
add wave -noupdate -color Red /tb_ahb_tx_cdl/tb_n_rst
add wave -noupdate -divider {AHB Signals}
add wave -noupdate -color Magenta -radix unsigned /tb_ahb_tx_cdl/DUT/AHB/state
add wave -noupdate -color Magenta -radix unsigned -childformat {{{/tb_ahb_tx_cdl/DUT/AHB/mem[13]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[12]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[11]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[10]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[9]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[8]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[7]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[6]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[5]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[4]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[3]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[2]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[1]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/AHB/mem[0]} -radix unsigned}} -subitemconfig {{/tb_ahb_tx_cdl/DUT/AHB/mem[13]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[12]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[11]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[10]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[9]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[8]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[7]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[6]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[5]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[4]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[3]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[2]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[1]} {-color Magenta -height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/AHB/mem[0]} {-color Magenta -height 16 -radix unsigned}} /tb_ahb_tx_cdl/DUT/AHB/mem
add wave -noupdate -color White -radix unsigned /tb_ahb_tx_cdl/tb_hwrite
add wave -noupdate -color White -radix unsigned /tb_ahb_tx_cdl/tb_hwdata
add wave -noupdate -color White -radix unsigned /tb_ahb_tx_cdl/tb_htrans
add wave -noupdate -color White -radix unsigned /tb_ahb_tx_cdl/tb_hsize
add wave -noupdate -color White -radix unsigned /tb_ahb_tx_cdl/tb_hsel
add wave -noupdate -color White -radix unsigned /tb_ahb_tx_cdl/tb_hresp
add wave -noupdate -color White -radix unsigned /tb_ahb_tx_cdl/tb_hready
add wave -noupdate -color White -radix unsigned /tb_ahb_tx_cdl/tb_hrdata
add wave -noupdate -color White -radix unsigned /tb_ahb_tx_cdl/tb_hburst
add wave -noupdate -color White -radix unsigned /tb_ahb_tx_cdl/tb_haddr
add wave -noupdate -divider {USB TX}
add wave -noupdate /tb_ahb_tx_cdl/tb_clk
add wave -noupdate -color Cyan /tb_ahb_tx_cdl/tb_dplus_out
add wave -noupdate -color Cyan /tb_ahb_tx_cdl/tb_dminus_out
add wave -noupdate -color Cyan /tb_ahb_tx_cdl/tb_dmode
add wave -noupdate -color Cyan /tb_ahb_tx_cdl/DUT/AHB/tx_packet
add wave -noupdate -divider {Data Buffer}
add wave -noupdate -color Orange -radix unsigned /tb_ahb_tx_cdl/DUT/DB/buffer_occupancy
add wave -noupdate -color Orange -radix unsigned /tb_ahb_tx_cdl/DUT/DB/tx_data
add wave -noupdate -color Orange /tb_ahb_tx_cdl/DUT/AHB/tx_transfer_active
add wave -noupdate -color Orange -radix unsigned /tb_ahb_tx_cdl/DUT/DB/store_tx_data
add wave -noupdate -color Orange /tb_ahb_tx_cdl/DUT/DB/buffer
add wave -noupdate -divider Control
add wave -noupdate -radix unsigned -childformat {{{/tb_ahb_tx_cdl/DUT/TX/CL/state[1]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/TX/CL/state[0]} -radix unsigned}} -subitemconfig {{/tb_ahb_tx_cdl/DUT/TX/CL/state[1]} {-height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/TX/CL/state[0]} {-height 16 -radix unsigned}} /tb_ahb_tx_cdl/DUT/TX/CL/state
add wave -noupdate -divider Encoder
add wave -noupdate -radix unsigned -childformat {{{/tb_ahb_tx_cdl/DUT/TX/ENC/state[1]} -radix unsigned} {{/tb_ahb_tx_cdl/DUT/TX/ENC/state[0]} -radix unsigned}} -subitemconfig {{/tb_ahb_tx_cdl/DUT/TX/ENC/state[1]} {-height 16 -radix unsigned} {/tb_ahb_tx_cdl/DUT/TX/ENC/state[0]} {-height 16 -radix unsigned}} /tb_ahb_tx_cdl/DUT/TX/ENC/state
add wave -noupdate /tb_ahb_tx_cdl/DUT/AHB/tx_transfer_active_trigger
add wave -noupdate /tb_ahb_tx_cdl/DUT/AHB/present_value
add wave -noupdate /tb_ahb_tx_cdl/DUT/AHB/past_value
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {260962 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 107
configure wave -valuecolwidth 98
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
WaveRestoreZoom {208541 ps} {344620 ps}
