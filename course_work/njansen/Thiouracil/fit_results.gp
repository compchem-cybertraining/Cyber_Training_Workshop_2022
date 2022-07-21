#
# +------------------------------------------------------------+
# |                     Fit plotting script                    |
# +------------------------------------------------------------+
#
#
# *** Definition of the kinetic model: ***
#     |  S1   S2   T1 
#-----+---------------
#  S1 |   .    .  kst 
#  S2 | k21    .    . 
#  T1 |   .    .    . 
#
#(Initial species: rows; Final species: columns)
#
#
# *** Species and initial value: ***
# S1        0
# S2        S2__0
# T1        0
#
#
# *** Reaction rates: ***
# kst
# k21
#
#


# ========================================================
#<<
# *** Gnuplot general options: ***
set xlabel "Global Fit Time Axis (fs)"
set ylabel "Population"
set xrange [0:2100.00]
set yrange [0:1]
unset key
set tmargin 1
set bmargin 4
set lmargin 8
set rmargin 22

set arrow from 700.000000,0 to 700.000000,1 nohead front
set arrow from 1400.000000,0 to 1400.000000,1 nohead front
# *** Label with time constants: ***
set label 1 "t(k21) =    10.6 fs\nt(kst) =   927.5 fs\np0(S2) =     1.0\n" at 2170.00,0.8 left

# *** Label with groups: ***
set label 2 "S1\n$3" at 350.00,0.95 center
set label 3 "S2\n$4" at 1050.00,0.95 center
set label 4 "T1\n$5" at 1750.00,0.95 center
p "fit_results.txt" u 1:2 w p pt 7 ps 0.4 lc rgb "black", "" u 1:3 w l lw 2 lc rgb "red"


# *** Infos: ***
# njansen@srv-p22-12.cbls.ccr.buffalo.edu
# Date: 2022-07-19 22:26:10.084131
# Current directory: /projects/academic/cyberwksp21/Students/njansen/project/Thiouracil/TRAJ

