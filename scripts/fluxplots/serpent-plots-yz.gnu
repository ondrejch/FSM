
load '~/git/FSM/scripts/fluxplots/default.plt'

set terminal pngcairo size 1000,800 enhanced font 'Verdana,12'

set xlabel "y [cm]"
set ylabel "z [cm]"

set out 'plot_therm2D.png'
set title "FSM-mk2 250MW: thermal flux at x=0"
plot [-100:100][-100:100]  "mesh.data" i 0 u 1:2:3  w image notit

set out 'plot_epith2D.png'
set title "FSM-mk2 250MW: epithermal flux at x=0"
plot [-100:100][-100:100]  "mesh.data" i 1 u 1:2:3  w image notit

set out 'plot_fast2D.png'
set title "FSM-mk2 250MW: fast flux at x=0"
plot [-100:100][-100:100]  "mesh.data" i 2 u 1:2:3  w image notit


set terminal pngcairo size 1200,800 enhanced font 'Verdana,12'

set ylabel "neutron flux [neutrons s^{-1} cm^{-2}]"
set notit
set out 'plot_1D_Y_pts.png'
set xlabel "y [cm]"
plot [][:]  "mesh.data"  i 2 u 1:($2==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk2 250MW fast", \
    "" i 1 u 1:($2==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk2 250MW epithermal", \
    "" i 0 u 1:($2==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk2 250MW thermal"


set out 'plot_1D_Z_pts.png'
set xlabel "z [cm]"
plot [][:]  "mesh.data" i 2 u 2:($1==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk2 250MW fast", \
    "" i 1 u 2:($1==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk2 250MW epithermal", \
    "" i 0 u 2:($1==0)?$3:1/0:($3*$4) w ye pt 7 ps 0.5  tit "FSM-mk2 250MW thermal"

