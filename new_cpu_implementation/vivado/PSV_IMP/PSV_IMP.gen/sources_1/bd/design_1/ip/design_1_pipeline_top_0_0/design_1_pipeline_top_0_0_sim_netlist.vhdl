-- Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2021.2 (win64) Build 3367213 Tue Oct 19 02:48:09 MDT 2021
-- Date        : Sat Aug 15 16:02:44 2026
-- Host        : Aurora running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/sreer/Post-Silicon-Validation-Research-Project/new_cpu_implementation/vivado/PSV_IMP/PSV_IMP.gen/sources_1/bd/design_1/ip/design_1_pipeline_top_0_0/design_1_pipeline_top_0_0_sim_netlist.vhdl
-- Design      : design_1_pipeline_top_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7k70tfbg484-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_pipeline_top_0_0_pipeline_top_clock_cycle is
  port (
    O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    \PC_V_reg[8]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \PC_V_reg[12]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \PC_V_reg[16]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \PC_V_reg[20]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \PC_V_reg[24]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \PC_V_reg[28]\ : out STD_LOGIC_VECTOR ( 3 downto 0 );
    \PC_V_reg[31]\ : out STD_LOGIC_VECTOR ( 2 downto 0 );
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    ID_EX_src20 : out STD_LOGIC;
    grp_clock_cycle_fu_123_ID_EX_src1_o : out STD_LOGIC_VECTOR ( 0 to 0 );
    reset_0 : out STD_LOGIC;
    \ID_EX_valid_reg[0]\ : out STD_LOGIC;
    ap_clk : in STD_LOGIC;
    pc_out : in STD_LOGIC_VECTOR ( 29 downto 0 );
    grp_clock_cycle_fu_123_ap_start_reg : in STD_LOGIC;
    ap_NS_fsm11_out : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 1 downto 0 );
    ap_NS_fsm14_out : in STD_LOGIC;
    IF_ID_valid : in STD_LOGIC;
    reset : in STD_LOGIC;
    ap_start : in STD_LOGIC;
    ID_EX_valid : in STD_LOGIC;
    ap_rst : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_pipeline_top_0_0_pipeline_top_clock_cycle : entity is "pipeline_top_clock_cycle";
end design_1_pipeline_top_0_0_pipeline_top_clock_cycle;

architecture STRUCTURE of design_1_pipeline_top_0_0_pipeline_top_clock_cycle is
  signal ID_EX_valid0 : STD_LOGIC;
  signal \ID_EX_valid[0]_i_3_n_0\ : STD_LOGIC;
  signal IF_ID_valid_load_reg_567 : STD_LOGIC;
  signal \IF_ID_valid_load_reg_567[0]_i_1_n_0\ : STD_LOGIC;
  signal \PC_V[4]_i_2_n_0\ : STD_LOGIC;
  signal \PC_V_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \PC_V_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \PC_V_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \PC_V_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \PC_V_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \PC_V_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \PC_V_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \PC_V_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \PC_V_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \PC_V_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \PC_V_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \PC_V_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \PC_V_reg[24]_i_1_n_0\ : STD_LOGIC;
  signal \PC_V_reg[24]_i_1_n_1\ : STD_LOGIC;
  signal \PC_V_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \PC_V_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \PC_V_reg[28]_i_1_n_0\ : STD_LOGIC;
  signal \PC_V_reg[28]_i_1_n_1\ : STD_LOGIC;
  signal \PC_V_reg[28]_i_1_n_2\ : STD_LOGIC;
  signal \PC_V_reg[28]_i_1_n_3\ : STD_LOGIC;
  signal \PC_V_reg[31]_i_2_n_2\ : STD_LOGIC;
  signal \PC_V_reg[31]_i_2_n_3\ : STD_LOGIC;
  signal \PC_V_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \PC_V_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \PC_V_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \PC_V_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \PC_V_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \PC_V_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \PC_V_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \PC_V_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[0]\ : STD_LOGIC;
  signal ap_CS_fsm_state2 : STD_LOGIC;
  signal ap_NS_fsm : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld : STD_LOGIC;
  signal storemerge13_reg_109 : STD_LOGIC;
  signal \storemerge13_reg_109[0]_i_1_n_0\ : STD_LOGIC;
  signal \NLW_PC_V_reg[31]_i_2_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_PC_V_reg[31]_i_2_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_PC_V_reg[4]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ID_EX_valid[0]_i_3\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \IF_ID_valid_load_reg_567[0]_i_1\ : label is "soft_lutpair2";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \PC_V_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \PC_V_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \PC_V_reg[20]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \PC_V_reg[24]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \PC_V_reg[28]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \PC_V_reg[31]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \PC_V_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \PC_V_reg[8]_i_1\ : label is 11;
  attribute SOFT_HLUTNM of \ap_CS_fsm[0]_i_1__0\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \ap_CS_fsm[1]_i_1__0\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \ap_CS_fsm[2]_i_1__0\ : label is "soft_lutpair0";
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[2]\ : label is "none";
  attribute SOFT_HLUTNM of \forward_A_sel_1[1]_i_2\ : label is "soft_lutpair1";
begin
\ID_EX_src1[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => storemerge13_reg_109,
      I1 => IF_ID_valid_load_reg_567,
      O => grp_clock_cycle_fu_123_ID_EX_src1_o(0)
    );
\ID_EX_valid[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000AA2AEE2E"
    )
        port map (
      I0 => ID_EX_valid,
      I1 => ID_EX_valid0,
      I2 => \ap_CS_fsm_reg_n_0_[0]\,
      I3 => IF_ID_valid,
      I4 => \ID_EX_valid[0]_i_3_n_0\,
      I5 => ap_NS_fsm14_out,
      O => \ID_EX_valid_reg[0]\
    );
\ID_EX_valid[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FF08080800000000"
    )
        port map (
      I0 => grp_clock_cycle_fu_123_ap_start_reg,
      I1 => \ap_CS_fsm_reg_n_0_[0]\,
      I2 => IF_ID_valid,
      I3 => IF_ID_valid_load_reg_567,
      I4 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      I5 => Q(1),
      O => ID_EX_valid0
    );
\ID_EX_valid[0]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => IF_ID_valid_load_reg_567,
      I1 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      O => \ID_EX_valid[0]_i_3_n_0\
    );
\IF_ID_valid_load_reg_567[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"B8"
    )
        port map (
      I0 => IF_ID_valid,
      I1 => \ap_CS_fsm_reg_n_0_[0]\,
      I2 => IF_ID_valid_load_reg_567,
      O => \IF_ID_valid_load_reg_567[0]_i_1_n_0\
    );
\IF_ID_valid_load_reg_567_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \IF_ID_valid_load_reg_567[0]_i_1_n_0\,
      Q => IF_ID_valid_load_reg_567,
      R => '0'
    );
\PC_V[31]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      I1 => Q(1),
      O => ID_EX_src20
    );
\PC_V[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      I1 => pc_out(0),
      O => \PC_V[4]_i_2_n_0\
    );
\PC_V_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \PC_V_reg[8]_i_1_n_0\,
      CO(3) => \PC_V_reg[12]_i_1_n_0\,
      CO(2) => \PC_V_reg[12]_i_1_n_1\,
      CO(1) => \PC_V_reg[12]_i_1_n_2\,
      CO(0) => \PC_V_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \PC_V_reg[12]\(3 downto 0),
      S(3 downto 0) => pc_out(10 downto 7)
    );
\PC_V_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \PC_V_reg[12]_i_1_n_0\,
      CO(3) => \PC_V_reg[16]_i_1_n_0\,
      CO(2) => \PC_V_reg[16]_i_1_n_1\,
      CO(1) => \PC_V_reg[16]_i_1_n_2\,
      CO(0) => \PC_V_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \PC_V_reg[16]\(3 downto 0),
      S(3 downto 0) => pc_out(14 downto 11)
    );
\PC_V_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \PC_V_reg[16]_i_1_n_0\,
      CO(3) => \PC_V_reg[20]_i_1_n_0\,
      CO(2) => \PC_V_reg[20]_i_1_n_1\,
      CO(1) => \PC_V_reg[20]_i_1_n_2\,
      CO(0) => \PC_V_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \PC_V_reg[20]\(3 downto 0),
      S(3 downto 0) => pc_out(18 downto 15)
    );
\PC_V_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \PC_V_reg[20]_i_1_n_0\,
      CO(3) => \PC_V_reg[24]_i_1_n_0\,
      CO(2) => \PC_V_reg[24]_i_1_n_1\,
      CO(1) => \PC_V_reg[24]_i_1_n_2\,
      CO(0) => \PC_V_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \PC_V_reg[24]\(3 downto 0),
      S(3 downto 0) => pc_out(22 downto 19)
    );
\PC_V_reg[28]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \PC_V_reg[24]_i_1_n_0\,
      CO(3) => \PC_V_reg[28]_i_1_n_0\,
      CO(2) => \PC_V_reg[28]_i_1_n_1\,
      CO(1) => \PC_V_reg[28]_i_1_n_2\,
      CO(0) => \PC_V_reg[28]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \PC_V_reg[28]\(3 downto 0),
      S(3 downto 0) => pc_out(26 downto 23)
    );
\PC_V_reg[31]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => \PC_V_reg[28]_i_1_n_0\,
      CO(3 downto 2) => \NLW_PC_V_reg[31]_i_2_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \PC_V_reg[31]_i_2_n_2\,
      CO(0) => \PC_V_reg[31]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \NLW_PC_V_reg[31]_i_2_O_UNCONNECTED\(3),
      O(2 downto 0) => \PC_V_reg[31]\(2 downto 0),
      S(3) => '0',
      S(2 downto 0) => pc_out(29 downto 27)
    );
\PC_V_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \PC_V_reg[4]_i_1_n_0\,
      CO(2) => \PC_V_reg[4]_i_1_n_1\,
      CO(1) => \PC_V_reg[4]_i_1_n_2\,
      CO(0) => \PC_V_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 2) => B"00",
      DI(1) => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      DI(0) => '0',
      O(3 downto 1) => O(2 downto 0),
      O(0) => \NLW_PC_V_reg[4]_i_1_O_UNCONNECTED\(0),
      S(3 downto 2) => pc_out(2 downto 1),
      S(1) => \PC_V[4]_i_2_n_0\,
      S(0) => '0'
    );
\PC_V_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \PC_V_reg[4]_i_1_n_0\,
      CO(3) => \PC_V_reg[8]_i_1_n_0\,
      CO(2) => \PC_V_reg[8]_i_1_n_1\,
      CO(1) => \PC_V_reg[8]_i_1_n_2\,
      CO(0) => \PC_V_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 0) => \PC_V_reg[8]\(3 downto 0),
      S(3 downto 0) => pc_out(6 downto 3)
    );
\ap_CS_fsm[0]_i_1__0\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"00BF"
    )
        port map (
      I0 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      I1 => grp_clock_cycle_fu_123_ap_start_reg,
      I2 => \ap_CS_fsm_reg_n_0_[0]\,
      I3 => ap_CS_fsm_state2,
      O => ap_NS_fsm(0)
    );
\ap_CS_fsm[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF00FF0BFF00"
    )
        port map (
      I0 => grp_clock_cycle_fu_123_ap_start_reg,
      I1 => \ap_CS_fsm_reg_n_0_[0]\,
      I2 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      I3 => ap_NS_fsm11_out,
      I4 => Q(1),
      I5 => Q(0),
      O => D(0)
    );
\ap_CS_fsm[1]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"04000000"
    )
        port map (
      I0 => ap_CS_fsm_state2,
      I1 => IF_ID_valid,
      I2 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      I3 => grp_clock_cycle_fu_123_ap_start_reg,
      I4 => \ap_CS_fsm_reg_n_0_[0]\,
      O => ap_NS_fsm(1)
    );
\ap_CS_fsm[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFF00FFF4FF00"
    )
        port map (
      I0 => grp_clock_cycle_fu_123_ap_start_reg,
      I1 => \ap_CS_fsm_reg_n_0_[0]\,
      I2 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      I3 => ap_NS_fsm14_out,
      I4 => Q(1),
      I5 => Q(0),
      O => D(1)
    );
\ap_CS_fsm[2]_i_1__0\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFF0040"
    )
        port map (
      I0 => IF_ID_valid,
      I1 => \ap_CS_fsm_reg_n_0_[0]\,
      I2 => grp_clock_cycle_fu_123_ap_start_reg,
      I3 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      I4 => ap_CS_fsm_state2,
      O => ap_NS_fsm(2)
    );
\ap_CS_fsm_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(0),
      Q => \ap_CS_fsm_reg_n_0_[0]\,
      S => ap_rst
    );
\ap_CS_fsm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(1),
      Q => ap_CS_fsm_state2,
      R => ap_rst
    );
\ap_CS_fsm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(2),
      Q => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      R => ap_rst
    );
\forward_A_sel_1[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => Q(1),
      I1 => \ap_CS_fsm_reg_n_0_[0]\,
      I2 => grp_clock_cycle_fu_123_ap_start_reg,
      O => E(0)
    );
grp_clock_cycle_fu_123_ap_start_reg_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"40FF4040"
    )
        port map (
      I0 => reset,
      I1 => Q(0),
      I2 => ap_start,
      I3 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      I4 => grp_clock_cycle_fu_123_ap_start_reg,
      O => reset_0
    );
\storemerge13_reg_109[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4040FF40FF40FF40"
    )
        port map (
      I0 => IF_ID_valid,
      I1 => grp_clock_cycle_fu_123_ap_start_reg,
      I2 => \ap_CS_fsm_reg_n_0_[0]\,
      I3 => storemerge13_reg_109,
      I4 => IF_ID_valid_load_reg_567,
      I5 => grp_clock_cycle_fu_123_IF_ID_pc_V_o_ap_vld,
      O => \storemerge13_reg_109[0]_i_1_n_0\
    );
\storemerge13_reg_109_reg[0]\: unisim.vcomponents.FDRE
     port map (
      C => ap_clk,
      CE => '1',
      D => \storemerge13_reg_109[0]_i_1_n_0\,
      Q => storemerge13_reg_109,
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_pipeline_top_0_0_pipeline_top is
  port (
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
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_pipeline_top_0_0_pipeline_top : entity is "pipeline_top";
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of design_1_pipeline_top_0_0_pipeline_top : entity is "3'b001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of design_1_pipeline_top_0_0_pipeline_top : entity is "3'b010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of design_1_pipeline_top_0_0_pipeline_top : entity is "3'b100";
  attribute hls_module : string;
  attribute hls_module of design_1_pipeline_top_0_0_pipeline_top : entity is "yes";
end design_1_pipeline_top_0_0_pipeline_top;

architecture STRUCTURE of design_1_pipeline_top_0_0_pipeline_top is
  signal \<const0>\ : STD_LOGIC;
  signal EX_MEM_dest : STD_LOGIC_VECTOR ( 1 to 1 );
  signal EX_MEM_valid : STD_LOGIC;
  signal ID_EX_src1 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal ID_EX_src2 : STD_LOGIC_VECTOR ( 1 to 1 );
  signal ID_EX_src20 : STD_LOGIC;
  signal ID_EX_valid : STD_LOGIC;
  signal IF_ID_valid : STD_LOGIC;
  signal \ap_CS_fsm_reg_n_0_[0]\ : STD_LOGIC;
  signal ap_CS_fsm_state2 : STD_LOGIC;
  signal ap_NS_fsm : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal ap_NS_fsm11_out : STD_LOGIC;
  signal ap_NS_fsm14_out : STD_LOGIC;
  signal \^ap_ready\ : STD_LOGIC;
  signal forward_A_sel_10 : STD_LOGIC;
  signal \^forward_a_sel_out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^forward_b_sel_out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal grp_clock_cycle_fu_123_ID_EX_src1_o : STD_LOGIC_VECTOR ( 1 to 1 );
  signal grp_clock_cycle_fu_123_ap_start_reg : STD_LOGIC;
  signal grp_clock_cycle_fu_123_forward_A_sel_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal grp_clock_cycle_fu_123_forward_B_sel_1 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal grp_clock_cycle_fu_123_n_0 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_1 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_10 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_11 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_12 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_13 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_14 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_15 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_16 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_17 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_18 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_19 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_2 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_20 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_21 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_22 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_23 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_24 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_25 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_26 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_27 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_28 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_29 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_3 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_35 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_36 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_4 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_5 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_6 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_7 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_8 : STD_LOGIC;
  signal grp_clock_cycle_fu_123_n_9 : STD_LOGIC;
  signal \^pc_out\ : STD_LOGIC_VECTOR ( 31 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \ap_CS_fsm[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \ap_CS_fsm[1]_i_2\ : label is "soft_lutpair3";
  attribute FSM_ENCODING : string;
  attribute FSM_ENCODING of \ap_CS_fsm_reg[0]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[1]\ : label is "none";
  attribute FSM_ENCODING of \ap_CS_fsm_reg[2]\ : label is "none";
begin
  ap_done <= \^ap_ready\;
  ap_local_block <= \<const0>\;
  ap_local_deadlock <= \<const0>\;
  ap_ready <= \^ap_ready\;
  forward_A_sel_out(31) <= \<const0>\;
  forward_A_sel_out(30) <= \<const0>\;
  forward_A_sel_out(29) <= \<const0>\;
  forward_A_sel_out(28) <= \<const0>\;
  forward_A_sel_out(27) <= \<const0>\;
  forward_A_sel_out(26) <= \<const0>\;
  forward_A_sel_out(25) <= \<const0>\;
  forward_A_sel_out(24) <= \<const0>\;
  forward_A_sel_out(23) <= \<const0>\;
  forward_A_sel_out(22) <= \<const0>\;
  forward_A_sel_out(21) <= \<const0>\;
  forward_A_sel_out(20) <= \<const0>\;
  forward_A_sel_out(19) <= \<const0>\;
  forward_A_sel_out(18) <= \<const0>\;
  forward_A_sel_out(17) <= \<const0>\;
  forward_A_sel_out(16) <= \<const0>\;
  forward_A_sel_out(15) <= \<const0>\;
  forward_A_sel_out(14) <= \<const0>\;
  forward_A_sel_out(13) <= \<const0>\;
  forward_A_sel_out(12) <= \<const0>\;
  forward_A_sel_out(11) <= \<const0>\;
  forward_A_sel_out(10) <= \<const0>\;
  forward_A_sel_out(9) <= \<const0>\;
  forward_A_sel_out(8) <= \<const0>\;
  forward_A_sel_out(7) <= \<const0>\;
  forward_A_sel_out(6) <= \<const0>\;
  forward_A_sel_out(5) <= \<const0>\;
  forward_A_sel_out(4) <= \<const0>\;
  forward_A_sel_out(3) <= \<const0>\;
  forward_A_sel_out(2) <= \<const0>\;
  forward_A_sel_out(1 downto 0) <= \^forward_a_sel_out\(1 downto 0);
  forward_B_sel_out(31) <= \<const0>\;
  forward_B_sel_out(30) <= \<const0>\;
  forward_B_sel_out(29) <= \<const0>\;
  forward_B_sel_out(28) <= \<const0>\;
  forward_B_sel_out(27) <= \<const0>\;
  forward_B_sel_out(26) <= \<const0>\;
  forward_B_sel_out(25) <= \<const0>\;
  forward_B_sel_out(24) <= \<const0>\;
  forward_B_sel_out(23) <= \<const0>\;
  forward_B_sel_out(22) <= \<const0>\;
  forward_B_sel_out(21) <= \<const0>\;
  forward_B_sel_out(20) <= \<const0>\;
  forward_B_sel_out(19) <= \<const0>\;
  forward_B_sel_out(18) <= \<const0>\;
  forward_B_sel_out(17) <= \<const0>\;
  forward_B_sel_out(16) <= \<const0>\;
  forward_B_sel_out(15) <= \<const0>\;
  forward_B_sel_out(14) <= \<const0>\;
  forward_B_sel_out(13) <= \<const0>\;
  forward_B_sel_out(12) <= \<const0>\;
  forward_B_sel_out(11) <= \<const0>\;
  forward_B_sel_out(10) <= \<const0>\;
  forward_B_sel_out(9) <= \<const0>\;
  forward_B_sel_out(8) <= \<const0>\;
  forward_B_sel_out(7) <= \<const0>\;
  forward_B_sel_out(6) <= \<const0>\;
  forward_B_sel_out(5) <= \<const0>\;
  forward_B_sel_out(4) <= \<const0>\;
  forward_B_sel_out(3) <= \<const0>\;
  forward_B_sel_out(2) <= \<const0>\;
  forward_B_sel_out(1 downto 0) <= \^forward_b_sel_out\(1 downto 0);
  hazard_dest_out(31) <= \<const0>\;
  hazard_dest_out(30) <= \<const0>\;
  hazard_dest_out(29) <= \<const0>\;
  hazard_dest_out(28) <= \<const0>\;
  hazard_dest_out(27) <= \<const0>\;
  hazard_dest_out(26) <= \<const0>\;
  hazard_dest_out(25) <= \<const0>\;
  hazard_dest_out(24) <= \<const0>\;
  hazard_dest_out(23) <= \<const0>\;
  hazard_dest_out(22) <= \<const0>\;
  hazard_dest_out(21) <= \<const0>\;
  hazard_dest_out(20) <= \<const0>\;
  hazard_dest_out(19) <= \<const0>\;
  hazard_dest_out(18) <= \<const0>\;
  hazard_dest_out(17) <= \<const0>\;
  hazard_dest_out(16) <= \<const0>\;
  hazard_dest_out(15) <= \<const0>\;
  hazard_dest_out(14) <= \<const0>\;
  hazard_dest_out(13) <= \<const0>\;
  hazard_dest_out(12) <= \<const0>\;
  hazard_dest_out(11) <= \<const0>\;
  hazard_dest_out(10) <= \<const0>\;
  hazard_dest_out(9) <= \<const0>\;
  hazard_dest_out(8) <= \<const0>\;
  hazard_dest_out(7) <= \<const0>\;
  hazard_dest_out(6) <= \<const0>\;
  hazard_dest_out(5) <= \<const0>\;
  hazard_dest_out(4) <= \<const0>\;
  hazard_dest_out(3) <= \<const0>\;
  hazard_dest_out(2) <= \<const0>\;
  hazard_dest_out(1) <= \<const0>\;
  hazard_dest_out(0) <= \<const0>\;
  pc_out(31 downto 2) <= \^pc_out\(31 downto 2);
  pc_out(1) <= \<const0>\;
  pc_out(0) <= \<const0>\;
  stall_out <= \<const0>\;
\EX_MEM_dest_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => forward_A_sel_10,
      D => ID_EX_src2(1),
      Q => EX_MEM_dest(1),
      S => ap_NS_fsm14_out
    );
\EX_MEM_valid_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => forward_A_sel_10,
      D => ID_EX_valid,
      Q => EX_MEM_valid,
      R => ap_NS_fsm14_out
    );
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\ID_EX_src1_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_ID_EX_src1_o(1),
      Q => ID_EX_src1(1),
      S => ap_NS_fsm14_out
    );
\ID_EX_src2_reg[1]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => '1',
      Q => ID_EX_src2(1),
      S => ap_NS_fsm14_out
    );
\ID_EX_valid_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => grp_clock_cycle_fu_123_n_36,
      Q => ID_EX_valid,
      R => '0'
    );
\IF_ID_valid_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => '1',
      Q => IF_ID_valid,
      R => ap_NS_fsm14_out
    );
\PC_V_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_9,
      Q => \^pc_out\(10),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_8,
      Q => \^pc_out\(11),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_7,
      Q => \^pc_out\(12),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_14,
      Q => \^pc_out\(13),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_13,
      Q => \^pc_out\(14),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_12,
      Q => \^pc_out\(15),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_11,
      Q => \^pc_out\(16),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_18,
      Q => \^pc_out\(17),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_17,
      Q => \^pc_out\(18),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_16,
      Q => \^pc_out\(19),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_15,
      Q => \^pc_out\(20),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_22,
      Q => \^pc_out\(21),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_21,
      Q => \^pc_out\(22),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_20,
      Q => \^pc_out\(23),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_19,
      Q => \^pc_out\(24),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_26,
      Q => \^pc_out\(25),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_25,
      Q => \^pc_out\(26),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[27]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_24,
      Q => \^pc_out\(27),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[28]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_23,
      Q => \^pc_out\(28),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[29]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_29,
      Q => \^pc_out\(29),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_2,
      Q => \^pc_out\(2),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[30]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_28,
      Q => \^pc_out\(30),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[31]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_27,
      Q => \^pc_out\(31),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_1,
      Q => \^pc_out\(3),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_0,
      Q => \^pc_out\(4),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_6,
      Q => \^pc_out\(5),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_5,
      Q => \^pc_out\(6),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_4,
      Q => \^pc_out\(7),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_3,
      Q => \^pc_out\(8),
      R => ap_NS_fsm14_out
    );
\PC_V_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => ID_EX_src20,
      D => grp_clock_cycle_fu_123_n_10,
      Q => \^pc_out\(9),
      R => ap_NS_fsm14_out
    );
\ap_CS_fsm[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"2333"
    )
        port map (
      I0 => \^ap_ready\,
      I1 => ap_CS_fsm_state2,
      I2 => \ap_CS_fsm_reg_n_0_[0]\,
      I3 => ap_start,
      O => ap_NS_fsm(0)
    );
\ap_CS_fsm[1]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"08"
    )
        port map (
      I0 => ap_start,
      I1 => \ap_CS_fsm_reg_n_0_[0]\,
      I2 => reset,
      O => ap_NS_fsm11_out
    );
\ap_CS_fsm_reg[0]\: unisim.vcomponents.FDSE
    generic map(
      INIT => '1'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(0),
      Q => \ap_CS_fsm_reg_n_0_[0]\,
      S => ap_rst
    );
\ap_CS_fsm_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(1),
      Q => ap_CS_fsm_state2,
      R => ap_rst
    );
\ap_CS_fsm_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => ap_NS_fsm(2),
      Q => \^ap_ready\,
      R => ap_rst
    );
ap_idle_INST_0: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \ap_CS_fsm_reg_n_0_[0]\,
      I1 => ap_start,
      O => ap_idle
    );
\forward_A_sel_1[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020000008000000"
    )
        port map (
      I0 => EX_MEM_valid,
      I1 => EX_MEM_dest(1),
      I2 => EX_MEM_dest(1),
      I3 => ID_EX_src1(1),
      I4 => ID_EX_valid,
      I5 => ID_EX_src1(1),
      O => grp_clock_cycle_fu_123_forward_A_sel_1(0)
    );
\forward_A_sel_1[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"80"
    )
        port map (
      I0 => reset,
      I1 => ap_start,
      I2 => \ap_CS_fsm_reg_n_0_[0]\,
      O => ap_NS_fsm14_out
    );
\forward_A_sel_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => forward_A_sel_10,
      D => grp_clock_cycle_fu_123_forward_A_sel_1(0),
      Q => \^forward_a_sel_out\(0),
      R => ap_NS_fsm14_out
    );
\forward_A_sel_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => forward_A_sel_10,
      D => '0',
      Q => \^forward_a_sel_out\(1),
      R => ap_NS_fsm14_out
    );
\forward_B_sel_1[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0020000008000000"
    )
        port map (
      I0 => EX_MEM_valid,
      I1 => EX_MEM_dest(1),
      I2 => EX_MEM_dest(1),
      I3 => ID_EX_src2(1),
      I4 => ID_EX_valid,
      I5 => ID_EX_src2(1),
      O => grp_clock_cycle_fu_123_forward_B_sel_1(0)
    );
\forward_B_sel_1_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => forward_A_sel_10,
      D => grp_clock_cycle_fu_123_forward_B_sel_1(0),
      Q => \^forward_b_sel_out\(0),
      R => ap_NS_fsm14_out
    );
\forward_B_sel_1_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => forward_A_sel_10,
      D => '0',
      Q => \^forward_b_sel_out\(1),
      R => ap_NS_fsm14_out
    );
grp_clock_cycle_fu_123: entity work.design_1_pipeline_top_0_0_pipeline_top_clock_cycle
     port map (
      D(1 downto 0) => ap_NS_fsm(2 downto 1),
      E(0) => forward_A_sel_10,
      ID_EX_src20 => ID_EX_src20,
      ID_EX_valid => ID_EX_valid,
      \ID_EX_valid_reg[0]\ => grp_clock_cycle_fu_123_n_36,
      IF_ID_valid => IF_ID_valid,
      O(2) => grp_clock_cycle_fu_123_n_0,
      O(1) => grp_clock_cycle_fu_123_n_1,
      O(0) => grp_clock_cycle_fu_123_n_2,
      \PC_V_reg[12]\(3) => grp_clock_cycle_fu_123_n_7,
      \PC_V_reg[12]\(2) => grp_clock_cycle_fu_123_n_8,
      \PC_V_reg[12]\(1) => grp_clock_cycle_fu_123_n_9,
      \PC_V_reg[12]\(0) => grp_clock_cycle_fu_123_n_10,
      \PC_V_reg[16]\(3) => grp_clock_cycle_fu_123_n_11,
      \PC_V_reg[16]\(2) => grp_clock_cycle_fu_123_n_12,
      \PC_V_reg[16]\(1) => grp_clock_cycle_fu_123_n_13,
      \PC_V_reg[16]\(0) => grp_clock_cycle_fu_123_n_14,
      \PC_V_reg[20]\(3) => grp_clock_cycle_fu_123_n_15,
      \PC_V_reg[20]\(2) => grp_clock_cycle_fu_123_n_16,
      \PC_V_reg[20]\(1) => grp_clock_cycle_fu_123_n_17,
      \PC_V_reg[20]\(0) => grp_clock_cycle_fu_123_n_18,
      \PC_V_reg[24]\(3) => grp_clock_cycle_fu_123_n_19,
      \PC_V_reg[24]\(2) => grp_clock_cycle_fu_123_n_20,
      \PC_V_reg[24]\(1) => grp_clock_cycle_fu_123_n_21,
      \PC_V_reg[24]\(0) => grp_clock_cycle_fu_123_n_22,
      \PC_V_reg[28]\(3) => grp_clock_cycle_fu_123_n_23,
      \PC_V_reg[28]\(2) => grp_clock_cycle_fu_123_n_24,
      \PC_V_reg[28]\(1) => grp_clock_cycle_fu_123_n_25,
      \PC_V_reg[28]\(0) => grp_clock_cycle_fu_123_n_26,
      \PC_V_reg[31]\(2) => grp_clock_cycle_fu_123_n_27,
      \PC_V_reg[31]\(1) => grp_clock_cycle_fu_123_n_28,
      \PC_V_reg[31]\(0) => grp_clock_cycle_fu_123_n_29,
      \PC_V_reg[8]\(3) => grp_clock_cycle_fu_123_n_3,
      \PC_V_reg[8]\(2) => grp_clock_cycle_fu_123_n_4,
      \PC_V_reg[8]\(1) => grp_clock_cycle_fu_123_n_5,
      \PC_V_reg[8]\(0) => grp_clock_cycle_fu_123_n_6,
      Q(1) => ap_CS_fsm_state2,
      Q(0) => \ap_CS_fsm_reg_n_0_[0]\,
      ap_NS_fsm11_out => ap_NS_fsm11_out,
      ap_NS_fsm14_out => ap_NS_fsm14_out,
      ap_clk => ap_clk,
      ap_rst => ap_rst,
      ap_start => ap_start,
      grp_clock_cycle_fu_123_ID_EX_src1_o(0) => grp_clock_cycle_fu_123_ID_EX_src1_o(1),
      grp_clock_cycle_fu_123_ap_start_reg => grp_clock_cycle_fu_123_ap_start_reg,
      pc_out(29 downto 0) => \^pc_out\(31 downto 2),
      reset => reset,
      reset_0 => grp_clock_cycle_fu_123_n_35
    );
grp_clock_cycle_fu_123_ap_start_reg_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => ap_clk,
      CE => '1',
      D => grp_clock_cycle_fu_123_n_35,
      Q => grp_clock_cycle_fu_123_ap_start_reg,
      R => ap_rst
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_pipeline_top_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_pipeline_top_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_pipeline_top_0_0 : entity is "design_1_pipeline_top_0_0,pipeline_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_pipeline_top_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_pipeline_top_0_0 : entity is "HLS";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_pipeline_top_0_0 : entity is "pipeline_top,Vivado 2021.2";
  attribute hls_module : string;
  attribute hls_module of design_1_pipeline_top_0_0 : entity is "yes";
end design_1_pipeline_top_0_0;

architecture STRUCTURE of design_1_pipeline_top_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \<const1>\ : STD_LOGIC;
  signal \^forward_a_sel_out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^forward_b_sel_out\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \^pc_out\ : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_inst_ap_local_block_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_ap_local_deadlock_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_stall_out_UNCONNECTED : STD_LOGIC;
  signal NLW_inst_forward_A_sel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_inst_forward_B_sel_out_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 2 );
  signal NLW_inst_hazard_dest_out_UNCONNECTED : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal NLW_inst_pc_out_UNCONNECTED : STD_LOGIC_VECTOR ( 1 downto 0 );
  attribute SDX_KERNEL : string;
  attribute SDX_KERNEL of inst : label is "true";
  attribute SDX_KERNEL_SYNTH_INST : string;
  attribute SDX_KERNEL_SYNTH_INST of inst : label is "inst";
  attribute SDX_KERNEL_TYPE : string;
  attribute SDX_KERNEL_TYPE of inst : label is "hls";
  attribute ap_ST_fsm_state1 : string;
  attribute ap_ST_fsm_state1 of inst : label is "3'b001";
  attribute ap_ST_fsm_state2 : string;
  attribute ap_ST_fsm_state2 of inst : label is "3'b010";
  attribute ap_ST_fsm_state3 : string;
  attribute ap_ST_fsm_state3 of inst : label is "3'b100";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ap_clk : signal is "xilinx.com:signal:clock:1.0 ap_clk CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ap_clk : signal is "XIL_INTERFACENAME ap_clk, ASSOCIATED_RESET ap_rst, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN /clk_wiz_clk_out1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_done : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl done";
  attribute X_INTERFACE_INFO of ap_idle : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl idle";
  attribute X_INTERFACE_INFO of ap_ready : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl ready";
  attribute X_INTERFACE_INFO of ap_rst : signal is "xilinx.com:signal:reset:1.0 ap_rst RST";
  attribute X_INTERFACE_PARAMETER of ap_rst : signal is "XIL_INTERFACENAME ap_rst, POLARITY ACTIVE_HIGH, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ap_start : signal is "xilinx.com:interface:acc_handshake:1.0 ap_ctrl start";
  attribute X_INTERFACE_INFO of reset : signal is "xilinx.com:signal:data:1.0 reset DATA";
  attribute X_INTERFACE_PARAMETER of reset : signal is "XIL_INTERFACENAME reset, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of stall_out : signal is "xilinx.com:signal:data:1.0 stall_out DATA";
  attribute X_INTERFACE_PARAMETER of stall_out : signal is "XIL_INTERFACENAME stall_out, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of forward_A_sel_out : signal is "xilinx.com:signal:data:1.0 forward_A_sel_out DATA";
  attribute X_INTERFACE_PARAMETER of forward_A_sel_out : signal is "XIL_INTERFACENAME forward_A_sel_out, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of forward_B_sel_out : signal is "xilinx.com:signal:data:1.0 forward_B_sel_out DATA";
  attribute X_INTERFACE_PARAMETER of forward_B_sel_out : signal is "XIL_INTERFACENAME forward_B_sel_out, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of hazard_dest_out : signal is "xilinx.com:signal:data:1.0 hazard_dest_out DATA";
  attribute X_INTERFACE_PARAMETER of hazard_dest_out : signal is "XIL_INTERFACENAME hazard_dest_out, LAYERED_METADATA undef";
  attribute X_INTERFACE_INFO of pc_out : signal is "xilinx.com:signal:data:1.0 pc_out DATA";
  attribute X_INTERFACE_PARAMETER of pc_out : signal is "XIL_INTERFACENAME pc_out, LAYERED_METADATA undef";
begin
  ap_local_block <= \<const0>\;
  ap_local_deadlock <= \<const0>\;
  forward_A_sel_out(31) <= \<const0>\;
  forward_A_sel_out(30) <= \<const0>\;
  forward_A_sel_out(29) <= \<const0>\;
  forward_A_sel_out(28) <= \<const0>\;
  forward_A_sel_out(27) <= \<const0>\;
  forward_A_sel_out(26) <= \<const0>\;
  forward_A_sel_out(25) <= \<const0>\;
  forward_A_sel_out(24) <= \<const0>\;
  forward_A_sel_out(23) <= \<const0>\;
  forward_A_sel_out(22) <= \<const0>\;
  forward_A_sel_out(21) <= \<const0>\;
  forward_A_sel_out(20) <= \<const0>\;
  forward_A_sel_out(19) <= \<const0>\;
  forward_A_sel_out(18) <= \<const0>\;
  forward_A_sel_out(17) <= \<const0>\;
  forward_A_sel_out(16) <= \<const0>\;
  forward_A_sel_out(15) <= \<const0>\;
  forward_A_sel_out(14) <= \<const0>\;
  forward_A_sel_out(13) <= \<const0>\;
  forward_A_sel_out(12) <= \<const0>\;
  forward_A_sel_out(11) <= \<const0>\;
  forward_A_sel_out(10) <= \<const0>\;
  forward_A_sel_out(9) <= \<const0>\;
  forward_A_sel_out(8) <= \<const0>\;
  forward_A_sel_out(7) <= \<const0>\;
  forward_A_sel_out(6) <= \<const0>\;
  forward_A_sel_out(5) <= \<const0>\;
  forward_A_sel_out(4) <= \<const0>\;
  forward_A_sel_out(3) <= \<const0>\;
  forward_A_sel_out(2) <= \<const0>\;
  forward_A_sel_out(1 downto 0) <= \^forward_a_sel_out\(1 downto 0);
  forward_B_sel_out(31) <= \<const0>\;
  forward_B_sel_out(30) <= \<const0>\;
  forward_B_sel_out(29) <= \<const0>\;
  forward_B_sel_out(28) <= \<const0>\;
  forward_B_sel_out(27) <= \<const0>\;
  forward_B_sel_out(26) <= \<const0>\;
  forward_B_sel_out(25) <= \<const0>\;
  forward_B_sel_out(24) <= \<const0>\;
  forward_B_sel_out(23) <= \<const0>\;
  forward_B_sel_out(22) <= \<const0>\;
  forward_B_sel_out(21) <= \<const0>\;
  forward_B_sel_out(20) <= \<const0>\;
  forward_B_sel_out(19) <= \<const0>\;
  forward_B_sel_out(18) <= \<const0>\;
  forward_B_sel_out(17) <= \<const0>\;
  forward_B_sel_out(16) <= \<const0>\;
  forward_B_sel_out(15) <= \<const0>\;
  forward_B_sel_out(14) <= \<const0>\;
  forward_B_sel_out(13) <= \<const0>\;
  forward_B_sel_out(12) <= \<const0>\;
  forward_B_sel_out(11) <= \<const0>\;
  forward_B_sel_out(10) <= \<const0>\;
  forward_B_sel_out(9) <= \<const0>\;
  forward_B_sel_out(8) <= \<const0>\;
  forward_B_sel_out(7) <= \<const0>\;
  forward_B_sel_out(6) <= \<const0>\;
  forward_B_sel_out(5) <= \<const0>\;
  forward_B_sel_out(4) <= \<const0>\;
  forward_B_sel_out(3) <= \<const0>\;
  forward_B_sel_out(2) <= \<const0>\;
  forward_B_sel_out(1 downto 0) <= \^forward_b_sel_out\(1 downto 0);
  hazard_dest_out(31) <= \<const1>\;
  hazard_dest_out(30) <= \<const1>\;
  hazard_dest_out(29) <= \<const1>\;
  hazard_dest_out(28) <= \<const1>\;
  hazard_dest_out(27) <= \<const1>\;
  hazard_dest_out(26) <= \<const1>\;
  hazard_dest_out(25) <= \<const1>\;
  hazard_dest_out(24) <= \<const1>\;
  hazard_dest_out(23) <= \<const1>\;
  hazard_dest_out(22) <= \<const1>\;
  hazard_dest_out(21) <= \<const1>\;
  hazard_dest_out(20) <= \<const1>\;
  hazard_dest_out(19) <= \<const1>\;
  hazard_dest_out(18) <= \<const1>\;
  hazard_dest_out(17) <= \<const1>\;
  hazard_dest_out(16) <= \<const1>\;
  hazard_dest_out(15) <= \<const1>\;
  hazard_dest_out(14) <= \<const1>\;
  hazard_dest_out(13) <= \<const1>\;
  hazard_dest_out(12) <= \<const1>\;
  hazard_dest_out(11) <= \<const1>\;
  hazard_dest_out(10) <= \<const1>\;
  hazard_dest_out(9) <= \<const1>\;
  hazard_dest_out(8) <= \<const1>\;
  hazard_dest_out(7) <= \<const1>\;
  hazard_dest_out(6) <= \<const1>\;
  hazard_dest_out(5) <= \<const1>\;
  hazard_dest_out(4) <= \<const1>\;
  hazard_dest_out(3) <= \<const1>\;
  hazard_dest_out(2) <= \<const1>\;
  hazard_dest_out(1) <= \<const1>\;
  hazard_dest_out(0) <= \<const1>\;
  pc_out(31 downto 2) <= \^pc_out\(31 downto 2);
  pc_out(1) <= \<const0>\;
  pc_out(0) <= \<const0>\;
  stall_out <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
VCC: unisim.vcomponents.VCC
     port map (
      P => \<const1>\
    );
inst: entity work.design_1_pipeline_top_0_0_pipeline_top
     port map (
      ap_clk => ap_clk,
      ap_done => ap_done,
      ap_idle => ap_idle,
      ap_local_block => NLW_inst_ap_local_block_UNCONNECTED,
      ap_local_deadlock => NLW_inst_ap_local_deadlock_UNCONNECTED,
      ap_ready => ap_ready,
      ap_rst => ap_rst,
      ap_start => ap_start,
      forward_A_sel_out(31 downto 2) => NLW_inst_forward_A_sel_out_UNCONNECTED(31 downto 2),
      forward_A_sel_out(1 downto 0) => \^forward_a_sel_out\(1 downto 0),
      forward_B_sel_out(31 downto 2) => NLW_inst_forward_B_sel_out_UNCONNECTED(31 downto 2),
      forward_B_sel_out(1 downto 0) => \^forward_b_sel_out\(1 downto 0),
      hazard_dest_out(31 downto 0) => NLW_inst_hazard_dest_out_UNCONNECTED(31 downto 0),
      pc_out(31 downto 2) => \^pc_out\(31 downto 2),
      pc_out(1 downto 0) => NLW_inst_pc_out_UNCONNECTED(1 downto 0),
      reset => reset,
      stall_out => NLW_inst_stall_out_UNCONNECTED
    );
end STRUCTURE;
