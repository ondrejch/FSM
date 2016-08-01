#!/bin/bash

# Jub submission script for TORQUE
# Ondrej Chvala, ochvala@utk.edu
# 2016-07-16
# GNU/GPL

#PBS -V
#PBS -q fill
#PBS -l nodes=1:ppn=8

hostname

module load mpi
module load serpent
cd ${PBS_O_WORKDIR}

sss2 -omp 4 ffrr.inp

# We do not need this file, safe disk pace
# rm ffrrg.inp.out

# Extract useful data
awk 'BEGIN{ORS="\t"} /ANA_KEFF/ || /CONVERSION/ {print $7" "$8;}' ffrr.inp_res.m > done.out
grep "Fast Flux" ffrr.inp | sed -e s/[a-Z,\"]//g  >> done.out

