onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TOP/DUT/clk
add wave -noupdate /TOP/DUT/rst_n
add wave -noupdate /TOP/DUT/ce
add wave -noupdate /TOP/DUT/ld
add wave -noupdate /TOP/DUT/cu
add wave -noupdate /TOP/DUT/cd
add wave -noupdate /TOP/DUT/data_in
add wave -noupdate /TOP/DUT/data_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {112 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {960 ps}
