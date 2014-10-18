
set style line 1 lt -1
set style line 2 lt 2

unset border

set terminal postscript enhanced 

set xzeroaxis lt -1 linestyle 1 
set yzeroaxis  lt -1 linestyle 1 

set grid

set ylabel  "V(x)\n [cm^3]"  rotate by 0 offset graph 0.08,0.52
set xlabel  "x [cm]"  offset graph 0.5,.040
set key at 35,24000

set xtics axis scale 0.5 10
set ytics axis scale 0.5 5000
set output "graph_1.ps"

set arrow from 38,0 to 40,0
set arrow from 0,30000 to 0,33000 

set lmargin at screen 0.01;
set rmargin at screen 1;
set bmargin at screen 0.005;
set tmargin at screen 0.99;
set xrange [0:39]
set yrange [0:32000]
#set title "f(x)=x^3-4x"

#a=3
f(x)=4*x**3 -4*a*x**2+a**2*x
#f(x)= 0.25*x*(x-8)**2
#h(x) = a*(6*x-4)

plot for [a=75:15:-15] x<a/2 ? f(x) : 0 title sprintf("a = %d",a);
#set key at 10,11
#plot f(x),g(x)#,g(x)-f(x)
#plot f(x),g(x) title "f\'(x)" lt 2
#plot f(x),g(x) title "f\'(x)" lt 2, h(x) title "f\'\'(x)" lt 6


!ps2pdf graph_1.ps  graph_1.pdf && rm graph_1.ps