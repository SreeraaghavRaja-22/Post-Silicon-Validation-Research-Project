// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.2 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================

extern "C" void AESL_WRAP_pipeline_top (
char reset,
volatile void* stall_out,
volatile void* forward_A_sel_out,
volatile void* forward_B_sel_out,
volatile void* hazard_dest_out,
volatile void* pc_out);
