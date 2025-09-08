onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /lab1_as_tb/clk_test
add wave -noupdate /lab1_as_tb/reset
add wave -noupdate /lab1_as_tb/sw6
add wave -noupdate /lab1_as_tb/extsw
add wave -noupdate /lab1_as_tb/enseg1
add wave -noupdate /lab1_as_tb/enseg2
add wave -noupdate /lab1_as_tb/sevenseg
add wave -noupdate -expand /lab1_as_tb/leds
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {10512308 ps} 0}
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
WaveRestoreZoom {0 ps} {10544100 ps}
