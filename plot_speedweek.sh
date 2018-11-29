#!/usr/bin/gnuplot
set terminal svg font "Verdana,10"    #output format of graph
set term svg enhanced size 1000,800    #resolution
set font 'Verdana,14'
set output "speedweek.svg"    #name of output file
set style data points
set ylabel "Mbit/s"    #vertical axis name
set yrange [0:130]    #vertical axis range (optional line)

set xdata time   #x axis is not numbers, but dates/times
set timefmt "%d.%m.%Y %H:%M:%S"    #format of time is source file (temperature_temporary.dat)
set format x ""    #format of time labels in axis label
set xrange [ "`date --date='7 days ago' +"%d.%m.%Y %H:%M:%S"`" : "`date +"%d.%m.%Y %H:%M:%S"`" ]

set format x "%d.%m."  #format of time labels in axis label
set tmargin 1.5
set title "SPEEDTEST: `date --date='7 days ago' +"%d.%m.%Y %H:%M:%S"` - `date +"%d.%m.%Y %H:%M:%S"`" font 'Verdana,14' offset 0,-1
set grid xtics lc rgb "#bfbfbf" lw 1 lt 0    #grey grid on background
set grid ytics lc rgb "#bfbfbf" lw 1 lt 0    #grey grid on background
set ytics -10,10 font 'Verdana,12'
set xtics 0,86400 font 'Verdana,12'  #rotate by 0 right
set datafile separator ','

plot "speedtest.csv" using 1:3 title "Download" axes x1y1 with lines lc rgb '#00ccff' lt 1 lw 2, \
     "speedtest.csv" using 1:4 title "Upload" axes x1y1 with lines lc rgb '#ee00ee' lt 1 lw 2
