// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
// Date        : Sat Aug 15 16:02:44 2026
// Host        : Aurora running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix
//               decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ design_1_pipeline_top_0_0_sim_netlist.v
// Design      : design_1_pipeline_top_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbg484-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_pipeline_top_0_0,pipeline_top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "HLS" *) 
(* X_CORE_INFO = "pipeline_top,Vivado 2021.2" *) (* hls_module = "yes" *) 
(* NotValidForBitStream *)
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix
   (ap_local_block,
    ap_local_deadlock,
    ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    reset,
    stall_out,
    forward_A_sel_out,
    forward_B_sel_out,
    hazard_dest_out,
    pc_out);
  output ap_local_block;
  output ap_local_deadlock;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ap_clk CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0" *) input ap_clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 ap_rst RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0" *) input ap_rst;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start" *) input ap_start;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done" *) output ap_done;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle" *) output ap_idle;
  (* X_INTERFACE_INFO = "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready" *) output ap_ready;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 reset DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME reset, LAYERED_METADATA undef" *) input reset;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 stall_out DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME stall_out, LAYERED_METADATA undef" *) output stall_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 forward_A_sel_out DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME forward_A_sel_out, LAYERED_METADATA undef" *) output [31:0]forward_A_sel_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 forward_B_sel_out DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME forward_B_sel_out, LAYERED_METADATA undef" *) output [31:0]forward_B_sel_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 hazard_dest_out DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME hazard_dest_out, LAYERED_METADATA undef" *) output [31:0]hazard_dest_out;
  (* X_INTERFACE_INFO = "xilinx.com:signal:data:1.0 pc_out DATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pc_out, LAYERED_METADATA undef" *) output [31:0]pc_out;

  wire \<const0> ;
  wire \<const1> ;
  wire ap_clk;
  wire ap_done;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire [1:0]\^forward_A_sel_out ;
  wire [1:0]\^forward_B_sel_out ;
  wire [31:2]\^pc_out ;
  wire reset;
  wire NLW_inst_ap_local_block_UNCONNECTED;
  wire NLW_inst_ap_local_deadlock_UNCONNECTED;
  wire NLW_inst_stall_out_UNCONNECTED;
  wire [31:2]NLW_inst_forward_A_sel_out_UNCONNECTED;
  wire [31:2]NLW_inst_forward_B_sel_out_UNCONNECTED;
  wire [31:0]NLW_inst_hazard_dest_out_UNCONNECTED;
  wire [1:0]NLW_inst_pc_out_UNCONNECTED;

  assign ap_local_block = \<const0> ;
  assign ap_local_deadlock = \<const0> ;
  assign forward_A_sel_out[31] = \<const0> ;
  assign forward_A_sel_out[30] = \<const0> ;
  assign forward_A_sel_out[29] = \<const0> ;
  assign forward_A_sel_out[28] = \<const0> ;
  assign forward_A_sel_out[27] = \<const0> ;
  assign forward_A_sel_out[26] = \<const0> ;
  assign forward_A_sel_out[25] = \<const0> ;
  assign forward_A_sel_out[24] = \<const0> ;
  assign forward_A_sel_out[23] = \<const0> ;
  assign forward_A_sel_out[22] = \<const0> ;
  assign forward_A_sel_out[21] = \<const0> ;
  assign forward_A_sel_out[20] = \<const0> ;
  assign forward_A_sel_out[19] = \<const0> ;
  assign forward_A_sel_out[18] = \<const0> ;
  assign forward_A_sel_out[17] = \<const0> ;
  assign forward_A_sel_out[16] = \<const0> ;
  assign forward_A_sel_out[15] = \<const0> ;
  assign forward_A_sel_out[14] = \<const0> ;
  assign forward_A_sel_out[13] = \<const0> ;
  assign forward_A_sel_out[12] = \<const0> ;
  assign forward_A_sel_out[11] = \<const0> ;
  assign forward_A_sel_out[10] = \<const0> ;
  assign forward_A_sel_out[9] = \<const0> ;
  assign forward_A_sel_out[8] = \<const0> ;
  assign forward_A_sel_out[7] = \<const0> ;
  assign forward_A_sel_out[6] = \<const0> ;
  assign forward_A_sel_out[5] = \<const0> ;
  assign forward_A_sel_out[4] = \<const0> ;
  assign forward_A_sel_out[3] = \<const0> ;
  assign forward_A_sel_out[2] = \<const0> ;
  assign forward_A_sel_out[1:0] = \^forward_A_sel_out [1:0];
  assign forward_B_sel_out[31] = \<const0> ;
  assign forward_B_sel_out[30] = \<const0> ;
  assign forward_B_sel_out[29] = \<const0> ;
  assign forward_B_sel_out[28] = \<const0> ;
  assign forward_B_sel_out[27] = \<const0> ;
  assign forward_B_sel_out[26] = \<const0> ;
  assign forward_B_sel_out[25] = \<const0> ;
  assign forward_B_sel_out[24] = \<const0> ;
  assign forward_B_sel_out[23] = \<const0> ;
  assign forward_B_sel_out[22] = \<const0> ;
  assign forward_B_sel_out[21] = \<const0> ;
  assign forward_B_sel_out[20] = \<const0> ;
  assign forward_B_sel_out[19] = \<const0> ;
  assign forward_B_sel_out[18] = \<const0> ;
  assign forward_B_sel_out[17] = \<const0> ;
  assign forward_B_sel_out[16] = \<const0> ;
  assign forward_B_sel_out[15] = \<const0> ;
  assign forward_B_sel_out[14] = \<const0> ;
  assign forward_B_sel_out[13] = \<const0> ;
  assign forward_B_sel_out[12] = \<const0> ;
  assign forward_B_sel_out[11] = \<const0> ;
  assign forward_B_sel_out[10] = \<const0> ;
  assign forward_B_sel_out[9] = \<const0> ;
  assign forward_B_sel_out[8] = \<const0> ;
  assign forward_B_sel_out[7] = \<const0> ;
  assign forward_B_sel_out[6] = \<const0> ;
  assign forward_B_sel_out[5] = \<const0> ;
  assign forward_B_sel_out[4] = \<const0> ;
  assign forward_B_sel_out[3] = \<const0> ;
  assign forward_B_sel_out[2] = \<const0> ;
  assign forward_B_sel_out[1:0] = \^forward_B_sel_out [1:0];
  assign hazard_dest_out[31] = \<const1> ;
  assign hazard_dest_out[30] = \<const1> ;
  assign hazard_dest_out[29] = \<const1> ;
  assign hazard_dest_out[28] = \<const1> ;
  assign hazard_dest_out[27] = \<const1> ;
  assign hazard_dest_out[26] = \<const1> ;
  assign hazard_dest_out[25] = \<const1> ;
  assign hazard_dest_out[24] = \<const1> ;
  assign hazard_dest_out[23] = \<const1> ;
  assign hazard_dest_out[22] = \<const1> ;
  assign hazard_dest_out[21] = \<const1> ;
  assign hazard_dest_out[20] = \<const1> ;
  assign hazard_dest_out[19] = \<const1> ;
  assign hazard_dest_out[18] = \<const1> ;
  assign hazard_dest_out[17] = \<const1> ;
  assign hazard_dest_out[16] = \<const1> ;
  assign hazard_dest_out[15] = \<const1> ;
  assign hazard_dest_out[14] = \<const1> ;
  assign hazard_dest_out[13] = \<const1> ;
  assign hazard_dest_out[12] = \<const1> ;
  assign hazard_dest_out[11] = \<const1> ;
  assign hazard_dest_out[10] = \<const1> ;
  assign hazard_dest_out[9] = \<const1> ;
  assign hazard_dest_out[8] = \<const1> ;
  assign hazard_dest_out[7] = \<const1> ;
  assign hazard_dest_out[6] = \<const1> ;
  assign hazard_dest_out[5] = \<const1> ;
  assign hazard_dest_out[4] = \<const1> ;
  assign hazard_dest_out[3] = \<const1> ;
  assign hazard_dest_out[2] = \<const1> ;
  assign hazard_dest_out[1] = \<const1> ;
  assign hazard_dest_out[0] = \<const1> ;
  assign pc_out[31:2] = \^pc_out [31:2];
  assign pc_out[1] = \<const0> ;
  assign pc_out[0] = \<const0> ;
  assign stall_out = \<const0> ;
  GND GND
       (.G(\<const0> ));
  VCC VCC
       (.P(\<const1> ));
  (* SDX_KERNEL = "true" *) 
  (* SDX_KERNEL_SYNTH_INST = "inst" *) 
  (* SDX_KERNEL_TYPE = "hls" *) 
  (* ap_ST_fsm_state1 = "3'b001" *) 
  (* ap_ST_fsm_state2 = "3'b010" *) 
  (* ap_ST_fsm_state3 = "3'b100" *) 
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pipeline_top inst
       (.ap_clk(ap_clk),
        .ap_done(ap_done),
        .ap_idle(ap_idle),
        .ap_local_block(NLW_inst_ap_local_block_UNCONNECTED),
        .ap_local_deadlock(NLW_inst_ap_local_deadlock_UNCONNECTED),
        .ap_ready(ap_ready),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .forward_A_sel_out({NLW_inst_forward_A_sel_out_UNCONNECTED[31:2],\^forward_A_sel_out }),
        .forward_B_sel_out({NLW_inst_forward_B_sel_out_UNCONNECTED[31:2],\^forward_B_sel_out }),
        .hazard_dest_out(NLW_inst_hazard_dest_out_UNCONNECTED[31:0]),
        .pc_out({\^pc_out ,NLW_inst_pc_out_UNCONNECTED[1:0]}),
        .reset(reset),
        .stall_out(NLW_inst_stall_out_UNCONNECTED));
endmodule

(* ap_ST_fsm_state1 = "3'b001" *) (* ap_ST_fsm_state2 = "3'b010" *) (* ap_ST_fsm_state3 = "3'b100" *) 
(* hls_module = "yes" *) 
module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pipeline_top
   (ap_local_block,
    ap_local_deadlock,
    ap_clk,
    ap_rst,
    ap_start,
    ap_done,
    ap_idle,
    ap_ready,
    reset,
    stall_out,
    forward_A_sel_out,
    forward_B_sel_out,
    hazard_dest_out,
    pc_out);
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

  wire \<const0> ;
  wire [1:1]EX_MEM_dest;
  wire EX_MEM_valid;
  wire [1:1]ID_EX_src1;
  wire [1:1]ID_EX_src2;
  wire ID_EX_src20;
  wire ID_EX_valid;
  wire IF_ID_valid;
  wire \ap_CS_fsm_reg_n_0_[0] ;
  wire ap_CS_fsm_state2;
  wire [2:0]ap_NS_fsm;
  wire ap_NS_fsm11_out;
  wire ap_NS_fsm14_out;
  wire ap_clk;
  wire ap_idle;
  wire ap_ready;
  wire ap_rst;
  wire ap_start;
  wire forward_A_sel_10;
  wire [1:0]\^forward_A_sel_out ;
  wire [1:0]\^forward_B_sel_out ;
  wire [1:1]grp_clock_cycle_fu_123_ID_EX_src1_o;
  wire grp_clock_cycle_fu_123_ap_start_reg;
  wire [0:0]grp_clock_cycle_fu_123_forward_A_sel_1;
  wire [0:0]grp_clock_cycle_fu_123_forward_B_sel_1;
  wire grp_clock_cycle_fu_123_n_0;
  wire grp_clock_cycle_fu_123_n_1;
  wire grp_clock_cycle_fu_123_n_10;
  wire grp_clock_cycle_fu_123_n_11;
  wire grp_clock_cycle_fu_123_n_12;
  wire grp_clock_cycle_fu_123_n_13;
  wire grp_clock_cycle_fu_123_n_14;
  wire grp_clock_cycle_fu_123_n_15;
  wire grp_clock_cycle_fu_123_n_16;
  wire grp_clock_cycle_fu_123_n_17;
  wire grp_clock_cycle_fu_123_n_18;
  wire grp_clock_cycle_fu_123_n_19;
  wire grp_clock_cycle_fu_123_n_2;
  wire grp_clock_cycle_fu_123_n_20;
  wire grp_clock_cycle_fu_123_n_21;
  wire grp_clock_cycle_fu_123_n_22;
  wire grp_clock_cycle_fu_123_n_23;
  wire grp_clock_cycle_fu_123_n_24;
  wire grp_clock_cycle_fu_123_n_25;
  wire grp_clock_cycle_fu_123_n_26;
  wire grp_clock_cycle_fu_123_n_27;
  wire grp_clock_cycle_fu_123_n_28;
  wire grp_clock_cycle_fu_123_n_29;
  wire grp_clock_cycle_fu_123_n_3;
  wire grp_clock_cycle_fu_123_n_35;
  wire grp_clock_cycle_fu_123_n_36;
  wire grp_clock_cycle_fu_123_n_4;
  wire grp_clock_cycle_fu_123_n_5;
  wire grp_clock_cycle_fu_123_n_6;
  wire grp_clock_cycle_fu_123_n_7;
  wire grp_clock_cycle_fu_123_n_8;
  wire grp_clock_cycle_fu_123_n_9;
  wire [31:2]\^pc_out ;
  wire reset;

  assign ap_done = ap_ready;
  assign ap_local_block = \<const0> ;
  assign ap_local_deadlock = \<const0> ;
  assign forward_A_sel_out[31] = \<const0> ;
  assign forward_A_sel_out[30] = \<const0> ;
  assign forward_A_sel_out[29] = \<const0> ;
  assign forward_A_sel_out[28] = \<const0> ;
  assign forward_A_sel_out[27] = \<const0> ;
  assign forward_A_sel_out[26] = \<const0> ;
  assign forward_A_sel_out[25] = \<const0> ;
  assign forward_A_sel_out[24] = \<const0> ;
  assign forward_A_sel_out[23] = \<const0> ;
  assign forward_A_sel_out[22] = \<const0> ;
  assign forward_A_sel_out[21] = \<const0> ;
  assign forward_A_sel_out[20] = \<const0> ;
  assign forward_A_sel_out[19] = \<const0> ;
  assign forward_A_sel_out[18] = \<const0> ;
  assign forward_A_sel_out[17] = \<const0> ;
  assign forward_A_sel_out[16] = \<const0> ;
  assign forward_A_sel_out[15] = \<const0> ;
  assign forward_A_sel_out[14] = \<const0> ;
  assign forward_A_sel_out[13] = \<const0> ;
  assign forward_A_sel_out[12] = \<const0> ;
  assign forward_A_sel_out[11] = \<const0> ;
  assign forward_A_sel_out[10] = \<const0> ;
  assign forward_A_sel_out[9] = \<const0> ;
  assign forward_A_sel_out[8] = \<const0> ;
  assign forward_A_sel_out[7] = \<const0> ;
  assign forward_A_sel_out[6] = \<const0> ;
  assign forward_A_sel_out[5] = \<const0> ;
  assign forward_A_sel_out[4] = \<const0> ;
  assign forward_A_sel_out[3] = \<const0> ;
  assign forward_A_sel_out[2] = \<const0> ;
  assign forward_A_sel_out[1:0] = \^forward_A_sel_out [1:0];
  assign forward_B_sel_out[31] = \<const0> ;
  assign forward_B_sel_out[30] = \<const0> ;
  assign forward_B_sel_out[29] = \<const0> ;
  assign forward_B_sel_out[28] = \<const0> ;
  assign forward_B_sel_out[27] = \<const0> ;
  assign forward_B_sel_out[26] = \<const0> ;
  assign forward_B_sel_out[25] = \<const0> ;
  assign forward_B_sel_out[24] = \<const0> ;
  assign forward_B_sel_out[23] = \<const0> ;
  assign forward_B_sel_out[22] = \<const0> ;
  assign forward_B_sel_out[21] = \<const0> ;
  assign forward_B_sel_out[20] = \<const0> ;
  assign forward_B_sel_out[19] = \<const0> ;
  assign forward_B_sel_out[18] = \<const0> ;
  assign forward_B_sel_out[17] = \<const0> ;
  assign forward_B_sel_out[16] = \<const0> ;
  assign forward_B_sel_out[15] = \<const0> ;
  assign forward_B_sel_out[14] = \<const0> ;
  assign forward_B_sel_out[13] = \<const0> ;
  assign forward_B_sel_out[12] = \<const0> ;
  assign forward_B_sel_out[11] = \<const0> ;
  assign forward_B_sel_out[10] = \<const0> ;
  assign forward_B_sel_out[9] = \<const0> ;
  assign forward_B_sel_out[8] = \<const0> ;
  assign forward_B_sel_out[7] = \<const0> ;
  assign forward_B_sel_out[6] = \<const0> ;
  assign forward_B_sel_out[5] = \<const0> ;
  assign forward_B_sel_out[4] = \<const0> ;
  assign forward_B_sel_out[3] = \<const0> ;
  assign forward_B_sel_out[2] = \<const0> ;
  assign forward_B_sel_out[1:0] = \^forward_B_sel_out [1:0];
  assign hazard_dest_out[31] = \<const0> ;
  assign hazard_dest_out[30] = \<const0> ;
  assign hazard_dest_out[29] = \<const0> ;
  assign hazard_dest_out[28] = \<const0> ;
  assign hazard_dest_out[27] = \<const0> ;
  assign hazard_dest_out[26] = \<const0> ;
  assign hazard_dest_out[25] = \<const0> ;
  assign hazard_dest_out[24] = \<const0> ;
  assign hazard_dest_out[23] = \<const0> ;
  assign hazard_dest_out[22] = \<const0> ;
  assign hazard_dest_out[21] = \<const0> ;
  assign hazard_dest_out[20] = \<const0> ;
  assign hazard_dest_out[19] = \<const0> ;
  assign hazard_dest_out[18] = \<const0> ;
  assign hazard_dest_out[17] = \<const0> ;
  assign hazard_dest_out[16] = \<const0> ;
  assign hazard_dest_out[15] = \<const0> ;
  assign hazard_dest_out[14] = \<const0> ;
  assign hazard_dest_out[13] = \<const0> ;
  assign hazard_dest_out[12] = \<const0> ;
  assign hazard_dest_out[11] = \<const0> ;
  assign hazard_dest_out[10] = \<const0> ;
  assign hazard_dest_out[9] = \<const0> ;
  assign hazard_dest_out[8] = \<const0> ;
  assign hazard_dest_out[7] = \<const0> ;
  assign hazard_dest_out[6] = \<const0> ;
  assign hazard_dest_out[5] = \<const0> ;
  assign hazard_dest_out[4] = \<const0> ;
  assign hazard_dest_out[3] = \<const0> ;
  assign hazard_dest_out[2] = \<const0> ;
  assign hazard_dest_out[1] = \<const0> ;
  assign hazard_dest_out[0] = \<const0> ;
  assign pc_out[31:2] = \^pc_out [31:2];
  assign pc_out[1] = \<const0> ;
  assign pc_out[0] = \<const0> ;
  assign stall_out = \<const0> ;
  FDSE #(
    .INIT(1'b0)) 
    \EX_MEM_dest_reg[1] 
       (.C(ap_clk),
        .CE(forward_A_sel_10),
        .D(ID_EX_src2),
        .Q(EX_MEM_dest),
        .S(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \EX_MEM_valid_reg[0] 
       (.C(ap_clk),
        .CE(forward_A_sel_10),
        .D(ID_EX_valid),
        .Q(EX_MEM_valid),
        .R(ap_NS_fsm14_out));
  GND GND
       (.G(\<const0> ));
  FDSE #(
    .INIT(1'b0)) 
    \ID_EX_src1_reg[1] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_ID_EX_src1_o),
        .Q(ID_EX_src1),
        .S(ap_NS_fsm14_out));
  FDSE #(
    .INIT(1'b0)) 
    \ID_EX_src2_reg[1] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(1'b1),
        .Q(ID_EX_src2),
        .S(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \ID_EX_valid_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_clock_cycle_fu_123_n_36),
        .Q(ID_EX_valid),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \IF_ID_valid_reg[0] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(1'b1),
        .Q(IF_ID_valid),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[10] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_9),
        .Q(\^pc_out [10]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[11] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_8),
        .Q(\^pc_out [11]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[12] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_7),
        .Q(\^pc_out [12]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[13] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_14),
        .Q(\^pc_out [13]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[14] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_13),
        .Q(\^pc_out [14]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[15] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_12),
        .Q(\^pc_out [15]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[16] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_11),
        .Q(\^pc_out [16]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[17] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_18),
        .Q(\^pc_out [17]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[18] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_17),
        .Q(\^pc_out [18]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[19] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_16),
        .Q(\^pc_out [19]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[20] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_15),
        .Q(\^pc_out [20]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[21] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_22),
        .Q(\^pc_out [21]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[22] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_21),
        .Q(\^pc_out [22]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[23] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_20),
        .Q(\^pc_out [23]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[24] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_19),
        .Q(\^pc_out [24]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[25] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_26),
        .Q(\^pc_out [25]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[26] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_25),
        .Q(\^pc_out [26]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[27] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_24),
        .Q(\^pc_out [27]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[28] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_23),
        .Q(\^pc_out [28]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[29] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_29),
        .Q(\^pc_out [29]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[2] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_2),
        .Q(\^pc_out [2]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[30] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_28),
        .Q(\^pc_out [30]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[31] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_27),
        .Q(\^pc_out [31]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[3] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_1),
        .Q(\^pc_out [3]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[4] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_0),
        .Q(\^pc_out [4]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[5] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_6),
        .Q(\^pc_out [5]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[6] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_5),
        .Q(\^pc_out [6]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[7] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_4),
        .Q(\^pc_out [7]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[8] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_3),
        .Q(\^pc_out [8]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \PC_V_reg[9] 
       (.C(ap_clk),
        .CE(ID_EX_src20),
        .D(grp_clock_cycle_fu_123_n_10),
        .Q(\^pc_out [9]),
        .R(ap_NS_fsm14_out));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT4 #(
    .INIT(16'h2333)) 
    \ap_CS_fsm[0]_i_1 
       (.I0(ap_ready),
        .I1(ap_CS_fsm_state2),
        .I2(\ap_CS_fsm_reg_n_0_[0] ),
        .I3(ap_start),
        .O(ap_NS_fsm[0]));
  (* SOFT_HLUTNM = "soft_lutpair3" *) 
  LUT3 #(
    .INIT(8'h08)) 
    \ap_CS_fsm[1]_i_2 
       (.I0(ap_start),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .I2(reset),
        .O(ap_NS_fsm11_out));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(\ap_CS_fsm_reg_n_0_[0] ),
        .S(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(ap_CS_fsm_state2),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[2]),
        .Q(ap_ready),
        .R(ap_rst));
  LUT2 #(
    .INIT(4'h2)) 
    ap_idle_INST_0
       (.I0(\ap_CS_fsm_reg_n_0_[0] ),
        .I1(ap_start),
        .O(ap_idle));
  LUT6 #(
    .INIT(64'h0020000008000000)) 
    \forward_A_sel_1[0]_i_1 
       (.I0(EX_MEM_valid),
        .I1(EX_MEM_dest),
        .I2(EX_MEM_dest),
        .I3(ID_EX_src1),
        .I4(ID_EX_valid),
        .I5(ID_EX_src1),
        .O(grp_clock_cycle_fu_123_forward_A_sel_1));
  LUT3 #(
    .INIT(8'h80)) 
    \forward_A_sel_1[1]_i_1 
       (.I0(reset),
        .I1(ap_start),
        .I2(\ap_CS_fsm_reg_n_0_[0] ),
        .O(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \forward_A_sel_1_reg[0] 
       (.C(ap_clk),
        .CE(forward_A_sel_10),
        .D(grp_clock_cycle_fu_123_forward_A_sel_1),
        .Q(\^forward_A_sel_out [0]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \forward_A_sel_1_reg[1] 
       (.C(ap_clk),
        .CE(forward_A_sel_10),
        .D(1'b0),
        .Q(\^forward_A_sel_out [1]),
        .R(ap_NS_fsm14_out));
  LUT6 #(
    .INIT(64'h0020000008000000)) 
    \forward_B_sel_1[0]_i_1 
       (.I0(EX_MEM_valid),
        .I1(EX_MEM_dest),
        .I2(EX_MEM_dest),
        .I3(ID_EX_src2),
        .I4(ID_EX_valid),
        .I5(ID_EX_src2),
        .O(grp_clock_cycle_fu_123_forward_B_sel_1));
  FDRE #(
    .INIT(1'b0)) 
    \forward_B_sel_1_reg[0] 
       (.C(ap_clk),
        .CE(forward_A_sel_10),
        .D(grp_clock_cycle_fu_123_forward_B_sel_1),
        .Q(\^forward_B_sel_out [0]),
        .R(ap_NS_fsm14_out));
  FDRE #(
    .INIT(1'b0)) 
    \forward_B_sel_1_reg[1] 
       (.C(ap_clk),
        .CE(forward_A_sel_10),
        .D(1'b0),
        .Q(\^forward_B_sel_out [1]),
        .R(ap_NS_fsm14_out));
  decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pipeline_top_clock_cycle grp_clock_cycle_fu_123
       (.D(ap_NS_fsm[2:1]),
        .E(forward_A_sel_10),
        .ID_EX_src20(ID_EX_src20),
        .ID_EX_valid(ID_EX_valid),
        .\ID_EX_valid_reg[0] (grp_clock_cycle_fu_123_n_36),
        .IF_ID_valid(IF_ID_valid),
        .O({grp_clock_cycle_fu_123_n_0,grp_clock_cycle_fu_123_n_1,grp_clock_cycle_fu_123_n_2}),
        .\PC_V_reg[12] ({grp_clock_cycle_fu_123_n_7,grp_clock_cycle_fu_123_n_8,grp_clock_cycle_fu_123_n_9,grp_clock_cycle_fu_123_n_10}),
        .\PC_V_reg[16] ({grp_clock_cycle_fu_123_n_11,grp_clock_cycle_fu_123_n_12,grp_clock_cycle_fu_123_n_13,grp_clock_cycle_fu_123_n_14}),
        .\PC_V_reg[20] ({grp_clock_cycle_fu_123_n_15,grp_clock_cycle_fu_123_n_16,grp_clock_cycle_fu_123_n_17,grp_clock_cycle_fu_123_n_18}),
        .\PC_V_reg[24] ({grp_clock_cycle_fu_123_n_19,grp_clock_cycle_fu_123_n_20,grp_clock_cycle_fu_123_n_21,grp_clock_cycle_fu_123_n_22}),
        .\PC_V_reg[28] ({grp_clock_cycle_fu_123_n_23,grp_clock_cycle_fu_123_n_24,grp_clock_cycle_fu_123_n_25,grp_clock_cycle_fu_123_n_26}),
        .\PC_V_reg[31] ({grp_clock_cycle_fu_123_n_27,grp_clock_cycle_fu_123_n_28,grp_clock_cycle_fu_123_n_29}),
        .\PC_V_reg[8] ({grp_clock_cycle_fu_123_n_3,grp_clock_cycle_fu_123_n_4,grp_clock_cycle_fu_123_n_5,grp_clock_cycle_fu_123_n_6}),
        .Q({ap_CS_fsm_state2,\ap_CS_fsm_reg_n_0_[0] }),
        .ap_NS_fsm11_out(ap_NS_fsm11_out),
        .ap_NS_fsm14_out(ap_NS_fsm14_out),
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .grp_clock_cycle_fu_123_ID_EX_src1_o(grp_clock_cycle_fu_123_ID_EX_src1_o),
        .grp_clock_cycle_fu_123_ap_start_reg(grp_clock_cycle_fu_123_ap_start_reg),
        .pc_out(\^pc_out ),
        .reset(reset),
        .reset_0(grp_clock_cycle_fu_123_n_35));
  FDRE #(
    .INIT(1'b0)) 
    grp_clock_cycle_fu_123_ap_start_reg_reg
       (.C(ap_clk),
        .CE(1'b1),
        .D(grp_clock_cycle_fu_123_n_35),
        .Q(grp_clock_cycle_fu_123_ap_start_reg),
        .R(ap_rst));
endmodule

module decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_pipeline_top_clock_cycle
   (O,
    \PC_V_reg[8] ,
    \PC_V_reg[12] ,
    \PC_V_reg[16] ,
    \PC_V_reg[20] ,
    \PC_V_reg[24] ,
    \PC_V_reg[28] ,
    \PC_V_reg[31] ,
    D,
    E,
    ID_EX_src20,
    grp_clock_cycle_fu_123_ID_EX_src1_o,
    reset_0,
    \ID_EX_valid_reg[0] ,
    ap_clk,
    pc_out,
    grp_clock_cycle_fu_123_ap_start_reg,
    ap_NS_fsm11_out,
    Q,
    ap_NS_fsm14_out,
    IF_ID_valid,
    reset,
    ap_start,
    ID_EX_valid,
    ap_rst);
  output [2:0]O;
  output [3:0]\PC_V_reg[8] ;
  output [3:0]\PC_V_reg[12] ;
  output [3:0]\PC_V_reg[16] ;
  output [3:0]\PC_V_reg[20] ;
  output [3:0]\PC_V_reg[24] ;
  output [3:0]\PC_V_reg[28] ;
  output [2:0]\PC_V_reg[31] ;
  output [1:0]D;
  output [0:0]E;
  output ID_EX_src20;
  output [0:0]grp_clock_cycle_fu_123_ID_EX_src1_o;
  output reset_0;
  output \ID_EX_valid_reg[0] ;
  input ap_clk;
  input [29:0]pc_out;
  input grp_clock_cycle_fu_123_ap_start_reg;
  input ap_NS_fsm11_out;
  input [1:0]Q;
  input ap_NS_fsm14_out;
  input IF_ID_valid;
  input reset;
  input ap_start;
  input ID_EX_valid;
  input ap_rst;

  wire [1:0]D;
  wire [0:0]E;
  wire ID_EX_src20;
  wire ID_EX_valid;
  wire ID_EX_valid0;
  wire \ID_EX_valid[0]_i_3_n_0 ;
  wire \ID_EX_valid_reg[0] ;
  wire IF_ID_valid;
  wire IF_ID_valid_load_reg_567;
  wire \IF_ID_valid_load_reg_567[0]_i_1_n_0 ;
  wire [2:0]O;
  wire \PC_V[4]_i_2_n_0 ;
  wire [3:0]\PC_V_reg[12] ;
  wire \PC_V_reg[12]_i_1_n_0 ;
  wire \PC_V_reg[12]_i_1_n_1 ;
  wire \PC_V_reg[12]_i_1_n_2 ;
  wire \PC_V_reg[12]_i_1_n_3 ;
  wire [3:0]\PC_V_reg[16] ;
  wire \PC_V_reg[16]_i_1_n_0 ;
  wire \PC_V_reg[16]_i_1_n_1 ;
  wire \PC_V_reg[16]_i_1_n_2 ;
  wire \PC_V_reg[16]_i_1_n_3 ;
  wire [3:0]\PC_V_reg[20] ;
  wire \PC_V_reg[20]_i_1_n_0 ;
  wire \PC_V_reg[20]_i_1_n_1 ;
  wire \PC_V_reg[20]_i_1_n_2 ;
  wire \PC_V_reg[20]_i_1_n_3 ;
  wire [3:0]\PC_V_reg[24] ;
  wire \PC_V_reg[24]_i_1_n_0 ;
  wire \PC_V_reg[24]_i_1_n_1 ;
  wire \PC_V_reg[24]_i_1_n_2 ;
  wire \PC_V_reg[24]_i_1_n_3 ;
  wire [3:0]\PC_V_reg[28] ;
  wire \PC_V_reg[28]_i_1_n_0 ;
  wire \PC_V_reg[28]_i_1_n_1 ;
  wire \PC_V_reg[28]_i_1_n_2 ;
  wire \PC_V_reg[28]_i_1_n_3 ;
  wire [2:0]\PC_V_reg[31] ;
  wire \PC_V_reg[31]_i_2_n_2 ;
  wire \PC_V_reg[31]_i_2_n_3 ;
  wire \PC_V_reg[4]_i_1_n_0 ;
  wire \PC_V_reg[4]_i_1_n_1 ;
  wire \PC_V_reg[4]_i_1_n_2 ;
  wire \PC_V_reg[4]_i_1_n_3 ;
  wire [3:0]\PC_V_reg[8] ;
  wire \PC_V_reg[8]_i_1_n_0 ;
  wire \PC_V_reg[8]_i_1_n_1 ;
  wire \PC_V_reg[8]_i_1_n_2 ;
  wire \PC_V_reg[8]_i_1_n_3 ;
  wire [1:0]Q;
  wire \ap_CS_fsm_reg_n_0_[0] ;
  wire ap_CS_fsm_state2;
  wire [2:0]ap_NS_fsm;
  wire ap_NS_fsm11_out;
  wire ap_NS_fsm14_out;
  wire ap_clk;
  wire ap_rst;
  wire ap_start;
  wire [0:0]grp_clock_cycle_fu_123_ID_EX_src1_o;
  wire grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld;
  wire grp_clock_cycle_fu_123_ap_start_reg;
  wire [29:0]pc_out;
  wire reset;
  wire reset_0;
  wire storemerge13_reg_109;
  wire \storemerge13_reg_109[0]_i_1_n_0 ;
  wire [3:2]\NLW_PC_V_reg[31]_i_2_CO_UNCONNECTED ;
  wire [3:3]\NLW_PC_V_reg[31]_i_2_O_UNCONNECTED ;
  wire [0:0]\NLW_PC_V_reg[4]_i_1_O_UNCONNECTED ;

  LUT2 #(
    .INIT(4'h2)) 
    \ID_EX_src1[1]_i_1 
       (.I0(storemerge13_reg_109),
        .I1(IF_ID_valid_load_reg_567),
        .O(grp_clock_cycle_fu_123_ID_EX_src1_o));
  LUT6 #(
    .INIT(64'h00000000AA2AEE2E)) 
    \ID_EX_valid[0]_i_1 
       (.I0(ID_EX_valid),
        .I1(ID_EX_valid0),
        .I2(\ap_CS_fsm_reg_n_0_[0] ),
        .I3(IF_ID_valid),
        .I4(\ID_EX_valid[0]_i_3_n_0 ),
        .I5(ap_NS_fsm14_out),
        .O(\ID_EX_valid_reg[0] ));
  LUT6 #(
    .INIT(64'hFF08080800000000)) 
    \ID_EX_valid[0]_i_2 
       (.I0(grp_clock_cycle_fu_123_ap_start_reg),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .I2(IF_ID_valid),
        .I3(IF_ID_valid_load_reg_567),
        .I4(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .I5(Q[1]),
        .O(ID_EX_valid0));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \ID_EX_valid[0]_i_3 
       (.I0(IF_ID_valid_load_reg_567),
        .I1(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .O(\ID_EX_valid[0]_i_3_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT3 #(
    .INIT(8'hB8)) 
    \IF_ID_valid_load_reg_567[0]_i_1 
       (.I0(IF_ID_valid),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .I2(IF_ID_valid_load_reg_567),
        .O(\IF_ID_valid_load_reg_567[0]_i_1_n_0 ));
  FDRE \IF_ID_valid_load_reg_567_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\IF_ID_valid_load_reg_567[0]_i_1_n_0 ),
        .Q(IF_ID_valid_load_reg_567),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h8)) 
    \PC_V[31]_i_1 
       (.I0(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .I1(Q[1]),
        .O(ID_EX_src20));
  LUT2 #(
    .INIT(4'h6)) 
    \PC_V[4]_i_2 
       (.I0(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .I1(pc_out[0]),
        .O(\PC_V[4]_i_2_n_0 ));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PC_V_reg[12]_i_1 
       (.CI(\PC_V_reg[8]_i_1_n_0 ),
        .CO({\PC_V_reg[12]_i_1_n_0 ,\PC_V_reg[12]_i_1_n_1 ,\PC_V_reg[12]_i_1_n_2 ,\PC_V_reg[12]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\PC_V_reg[12] ),
        .S(pc_out[10:7]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PC_V_reg[16]_i_1 
       (.CI(\PC_V_reg[12]_i_1_n_0 ),
        .CO({\PC_V_reg[16]_i_1_n_0 ,\PC_V_reg[16]_i_1_n_1 ,\PC_V_reg[16]_i_1_n_2 ,\PC_V_reg[16]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\PC_V_reg[16] ),
        .S(pc_out[14:11]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PC_V_reg[20]_i_1 
       (.CI(\PC_V_reg[16]_i_1_n_0 ),
        .CO({\PC_V_reg[20]_i_1_n_0 ,\PC_V_reg[20]_i_1_n_1 ,\PC_V_reg[20]_i_1_n_2 ,\PC_V_reg[20]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\PC_V_reg[20] ),
        .S(pc_out[18:15]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PC_V_reg[24]_i_1 
       (.CI(\PC_V_reg[20]_i_1_n_0 ),
        .CO({\PC_V_reg[24]_i_1_n_0 ,\PC_V_reg[24]_i_1_n_1 ,\PC_V_reg[24]_i_1_n_2 ,\PC_V_reg[24]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\PC_V_reg[24] ),
        .S(pc_out[22:19]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PC_V_reg[28]_i_1 
       (.CI(\PC_V_reg[24]_i_1_n_0 ),
        .CO({\PC_V_reg[28]_i_1_n_0 ,\PC_V_reg[28]_i_1_n_1 ,\PC_V_reg[28]_i_1_n_2 ,\PC_V_reg[28]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\PC_V_reg[28] ),
        .S(pc_out[26:23]));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PC_V_reg[31]_i_2 
       (.CI(\PC_V_reg[28]_i_1_n_0 ),
        .CO({\NLW_PC_V_reg[31]_i_2_CO_UNCONNECTED [3:2],\PC_V_reg[31]_i_2_n_2 ,\PC_V_reg[31]_i_2_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O({\NLW_PC_V_reg[31]_i_2_O_UNCONNECTED [3],\PC_V_reg[31] }),
        .S({1'b0,pc_out[29:27]}));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PC_V_reg[4]_i_1 
       (.CI(1'b0),
        .CO({\PC_V_reg[4]_i_1_n_0 ,\PC_V_reg[4]_i_1_n_1 ,\PC_V_reg[4]_i_1_n_2 ,\PC_V_reg[4]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,1'b0}),
        .O({O,\NLW_PC_V_reg[4]_i_1_O_UNCONNECTED [0]}),
        .S({pc_out[2:1],\PC_V[4]_i_2_n_0 ,1'b0}));
  (* ADDER_THRESHOLD = "11" *) 
  CARRY4 \PC_V_reg[8]_i_1 
       (.CI(\PC_V_reg[4]_i_1_n_0 ),
        .CO({\PC_V_reg[8]_i_1_n_0 ,\PC_V_reg[8]_i_1_n_1 ,\PC_V_reg[8]_i_1_n_2 ,\PC_V_reg[8]_i_1_n_3 }),
        .CYINIT(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0}),
        .O(\PC_V_reg[8] ),
        .S(pc_out[6:3]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT4 #(
    .INIT(16'h00BF)) 
    \ap_CS_fsm[0]_i_1__0 
       (.I0(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .I1(grp_clock_cycle_fu_123_ap_start_reg),
        .I2(\ap_CS_fsm_reg_n_0_[0] ),
        .I3(ap_CS_fsm_state2),
        .O(ap_NS_fsm[0]));
  LUT6 #(
    .INIT(64'hFFFFFF00FF0BFF00)) 
    \ap_CS_fsm[1]_i_1 
       (.I0(grp_clock_cycle_fu_123_ap_start_reg),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .I2(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .I3(ap_NS_fsm11_out),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(D[0]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h04000000)) 
    \ap_CS_fsm[1]_i_1__0 
       (.I0(ap_CS_fsm_state2),
        .I1(IF_ID_valid),
        .I2(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .I3(grp_clock_cycle_fu_123_ap_start_reg),
        .I4(\ap_CS_fsm_reg_n_0_[0] ),
        .O(ap_NS_fsm[1]));
  LUT6 #(
    .INIT(64'hFFFFFF00FFF4FF00)) 
    \ap_CS_fsm[2]_i_1 
       (.I0(grp_clock_cycle_fu_123_ap_start_reg),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .I2(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .I3(ap_NS_fsm14_out),
        .I4(Q[1]),
        .I5(Q[0]),
        .O(D[1]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'hFFFF0040)) 
    \ap_CS_fsm[2]_i_1__0 
       (.I0(IF_ID_valid),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .I2(grp_clock_cycle_fu_123_ap_start_reg),
        .I3(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .I4(ap_CS_fsm_state2),
        .O(ap_NS_fsm[2]));
  (* FSM_ENCODING = "none" *) 
  FDSE #(
    .INIT(1'b1)) 
    \ap_CS_fsm_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[0]),
        .Q(\ap_CS_fsm_reg_n_0_[0] ),
        .S(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[1] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[1]),
        .Q(ap_CS_fsm_state2),
        .R(ap_rst));
  (* FSM_ENCODING = "none" *) 
  FDRE #(
    .INIT(1'b0)) 
    \ap_CS_fsm_reg[2] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(ap_NS_fsm[2]),
        .Q(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .R(ap_rst));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h80)) 
    \forward_A_sel_1[1]_i_2 
       (.I0(Q[1]),
        .I1(\ap_CS_fsm_reg_n_0_[0] ),
        .I2(grp_clock_cycle_fu_123_ap_start_reg),
        .O(E));
  LUT5 #(
    .INIT(32'h40FF4040)) 
    grp_clock_cycle_fu_123_ap_start_reg_i_1
       (.I0(reset),
        .I1(Q[0]),
        .I2(ap_start),
        .I3(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .I4(grp_clock_cycle_fu_123_ap_start_reg),
        .O(reset_0));
  LUT6 #(
    .INIT(64'h4040FF40FF40FF40)) 
    \storemerge13_reg_109[0]_i_1 
       (.I0(IF_ID_valid),
        .I1(grp_clock_cycle_fu_123_ap_start_reg),
        .I2(\ap_CS_fsm_reg_n_0_[0] ),
        .I3(storemerge13_reg_109),
        .I4(IF_ID_valid_load_reg_567),
        .I5(grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld),
        .O(\storemerge13_reg_109[0]_i_1_n_0 ));
  FDRE \storemerge13_reg_109_reg[0] 
       (.C(ap_clk),
        .CE(1'b1),
        .D(\storemerge13_reg_109[0]_i_1_n_0 ),
        .Q(storemerge13_reg_109),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
