onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /MAC_TB/clk
add wave -noupdate /MAC_TB/reset
add wave -noupdate -radix signed /MAC_TB/currX
add wave -noupdate -radix signed /MAC_TB/currCoeff
add wave -noupdate -radix signed /MAC_TB/y
add wave -noupdate -radix signed /MAC_TB.uut0/accum
add wave -noupdate /MAC_TB/mac_tick
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 223
configure wave -valuecolwidth 89
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ns} {12 ns}
