#! /usr/bin/python3
# 
# Write the FastDrum Serpent deck
# Ondrej Chvala, ochvala@utk.edu
# 2016-08-02

import drumdeck
import os

import argparse

# Serpent deck file name
filename = "ffrr.inp"
dirname  = "./"

# Command line argument
parser = argparse.ArgumentParser(description='Writes Serepnt2 input deck of the Fast Cube Reactor.')
parser.add_argument('latsize', metavar='N', type=int, nargs='?', default=27,
                   help='lattice size, default = 27') #, required=False)
parser.add_argument('fuelradius', metavar='r', type=float, nargs='?', default=1.17,
                   help='fuel rod radius [cm], default = 1.17 cm')
parser.add_argument('reflector', metavar='refl', type=float, nargs='?', default=50,
                   help='fuel rod radius [cm], default = 50 cm')


# Parse command line arguments
args    =  vars(parser.parse_args())
N       = args['latsize']
r_fuel  = args['fuelradius']
d_refl  = args['reflector']


# Make the deck
s2_deck = drumdeck.write_deck(N, r_fuel, d_refl)
fname   = dirname + filename
print("Writing deck for lattice size ",N,", fuel radius ",r_fuel," cm, reflector thickness ",d_refl, " cm.")

# Write the deck
try:
    f = open(fname, 'w')
    f.write(s2_deck)
    f.close()
    print("Deck written,")
except IOError as e:
    print("Unable to write to file", fname)
    print(e)

