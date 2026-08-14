############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project PSV_HLS
set_top pipeline_top
add_files ../hls/pipeline_core_hls.cpp
add_files ../hls/pipeline_core_hls.h
add_files -tb ../hls/test/testbench_hls.cpp
open_solution "RAW_solu" -flow_target vivado
set_part {xc7k70tfbv676-1}
create_clock -period 10 -name default
#source "./PSV_HLS/RAW_solu/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog
