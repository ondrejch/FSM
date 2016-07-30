#!/usr/bin/python3
#
# Generate surfaces and lattice Serpent deck 
# Ondrej Chvala, ochvala@utk.edu

def write_surfaces(N, r, refl):
    rclad = r + 0.1
    pitch = 2.0 * rclad + 0.01
    l10   = N * pitch / 2.0
    l20   = l10 + pitch
    l21   = l20 +  0.1
    l22   = l21 + refl
    fuel_rod_weight = 19.1 * 3.1415927 * r*r * l10 # uranium mass in a rod [g]

    surfaces = '''
%______________pins_________________________________________________

pin 1   % fuel pin
fuel   {r}
ssteel {rclad}
air

pin 9   % lead block
lead

%______________surface definitions__________________________________

surf 10 cube 0 0 0 {l10}
surf 20 cube 0 0 0 {l20}
surf 21 cube 0 0 0 {l21}
surf 22 cube 0 0 0 {l22}

%______________lattice definitions_____________

lat 50 1 0 0 {N} {N} {pitch}
'''
    n_fuel_rods = 0;
    for i in range(N):          # Generates checkboard lattice
        iodd = 0
        if i % 2 :
            iodd = 1

        for j in range(N):
            jodd = 0
            if (j+iodd) % 2:
#                print("1 ", end="")
                surfaces += "1 "
                n_fuel_rods = n_fuel_rods + 1
            else:
 #               print("9 ", end="")
                surfaces += "9 "

 #       print()
        surfaces += "\n"

    surfaces += "\n"
    surfaces += "% Number of fuel rods = {}\n".format(n_fuel_rods)
    surfaces += "% Uranium weight per rod [kg] = {:8.4f}\n".format(fuel_rod_weight/ 1e3)
    surfaces += "% Total uranium weight   [kg] = {:8.4f}\n".format( n_fuel_rods * fuel_rod_weight/ 1e3)
    
    surfaces = surfaces.format(**locals())
    return surfaces

if __name__ == '__main__':
    print("This module writes surfaces, pins, and lattice .")
    input("Press Ctrl+C to quit, or enter else to test it.")
    print(write_surfaces(11, 1.25, 50))
