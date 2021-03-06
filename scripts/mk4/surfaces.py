#!/usr/bin/env python3
#
# Generate surfaces, pins, and lattice for FastDrum Serpent deck 
# Ondrej Chvala, ochvala@utk.edu
# 2016-08-02

import math

def write_surfaces(N=11, r=1.25, refl=25, Nports=3, rport=5.0):
    '''Function to write material cards for Serpent input deck.
    Inputs: 
        N:     size of the N x N checkerboard lattice
        r:     radius of the fuel in the fuel pin [cm]
        refl:  reflector thickness [cm]
        Nports: number of beam ports [0,1,2,3]
        rport:  radius of a port [cm]
    Outputs:
        surfaces: String containing the surface cards'''
    
    rclad = r + 0.1                 # Cladding outer radius              
    pitch = 2.0 * rclad + 0.01      # Lattice pitch
    asemb = 5 * pitch + 2
    l10   = 42         # Radius of the cylinder bounding the lattice
    l20   = l10 + 0.5 * pitch             # Radius of the cylinder bounding the lead block
    l21   = l20 +  0.1              # Radius of the air gap cylinder
    l22   = l21 + refl              # Radius of the steel reflector cylinder
    fuel_rod_weight = 19.1 * math.pi * r*r * l10 # Uranium mass in each rod [g]

    surfaces = '''
%______________pins_________________________________________________

pin 1   % fuel pin
fuel   {r}
alum {rclad}
alum

pin 9   % lead block
lead

pin 3   % salt pin 
salt   {r}
ssteel {rclad}
air

%______________surface definitions__________________________________

surf 10 cyl  0 0 {l10} -{l10} {l10}    % Inner cylinder with the lattice
surf 20 cyl  0 0 {l20} -{l20} {l20}    % Lead cylinder around the core
surf 21 cyl  0 0 {l21} -{l21} {l21}    % Air gap - likely useless
surf 22 cyl  0 0 {l22} -{l22} {l22}    % Radial reflector
surf 23 cuboid -{asemb} {asemb} -{asemb} {asemb} -{l10} {l10}            % Filling Block
'''
     
    if Nports>0:                # Beam ports
        surfaces +='''surf 31 cyly 0 0 {rport} -{l22} -{l10}      % Beam port 1\n'''

    if Nports>1:
        surfaces +='''surf 32 cylx 0 0 {rport} {l10} {l22}        % Beam port 2\n'''

    if Nports>2:
        surfaces +='''surf 33 cylx 0 0 {rport} -{l22} -{l10}      % Beam port 3\n'''
        
        
    surfaces +='''
%______________lattice definitions_____________

lat 50 1 0 0 7 7 {pitch}
2 2 2 2 2 2 2 
2 9 1 9 1 9 2
2 1 9 1 9 1 2
2 9 1 9 1 9 2
2 1 9 1 9 1 2
2 9 1 9 1 9 2
2 2 2 2 2 2 2

lat 51 1 0 0 7 7 {pitch}
2 2 2 2 2 2 2
2 1 9 1 9 1 2
2 9 1 9 1 9 2
2 1 9 2 9 1 2
2 9 1 9 1 9 2
2 1 9 1 9 1 2
2 2 2 2 2 2 2

lat 53 1 0 0 7 7 {asemb} 
2 2 2 2 2 2 2
2 2 50 51 50 2 2
2 50 51 50 51 50 2
2 51 50 51 50 51 2
2 50 51 50 51 50 2
2 2 50 51 50 2 2
2 2 2 2 2 2 2
'''
    surfaces += "\n"
#    surfaces += "% Number of fuel rods = {}\n".format(n_fuel_rods)
#    surfaces += "% Uranium weight per rod [kg] = {:8.4f}\n".format(fuel_rod_weight/ 1e3)
#    surfaces += "% Total uranium weight   [kg] = {:8.4f}\n".format( n_fuel_rods * fuel_rod_weight/ 1e3)
    
    surfaces = surfaces.format(**locals())
    return surfaces

if __name__ == '__main__':
    print("This module writes surfaces, pins, and lattice for FastDrum Serpent deck.")
    input("Press Ctrl+C to quit, or enter else to test it.")
    print(write_surfaces())
