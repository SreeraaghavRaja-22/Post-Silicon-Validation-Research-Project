set moduleName clock_cycle
set isTopModule 0
set isCombinational 0
set isDatapathOnly 0
set isPipelined 0
set pipeline_type none
set FunctionProtocol ap_ctrl_hs
set isOneStateSeq 0
set ProfileFlag 0
set StallSigGenFlag 0
set isEnableWaveformDebug 1
set C_modelName {clock_cycle}
set C_modelType { void 0 }
set C_modelArgList {
	{ MEM_WB_valid int 1 regular {pointer 2} {global 2}  }
	{ MEM_WB_dest int 2 regular {pointer 2} {global 2}  }
	{ MEM_WB_outVal_V int 1 regular {pointer 2} {global 2}  }
	{ EX_MEM_valid int 1 regular {pointer 2} {global 2}  }
	{ EX_MEM_dest int 2 regular {pointer 2} {global 2}  }
	{ EX_MEM_outVal_V int 1 regular {pointer 2} {global 2}  }
	{ ID_EX_valid int 1 regular {pointer 2} {global 2}  }
	{ ID_EX_src1 int 2 regular {pointer 2} {global 2}  }
	{ ID_EX_src2 int 2 regular {pointer 2} {global 2}  }
	{ ID_EX_dest int 2 regular {pointer 2} {global 2}  }
	{ PC_V int 32 regular {pointer 2} {global 2}  }
	{ IF_ID_valid int 1 regular {pointer 2} {global 2}  }
	{ IF_ID_pc_V int 32 regular {pointer 2} {global 2}  }
	{ ID_EX_pc_V int 32 regular {pointer 1} {global 1}  }
	{ ID_EX_val1_V int 1 regular {pointer 1} {global 1}  }
	{ forward_B_sel_1 int 2 regular {pointer 1} {global 1}  }
	{ forward_A_sel_1 int 2 regular {pointer 1} {global 1}  }
}
set C_modelArgMapList {[ 
	{ "Name" : "MEM_WB_valid", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "MEM_WB_dest", "interface" : "wire", "bitwidth" : 2, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "MEM_WB_outVal_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "EX_MEM_valid", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "EX_MEM_dest", "interface" : "wire", "bitwidth" : 2, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "EX_MEM_outVal_V", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ID_EX_valid", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ID_EX_src1", "interface" : "wire", "bitwidth" : 2, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ID_EX_src2", "interface" : "wire", "bitwidth" : 2, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ID_EX_dest", "interface" : "wire", "bitwidth" : 2, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "PC_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "IF_ID_valid", "interface" : "wire", "bitwidth" : 1, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "IF_ID_pc_V", "interface" : "wire", "bitwidth" : 32, "direction" : "READWRITE", "extern" : 0} , 
 	{ "Name" : "ID_EX_pc_V", "interface" : "wire", "bitwidth" : 32, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "ID_EX_val1_V", "interface" : "wire", "bitwidth" : 1, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "forward_B_sel_1", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY", "extern" : 0} , 
 	{ "Name" : "forward_A_sel_1", "interface" : "wire", "bitwidth" : 2, "direction" : "WRITEONLY", "extern" : 0} ]}
# RTL Port declarations: 
set portNum 53
set portList { 
	{ ap_clk sc_in sc_logic 1 clock -1 } 
	{ ap_rst sc_in sc_logic 1 reset -1 active_high_sync } 
	{ ap_start sc_in sc_logic 1 start -1 } 
	{ ap_done sc_out sc_logic 1 predone -1 } 
	{ ap_idle sc_out sc_logic 1 done -1 } 
	{ ap_ready sc_out sc_logic 1 ready -1 } 
	{ MEM_WB_valid_i sc_in sc_lv 1 signal 0 } 
	{ MEM_WB_valid_o sc_out sc_lv 1 signal 0 } 
	{ MEM_WB_valid_o_ap_vld sc_out sc_logic 1 outvld 0 } 
	{ MEM_WB_dest_i sc_in sc_lv 2 signal 1 } 
	{ MEM_WB_dest_o sc_out sc_lv 2 signal 1 } 
	{ MEM_WB_dest_o_ap_vld sc_out sc_logic 1 outvld 1 } 
	{ MEM_WB_outVal_V_i sc_in sc_lv 1 signal 2 } 
	{ MEM_WB_outVal_V_o sc_out sc_lv 1 signal 2 } 
	{ MEM_WB_outVal_V_o_ap_vld sc_out sc_logic 1 outvld 2 } 
	{ EX_MEM_valid_i sc_in sc_lv 1 signal 3 } 
	{ EX_MEM_valid_o sc_out sc_lv 1 signal 3 } 
	{ EX_MEM_valid_o_ap_vld sc_out sc_logic 1 outvld 3 } 
	{ EX_MEM_dest_i sc_in sc_lv 2 signal 4 } 
	{ EX_MEM_dest_o sc_out sc_lv 2 signal 4 } 
	{ EX_MEM_dest_o_ap_vld sc_out sc_logic 1 outvld 4 } 
	{ EX_MEM_outVal_V_i sc_in sc_lv 1 signal 5 } 
	{ EX_MEM_outVal_V_o sc_out sc_lv 1 signal 5 } 
	{ EX_MEM_outVal_V_o_ap_vld sc_out sc_logic 1 outvld 5 } 
	{ ID_EX_valid_i sc_in sc_lv 1 signal 6 } 
	{ ID_EX_valid_o sc_out sc_lv 1 signal 6 } 
	{ ID_EX_valid_o_ap_vld sc_out sc_logic 1 outvld 6 } 
	{ ID_EX_src1_i sc_in sc_lv 2 signal 7 } 
	{ ID_EX_src1_o sc_out sc_lv 2 signal 7 } 
	{ ID_EX_src1_o_ap_vld sc_out sc_logic 1 outvld 7 } 
	{ ID_EX_src2_i sc_in sc_lv 2 signal 8 } 
	{ ID_EX_src2_o sc_out sc_lv 2 signal 8 } 
	{ ID_EX_src2_o_ap_vld sc_out sc_logic 1 outvld 8 } 
	{ ID_EX_dest_i sc_in sc_lv 2 signal 9 } 
	{ ID_EX_dest_o sc_out sc_lv 2 signal 9 } 
	{ ID_EX_dest_o_ap_vld sc_out sc_logic 1 outvld 9 } 
	{ PC_V_i sc_in sc_lv 32 signal 10 } 
	{ PC_V_o sc_out sc_lv 32 signal 10 } 
	{ PC_V_o_ap_vld sc_out sc_logic 1 outvld 10 } 
	{ IF_ID_valid_i sc_in sc_lv 1 signal 11 } 
	{ IF_ID_valid_o sc_out sc_lv 1 signal 11 } 
	{ IF_ID_valid_o_ap_vld sc_out sc_logic 1 outvld 11 } 
	{ IF_ID_pc_V_i sc_in sc_lv 32 signal 12 } 
	{ IF_ID_pc_V_o sc_out sc_lv 32 signal 12 } 
	{ IF_ID_pc_V_o_ap_vld sc_out sc_logic 1 outvld 12 } 
	{ ID_EX_pc_V sc_out sc_lv 32 signal 13 } 
	{ ID_EX_pc_V_ap_vld sc_out sc_logic 1 outvld 13 } 
	{ ID_EX_val1_V sc_out sc_lv 1 signal 14 } 
	{ ID_EX_val1_V_ap_vld sc_out sc_logic 1 outvld 14 } 
	{ forward_B_sel_1 sc_out sc_lv 2 signal 15 } 
	{ forward_B_sel_1_ap_vld sc_out sc_logic 1 outvld 15 } 
	{ forward_A_sel_1 sc_out sc_lv 2 signal 16 } 
	{ forward_A_sel_1_ap_vld sc_out sc_logic 1 outvld 16 } 
}
set NewPortList {[ 
	{ "name": "ap_clk", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "clock", "bundle":{"name": "ap_clk", "role": "default" }} , 
 	{ "name": "ap_rst", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "reset", "bundle":{"name": "ap_rst", "role": "default" }} , 
 	{ "name": "ap_start", "direction": "in", "datatype": "sc_logic", "bitwidth":1, "type": "start", "bundle":{"name": "ap_start", "role": "default" }} , 
 	{ "name": "ap_done", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "predone", "bundle":{"name": "ap_done", "role": "default" }} , 
 	{ "name": "ap_idle", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "done", "bundle":{"name": "ap_idle", "role": "default" }} , 
 	{ "name": "ap_ready", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "ready", "bundle":{"name": "ap_ready", "role": "default" }} , 
 	{ "name": "MEM_WB_valid_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "MEM_WB_valid", "role": "i" }} , 
 	{ "name": "MEM_WB_valid_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "MEM_WB_valid", "role": "o" }} , 
 	{ "name": "MEM_WB_valid_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "MEM_WB_valid", "role": "o_ap_vld" }} , 
 	{ "name": "MEM_WB_dest_i", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "MEM_WB_dest", "role": "i" }} , 
 	{ "name": "MEM_WB_dest_o", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "MEM_WB_dest", "role": "o" }} , 
 	{ "name": "MEM_WB_dest_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "MEM_WB_dest", "role": "o_ap_vld" }} , 
 	{ "name": "MEM_WB_outVal_V_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "MEM_WB_outVal_V", "role": "i" }} , 
 	{ "name": "MEM_WB_outVal_V_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "MEM_WB_outVal_V", "role": "o" }} , 
 	{ "name": "MEM_WB_outVal_V_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "MEM_WB_outVal_V", "role": "o_ap_vld" }} , 
 	{ "name": "EX_MEM_valid_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "EX_MEM_valid", "role": "i" }} , 
 	{ "name": "EX_MEM_valid_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "EX_MEM_valid", "role": "o" }} , 
 	{ "name": "EX_MEM_valid_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "EX_MEM_valid", "role": "o_ap_vld" }} , 
 	{ "name": "EX_MEM_dest_i", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "EX_MEM_dest", "role": "i" }} , 
 	{ "name": "EX_MEM_dest_o", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "EX_MEM_dest", "role": "o" }} , 
 	{ "name": "EX_MEM_dest_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "EX_MEM_dest", "role": "o_ap_vld" }} , 
 	{ "name": "EX_MEM_outVal_V_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "EX_MEM_outVal_V", "role": "i" }} , 
 	{ "name": "EX_MEM_outVal_V_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "EX_MEM_outVal_V", "role": "o" }} , 
 	{ "name": "EX_MEM_outVal_V_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "EX_MEM_outVal_V", "role": "o_ap_vld" }} , 
 	{ "name": "ID_EX_valid_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ID_EX_valid", "role": "i" }} , 
 	{ "name": "ID_EX_valid_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ID_EX_valid", "role": "o" }} , 
 	{ "name": "ID_EX_valid_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ID_EX_valid", "role": "o_ap_vld" }} , 
 	{ "name": "ID_EX_src1_i", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ID_EX_src1", "role": "i" }} , 
 	{ "name": "ID_EX_src1_o", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ID_EX_src1", "role": "o" }} , 
 	{ "name": "ID_EX_src1_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ID_EX_src1", "role": "o_ap_vld" }} , 
 	{ "name": "ID_EX_src2_i", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ID_EX_src2", "role": "i" }} , 
 	{ "name": "ID_EX_src2_o", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ID_EX_src2", "role": "o" }} , 
 	{ "name": "ID_EX_src2_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ID_EX_src2", "role": "o_ap_vld" }} , 
 	{ "name": "ID_EX_dest_i", "direction": "in", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ID_EX_dest", "role": "i" }} , 
 	{ "name": "ID_EX_dest_o", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "ID_EX_dest", "role": "o" }} , 
 	{ "name": "ID_EX_dest_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ID_EX_dest", "role": "o_ap_vld" }} , 
 	{ "name": "PC_V_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "PC_V", "role": "i" }} , 
 	{ "name": "PC_V_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "PC_V", "role": "o" }} , 
 	{ "name": "PC_V_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "PC_V", "role": "o_ap_vld" }} , 
 	{ "name": "IF_ID_valid_i", "direction": "in", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "IF_ID_valid", "role": "i" }} , 
 	{ "name": "IF_ID_valid_o", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "IF_ID_valid", "role": "o" }} , 
 	{ "name": "IF_ID_valid_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IF_ID_valid", "role": "o_ap_vld" }} , 
 	{ "name": "IF_ID_pc_V_i", "direction": "in", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "IF_ID_pc_V", "role": "i" }} , 
 	{ "name": "IF_ID_pc_V_o", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "IF_ID_pc_V", "role": "o" }} , 
 	{ "name": "IF_ID_pc_V_o_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "IF_ID_pc_V", "role": "o_ap_vld" }} , 
 	{ "name": "ID_EX_pc_V", "direction": "out", "datatype": "sc_lv", "bitwidth":32, "type": "signal", "bundle":{"name": "ID_EX_pc_V", "role": "default" }} , 
 	{ "name": "ID_EX_pc_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ID_EX_pc_V", "role": "ap_vld" }} , 
 	{ "name": "ID_EX_val1_V", "direction": "out", "datatype": "sc_lv", "bitwidth":1, "type": "signal", "bundle":{"name": "ID_EX_val1_V", "role": "default" }} , 
 	{ "name": "ID_EX_val1_V_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "ID_EX_val1_V", "role": "ap_vld" }} , 
 	{ "name": "forward_B_sel_1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "forward_B_sel_1", "role": "default" }} , 
 	{ "name": "forward_B_sel_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "forward_B_sel_1", "role": "ap_vld" }} , 
 	{ "name": "forward_A_sel_1", "direction": "out", "datatype": "sc_lv", "bitwidth":2, "type": "signal", "bundle":{"name": "forward_A_sel_1", "role": "default" }} , 
 	{ "name": "forward_A_sel_1_ap_vld", "direction": "out", "datatype": "sc_logic", "bitwidth":1, "type": "outvld", "bundle":{"name": "forward_A_sel_1", "role": "ap_vld" }}  ]}

set RtlHierarchyInfo {[
	{"ID" : "0", "Level" : "0", "Path" : "`AUTOTB_DUT_INST", "Parent" : "", "Child" : ["1"],
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
	{"ID" : "1", "Level" : "1", "Path" : "`AUTOTB_DUT_INST.RegisterFile_V_U", "Parent" : "0"}]}


set ArgLastReadFirstWriteLatency {
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
	{"Name" : "Latency", "Min" : "1", "Max" : "2"}
	, {"Name" : "Interval", "Min" : "1", "Max" : "2"}
]}

set PipelineEnableSignalInfo {[
]}

set Spec2ImplPortList { 
	MEM_WB_valid { ap_ovld {  { MEM_WB_valid_i in_data 0 1 }  { MEM_WB_valid_o out_data 1 1 }  { MEM_WB_valid_o_ap_vld out_vld 1 1 } } }
	MEM_WB_dest { ap_ovld {  { MEM_WB_dest_i in_data 0 2 }  { MEM_WB_dest_o out_data 1 2 }  { MEM_WB_dest_o_ap_vld out_vld 1 1 } } }
	MEM_WB_outVal_V { ap_ovld {  { MEM_WB_outVal_V_i in_data 0 1 }  { MEM_WB_outVal_V_o out_data 1 1 }  { MEM_WB_outVal_V_o_ap_vld out_vld 1 1 } } }
	EX_MEM_valid { ap_ovld {  { EX_MEM_valid_i in_data 0 1 }  { EX_MEM_valid_o out_data 1 1 }  { EX_MEM_valid_o_ap_vld out_vld 1 1 } } }
	EX_MEM_dest { ap_ovld {  { EX_MEM_dest_i in_data 0 2 }  { EX_MEM_dest_o out_data 1 2 }  { EX_MEM_dest_o_ap_vld out_vld 1 1 } } }
	EX_MEM_outVal_V { ap_ovld {  { EX_MEM_outVal_V_i in_data 0 1 }  { EX_MEM_outVal_V_o out_data 1 1 }  { EX_MEM_outVal_V_o_ap_vld out_vld 1 1 } } }
	ID_EX_valid { ap_ovld {  { ID_EX_valid_i in_data 0 1 }  { ID_EX_valid_o out_data 1 1 }  { ID_EX_valid_o_ap_vld out_vld 1 1 } } }
	ID_EX_src1 { ap_ovld {  { ID_EX_src1_i in_data 0 2 }  { ID_EX_src1_o out_data 1 2 }  { ID_EX_src1_o_ap_vld out_vld 1 1 } } }
	ID_EX_src2 { ap_ovld {  { ID_EX_src2_i in_data 0 2 }  { ID_EX_src2_o out_data 1 2 }  { ID_EX_src2_o_ap_vld out_vld 1 1 } } }
	ID_EX_dest { ap_ovld {  { ID_EX_dest_i in_data 0 2 }  { ID_EX_dest_o out_data 1 2 }  { ID_EX_dest_o_ap_vld out_vld 1 1 } } }
	PC_V { ap_ovld {  { PC_V_i in_data 0 32 }  { PC_V_o out_data 1 32 }  { PC_V_o_ap_vld out_vld 1 1 } } }
	IF_ID_valid { ap_ovld {  { IF_ID_valid_i in_data 0 1 }  { IF_ID_valid_o out_data 1 1 }  { IF_ID_valid_o_ap_vld out_vld 1 1 } } }
	IF_ID_pc_V { ap_ovld {  { IF_ID_pc_V_i in_data 0 32 }  { IF_ID_pc_V_o out_data 1 32 }  { IF_ID_pc_V_o_ap_vld out_vld 1 1 } } }
	ID_EX_pc_V { ap_vld {  { ID_EX_pc_V out_data 1 32 }  { ID_EX_pc_V_ap_vld out_vld 1 1 } } }
	ID_EX_val1_V { ap_vld {  { ID_EX_val1_V out_data 1 1 }  { ID_EX_val1_V_ap_vld out_vld 1 1 } } }
	forward_B_sel_1 { ap_vld {  { forward_B_sel_1 out_data 1 2 }  { forward_B_sel_1_ap_vld out_vld 1 1 } } }
	forward_A_sel_1 { ap_vld {  { forward_A_sel_1 out_data 1 2 }  { forward_A_sel_1_ap_vld out_vld 1 1 } } }
}
