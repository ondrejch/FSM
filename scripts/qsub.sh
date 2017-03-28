#!/bin/bash

# Jub submission script for TORQUE
# Ondrej Chvala, ochvala@utk.edu
# 2016-08-02
# GNU/GPL

#PBS -V
#PBS -q fill
#PBS -l nodes=1:ppn=8

hostname

module load mpi
module load serpent
cd ${PBS_O_WORKDIR}

sss2 -omp 8 ffrr.inp > runout.txt

# We do not need this file, safe disk pace
# rm ffrr.inp.out

# Extract useful data
awk 'BEGIN{ORS="\t"} /ANA_KEFF/ || /CONVERSION/ {print $7" "$8;}' ffrr.inp_res.m > done.out
grep "Fast Flux" ffrr.inp | sed -e s/[a-Z,\"]//g  >> done.out

awk -v max=0 '/% a$/{if($2>max){want=$2; max=$2}}END{print "Hottest pin power [W]:",want}' ffrr.inp_core0.m >> done.out

