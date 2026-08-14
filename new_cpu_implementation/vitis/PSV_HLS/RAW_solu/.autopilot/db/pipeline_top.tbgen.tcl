set moduleName pipeline_top
set isTopModule 1
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {pipeline_top}
set C_modelType { void 0 }
set C_modelArgList {
	{ reset uint 1 regular  }
	{ stall_out int 1 regular {pointer 1}  }
	{ forward_A_sel_out int 32 regular {pointer 1}  }
	{ forward_B_sel_out int 32 regular {pointer 1}  }
	{ hazard_dest_out int 32 regular {pointer 1}  }
	{ pc_out int 32 regular {pointer 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "reset", "interface" : "wire", "bitwidth" : 1, "direction" : "READONLY"} , 
 	{ "Name" : "stall_out", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY"} , 
 	{ "Name" : "forward_A_sel_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "forward_B_sel_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "hazard_dest_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} , 
 	{ "Name" : "pc_out", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY"} ]}
# RTL Port declarations: 
set portNum 14
set portList { 
	{ ap_local_block sc_out sc_logic 1 signal -1 } 
	{ ap_local_deadlock sc_out sc_logic 1 signal -1 } 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ reset sc_in sc_logic 1 signal 0 } 
	{ stall_out sc_out sc_logic 1 signal 1 } 
	{ forward_A_sel_out sc_out sc_lv 32 signal 2 } 
	{ forward_B_sel_out sc_out sc_lv 32 signal 3 } 
	{ hazard_dest_out sc_out sc_lv 32 signal 4 } 
	{ pc_out sc_out sc_lv 32 signal 5 } 
}
set NewPortList {[ 
	{ "name": "ap_local_block", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_block", "role": "default" }} , 
 	{ "name": "ap_local_deadlock", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "ap_local_deadlock", "role": "default" }} , 
 	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "reset", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "reset", "role": "default" }} , 
 	{ "name": "stall_out", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "signal", "bundle":{"name": "stall_out", "role": "default" }} , 
 	{ "name": "forward_A_sel_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "forward_A_sel_out", "role": "default" }} , 
 	{ "name": "forward_B_sel_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "forward_B_sel_out", "role": "default" }} , 
 	{ "name": "hazard_dest_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "hazard_dest_out", "role": "default" }} , 
 	{ "name": "pc_out", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "pc_out", "role": "default" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
		"CDFG" : "pipeline_top",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "4",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "reset", "Type" : "None", "Direction" : "I"},
			{"Name" : "stall_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "forward_A_sel_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "forward_B_sel_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "hazard_dest_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "pc_out", "Type" : "None", "Direction" : "O"},
			{"Name" : "IF_ID_valid", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "IF_ID_valid", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "IF_ID_pc_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "IF_ID_pc_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "ID_EX_valid", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "ID_EX_valid", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "ID_EX_pc_V", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "ID_EX_pc_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "ID_EX_src1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "ID_EX_src1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "ID_EX_src2", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "ID_EX_src2", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "ID_EX_dest", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "ID_EX_dest", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "ID_EX_val1_V", "Type" : "Vld", "Direction" : "O",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "ID_EX_val1_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "EX_MEM_valid", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "EX_MEM_valid", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "EX_MEM_dest", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "EX_MEM_dest", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "EX_MEM_outVal_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "EX_MEM_outVal_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "MEM_WB_valid", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "MEM_WB_valid", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "MEM_WB_dest", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "MEM_WB_dest", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "MEM_WB_outVal_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "MEM_WB_outVal_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "forward_A_sel_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "forward_A_sel_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "forward_B_sel_1", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "forward_B_sel_1", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "PC_V", "Type" : "OVld", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "PC_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]},
			{"Name" : "RegisterFile_V", "Type" : "Memory", "Direction" : "IO",
				"SubConnect" : [
					{"ID" : "1", "SubInstance" : "grp_clock_cycle_fu_123", "Port" : "RegisterFile_V", "Inst_start_state" : "1", "Inst_end_state" : "2"}]}]},
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.grp_clock_cycle_fu_123", "Parent" : "0", "Child" : ["2"],
		"CDFG" : "clock_cycle",
		"Protocol" : "ap_ctrl_hs",
		"ControlExist" : "1", "ap_start" : "1", "ap_ready" : "1", "ap_done" : "1", "ap_continue" : "0", "ap_idle" : "1", "real_start" : "0",
		"Pipeline" : "None", "UnalignedPipeline" : "0", "RewindPipeline" : "0", "ProcessNetwork" : "0",
		"II" : "0",
		"VariableLatency" : "1", "ExactLatency" : "-1", "EstimateLatencyMin" : "1", "EstimateLatencyMax" : "2",
		"Combinational" : "0",
		"Datapath" : "0",
		"ClockEnable" : "0",
		"HasSubDataflow" : "0",
		"InDataflowNetwork" : "0",
		"HasNonBlockingOperation" : "0",
		"IsBlackBox" : "0",
		"Port" : [
			{"Name" : "MEM_WB_valid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "MEM_WB_dest", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "MEM_WB_outVal_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "RegisterFile_V", "Type" : "Memory", "Direction" : "IO"},
			{"Name" : "EX_MEM_valid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "EX_MEM_dest", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "EX_MEM_outVal_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ID_EX_valid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ID_EX_src1", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ID_EX_src2", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ID_EX_dest", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "PC_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "IF_ID_valid", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "IF_ID_pc_V", "Type" : "OVld", "Direction" : "IO"},
			{"Name" : "ID_EX_pc_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "ID_EX_val1_V", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "forward_B_sel_1", "Type" : "Vld", "Direction" : "O"},
			{"Name" : "forward_A_sel_1", "Type" : "Vld", "Direction" : "O"}]},
	{"ID" : "2", "Level" : "2", "Path" : "`AUTOTB_DUT_INST.grp_clock_cycle_fu_123.RegisterFile_V_U", "Parent" : "1"}]}


set ArgLastReadFirstWriteLatency {
	pipeline_top {
		reset {Type I LastRead 0 FirstWrite -1}
		stall_out {Type O LastRead -1 FirstWrite 2}
		forward_A_sel_out {Type O LastRead -1 FirstWrite 2}
		forward_B_sel_out {Type O LastRead -1 FirstWrite 2}
		hazard_dest_out {Type O LastRead -1 FirstWrite 2}
		pc_out {Type O LastRead -1 FirstWrite 2}
		IF_ID_valid {Type IO LastRead -1 FirstWrite -1}
		IF_ID_pc_V {Type IO LastRead -1 FirstWrite -1}
		ID_EX_valid {Type IO LastRead -1 FirstWrite -1}
		ID_EX_pc_V {Type O LastRead -1 FirstWrite -1}
		ID_EX_src1 {Type IO LastRead -1 FirstWrite -1}
		ID_EX_src2 {Type IO LastRead -1 FirstWrite -1}
		ID_EX_dest {Type IO LastRead -1 FirstWrite -1}
		ID_EX_val1_V {Type O LastRead -1 FirstWrite -1}
		EX_MEM_valid {Type IO LastRead -1 FirstWrite -1}
		EX_MEM_dest {Type IO LastRead -1 FirstWrite -1}
		EX_MEM_outVal_V {Type IO LastRead -1 FirstWrite -1}
		MEM_WB_valid {Type IO LastRead -1 FirstWrite -1}
		MEM_WB_dest {Type IO LastRead -1 FirstWrite -1}
		MEM_WB_outVal_V {Type IO LastRead -1 FirstWrite -1}
		forward_A_sel_1 {Type IO LastRead -1 FirstWrite -1}
		forward_B_sel_1 {Type IO LastRead -1 FirstWrite -1}
		PC_V {Type IO LastRead -1 FirstWrite -1}
		RegisterFile_V {Type IO LastRead -1 FirstWrite -1}}
	clock_cycle {
		MEM_WB_valid {Type IO LastRead 0 FirstWrite 0}
		MEM_WB_dest {Type IO LastRead 0 FirstWrite 0}
		MEM_WB_outVal_V {Type IO LastRead 0 FirstWrite 0}
		RegisterFile_V {Type IO LastRead -1 FirstWrite -1}
		EX_MEM_valid {Type IO LastRead 0 FirstWrite 0}
		EX_MEM_dest {Type IO LastRead 0 FirstWrite 0}
		EX_MEM_outVal_V {Type IO LastRead 0 FirstWrite 0}
		ID_EX_valid {Type IO LastRead 0 FirstWrite 0}
		ID_EX_src1 {Type IO LastRead 0 FirstWrite 2}
		ID_EX_src2 {Type IO LastRead 0 FirstWrite 2}
		ID_EX_dest {Type IO LastRead 0 FirstWrite 2}
		PC_V {Type IO LastRead 0 FirstWrite 2}
		IF_ID_valid {Type IO LastRead 0 FirstWrite 2}
		IF_ID_pc_V {Type IO LastRead 0 FirstWrite 2}
		ID_EX_pc_V {Type O LastRead -1 FirstWrite 2}
		ID_EX_val1_V {Type O LastRead -1 FirstWrite 2}
		forward_B_sel_1 {Type O LastRead -1 FirstWrite 0}
		forward_A_sel_1 {Type O LastRead -1 FirstWrite 0}}}

set hasDtUnsupportedChannel 0

set PerformanceInfo {[
	{"Name" : "Latency", "Min" : "1", "Max" : "4"}
	, {"Name" : "Interval", "Min" : "2", "Max" : "5"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	reset { ap_none {  { reset in_data 0 1 } } }
	stall_out { ap_none {  { stall_out out_data 1 1 } } }
	forward_A_sel_out { ap_none {  { forward_A_sel_out out_data 1 32 } } }
	forward_B_sel_out { ap_none {  { forward_B_sel_out out_data 1 32 } } }
	hazard_dest_out { ap_none {  { hazard_dest_out out_data 1 32 } } }
	pc_out { ap_none {  { pc_out out_data 1 32 } } }
}

set busDeadlockParameterList { 
}

# RTL port scheduling information:
set fifoSchedulingInfoList { 
}

# RTL bus port read request latency information:
set busReadReqLatencyList { 
}

# RTL bus port write response latency information:
set busWriteResLatencyList { 
}

# RTL array port load latency information:
set memoryLoadLatencyList { 
}
