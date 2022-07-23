set title "Quantum amplitudes (diabatic)\n34 Trajectories (Shortest 700.0 fs, Longest 700.0 fs)"

set xrange [0.000000:700.000000]
set yrange [0.000000:1.000000]
set xlabel 'Time (fs)'
set ylabel 'Population'

set term pngcairo size 640,480
set out 'populations.gp.png'
plot "pop.out" u 1:2 w l tit "Singlet 0" lw 2.5 lc rgbcolor "#FF0000", \
     ""        u 1:3 w l tit "Singlet 1" lw 2.5 lc rgbcolor "#7FFF00", \
     ""        u 1:4 w l tit "Singlet 2" lw 2.5 lc rgbcolor "#00FF66", \
     ""        u 1:5 w l tit "Triplet 1" lw 2.5 lc rgbcolor "#00B2FF", \
     ""        u 1:6 w l tit "Triplet 2" lw 2.5 lc rgbcolor "#3200FF", \
     ""        u 1:7 w l tit "Triplet 3" lw 2.5 lc rgbcolor "#FF00E5", \
     ""        u 1:8 w l tit "Triplet 1" lw 2.5 lc rgbcolor "#00B2FF", \
     ""        u 1:9 w l tit "Triplet 2" lw 2.5 lc rgbcolor "#3200FF", \
     ""        u 1:10 w l tit "Triplet 3" lw 2.5 lc rgbcolor "#FF00E5", \
     ""        u 1:11 w l tit "Triplet 1" lw 2.5 lc rgbcolor "#00B2FF", \
     ""        u 1:12 w l tit "Triplet 2" lw 2.5 lc rgbcolor "#3200FF", \
     ""        u 1:13 w l tit "Triplet 3" lw 2.5 lc rgbcolor "#FF00E5"
