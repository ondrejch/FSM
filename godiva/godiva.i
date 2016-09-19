set title "Godiva"

%------define the sphere's surface----

surf 1 sph 0 0 0 8.7407

%------define cells--------------------

cell 1 0 uranium -1
cell 2 0 outside 1

%-------material definition--------------

%really really enriched uranium, at 300 K

mat uranium -18.74 %18.74 g/cm^3
92235.03c -.9473 
92238.03c -.0527


%-------criticality calculation settings---------

set pop 1000 110 10 %1000 neutrons, 110 cycles, 10 of them inactive

%-------Set the xs library locations-------------

%use the file made with the xsdirconvert.pl script

%set acelib "/set/this/to/the/new/serpent/formatted/xs/directory/file"

set arr 2 0

% For use on the cluster:

set acelib "/opt/serpent/xsdata/sss_endfb7u.xsdata"
set declib "/opt/serpent/xsdata/sss_endfb7.dec"
set nfylib "/opt/serpent/xsdata/sss_endfb7.nfy"
