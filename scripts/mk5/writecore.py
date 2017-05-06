#!/usr/bin/env python3
# 
# Write the 7x7 Cassette filled Serpent deck
# Ondrej Chvala, ochvala@utk.edu
# Will Cureton, wcureton@vols.utk.edu
# 2016-08-02

import drumdeck
import os

import argparse

# Serpent deck file name
filename = "ffrr.inp"
dirname  = "./"

# Command line argument
parser = argparse.ArgumentParser(description='Writes Serpent2 input deck for the Fast Drum Reactor, mk2.')
parser.add_argument('--latsize', metavar='N', type=int, nargs='?', default=29,
                   help='lattice size, default = 29') #, required=False)
parser.add_argument('--fuelradius', metavar='r', type=float, nargs='?', default=1.17,
                   help='fuel rod radius [cm], default = 1.17 cm')
parser.add_argument('--reflector', metavar='refl', type=float, nargs='?', default=50,
                   help='fuel rod radius [cm], default = 50 cm')
parser.add_argument('--ports', metavar='Nports', type=int, nargs='?', default=0, 
                   help='number of beam ports [0-3], default = 0', choices=[0, 1, 2, 3])
parser.add_argument('--rport', metavar='rport', type=float, nargs='?', default=2.0,
                   help='beam port radius [cm], default = 2.0 cm')

# Parse command line arguments
args    =  vars(parser.parse_args())
N       = args['latsize']
r_fuel  = args['fuelradius']
d_refl  = args['reflector']
N_ports = args['ports']
r_port  = args['rport']

if N_ports<0 or N_ports>3:
    quit("Number of ports has to be 0, 1, 2, or 3")

# Make the deck
s2_deck = drumdeck.write_deck(N, r_fuel, d_refl, N_ports, r_port)
fname   = dirname + filename
print("Writing deck for lattice size ",N,", fuel radius ",r_fuel," cm, reflector thickness ",
    d_refl, " cm, with ", N_ports," beamports of ",r_port," cm radius." )

# Write the deck
try:
    f = open(fname, 'w')
    f.write(s2_deck)
    f.close()
    print("Deck written,")
except IOError as e:
    print("Unable to write to file", fname)
    print(e)

