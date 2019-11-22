function out=dpend()
if nargin < 5
n=3;
end
%declare variables
global m1 m2 L1 L2 g;
m1 = 2;
m2 = 1;
g = 1;
L1 = 1;
L2 = sqrt(3);
dt = 0.1;
y0 = [-pi 0 -pi 2*rand(1,1)-1];
t0 = 0;
twin=30;
r1 = (L1+L2)/20*sqrt(m1/(m1+m2));
r2 = (L1+L2)/20*sqrt(m2/(m1+m2));
%size the animation window
LL = 1.2 * ( L1 + L2 );
% re-use data while disk is being plotted
bx = cos(pi*[0:0.1:2]);
by = sin(pi*[0:0.1:2]);

% initial positions (delete previous images later)
x1= L1*sin(y0(1));
y1=-L1*cos(y0(1));
x2=x1+L2*sin(y0(3));
y2=y1-L2*cos(y0(3));
b4=plot([0,x1],[0,y1],'k-','LineWidth',2);
hold on
b3=plot([x1,x2],[y1,y2],'k-','LineWidth',2);
b1=fill(x1+r1*bx,y1+r1*by,'magenta');
b2=fill(x2+r2*bx,y2+r2*by,'black');
% scale the window to fit the double pendulum
axis([-LL LL -LL LL])
for N=[1:1000]
% save the old angles and positions
posold=[x1 y1 x2 y2]';
yold=y0;
% solve the systems of odes until next frame
[t,y]=ode45('doublependulum2',[t0,t0+dt],y0,[],9.8,1,1,1,1);
% keep the new angles and delete the old ones
y0=y(size(y,1),:);
clear y
clear t
% translate angles into [-pi,pi]
y0(1)=mod(y0(1)+pi,2*pi)-pi;
y0(3)=mod(y0(3)+pi,2*pi)-pi;
t0=t0+dt;
% delete the old pictures of the pendulum
% calculate the new positions
x1 = L1*sin(y0(1));
y1 = - L1*cos(y0(1));
x2 = x1 + L2*sin(y0(3));
y2 = y1 - L2*cos(y0(3));
% plot the path of the pendulumsin last time interval (overlay)
plot([posold(1) x1],[posold(2) y1],'magenta');
plot([posold(3) x2],[posold(4) y2],'black');
% plot the images of the pendulums at new positions (overlay)
set(b4,'xdata',[0,x1],'ydata',[0,y1]);
set(b3,'xdata',[x1,x2],'ydata',[y1,y2]);
set(b1,'xdata',x1+r1*bx,'ydata',y1+r1*by);
set(b2,'xdata',x2+r2*bx,'ydata',y2+r2*by);
drawnow
pause(0.01)
end
