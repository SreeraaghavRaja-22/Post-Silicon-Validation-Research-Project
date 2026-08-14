#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_local_block", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_local_deadlock", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_start", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_done", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_idle", 1, hls_out, -1, "", "", 1),
	Port_Property("ap_ready", 1, hls_out, -1, "", "", 1),
	Port_Property("reset", 1, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("stall_out", 1, hls_out, 1, "ap_none", "out_data", 1),
	Port_Property("forward_A_sel_out", 32, hls_out, 2, "ap_none", "out_data", 1),
	Port_Property("forward_B_sel_out", 32, hls_out, 3, "ap_none", "out_data", 1),
	Port_Property("hazard_dest_out", 32, hls_out, 4, "ap_none", "out_data", 1),
	Port_Property("pc_out", 32, hls_out, 5, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "pipeline_top";
