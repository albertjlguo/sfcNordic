reset
set terminal windows
set style data lines
set xtics
set border
set grid
set multiplot layout  3,1 rowsfirst 
set xrange [0 :      240.000 ]
set xlabel 't (s)'
set ylabel 'V (pu)'
set title 'BUS 4044
plot 'temp_display.cur' using 1: 2 notitle
set xrange [0 :      240.000 ]
set xlabel 't (s)'
set ylabel 'V (pu)'
set title 'BUS 1041
plot 'temp_display.cur' using 1: 3 notitle
set xrange [0 :      240.000 ]
set xlabel 't (s)'
set ylabel 'Omega (pu)'
set title 'Machine g2
plot 'temp_display.cur' using 1: 4 notitle
unset multiplot
