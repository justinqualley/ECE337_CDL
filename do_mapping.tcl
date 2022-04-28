# Step 1:  Read in the source file
analyze -format sverilog -lib WORK {ahb_slave.sv data_buffer.sv control_logic.sv encoder.sv flex_counter.sv flex_pts_sr.sv tx.sv ahb_tx_cdl.sv}
elaborate ahb_tx_cdl -lib WORK
uniquify
# Step 2: Set design constraints
# Uncomment below to set timing, area, power, etc. constraints
# set_max_delay <delay> -from "<input>" -to "<output>"
# set_max_area <area>
# set_max_total_power <power> mW


# Step 3: Compile the design
compile -map_effort medium

# Step 4: Output reports
report_timing -path full -delay max -max_paths 1 -nworst 1 > reports/ahb_tx_cdl.rep
report_area >> reports/ahb_tx_cdl.rep
report_power -hier >> reports/ahb_tx_cdl.rep

# Step 5: Output final VHDL and Verilog files
write_file -format verilog -hierarchy -output "mapped/ahb_tx_cdl.v"
echo "\nScript Done\n"
echo "\nChecking Design\n"
check_design
quit
