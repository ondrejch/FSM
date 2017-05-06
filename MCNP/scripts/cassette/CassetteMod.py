''' @ author: James Ghawaly Jr.
    @ license: This code cannot be used, modified, or reproduced in any way without permission of its author.
    @ version: 2.9
'''
import os
import numpy


class CassetteMod():
    def __init__(self, side, cladSide, coreHeight, rodRadius, rodHeight, radiusLimiter, rods_along_cassette,
                 cassette_enclosure_thickness, reflector_thickness, x0, y0, z0, airgap):

        # generics
        self.surfaceNumber = 0
        self.cellNumber = 0
        self.materNumber = 0
        self.center = [0, 0, 0]

        # core info
        self.s = side
        self.s_c = rods_along_cassette
        self.cladSide = cladSide
        self.coreHeight = coreHeight
        self.rodRadius = rodRadius
        self.rodHeight = rodHeight
        self.radiusLimiter = radiusLimiter
        self.cet = cassette_enclosure_thickness
        self.x0 = x0
        self.y0 = y0
        self.z0 = z0
        self.cassetteLength = rods_along_cassette * cladSide + cassette_enclosure_thickness * 2 + airgap*2;
        self.reflector_thickness = reflector_thickness
        self.airgap = airgap

        # for plotting pins
        self.xPoints = []
        self.yPoints = []
        self.points = []
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
        self.cellCard = []
        self.dataCard = []
        self.cassetteSurfaceNumbers = [] # cassette lead part
        self.cassetteCladNumbers = [] # cassette clad part
        self.airGapNumbers = [] # air gap surfaces

        self.dataCard = """
c DATA CARD
c ----------------------------------------MATERIALS----------------------------------------
M1 82204   -0.014 &       $ Pb-204 LEAD
   82206   -0.241 &       $ Pb-206
   82207   -0.221 &       $ Pb-207
   82208   -0.524         $ Pb-208
c
c M1 82000 0.55 13027 0.45                         $ Pb with Al
c
M2 92235 .1975 92238 0.8025                        $ 19.75% enriched Uranium fuel
c
M3 13027 1                                         $ Aluminum
c
M4 6012 0.022831 26000 0.977170                    $ Carbon Steel
c
M5 6000   -0.000124 &         $ Air
   7014   -0.755268 &
   8016   -0.231781 &
   18040  -0.012827
c
M6 1001 -0.006488  &          $ ORNL Concrete
   8016 -0.518069  &
   11023 -0.016577 &
   13027 -0.035137 &
   14000 -0.349085 &
   19000 -0.015324 &
   20000 -0.045057 &
   26000 -0.014411
c
M7 1001 -0.006488  &          $ Tissue Equivalent: Polyethylene Terephthalate (Mylar)
   8016 -0.518069  &
   11023 -0.016577 &
   13027 -0.035137 &
   14000 -0.349085 &
   19000 -0.015324 &
   20000 -0.045057 &
   26000 -0.014411
c
M8 5011 -0.391305 &           $ B4C Control Rods
   5010 -0.391305 &
   6012 -0.21739
c
M9 1001  -0.111894 &          $ Water
   8016  -0.888106
c
KSRC 48 0 75  $ KSRC 48 0 75
KCODE 5000 1 10 500
"""

    def genCasetteCore(self):

        for cassette_along_x in range(self.s):  # Go along the x
            c_y = self.cassetteLength * cassette_along_x + self.y0

            for cassette_along_y in range(self.s):  # Go along the y
                c_x = self.cassetteLength * cassette_along_y + self.x0

                center = [c_x + self.cassetteLength / 2, c_y + self.cassetteLength / 2]
                # if the current position is outside of the radius limiting boundary, then skip
                if (numpy.sqrt(numpy.power(center[0]-2*self.airgap, 2.0) + numpy.power(center[1]-2*self.airgap,2.0)) + self.cassetteLength / 2.0 * numpy.sqrt(2.0) >= self.radiusLimiter):
                    pass
                else:
                    if ((cassette_along_y + cassette_along_x) % 2 == 0):
                        multiplier = 2
                    else:
                        multiplier = 1

                    # generate the lead inside the cassette
                    self.cube([c_x+self.cet+self.airgap, c_y+self.cet+self.airgap, self.z0], self.cladSide * self.s_c,
                              self.cladSide * self.s_c, self.coreHeight, "cassette_lead",
                              " $ Cassette: (" + str(c_x) + " , " + str(c_y) + ") ::: CASSETTE_LEAD")

                    # generate the aluminum cassette enclosure
                    self.cube([c_x+self.airgap, c_y+self.airgap, self.z0], self.cladSide * self.s_c + 2 * self.cet,
                              self.cladSide * self.s_c + 2 * self.cet, self.coreHeight, "cassette_clad",
                              " $ Cassette: (" + str(c_x) + " , " + str(c_y) + ") ::: CASSETTE_CLAD")

                    # generate the air gap outside of the cassette enclosure
                    self.cube([c_x, c_y, self.z0], self.cladSide * self.s_c + 2 * self.cet + 2 * self.airgap,
                              self.cladSide * self.s_c + 2 * self.cet + 2 * self.airgap, self.coreHeight, "air_gap",
                              " $ Cassette: (" + str(c_x) + " , " + str(c_y) + ") ::: AIRGAP")


                    # go through every lattice in the cassette along the x direction
                    for lattice_x in range(self.s_c):
                        # go through every lattice in the cassette along the y direction
                        for lattice_y in range(self.s_c):
                            # generate the x position of the lattice
                            x_position = c_x + self.cet + self.airgap + lattice_x * self.cladSide
                            # generate the y position of the lattice
                            y_position = c_y + self.cet + self.airgap + lattice_y * self.cladSide
                            # generate the z position of the lattice
                            z_position = self.z0

                            if (multiplier == 2):
                                if (lattice_x % 2 == 0):
                                    if (lattice_y % 2 == 0):
                                        # generate the fuel rod
                                        self.cylinder([x_position + self.cladSide / 2, y_position + self.cladSide / 2,
                                                       z_position + self.cet], self.rodRadius, self.rodHeight,
                                                      " $     Fuel Rod ::: (" + str(lattice_x) + "," + str(
                                                          lattice_y) + ") ::: In Cassette: (" + str(c_x) + " , " + str(
                                                          c_y) + ") ::: FUEL_ROD")

                                else:
                                    if (lattice_y % 2 != 0):
                                        # generate the fuel rod
                                        self.cylinder([x_position + self.cladSide / 2, y_position + self.cladSide / 2,
                                                       z_position + self.cet], self.rodRadius, self.rodHeight,
                                                      " $     Fuel Rod ::: (" + str(lattice_x) + "," + str(
                                                          lattice_y) + ") ::: In Cassette: (" + str(c_x) + " , " + str(
                                                          c_y) + ") ::: FUEL_ROD")

                            else:
                                if (lattice_x % 2 == 0): # change this for even/odd
                                    if (lattice_y % 2 != 0):
                                        # generate the fuel rod
                                        self.cylinder([x_position + self.cladSide / 2, y_position + self.cladSide / 2,
                                                       z_position + self.cet], self.rodRadius, self.rodHeight,
                                                      " $     Fuel Rod ::: (" + str(lattice_x) + "," + str(
                                                          lattice_y) + ") ::: In Cassette: (" + str(c_x) + " , " + str(
                                                          c_y) + ") ::: FUEL_ROD")

                                else:
                                    if (lattice_y % 2 == 0):
                                        # generate the fuel rod
                                        self.cylinder([x_position + self.cladSide / 2, y_position + self.cladSide / 2,
                                                       z_position + self.cet], self.rodRadius, self.rodHeight,
                                                      " $     Fuel Rod ::: (" + str(lattice_x) + "," + str(
                                                          lattice_y) + ") ::: In Cassette: (" + str(c_x) + " , " + str(
                                                          c_y) + ") ::: FUEL_ROD")

        # generate the core
        self.cylinder([self.x0 + self.cassetteLength * self.s / 2, self.y0 + self.cassetteLength * self.s / 2, self.z0],
                      self.radiusLimiter, self.coreHeight,
                      "        $ Core ::: This is the cylindrical enclosure around the core ::: CORE")
        # generate the reflector
        self.cylinder([self.x0 + self.cassetteLength * self.s / 2, self.y0 + self.cassetteLength * self.s / 2,
                       self.z0 - self.reflector_thickness], self.radiusLimiter + self.reflector_thickness,
                      self.coreHeight + 2 * self.reflector_thickness,
                      "        $ Reflector ::: This is the reflector around the core ::: REFLECTOR")
        # generate the universe
        self.sphere([self.x0 + self.cassetteLength * self.s / 2, self.y0 + self.cassetteLength * self.s / 2, self.z0],
                    self.radiusLimiter * 3, "        $ UNIVERSE")
        # generate the cells
        self.generateCells()

    def cylinder(self, position, radius, height, comment):
        self.surfaceNumber += 1
        # self.xPoints.append(position[0])
        # self.yPoints.append(position[1])
        self.points.append([position[0], position[1]])
        #          x  y  z     h1 h2 h3   R
        self.surfaceCard.append(str("%s RCC %g %g %g    %s %s %s   %s %s") % (
        self.surfaceNumber, position[0], position[1], position[2], 0, 0, height, radius, comment))
        # print(self.surfaceCard[-1])

    def cube(self, position, xD, yD, zD, type, comment):
        self.surfaceNumber += 1

        xMin = position[0]
        xMax = position[0] + xD

        yMin = position[1]
        yMax = position[1] + yD

        zMin = position[2]
        zMax = position[2] + zD
        if type == "clad":
            self.points1.append([position[0], position[1]])
        elif type == "lead_block":
            self.points2.append([position[0], position[1]])
        elif type == "cassette_lead":
            self.cassetteSurfaceNumbers.append(self.surfaceNumber)
        elif type == "cassette_clad":
            self.cassetteCladNumbers.append(self.surfaceNumber)
        elif type == "air_gap":
            self.airGapNumbers.append(self.surfaceNumber)

        self.surfaceCard.append(str("%s RPP %g %g    %g %g    %g %g %s") % (
        self.surfaceNumber, xMin, xMax, yMin, yMax, zMin, zMax, comment))
        # print(self.surfaceCard[-1])

    def sphere(self, position, radius, comment):
        self.surfaceCard.append(
            str("%s SPH %g %g %g    %g %s") % (999, position[0], position[1], position[2], radius, comment))
        # print(self.surfaceCard[-1])

    # for making a single cell
    def cell(self, inSurfaceNum, outSurfaceNum):
        self.cellNumber += 1

        try:
            inSurfaceNum = -1 * inSurfaceNum
        except Exception:
            pass
        self.cellCard.append(str("%s %s %s imp:n=%s") % (self.cellNumber, inSurfaceNum, outSurfaceNum, 1))

    # for making all of the cells
    def generateCells(self):
        numSurfs = len(self.surfaceCard) - 1
        # go through every surface
        for surface in self.surfaceCard:
            surface = surface.split()
            i = int(surface[0])
            # print(surface)
            # check what type of surface this is
            type = surface[-1]

            if type == "CASSETTE_LEAD":
                current_cassette = i
                try:
                    self.cellCard.append("%s %s %s %s %s %s %s" % (i, 1, "-11.34", str(-(i)), self.cellUnion(i + 3,self.cassetteSurfaceNumbers[self.cassetteSurfaceNumbers.index(i) + 1] - 1,[i], len(
                            str(i - 1) + "-999imp:n=1") + 1), "imp:n=1", "        $ Inside CASSETTE LEAD: " + str(current_cassette)))
                except IndexError:
                    self.cellCard.append("%s %s %s %s %s %s %s" % (i, 1, "-11.34", str(-(i)),self.cellUnion(i + 3, self.surfaceNumber - 2, [i],len(str(i - 1) + "-999imp:n=1") + 1),
                                                                   "imp:n=1", "        $ Inside CASSETTE LEAD: " + str(current_cassette)))
            elif type == "CASSETTE_CLAD":
                self.cellCard.append("%s %s %s %s %s %s %s" % (i, 3, "-2.70", str(-(i)), str(i-1), "imp:n=1",
                                                               "        $ Inside Cassette Cladding at " + surface[
                                                                   13] + " inside of cassette: " + str(
                                                                   current_cassette)))
            elif type == "AIRGAP":
                self.cellCard.append("%s %s %s %s %s %s %s" % (i, 5, "-0.001205", str(-(i)), str(i - 1), "imp:n=1",
                                                               "        $ Inside Cassette Air Gap at " + surface[
                                                                   13] + " inside of cassette: " + str(
                                                                   current_cassette)))
            elif type == "FUEL_ROD":
                p1 = surface[13].strip("(").strip(")").split(",")
                # this is for control rod placement
                if(p1[0]=="3" and p1[1]=="1"):
                    self.cellCard.append("%s %s %s %s %s %s %s" % (i, 8, "-2.48", str(-(i)), "", "imp:n=1",
                                                                   "        $ Inside CONTROL ROD at " + surface[
                                                                       13] + " inside of cassette: " + str(
                                                                       current_cassette)))
                elif(p1[0]=="3" and p1[1]=="2"):
                    self.cellCard.append("%s %s %s %s %s %s %s" % (i, 8, "-2.48", str(-(i)), "", "imp:n=1",
                                                                   "        $ Inside CONTROL ROD at " + surface[
                                                                       13] + " inside of cassette: " + str(
                                                                       current_cassette)))
                else:
                    self.cellCard.append("%s %s %s %s %s %s %s" % (i, 2, "-19.1", str(-(i)), "", "imp:n=1",
                                                               "        $ Inside FUEL ROD at " + surface[
                                                                   13] + " inside of cassette: " + str(
                                                                   current_cassette)))
            elif type == "CORE":
                self.cellCard.append("%s %s %s %s %s %s %s" % (i, 1, "-11.34", str(-(i)),
                                                               self.cellUnionList(self.airGapNumbers,
                                                                                  len(str(i - 1) + "-999imp:n=1") + 1),
                                                               "imp:n=1",
                                                               "        $ Inside of core, outside of cassettes "))
            elif type == "REFLECTOR":
                self.cellCard.append("%s %s %s %s %s %s %s" % (
                i, 4, "-7.82", str(-(i)), str(i - 1), "imp:n=1", "        $ Inside of reflector, outside of core "))
                reflector_surface = i
            elif type == "UNIVERSE":
                pass
            else:
                print("WARNING: UNRECOGNIZED SURFACE TYPE!!!")

        # make the universe cell (inside)
        self.cellCard.append("%s %s %s %s %s %s" % (
        998, 0, "", "-" + str(i), str(reflector_surface), "imp:n=1        $ Inside Universe, Outside of Reflector"))
        # make the universe cell (outside)
        self.cellCard.append("%s %s %s %s %s %s" % (999, 0, "", "", str(i), "imp:n=0        $ Outside of Universe"))

    # generate a union string for a cell
    def cellUnion(self, min, max, skip, size):
        i = min
        result = "("
        counter = size
        while i < max:
            counter += len(str(i)) + 1

            if i in skip:
                pass
            elif i == min:
                result += str(i) + " "
            else:
                result += str(i) + " "
            if counter > 70:
                result += "& \n"
                counter = 0
            i += 1
        if max in skip:
            result += ")"
        else:
            result += str(max) + ")"

        if i < 2:
            result = ""

        return result

    def cellUnionList(self, unions, size):
        result = "("
        counter = size
        for num in unions:
            counter += len(str(num)) + 1

            result += str(num) + " "
            if counter > 70:
                result += "& \n"
                counter = 0

        result += ")"

        return result

    def getPoints(self):
        return self.points, self.points1, self.points2

    def writeInputDeck(self, filename, title):
        with open(os.getcwd() + "/inputs/" + filename, 'w') as f2w:
            f2w.write(title + "\n")
            f2w.write("c CELL CARD\n")
            for cells in self.cellCard:
                f2w.write(cells + "\n")

            f2w.write("\nc SURFACE CARD\n")

            for surface in self.surfaceCard:
                f2w.write(surface + "\n")
            posK = str(self.coreHeight / 2)
            f2w.write(self.dataCard+"\n")

