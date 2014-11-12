datei = "graph_title"
x_min=-5
x_max=12
y_min=-30
y_max=32

set output datei.".eps"

set style line 1 lt -1
set style line 2 lt 2

unset border

set terminal postscript eps enhanced size 8cm,7cm
set xrange [x_min:x_max]
set yrange [y_min:y_max]

unset xzeroaxis linestyle 1 
unset yzeroaxis linestyle 1 
unset grid
unset label  "y"  at first -1,y_max
unset label  "x" at first x_max,-1 
unset key at 35,24000
unset xtics axis #scale 0.5 10
unset ytics axis #scale 0.5 5000
#set arrow from 5.0/6.0* x_max,0 to x_max +1,0
#set arrow from 0,5.0/6.0* y_max to 0, y_max +1

f(x)=0.2*x**3 -0.25*a*x**2 +.5*x+4*a-13
plot for [a=1:10:1] f(x) lt 1;
#splot 0.2*x**3 -0.25*y*x**2 +x+2.5*y;

system sprintf("epstool --copy --bbox %s.eps %s2.eps", datei,datei)

system sprintf("epspdf %s2.eps %s.pdf && rm %s2.eps && rm %s.eps",datei,datei,datei, datei)
