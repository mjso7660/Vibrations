clc; close all; clear all;

%% Linear Pendulum
g = 9.81;   % kg*m/s^2
l = 0.995;  % m
t = linspace(-5,5,500); %sec
theta1 = 0.1*cos(((g/l)^.05)*t);    %rad
theta2 = 1*cos(((g/l)^.05)*t);      %rad
figure(1), plot(t,theta1), grid, hold on; %initial condition = 0.1 rad
figure(2), plot(t,theta2), grid, hold on;    %initial coniditon = 1 rad

%% Nonliner Pendulum
[t,y] = ode45(@vdp1,[-5 5],[0.1; 0]);
figure(1),plot(t,y(:,1));
%labeling
title('time vs. theta (I.C = 0.1)');
xlabel('Time [s]'); ylabel('theta (rad)')
legend('Linear','Nonlinear');

[t,y] = ode45(@vdp1,[-5 5],[1; 0]);
figure(2),plot(t,y(:,1));
%labeling
title('time vs. theta (I.C = 1)');
xlabel('Time [s]'); ylabel('theta (rad)')
legend('Linear','Nonlinear');

%% Util function for nonlinear case
function dydt = vdp1(t2,y)
%VDP1  Evaluate the van der Pol ODEs for mu = 1
%
%   See also ODE113, ODE23, ODE45.

%   Jacek Kierzenka and Lawrence F. Shampine
%   Copyright 1984-2014 The MathWorks, Inc.

dydt = [y(2);-(9.8/0.995)*sin(y(1))];
end