#clear all;

% load data
source ('ffrr.inp_det0.m');
printf("data in\n");

fout = fopen("mesh.data","w");

% thermal flux 
fprintf(fout,"# Thermal flux\n");
j=1;
for i = 1:size(DETmydet,1)  
  if(DETmydet(i,2) == 1) 
    fprintf(fout, "%f %f %e %e\n",DETmydetX(DETmydet(i,10)), DETmydetY(DETmydet(i,9)), DETmydet(i,11),DETmydet(i,12));
    thermalf(j) = DETmydet(i,11);
    thermalfe(j)= DETmydet(i,12);
    j = j +1;
  endif 
endfor
%tf = transpose(reshape (thermalf, 100,100));
printf("thermalf in\n");

% epithermal flux
fprintf(fout,"\n\n# Epithermal flux\n");
j=1;
for i = 1:size(DETmydet,1)  
  if(DETmydet(i,2) == 2) 
    fprintf(fout, "%f %f %e %e\n",DETmydetX(DETmydet(i,10)), DETmydetY(DETmydet(i,9)), DETmydet(i,11),DETmydet(i,12));
    epif(j) = DETmydet(i,11);
    epife(j)= DETmydet(i,12);
    j = j +1;
  endif 
endfor
%ef = transpose(reshape (epif, 100,100));
printf("epif in\n");

% fast flux
fprintf(fout,"\n\n# Fast flux\n");
j=1;
for i = 1:size(DETmydet,1)  
  if(DETmydet(i,2) == 3) 
    fprintf(fout, "%f %f %e %e\n",DETmydetX(DETmydet(i,10)), DETmydetY(DETmydet(i,9)), DETmydet(i,11),DETmydet(i,12));
    fastf(j) = DETmydet(i,11);
    fastfe(j)= DETmydet(i,12);
    j = j +1;
  endif 
endfor
%ff = transpose(reshape (fastf, 100,100));
printf("fastf in\n");


fclose(fout);
return

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% images
%figure ("visible", "off");
figure(1);
image(DETmydetX(:,3), DETmydetY(:,3),tf,"CDataMapping","scaled") ; 
colorbar ; 
title "Thermal neutron flux";
xlabel ("x [cm]");
ylabel ("y [cm]");
print -dpng 2d_thermalflux.png

figure(2);
image(DETmydetX(:,3), DETmydetY(:,3),ff,"CDataMapping","scaled") ; 
colorbar ; 
title "Fast neutron flux";
xlabel ("x [cm]");
ylabel ("y [cm]");
print -dpng 2d_fastflux.png

