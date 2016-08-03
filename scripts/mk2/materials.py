#!/usr/bin/python3
#
# Generate materials for FastDrum Serpent deck
# Ondrej Chvala, ochvala@utk.edu
# 2016-08-02

def write_materials(lib = '03c'):
	'''Function to write material cards for Serpent input deck.
	Inputs: 
		lib:	String containing the neutron cross section library
				to use (e.g., {lib}).
	Outputs:
		mats:	String containing the material cards'''

	mats = '''
%______________material definitions_________________________________

mat fuel -19.10 tmp 300.0 rgb 190 10 100      % Fuel is 20% LEU metal
92235.03c   -19.75          % U-235
92238.03c   -80.25          % U-238

mat lead -11.34 tmp 300.0 rgb 10 20 195
82204.03c   -0.014          % Pb-204
82206.03c   -0.241          % Pb-206
82207.03c   -0.221          % Pb-207
82208.03c   -0.524          % Pb-208

mat air -0.001205 tmp 300 rgb 200 200 200
 6000.03c   -0.000124
 7014.03c   -0.755268
 8016.03c   -0.231781
18040.03c   -0.012827

mat salt -4.326 tmp 300 rgb 50 240 50 % FNaK with natural uranium 
 11023.30c  -0.095468   %  Na
  9019.30c  -0.287453   %  F
 92235.30c  -0.001644   %  U
 92238.30c  -0.546311   %  U
 19039.30c  -0.064464   %  K
 19040.30c  -0.000008   %  K
 19041.30c  -0.004652   %  K

% --- "Steel, Stainless 304" [PNNL-15870, Rev. 1]
mat ssteel -7.99949E+00 tmp 300.0 rgb 120 120 120
 6012.03c  -3.95366E-04
14028.03c  -4.59332E-03
14029.03c  -2.41681E-04
14030.03c  -1.64994E-04
15031.03c  -2.30000E-04
16032.03c  -1.42073E-04
16033.03c  -1.15681E-06
16034.03c  -6.75336E-06
16036.03c  -1.68255E-08
24050.03c  -7.93000E-03
24052.03c  -1.59029E-01
24053.03c  -1.83798E-02
24054.03c  -4.66139E-03
25055.03c  -1.00000E-02
26054.03c  -3.96166E-02
26056.03c  -6.44901E-01
26057.03c  -1.51600E-02
26058.03c  -2.05287E-03
28058.03c  -6.21579E-02
28060.03c  -2.47678E-02
28061.03c  -1.09461E-03
28062.03c  -3.54721E-03
28064.03c  -9.32539E-04
'''
	mats = mats.format(**locals())
	return mats

if __name__ == '__main__':
	print("This module writes materials for FastDrum Serpent deck.")
	input("Press Ctrl+C to quit, or enter else to test it. ")
	print(write_materials())
