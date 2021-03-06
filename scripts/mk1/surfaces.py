#!/usr/bin/env python3
#
# Generate surfaces, pins, and lattice for FastDrum Serpent deck 
# Ondrej Chvala, ochvala@utk.edu
# 2016-08-02

import math

def write_surfaces(N, r, refl):
    '''Function to write material cards for Serpent input deck.
    Inputs: 
        N:     size of the N x N checkerboard lattice
        r:     radius of the fuel in the fuel pin [cm]
        refl:  reflector thickness [cm]
    Outputs:
        surfaces: String containing the surface cards'''
    
    rclad = r + 0.1                 # Cladding outer radius              
    pitch = 2.0 * rclad + 0.01      # Lattice pitch
    l10   = N * pitch / 2.0         # Radius of the cylinder bounding the lattice
    l20   = l10 + pitch             # Radius of the cylinder bounding the lead block
    l21   = l20 +  0.1              # Radius of the air gap cylinder
    l22   = l21 + refl              # Radius of the steel reflector cylinder
    fuel_rod_weight = 19.1 * math.pi * r*r * l10 *2.0 # Uranium mass in each rod [g]

    surfaces = '''
%______________pins_________________________________________________

pin 1   % fuel pin
fuel   {r}
ssteel {rclad}
air

pin 9   % lead block
lead

%______________surface definitions__________________________________

surf 10 cyl 0 0 {l10} -{l10} {l10}    % Inner cylinder with the lattice
surf 20 cyl 0 0 {l20} -{l20} {l20}    % Lead cylinder around the core
surf 21 cyl 0 0 {l21} -{l21} {l21}    % Air gap - likely useless
surf 22 cyl 0 0 {l22} -{l22} {l22}    % Radial reflector

%______________lattice definitions_____________

lat 50 1 0 0 {N} {N} {pitch}
'''
    n_fuel_rods = 0;
    for i in range(N):          # Generates checkerboard lattice
        iodd = 0
        if i % 2 :
            iodd = 1

        for j in range(N):
            jodd = 0
            r_lat = math.sqrt((i-N/2.0 + 0.5)**2 + (j-N/2.0 + 0.5)**2) # cell radius in the lattice in units of N  
            if ((j+iodd) % 2) and (r_lat < (N-1)/2.0) :
                surfaces += "1 "
                n_fuel_rods = n_fuel_rods + 1
            else:
                surfaces += "9 "

        surfaces += "\n"

    surfaces += "\n"
    surfaces += "% Number of fuel rods = {}\n".format(n_fuel_rods)
    surfaces += "% Uranium weight per rod [kg] = {:8.4f}\n".format(fuel_rod_weight/ 1e3)
    surfaces += "% Total uranium weight   [kg] = {:8.4f}\n".format( n_fuel_rods * fuel_rod_weight/ 1e3)
    
    surfaces = surfaces.format(**locals())
    return surfaces

if __name__ == '__main__':
    print("This module writes surfaces, pins, and lattice for FastDrum Serpent deck.")
    input("Press Ctrl+C to quit, or enter else to test it.")
    print(write_surfaces(11, 1.25, 50))
