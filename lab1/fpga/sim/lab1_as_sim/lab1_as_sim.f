-L work
-reflib pmi_work
-reflib ovi_ice40up


"C:/Users/asenapati/Documents/GitHub/E155-labs/lab1/fpga/src/lab1_as.sv" 
"C:/Users/asenapati/Documents/GitHub/E155-labs/lab1/fpga/src/drive_seven_seg.sv" 
"C:/Users/asenapati/Documents/GitHub/E155-labs/lab1/fpga/src/drive_led_builtin.sv" 
-sv
-optionset VOPTDEBUG
+noacc+pmi_work.*
+noacc+ovi_ice40up.*

-vopt.options
  -suppress vopt-7033
-end

-gui
-top lab1_as
-vsim.options
  -suppress vsim-7033,vsim-8630,3009,3389
-end

-do "view wave"
-do "add wave /*"
-do "run 100 ns"
