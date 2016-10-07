#!/usr/bin/env python3
#
# Generate cells for FastDrum Serpent deck
# Ondrej Chvala, ochvala@utk.edu
# 2016-08-02

def write_cells(Nports=3):
    '''Function to write cell cards for the Serpent input deck.
    Inputs:
       Nports: number of beam ports [0,1,2,3]

    Outputs:
        cells:      String containing cell cards'''
        
    my_portholes = ''               # Text string that will contain porthole cell numbers
    for iport in range(31,31+Nports):
        my_portholes += ' {:d}'.format(iport)
        
    cells = '''
%______________cell definitions_____________________________________

cell    1   0   fill   50 -10
cell    2   0   lead   10 -20
cell    3   0   air   20 -21
cell    4   0   ssteel   21 -22 {my_portholes}
'''

    for iport in range(31,31+Nports):
        cells += 'cell   {0:d}   0   air 21 -22 -{0:d}\n'.format(iport)

    cells += '''cell   99   0   outside    22
'''
    cells = cells.format(**locals())
    return cells

if __name__ == '__main__':
    print("This module writes cells for FastDrum Serpent deck.")
    input("Press Ctrl+C to quit, or enter else to test it. ")
    print (write_cells())

