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

-- VHDL created from bb_vector_add_B0_stall_region
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

entity bb_vector_add_B0_stall_region is
    port (
        in_memcoalesce_b_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_b_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_b_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_b_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_b_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_b_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_b_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_b_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_b_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_b_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_b_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_b : in std_logic_vector(63 downto 0);  -- ufix64
        in_valid_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_valid_out : out std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memdep_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memdep_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memdep_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_c : in std_logic_vector(63 downto 0);  -- ufix64
        out_lsu_memdep_o_active : out std_logic_vector(0 downto 0);  -- ufix1
        in_flush : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_a_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- ufix256
        in_memcoalesce_a_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_a_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- ufix1
        in_memcoalesce_a_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_a_load_0_avm_address : out std_logic_vector(29 downto 0);  -- ufix30
        out_memcoalesce_a_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_a_load_0_avm_read : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_a_load_0_avm_write : out std_logic_vector(0 downto 0);  -- ufix1
        out_memcoalesce_a_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- ufix256
        out_memcoalesce_a_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- ufix32
        out_memcoalesce_a_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- ufix5
        in_a : in std_logic_vector(63 downto 0);  -- ufix64
        in_stall_in : in std_logic_vector(0 downto 0);  -- ufix1
        out_stall_out : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end bb_vector_add_B0_stall_region;

architecture normal of bb_vector_add_B0_stall_region is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component i_load_memcoalesce_a_load_0_vector_add8 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_a_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_a_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_a_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_a_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_4 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_7 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_8 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_9 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_10 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_a_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_a_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_a_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_a_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_a_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_a_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_a_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_load_memcoalesce_b_load_0_vector_add10 is
        port (
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_b_load_0_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memcoalesce_b_load_0_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_b_load_0_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memcoalesce_b_load_0_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_readdata_0 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_4 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_7 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_8 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_9 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_o_readdata_10 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_o_readdata_12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_memcoalesce_b_load_0_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memcoalesce_b_load_0_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memcoalesce_b_load_0_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memcoalesce_b_load_0_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_b_load_0_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_b_load_0_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memcoalesce_b_load_0_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_sfc_c0_entry_vector_add_c0_enter_vector_add is
        port (
            in_c0_eni2_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_c0_eni2_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_4 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_7 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_8 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_9 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_10 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni2_12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni2_13 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni2_14 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_15 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_16 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_17 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_18 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_19 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_20 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_21 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_22 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_23 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_c0_eni2_24 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni2_25 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_c0_eni2_26 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_c0_exit_1 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_2 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_3 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_4 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_5 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_6 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_7 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_8 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_9 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_10 : out std_logic_vector(31 downto 0);  -- Floating Point
            out_c0_exit_11 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_12 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_13 : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_c0_exit_14 : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_store_memdep_vector_add16 is
        port (
            in_i_writedata_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_2 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_3 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_4 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_5 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_6 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_7 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_8 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_9 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_i_writedata_10 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_writedata_11 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_writedata_12 : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_flush : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_address : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_stall : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_i_valid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_readdata : in std_logic_vector(255 downto 0);  -- Fixed Point
            in_memdep_avm_readdatavalid : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_waitrequest : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_memdep_avm_writeack : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_lsu_memdep_o_active : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_address : out std_logic_vector(29 downto 0);  -- Fixed Point
            out_memdep_avm_burstcount : out std_logic_vector(4 downto 0);  -- Fixed Point
            out_memdep_avm_byteenable : out std_logic_vector(31 downto 0);  -- Fixed Point
            out_memdep_avm_enable : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_read : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_write : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_memdep_avm_writedata : out std_logic_vector(255 downto 0);  -- Fixed Point
            out_o_stall : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_valid : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_o_writeack : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_pop_i1_throttle_pop_vector_add0 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_dir : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_in_0 : in std_logic_vector(7 downto 0);  -- Fixed Point
            in_feedback_valid_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_predicate : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_stall_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_acl_push_i1_throttle_push_vector_add21 is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_feedback_stall_in_0 : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_feedback_out_0 : out std_logic_vector(7 downto 0);  -- Fixed Point
            out_feedback_valid_out_0 : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_a_sync_buffer_vector_add2 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_b_sync_buffer_vector_add4 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component i_syncbuf_c_sync_buffer_vector_add6 is
        port (
            in_buffer_in : in std_logic_vector(63 downto 0);  -- Fixed Point
            in_i_dependence : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_buffer_out : out std_logic_vector(63 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component vector_add_B0_merge_reg is
        port (
            in_data_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_stall_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            in_valid_in : in std_logic_vector(0 downto 0);  -- Fixed Point
            out_data_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_stall_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            out_valid_out : out std_logic_vector(0 downto 0);  -- Fixed Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;


    component acl_valid_fifo_counter is
        generic (
            DEPTH : INTEGER := 0;
            ASYNC_RESET : INTEGER := 1;
            STRICT_DEPTH : INTEGER := 0;
            ALLOW_FULL_WRITE : INTEGER := 0
        );
        port (
            clock : in std_logic;
            resetn : in std_logic;
            valid_in : in std_logic;
            stall_in : in std_logic;
            valid_out : out std_logic;
            stall_out : out std_logic;
            full : out std_logic
        );
    end component;


    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_10 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_11 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_12 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_0 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_10 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_11 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_12 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_1 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_2 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_3 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_4 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_5 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_6 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_7 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_8 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_9 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_10 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_11 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_12 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_13 : STD_LOGIC_VECTOR (63 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_14 : STD_LOGIC_VECTOR (31 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_lsu_memdep_o_active : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_memdep_avm_address : STD_LOGIC_VECTOR (29 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_memdep_avm_burstcount : STD_LOGIC_VECTOR (4 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_memdep_avm_byteenable : STD_LOGIC_VECTOR (31 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_memdep_avm_enable : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_memdep_avm_read : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_memdep_avm_write : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_memdep_avm_writedata : STD_LOGIC_VECTOR (255 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_o_stall : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_o_valid : STD_LOGIC_VECTOR (0 downto 0);
    signal i_store_memdep_vector_add_aunroll_x_out_o_writeack : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i32_0gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal c_i32_1gr_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_acl_pop_i1_throttle_pop_vector_add_out_data_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_vector_add_out_feedback_stall_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_vector_add_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_pop_i1_throttle_pop_vector_add_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_vector_add_out_feedback_out_0 : STD_LOGIC_VECTOR (7 downto 0);
    signal i_acl_push_i1_throttle_push_vector_add_out_feedback_valid_out_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_vector_add_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_acl_push_i1_throttle_push_vector_add_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_a_sync_buffer_vector_add_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_a_sync_buffer_vector_add_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_a_sync_buffer_vector_add_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_b_sync_buffer_vector_add_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_b_sync_buffer_vector_add_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_b_sync_buffer_vector_add_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_c_sync_buffer_vector_add_out_buffer_out : STD_LOGIC_VECTOR (63 downto 0);
    signal i_syncbuf_c_sync_buffer_vector_add_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_syncbuf_c_sync_buffer_vector_add_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal i_thr_dep1_vector_add_q : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_vector_add18_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_vector_add18_vt_const_31_q : STD_LOGIC_VECTOR (30 downto 0);
    signal i_unnamed_vector_add18_vt_join_q : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_vector_add18_vt_select_0_b : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_vector_add19_qi : STD_LOGIC_VECTOR (0 downto 0);
    signal i_unnamed_vector_add19_q : STD_LOGIC_VECTOR (0 downto 0);
    signal vector_add_B0_merge_reg_out_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal vector_add_B0_merge_reg_out_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q : STD_LOGIC_VECTOR (511 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_l : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_m : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_n : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q : STD_LOGIC_VECTOR (511 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_l : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_m : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_n : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q : STD_LOGIC_VECTOR (543 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_b : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_c : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_d : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_e : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_f : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_g : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_h : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_i : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_j : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_k : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_l : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_m : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_n : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_o : STD_LOGIC_VECTOR (31 downto 0);
    signal bubble_join_i_store_memdep_vector_add_aunroll_x_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_store_memdep_vector_add_aunroll_x_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_acl_pop_i1_throttle_pop_vector_add_q : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_select_i_acl_pop_i1_throttle_pop_vector_add_b : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_join_i_syncbuf_a_sync_buffer_vector_add_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_a_sync_buffer_vector_add_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_b_sync_buffer_vector_add_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_b_sync_buffer_vector_add_b : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_join_i_syncbuf_c_sync_buffer_vector_add_q : STD_LOGIC_VECTOR (63 downto 0);
    signal bubble_select_i_syncbuf_c_sync_buffer_vector_add_b : STD_LOGIC_VECTOR (63 downto 0);
    signal SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_vector_add_aunroll_x_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_vector_add_aunroll_x_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_vector_add_aunroll_x_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_store_memdep_vector_add_aunroll_x_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_pop_i1_throttle_pop_vector_add_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_vector_add_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_vector_add_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_acl_push_i1_throttle_push_vector_add_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_a_sync_buffer_vector_add_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_a_sync_buffer_vector_add_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_a_sync_buffer_vector_add_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_a_sync_buffer_vector_add_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_b_sync_buffer_vector_add_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_b_sync_buffer_vector_add_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_b_sync_buffer_vector_add_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_b_sync_buffer_vector_add_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_c_sync_buffer_vector_add_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_c_sync_buffer_vector_add_and0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_c_sync_buffer_vector_add_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_i_syncbuf_c_sync_buffer_vector_add_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_vector_add19_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_vector_add19_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_vector_add19_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_vector_add19_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_vector_add19_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_i_unnamed_vector_add19_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_stall_entry_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_wireStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_StallValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_toReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_fromReg0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_consumed0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_toReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_fromReg1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_consumed1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_toReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_fromReg2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_consumed2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_or1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_vector_add_B0_merge_reg_V2 : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_vector_add_B0_merge_reg_4_wireValid : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_vector_add_B0_merge_reg_4_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal SE_out_bubble_out_vector_add_B0_merge_reg_4_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_2_reg_R_v_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_2_reg_R_v_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_2_reg_v_s_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_2_reg_s_tv_0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_2_reg_s_tv_1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_2_reg_backEN : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_2_reg_or0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_2_reg_backStall : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_2_reg_V0 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_2_reg_V1 : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_4_reg_valid_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_4_reg_valid_in_bitsignaltemp : std_logic;
    signal bubble_out_vector_add_B0_merge_reg_4_reg_stall_in : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_4_reg_stall_in_bitsignaltemp : std_logic;
    signal bubble_out_vector_add_B0_merge_reg_4_reg_valid_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_4_reg_valid_out_bitsignaltemp : std_logic;
    signal bubble_out_vector_add_B0_merge_reg_4_reg_stall_out : STD_LOGIC_VECTOR (0 downto 0);
    signal bubble_out_vector_add_B0_merge_reg_4_reg_stall_out_bitsignaltemp : std_logic;

begin


    -- bubble_join_i_syncbuf_a_sync_buffer_vector_add(BITJOIN,84)
    bubble_join_i_syncbuf_a_sync_buffer_vector_add_q <= i_syncbuf_a_sync_buffer_vector_add_out_buffer_out;

    -- bubble_select_i_syncbuf_a_sync_buffer_vector_add(BITSELECT,85)
    bubble_select_i_syncbuf_a_sync_buffer_vector_add_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_a_sync_buffer_vector_add_q(63 downto 0));

    -- i_load_memcoalesce_a_load_0_vector_add_aunroll_x(BLACKBOX,30)@2
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@4
    -- out out_o_readdata_1@4
    -- out out_o_readdata_2@4
    -- out out_o_readdata_3@4
    -- out out_o_readdata_4@4
    -- out out_o_readdata_5@4
    -- out out_o_readdata_6@4
    -- out out_o_readdata_7@4
    -- out out_o_readdata_8@4
    -- out out_o_readdata_9@4
    -- out out_o_readdata_10@4
    -- out out_o_readdata_11@4
    -- out out_o_readdata_12@4
    -- out out_memcoalesce_a_load_0_avm_address@20000000
    -- out out_memcoalesce_a_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_a_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_a_load_0_avm_enable@20000000
    -- out out_memcoalesce_a_load_0_avm_read@20000000
    -- out out_memcoalesce_a_load_0_avm_write@20000000
    -- out out_memcoalesce_a_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@4
    thei_load_memcoalesce_a_load_0_vector_add_aunroll_x : i_load_memcoalesce_a_load_0_vector_add8
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_syncbuf_a_sync_buffer_vector_add_b,
        in_i_dependence => bubble_select_i_acl_pop_i1_throttle_pop_vector_add_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_backStall,
        in_i_valid => SE_out_i_syncbuf_a_sync_buffer_vector_add_V0,
        in_memcoalesce_a_load_0_avm_readdata => in_memcoalesce_a_load_0_avm_readdata,
        in_memcoalesce_a_load_0_avm_readdatavalid => in_memcoalesce_a_load_0_avm_readdatavalid,
        in_memcoalesce_a_load_0_avm_waitrequest => in_memcoalesce_a_load_0_avm_waitrequest,
        in_memcoalesce_a_load_0_avm_writeack => in_memcoalesce_a_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_3,
        out_o_readdata_4 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_4,
        out_o_readdata_5 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_5,
        out_o_readdata_6 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_6,
        out_o_readdata_7 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_7,
        out_o_readdata_8 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_8,
        out_o_readdata_9 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_9,
        out_o_readdata_10 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_10,
        out_o_readdata_11 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_11,
        out_o_readdata_12 => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_12,
        out_memcoalesce_a_load_0_avm_address => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_address,
        out_memcoalesce_a_load_0_avm_burstcount => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_burstcount,
        out_memcoalesce_a_load_0_avm_byteenable => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_byteenable,
        out_memcoalesce_a_load_0_avm_enable => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_enable,
        out_memcoalesce_a_load_0_avm_read => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_read,
        out_memcoalesce_a_load_0_avm_write => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_write,
        out_memcoalesce_a_load_0_avm_writedata => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_push_i1_throttle_push_vector_add(STALLENABLE,108)
    -- Valid signal propagation
    SE_out_i_acl_push_i1_throttle_push_vector_add_V0 <= SE_out_i_acl_push_i1_throttle_push_vector_add_wireValid;
    -- Backward Stall generation
    SE_out_i_acl_push_i1_throttle_push_vector_add_backStall <= in_stall_in or not (SE_out_i_acl_push_i1_throttle_push_vector_add_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_acl_push_i1_throttle_push_vector_add_wireValid <= i_acl_push_i1_throttle_push_vector_add_out_valid_out;

    -- c_i32_0gr(CONSTANT,36)
    c_i32_0gr_q <= "00000000000000000000000000000000";

    -- i_unnamed_vector_add18_vt_const_31(CONSTANT,53)
    i_unnamed_vector_add18_vt_const_31_q <= "0000000000000000000000000000000";

    -- c_i32_1gr(CONSTANT,37)
    c_i32_1gr_q <= "00000000000000000000000000000001";

    -- i_unnamed_vector_add18(LOGICAL,52)@21
    i_unnamed_vector_add18_q <= bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_o and c_i32_1gr_q;

    -- i_unnamed_vector_add18_vt_select_0(BITSELECT,55)@21
    i_unnamed_vector_add18_vt_select_0_b <= i_unnamed_vector_add18_q(0 downto 0);

    -- i_unnamed_vector_add18_vt_join(BITJOIN,54)@21
    i_unnamed_vector_add18_vt_join_q <= i_unnamed_vector_add18_vt_const_31_q & i_unnamed_vector_add18_vt_select_0_b;

    -- i_unnamed_vector_add19(LOGICAL,56)@21 + 1
    i_unnamed_vector_add19_qi <= "1" WHEN i_unnamed_vector_add18_vt_join_q /= c_i32_0gr_q ELSE "0";
    i_unnamed_vector_add19_delay : dspba_delay
    GENERIC MAP ( width => 1, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_vector_add19_qi, xout => i_unnamed_vector_add19_q, ena => SE_i_unnamed_vector_add19_backEN(0), clk => clock, aclr => resetn );

    -- bubble_join_i_store_memdep_vector_add_aunroll_x(BITJOIN,77)
    bubble_join_i_store_memdep_vector_add_aunroll_x_q <= i_store_memdep_vector_add_aunroll_x_out_o_writeack;

    -- bubble_select_i_store_memdep_vector_add_aunroll_x(BITSELECT,78)
    bubble_select_i_store_memdep_vector_add_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_store_memdep_vector_add_aunroll_x_q(0 downto 0));

    -- i_thr_dep1_vector_add(LOGICAL,51)@22
    i_thr_dep1_vector_add_q <= bubble_select_i_store_memdep_vector_add_aunroll_x_b or i_unnamed_vector_add19_q;

    -- i_acl_push_i1_throttle_push_vector_add(BLACKBOX,44)@22
    -- in in_stall_in@20000000
    -- out out_data_out@23
    -- out out_feedback_out_0@20000000
    -- out out_feedback_valid_out_0@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@23
    thei_acl_push_i1_throttle_push_vector_add : i_acl_push_i1_throttle_push_vector_add21
    PORT MAP (
        in_data_in => i_thr_dep1_vector_add_q,
        in_feedback_stall_in_0 => i_acl_pop_i1_throttle_pop_vector_add_out_feedback_stall_out_0,
        in_stall_in => SE_out_i_acl_push_i1_throttle_push_vector_add_backStall,
        in_valid_in => SE_out_i_store_memdep_vector_add_aunroll_x_V0,
        out_feedback_out_0 => i_acl_push_i1_throttle_push_vector_add_out_feedback_out_0,
        out_feedback_valid_out_0 => i_acl_push_i1_throttle_push_vector_add_out_feedback_valid_out_0,
        out_stall_out => i_acl_push_i1_throttle_push_vector_add_out_stall_out,
        out_valid_out => i_acl_push_i1_throttle_push_vector_add_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_i_unnamed_vector_add19(STALLENABLE,119)
    -- Valid signal propagation
    SE_i_unnamed_vector_add19_V0 <= SE_i_unnamed_vector_add19_R_v_0;
    -- Stall signal propagation
    SE_i_unnamed_vector_add19_s_tv_0 <= SE_out_i_store_memdep_vector_add_aunroll_x_backStall and SE_i_unnamed_vector_add19_R_v_0;
    -- Backward Enable generation
    SE_i_unnamed_vector_add19_backEN <= not (SE_i_unnamed_vector_add19_s_tv_0);
    -- Determine whether to write valid data into the first register stage
    SE_i_unnamed_vector_add19_v_s_0 <= SE_i_unnamed_vector_add19_backEN and SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_V1;
    -- Backward Stall generation
    SE_i_unnamed_vector_add19_backStall <= not (SE_i_unnamed_vector_add19_v_s_0);
    SE_i_unnamed_vector_add19_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_i_unnamed_vector_add19_R_v_0 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (SE_i_unnamed_vector_add19_backEN = "0") THEN
                SE_i_unnamed_vector_add19_R_v_0 <= SE_i_unnamed_vector_add19_R_v_0 and SE_i_unnamed_vector_add19_s_tv_0;
            ELSE
                SE_i_unnamed_vector_add19_R_v_0 <= SE_i_unnamed_vector_add19_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- SE_out_i_store_memdep_vector_add_aunroll_x(STALLENABLE,104)
    -- Valid signal propagation
    SE_out_i_store_memdep_vector_add_aunroll_x_V0 <= SE_out_i_store_memdep_vector_add_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_store_memdep_vector_add_aunroll_x_backStall <= i_acl_push_i1_throttle_push_vector_add_out_stall_out or not (SE_out_i_store_memdep_vector_add_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_store_memdep_vector_add_aunroll_x_and0 <= i_store_memdep_vector_add_aunroll_x_out_o_valid;
    SE_out_i_store_memdep_vector_add_aunroll_x_wireValid <= SE_i_unnamed_vector_add19_V0 and SE_out_i_store_memdep_vector_add_aunroll_x_and0;

    -- bubble_join_i_syncbuf_c_sync_buffer_vector_add(BITJOIN,90)
    bubble_join_i_syncbuf_c_sync_buffer_vector_add_q <= i_syncbuf_c_sync_buffer_vector_add_out_buffer_out;

    -- bubble_select_i_syncbuf_c_sync_buffer_vector_add(BITSELECT,91)
    bubble_select_i_syncbuf_c_sync_buffer_vector_add_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_c_sync_buffer_vector_add_q(63 downto 0));

    -- bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x(BITJOIN,71)
    bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q <= i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_12 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_11 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_10 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_9 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_8 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_7 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_6 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_5 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_4 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x(BITSELECT,72)
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(31 downto 0));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(63 downto 32));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(95 downto 64));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(127 downto 96));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(159 downto 128));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(191 downto 160));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(223 downto 192));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(255 downto 224));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(287 downto 256));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(319 downto 288));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(383 downto 320));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(447 downto 384));
    bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_q(511 downto 448));

    -- bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x(BITJOIN,68)
    bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q <= i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_12 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_11 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_10 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_9 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_8 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_7 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_6 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_5 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_4 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_3 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_2 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_1 & i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_readdata_0;

    -- bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x(BITSELECT,69)
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(31 downto 0));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(63 downto 32));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(95 downto 64));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(127 downto 96));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(159 downto 128));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(191 downto 160));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(223 downto 192));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(255 downto 224));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(287 downto 256));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(319 downto 288));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(383 downto 320));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(447 downto 384));
    bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_q(511 downto 448));

    -- i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x(BLACKBOX,32)@4
    -- in in_i_stall@20000000
    -- out out_c0_exit_0@21
    -- out out_c0_exit_1@21
    -- out out_c0_exit_2@21
    -- out out_c0_exit_3@21
    -- out out_c0_exit_4@21
    -- out out_c0_exit_5@21
    -- out out_c0_exit_6@21
    -- out out_c0_exit_7@21
    -- out out_c0_exit_8@21
    -- out out_c0_exit_9@21
    -- out out_c0_exit_10@21
    -- out out_c0_exit_11@21
    -- out out_c0_exit_12@21
    -- out out_c0_exit_13@21
    -- out out_c0_exit_14@21
    -- out out_o_stall@20000000
    -- out out_o_valid@21
    thei_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x : i_sfc_c0_entry_vector_add_c0_enter_vector_add
    PORT MAP (
        in_c0_eni2_0 => GND_q,
        in_c0_eni2_1 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_b,
        in_c0_eni2_2 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_c,
        in_c0_eni2_3 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_d,
        in_c0_eni2_4 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_e,
        in_c0_eni2_5 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_f,
        in_c0_eni2_6 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_g,
        in_c0_eni2_7 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_h,
        in_c0_eni2_8 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_i,
        in_c0_eni2_9 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_j,
        in_c0_eni2_10 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_k,
        in_c0_eni2_11 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_l,
        in_c0_eni2_12 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_m,
        in_c0_eni2_13 => bubble_select_i_load_memcoalesce_a_load_0_vector_add_aunroll_x_n,
        in_c0_eni2_14 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_b,
        in_c0_eni2_15 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_c,
        in_c0_eni2_16 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_d,
        in_c0_eni2_17 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_e,
        in_c0_eni2_18 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_f,
        in_c0_eni2_19 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_g,
        in_c0_eni2_20 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_h,
        in_c0_eni2_21 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_i,
        in_c0_eni2_22 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_j,
        in_c0_eni2_23 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_k,
        in_c0_eni2_24 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_l,
        in_c0_eni2_25 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_m,
        in_c0_eni2_26 => bubble_select_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_n,
        in_i_stall => SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_backStall,
        in_i_valid => SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_V0,
        out_c0_exit_1 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_1,
        out_c0_exit_2 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_2,
        out_c0_exit_3 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_3,
        out_c0_exit_4 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_4,
        out_c0_exit_5 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_5,
        out_c0_exit_6 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_6,
        out_c0_exit_7 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_7,
        out_c0_exit_8 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_8,
        out_c0_exit_9 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_9,
        out_c0_exit_10 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_10,
        out_c0_exit_11 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_11,
        out_c0_exit_12 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_12,
        out_c0_exit_13 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_13,
        out_c0_exit_14 => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_14,
        out_o_stall => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_o_stall,
        out_o_valid => i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x(BITJOIN,74)
    bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q <= i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_14 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_13 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_12 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_11 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_10 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_9 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_8 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_7 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_6 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_5 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_4 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_3 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_2 & i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_c0_exit_1;

    -- bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x(BITSELECT,75)
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_b <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(31 downto 0));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_c <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(63 downto 32));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_d <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(95 downto 64));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_e <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(127 downto 96));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_f <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(159 downto 128));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_g <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(191 downto 160));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_h <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(223 downto 192));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_i <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(255 downto 224));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_j <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(287 downto 256));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_k <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(319 downto 288));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_l <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(383 downto 320));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_m <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(447 downto 384));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_n <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(511 downto 448));
    bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_o <= STD_LOGIC_VECTOR(bubble_join_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_q(543 downto 512));

    -- i_store_memdep_vector_add_aunroll_x(BLACKBOX,33)@21
    -- in in_i_stall@20000000
    -- out out_lsu_memdep_o_active@20000000
    -- out out_memdep_avm_address@20000000
    -- out out_memdep_avm_burstcount@20000000
    -- out out_memdep_avm_byteenable@20000000
    -- out out_memdep_avm_enable@20000000
    -- out out_memdep_avm_read@20000000
    -- out out_memdep_avm_write@20000000
    -- out out_memdep_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@22
    -- out out_o_writeack@22
    thei_store_memdep_vector_add_aunroll_x : i_store_memdep_vector_add16
    PORT MAP (
        in_i_writedata_0 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_b,
        in_i_writedata_1 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_c,
        in_i_writedata_2 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_d,
        in_i_writedata_3 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_e,
        in_i_writedata_4 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_f,
        in_i_writedata_5 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_g,
        in_i_writedata_6 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_h,
        in_i_writedata_7 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_i,
        in_i_writedata_8 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_j,
        in_i_writedata_9 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_k,
        in_i_writedata_10 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_l,
        in_i_writedata_11 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_m,
        in_i_writedata_12 => bubble_select_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_n,
        in_flush => in_flush,
        in_i_address => bubble_select_i_syncbuf_c_sync_buffer_vector_add_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_store_memdep_vector_add_aunroll_x_backStall,
        in_i_valid => SE_out_i_syncbuf_c_sync_buffer_vector_add_V0,
        in_memdep_avm_readdata => in_memdep_avm_readdata,
        in_memdep_avm_readdatavalid => in_memdep_avm_readdatavalid,
        in_memdep_avm_waitrequest => in_memdep_avm_waitrequest,
        in_memdep_avm_writeack => in_memdep_avm_writeack,
        out_lsu_memdep_o_active => i_store_memdep_vector_add_aunroll_x_out_lsu_memdep_o_active,
        out_memdep_avm_address => i_store_memdep_vector_add_aunroll_x_out_memdep_avm_address,
        out_memdep_avm_burstcount => i_store_memdep_vector_add_aunroll_x_out_memdep_avm_burstcount,
        out_memdep_avm_byteenable => i_store_memdep_vector_add_aunroll_x_out_memdep_avm_byteenable,
        out_memdep_avm_enable => i_store_memdep_vector_add_aunroll_x_out_memdep_avm_enable,
        out_memdep_avm_read => i_store_memdep_vector_add_aunroll_x_out_memdep_avm_read,
        out_memdep_avm_write => i_store_memdep_vector_add_aunroll_x_out_memdep_avm_write,
        out_memdep_avm_writedata => i_store_memdep_vector_add_aunroll_x_out_memdep_avm_writedata,
        out_o_stall => i_store_memdep_vector_add_aunroll_x_out_o_stall,
        out_o_valid => i_store_memdep_vector_add_aunroll_x_out_o_valid,
        out_o_writeack => i_store_memdep_vector_add_aunroll_x_out_o_writeack,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x(STALLENABLE,102)
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_fromReg0 <= (others => '0');
            SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_fromReg0 <= SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_toReg0;
            -- Succesor 1
            SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_fromReg1 <= SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_consumed0 <= (not (SE_out_i_syncbuf_c_sync_buffer_vector_add_backStall) and SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_wireValid) or SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_fromReg0;
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_consumed1 <= (not (SE_i_unnamed_vector_add19_backStall) and SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_wireValid) or SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_fromReg1;
    -- Consuming
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_StallValid <= SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_backStall and SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_wireValid;
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_toReg0 <= SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_StallValid and SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_consumed0;
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_toReg1 <= SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_StallValid and SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_consumed1;
    -- Backward Stall generation
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_or0 <= SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_consumed0;
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_wireStall <= not (SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_consumed1 and SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_or0);
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_backStall <= SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_wireStall;
    -- Valid signal propagation
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_V0 <= SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_wireValid and not (SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_fromReg0);
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_V1 <= SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_wireValid and not (SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_wireValid <= i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_o_valid;

    -- SE_out_i_syncbuf_c_sync_buffer_vector_add(STALLENABLE,114)
    -- Valid signal propagation
    SE_out_i_syncbuf_c_sync_buffer_vector_add_V0 <= SE_out_i_syncbuf_c_sync_buffer_vector_add_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_c_sync_buffer_vector_add_backStall <= i_store_memdep_vector_add_aunroll_x_out_o_stall or not (SE_out_i_syncbuf_c_sync_buffer_vector_add_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_c_sync_buffer_vector_add_and0 <= i_syncbuf_c_sync_buffer_vector_add_out_valid_out;
    SE_out_i_syncbuf_c_sync_buffer_vector_add_wireValid <= SE_out_i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_V0 and SE_out_i_syncbuf_c_sync_buffer_vector_add_and0;

    -- i_syncbuf_c_sync_buffer_vector_add(BLACKBOX,50)@21
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_c_sync_buffer_vector_add : i_syncbuf_c_sync_buffer_vector_add6
    PORT MAP (
        in_buffer_in => in_c,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_c_sync_buffer_vector_add_backStall,
        in_valid_in => SE_out_bubble_out_vector_add_B0_merge_reg_4_V0,
        out_buffer_out => i_syncbuf_c_sync_buffer_vector_add_out_buffer_out,
        out_stall_out => i_syncbuf_c_sync_buffer_vector_add_out_stall_out,
        out_valid_out => i_syncbuf_c_sync_buffer_vector_add_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_bubble_out_vector_add_B0_merge_reg_4(STALLENABLE,167)
    -- Valid signal propagation
    SE_out_bubble_out_vector_add_B0_merge_reg_4_V0 <= SE_out_bubble_out_vector_add_B0_merge_reg_4_wireValid;
    -- Backward Stall generation
    SE_out_bubble_out_vector_add_B0_merge_reg_4_backStall <= i_syncbuf_c_sync_buffer_vector_add_out_stall_out or not (SE_out_bubble_out_vector_add_B0_merge_reg_4_wireValid);
    -- Computing multiple Valid(s)
    SE_out_bubble_out_vector_add_B0_merge_reg_4_wireValid <= bubble_out_vector_add_B0_merge_reg_4_reg_valid_out;

    -- bubble_out_vector_add_B0_merge_reg_4_reg(STALLFIFO,170)
    bubble_out_vector_add_B0_merge_reg_4_reg_valid_in <= SE_out_vector_add_B0_merge_reg_V2;
    bubble_out_vector_add_B0_merge_reg_4_reg_stall_in <= SE_out_bubble_out_vector_add_B0_merge_reg_4_backStall;
    bubble_out_vector_add_B0_merge_reg_4_reg_valid_in_bitsignaltemp <= bubble_out_vector_add_B0_merge_reg_4_reg_valid_in(0);
    bubble_out_vector_add_B0_merge_reg_4_reg_stall_in_bitsignaltemp <= bubble_out_vector_add_B0_merge_reg_4_reg_stall_in(0);
    bubble_out_vector_add_B0_merge_reg_4_reg_valid_out(0) <= bubble_out_vector_add_B0_merge_reg_4_reg_valid_out_bitsignaltemp;
    bubble_out_vector_add_B0_merge_reg_4_reg_stall_out(0) <= bubble_out_vector_add_B0_merge_reg_4_reg_stall_out_bitsignaltemp;
    thebubble_out_vector_add_B0_merge_reg_4_reg : acl_valid_fifo_counter
    GENERIC MAP (
        DEPTH => 21,
        STRICT_DEPTH => 0,
        ALLOW_FULL_WRITE => 0,
        ASYNC_RESET => 1
    )
    PORT MAP (
        valid_in => bubble_out_vector_add_B0_merge_reg_4_reg_valid_in_bitsignaltemp,
        stall_in => bubble_out_vector_add_B0_merge_reg_4_reg_stall_in_bitsignaltemp,
        valid_out => bubble_out_vector_add_B0_merge_reg_4_reg_valid_out_bitsignaltemp,
        stall_out => bubble_out_vector_add_B0_merge_reg_4_reg_stall_out_bitsignaltemp,
        clock => clock,
        resetn => resetn
    );

    -- SE_stall_entry(STALLENABLE,120)
    -- Valid signal propagation
    SE_stall_entry_V0 <= SE_stall_entry_wireValid;
    -- Backward Stall generation
    SE_stall_entry_backStall <= vector_add_B0_merge_reg_out_stall_out or not (SE_stall_entry_wireValid);
    -- Computing multiple Valid(s)
    SE_stall_entry_wireValid <= in_valid_in;

    -- vector_add_B0_merge_reg(BLACKBOX,66)@0
    -- in in_stall_in@20000000
    -- out out_data_out@1
    -- out out_stall_out@20000000
    -- out out_valid_out@1
    thevector_add_B0_merge_reg : vector_add_B0_merge_reg
    PORT MAP (
        in_data_in => GND_q,
        in_stall_in => SE_out_vector_add_B0_merge_reg_backStall,
        in_valid_in => SE_stall_entry_V0,
        out_stall_out => vector_add_B0_merge_reg_out_stall_out,
        out_valid_out => vector_add_B0_merge_reg_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_vector_add_B0_merge_reg(STALLENABLE,123)
    SE_out_vector_add_B0_merge_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_vector_add_B0_merge_reg_fromReg0 <= (others => '0');
            SE_out_vector_add_B0_merge_reg_fromReg1 <= (others => '0');
            SE_out_vector_add_B0_merge_reg_fromReg2 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_vector_add_B0_merge_reg_fromReg0 <= SE_out_vector_add_B0_merge_reg_toReg0;
            -- Succesor 1
            SE_out_vector_add_B0_merge_reg_fromReg1 <= SE_out_vector_add_B0_merge_reg_toReg1;
            -- Succesor 2
            SE_out_vector_add_B0_merge_reg_fromReg2 <= SE_out_vector_add_B0_merge_reg_toReg2;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_vector_add_B0_merge_reg_consumed0 <= (not (i_acl_pop_i1_throttle_pop_vector_add_out_stall_out) and SE_out_vector_add_B0_merge_reg_wireValid) or SE_out_vector_add_B0_merge_reg_fromReg0;
    SE_out_vector_add_B0_merge_reg_consumed1 <= (not (bubble_out_vector_add_B0_merge_reg_2_reg_backStall) and SE_out_vector_add_B0_merge_reg_wireValid) or SE_out_vector_add_B0_merge_reg_fromReg1;
    SE_out_vector_add_B0_merge_reg_consumed2 <= (not (bubble_out_vector_add_B0_merge_reg_4_reg_stall_out) and SE_out_vector_add_B0_merge_reg_wireValid) or SE_out_vector_add_B0_merge_reg_fromReg2;
    -- Consuming
    SE_out_vector_add_B0_merge_reg_StallValid <= SE_out_vector_add_B0_merge_reg_backStall and SE_out_vector_add_B0_merge_reg_wireValid;
    SE_out_vector_add_B0_merge_reg_toReg0 <= SE_out_vector_add_B0_merge_reg_StallValid and SE_out_vector_add_B0_merge_reg_consumed0;
    SE_out_vector_add_B0_merge_reg_toReg1 <= SE_out_vector_add_B0_merge_reg_StallValid and SE_out_vector_add_B0_merge_reg_consumed1;
    SE_out_vector_add_B0_merge_reg_toReg2 <= SE_out_vector_add_B0_merge_reg_StallValid and SE_out_vector_add_B0_merge_reg_consumed2;
    -- Backward Stall generation
    SE_out_vector_add_B0_merge_reg_or0 <= SE_out_vector_add_B0_merge_reg_consumed0;
    SE_out_vector_add_B0_merge_reg_or1 <= SE_out_vector_add_B0_merge_reg_consumed1 and SE_out_vector_add_B0_merge_reg_or0;
    SE_out_vector_add_B0_merge_reg_wireStall <= not (SE_out_vector_add_B0_merge_reg_consumed2 and SE_out_vector_add_B0_merge_reg_or1);
    SE_out_vector_add_B0_merge_reg_backStall <= SE_out_vector_add_B0_merge_reg_wireStall;
    -- Valid signal propagation
    SE_out_vector_add_B0_merge_reg_V0 <= SE_out_vector_add_B0_merge_reg_wireValid and not (SE_out_vector_add_B0_merge_reg_fromReg0);
    SE_out_vector_add_B0_merge_reg_V1 <= SE_out_vector_add_B0_merge_reg_wireValid and not (SE_out_vector_add_B0_merge_reg_fromReg1);
    SE_out_vector_add_B0_merge_reg_V2 <= SE_out_vector_add_B0_merge_reg_wireValid and not (SE_out_vector_add_B0_merge_reg_fromReg2);
    -- Computing multiple Valid(s)
    SE_out_vector_add_B0_merge_reg_wireValid <= vector_add_B0_merge_reg_out_valid_out;

    -- bubble_out_vector_add_B0_merge_reg_2_reg(STALLENABLE,168)
    -- Valid signal propagation
    bubble_out_vector_add_B0_merge_reg_2_reg_V0 <= bubble_out_vector_add_B0_merge_reg_2_reg_R_v_0;
    bubble_out_vector_add_B0_merge_reg_2_reg_V1 <= bubble_out_vector_add_B0_merge_reg_2_reg_R_v_1;
    -- Stall signal propagation
    bubble_out_vector_add_B0_merge_reg_2_reg_s_tv_0 <= i_syncbuf_a_sync_buffer_vector_add_out_stall_out and bubble_out_vector_add_B0_merge_reg_2_reg_R_v_0;
    bubble_out_vector_add_B0_merge_reg_2_reg_s_tv_1 <= i_syncbuf_b_sync_buffer_vector_add_out_stall_out and bubble_out_vector_add_B0_merge_reg_2_reg_R_v_1;
    -- Backward Enable generation
    bubble_out_vector_add_B0_merge_reg_2_reg_or0 <= bubble_out_vector_add_B0_merge_reg_2_reg_s_tv_0;
    bubble_out_vector_add_B0_merge_reg_2_reg_backEN <= not (bubble_out_vector_add_B0_merge_reg_2_reg_s_tv_1 or bubble_out_vector_add_B0_merge_reg_2_reg_or0);
    -- Determine whether to write valid data into the first register stage
    bubble_out_vector_add_B0_merge_reg_2_reg_v_s_0 <= bubble_out_vector_add_B0_merge_reg_2_reg_backEN and SE_out_vector_add_B0_merge_reg_V1;
    -- Backward Stall generation
    bubble_out_vector_add_B0_merge_reg_2_reg_backStall <= not (bubble_out_vector_add_B0_merge_reg_2_reg_v_s_0);
    bubble_out_vector_add_B0_merge_reg_2_reg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            bubble_out_vector_add_B0_merge_reg_2_reg_R_v_0 <= (others => '0');
            bubble_out_vector_add_B0_merge_reg_2_reg_R_v_1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (bubble_out_vector_add_B0_merge_reg_2_reg_backEN = "0") THEN
                bubble_out_vector_add_B0_merge_reg_2_reg_R_v_0 <= bubble_out_vector_add_B0_merge_reg_2_reg_R_v_0 and bubble_out_vector_add_B0_merge_reg_2_reg_s_tv_0;
            ELSE
                bubble_out_vector_add_B0_merge_reg_2_reg_R_v_0 <= bubble_out_vector_add_B0_merge_reg_2_reg_v_s_0;
            END IF;

            IF (bubble_out_vector_add_B0_merge_reg_2_reg_backEN = "0") THEN
                bubble_out_vector_add_B0_merge_reg_2_reg_R_v_1 <= bubble_out_vector_add_B0_merge_reg_2_reg_R_v_1 and bubble_out_vector_add_B0_merge_reg_2_reg_s_tv_1;
            ELSE
                bubble_out_vector_add_B0_merge_reg_2_reg_R_v_1 <= bubble_out_vector_add_B0_merge_reg_2_reg_v_s_0;
            END IF;

        END IF;
    END PROCESS;

    -- i_syncbuf_a_sync_buffer_vector_add(BLACKBOX,48)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_a_sync_buffer_vector_add : i_syncbuf_a_sync_buffer_vector_add2
    PORT MAP (
        in_buffer_in => in_a,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_a_sync_buffer_vector_add_backStall,
        in_valid_in => bubble_out_vector_add_B0_merge_reg_2_reg_V0,
        out_buffer_out => i_syncbuf_a_sync_buffer_vector_add_out_buffer_out,
        out_stall_out => i_syncbuf_a_sync_buffer_vector_add_out_stall_out,
        out_valid_out => i_syncbuf_a_sync_buffer_vector_add_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_a_sync_buffer_vector_add(STALLENABLE,110)
    -- Valid signal propagation
    SE_out_i_syncbuf_a_sync_buffer_vector_add_V0 <= SE_out_i_syncbuf_a_sync_buffer_vector_add_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_a_sync_buffer_vector_add_backStall <= i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_stall or not (SE_out_i_syncbuf_a_sync_buffer_vector_add_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_a_sync_buffer_vector_add_and0 <= i_syncbuf_a_sync_buffer_vector_add_out_valid_out;
    SE_out_i_syncbuf_a_sync_buffer_vector_add_wireValid <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_V0 and SE_out_i_syncbuf_a_sync_buffer_vector_add_and0;

    -- i_acl_pop_i1_throttle_pop_vector_add(BLACKBOX,43)@1
    -- in in_stall_in@20000000
    -- out out_data_out@2
    -- out out_feedback_stall_out_0@20000000
    -- out out_stall_out@20000000
    -- out out_valid_out@2
    thei_acl_pop_i1_throttle_pop_vector_add : i_acl_pop_i1_throttle_pop_vector_add0
    PORT MAP (
        in_data_in => GND_q,
        in_dir => GND_q,
        in_feedback_in_0 => i_acl_push_i1_throttle_push_vector_add_out_feedback_out_0,
        in_feedback_valid_in_0 => i_acl_push_i1_throttle_push_vector_add_out_feedback_valid_out_0,
        in_predicate => GND_q,
        in_stall_in => SE_out_i_acl_pop_i1_throttle_pop_vector_add_backStall,
        in_valid_in => SE_out_vector_add_B0_merge_reg_V0,
        out_data_out => i_acl_pop_i1_throttle_pop_vector_add_out_data_out,
        out_feedback_stall_out_0 => i_acl_pop_i1_throttle_pop_vector_add_out_feedback_stall_out_0,
        out_stall_out => i_acl_pop_i1_throttle_pop_vector_add_out_stall_out,
        out_valid_out => i_acl_pop_i1_throttle_pop_vector_add_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_acl_pop_i1_throttle_pop_vector_add(STALLENABLE,106)
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            SE_out_i_acl_pop_i1_throttle_pop_vector_add_fromReg0 <= (others => '0');
            SE_out_i_acl_pop_i1_throttle_pop_vector_add_fromReg1 <= (others => '0');
        ELSIF (clock'EVENT AND clock = '1') THEN
            -- Succesor 0
            SE_out_i_acl_pop_i1_throttle_pop_vector_add_fromReg0 <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_toReg0;
            -- Succesor 1
            SE_out_i_acl_pop_i1_throttle_pop_vector_add_fromReg1 <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_toReg1;
        END IF;
    END PROCESS;
    -- Input Stall processing
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_consumed0 <= (not (SE_out_i_syncbuf_a_sync_buffer_vector_add_backStall) and SE_out_i_acl_pop_i1_throttle_pop_vector_add_wireValid) or SE_out_i_acl_pop_i1_throttle_pop_vector_add_fromReg0;
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_consumed1 <= (not (SE_out_i_syncbuf_b_sync_buffer_vector_add_backStall) and SE_out_i_acl_pop_i1_throttle_pop_vector_add_wireValid) or SE_out_i_acl_pop_i1_throttle_pop_vector_add_fromReg1;
    -- Consuming
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_StallValid <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_backStall and SE_out_i_acl_pop_i1_throttle_pop_vector_add_wireValid;
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_toReg0 <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_StallValid and SE_out_i_acl_pop_i1_throttle_pop_vector_add_consumed0;
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_toReg1 <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_StallValid and SE_out_i_acl_pop_i1_throttle_pop_vector_add_consumed1;
    -- Backward Stall generation
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_or0 <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_consumed0;
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_wireStall <= not (SE_out_i_acl_pop_i1_throttle_pop_vector_add_consumed1 and SE_out_i_acl_pop_i1_throttle_pop_vector_add_or0);
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_backStall <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_wireStall;
    -- Valid signal propagation
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_V0 <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_wireValid and not (SE_out_i_acl_pop_i1_throttle_pop_vector_add_fromReg0);
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_V1 <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_wireValid and not (SE_out_i_acl_pop_i1_throttle_pop_vector_add_fromReg1);
    -- Computing multiple Valid(s)
    SE_out_i_acl_pop_i1_throttle_pop_vector_add_wireValid <= i_acl_pop_i1_throttle_pop_vector_add_out_valid_out;

    -- i_syncbuf_b_sync_buffer_vector_add(BLACKBOX,49)@2
    -- in in_stall_in@20000000
    -- out out_stall_out@20000000
    thei_syncbuf_b_sync_buffer_vector_add : i_syncbuf_b_sync_buffer_vector_add4
    PORT MAP (
        in_buffer_in => in_b,
        in_i_dependence => GND_q,
        in_stall_in => SE_out_i_syncbuf_b_sync_buffer_vector_add_backStall,
        in_valid_in => bubble_out_vector_add_B0_merge_reg_2_reg_V1,
        out_buffer_out => i_syncbuf_b_sync_buffer_vector_add_out_buffer_out,
        out_stall_out => i_syncbuf_b_sync_buffer_vector_add_out_stall_out,
        out_valid_out => i_syncbuf_b_sync_buffer_vector_add_out_valid_out,
        clock => clock,
        resetn => resetn
    );

    -- SE_out_i_syncbuf_b_sync_buffer_vector_add(STALLENABLE,112)
    -- Valid signal propagation
    SE_out_i_syncbuf_b_sync_buffer_vector_add_V0 <= SE_out_i_syncbuf_b_sync_buffer_vector_add_wireValid;
    -- Backward Stall generation
    SE_out_i_syncbuf_b_sync_buffer_vector_add_backStall <= i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_stall or not (SE_out_i_syncbuf_b_sync_buffer_vector_add_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_syncbuf_b_sync_buffer_vector_add_and0 <= i_syncbuf_b_sync_buffer_vector_add_out_valid_out;
    SE_out_i_syncbuf_b_sync_buffer_vector_add_wireValid <= SE_out_i_acl_pop_i1_throttle_pop_vector_add_V1 and SE_out_i_syncbuf_b_sync_buffer_vector_add_and0;

    -- SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x(STALLENABLE,100)
    -- Valid signal propagation
    SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_V0 <= SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_wireValid;
    -- Backward Stall generation
    SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_backStall <= i_sfc_c0_entry_vector_add_c0_enter_vector_add_aunroll_x_out_o_stall or not (SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_wireValid);
    -- Computing multiple Valid(s)
    SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_and0 <= i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_valid;
    SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_wireValid <= i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_o_valid and SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_and0;

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- bubble_join_i_acl_pop_i1_throttle_pop_vector_add(BITJOIN,80)
    bubble_join_i_acl_pop_i1_throttle_pop_vector_add_q <= i_acl_pop_i1_throttle_pop_vector_add_out_data_out;

    -- bubble_select_i_acl_pop_i1_throttle_pop_vector_add(BITSELECT,81)
    bubble_select_i_acl_pop_i1_throttle_pop_vector_add_b <= STD_LOGIC_VECTOR(bubble_join_i_acl_pop_i1_throttle_pop_vector_add_q(0 downto 0));

    -- bubble_join_i_syncbuf_b_sync_buffer_vector_add(BITJOIN,87)
    bubble_join_i_syncbuf_b_sync_buffer_vector_add_q <= i_syncbuf_b_sync_buffer_vector_add_out_buffer_out;

    -- bubble_select_i_syncbuf_b_sync_buffer_vector_add(BITSELECT,88)
    bubble_select_i_syncbuf_b_sync_buffer_vector_add_b <= STD_LOGIC_VECTOR(bubble_join_i_syncbuf_b_sync_buffer_vector_add_q(63 downto 0));

    -- i_load_memcoalesce_b_load_0_vector_add_aunroll_x(BLACKBOX,31)@2
    -- in in_i_stall@20000000
    -- out out_o_readdata_0@4
    -- out out_o_readdata_1@4
    -- out out_o_readdata_2@4
    -- out out_o_readdata_3@4
    -- out out_o_readdata_4@4
    -- out out_o_readdata_5@4
    -- out out_o_readdata_6@4
    -- out out_o_readdata_7@4
    -- out out_o_readdata_8@4
    -- out out_o_readdata_9@4
    -- out out_o_readdata_10@4
    -- out out_o_readdata_11@4
    -- out out_o_readdata_12@4
    -- out out_memcoalesce_b_load_0_avm_address@20000000
    -- out out_memcoalesce_b_load_0_avm_burstcount@20000000
    -- out out_memcoalesce_b_load_0_avm_byteenable@20000000
    -- out out_memcoalesce_b_load_0_avm_enable@20000000
    -- out out_memcoalesce_b_load_0_avm_read@20000000
    -- out out_memcoalesce_b_load_0_avm_write@20000000
    -- out out_memcoalesce_b_load_0_avm_writedata@20000000
    -- out out_o_stall@20000000
    -- out out_o_valid@4
    thei_load_memcoalesce_b_load_0_vector_add_aunroll_x : i_load_memcoalesce_b_load_0_vector_add10
    PORT MAP (
        in_flush => in_flush,
        in_i_address => bubble_select_i_syncbuf_b_sync_buffer_vector_add_b,
        in_i_dependence => bubble_select_i_acl_pop_i1_throttle_pop_vector_add_b,
        in_i_predicate => GND_q,
        in_i_stall => SE_out_i_load_memcoalesce_b_load_0_vector_add_aunroll_x_backStall,
        in_i_valid => SE_out_i_syncbuf_b_sync_buffer_vector_add_V0,
        in_memcoalesce_b_load_0_avm_readdata => in_memcoalesce_b_load_0_avm_readdata,
        in_memcoalesce_b_load_0_avm_readdatavalid => in_memcoalesce_b_load_0_avm_readdatavalid,
        in_memcoalesce_b_load_0_avm_waitrequest => in_memcoalesce_b_load_0_avm_waitrequest,
        in_memcoalesce_b_load_0_avm_writeack => in_memcoalesce_b_load_0_avm_writeack,
        out_o_readdata_0 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_0,
        out_o_readdata_1 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_1,
        out_o_readdata_2 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_2,
        out_o_readdata_3 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_3,
        out_o_readdata_4 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_4,
        out_o_readdata_5 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_5,
        out_o_readdata_6 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_6,
        out_o_readdata_7 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_7,
        out_o_readdata_8 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_8,
        out_o_readdata_9 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_9,
        out_o_readdata_10 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_10,
        out_o_readdata_11 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_11,
        out_o_readdata_12 => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_readdata_12,
        out_memcoalesce_b_load_0_avm_address => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_address,
        out_memcoalesce_b_load_0_avm_burstcount => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_burstcount,
        out_memcoalesce_b_load_0_avm_byteenable => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_byteenable,
        out_memcoalesce_b_load_0_avm_enable => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_enable,
        out_memcoalesce_b_load_0_avm_read => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_read,
        out_memcoalesce_b_load_0_avm_write => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_write,
        out_memcoalesce_b_load_0_avm_writedata => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_writedata,
        out_o_stall => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_stall,
        out_o_valid => i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_o_valid,
        clock => clock,
        resetn => resetn
    );

    -- dupName_0_ext_sig_sync_out_x(GPOUT,3)
    out_memcoalesce_b_load_0_avm_address <= i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_address;
    out_memcoalesce_b_load_0_avm_enable <= i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_enable;
    out_memcoalesce_b_load_0_avm_read <= i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_read;
    out_memcoalesce_b_load_0_avm_write <= i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_write;
    out_memcoalesce_b_load_0_avm_writedata <= i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_writedata;
    out_memcoalesce_b_load_0_avm_byteenable <= i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_byteenable;
    out_memcoalesce_b_load_0_avm_burstcount <= i_load_memcoalesce_b_load_0_vector_add_aunroll_x_out_memcoalesce_b_load_0_avm_burstcount;

    -- dupName_0_sync_out_x(GPOUT,8)@23
    out_valid_out <= SE_out_i_acl_push_i1_throttle_push_vector_add_V0;

    -- dupName_1_ext_sig_sync_out_x(GPOUT,10)
    out_memdep_avm_address <= i_store_memdep_vector_add_aunroll_x_out_memdep_avm_address;
    out_memdep_avm_enable <= i_store_memdep_vector_add_aunroll_x_out_memdep_avm_enable;
    out_memdep_avm_read <= i_store_memdep_vector_add_aunroll_x_out_memdep_avm_read;
    out_memdep_avm_write <= i_store_memdep_vector_add_aunroll_x_out_memdep_avm_write;
    out_memdep_avm_writedata <= i_store_memdep_vector_add_aunroll_x_out_memdep_avm_writedata;
    out_memdep_avm_byteenable <= i_store_memdep_vector_add_aunroll_x_out_memdep_avm_byteenable;
    out_memdep_avm_burstcount <= i_store_memdep_vector_add_aunroll_x_out_memdep_avm_burstcount;

    -- dupName_2_ext_sig_sync_out_x(GPOUT,14)
    out_lsu_memdep_o_active <= i_store_memdep_vector_add_aunroll_x_out_lsu_memdep_o_active;

    -- ext_sig_sync_out(GPOUT,42)
    out_memcoalesce_a_load_0_avm_address <= i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_address;
    out_memcoalesce_a_load_0_avm_enable <= i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_enable;
    out_memcoalesce_a_load_0_avm_read <= i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_read;
    out_memcoalesce_a_load_0_avm_write <= i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_write;
    out_memcoalesce_a_load_0_avm_writedata <= i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_writedata;
    out_memcoalesce_a_load_0_avm_byteenable <= i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_byteenable;
    out_memcoalesce_a_load_0_avm_burstcount <= i_load_memcoalesce_a_load_0_vector_add_aunroll_x_out_memcoalesce_a_load_0_avm_burstcount;

    -- sync_out(GPOUT,65)@0
    out_stall_out <= SE_stall_entry_backStall;

END normal;
