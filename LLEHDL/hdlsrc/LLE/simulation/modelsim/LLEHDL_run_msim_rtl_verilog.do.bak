transcript on
if ![file isdirectory verilog_libs] {
	file mkdir verilog_libs
}

vlib verilog_libs/altera_ver
vmap altera_ver ./verilog_libs/altera_ver
vlog -vlog01compat -work altera_ver {d:/software/quartus18/quartus/eda/sim_lib/altera_primitives.v}

vlib verilog_libs/lpm_ver
vmap lpm_ver ./verilog_libs/lpm_ver
vlog -vlog01compat -work lpm_ver {d:/software/quartus18/quartus/eda/sim_lib/220model.v}

vlib verilog_libs/sgate_ver
vmap sgate_ver ./verilog_libs/sgate_ver
vlog -vlog01compat -work sgate_ver {d:/software/quartus18/quartus/eda/sim_lib/sgate.v}

vlib verilog_libs/altera_mf_ver
vmap altera_mf_ver ./verilog_libs/altera_mf_ver
vlog -vlog01compat -work altera_mf_ver {d:/software/quartus18/quartus/eda/sim_lib/altera_mf.v}

vlib verilog_libs/altera_lnsim_ver
vmap altera_lnsim_ver ./verilog_libs/altera_lnsim_ver
vlog -sv -work altera_lnsim_ver {d:/software/quartus18/quartus/eda/sim_lib/altera_lnsim.sv}

vlib verilog_libs/cyclonev_ver
vmap cyclonev_ver ./verilog_libs/cyclonev_ver
vlog -vlog01compat -work cyclonev_ver {d:/software/quartus18/quartus/eda/sim_lib/mentor/cyclonev_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {d:/software/quartus18/quartus/eda/sim_lib/mentor/cyclonev_hmi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_ver {d:/software/quartus18/quartus/eda/sim_lib/cyclonev_atoms.v}

vlib verilog_libs/cyclonev_hssi_ver
vmap cyclonev_hssi_ver ./verilog_libs/cyclonev_hssi_ver
vlog -vlog01compat -work cyclonev_hssi_ver {d:/software/quartus18/quartus/eda/sim_lib/mentor/cyclonev_hssi_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_hssi_ver {d:/software/quartus18/quartus/eda/sim_lib/cyclonev_hssi_atoms.v}

vlib verilog_libs/cyclonev_pcie_hip_ver
vmap cyclonev_pcie_hip_ver ./verilog_libs/cyclonev_pcie_hip_ver
vlog -vlog01compat -work cyclonev_pcie_hip_ver {d:/software/quartus18/quartus/eda/sim_lib/mentor/cyclonev_pcie_hip_atoms_ncrypt.v}
vlog -vlog01compat -work cyclonev_pcie_hip_ver {d:/software/quartus18/quartus/eda/sim_lib/cyclonev_pcie_hip_atoms.v}

if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Vertical_Padding_Counter_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Vertical_Padding_Counter_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Vertical_Padding_Counter_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Vertical_Padding_Counter_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Vertical_Padding_Counter.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Vertical_Padder_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Vertical_Padder_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Vertical_Padder_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Vertical_Padder_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Vertical_Padder.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PushPopCounterOne_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PushPopCounterOne_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PushPopCounterOne_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PushPopCounterOne_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PushPopCounterOne.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PushPopCounter_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PushPopCounter_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PushPopCounter_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PushPopCounter_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PushPopCounter.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Pixel_Stream_Aligner.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PaddingController_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PaddingController_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PaddingController_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PaddingController_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/PaddingController.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LLEHDL.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineSpaceAverager_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineSpaceAverager_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineSpaceAverager_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineSpaceAverager_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineSpaceAverager.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineInfoStore_block8.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineInfoStore_block7.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineInfoStore_block6.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineInfoStore_block5.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineInfoStore_block4.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineInfoStore_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineInfoStore_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineInfoStore_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineInfoStore_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineInfoStore.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineBuffer_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineBuffer_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineBuffer_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineBuffer_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LineBuffer.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/IterativeFilter.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Inversion.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/InputControlValidation_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/InputControlValidation_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/InputControlValidation_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/InputControlValidation_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/InputControlValidation.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Image_Filter4.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Image_Filter3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Image_Filter2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Image_Filter1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Image_Filter.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Horizontal_Padder_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Horizontal_Padder_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Horizontal_Padder_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Horizontal_Padder_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/Horizontal_Padder.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/GateProcessData_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/GateProcessData_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/GateProcessData_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/GateProcessData_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/GateProcessData.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/FIR2DKernel_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/FIR2DKernel_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/FIR2DKernel_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/FIR2DKernel_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/FIR2DKernel.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DataReadController_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DataReadController_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DataReadController_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DataReadController_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DataReadController.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DATA_MEMORY_block3.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DATA_MEMORY_block2.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DATA_MEMORY_block1.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DATA_MEMORY_block.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DATA_MEMORY.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/DarkChannel.v}
vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/simpledualportram_generic.v}

vlog -vlog01compat -work work +incdir+C:/signal2/LLEHDL/hdlsrc/LLE {C:/signal2/LLEHDL/hdlsrc/LLE/LLEHDL_tb.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  LLEHDL_tb

add wave *
view structure
view signals
run -all
