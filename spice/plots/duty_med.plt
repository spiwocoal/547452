set encoding utf8
set termoption noenhanced
set title "Simulación transiente (valores medidos)"
set xlabel "Tiempo (s)"
set ylabel "Voltaje de salida"
set grid
set terminal pngcairo size 1200,800 enhanced font "Noto Sans Mono,20"
set output 'duty_med.png'
unset logscale x 
set xrange [0.000000e+00:5.000000e-02]
unset logscale y 
set yrange [-4.037172e+00:8.478062e+01]
#set xtics 1
#set x2tics 1
#set ytics 1
#set y2tics 1
set format y "%g"
set format x "%g"
set key horizontal outside center bottom
plot 'duty_med.data' using 1:2 with lines lw 1 title "D = 20%",\
'duty_med.data' using 3:4 with lines lw 1 title "D = 25%",\
'duty_med.data' using 5:6 with lines lw 1 title "D = 30%",\
'duty_med.data' using 7:8 with lines lw 1 title "D = 35%",\
'duty_med.data' using 9:10 with lines lw 1 title "D = 40%",\
'duty_med.data' using 11:12 with lines lw 1 title "D = 45%",\
'duty_med.data' using 13:14 with lines lw 1 title "D = 50%",\
'duty_med.data' using 15:16 with lines lw 1 title "D = 55%",\
'duty_med.data' using 17:18 with lines lw 1 title "D = 60%",\
'duty_med.data' using 19:20 with lines lw 1 title "D = 65%",\
'duty_med.data' using 21:22 with lines lw 1 title "D = 70%"
