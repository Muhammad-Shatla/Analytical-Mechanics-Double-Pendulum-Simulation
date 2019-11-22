function [t,x2,y2] = double_pendulum_demo(time)

%set up parameters 
m1 = 2; m2 = 1; L1 = 1; L2 = 2; g=32.0;

%redefine relative tolerance
options = odeset('RelTol',1.0e-6);

%calling Runge-Kutta solver
[t,y] = ode45('double_pendulum',[0 time],[pi;0.0;0.5;0.5],options);
x2 = L1*sin(y(:,1))+L2*sin(y(:,3));
y2 = -L1*cos(y(:,1))-L2*cos(y(:,3));
plot(x2,y2);   %parametric trajectory of the outer bob
pause;
plot(t,y(:,1)); %theta1 Vs time
pause;
plot(t,y(:,3)); %theta2 Vs time
end
