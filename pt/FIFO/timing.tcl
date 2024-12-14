###################################################################### 
## Timing setup for logic synthesis
## The unit for time is ns as defined in the IBM delay-power library
## The unit for wireload is pF as defined in the IBM delay-power library
## MS 2015
###################################################################### 

# Setting variables 
set clk_wr_period 100000.00
set clk_rd_period 1000.00
set clk_uncertainty 0
set clk_transition 0.1
set typical_input_delay 0.1
set typical_output_delay 0.1
set typical_wire_load 0.01

#Create real clock if clock port is found
if {[sizeof_collection [get_ports clk_wr]] > 0} {
  set clk_wr_name "clk_wr"
  set clk_wr_port "clk_wr"
  #If no waveform is specified, 50% duty cycle is assumed
  create_clock -name $clk_wr_name -period $clk_wr_period [get_ports $clk_wr_port] 
  set_drive 0 [get_ports $clk_wr_port] 
}
#Set clock uncertainty
set_clock_uncertainty $clk_uncertainty [get_clocks $clk_wr_name]
#Propagated clock used for gated clocks only
set_clock_transition $clk_transition [get_clocks $clk_wr_name]

if {[sizeof_collection [get_ports clk_rd]] > 0} {
  set clk_rd_name "clk_rd"
  set clk_rd_port "clk_rd"
  #If no waveform is specified, 50% duty cycle is assumed
  create_clock -name $clk_rd_name -period $clk_rd_period [get_ports $clk_rd_port] 
  set_drive 0 [get_ports $clk_rd_port] 
}
#Set clock uncertainty
set_clock_uncertainty $clk_uncertainty [get_clocks $clk_rd_name]
#Propagated clock used for gated clocks only
set_clock_transition $clk_transition [get_clocks $clk_rd_name]

# Set input and output delays
set_driving_cell -lib_cell INVX1TS [all_inputs]
set_input_delay $typical_input_delay [all_inputs] -clock $clk_wr_name 
remove_input_delay -clock $clk_wr_name [find port $clk_wr_port]
set_output_delay $typical_output_delay [all_outputs] -clock $clk_wr_name 
set_input_delay $typical_input_delay [all_inputs] -clock $clk_rd_name 
remove_input_delay -clock $clk_rd_name [find port $clk_rd_port]
set_output_delay $typical_output_delay [all_outputs] -clock $clk_rd_name 

# Customize for block
#set_output_delay 52 [all_outputs] -clock $clk_name 
#set_output_delay 0 next_* -clock $clk_name 

# Set loading of outputs 
set_load 0.005 [all_outputs] 
