import Checkerboard
import matplotlib.pyplot as plt
import matplotlib.patches as patches

side           = 10
rodSpacing     = 10.0
cladSideLength = 10.0
coreHeight     = 121.92
rodRadius      = 1.27
rodHeight      = 121.92
radius_limiter = 45
core1 = Checkerboard.Checkerboard(side,rodSpacing,cladSideLength,coreHeight,rodRadius,rodHeight,radius_limiter)
core1.genCheckerboardCore()

core1.writeInputDeck("testChecker.i","James Ghawaly Checkerboard Core Test")
"""
#core1.writeInputDeck("testCore.i","James Ghawaly Hex Core Test")
p0,p1,p2 = core1.getPoints()

ax = plt.gca()

for pair in p2:
    ax.add_patch(patches.Rectangle((pair[0]-rodSpacing/2,pair[1]-rodSpacing/2),rodSpacing,rodSpacing,facecolor="blue"))


for pair in p1:
        ax.add_patch(patches.Rectangle((pair[0]-rodSpacing/2,pair[1]-rodSpacing/2),rodSpacing,rodSpacing,facecolor="yellow"))
x=1
for pair in p0:
    if(x==1): # skip the first one because it is the large cylinder surrounding the whole core
        pass
    else:
        ax.add_patch(patches.Circle(pair,radius=rodRadius,facecolor="red"))
    x=2

#circle = plt.Circle((0, 0), radius_limiter, color='b', fill=False)
#ax.add_artist(circle)
ax.set_xlim([-100,100])
ax.set_ylim([-100,100])
plt.show()"""