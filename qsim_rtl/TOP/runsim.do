##################################################
# Modelsim do file to run simuilation
##################################################
vlib work
vmap work work
# Include Source File and Testbench
vlog +acc -incr ../../rtl/TOP/TOP.v
vlog +acc -incr ../../rtl/mem_comp/MEM_top.v
vlog +acc -incr ../../rtl/mem_comp/IMEM.v
vlog +acc -incr ../../rtl/mem_comp/CMEM.v
vlog +acc -incr ../../rtl/MAC/MAC.v
vlog +acc -incr ../../rtl/FIFO/FIFO.v
vlog +acc -incr TOP_TB.v
# Run Simulator
vsim -t ps -lib work TOP_TB
do waveformat.do
run -all
