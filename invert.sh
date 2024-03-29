#!/bin/bash
ij_run="ImageJ -macro invert.ijm"

ij_script="macro 'process_volume.ijm' {"
ij_script+="open('$1');"
ij_script+="run('Multiply...', 'value=-1');"
ij_script+="saveAs('Tiff', '$2');"
ij_script+="close();"
ij_script+="exit();"
ij_script+="}"

echo "$ij_script" > invert.ijm
$ij_run -batch invert.ijm

rm invert.ijm
