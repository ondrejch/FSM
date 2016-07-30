#!/usr/bin/python3
#
# Generate cells
# Ondrej Chvala, ochvala@utk.edu

def write_cells():
	'''Function to write cell cards for Serpent input deck.
	Outputs:
		cells:		String containing cell cards'''
	
	cells = '''
%______________cell definitions_____________________________________

cell    1   0   fill   50 -10
cell    2   0   lead   10 -20
cell    3   0   air   20 -21
cell    4   0   ssteel   21 -22
cell   99   0   outside    22

'''
	cells = cells.format(**locals())
	return cells

if __name__ == '__main__':
	print("This module writes cells.")
	input("Press Ctrl+C to quit, or enter else to test it. ")
	print (write_cells())

