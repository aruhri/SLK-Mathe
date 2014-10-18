
set style line 1 lt -1
set style line 2 lt 2

unset border

set terminal postscript enhanced 

set xzeroaxis linestyle 1 
set yzeroaxis linestyle 1 

set grid

set ylabel  "y\n [m]"  rotate by 0 offset graph 0.07,0.56
set xlabel  "x [m]"  offset graph 0.5,.040
#set key at 35,24000

#set xtics axis scale 0.5 10
#set ytics axis scale 0.5 5000
set output "graph_2.ps"

set arrow from graph 0.95,0 to graph 1.05,0
set arrow from graph 0,0.95 to graph 0,1.05 

set lmargin at screen 0.01;
set rmargin at screen 1;
set bmargin at screen 0.005;
set tmargin at screen 0.99;
set xrange [0:15]
set yrange [0:4]



f(x)=-1.0/(a**2)*9.81*x**2 +x


plot for [a=12:6:-3] f(x)  title sprintf("v = %d m/s",a);

!ps2pdf graph_2.ps  graph_2.pdf && rm graph_2.ps