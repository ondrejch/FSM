#!/usr/bin/python3
#
# Generate Serpent deck
# Ondrej Chvala, ochvala@utk.edu

import materials
import cells
import surfaces

def write_deck(N, r, refl):
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

    output = output.format(**locals())
    return output

if __name__ == '__main__':
    print("This module writes the deck.")
    input("Press Ctrl+C to quit, or enter else to test it. ")
    print(write_deck(11, 1.25, 25))
