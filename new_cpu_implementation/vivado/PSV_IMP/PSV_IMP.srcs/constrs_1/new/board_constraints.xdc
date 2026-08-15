# System Clock input (e.g., 200MHz sys_diff_clock on KC705 or 100MHz oscillator)
set_property PACKAGE_PIN D18 [get_ports clk_100MHz]
set_property IOSTANDARD LVCMOS33 [get_ports clk_100MHz]

# Center Push Button (CPU Reset)
set_property PACKAGE_PIN G12 [get_ports reset_rtl_0]
set_property IOSTANDARD LVCMOS33 [get_ports reset_rtl_0]

# Configuration Voltage Settings
set_property CFGBVS VCCO [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]