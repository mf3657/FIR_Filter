##################################################
# Modelsim do file to run simuilation
##################################################
vlib work
vmap work work
# Include Source File and Testbench
vlog +acc -incr ../../rtl/MAC/MAC.v
vlog +acc -incr MAC_TB.v
# Run Simulator
vsim -t ps -lib work MAC_TB
do waveformat.do
run -all
