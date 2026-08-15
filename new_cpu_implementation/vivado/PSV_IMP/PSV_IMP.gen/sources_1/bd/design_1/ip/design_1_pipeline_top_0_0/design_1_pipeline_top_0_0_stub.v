// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Sat Aug 15 16:02:44 2026
// Host        : Aurora running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/sreer/Post-Silicon-Validation-Research-Project/new_cpu_implementation/vivado/PSV_IMP/PSV_IMP.gen/sources_1/bd/design_1/ip/design_1_pipeline_top_0_0/design_1_pipeline_top_0_0_stub.v
// Design      : design_1_pipeline_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7k70tfbg484-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "pipeline_top,Vivado 2021.2" *)
module design_1_pipeline_top_0_0(ap_local_block, ap_local_deadlock, ap_clk, 
  ap_rst, ap_start, ap_done, ap_idle, ap_ready, reset, stall_out, forward_A_sel_out, 
  forward_B_sel_out, hazard_dest_out, pc_out)
/* synthesis syn_black_box black_box_pad_pin="ap_local_block,ap_local_deadlock,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,reset,stall_out,forward_A_sel_out[31:0],forward_B_sel_out[31:0],hazard_dest_out[31:0],pc_out[31:0]" */;
  output ap_local_block;
  output ap_local_deadlock;
  input ap_clk;
  input ap_rst;
  input ap_start;
  output ap_done;
  output ap_idle;
  output ap_ready;
  input reset;
  output stall_out;
  output [31:0]forward_A_sel_out;
  output [31:0]forward_B_sel_out;
  output [31:0]hazard_dest_out;
  output [31:0]pc_out;
endmodule
