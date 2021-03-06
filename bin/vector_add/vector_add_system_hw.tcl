package require -exact qsys 14.0
set_module_property NAME vector_add_system
set_module_property VERSION 14.0
set_module_property INTERNAL false
set_module_property GROUP Accelerators
set_module_property DISPLAY_NAME vector_add_system
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true

add_interface clock_reset clock end
set_interface_property clock_reset ENABLED true
add_interface_port clock_reset clock clk Input 1
add_interface_port clock_reset resetn reset_n Input 1
add_interface clock_reset2x clock end
set_interface_property clock_reset2x ENABLED true
add_interface_port clock_reset2x clock2x clk Input 1

#### Slave interface avs_vector_add_cra
add_interface avs_vector_add_cra avalon end
set_interface_property avs_vector_add_cra ENABLED true
set_interface_property avs_vector_add_cra associatedClock clock_reset
set_interface_property avs_vector_add_cra addressAlignment DYNAMIC
set_interface_property avs_vector_add_cra burstOnBurstBoundariesOnly false
set_interface_property avs_vector_add_cra explicitAddressSpan 0
set_interface_property avs_vector_add_cra holdTime 0
set_interface_property avs_vector_add_cra isMemoryDevice false
set_interface_property avs_vector_add_cra isNonVolatileStorage false
set_interface_property avs_vector_add_cra linewrapBursts false
set_interface_property avs_vector_add_cra maximumPendingReadTransactions 1
set_interface_property avs_vector_add_cra printableDevice false
set_interface_property avs_vector_add_cra readLatency 0
set_interface_property avs_vector_add_cra readWaitTime 0
set_interface_property avs_vector_add_cra setupTime 0
set_interface_property avs_vector_add_cra timingUnits Cycles
set_interface_property avs_vector_add_cra writeWaitTime 0
set_interface_assignment avs_vector_add_cra hls.cosim.name {}
add_interface_port avs_vector_add_cra avs_vector_add_cra_read read input 1
add_interface_port avs_vector_add_cra avs_vector_add_cra_write write input 1
add_interface_port avs_vector_add_cra avs_vector_add_cra_address address input 4
add_interface_port avs_vector_add_cra avs_vector_add_cra_writedata writedata input 64
add_interface_port avs_vector_add_cra avs_vector_add_cra_byteenable byteenable input 8
add_interface_port avs_vector_add_cra avs_vector_add_cra_readdata readdata output 64
add_interface_port avs_vector_add_cra avs_vector_add_cra_readdatavalid readdatavalid output 1

#### IRQ interfaces kernel_irq
add_interface kernel_irq interrupt end
set_interface_property kernel_irq ENABLED true
set_interface_property kernel_irq associatedClock clock_reset
add_interface_port kernel_irq kernel_irq irq output 1

#### Master interface avm_mem_gmem0_port_0_0_rw with base address 0
add_interface avm_mem_gmem0_port_0_0_rw avalon start
set_interface_property avm_mem_gmem0_port_0_0_rw ENABLED true
set_interface_property avm_mem_gmem0_port_0_0_rw associatedClock clock_reset
set_interface_property avm_mem_gmem0_port_0_0_rw burstOnBurstBoundariesOnly false
set_interface_property avm_mem_gmem0_port_0_0_rw doStreamReads false
set_interface_property avm_mem_gmem0_port_0_0_rw doStreamWrites false
set_interface_property avm_mem_gmem0_port_0_0_rw linewrapBursts false
set_interface_property avm_mem_gmem0_port_0_0_rw readWaitTime 0
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_address address output 30
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_byteenable byteenable output 32
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_readdatavalid readdatavalid input 1
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_read read output 1
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_readdata readdata input 256
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_write write output 1
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_writedata writedata output 256
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_waitrequest waitrequest input 1
add_interface_port avm_mem_gmem0_port_0_0_rw avm_mem_gmem0_port_0_0_rw_burstcount burstcount output 5

add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL vector_add_system
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
add_fileset_file acl_shift_register.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_shift_register.v TOP_LEVEL_FILE
add_fileset_file acl_work_group_dispatcher.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_work_group_dispatcher.v TOP_LEVEL_FILE
add_fileset_file acl_kernel_finish_detector.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_kernel_finish_detector.v TOP_LEVEL_FILE
add_fileset_file acl_multistage_accumulator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_multistage_accumulator.v TOP_LEVEL_FILE
add_fileset_file acl_reset_handler.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_reset_handler.sv TOP_LEVEL_FILE
add_fileset_file acl_std_synchronizer_nocut.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_std_synchronizer_nocut.v TOP_LEVEL_FILE
add_fileset_file acl_fanout_pipeline.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fanout_pipeline.sv TOP_LEVEL_FILE
add_fileset_file acl_id_iterator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_id_iterator.v TOP_LEVEL_FILE
add_fileset_file acl_work_item_iterator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_work_item_iterator.v TOP_LEVEL_FILE
add_fileset_file acl_multistage_adder.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_multistage_adder.v TOP_LEVEL_FILE
add_fileset_file acl_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_fifo_stall_valid_lookahead.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fifo_stall_valid_lookahead.sv TOP_LEVEL_FILE
add_fileset_file vector_add_system.v SYSTEM_VERILOG PATH vector_add_system.v TOP_LEVEL_FILE
add_fileset_file dspba_library_package.vhd VHDL PATH $::env(INTELFPGAOCLSDKROOT)/windows64/lib/dspba/Libraries/vhdl/base/dspba_library_package.vhd TOP_LEVEL_FILE
add_fileset_file dspba_library.vhd VHDL PATH $::env(INTELFPGAOCLSDKROOT)/windows64/lib/dspba/Libraries/vhdl/base/dspba_library.vhd TOP_LEVEL_FILE
add_fileset_file acl_data_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_data_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_ll_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ll_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_ll_ram_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ll_ram_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_valid_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_valid_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_dspba_valid_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_dspba_valid_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_staging_reg.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_staging_reg.v TOP_LEVEL_FILE
add_fileset_file hld_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/hld_fifo.sv TOP_LEVEL_FILE
add_fileset_file hld_fifo_zero_width.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/hld_fifo_zero_width.sv TOP_LEVEL_FILE
add_fileset_file acl_high_speed_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_high_speed_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_low_latency_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_low_latency_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_zero_latency_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_zero_latency_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_tessellated_incr_decr_threshold.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_tessellated_incr_decr_threshold.sv TOP_LEVEL_FILE
add_fileset_file acl_tessellated_incr_lookahead.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_tessellated_incr_lookahead.sv TOP_LEVEL_FILE
add_fileset_file acl_lfsr.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_lfsr.sv TOP_LEVEL_FILE
add_fileset_file acl_pop.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_pop.v TOP_LEVEL_FILE
add_fileset_file acl_dspba_buffer.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_dspba_buffer.v TOP_LEVEL_FILE
add_fileset_file lsu_top.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_top.v TOP_LEVEL_FILE
add_fileset_file lsu_permute_address.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_permute_address.v TOP_LEVEL_FILE
add_fileset_file lsu_pipelined.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_pipelined.v TOP_LEVEL_FILE
add_fileset_file lsu_enabled.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_enabled.v TOP_LEVEL_FILE
add_fileset_file lsu_basic_coalescer.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_basic_coalescer.v TOP_LEVEL_FILE
add_fileset_file lsu_simple.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_simple.v TOP_LEVEL_FILE
add_fileset_file lsu_streaming.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_streaming.v TOP_LEVEL_FILE
add_fileset_file lsu_burst_master.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_master.v TOP_LEVEL_FILE
add_fileset_file lsu_bursting_load_stores.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_bursting_load_stores.v TOP_LEVEL_FILE
add_fileset_file lsu_non_aligned_write.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_non_aligned_write.v TOP_LEVEL_FILE
add_fileset_file lsu_read_cache.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_read_cache.v TOP_LEVEL_FILE
add_fileset_file lsu_atomic.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_atomic.v TOP_LEVEL_FILE
add_fileset_file lsu_prefetch_block.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_prefetch_block.v TOP_LEVEL_FILE
add_fileset_file lsu_wide_wrapper.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_wide_wrapper.v TOP_LEVEL_FILE
add_fileset_file lsu_streaming_prefetch.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_streaming_prefetch.v TOP_LEVEL_FILE
add_fileset_file acl_aligned_burst_coalesced_lsu.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_aligned_burst_coalesced_lsu.v TOP_LEVEL_FILE
add_fileset_file acl_toggle_detect.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_toggle_detect.v TOP_LEVEL_FILE
add_fileset_file acl_debug_mem.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_debug_mem.v TOP_LEVEL_FILE
add_fileset_file lsu_burst_coalesced_pipelined_write.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_coalesced_pipelined_write.sv TOP_LEVEL_FILE
add_fileset_file lsu_burst_coalesced_pipelined_read.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_coalesced_pipelined_read.sv TOP_LEVEL_FILE
add_fileset_file acl_full_detector.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_full_detector.v TOP_LEVEL_FILE
add_fileset_file acl_push.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_push.v TOP_LEVEL_FILE
add_fileset_file acl_token_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_token_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_clock2x_holder.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_clock2x_holder.v TOP_LEVEL_FILE
add_fileset_file vector_add_function_wrapper.vhd VHDL PATH kernel_hdl/vector_add/vector_add_function_wrapper.vhd TOP_LEVEL_FILE
add_fileset_file vector_add_function.vhd VHDL PATH kernel_hdl/vector_add/vector_add_function.vhd TOP_LEVEL_FILE
add_fileset_file bb_vector_add_B0.vhd VHDL PATH kernel_hdl/vector_add/bb_vector_add_B0.vhd TOP_LEVEL_FILE
add_fileset_file bb_vector_add_B0_stall_region.vhd VHDL PATH kernel_hdl/vector_add/bb_vector_add_B0_stall_region.vhd TOP_LEVEL_FILE
add_fileset_file i_load_memcoalesce_a_load_0_vector_add8.vhd VHDL PATH kernel_hdl/vector_add/i_load_memcoalesce_a_load_0_vector_add8.vhd TOP_LEVEL_FILE
add_fileset_file readdata_reg_memcoalesce_a_load_0_vector_add0.vhd VHDL PATH kernel_hdl/vector_add/readdata_reg_memcoalesce_a_load_0_vector_add0.vhd TOP_LEVEL_FILE
add_fileset_file i_load_memcoalesce_b_load_0_vector_add10.vhd VHDL PATH kernel_hdl/vector_add/i_load_memcoalesce_b_load_0_vector_add10.vhd TOP_LEVEL_FILE
add_fileset_file readdata_reg_memcoalesce_b_load_0_vector_add1.vhd VHDL PATH kernel_hdl/vector_add/readdata_reg_memcoalesce_b_load_0_vector_add1.vhd TOP_LEVEL_FILE
add_fileset_file i_sfc_c0_entry_vector_add_c0_enter_vector_add.vhd VHDL PATH kernel_hdl/vector_add/i_sfc_c0_entry_vector_add_c0_enter_vector_add.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add15.vhd VHDL PATH kernel_hdl/vector_add/i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add15.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_sfc_exit_c0_entry_vector_add_c0_exA0Z_add23_data_fifo.vhd VHDL PATH kernel_hdl/vector_add/i_acl_sfc_exit_c0_entry_vector_add_c0_exA0Z_add23_data_fifo.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_sfc_exit_c0_entry_vector_add_c0_exA0Zdd_full_detector.vhd VHDL PATH kernel_hdl/vector_add/i_acl_sfc_exit_c0_entry_vector_add_c0_exA0Zdd_full_detector.vhd TOP_LEVEL_FILE
add_fileset_file i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12.vhd VHDL PATH kernel_hdl/vector_add/i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12.vhd TOP_LEVEL_FILE
add_fileset_file floatComponent_i_sfc_logic_c0_entry_vectA0Zcd0oq3cd06oq3cz0.vhd VHDL PATH kernel_hdl/vector_add/floatComponent_i_sfc_logic_c0_entry_vectA0Zcd0oq3cd06oq3cz0.vhd TOP_LEVEL_FILE
add_fileset_file i_store_memdep_vector_add16.vhd VHDL PATH kernel_hdl/vector_add/i_store_memdep_vector_add16.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_pop_i1_throttle_pop_vector_add0.vhd VHDL PATH kernel_hdl/vector_add/i_acl_pop_i1_throttle_pop_vector_add0.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_pop_i1_throttle_pop_vector_add_reg.vhd VHDL PATH kernel_hdl/vector_add/i_acl_pop_i1_throttle_pop_vector_add_reg.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_push_i1_throttle_push_vector_add21.vhd VHDL PATH kernel_hdl/vector_add/i_acl_push_i1_throttle_push_vector_add21.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_push_i1_throttle_push_vector_add_reg.vhd VHDL PATH kernel_hdl/vector_add/i_acl_push_i1_throttle_push_vector_add_reg.vhd TOP_LEVEL_FILE
add_fileset_file i_syncbuf_a_sync_buffer_vector_add2.vhd VHDL PATH kernel_hdl/vector_add/i_syncbuf_a_sync_buffer_vector_add2.vhd TOP_LEVEL_FILE
add_fileset_file i_syncbuf_b_sync_buffer_vector_add4.vhd VHDL PATH kernel_hdl/vector_add/i_syncbuf_b_sync_buffer_vector_add4.vhd TOP_LEVEL_FILE
add_fileset_file i_syncbuf_c_sync_buffer_vector_add6.vhd VHDL PATH kernel_hdl/vector_add/i_syncbuf_c_sync_buffer_vector_add6.vhd TOP_LEVEL_FILE
add_fileset_file vector_add_B0_merge_reg.vhd VHDL PATH kernel_hdl/vector_add/vector_add_B0_merge_reg.vhd TOP_LEVEL_FILE
add_fileset_file vector_add_B0_branch.vhd VHDL PATH kernel_hdl/vector_add/vector_add_B0_branch.vhd TOP_LEVEL_FILE
add_fileset_file vector_add_B0_merge.vhd VHDL PATH kernel_hdl/vector_add/vector_add_B0_merge.vhd TOP_LEVEL_FILE
add_fileset_file vector_add_function_cra_slave.vhd VHDL PATH kernel_hdl/vector_add/vector_add_function_cra_slave.vhd TOP_LEVEL_FILE
add_fileset_file acl_start_signal_chain_element.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_start_signal_chain_element.v TOP_LEVEL_FILE
add_fileset_file acl_avm_to_ic.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_avm_to_ic.v TOP_LEVEL_FILE
add_fileset_file acl_ic_master_endpoint.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_master_endpoint.v TOP_LEVEL_FILE
add_fileset_file acl_arb_intf.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_arb_intf.v TOP_LEVEL_FILE
add_fileset_file acl_ic_intf.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_intf.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_endpoint.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_endpoint.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_rrp.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_rrp.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_wrp.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_wrp.v TOP_LEVEL_FILE
add_fileset_file acl_ic_mem_router.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_mem_router.v TOP_LEVEL_FILE
add_fileset_file acl_arb2.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_arb2.v TOP_LEVEL_FILE
add_fileset_file acl_ic_to_avm.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_to_avm.v TOP_LEVEL_FILE


add_fileset SIM_VERILOG SIM_VERILOG "" ""
set_fileset_property SIM_VERILOG TOP_LEVEL vector_add_system
add_fileset_file acl_shift_register.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_shift_register.v TOP_LEVEL_FILE
add_fileset_file acl_work_group_dispatcher.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_work_group_dispatcher.v TOP_LEVEL_FILE
add_fileset_file acl_kernel_finish_detector.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_kernel_finish_detector.v TOP_LEVEL_FILE
add_fileset_file acl_multistage_accumulator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_multistage_accumulator.v TOP_LEVEL_FILE
add_fileset_file acl_reset_handler.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_reset_handler.sv TOP_LEVEL_FILE
add_fileset_file acl_std_synchronizer_nocut.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_std_synchronizer_nocut.v TOP_LEVEL_FILE
add_fileset_file acl_fanout_pipeline.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fanout_pipeline.sv TOP_LEVEL_FILE
add_fileset_file acl_id_iterator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_id_iterator.v TOP_LEVEL_FILE
add_fileset_file acl_work_item_iterator.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_work_item_iterator.v TOP_LEVEL_FILE
add_fileset_file acl_multistage_adder.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_multistage_adder.v TOP_LEVEL_FILE
add_fileset_file acl_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_fifo_stall_valid_lookahead.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_fifo_stall_valid_lookahead.sv TOP_LEVEL_FILE
add_fileset_file vector_add_system.v SYSTEM_VERILOG PATH vector_add_system.v TOP_LEVEL_FILE
add_fileset_file dspba_library_package.vhd VHDL PATH $::env(INTELFPGAOCLSDKROOT)/windows64/lib/dspba/Libraries/vhdl/base/dspba_library_package.vhd TOP_LEVEL_FILE
add_fileset_file dspba_library.vhd VHDL PATH $::env(INTELFPGAOCLSDKROOT)/windows64/lib/dspba/Libraries/vhdl/base/dspba_library.vhd TOP_LEVEL_FILE
add_fileset_file acl_data_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_data_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_ll_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ll_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_ll_ram_fifo.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ll_ram_fifo.v TOP_LEVEL_FILE
add_fileset_file acl_valid_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_valid_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_dspba_valid_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_dspba_valid_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_staging_reg.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_staging_reg.v TOP_LEVEL_FILE
add_fileset_file hld_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/hld_fifo.sv TOP_LEVEL_FILE
add_fileset_file hld_fifo_zero_width.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/hld_fifo_zero_width.sv TOP_LEVEL_FILE
add_fileset_file acl_high_speed_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_high_speed_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_low_latency_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_low_latency_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_zero_latency_fifo.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_zero_latency_fifo.sv TOP_LEVEL_FILE
add_fileset_file acl_tessellated_incr_decr_threshold.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_tessellated_incr_decr_threshold.sv TOP_LEVEL_FILE
add_fileset_file acl_tessellated_incr_lookahead.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_tessellated_incr_lookahead.sv TOP_LEVEL_FILE
add_fileset_file acl_lfsr.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_lfsr.sv TOP_LEVEL_FILE
add_fileset_file acl_pop.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_pop.v TOP_LEVEL_FILE
add_fileset_file acl_dspba_buffer.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_dspba_buffer.v TOP_LEVEL_FILE
add_fileset_file lsu_top.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_top.v TOP_LEVEL_FILE
add_fileset_file lsu_permute_address.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_permute_address.v TOP_LEVEL_FILE
add_fileset_file lsu_pipelined.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_pipelined.v TOP_LEVEL_FILE
add_fileset_file lsu_enabled.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_enabled.v TOP_LEVEL_FILE
add_fileset_file lsu_basic_coalescer.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_basic_coalescer.v TOP_LEVEL_FILE
add_fileset_file lsu_simple.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_simple.v TOP_LEVEL_FILE
add_fileset_file lsu_streaming.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_streaming.v TOP_LEVEL_FILE
add_fileset_file lsu_burst_master.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_master.v TOP_LEVEL_FILE
add_fileset_file lsu_bursting_load_stores.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_bursting_load_stores.v TOP_LEVEL_FILE
add_fileset_file lsu_non_aligned_write.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_non_aligned_write.v TOP_LEVEL_FILE
add_fileset_file lsu_read_cache.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_read_cache.v TOP_LEVEL_FILE
add_fileset_file lsu_atomic.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_atomic.v TOP_LEVEL_FILE
add_fileset_file lsu_prefetch_block.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_prefetch_block.v TOP_LEVEL_FILE
add_fileset_file lsu_wide_wrapper.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_wide_wrapper.v TOP_LEVEL_FILE
add_fileset_file lsu_streaming_prefetch.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_streaming_prefetch.v TOP_LEVEL_FILE
add_fileset_file acl_aligned_burst_coalesced_lsu.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_aligned_burst_coalesced_lsu.v TOP_LEVEL_FILE
add_fileset_file acl_toggle_detect.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_toggle_detect.v TOP_LEVEL_FILE
add_fileset_file acl_debug_mem.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_debug_mem.v TOP_LEVEL_FILE
add_fileset_file lsu_burst_coalesced_pipelined_write.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_coalesced_pipelined_write.sv TOP_LEVEL_FILE
add_fileset_file lsu_burst_coalesced_pipelined_read.sv SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/lsu_burst_coalesced_pipelined_read.sv TOP_LEVEL_FILE
add_fileset_file acl_full_detector.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_full_detector.v TOP_LEVEL_FILE
add_fileset_file acl_push.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_push.v TOP_LEVEL_FILE
add_fileset_file acl_token_fifo_counter.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_token_fifo_counter.v TOP_LEVEL_FILE
add_fileset_file acl_clock2x_holder.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_clock2x_holder.v TOP_LEVEL_FILE
add_fileset_file vector_add_function_wrapper.vhd VHDL PATH kernel_hdl/vector_add/vector_add_function_wrapper.vhd TOP_LEVEL_FILE
add_fileset_file vector_add_function.vhd VHDL PATH kernel_hdl/vector_add/vector_add_function.vhd TOP_LEVEL_FILE
add_fileset_file bb_vector_add_B0.vhd VHDL PATH kernel_hdl/vector_add/bb_vector_add_B0.vhd TOP_LEVEL_FILE
add_fileset_file bb_vector_add_B0_stall_region.vhd VHDL PATH kernel_hdl/vector_add/bb_vector_add_B0_stall_region.vhd TOP_LEVEL_FILE
add_fileset_file i_load_memcoalesce_a_load_0_vector_add8.vhd VHDL PATH kernel_hdl/vector_add/i_load_memcoalesce_a_load_0_vector_add8.vhd TOP_LEVEL_FILE
add_fileset_file readdata_reg_memcoalesce_a_load_0_vector_add0.vhd VHDL PATH kernel_hdl/vector_add/readdata_reg_memcoalesce_a_load_0_vector_add0.vhd TOP_LEVEL_FILE
add_fileset_file i_load_memcoalesce_b_load_0_vector_add10.vhd VHDL PATH kernel_hdl/vector_add/i_load_memcoalesce_b_load_0_vector_add10.vhd TOP_LEVEL_FILE
add_fileset_file readdata_reg_memcoalesce_b_load_0_vector_add1.vhd VHDL PATH kernel_hdl/vector_add/readdata_reg_memcoalesce_b_load_0_vector_add1.vhd TOP_LEVEL_FILE
add_fileset_file i_sfc_c0_entry_vector_add_c0_enter_vector_add.vhd VHDL PATH kernel_hdl/vector_add/i_sfc_c0_entry_vector_add_c0_enter_vector_add.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add15.vhd VHDL PATH kernel_hdl/vector_add/i_acl_sfc_exit_c0_entry_vector_add_c0_exit_vector_add15.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_sfc_exit_c0_entry_vector_add_c0_exA0Z_add23_data_fifo.vhd VHDL PATH kernel_hdl/vector_add/i_acl_sfc_exit_c0_entry_vector_add_c0_exA0Z_add23_data_fifo.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_sfc_exit_c0_entry_vector_add_c0_exA0Zdd_full_detector.vhd VHDL PATH kernel_hdl/vector_add/i_acl_sfc_exit_c0_entry_vector_add_c0_exA0Zdd_full_detector.vhd TOP_LEVEL_FILE
add_fileset_file i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12.vhd VHDL PATH kernel_hdl/vector_add/i_sfc_logic_c0_entry_vector_add_c0_enter_vector_add12.vhd TOP_LEVEL_FILE
add_fileset_file floatComponent_i_sfc_logic_c0_entry_vectA0Zcd0oq3cd06oq3cz0.vhd VHDL PATH kernel_hdl/vector_add/floatComponent_i_sfc_logic_c0_entry_vectA0Zcd0oq3cd06oq3cz0.vhd TOP_LEVEL_FILE
add_fileset_file i_store_memdep_vector_add16.vhd VHDL PATH kernel_hdl/vector_add/i_store_memdep_vector_add16.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_pop_i1_throttle_pop_vector_add0.vhd VHDL PATH kernel_hdl/vector_add/i_acl_pop_i1_throttle_pop_vector_add0.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_pop_i1_throttle_pop_vector_add_reg.vhd VHDL PATH kernel_hdl/vector_add/i_acl_pop_i1_throttle_pop_vector_add_reg.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_push_i1_throttle_push_vector_add21.vhd VHDL PATH kernel_hdl/vector_add/i_acl_push_i1_throttle_push_vector_add21.vhd TOP_LEVEL_FILE
add_fileset_file i_acl_push_i1_throttle_push_vector_add_reg.vhd VHDL PATH kernel_hdl/vector_add/i_acl_push_i1_throttle_push_vector_add_reg.vhd TOP_LEVEL_FILE
add_fileset_file i_syncbuf_a_sync_buffer_vector_add2.vhd VHDL PATH kernel_hdl/vector_add/i_syncbuf_a_sync_buffer_vector_add2.vhd TOP_LEVEL_FILE
add_fileset_file i_syncbuf_b_sync_buffer_vector_add4.vhd VHDL PATH kernel_hdl/vector_add/i_syncbuf_b_sync_buffer_vector_add4.vhd TOP_LEVEL_FILE
add_fileset_file i_syncbuf_c_sync_buffer_vector_add6.vhd VHDL PATH kernel_hdl/vector_add/i_syncbuf_c_sync_buffer_vector_add6.vhd TOP_LEVEL_FILE
add_fileset_file vector_add_B0_merge_reg.vhd VHDL PATH kernel_hdl/vector_add/vector_add_B0_merge_reg.vhd TOP_LEVEL_FILE
add_fileset_file vector_add_B0_branch.vhd VHDL PATH kernel_hdl/vector_add/vector_add_B0_branch.vhd TOP_LEVEL_FILE
add_fileset_file vector_add_B0_merge.vhd VHDL PATH kernel_hdl/vector_add/vector_add_B0_merge.vhd TOP_LEVEL_FILE
add_fileset_file vector_add_function_cra_slave.vhd VHDL PATH kernel_hdl/vector_add/vector_add_function_cra_slave.vhd TOP_LEVEL_FILE
add_fileset_file acl_start_signal_chain_element.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_start_signal_chain_element.v TOP_LEVEL_FILE
add_fileset_file acl_avm_to_ic.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_avm_to_ic.v TOP_LEVEL_FILE
add_fileset_file acl_ic_master_endpoint.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_master_endpoint.v TOP_LEVEL_FILE
add_fileset_file acl_arb_intf.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_arb_intf.v TOP_LEVEL_FILE
add_fileset_file acl_ic_intf.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_intf.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_endpoint.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_endpoint.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_rrp.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_rrp.v TOP_LEVEL_FILE
add_fileset_file acl_ic_slave_wrp.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_slave_wrp.v TOP_LEVEL_FILE
add_fileset_file acl_ic_mem_router.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_mem_router.v TOP_LEVEL_FILE
add_fileset_file acl_arb2.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_arb2.v TOP_LEVEL_FILE
add_fileset_file acl_ic_to_avm.v SYSTEM_VERILOG PATH $::env(INTELFPGAOCLSDKROOT)/ip/acl_ic_to_avm.v TOP_LEVEL_FILE
