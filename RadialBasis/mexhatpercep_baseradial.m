clc
close all
clear
n=20;
[x y] = meshgrid(linspace(0,2*pi,n),linspace(0,2*pi,n));
z = cos(x)-3*sin(y);

figure
plot3(x,y,z,'-k')
grid on
title ('Grafica de los patrones')

new_xy=[x(:,1) y(:,1)];

for cont=2:n,
    r=[x(:,cont) y(:,cont)];
    new_xy=[new_xy; r];    
end

new_xy=new_xy';

new_z=[z(:,1)];
for cont = 2:n,
    r=[z(:,cont)];
    new_z=[new_z; r];    
end
new_z=new_z';



net=newrbe(new_xy,new_z); %pseudoinversa
w=net.IW{1}
bias = net.b

y=sim(net,new_xy);


Z_est = sim(net,new_xy);
new_x = new_xy(1,:);
new_y = new_xy(2,:);

figure

plot3(new_x,new_y,Z_est,'-b')
grid on
title ('Grafica de la funcion aproximada')

% ERROR
e_z= Z_est-new_z;
figure
plot(new_xy,e_z,'-r')
grid on
title('Error')


% PRUEBAS


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% test_xy=[x(:,1) y(:,1)];
% for cont=2:n,
%     r=[-.1+x(:,cont) -.1+y(:,cont)];
%     test_xy=[test_xy; r];    
% end
% test_xy= test_xy';
test_xy=new_xy*.87
test_x = test_xy(1,:);
test_y = test_xy(2,:);
figure
testY = sim(net,test_xy);
plot3(test_x, test_y,testY,'-g')
grid on

