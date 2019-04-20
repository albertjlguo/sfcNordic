reset
set terminal windows
set style data lines
set xtics
set border
set grid
set multiplot layout  8,1 rowsfirst 
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
set xrange [0 :      240.000 ]
set xlabel 't (s)'
set ylabel 'P (MW)'
set title 'BRANCH g6-1042
plot 'temp_display.cur' using 1: 5 notitle
set xrange [0 :      240.000 ]
set xlabel 't (s)'
set ylabel 'P (MW)'
set title 'BRANCH g7-1043
plot 'temp_display.cur' using 1: 6 notitle
set xrange [0 :      240.000 ]
set xlabel 't (s)'
set ylabel 'P (MW)'
set title 'BRANCH g14-4042
plot 'temp_display.cur' using 1: 7 notitle
set xrange [0 :      240.000 ]
set xlabel 't (s)'
set ylabel 'P (MW)'
set title 'BRANCH g15-4047
plot 'temp_display.cur' using 1: 8 notitle
set xrange [0 :      240.000 ]
set xlabel 't (s)'
set ylabel 'P (MW)'
set title 'BRANCH g16-4051
plot 'temp_display.cur' using 1: 9 notitle
unset multiplot
