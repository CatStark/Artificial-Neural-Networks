
%Susana G.
% CUCEI Universidad de Guadalajara 2012


clc
close all
clear
n=20;
[x y] = meshgrid(linspace(-3,3,n),linspace(-3,3,n));
z = (2-4*(x.^2+y.^2)).*exp(-(x.^2+y.^2));

figure
plot3(x,y,z,'-k')
grid on
title ('Mexican hat')

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



%20 neurons will be used on the hidden layer
% net=newrb(new_xy,new_z); %recursive
net=newrbe(new_xy,new_z); %pseudoinverse


% net = newff(new_xy,new_z,20,{},'trainlm');
% net = newff(new_xy,new_z,20,{},'trainrp'); %retropropragation
% net.trainParam.epochs=200; %(number of epochs)
% net.trainParam.lr=0.022;    %(learning rate)
% net.trainParam.mc=0.6;    %(momentum)
% net=train(net,new_xy,new_z);


Z_est = sim(net,new_xy);
new_x = new_xy(1,:);
new_y = new_xy(2,:);

figure

plot3(new_x,new_y,Z_est,'-b')
grid on
title ('Estimated mexican hat')

% ERROR
e_z= Z_est-new_z;
figure
plot(new_xy,e_z,'-r')
grid on
title('Error')


% Testing


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

