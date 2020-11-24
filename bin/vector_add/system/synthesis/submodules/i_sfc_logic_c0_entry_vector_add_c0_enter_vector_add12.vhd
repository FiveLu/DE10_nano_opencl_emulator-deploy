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

-- VHDL created from i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12
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

entity i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12 is
    port (
        in_c0_eni2_0 : in std_logic_vector(0 downto 0);  -- ufix1
        in_c0_eni2_1 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_2 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_3 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_4 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_5 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_6 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_7 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_8 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_9 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_10 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_11 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni2_12 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni2_13 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni2_14 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_15 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_16 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_17 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_18 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_19 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_20 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_21 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_22 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_23 : in std_logic_vector(31 downto 0);  -- float32_m23
        in_c0_eni2_24 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni2_25 : in std_logic_vector(63 downto 0);  -- ufix64
        in_c0_eni2_26 : in std_logic_vector(63 downto 0);  -- ufix64
        in_i_valid : in std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi2_0 : out std_logic_vector(0 downto 0);  -- ufix1
        out_c0_exi2_1 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi2_2 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi2_3 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi2_4 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi2_5 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi2_6 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi2_7 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi2_8 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi2_9 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi2_10 : out std_logic_vector(31 downto 0);  -- float32_m23
        out_c0_exi2_11 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi2_12 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi2_13 : out std_logic_vector(63 downto 0);  -- ufix64
        out_c0_exi2_14 : out std_logic_vector(31 downto 0);  -- ufix32
        out_o_valid : out std_logic_vector(0 downto 0);  -- ufix1
        clock : in std_logic;
        resetn : in std_logic
    );
end i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12;

architecture normal of i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12 is

    attribute altera_attribute : string;
    attribute altera_attribute of normal : architecture is "-name AUTO_SHIFT_REGISTER_RECOGNITION OFF; -name PHYSICAL_SYNTHESIS_REGISTER_DUPLICATION ON; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 10037; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 15400; -name MESSAGE_DISABLE 14130; -name MESSAGE_DISABLE 10036; -name MESSAGE_DISABLE 12020; -name MESSAGE_DISABLE 12030; -name MESSAGE_DISABLE 12010; -name MESSAGE_DISABLE 12110; -name MESSAGE_DISABLE 14320; -name MESSAGE_DISABLE 13410; -name MESSAGE_DISABLE 113007";
    
    component floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0 is
        port (
            in_0 : in std_logic_vector(31 downto 0);  -- Floating Point
            in_1 : in std_logic_vector(31 downto 0);  -- Floating Point
            out_primWireOut : out std_logic_vector(31 downto 0);  -- Floating Point
            clock : in std_logic;
            resetn : in std_logic
        );
    end component;











    signal GND_q : STD_LOGIC_VECTOR (0 downto 0);
    signal VCC_q : STD_LOGIC_VECTOR (0 downto 0);
    signal c_i64_0gr_q : STD_LOGIC_VECTOR (63 downto 0);
    signal i_add_1_vector_add_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_2_vector_add_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_3_vector_add_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_4_vector_add_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_5_vector_add_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_6_vector_add_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_7_vector_add_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_8_vector_add_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_9_vector_add_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_add_vector_add_out_primWireOut : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_vector_add14_qi : STD_LOGIC_VECTOR (31 downto 0);
    signal i_unnamed_vector_add14_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist1_sync_in_aunroll_x_in_i_valid_14_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_mem_reset0 : std_logic;
    signal redist0_i_unnamed_vector_add14_q_14_mem_ia : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_mem_aa : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_mem_ab : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_mem_iq : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_mem_q : STD_LOGIC_VECTOR (31 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_rdcnt_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_rdcnt_i : UNSIGNED (3 downto 0);
    attribute preserve : boolean;
    attribute preserve of redist0_i_unnamed_vector_add14_q_14_rdcnt_i : signal is true;
    signal redist0_i_unnamed_vector_add14_q_14_rdcnt_eq : std_logic;
    attribute preserve of redist0_i_unnamed_vector_add14_q_14_rdcnt_eq : signal is true;
    signal redist0_i_unnamed_vector_add14_q_14_wraddr_q : STD_LOGIC_VECTOR (3 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_mem_last_q : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_cmp_b : STD_LOGIC_VECTOR (4 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_cmp_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_cmpReg_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_notEnable_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_nor_q : STD_LOGIC_VECTOR (0 downto 0);
    signal redist0_i_unnamed_vector_add14_q_14_sticky_ena_q : STD_LOGIC_VECTOR (0 downto 0);
    attribute dont_merge : boolean;
    attribute dont_merge of redist0_i_unnamed_vector_add14_q_14_sticky_ena_q : signal is true;
    signal redist0_i_unnamed_vector_add14_q_14_enaAnd_q : STD_LOGIC_VECTOR (0 downto 0);

begin


    -- VCC(CONSTANT,1)
    VCC_q <= "1";

    -- redist1_sync_in_aunroll_x_in_i_valid_14(DELAY,20)
    redist1_sync_in_aunroll_x_in_i_valid_14 : dspba_delay
    GENERIC MAP ( width => 1, depth => 14, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => in_i_valid, xout => redist1_sync_in_aunroll_x_in_i_valid_14_q, clk => clock, aclr => resetn );

    -- redist0_i_unnamed_vector_add14_q_14_notEnable(LOGICAL,27)
    redist0_i_unnamed_vector_add14_q_14_notEnable_q <= STD_LOGIC_VECTOR(not (VCC_q));

    -- redist0_i_unnamed_vector_add14_q_14_nor(LOGICAL,28)
    redist0_i_unnamed_vector_add14_q_14_nor_q <= not (redist0_i_unnamed_vector_add14_q_14_notEnable_q or redist0_i_unnamed_vector_add14_q_14_sticky_ena_q);

    -- redist0_i_unnamed_vector_add14_q_14_mem_last(CONSTANT,24)
    redist0_i_unnamed_vector_add14_q_14_mem_last_q <= "01010";

    -- redist0_i_unnamed_vector_add14_q_14_cmp(LOGICAL,25)
    redist0_i_unnamed_vector_add14_q_14_cmp_b <= STD_LOGIC_VECTOR("0" & redist0_i_unnamed_vector_add14_q_14_rdcnt_q);
    redist0_i_unnamed_vector_add14_q_14_cmp_q <= "1" WHEN redist0_i_unnamed_vector_add14_q_14_mem_last_q = redist0_i_unnamed_vector_add14_q_14_cmp_b ELSE "0";

    -- redist0_i_unnamed_vector_add14_q_14_cmpReg(REG,26)
    redist0_i_unnamed_vector_add14_q_14_cmpReg_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_unnamed_vector_add14_q_14_cmpReg_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_unnamed_vector_add14_q_14_cmpReg_q <= STD_LOGIC_VECTOR(redist0_i_unnamed_vector_add14_q_14_cmp_q);
        END IF;
    END PROCESS;

    -- redist0_i_unnamed_vector_add14_q_14_sticky_ena(REG,29)
    redist0_i_unnamed_vector_add14_q_14_sticky_ena_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_unnamed_vector_add14_q_14_sticky_ena_q <= "0";
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_unnamed_vector_add14_q_14_nor_q = "1") THEN
                redist0_i_unnamed_vector_add14_q_14_sticky_ena_q <= STD_LOGIC_VECTOR(redist0_i_unnamed_vector_add14_q_14_cmpReg_q);
            END IF;
        END IF;
    END PROCESS;

    -- redist0_i_unnamed_vector_add14_q_14_enaAnd(LOGICAL,30)
    redist0_i_unnamed_vector_add14_q_14_enaAnd_q <= redist0_i_unnamed_vector_add14_q_14_sticky_ena_q and VCC_q;

    -- redist0_i_unnamed_vector_add14_q_14_rdcnt(COUNTER,22)
    -- low=0, high=11, step=1, init=0
    redist0_i_unnamed_vector_add14_q_14_rdcnt_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_unnamed_vector_add14_q_14_rdcnt_i <= TO_UNSIGNED(0, 4);
            redist0_i_unnamed_vector_add14_q_14_rdcnt_eq <= '0';
        ELSIF (clock'EVENT AND clock = '1') THEN
            IF (redist0_i_unnamed_vector_add14_q_14_rdcnt_i = TO_UNSIGNED(10, 4)) THEN
                redist0_i_unnamed_vector_add14_q_14_rdcnt_eq <= '1';
            ELSE
                redist0_i_unnamed_vector_add14_q_14_rdcnt_eq <= '0';
            END IF;
            IF (redist0_i_unnamed_vector_add14_q_14_rdcnt_eq = '1') THEN
                redist0_i_unnamed_vector_add14_q_14_rdcnt_i <= redist0_i_unnamed_vector_add14_q_14_rdcnt_i + 5;
            ELSE
                redist0_i_unnamed_vector_add14_q_14_rdcnt_i <= redist0_i_unnamed_vector_add14_q_14_rdcnt_i + 1;
            END IF;
        END IF;
    END PROCESS;
    redist0_i_unnamed_vector_add14_q_14_rdcnt_q <= STD_LOGIC_VECTOR(STD_LOGIC_VECTOR(RESIZE(redist0_i_unnamed_vector_add14_q_14_rdcnt_i, 4)));

    -- i_unnamed_vector_add14(LOGICAL,18)@4 + 1
    i_unnamed_vector_add14_qi <= in_c0_eni2_1 or in_c0_eni2_14;
    i_unnamed_vector_add14_delay : dspba_delay
    GENERIC MAP ( width => 32, depth => 1, reset_kind => "ASYNC", reset_high => '0' )
    PORT MAP ( xin => i_unnamed_vector_add14_qi, xout => i_unnamed_vector_add14_q, clk => clock, aclr => resetn );

    -- redist0_i_unnamed_vector_add14_q_14_wraddr(REG,23)
    redist0_i_unnamed_vector_add14_q_14_wraddr_clkproc: PROCESS (clock, resetn)
    BEGIN
        IF (resetn = '0') THEN
            redist0_i_unnamed_vector_add14_q_14_wraddr_q <= "1011";
        ELSIF (clock'EVENT AND clock = '1') THEN
            redist0_i_unnamed_vector_add14_q_14_wraddr_q <= STD_LOGIC_VECTOR(redist0_i_unnamed_vector_add14_q_14_rdcnt_q);
        END IF;
    END PROCESS;

    -- redist0_i_unnamed_vector_add14_q_14_mem(DUALMEM,21)
    redist0_i_unnamed_vector_add14_q_14_mem_ia <= STD_LOGIC_VECTOR(i_unnamed_vector_add14_q);
    redist0_i_unnamed_vector_add14_q_14_mem_aa <= redist0_i_unnamed_vector_add14_q_14_wraddr_q;
    redist0_i_unnamed_vector_add14_q_14_mem_ab <= redist0_i_unnamed_vector_add14_q_14_rdcnt_q;
    redist0_i_unnamed_vector_add14_q_14_mem_reset0 <= not (resetn);
    redist0_i_unnamed_vector_add14_q_14_mem_dmem : altera_syncram
    GENERIC MAP (
        ram_block_type => "MLAB",
        operation_mode => "DUAL_PORT",
        width_a => 32,
        widthad_a => 4,
        numwords_a => 12,
        width_b => 32,
        widthad_b => 4,
        numwords_b => 12,
        lpm_type => "altera_syncram",
        width_byteena_a => 1,
        address_reg_b => "CLOCK0",
        indata_reg_b => "CLOCK0",
        rdcontrol_reg_b => "CLOCK0",
        byteena_reg_b => "CLOCK0",
        outdata_reg_b => "CLOCK1",
        outdata_aclr_b => "CLEAR1",
        clock_enable_input_a => "NORMAL",
        clock_enable_input_b => "NORMAL",
        clock_enable_output_b => "NORMAL",
        read_during_write_mode_mixed_ports => "DONT_CARE",
        power_up_uninitialized => "TRUE",
        intended_device_family => "Cyclone V"
    )
    PORT MAP (
        clocken1 => redist0_i_unnamed_vector_add14_q_14_enaAnd_q(0),
        clocken0 => VCC_q(0),
        clock0 => clock,
        aclr1 => redist0_i_unnamed_vector_add14_q_14_mem_reset0,
        clock1 => clock,
        address_a => redist0_i_unnamed_vector_add14_q_14_mem_aa,
        data_a => redist0_i_unnamed_vector_add14_q_14_mem_ia,
        wren_a => VCC_q(0),
        address_b => redist0_i_unnamed_vector_add14_q_14_mem_ab,
        q_b => redist0_i_unnamed_vector_add14_q_14_mem_iq
    );
    redist0_i_unnamed_vector_add14_q_14_mem_q <= redist0_i_unnamed_vector_add14_q_14_mem_iq(31 downto 0);

    -- c_i64_0gr(CONSTANT,5)
    c_i64_0gr_q <= "0000000000000000000000000000000000000000000000000000000000000000";

    -- i_add_9_vector_add(BLACKBOX,14)@4
    -- out out_primWireOut@18
    thei_add_9_vector_add : floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => in_c0_eni2_10,
        in_1 => in_c0_eni2_23,
        out_primWireOut => i_add_9_vector_add_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_add_8_vector_add(BLACKBOX,13)@4
    -- out out_primWireOut@18
    thei_add_8_vector_add : floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => in_c0_eni2_9,
        in_1 => in_c0_eni2_22,
        out_primWireOut => i_add_8_vector_add_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_add_7_vector_add(BLACKBOX,12)@4
    -- out out_primWireOut@18
    thei_add_7_vector_add : floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => in_c0_eni2_8,
        in_1 => in_c0_eni2_21,
        out_primWireOut => i_add_7_vector_add_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_add_6_vector_add(BLACKBOX,11)@4
    -- out out_primWireOut@18
    thei_add_6_vector_add : floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => in_c0_eni2_7,
        in_1 => in_c0_eni2_20,
        out_primWireOut => i_add_6_vector_add_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_add_5_vector_add(BLACKBOX,10)@4
    -- out out_primWireOut@18
    thei_add_5_vector_add : floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => in_c0_eni2_6,
        in_1 => in_c0_eni2_19,
        out_primWireOut => i_add_5_vector_add_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_add_4_vector_add(BLACKBOX,9)@4
    -- out out_primWireOut@18
    thei_add_4_vector_add : floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => in_c0_eni2_5,
        in_1 => in_c0_eni2_18,
        out_primWireOut => i_add_4_vector_add_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_add_3_vector_add(BLACKBOX,8)@4
    -- out out_primWireOut@18
    thei_add_3_vector_add : floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => in_c0_eni2_4,
        in_1 => in_c0_eni2_17,
        out_primWireOut => i_add_3_vector_add_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_add_2_vector_add(BLACKBOX,7)@4
    -- out out_primWireOut@18
    thei_add_2_vector_add : floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => in_c0_eni2_3,
        in_1 => in_c0_eni2_16,
        out_primWireOut => i_add_2_vector_add_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_add_1_vector_add(BLACKBOX,6)@4
    -- out out_primWireOut@18
    thei_add_1_vector_add : floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => in_c0_eni2_2,
        in_1 => in_c0_eni2_15,
        out_primWireOut => i_add_1_vector_add_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- i_add_vector_add(BLACKBOX,15)@4
    -- out out_primWireOut@18
    thei_add_vector_add : floatComponent_i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12_addBlock_tyA0Zcp36cd0oq3cd06oq3cz0
    PORT MAP (
        in_0 => in_c0_eni2_1,
        in_1 => in_c0_eni2_14,
        out_primWireOut => i_add_vector_add_out_primWireOut,
        clock => clock,
        resetn => resetn
    );

    -- GND(CONSTANT,0)
    GND_q <= "0";

    -- sync_out_aunroll_x(GPOUT,3)@18
    out_c0_exi2_0 <= GND_q;
    out_c0_exi2_1 <= i_add_vector_add_out_primWireOut;
    out_c0_exi2_2 <= i_add_1_vector_add_out_primWireOut;
    out_c0_exi2_3 <= i_add_2_vector_add_out_primWireOut;
    out_c0_exi2_4 <= i_add_3_vector_add_out_primWireOut;
    out_c0_exi2_5 <= i_add_4_vector_add_out_primWireOut;
    out_c0_exi2_6 <= i_add_5_vector_add_out_primWireOut;
    out_c0_exi2_7 <= i_add_6_vector_add_out_primWireOut;
    out_c0_exi2_8 <= i_add_7_vector_add_out_primWireOut;
    out_c0_exi2_9 <= i_add_8_vector_add_out_primWireOut;
    out_c0_exi2_10 <= i_add_9_vector_add_out_primWireOut;
    out_c0_exi2_11 <= c_i64_0gr_q;
    out_c0_exi2_12 <= c_i64_0gr_q;
    out_c0_exi2_13 <= c_i64_0gr_q;
    out_c0_exi2_14 <= redist0_i_unnamed_vector_add14_q_14_mem_q;
    out_o_valid <= redist1_sync_in_aunroll_x_in_i_valid_14_q;

END normal;
