-- ------------------------------------------------------------------------- 
-- High Level Design Compiler for Intel(R) FPGAs Version 18.1 (Release Build #625)
-- 
-- Legal Notice: Copyright 2018 Intel Corporation.  All rights reserved.
-- Your use of  Intel Corporation's design tools,  logic functions and other
-- software and  tools, and its AMPP partner logic functions, and any output
-- files any  of the foregoing (including  device programming  or simulation
-- files), and  any associated  documentation  or information  are expressly
-- subject  to the terms and  conditions of the  Intel FPGA Software License
-- Agreement, Intel MegaCore Function License Agreement, or other applicable
-- license agreement,  including,  without limitation,  that your use is for
-- the  sole  purpose of  programming  logic devices  manufactured by  Intel
-- and  sold by Intel  or its authorized  distributors. Please refer  to the
-- applicable agreement for further details.
-- ---------------------------------------------------------------------------

-- VHDL created from i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add23_data_fifo
-- VHDL created on Tue Nov 24 20:29:59 2020


library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;
use IEEE.MATH_REAL.all;
use std.TextIO.all;
use work.dspba_library_package.all;

LIBRARY altera_mf;
USE altera_mf.altera_mf_components.all;
LIBRARY altera_lnsim;
USE altera_lnsim.altera_lnsim_components.altera_syncram;
LIBRARY lpm;
USE lpm.lpm_components.all;

entity i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add23_data_fifo is
    port (
        in_data_in_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_data_in_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_4 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_5 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_6 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_7 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_8 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_9 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_10 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_data_in_11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_13 : in std_logic_vector(63 downto 0);  -- ufix64
        in_data_in_14 : in std_logic_vector(31 downto 0);  -- ufix32
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_data_out_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_4 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_5 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_6 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_7 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_8 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_9 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_10 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_data_out_11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_data_out_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add23_data_fifo;

architecture normal of i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add23_data_fifo is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component acl_data_fifo is
        generic (
            DEPTH : INTEGER;
            ALLOW_FULL_WRITE : INTEGER := 1;
            DATA_WIDTH : INTEGER := 576;
            IMPL : STRING := "ram"
        );
        port (
            data_in : in std_logic_vector(575 downto 0);
            stall_in : in std_logic;
            valid_in : in std_logic;
            data_out : out std_logic_vector(575 downto 0);
            stall_out : out std_logic;
            valid_out : out std_logic;
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    signal dupName_0_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_0_dsdk_ip_adapt_bitjoin_x_q : STD_LOGIC_VECTOR (511 downto 0);
    signal dupName_0_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (511 downto 0);
    signal dupName_0_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_1_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_2_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_3_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_4_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_4_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_4_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_5_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_5_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_5_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_6_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_6_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_6_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_7_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_7_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_7_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_8_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_8_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_8_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_9_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_9_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_9_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_10_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_10_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_10_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_11_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_11_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_11_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_12_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_12_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_12_ip_dsdk_adapt_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_13_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_13_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (63 downto 0);
    signal dupName_14_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_14_ip_dsdk_adapt_bitselect_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_15_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_16_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_17_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_18_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal dupName_19_agg_adapt_to_ufixed_cast_x_b : STD_LOGIC_VECTOR (511 downto 0);
    signal adapt_scalar_trunc_in : STD_LOGIC_VECTOR (0 downto 0);
    signal adapt_scalar_trunc_q : STD_LOGIC_VECTOR (0 downto 0);
    signal agg_adapt_to_ufixed_cast_b : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i24_0gr_q : STD_LOGIC_VECTOR (23 downto 0);
    signal c_i7_0gr_q : STD_LOGIC_VECTOR (6 downto 0);
    signal dsdk_ip_adapt_bitjoin_q : STD_LOGIC_VECTOR (575 downto 0);
    signal element_extension_q : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_data_in : STD_LOGIC_VECTOR (575 downto 0);
    signal i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_in_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_data_out : STD_LOGIC_VECTOR (575 downto 0);
    signal i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_out_bitsignaltemp : std_logic;
    signal i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_out_bitsignaltemp : std_logic;
    signal ip_dsdk_adapt_bitselect_b : STD_LOGIC_VECTOR (0 downto 0);
    signal ip_dsdk_adapt_cast_b : STD_LOGIC_VECTOR (31 downto 0);

begin


    -- c_i24_0gr(CONSTANT,55)
    c_i24_0gr_q <= "000000000000000000000000";

    -- dupName_17_agg_adapt_to_ufixed_cast_x(BITSELECT,50)
    dupName_17_agg_adapt_to_ufixed_cast_x_b <= STD_LOGIC_VECTOR(in_data_in_10(31 downto 0));

    -- dupName_18_agg_adapt_to_ufixed_cast_x(BITSELECT,51)
    dupName_18_agg_adapt_to_ufixed_cast_x_b <= dupName_17_agg_adapt_to_ufixed_cast_x_b(31 downto 0);

    -- dupName_15_agg_adapt_to_ufixed_cast_x(BITSELECT,48)
    dupName_15_agg_adapt_to_ufixed_cast_x_b <= STD_LOGIC_VECTOR(in_data_in_9(31 downto 0));

    -- dupName_16_agg_adapt_to_ufixed_cast_x(BITSELECT,49)
    dupName_16_agg_adapt_to_ufixed_cast_x_b <= dupName_15_agg_adapt_to_ufixed_cast_x_b(31 downto 0);

    -- dupName_13_agg_adapt_to_ufixed_cast_x(BITSELECT,44)
    dupName_13_agg_adapt_to_ufixed_cast_x_b <= STD_LOGIC_VECTOR(in_data_in_8(31 downto 0));

    -- dupName_14_agg_adapt_to_ufixed_cast_x(BITSELECT,46)
    dupName_14_agg_adapt_to_ufixed_cast_x_b <= dupName_13_agg_adapt_to_ufixed_cast_x_b(31 downto 0);

    -- dupName_11_agg_adapt_to_ufixed_cast_x(BITSELECT,38)
    dupName_11_agg_adapt_to_ufixed_cast_x_b <= STD_LOGIC_VECTOR(in_data_in_7(31 downto 0));

    -- dupName_12_agg_adapt_to_ufixed_cast_x(BITSELECT,41)
    dupName_12_agg_adapt_to_ufixed_cast_x_b <= dupName_11_agg_adapt_to_ufixed_cast_x_b(31 downto 0);

    -- dupName_9_agg_adapt_to_ufixed_cast_x(BITSELECT,32)
    dupName_9_agg_adapt_to_ufixed_cast_x_b <= STD_LOGIC_VECTOR(in_data_in_6(31 downto 0));

    -- dupName_10_agg_adapt_to_ufixed_cast_x(BITSELECT,35)
    dupName_10_agg_adapt_to_ufixed_cast_x_b <= dupName_9_agg_adapt_to_ufixed_cast_x_b(31 downto 0);

    -- dupName_7_agg_adapt_to_ufixed_cast_x(BITSELECT,26)
    dupName_7_agg_adapt_to_ufixed_cast_x_b <= STD_LOGIC_VECTOR(in_data_in_5(31 downto 0));

    -- dupName_8_agg_adapt_to_ufixed_cast_x(BITSELECT,29)
    dupName_8_agg_adapt_to_ufixed_cast_x_b <= dupName_7_agg_adapt_to_ufixed_cast_x_b(31 downto 0);

    -- dupName_5_agg_adapt_to_ufixed_cast_x(BITSELECT,20)
    dupName_5_agg_adapt_to_ufixed_cast_x_b <= STD_LOGIC_VECTOR(in_data_in_4(31 downto 0));

    -- dupName_6_agg_adapt_to_ufixed_cast_x(BITSELECT,23)
    dupName_6_agg_adapt_to_ufixed_cast_x_b <= dupName_5_agg_adapt_to_ufixed_cast_x_b(31 downto 0);

    -- dupName_3_agg_adapt_to_ufixed_cast_x(BITSELECT,14)
    dupName_3_agg_adapt_to_ufixed_cast_x_b <= STD_LOGIC_VECTOR(in_data_in_3(31 downto 0));

    -- dupName_4_agg_adapt_to_ufixed_cast_x(BITSELECT,17)
    dupName_4_agg_adapt_to_ufixed_cast_x_b <= dupName_3_agg_adapt_to_ufixed_cast_x_b(31 downto 0);

    -- dupName_1_agg_adapt_to_ufixed_cast_x(BITSELECT,8)
    dupName_1_agg_adapt_to_ufixed_cast_x_b <= STD_LOGIC_VECTOR(in_data_in_2(31 downto 0));

    -- dupName_2_agg_adapt_to_ufixed_cast_x(BITSELECT,11)
    dupName_2_agg_adapt_to_ufixed_cast_x_b <= dupName_1_agg_adapt_to_ufixed_cast_x_b(31 downto 0);

    -- agg_adapt_to_ufixed_cast(BITSELECT,54)
    agg_adapt_to_ufixed_cast_b <= STD_LOGIC_VECTOR(in_data_in_1(31 downto 0));

    -- dupName_0_agg_adapt_to_ufixed_cast_x(BITSELECT,4)
    dupName_0_agg_adapt_to_ufixed_cast_x_b <= agg_adapt_to_ufixed_cast_b(31 downto 0);

    -- dupName_0_dsdk_ip_adapt_bitjoin_x(BITJOIN,5)
    dupName_0_dsdk_ip_adapt_bitjoin_x_q <= in_data_in_13 & in_data_in_12 & in_data_in_11 & dupName_18_agg_adapt_to_ufixed_cast_x_b & dupName_16_agg_adapt_to_ufixed_cast_x_b & dupName_14_agg_adapt_to_ufixed_cast_x_b & dupName_12_agg_adapt_to_ufixed_cast_x_b & dupName_10_agg_adapt_to_ufixed_cast_x_b & dupName_8_agg_adapt_to_ufixed_cast_x_b & dupName_6_agg_adapt_to_ufixed_cast_x_b & dupName_4_agg_adapt_to_ufixed_cast_x_b & dupName_2_agg_adapt_to_ufixed_cast_x_b & dupName_0_agg_adapt_to_ufixed_cast_x_b;

    -- dupName_19_agg_adapt_to_ufixed_cast_x(BITSELECT,52)
    dupName_19_agg_adapt_to_ufixed_cast_x_b <= dupName_0_dsdk_ip_adapt_bitjoin_x_q(511 downto 0);

    -- c_i7_0gr(CONSTANT,56)
    c_i7_0gr_q <= "0000000";

    -- element_extension(BITJOIN,58)
    element_extension_q <= c_i7_0gr_q & in_data_in_0;

    -- dsdk_ip_adapt_bitjoin(BITJOIN,57)
    dsdk_ip_adapt_bitjoin_q <= in_data_in_14 & c_i24_0gr_q & dupName_19_agg_adapt_to_ufixed_cast_x_b & element_extension_q;

    -- i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24(EXTIFACE,59)
    i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_data_in <= dsdk_ip_adapt_bitjoin_q;
    i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_in <= in_stall_in;
    i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_in <= in_valid_in;
    i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_in_bitsignaltemp <= i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_in(0);
    i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_in_bitsignaltemp <= i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_in(0);
    i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_out(0) <= i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_out_bitsignaltemp;
    i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_out(0) <= i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_out_bitsignaltemp;
    thei_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24 : acl_data_fifo
    GENERIC MAP (
        DEPTH => 32,
        ALLOW_FULL_WRITE => 1,
        DATA_WIDTH => 576,
        IMPL => "ram"
    )
    PORT MAP (
        data_in => dsdk_ip_adapt_bitjoin_q,
        stall_in => i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_in_bitsignaltemp,
        valid_in => i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_in_bitsignaltemp,
        data_out => i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_data_out,
        stall_out => i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_out_bitsignaltemp,
        valid_out => i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- dupName_14_ip_dsdk_adapt_bitselect_x(BITSELECT,47)
    dupName_14_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_data_out(575 downto 544);

    -- dupName_12_ip_dsdk_adapt_cast_x(BITSELECT,43)
    dupName_12_ip_dsdk_adapt_cast_x_b <= dupName_14_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_0_ip_dsdk_adapt_bitselect_x(BITSELECT,6)
    dupName_0_ip_dsdk_adapt_bitselect_x_b <= i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_data_out(519 downto 8);

    -- dupName_13_ip_dsdk_adapt_bitselect_x(BITSELECT,45)
    dupName_13_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(511 downto 448);

    -- dupName_11_ip_dsdk_adapt_cast_x(BITSELECT,40)
    dupName_11_ip_dsdk_adapt_cast_x_b <= dupName_13_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_12_ip_dsdk_adapt_bitselect_x(BITSELECT,42)
    dupName_12_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(447 downto 384);

    -- dupName_10_ip_dsdk_adapt_cast_x(BITSELECT,37)
    dupName_10_ip_dsdk_adapt_cast_x_b <= dupName_12_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_11_ip_dsdk_adapt_bitselect_x(BITSELECT,39)
    dupName_11_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(383 downto 320);

    -- dupName_9_ip_dsdk_adapt_cast_x(BITSELECT,34)
    dupName_9_ip_dsdk_adapt_cast_x_b <= dupName_11_ip_dsdk_adapt_bitselect_x_b(63 downto 0);

    -- dupName_10_ip_dsdk_adapt_bitselect_x(BITSELECT,36)
    dupName_10_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(319 downto 288);

    -- dupName_8_ip_dsdk_adapt_cast_x(BITSELECT,31)
    dupName_8_ip_dsdk_adapt_cast_x_b <= dupName_10_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_9_ip_dsdk_adapt_bitselect_x(BITSELECT,33)
    dupName_9_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(287 downto 256);

    -- dupName_7_ip_dsdk_adapt_cast_x(BITSELECT,28)
    dupName_7_ip_dsdk_adapt_cast_x_b <= dupName_9_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_8_ip_dsdk_adapt_bitselect_x(BITSELECT,30)
    dupName_8_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(255 downto 224);

    -- dupName_6_ip_dsdk_adapt_cast_x(BITSELECT,25)
    dupName_6_ip_dsdk_adapt_cast_x_b <= dupName_8_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_7_ip_dsdk_adapt_bitselect_x(BITSELECT,27)
    dupName_7_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(223 downto 192);

    -- dupName_5_ip_dsdk_adapt_cast_x(BITSELECT,22)
    dupName_5_ip_dsdk_adapt_cast_x_b <= dupName_7_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_6_ip_dsdk_adapt_bitselect_x(BITSELECT,24)
    dupName_6_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(191 downto 160);

    -- dupName_4_ip_dsdk_adapt_cast_x(BITSELECT,19)
    dupName_4_ip_dsdk_adapt_cast_x_b <= dupName_6_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_5_ip_dsdk_adapt_bitselect_x(BITSELECT,21)
    dupName_5_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(159 downto 128);

    -- dupName_3_ip_dsdk_adapt_cast_x(BITSELECT,16)
    dupName_3_ip_dsdk_adapt_cast_x_b <= dupName_5_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_4_ip_dsdk_adapt_bitselect_x(BITSELECT,18)
    dupName_4_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(127 downto 96);

    -- dupName_2_ip_dsdk_adapt_cast_x(BITSELECT,13)
    dupName_2_ip_dsdk_adapt_cast_x_b <= dupName_4_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_3_ip_dsdk_adapt_bitselect_x(BITSELECT,15)
    dupName_3_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(95 downto 64);

    -- dupName_1_ip_dsdk_adapt_cast_x(BITSELECT,10)
    dupName_1_ip_dsdk_adapt_cast_x_b <= dupName_3_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_2_ip_dsdk_adapt_bitselect_x(BITSELECT,12)
    dupName_2_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(63 downto 32);

    -- dupName_0_ip_dsdk_adapt_cast_x(BITSELECT,7)
    dupName_0_ip_dsdk_adapt_cast_x_b <= dupName_2_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- dupName_1_ip_dsdk_adapt_bitselect_x(BITSELECT,9)
    dupName_1_ip_dsdk_adapt_bitselect_x_b <= dupName_0_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- ip_dsdk_adapt_cast(BITSELECT,61)
    ip_dsdk_adapt_cast_b <= dupName_1_ip_dsdk_adapt_bitselect_x_b(31 downto 0);

    -- ip_dsdk_adapt_bitselect(BITSELECT,60)
    ip_dsdk_adapt_bitselect_b <= i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_data_out(0 downto 0);

    -- adapt_scalar_trunc(ROUND,53)
    adapt_scalar_trunc_in <= ip_dsdk_adapt_bitselect_b;
    adapt_scalar_trunc_q <= adapt_scalar_trunc_in(0 downto 0);

    -- dupName_0_sync_out_aunroll_x(GPOUT,3)@20000003
    out_data_out_0 <= adapt_scalar_trunc_q;
    out_data_out_1 <= ip_dsdk_adapt_cast_b;
    out_data_out_2 <= dupName_0_ip_dsdk_adapt_cast_x_b;
    out_data_out_3 <= dupName_1_ip_dsdk_adapt_cast_x_b;
    out_data_out_4 <= dupName_2_ip_dsdk_adapt_cast_x_b;
    out_data_out_5 <= dupName_3_ip_dsdk_adapt_cast_x_b;
    out_data_out_6 <= dupName_4_ip_dsdk_adapt_cast_x_b;
    out_data_out_7 <= dupName_5_ip_dsdk_adapt_cast_x_b;
    out_data_out_8 <= dupName_6_ip_dsdk_adapt_cast_x_b;
    out_data_out_9 <= dupName_7_ip_dsdk_adapt_cast_x_b;
    out_data_out_10 <= dupName_8_ip_dsdk_adapt_cast_x_b;
    out_data_out_11 <= dupName_9_ip_dsdk_adapt_cast_x_b;
    out_data_out_12 <= dupName_10_ip_dsdk_adapt_cast_x_b;
    out_data_out_13 <= dupName_11_ip_dsdk_adapt_cast_x_b;
    out_data_out_14 <= dupName_12_ip_dsdk_adapt_cast_x_b;
    out_valid_out <= i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_valid_out;

    -- sync_out(GPOUT,63)@20000000
    out_stall_out <= i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add24_stall_out;

END normal;
