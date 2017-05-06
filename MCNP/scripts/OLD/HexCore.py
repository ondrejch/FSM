''' @ author: James Ghawaly Jr.
    @ version: 1.2
'''
import numpy
import os
class HexCore():
    def __init__(self,side,hexSpace,coreRadius,coreHeight,rodRadius,rodHeight,radiusLimiter):

        # generics
        self.surfaceNumber = 0
        self.cellNumber    = 0
        self.materNumber   = 0
        self.center        = [0,0,0]

        # core info
        self.s             = side
        self.hexSpace      = hexSpace
        self.coreRadius    = coreRadius
        self.coreHeight    = coreHeight
        self.rodRadius     = rodRadius
        self.rodHeight     = rodHeight
        self.radiusLimiter = radiusLimiter

        # for plotting
        self.xPoints = []
        self.yPoints = []

        # for writing the MCNP input deck
        self.surfaceCard = []
        self.cellCard    = []
        self.dataCard    = []

    def genHexCore(self):
        self.cylinder([0,0,0],self.radiusLimiter,self.coreHeight)
        num=0
        x0 = -1 * (self.s-1) * self.hexSpace / 2
        y0 = -1 * (numpy.sqrt(3) / 2) * (self.s-1) * self.hexSpace
        for y in range(self.s*2-1):
            # number of rods in row for below or at the midpoint of the hexagon
            num=self.s+y
            # check if we are above the midpoint of the hex and if so, calculate a different number of rods for this row
            if (y+1)>self.s:
                num = (2*self.s-2)-(y-self.s)
            for x in range(num):
                if (y+1)<=self.s:
                    x_position = self.x_pos_bot(x,x0,y)
                    y_position = self.y_pos(y, y0)
                    z_position = 0

                    if ( numpy.sqrt( numpy.power(x_position,2.0) + numpy.power(y_position,2.0)) >= self.radiusLimiter ):
                        pass
                    else:
                        self.cylinder([x_position,y_position,z_position],self.rodRadius,self.rodHeight)
                else:
                    x_position = self.x_pos_top(x, x0, y)
                    y_position = self.y_pos(y, y0)
                    z_position = 0
                    if (numpy.sqrt(numpy.power(x_position, 2.0) + numpy.power(y_position, 2.0)) >= self.radiusLimiter):
                        pass
                    else:
                        self.cylinder([x_position,y_position,z_position], self.rodRadius,self.rodHeight)

        self.cell(1,"")
        self.cell("",1)

    def cylinder(self, position, radius, height):
        self.surfaceNumber += 1
        self.xPoints.append(position[0])
        self.yPoints.append(position[1])
        #          x  y  z     h1 h2 h3   R
        self.surfaceCard.append(str("%s RCC %f %f %f    %s %s %s   %s")%(self.surfaceNumber,position[0],position[1],position[2],0,0,height,radius))
        print(self.surfaceCard[-1])

    def cell(self,inSurfaceNum,outSurfaceNum):
        self.cellNumber+=1

        try:
            inSurfaceNum=-1*inSurfaceNum
        except Exception:
            pass
        self.cellCard.append(str("%s %s %s imp:n=%s")%(self.cellNumber,inSurfaceNum,outSurfaceNum,1))

    def sphere(self, position, radius):
        pass

    def x_pos_bot(self,i_x,x0,i_y):
        return (x0-i_y*self.hexSpace/2)+(i_x*self.hexSpace)

    def x_pos_top(self, i_x, x0, i_y):
        return (x0+i_y*self.hexSpace/2)+(i_x*self.hexSpace)-(self.s-1)*self.hexSpace#(x0 - self.s*self.hexSpace/2 + (i_y-self.s)*(numpy.sqrt(3)/2)*self.hexSpace) + (i_x * self.hexSpace)

    def y_pos(self,i_y,y0):
        return y0+(numpy.sqrt(3)/2)*self.hexSpace*i_y

    def getPoints(self):
        return self.xPoints, self.yPoints

    def writeInputDeck(self,filename,title):
        with open(os.getcwd()+"/inputs"+filename,'w') as f2w:
            f2w.write(title+"\n")
            f2w.write("c CELL CARD\n")

            for cells in self.cellCard:
                f2w.write(cells+"\n")

            f2w.write("\nc SURFACE CARD\n")

            for surface in self.surfaceCard:
                print(surface)
                #f2w.write(surface.)

            f2w.write("\nc DATA CARD\nNPS 1000\n")
