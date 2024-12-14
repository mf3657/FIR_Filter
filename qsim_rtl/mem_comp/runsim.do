##################################################
# Modelsim do file to run simuilation
##################################################
vlib work
vmap work work
# Include Source File and Testbench
vlog +acc -incr ../../rtl/mem_comp/MEM_top.v
vlog +acc -incr ../../rtl/mem_comp/IMEM.v
vlog +acc -incr ../../rtl/mem_comp/CMEM.v
vlog +acc -incr MEM_tb.v
# Run Simulator
vsim -t ps -lib work MEM_tb
do waveformat.do
run -all
