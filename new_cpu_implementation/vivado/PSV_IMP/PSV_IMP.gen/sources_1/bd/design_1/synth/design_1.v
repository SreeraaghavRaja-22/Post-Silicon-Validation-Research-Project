//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
//Date        : Sat Aug 15 16:00:59 2026
//Host        : Aurora running 64-bit major release  (build 9200)
//Command     : generate_target design_1.bd
//Design      : design_1
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CORE_GENERATION_INFO = "design_1,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=design_1,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=5,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=1,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=1,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "design_1.hwdef" *) 
module design_1
   (clk_100MHz,
    reset_rtl_0);
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN design_1_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input clk_100MHz;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.RESET_RTL_0 RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.RESET_RTL_0, INSERT_VIP 0, POLARITY ACTIVE_HIGH" *) input reset_rtl_0;

  wire clk_100MHz_1;
  wire clk_wiz_clk_out1;
  wire clk_wiz_locked;
  wire [31:0]pipeline_top_0_forward_A_sel_out;
  wire [31:0]pipeline_top_0_forward_B_sel_out;
  wire [31:0]pipeline_top_0_hazard_dest_out;
  wire [31:0]pipeline_top_0_pc_out;
  wire pipeline_top_0_stall_out;
  wire reset_rtl_0_1;
  wire [0:0]rst_clk_wiz_100M_peripheral_reset;
  wire [0:0]xlconstant_0_dout;

  assign clk_100MHz_1 = clk_100MHz;
  assign reset_rtl_0_1 = reset_rtl_0;
  design_1_clk_wiz_0 clk_wiz
       (.clk_in1(clk_100MHz_1),
        .clk_out1(clk_wiz_clk_out1),
        .locked(clk_wiz_locked),
        .reset(reset_rtl_0_1));
  design_1_ila_0_0 ila_0
       (.clk(clk_wiz_clk_out1),
        .probe0(pipeline_top_0_stall_out),
        .probe1(pipeline_top_0_forward_A_sel_out),
        .probe2(pipeline_top_0_forward_B_sel_out),
        .probe3(pipeline_top_0_hazard_dest_out),
        .probe4(pipeline_top_0_pc_out));
  design_1_pipeline_top_0_0 pipeline_top_0
       (.ap_clk(clk_wiz_clk_out1),
        .ap_rst(rst_clk_wiz_100M_peripheral_reset),
        .ap_start(xlconstant_0_dout),
        .forward_A_sel_out(pipeline_top_0_forward_A_sel_out),
        .forward_B_sel_out(pipeline_top_0_forward_B_sel_out),
        .hazard_dest_out(pipeline_top_0_hazard_dest_out),
        .pc_out(pipeline_top_0_pc_out),
        .reset(rst_clk_wiz_100M_peripheral_reset),
        .stall_out(pipeline_top_0_stall_out));
  design_1_rst_clk_wiz_100M_0 rst_clk_wiz_100M
       (.aux_reset_in(1'b1),
        .dcm_locked(clk_wiz_locked),
        .ext_reset_in(reset_rtl_0_1),
        .mb_debug_sys_rst(1'b0),
        .peripheral_reset(rst_clk_wiz_100M_peripheral_reset),
        .slowest_sync_clk(clk_wiz_clk_out1));
  design_1_xlconstant_0_0 xlconstant_0
       (.dout(xlconstant_0_dout));
endmodule
