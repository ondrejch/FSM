
load 'default.plt'

set terminal pngcairo size 1000,800 enhanced font 'Verdana,12'

set xlabel "x [cm]"
set ylabel "y [cm]"

set out 'plot_therm2D.png'
set title "FSM-mk1-case21: thermal flux at z=0"
plot [-50:50][-50:50]  "mesh.data" i 0 u 1:2:3  w image notit

set out 'plot_epith2D.png'
set title "FSM-mk1-case21: epithermal flux at z=0"
plot [-50:50][-50:50]  "mesh.data" i 1 u 1:2:3  w image notit

set out 'plot_fast2D.png'
set title "FSM-mk1-case21: fast flux at z=0"
plot [-50:50][-50:50]  "mesh.data" i 2 u 1:2:3  w image notit


set terminal pngcairo size 1200,800 enhanced font 'Verdana,12'

set ylabel "neutron flux [neutrons s^{-1} cm^{-2}]"
set notit
set out 'plot_1D_X_pts.png'
set xlabel "x [cm]"
plot [][:]  "mesh.data"  i 2 u 1:($2==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk1-case21 fast", \
    "" i 1 u 1:($2==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk1-case21 epithermal", \
    "" i 0 u 1:($2==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk1-case21 thermal"


set out 'plot_1D_Y_pts.png'
set xlabel "y [cm]"
plot [][:]  "mesh.data" i 2 u 2:($1==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk1-case21 fast", \
    "" i 1 u 2:($1==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk1-case21 epithermal", \
    "" i 0 u 2:($1==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk1-case21 thermal"

