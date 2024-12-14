##################################################
#  Modelsim do file to run simuilation
#  MS 7/2015
##################################################

#Setup
 vlib work 
 vmap work work

#Include Netlist and Testbench
 vlog +acc -incr /courses/ee6321/share/ibm13rflpvt/verilog/ibm13rflpvt.v
 vlog +acc -incr ../../dc/mem_comp/MEM_top.nl.v
 vlog +acc -incr ../../rtl/mem_comp/IMEM.v
 vlog +acc -incr ../../rtl/mem_comp/CMEM.v
 vlog +acc -incr MEM_tb.v 

#Run Simulator 
#SDF from DC is annotated for the timing check 
vsim -voptargs=+acc -t ps -lib work -sdftyp uut0=../../dc/mem_comp/MEM_top.syn.sdf MEM_tb
 do waveformat.do   
 run -all
