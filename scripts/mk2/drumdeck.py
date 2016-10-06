#!/usr/bin/python3
#
# Generate Serpent deck for FastDrum Serpent deck
# Ondrej Chvala, ochvala@utk.edu
# 2016-08-02

import materials
import cells
import surfaces

def write_deck(N=11, r=1.25, refl=30, Nports=0, rport=5.0):
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
    output = '''\
set title "Fast Flux Research Reactor, N {N}, rfuel {r}, reflector thickness {refl}"
'''
    # Surfaces
    output += surfaces.write_surfaces(N, r, refl)

    # Cells
    output += cells.write_cells()

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

% Neutron population and criticality cycles
set pop 10000 200 40 % 10000 neutrons, 100 cycles, 40 of them inactive

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
