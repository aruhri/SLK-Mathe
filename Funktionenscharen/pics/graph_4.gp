datei = "graph_4"
x_min=0
x_max=5
y_min=0
y_max=10
set size ratio -1 #positive Zahl: Verhältnis der Achsenlängen,
                  #neg:Verhältnis der Achsenskalierung

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
set label  "y"  at first -0.4,y_max+0.3
set label  "x" at first x_max+0.3,-0.4 
#set key at 35,24000
set xtics axis #scale 0.5 10
set ytics axis #scale 0.5 5000

set arrow from 5.0/6.0* x_max,0 to x_max +.3,0
set arrow from 0,5.0/6.0* y_max to 0, y_max +.3



set lmargin at screen 0.01;
set rmargin at screen 0.4;
set bmargin at screen 0.005;
set tmargin at screen 0.99;


f(x)=-4.0*x**2 +a*x/2.0
plot for [a=8:24:4] f(x)  title sprintf("t = %d",a);

system sprintf("ps2pdf %s.ps %s.pdf && rm %s.ps",datei, datei, datei)
