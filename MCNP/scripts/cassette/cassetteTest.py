import CassetteMod
import matplotlib.pyplot as plt
import matplotlib.patches as patches

side           = 5
rods_along_cassette = 7

airgap = 0.05
fuelCladding   = 0.1
rodRadius      = 1.25
rclad = rodRadius + 0.1
cladSideLength = rodRadius*2 + 2*fuelCladding
pitch = 2*rclad+0.01
assemb = 9*pitch+airgap
cassette_enclosure_thickness = assemb - 8*pitch - airgap*2
reflector_thickness = 30.48
radius_limiter = 71 + pitch*0.5
coreHeight=2*radius_limiter
rodHeight      =coreHeight-2*cassette_enclosure_thickness

cassette_length = rods_along_cassette*cladSideLength+cassette_enclosure_thickness*2
position = [-1*side*cassette_length/2,-1*side*cassette_length/2,0]

core1 = CassetteMod.CassetteMod(side,cladSideLength,coreHeight,rodRadius,rodHeight,radius_limiter, rods_along_cassette,cassette_enclosure_thickness, reflector_thickness, position[0], position[1], position[2],airgap)
core1.genCasetteCore()

core1.writeInputDeck("testCassette7ROD.i","James Ghawaly Checkerboard Core Test")

p0,p1,p2 = core1.getPoints()

ax = plt.gca()
circle1 = plt.Circle(xy=p0[-1],radius=radius_limiter,color="green",fill=False)
ax.add_artist(circle1)


x=1
for pair in p0: # pins
    ax.add_patch(patches.Circle(pair,radius=rodRadius,facecolor="red"))
    x=2

#circle = plt.Circle((0, 0), radius_limiter, color='b', fill=False)
#ax.add_artist(circle)
ax.set_xlim([-100,100])
ax.set_ylim([-100,100])
plt.show()