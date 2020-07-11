onbreak resume
onerror resume
vsim -voptargs=+acc work.LLEHDL_tb

add wave sim:/LLEHDL_tb/u_LLEHDL/clk
add wave sim:/LLEHDL_tb/u_LLEHDL/reset
add wave sim:/LLEHDL_tb/u_LLEHDL/clk_enable
add wave sim:/LLEHDL_tb/u_LLEHDL/pixelIn_0
add wave sim:/LLEHDL_tb/u_LLEHDL/pixelIn_1
add wave sim:/LLEHDL_tb/u_LLEHDL/pixelIn_2
add wave sim:/LLEHDL_tb/u_LLEHDL/ctrlIn_hStart
add wave sim:/LLEHDL_tb/u_LLEHDL/ctrlIn_hEnd
add wave sim:/LLEHDL_tb/u_LLEHDL/ctrlIn_vStart
add wave sim:/LLEHDL_tb/u_LLEHDL/ctrlIn_vEnd
add wave sim:/LLEHDL_tb/u_LLEHDL/ctrlIn_valid
add wave sim:/LLEHDL_tb/u_LLEHDL/ce_out
add wave sim:/LLEHDL_tb/u_LLEHDL/pixelOut_0
add wave sim:/LLEHDL_tb/pixelOut_0_ref
add wave sim:/LLEHDL_tb/u_LLEHDL/pixelOut_1
add wave sim:/LLEHDL_tb/pixelOut_1_ref
add wave sim:/LLEHDL_tb/u_LLEHDL/pixelOut_2
add wave sim:/LLEHDL_tb/pixelOut_2_ref
add wave sim:/LLEHDL_tb/u_LLEHDL/ctrlOut_hStart
add wave sim:/LLEHDL_tb/ctrlOut_hStart_ref
add wave sim:/LLEHDL_tb/u_LLEHDL/ctrlOut_hEnd
add wave sim:/LLEHDL_tb/ctrlOut_hEnd_ref
add wave sim:/LLEHDL_tb/u_LLEHDL/ctrlOut_vStart
add wave sim:/LLEHDL_tb/ctrlOut_vStart_ref
add wave sim:/LLEHDL_tb/u_LLEHDL/ctrlOut_vEnd
add wave sim:/LLEHDL_tb/ctrlOut_vEnd_ref
add wave sim:/LLEHDL_tb/u_LLEHDL/ctrlOut_valid
add wave sim:/LLEHDL_tb/ctrlOut_valid_ref
run -all
