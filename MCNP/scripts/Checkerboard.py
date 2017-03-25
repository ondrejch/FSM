''' @ author: James Ghawaly Jr.
    @ license: None
    @ version: 1.2
'''
import os
import numpy
class Checkerboard():
    def __init__(self,side,rodSpacing,cladSide,coreHeight,rodRadius,rodHeight,radiusLimiter):

        # generics
        self.surfaceNumber = 0
        self.cellNumber    = 0
        self.materNumber   = 0
        self.center        = [0,0,0]

        # core info
        self.s             = side
        self.rodSpacing    = rodSpacing
        self.cladSide      = cladSide
        self.coreHeight    = coreHeight
        self.rodRadius     = rodRadius
        self.rodHeight     = rodHeight
        self.radiusLimiter = radiusLimiter

        # for plotting pins
        self.xPoints = []
        self.yPoints = []
        self.points  = []
        # for plotting cladding
        self.xPoints1 = []
        self.yPoints1 = []
        self.points1 = []
        # for plotting lead
        self.xPoints2 = []
        self.yPoints2 = []
        self.points2 = []
        # for writing the MCNP input deck
        self.surfaceCard = []
        self.cellCard    = []
        self.dataCard    = []

    def genCheckerboardCore(self):
        num=0
        x0 = -1 * self.s * self.rodSpacing / 2.0
        y0 = -1 * self.s * self.rodSpacing / 2.0
        z0 = 0

        for y in range(self.s):
            y_position = self.y_pos(y,y0)
            for x in range(self.s):
                x_position = self.x_pos(x, x0)
                z_position = z0

                # if the current position is outside of the radius limiting boundary, then skip
                if (numpy.sqrt(numpy.power(x_position, 2.0) + numpy.power(y_position, 2.0)) >= self.radiusLimiter):
                    pass
                # flip the positioning of the lead and fuel blocks for every other increment of y
                elif (y % 2 == 0):
                    # flip the positioning of the lead and fuel blocks for every other increment of y
                    if(x % 2 == 0):
                        # make the cladding that the fuel rod sits in
                        self.cube([x_position, y_position, z_position], self.cladSide, self.cladSide, self.coreHeight,True,"$ cladding")
                        # make the fuel rod
                        self.cylinder([x_position, y_position, z_position],self.rodRadius,self.rodHeight,"$ fuel")
                    else:
                        # make the lead block
                        self.cube([x_position, y_position, z_position], self.rodSpacing, self.rodSpacing, self.coreHeight, False,"$ lead")
                else:
                    if (x % 2 != 0):
                        # make the cladding that the fuel rod sits in
                        self.cube([x_position, y_position, z_position], self.cladSide, self.cladSide, self.coreHeight,
                                  True,"$ cladding")
                        # make the fuel rod
                        self.cylinder([x_position, y_position, z_position], self.rodRadius, self.rodHeight,"$ fuel")
                    else:
                        # make the lead block
                        self.cube([x_position, y_position, z_position], self.rodSpacing, self.rodSpacing,
                                  self.coreHeight, False,"$ lead")
        self.sphere([0, 0, 0], 1000, "$ around core")
        self.generateCells()

    def cylinder(self, position, radius, height,comment):
        self.surfaceNumber += 1
        #self.xPoints.append(position[0])
        #self.yPoints.append(position[1])
        self.points.append([position[0], position[1]])
        #          x  y  z     h1 h2 h3   R
        self.surfaceCard.append(str("%s RCC %g %g %g    %s %s %s   %s %s")%(self.surfaceNumber,position[0],position[1],position[2],0,0,height,radius,comment))
        print(self.surfaceCard[-1])

    def cube(self, position, xD, yD, zD, clad,comment):
        self.surfaceNumber += 1

        xMin = position[0]-xD/2.0
        xMax = position[0]+xD/2.0

        yMin = position[1]-yD/2.0
        yMax = position[1]+yD/2.0

        zMin = position[2]
        zMax = position[2]+zD


        if clad:
            self.points1.append([position[0],position[1]])
        else:
            self.points2.append([position[0], position[1]])

        self.surfaceCard.append(str("%s RPP %g %g    %g %g    %g %g %s")%(self.surfaceNumber,xMin,xMax,yMin,yMax,zMin,zMax,comment))
        print(self.surfaceCard[-1])

    def sphere(self,position,radius,comment):
        self.surfaceCard.append(str("%s SPH %g %g %g    %g %s") % (999, position[0], position[1], position[2], radius, comment))
        print(self.surfaceCard[-1])

    # for making a single cell
    def cell(self,inSurfaceNum,outSurfaceNum):
        self.cellNumber+=1

        try:
            inSurfaceNum=-1*inSurfaceNum
        except Exception:
            pass
        self.cellCard.append(str("%s %s %s imp:n=%s")%(self.cellNumber,inSurfaceNum,outSurfaceNum,1))

    # for making all of the cells
    def generateCells(self):

        numSurfs = len(self.surfaceCard)-1
        # go through every surface
        for surface in self.surfaceCard:
            surface = surface.split()
            i= int(surface[0])
            # generate a cell around the whole core
            if i==999:
                # ID MAT_ID DENS INSIDE OUTSIDE ...kwargs...
                # if material is void (i.e., 0), then DENS should be ""
                self.cellCard.append("%s %s %s %s %s %s"%(i-1,0,"","-999",self.cellUnion(1,numSurfs,[i]),"imp:n=1"))
            else:
                # if the material is lead
                if surface[-1]=="lead":
                    self.cellCard.append("%s %s %s %s %s %s" % (i, 1, "-11.34", "-999 "+str(-(i)), self.cellUnion(1, numSurfs, [i]),"imp:n=1"))
                elif surface[-1]=="fuel":
                    self.cellCard.append("%s %s %s %s %s %s" % (i, 2, "-19.1", str(-(i)), "","imp:n=1")) # self.cellUnion(1, numSurfs, [i,i-1]) and "-999 "+str(-(i))
                elif surface[-1]=="cladding":
                    self.cellCard.append("%s %s %s %s %s %s" % (i, 3, "-2.70", "-999 "+str(-(i)), i+1,"imp:n=1")) #self.cellUnion(1, numSurfs, [i,i+1])

        self.cellCard.append("%s %s %s %s %s %s" % (999, 0, "", "", "999", "imp:n=0"))
    # generate a union string for a cell
    def cellUnion(self,min,max,skip):
        i=min
        result="("
        counter=0
        while i<max:
            counter+=1

            if i in skip:
                pass
            else:
                result+=str(i)+" "
            if counter>19:
                result+="& \n"
                counter=0
            i+=1
        result+=str(max)+")"

        if i<2:
            result=""

        return result

    def x_pos(self,i_x,x0):
        return x0 + i_x * self.rodSpacing

    def y_pos(self,i_y,y0):
        return y0+i_y*self.rodSpacing

    def getPoints(self):
        return self.points, self.points1, self.points2

    def writeInputDeck(self,filename,title):
        with open(os.getcwd()+"/inputs/"+filename,'w') as f2w:
            f2w.write(title+"\n")
            f2w.write("c CELL CARD\n")
            for cells in self.cellCard:
                f2w.write(cells+"\n")

            f2w.write("\nc SURFACE CARD\n")

            for surface in self.surfaceCard:
                f2w.write(surface+"\n")

            f2w.write("\nc DATA CARD\nSDEF \nM1 82000 1\nM2 92235 .1975 92238 0.8025\nM3 13027 1\nNPS 1000\n")
