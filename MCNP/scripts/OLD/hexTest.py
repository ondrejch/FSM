import HexCore
import matplotlib.pyplot as plt

side       = 10
hexSpace   = 10.16
coreRadius = 121.92
coreHeight = 121.92
rodRadius  = 1.27
rodHeight  = 121.92
radius_limiter = 85
core1 = HexCore.HexCore(side,hexSpace,coreRadius,coreHeight,rodRadius,rodHeight,radius_limiter)
core1.genHexCore()

#core1.writeInputDeck("testCore.i","James Ghawaly Hex Core Test")
x,y = core1.getPoints()

plt.plot(x,y, 'ro')
circle = plt.Circle((0, 0), radius_limiter, color='b', fill=False)
ax = plt.gca()
ax.add_artist(circle)
ax.set_xlim([-200,200])
ax.set_ylim([-200,200])
plt.show()


"""
1 0 -2 imp:n=1
998 0 -999 (2) imp:n=1
999 0 999 imp:n=0
"""
