onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /FIFO_tb/clk_wr
add wave -noupdate /FIFO_tb/clk_rd
add wave -noupdate /FIFO_tb/rst
add wave -noupdate /FIFO_tb/wr_data
add wave -noupdate /FIFO_tb/wr_en
add wave -noupdate /FIFO_tb/rd_data
add wave -noupdate /FIFO_tb/rd_en
add wave -noupdate /FIFO_tb/full
add wave -noupdate /FIFO_tb/empty
add wave -noupdate /FIFO_tb.uut0/rd_ptr
add wave -noupdate /FIFO_tb.uut0/wr_ptr
add wave -noupdate /FIFO_tb.uut0/FIFO_COUNT
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
