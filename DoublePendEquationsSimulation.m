%@author Muhammad Shatla


function xdot = DoublePendEquations(t, vec)

theta1 = vec(1); theta2 = vec(3);
dtheta1 = vec(2); dtheta2 = vec(4);
grav=vec(5); m1=vec(6); m2=vec(7); len1=vec(8); len2=vec(9);


xdot=zeros(9,1);

xdot(1)=dtheta1;

xdot(2)= -(grav.*(2*m1+m2)*sin(theta1) + m2*grav*sin(theta1-2*theta2)...
         + 2*sin(theta1-theta2)*m2*((dtheta2.^2)*len2 + (dtheta1.^2).*len1*cos(theta1-theta2)))/...
         (len1*(2*m1+m2-m2*cos(2*theta1-2*theta2)));

xdot(3)=dtheta2;

xdot(4)= (2*sin(theta1-theta2)*((dtheta1.^2)*len1*(m1+m2)+grav*(m1+m2)*cos(theta1)...
         +(dtheta2.^2)*len2*m2*cos(theta1-theta2)))/...
         (len2*(2*m1+m2-m2*cos(2*theta1-2*theta2)));
     
     
end
