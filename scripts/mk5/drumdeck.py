#!/usr/bin/env python3
#
# Generate Serpent deck for 7x7 Cassette filled Serpent deck
# Ondrj Chvala, ochvala@utk.edu
# Will Cureton, wcureton@vols.utk.edu
# 2017-04-18

import materials
import cells
import surfaces

def write_deck(N=21, r=1.25, refl=50, Nports=3, rport=2.5):
    '''Function to write the FastDrum Serpent input deck.
    Inputs: 
        N:      size of the N x N checkerboard lattice
        r:      radius of the fuel in the fuel pin [cm]
        refl:   reflector thickness [cm]
        Nports: number of beam ports [0,1,2,3]
        rport:  radius of a port [cm]
    Outputs:
        output: String containing the FastDrum deck'''

    # Header
    output = '''set title "Fast Flux Research Reactor, N {N}, rfuel {r}, reflector thickness {refl}, {Nports} beamports radius {rport} cm."
'''
    # Surfaces
    output += surfaces.write_surfaces(N, r, refl, Nports, rport)

    # Cells
    output += cells.write_cells(Nports)

    # Materials
    output += materials.write_materials()

    # Data cards
    data_cards = '''
%______________data cards___________________________________________

% Power [W]
set power 100
set cpd 2

% Boundary condition
set bc 1

% Subcritical mode with external source
set nps 25000 200
src 1 sc 6 se 2

% Neutron population and criticality cycles
% set pop 10000 200 40 % 10000 neutrons, 100 cycles, 40 of them inactive

% Data Libraries
set acelib "sss_endfb7u.sssdir"
set declib "sss_endfb7.dec"
set nfylib "sss_endfb7.nfy"

% Analog reaction rate
set arr 2
'''
    output += data_cards

    # Plots
    plot_cards = '''
% Plots
plot 1 3000 3000
plot 2 3000 3000
plot 3 3000 3000
mesh 1 3000 3000
mesh 2 3000 3000
mesh 3 3000 3000
'''
    output += plot_cards

    # XY neutron flux plots - commented out by default
    flux_xy_cards = '''
% Flux plots in XY plane - commented out by default
% Energy grid 
%ene groupE 1 1E-11 6.25e-7 0.05 20
% Define mesh cell volume 
%det mydet dv 4
%de groupE
%dx -100 100 201
%dy -100 100 201
%dz  -2 2 1
'''
    output += flux_xy_cards

    output = output.format(**locals())
    return output

if __name__ == '__main__':
    print("This module writes the deck for FastDrum Serpent deck.")
    input("Press Ctrl+C to quit, or enter else to test it. ")
    print(write_deck())
