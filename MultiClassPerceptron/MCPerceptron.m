% Susana G
% Universidad de Guadalajara 2012

clc
close all
clear
n=20;
[x y] = meshgrid(linspace(0,2*pi,n),linspace(0,2*pi,n));
z = cos(x)-3*sin(y);

figure
plot3(x,y,z,'-k')
grid on
title ('Curva original')

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


 net=newrb(new_xy,new_z); %recursiva
%net=newrbe(new_xy,new_z); %pseudoinversa


 net = newff(new_xy,new_z,25,{},'trainlm'); %train por L-M
 %net = newff(new_xy,new_z,35,{},'trainrp'); %train por retropropagacion
 net.trainParam.epochs=200; %(number of epochs)
 net.trainParam.lr=0.022;    %(learning rate)
 net.trainParam.mc=0.6;    %(momentum)
 net=train(net,new_xy,new_z);


Z_est = sim(net,new_xy);
new_x = new_xy(1,:);
new_y = new_xy(2,:);

figure

plot3(new_x,new_y,Z_est,'-b')
grid on
title ('Gráfica estimada')

% ERROR
e_z= Z_est-new_z;
figure
plot(new_xy,e_z,'-r')
grid on
title('Error')


% PRUEBAS


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

test_xy=[x(:,1) y(:,1)];
for cont=2:n,
    r=[-.1+x(:,cont) -.1+y(:,cont)];
    test_xy=[test_xy; r];    
end
test_xy= test_xy';
test_x = test_xy(1,:);
test_y = test_xy(2,:);
figure
testY = sim(net,test_xy);
plot3(test_x, test_y,testY,'-g')
grid on