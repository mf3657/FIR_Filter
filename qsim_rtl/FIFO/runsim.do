##################################################
# Modelsim do file to run simuilation
##################################################
vlib work
vmap work work
# Include Source File and Testbench
vlog +acc -incr ../../rtl/FIFO/FIFO.v
vlog +acc -incr FIFO_tb.v
# Run Simulator
vsim -t ps -lib work FIFO_tb
do waveformat.do
run -all
