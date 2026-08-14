############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project PSV_HLS
set_top pipeline_top
add_files ../hls/pipeline_core_hls.h
add_files ../hls/pipeline_core_hls.cpp
add_files -tb ../hls/test/testbench_hls.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "RAW_solu" -flow_target vivado
set_part {xc7k70t-fbv676-1}
create_clock -period 10 -name default
config_export -format ip_catalog -rtl verilog
source "./PSV_HLS/RAW_solu/directives.tcl"
csim_design
csynth_design
cosim_design -trace_level all
export_design -rtl verilog -format ip_catalog
