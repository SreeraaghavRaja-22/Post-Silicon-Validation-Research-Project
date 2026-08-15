-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Sat Aug 15 16:02:44 2026
-- Host        : Aurora running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/sreer/Post-Silicon-Validation-Research-Project/new_cpu_implementation/vivado/PSV_IMP/PSV_IMP.gen/sources_1/bd/design_1/ip/design_1_pipeline_top_0_0/design_1_pipeline_top_0_0_stub.vhdl
-- Design      : design_1_pipeline_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xc7k70tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_pipeline_top_0_0 is
  Port ( 
    ap_local_block : out STD_LOGIC;
    ap_local_deadlock : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    ap_rst : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ap_done : out STD_LOGIC;
    ap_idle : out STD_LOGIC;
    ap_ready : out STD_LOGIC;
    reset : in STD_LOGIC;
    stall_out : out STD_LOGIC;
    forward_A_sel_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    forward_B_sel_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    hazard_dest_out : out STD_LOGIC_VECTOR ( 31 downto 0 );
    pc_out : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );

end design_1_pipeline_top_0_0;

architecture stub of design_1_pipeline_top_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "ap_local_block,ap_local_deadlock,ap_clk,ap_rst,ap_start,ap_done,ap_idle,ap_ready,reset,stall_out,forward_A_sel_out[31:0],forward_B_sel_out[31:0],hazard_dest_out[31:0],pc_out[31:0]";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "pipeline_top,Vivado 2021.2";
begin
end;
