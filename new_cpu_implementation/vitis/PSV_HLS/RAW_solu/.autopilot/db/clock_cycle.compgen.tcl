# This script segment is generated automatically by AutoPilot

# Memory (RAM/ROM)  definition:
set ID 1
set hasByteEnable 0
set MemName pipeline_top_clock_cycle_RegisterFile_V_RAM_AUTO_1R1W
set CoreName ap_simcore_mem
set PortList { 2 3 }
set DataWd 1
set AddrRange 32
set AddrWd 5
set impl_style auto
set TrueReset 0
set IsROM 0
set ROMData { }
set HasInitializer 1
set Initializer $ROMData
set NumOfStage 2
set DelayBudget 1.425
set ClkPeriod 10
if {${::AESL::PGuard_simmodel_gen}} {
if {[info proc ap_gen_simcore_mem] == "ap_gen_simcore_mem"} {
    eval "ap_gen_simcore_mem { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
} else {
    puts "@W \[IMPL-102\] Cannot find ap_gen_simcore_mem, check your platform lib"
}
}


if {${::AESL::PGuard_rtl_comp_handler}} {
	::AP::rtl_comp_handler $MemName BINDTYPE {storage} TYPE {ram} IMPL {auto} LATENCY 2 ALLOW_PRAGMA 1
}


set CoreName RAM
if {${::AESL::PGuard_autocg_gen} && ${::AESL::PGuard_autocg_ipmgen}} {
if {[info proc ::AESL_LIB_VIRTEX::xil_gen_RAM] == "::AESL_LIB_VIRTEX::xil_gen_RAM"} {
    eval "::AESL_LIB_VIRTEX::xil_gen_RAM { \
    id ${ID} \
    name ${MemName} \
    corename ${CoreName}  \
    op mem  \
    hasByteEnable ${hasByteEnable} \
    reset_level 1 \
    sync_rst true \
    stage_num ${NumOfStage}  \
    port_num 2 \
    port_list \{${PortList}\} \
    data_wd ${DataWd} \
    addr_wd ${AddrWd} \
    addr_range ${AddrRange} \
    style ${impl_style} \
    true_reset ${TrueReset} \
    delay_budget ${DelayBudget} \
    clk_period ${ClkPeriod} \
    HasInitializer ${HasInitializer} \
    rom_data \{${ROMData}\} \
 } "
  } else {
    puts "@W \[IMPL-104\] Cannot find ::AESL_LIB_VIRTEX::xil_gen_RAM, check your platform lib"
  }
}


# clear list
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_begin
    cg_default_interface_gen_bundle_begin
    AESL_LIB_XILADAPTER::native_axis_begin
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 2 \
    name MEM_WB_valid \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_MEM_WB_valid \
    op interface \
    ports { MEM_WB_valid_i { I 1 vector } MEM_WB_valid_o { O 1 vector } MEM_WB_valid_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 3 \
    name MEM_WB_dest \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_MEM_WB_dest \
    op interface \
    ports { MEM_WB_dest_i { I 2 vector } MEM_WB_dest_o { O 2 vector } MEM_WB_dest_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 4 \
    name MEM_WB_outVal_V \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_MEM_WB_outVal_V \
    op interface \
    ports { MEM_WB_outVal_V_i { I 1 vector } MEM_WB_outVal_V_o { O 1 vector } MEM_WB_outVal_V_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 5 \
    name EX_MEM_valid \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_EX_MEM_valid \
    op interface \
    ports { EX_MEM_valid_i { I 1 vector } EX_MEM_valid_o { O 1 vector } EX_MEM_valid_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 6 \
    name EX_MEM_dest \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_EX_MEM_dest \
    op interface \
    ports { EX_MEM_dest_i { I 2 vector } EX_MEM_dest_o { O 2 vector } EX_MEM_dest_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 7 \
    name EX_MEM_outVal_V \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_EX_MEM_outVal_V \
    op interface \
    ports { EX_MEM_outVal_V_i { I 1 vector } EX_MEM_outVal_V_o { O 1 vector } EX_MEM_outVal_V_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 8 \
    name ID_EX_valid \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_ID_EX_valid \
    op interface \
    ports { ID_EX_valid_i { I 1 vector } ID_EX_valid_o { O 1 vector } ID_EX_valid_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 9 \
    name ID_EX_src1 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_ID_EX_src1 \
    op interface \
    ports { ID_EX_src1_i { I 2 vector } ID_EX_src1_o { O 2 vector } ID_EX_src1_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 10 \
    name ID_EX_src2 \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_ID_EX_src2 \
    op interface \
    ports { ID_EX_src2_i { I 2 vector } ID_EX_src2_o { O 2 vector } ID_EX_src2_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 11 \
    name ID_EX_dest \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_ID_EX_dest \
    op interface \
    ports { ID_EX_dest_i { I 2 vector } ID_EX_dest_o { O 2 vector } ID_EX_dest_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 12 \
    name PC_V \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_PC_V \
    op interface \
    ports { PC_V_i { I 32 vector } PC_V_o { O 32 vector } PC_V_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 13 \
    name IF_ID_valid \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_IF_ID_valid \
    op interface \
    ports { IF_ID_valid_i { I 1 vector } IF_ID_valid_o { O 1 vector } IF_ID_valid_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 14 \
    name IF_ID_pc_V \
    type other \
    dir IO \
    reset_level 1 \
    sync_rst true \
    corename dc_IF_ID_pc_V \
    op interface \
    ports { IF_ID_pc_V_i { I 32 vector } IF_ID_pc_V_o { O 32 vector } IF_ID_pc_V_o_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 15 \
    name ID_EX_pc_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_ID_EX_pc_V \
    op interface \
    ports { ID_EX_pc_V { O 32 vector } ID_EX_pc_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 16 \
    name ID_EX_val1_V \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_ID_EX_val1_V \
    op interface \
    ports { ID_EX_val1_V { O 1 vector } ID_EX_val1_V_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 17 \
    name forward_B_sel_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_forward_B_sel_1 \
    op interface \
    ports { forward_B_sel_1 { O 2 vector } forward_B_sel_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id 18 \
    name forward_A_sel_1 \
    type other \
    dir O \
    reset_level 1 \
    sync_rst true \
    corename dc_forward_A_sel_1 \
    op interface \
    ports { forward_A_sel_1 { O 2 vector } forward_A_sel_1_ap_vld { O 1 bit } } \
} "
}

# Direct connection:
if {${::AESL::PGuard_autoexp_gen}} {
eval "cg_default_interface_gen_dc { \
    id -1 \
    name ap_ctrl \
    type ap_ctrl \
    reset_level 1 \
    sync_rst true \
    corename ap_ctrl \
    op interface \
    ports { ap_start { I 1 bit } ap_ready { O 1 bit } ap_done { O 1 bit } ap_idle { O 1 bit } } \
} "
}


# Adapter definition:
set PortName ap_clk
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_clock] == "cg_default_interface_gen_clock"} {
eval "cg_default_interface_gen_clock { \
    id -2 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_clk \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-113\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}


# Adapter definition:
set PortName ap_rst
set DataWd 1 
if {${::AESL::PGuard_autoexp_gen}} {
if {[info proc cg_default_interface_gen_reset] == "cg_default_interface_gen_reset"} {
eval "cg_default_interface_gen_reset { \
    id -3 \
    name ${PortName} \
    reset_level 1 \
    sync_rst true \
    corename apif_ap_rst \
    data_wd ${DataWd} \
    op interface \
}"
} else {
puts "@W \[IMPL-114\] Cannot find bus interface model in the library. Ignored generation of bus interface for '${PortName}'"
}
}



# merge
if {${::AESL::PGuard_autoexp_gen}} {
    cg_default_interface_gen_dc_end
    cg_default_interface_gen_bundle_end
    AESL_LIB_XILADAPTER::native_axis_end
}


