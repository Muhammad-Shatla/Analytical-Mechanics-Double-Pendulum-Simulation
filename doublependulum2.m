%define a function that calculates the dynamics of the double pendulum
%flag determines initial positions and velocities of the inner and outer
%bob. 
function xprime=doublependulum2(t,x,flag,g,l1,l2,m1,m2)
xprime=zeros(4,1);
xprime(1) = 6*(2*x(3)-3*cos(x(1)-x(2))*x(4))/(16-9*cos(x(1)-x(2))^2);
xprime(2) = 6*(8*x(4)-3*cos(x(1)-x(2))*x(3))/(16-9*cos(x(1)-x(2))^2);
xprime(3) = -(xprime(1)*xprime(2)*sin(x(1)-x(2))+3*g*sin(x(1)))/2;
xprime(4) = -(-xprime(1)*xprime(2)*sin(x(1)-x(2))+g*sin(x(2)))/2;
end