clear
%Code mainly adapted from Alexander Barnett
%declare time step
T = 10;
%y0 = [0;0;-2;0]; % close to regular
%y0 = [pi;pi;0;0];
% y0 = [pi;pi;.5;0]; % chaotic
% y0=[0.5233;0;0.5233;0]%periodic
%y0 = [0.2,0.2828,0,0]%perfect periodic with energy = 0.7809
%y0 = [0.2,-0.2828,0,0]%perfect quasiperiodic with energy = 0.7809
%y0 = [27.8;0;1.22;2.62] %perfect KAM scenario
%y0 = [0,0,2,20]
y0 = [0,0,1,20];
%y0 =[pi;0;.5;.5];%high energy
s=ode45(@doublependulum2,[0,T],y0,[],0,1,1,1,1);
t = 0:0.01:T; x = deval(s,t)';
x1=sin(x(:,1));
y1=-cos(x(:,1));
x2=x1+sin(x(:,2));
y2=y1-cos(x(:,2));
figure; plot(x2,y2); axis equal; xlabel('position');ylabel('velocity');title('trajectory');
pause;
plot(t,x(:,3),'magenta',t,x(:,4),'black');title('Angular velocities');