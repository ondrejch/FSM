#{

Point Kinetics Equation (PKE) solver for education and research purposes.

Author: Vikram Singh, viikraam@gmail.com
Supervisor: Dr. Ondrej Chvala, 
Dept. of Nuclear Engineering, UTK, ochvala@utk.edu

This program takes an input file with time (in s), reactivity, and external 
neutron source as three columns and returns plots for n(t) and C_i(t) 
for i=1,2,...6

Modified for FSM by Dr. Chvala

#}
################################################################################

clear all;        # clear workspace.
pkg load odepkg;  # load odepkg.


# Delayed neutron lifetimes 'beta' for the six precursor groups depending on 
# reactor type. B = sum(bet). 
# !!! MUST BE SET SEPARATELY FOR EACH FSM MODEL !!!
global bet = [1.98893E-04, 1.16057E-03, 1.13192E-03, 3.37188E-03, 1.22789E-03, 4.05806E-04]';
global B   = sum(bet);

# Decay constants for the corresponding decay groups
# !!! MUST BE SET SEPARATELY FOR EACH FSM MODEL !!!
global lam = [1.09297E-02, 3.14777E-02, 1.10834E-01, 3.23873E-01, 1.33954E+00, 9.02904E+00]';


# Mean neutron generation time
# !!! MUST BE SET SEPARATELY FOR EACH FSM MODEL !!!
global L = 3e-7; 


# Initial values for n(t) and C_i(t)
nt    = 1.0;
Ct(1) = (bet(1)/(L*lam(1)))*nt;
Ct(2) = (bet(2)/(L*lam(2)))*nt;
Ct(3) = (bet(3)/(L*lam(3)))*nt;
Ct(4) = (bet(4)/(L*lam(4)))*nt;
Ct(5) = (bet(5)/(L*lam(5)))*nt;
Ct(6) = (bet(6)/(L*lam(6)))*nt;


# Read in input file. Formatted as time, reactivity, source.
global input_data = dlmread('./reactivity.dat');
global nrows      = rows(input_data);
global tmax       = input_data(nrows,1); # length of time for which to evaluate the equations


# Initial y and t values
y0 = [nt,Ct(1),Ct(2),Ct(3),Ct(4),Ct(5),Ct(6)]';
t0 = [0,0];

# Get reactivity value from input file for some t. 
# Not general purpose. Only compatible with this project.


function rho=react(t)%,nrows,input_data)
  rho=0;
  global nrows;
  global input_data;
  if (t>input_data(nrows,1))
    rho=input_data(nrows,2);
  else
    for i = 1:nrows-1
      if (t>=input_data(i,1) & t<=input_data(i+1,1))
        rho=input_data(i,2);
        break
        else
          continue
      endif
    endfor
  endif  
endfunction


function S=source(t)%,nrows,input_data)
  S=0;
  global nrows;
  global input_data;
  if (t>input_data(nrows,1))
    S=input_data(nrows,3);
  else
    for i = 1:nrows-1
      if (t>=input_data(i,1) & t<=input_data(i+1,1))
        S=input_data(i,3);
        break
        else
          continue
      endif
    endfor
  endif
endfunction


function ndot=neudens(t,y,react,source,bet,B,lam,L)
  ndot(1) = source(t) + (((react(t)-B)/L)*y(1)) + (lam(1)*y(2)) + ...
  (lam(2)*y(3)) + (lam(3)*y(4)) + (lam(4)*y(5)) + (lam(5)*y(6)) + (lam(6)*y(7));
  ndot(2) = ((bet(1)/L)*y(1)) - (lam(1)*y(2));
  ndot(3) = ((bet(2)/L)*y(1)) - (lam(2)*y(3));
  ndot(4) = ((bet(3)/L)*y(1)) - (lam(3)*y(4));
  ndot(5) = ((bet(4)/L)*y(1)) - (lam(4)*y(5));
  ndot(6) = ((bet(5)/L)*y(1)) - (lam(5)*y(6));
  ndot(7) = ((bet(6)/L)*y(1)) - (lam(6)*y(7));
endfunction

# ODE solution stored in a matrix of 7 x (tmax*dt)
vopt = odeset ("RelTol", 1e-3, "AbsTol", 1e-2, "InitialStep",0.1, "MaxStep",0.02,"MaxOrder",3);

sol = odebda(@(t,y) neudens(t,y,@react,@source,bet,B,lam,L),[0 tmax],y0,vopt);

# Get solution for plotting
tsol = sol.x; ysol = sol.y;

# Plot figures
figure(1)
F1 = plot(tsol,ysol(:,1));
X1 = xlabel('time [s]');
set(X1,'FontName','Times New Roman','fontsize',14);
Y1 = ylabel('Reactor Power [rel.]');
set(Y1,'FontName','Times New Roman','fontsize',14);

figure(2)
F2=plot(tsol,ysol(:,2:7))
X2 = xlabel('time [s]');
set(X2,'FontName','Times New Roman','fontsize',14);
Y2 = ylabel('C_i(t)');
set(Y2,'FontName','Times New Roman','fontsize',14);
legend('C_1','C_2','C_3','C_4','C_5','C_6');

