datei = "graph_3"
x_min=-5
x_max=13
y_min=-30
y_max=31

set output datei.".ps"

set style line 1 lt -1
set style line 2 lt 2

unset border

set terminal postscript enhanced 
set xrange [x_min:x_max]
set yrange [y_min:y_max]

set xzeroaxis linestyle 1 
set yzeroaxis linestyle 1 
set grid
set label  "y"  at first -1,y_max
set label  "x" at first x_max,-1 
#set key at 35,24000
set xtics axis #scale 0.5 10
set ytics axis #scale 0.5 5000

set arrow from 5.0/6.0* x_max,0 to x_max +1,0
set arrow from 0,5.0/6.0* y_max to 0, y_max +1



set lmargin at screen 0.01;
set rmargin at screen 1;
set bmargin at screen 0.005;
set tmargin at screen 0.99;


f(x)=0.2*x**3 -0.5*a*x**2 +x+5*a
plot for [a=1:5:1] f(x)  title sprintf("t = %d",a);

system sprintf("ps2pdf %s.ps %s.pdf && rm %s.ps",datei, datei, datei)
